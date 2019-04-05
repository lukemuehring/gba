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


	//initialize sprites
	// DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
	// DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    //Hide All Sprites
    hideSprites();	
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Set up the first state
    goToMenu();
}

// Sets up the first screen, the menu
void goToMenu() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    waitForVBlank();
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

}

// Runs every frame of the start state
void start() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
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
    DMANow(3, gameBG1Map, &SCREENBLOCK[30], gameBG1MapLen / 2);

    //Setting BG0 registers for screen
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_8BPP;

  
    
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