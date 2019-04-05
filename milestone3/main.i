# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int row, int col, int height, int width, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "main.c" 2
# 1 "welcome.h" 1
# 22 "welcome.h"
extern const unsigned short welcomeTiles[1696];


extern const unsigned short welcomeMap[4096];


extern const unsigned short welcomePal[256];
# 3 "main.c" 2
# 1 "instructions.h" 1
# 22 "instructions.h"
extern const unsigned short instructionsTiles[1312];


extern const unsigned short instructionsMap[4096];


extern const unsigned short instructionsPal[256];
# 4 "main.c" 2
# 1 "game.h" 1

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} PLAYER;


typedef struct {
 int row;
 int col;
 int height;
 int width;
 int active;
    int cdel;
    int spriteID;
} BULLET;


typedef struct {
 int row;
 int col;
 int cdel;
 int height;
 int width;
 int active;
 int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int spriteID;
    int spriteType;
} OBSTACLE;


typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} POLICE;
# 76 "game.h"
extern PLAYER player;
extern OBSTACLE obs[1];
extern int hasLost;
extern int score;


void initGame();
void updateGame();
void initPlayer();
void updatePlayer();
void initObstacles();
void updateObstacles(OBSTACLE *);
void initBullets();
void updateBullets(BULLET *);
void fireBullet();
# 5 "main.c" 2
# 1 "gameBG1.h" 1
# 22 "gameBG1.h"
extern const unsigned short gameBG1Tiles[45024];


extern const unsigned short gameBG1Map[4096];


extern const unsigned short gameBG1Pal[256];
# 6 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[832];


extern const unsigned short pauseMap[4096];


extern const unsigned short pausePal[256];
# 7 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[704];


extern const unsigned short loseMap[4096];


extern const unsigned short losePal[256];
# 8 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 9 "main.c" 2

OBJ_ATTR shadowOAM[128];


void initialize();


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


enum {MENU, START, GAME, PAUSE, LOSE};
int state;


unsigned short buttons;
unsigned short oldButtons;




int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {







    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);


    goToMenu();
}


void goToMenu() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8);
    waitForVBlank();
    (*(unsigned short *)0x4000000) = 0 | (1<<8);



    DMANow(3, welcomePal, ((unsigned short *)0x5000000), 512 / 2);


    DMANow(3, welcomeTiles, &((charblock *)0x6000000)[0], 3392 / 2);


    DMANow(3, welcomeMap, &((screenblock *)0x6000000)[31], 8192 / 2);


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8) | (1<<7);
    state = MENU;
}

void menu() {

    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}


void goToStart() {
    waitForVBlank();
    (*(unsigned short *)0x4000000) = 0 | (1<<8);



    DMANow(3, instructionsPal, ((unsigned short *)0x5000000), 512 / 2);


    DMANow(3, instructionsTiles, &((charblock *)0x6000000)[0], 2624 / 2);


    DMANow(3, instructionsMap, &((screenblock *)0x6000000)[31], 8192 / 2);


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((31)<<8) | (1<<7);
    state = START;

}


void start() {


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
     initGame();
        goToGame();
    }
}


void goToGame() {
 (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);



 waitForVBlank();
    DMANow(3, gameBG1Pal, ((unsigned short *)0x5000000), 512 / 2);


    DMANow(3, gameBG1Tiles, &((charblock *)0x6000000)[0], 90048 / 2);


    DMANow(3, gameBG1Map, &((screenblock *)0x6000000)[30], 8192 / 2);


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((30)<<8) | (1<<7);




 DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
 DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    state = GAME;
}


void game() {

    updateGame();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToPause();

    if (hasLost)
        goToLose();
}


void goToPause() {


    waitForVBlank();

    (*(unsigned short *)0x4000000) = 0 | (1<<8);


    DMANow(3, pausePal, ((unsigned short *)0x5000000), 512 / 2);


    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 1664 / 2);


    DMANow(3, pauseMap, &((screenblock *)0x6000000)[30], 8192 / 2);


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((30)<<8) | (1<<7);

    state = PAUSE;
}


void pause() {

    waitForVBlank();



    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToGame();
    else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
        goToMenu();
}


void goToLose() {
    waitForVBlank();

    (*(unsigned short *)0x4000000) = 0 | (1<<8);





    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);


    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 1408 / 2);


    DMANow(3, loseMap, &((screenblock *)0x6000000)[30], 8192 / 2);


    (*(volatile unsigned short*)0x4000008) = (0<<14) | ((0)<<2) | ((30)<<8) | (1<<7);

    state = LOSE;
}


void lose() {

    waitForVBlank();



    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToMenu();
}
