/*
How To Play
    Avoid the obstacles for as long as you can using the UP and DOWN buttons.

    Hit START to go past the not-yet-implemented menu and instructions screen to enter the game.

    B fires bullets that can destroy obstacles coming at you
    A enables the cheat that makes you invincible

    Get hit once by an obstacle, and your car slows down and the police catch up a little bit.
    Get hit again, and the police catch you and you lose.

BUGS / QUESTIONS:
    -Yo why is the magenta background not transparent? I made the magenta the 0th index of the palette, so it should be see-through
    FIXED

     -player can avoid losing by staying in the up position FIXED

    -pink tile bug FIXED

    -@bg offset off by 1? FIXED

     -PLAYER sprite pallette is glitched FIXED

    -how do I make smooth animations/position updates? Like when the player gets hit, instead of doing a choppy jump, how do I force it
        to move backwards in a smooth fashion over time, and then stop (like move to the left 4cm smoothly and stop on the screen) FIXED
    
    -Sound sounds really airy and has lots of background noise / static???
   


Finished:
    Milestones 1 & 2
        Made very very basic screens
        Created game state machine
        Made spritesheet
        Created a player
        Player can be controlled by the up and down keys
        Created obstacles
        Created bullets that destroy obstacles

    Milestones 3 & 4:
        Obstacles are spawned at random times and the type of the obstacle is also random
            randomness is seeded depending on how long you take on the instructions screen using srand()

        Created police

        Game ends when player touches the police (when hit twice by something)

        Player is given one chance to be hit but there is no animation to make it pretty
            there is also no recovery period where the player moves back to the original position

        Ghost Mode enabled, press button B to become invincible

        Created the road by using a background

        Got backround priority working

        Got sprite priority working 

        Designed a player sprite

        Designed uzi sprite

        Designed police car sprite

        added sound to the game

            designed background music 

            added background music
            have sound effects play when:
                player is hit
        
        Introduced gravity and fixed point encoding for player.rdel

        Player hit animation (blinking sprite) and moves one spot to left, recovers after a certain time period

        Mosaic effect on player

        START screen
        INSTRUCTIONS screen
        PAUSE screen

        Animations on player, police, and obstacles 

        Added reload functionality

        Added sprites to the instructions screen

        Added score counter


To Do:

    
    design indestructible obstacles (obstacles that must be avoided, can't be shot)
    implement indestructible obstacles 

    Make sure that there is always a way to survive the obstacles and no impossible situation occurs


    Create clouds and buildings and have them move in parallax

    add game sweetners like designing the non game screens and animated sprites
        Start screen
            display high score
        LOSE screen
            display score 
            find a way to save the high score 

        Have the game speed up (makes it more difficult) over time, ex after 1000 pts are hit
        When the player loses have everything freeze for a second and do an exploding animaton on the car so the user
        can see just how exactly they messed up and what object they hit, then move to the lose screen
            (instead of moving straight to the lose screen)
            can play mario-like death noise during this time to taunt the user
    
*/
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "welcome.h"
#include "instructions.h"
#include "game.h"
#include "gameBG1.h"
#include "gameBG3.h"
#include "pause.h"
#include "lose.h"
#include "sound.h"
#include "GameSong.h"  
#include "MenuSong.h"
#include "InstructionsSong.h" 
#include "LoseSong.h"
#include "StartSFX.h"

#include "spritesheet.h"

OBJ_ATTR shadowOAM[128];

// Prototypes
void initialize();

// State Prototypes
void goToMenu();
void menu();
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();

// States
enum {MENU, START, GAME, PAUSE, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Text Buffer
//char buffer[47];

// Random Seed
int seed;

int mainTime;
int highScore;

//Sound
SOUND soundA;
SOUND soundB;   

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
            case MENU:
                menu();
                break;
            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    // Set up the first state
    setupSounds();
    setupSoundInterrupts();
    goToMenu();
}

