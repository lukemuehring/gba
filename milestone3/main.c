/*
Finished:
    Milestones 1 & 2
        Made very very basic screens
        Created game state machine
        Made spritesheet
        Created a player
        Player can be controlled by the up and down keys
        Created obstacles
        Created bullets that destroy obstacles

    Milestone 3:
        Obstacles are spawned at random times and the type of the obstacle is also random

        Created police

        Game ends when player touches the police (when hit twice by something)

        Player is given one chance to be hit but there is no animation to make it pretty
            there is also no recovery period where the player moves back to the original position

        Ghost Mode enabled, press button B to become invincible

To Do:

    Give the player one chance after being hit
        Player hit animation (blinking sprite) and moves one spot to left, if hit again gets caught by police and loses

        if not hit for like 3 seconds, slowly moves forward in smooth animation

    Enable the Ghost Mode cheat (player is not affected by obsacles)

    change player movement mechanics
        have the button presses more permanent:
            when down is pressed, the car stays in the DOWN position until up is pressed and returns to the NORMAL pos
            when up is pressed (in the NORMAL pos), the car does a little jump as explained below
            
        implement gravity for the player (when pressing up, the car performs a "jump" so that it can't stay in the higher pos forever)
            make sure the player can not double jump

    Use timers to determine when obstacles spawn so you have more control
    
    design indestructible obstacles (obstacles that must be avoided, can't be shot)
    implement indestructible obstacles 

    Make sure that there is always a way to survive the obstacles and no impossible situation occurs

    add score counter on the screen

    add sound to the game
        add background music
        have sound effects play when:
            player is hit
            player 

    Create the road by using a background
    Create the other 3 simultaneuous backgrounds and have them move in parallax

    Design a player sprite
    Animate the Player "car"
    Design a police sprite
    Animate the police to have flashing lights
        Animate the police so that they move back an forth slightly on the road as if they were trying to speed up to catch you
    Animate the bird sprite to fly

    add game sweetners like designing the non game screens and animated sprites
        START screen
            display high score
        INSTRUCTIONS screen
        PAUSE screen
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
#include "pause.h"
#include "lose.h"
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
    goToMenu();
}

// Sets up the first screen, the menu
void goToMenu() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    
    //loading welcome screen 
    //loading palette
    DMANow(3, welcomePal, PALETTE, welcomePalLen / 2);

    //loading tile data
    DMANow(3, welcomeTiles, &CHARBLOCK[0], welcomeTilesLen / 2);

    //loading TileMap
    DMANow(3, welcomeMap, &SCREENBLOCK[31], welcomeMapLen / 2);

    //Setting BG0 registers for welcome screen
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    state = MENU;

    hideSprites();  
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void menu() {
    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the start state
void goToStart() {
    waitForVBlank();
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    //loading instructions screen 
	//loading palette
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);

    //loading tile data
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);

    //loading TileMap
    DMANow(3, instructionsMap, &SCREENBLOCK[31], instructionsMapLen / 2);

    //Setting BG0 registers for welcome screen
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    state = START;

    // Begin the seed randomization
    seed = 0;

}

// Runs every frame of the start state
void start() {
    //Update the seed
    seed++;

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed); //seed the random generator
    	initGame();
        goToGame();
    }
}

// Sets up the game state
void goToGame() {
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	//loading game screen 
	//loading palette
	waitForVBlank();
    DMANow(3, gameBG1Pal, PALETTE, gameBG1PalLen / 2);

    //loading tile data 
    DMANow(3, gameBG1Tiles, &CHARBLOCK[0], gameBG1TilesLen / 2);

    //loading TileMap
    DMANow(3, gameBG1Map, &SCREENBLOCK[28], gameBG1MapLen / 2);

    //Setting BG0 registers for screen
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_8BPP;
    
    //initialize sprites
	DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToPause();
    //LOSING CONDITION
    if (hasLost)
        goToLose();
}

// Sets up the pause state
void goToPause() {


    waitForVBlank();
    //loading pause screen 
    REG_DISPCTL = MODE0 | BG0_ENABLE;

	//loading palette
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);

    //loading tile data
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);

    //loading TileMap
    DMANow(3, pauseMap, &SCREENBLOCK[30], pauseMapLen / 2);

    //Setting BG0 registers for screen
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_8BPP;
    
    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    
    waitForVBlank();
    //drawSomething

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToMenu();
}

// Sets up the lose state
void goToLose() {
    waitForVBlank();
    //loading lose screen 
    REG_DISPCTL = MODE0 | BG0_ENABLE;
 
    //??? hideSprites?
    //DMANow(3, shadowOAM, OAM, 128 * 4);

	//loading palette
    DMANow(3, losePal, PALETTE, losePalLen / 2);

    //loading tile data
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);

    //loading TileMap
    DMANow(3, loseMap, &SCREENBLOCK[30], loseMapLen / 2);

    //Setting BG0 registers for screen
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_8BPP;   

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
     
    waitForVBlank();
    //draw something

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) 
        goToMenu();
}