// Sets up the first screen, the menu
void goToMenu() {
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;

    hideSprites();  

    //loading welcome screen 
    //loading palette
    DMANow(3, welcomePal, PALETTE, welcomePalLen / 2);

    //loading tile data
    DMANow(3, welcomeTiles, &CHARBLOCK[0], welcomeTilesLen / 2);

    //loading TileMap
    DMANow(3, welcomeMap, &SCREENBLOCK[25], welcomeMapLen / 2);

    //Setting BG0 registers for welcome screen
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25) | BG_8BPP;
    state = MENU;

     //initialize sprites
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    //GAME START text
    shadowOAM[24].attr0 = ATTR0_REGULAR | ATTR0_WIDE | (ROWMASK & (SCREENHEIGHT / 2  + 16));
    shadowOAM[24].attr1 = ATTR1_LARGE |  (COLMASK & (SCREENWIDTH / 2 - 32));
    shadowOAM[24].attr2 = (ATTR2_TILEID(8,16)) | ATTR2_PALROW(0);
    
    mainTime = 0;
    highScore = 0;

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    playSoundB(MenuSong,MENUSONGLEN,MENUSONGFREQ, 1);
}

void menu() {
    mainTime++;

    if ((mainTime % 27) == 0) {
        shadowOAM[24].attr0 ^= ATTR0_HIDE;
    }

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
        playSoundA(StartSFX,STARTSFXLEN,STARTSFXFREQ, 0);
        playSoundB(InstructionsSong,INSTRUCTIONSSONGLEN,INSTRUCTIONSSONGFREQ, 1);
        shadowOAM[24].attr0 = ATTR0_HIDE;
    }

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Sets up the start state
void goToStart() {
    waitForVBlank();
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;

    //loading instructions screen 
	//loading palette
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);

    //loading tile data
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);

    //loading TileMap
    DMANow(3, instructionsMap, &SCREENBLOCK[20], instructionsMapLen / 2);

    //Setting BG0 registers for instructions screen
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(20) | BG_8BPP | 0;


    initInstructions();

    state = START;

    // Begin the seed randomization
    seed = 0;

}

// Runs every frame of the start state
void start() {
    //Update the seed
    seed++;

    updateInstructions();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed); //seed the random generator
    	initGame();
        playSoundB(GameSong,GAMESONGLEN,GAMESONGFREQ, 1);
        goToGame();
    }
}
//@gamesong, menusong, instructionssong, startSFX, pauseSong

// Sets up the game state
void goToGame() {

    waitForVBlank();

	REG_DISPCTL = MODE0 | BG0_ENABLE | BG3_ENABLE | SPRITE_ENABLE;

	//loading game screen and backgrounds

    //loading tile data for BG0
    DMANow(3, gameBG1Tiles, &CHARBLOCK[0], gameBG1TilesLen / 2);

    //loading TileMap for BG0
    DMANow(3, gameBG1Map, &SCREENBLOCK[5], gameBG1MapLen / 2);

    //Setting BG0 registers for screen, highest priority 3 so it gets drawn in the front 
    REG_BG0CNT = BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(5) | BG_8BPP | 0;


    /*MULTIPLE BACKGROUNDS?
    charblock 0 - 9216 bytes of data
    screenblock 28 - 4096 bytes of data

    charblock 1 - 58,944 bytes of data
    screenblock 30 - 4096 bytes of data


    0-4 screenblocks filled
    5,6 screenblocks filed

    8-20 screenblocks
    */


    DMANow(3, gameBG3Pal, PALETTE, gameBG3PalLen / 2);

     //loading tile data for BG3
    DMANow(3, gameBG3Tiles, &CHARBLOCK[3], gameBG3TilesLen / 2);

    //loading TileMap for BG3
    DMANow(3, gameBG3Map, &SCREENBLOCK[8], gameBG3MapLen / 2);

    //Setting BG3 registers for screen, lowest priority so its in the background
    REG_BG3CNT = BG_SIZE_WIDE | BG_CHARBLOCK(3) | BG_SCREENBLOCK(8) | BG_8BPP | 3;

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound(); 
        goToPause();
    } 
    //LOSING CONDITION
    if (hasLost) {
        if (highScore < cycleTime) {
            highScore = cycleTime;
        }
        goToLose();
    }      
}

// Sets up the pause state
void goToPause() {


    waitForVBlank();
    //loading pause screen 
    REG_DISPCTL = MODE0 | BG1_ENABLE;

	//loading palette
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);

    //loading tile data
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);

    //loading TileMap
    DMANow(3, pauseMap, &SCREENBLOCK[25], pauseMapLen / 2);

    //Setting BG0 registers for screen
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(25) | BG_8BPP;
    
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    waitForVBlank();
    //drawSomething

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
       unpauseSound();
        goToGame(); 
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        //stops the sound and restarts the menu song 
        stopSound();
        playSoundB(MenuSong,MENUSONGLEN,MENUSONGFREQ, 1);
        goToMenu();
    }     
}

// Sets up the lose state
void goToLose() {

    waitForVBlank();
    //loading lose screen 
    REG_DISPCTL = MODE0 | BG1_ENABLE | 1;

	//loading palette
    DMANow(3, losePal, PALETTE, losePalLen / 2);

    //loading tile data
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);

    //loading TileMap
    DMANow(3, loseMap, &SCREENBLOCK[30], loseMapLen / 2);

    //Setting BG0 registers for screen
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_8BPP;   

    state = LOSE;

    // score text
    // shadowOAM[100].attr0 = ATTR0_WIDE | (ROWMASK & (SCREENHEIGHT/2)) | ATTR0_MOSAIC;
    // shadowOAM[100].attr1 = ATTR1_SMALL |  (COLMASK & (SCREENWIDTH/2));
    // shadowOAM[100].attr2 = (ATTR2_TILEID(12,17)) | ATTR2_PRIORITY(0);

    //thousands digit 
    //hundreds digit
    
    //ones digit
    // int currentTime = cycleTime;
    // int currentDigit = cycleTime % 10;
    // shadowOAM[101].attr0 = ATTR0_SQUARE | (ROWMASK & ((SCREENHEIGHT/2) - 16)) | ATTR0_MOSAIC;
    // shadowOAM[101].attr1 = ATTR1_TINY |  (COLMASK & ((SCREENWIDTH/2) + 32));
    // shadowOAM[101].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

    // //tens digit
    // currentTime = currentTime / 10;
    // currentDigit = currentTime % 10;
    // shadowOAM[102].attr0 = ATTR0_SQUARE | (ROWMASK & ((SCREENHEIGHT/2) - 16)) | ATTR0_MOSAIC;
    // shadowOAM[102].attr1 = ATTR1_TINY |  (COLMASK & ((SCREENWIDTH/2) + 24));
    // shadowOAM[102].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

    // //Hundreds digit
    // currentTime = currentTime / 10;
    // currentDigit = currentTime % 10;
    // shadowOAM[103].attr0 = ATTR0_SQUARE | (ROWMASK & ((SCREENHEIGHT/2) - 16)) | ATTR0_MOSAIC;
    // shadowOAM[103].attr1 = ATTR1_TINY |  (COLMASK & ((SCREENWIDTH/2) + 16));
    // shadowOAM[103].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

    // //Thousands digit
    // currentTime = currentTime / 10;
    // currentDigit = currentTime % 10;
    // shadowOAM[104].attr0 = ATTR0_SQUARE | (ROWMASK & ((SCREENHEIGHT/2) - 16)) | ATTR0_MOSAIC;
    // shadowOAM[104].attr1 = ATTR1_TINY |  (COLMASK & ((SCREENWIDTH/2) + 8));
    // shadowOAM[104].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

    // //Ten thousands digit
    // currentTime = currentTime / 10;
    // currentDigit = currentTime % 10;
    // shadowOAM[105].attr0 = ATTR0_SQUARE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
    // shadowOAM[105].attr1 = ATTR1_TINY |  (COLMASK & ((SCREENWIDTH/2)));
    // shadowOAM[105].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

    // waitForVBlank();
    // DMANow(3, shadowOAM, OAM, 128 * 4);

    stopSound();
    playSoundB(LoseSong,LOSESONGLEN,LOSESONGFREQ, 1);

}

// Runs every frame of the lose state
void lose() {
     
    
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToMenu();
}