# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
    int spriteID;
    int spriteType;
    int hp;
    int destructible;
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
# 79 "game.h"
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
# 3 "game.c" 2


PLAYER player;
OBSTACLE obs[1];
BULLET bullets[3];
int hasLost;
int score;


void initGame() {
 initPlayer();
    initObstacles();
    initBullets();
    score = 0;
    hasLost = 0;
 }


void updateGame() {
 updatePlayer();


 for (int i = 0; i < 1; i++)
  updateObstacles(&obs[i]);


 for (int i = 0; i < 3; i++)
  updateBullets(&bullets[i]);

 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}


void initPlayer() {

 player.screenRow = 160 - 64;
 player.screenCol = 240 / 2 - 30;
 player.cdel = 1;
 player.height = 8;
 player.width = 16;

}


void initObstacles() {
 for (int i = 0; i < 1; i++) {
  obs[i].spriteID = i + 1;
  obs[i].spriteType = i % 3;
  obs[i].hp = 3;
  obs[i].destructible = 1;
  obs[i].active = 1;






  obs[i].row = player.screenRow;
  obs[i].col = 240 - obs[i].width - 1;
  obs[i].width = 8;
  obs[i].height = 8;
  obs[i].cdel = -1;
 }
}


void initBullets() {
 for (int i = 0; i < 3; i++) {
  bullets[i].row = player.screenRow;
  bullets[i].col = player.screenCol + player.width;
  bullets[i].cdel = 8;
  bullets[i].height = 8;
  bullets[i].width = 8;
  bullets[i].active = 0;
  bullets[i].spriteID = i + 1;
 }
}


void updatePlayer() {

  if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
   player.screenRow = (160 - 64) - 16;
  } else if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
   player.screenRow = (160 - 64) + 16;
  } else {
   player.screenRow = (160 - 64);
  }
  if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
   fireBullet();
  }


  shadowOAM[0].attr0 = (1<<14) | player.screenRow;
  shadowOAM[0].attr1 = (2<<14) | player.screenCol;
  shadowOAM[0].attr2 = (((0)*32+(0))) | ((0)<<12);
}




void updateObstacles(OBSTACLE* e) {
 if (e->col <= 0 ) {
  e->active = 0;
 }
 if (e->active) {

  for (int i = 0; i < 3; i++) {
   if (bullets[i].active) {
    if (collision(bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width,e->row, e->col, e->height, e->width)) {
     bullets[i].active = 0;
     e->hp--;
     if (e->hp <= 0) {
      e->active = 0;
     }
    }
   }
  }


  if (collision(player.screenRow, player.screenCol, player.height, player.width, e->row, e->col, e->height, e->width)) {
   hasLost = 1;
  }


  e-> col += e-> cdel;



  shadowOAM[e->spriteID].attr0 = (1<<14) | e->row;
  shadowOAM[e->spriteID].attr1 = (1<<14) | e->col;
  shadowOAM[e->spriteID].attr2 = (((0)*32+(9))) | ((0)<<12);




 } else {
  shadowOAM[e->spriteID].attr0 = (2<<8);
 }
}

void updateBullets(BULLET* b) {
 if (b->active) {
  b->col += b->cdel;
  if (!(b->col > 240 )) {


   shadowOAM[50 + b->spriteID].attr0 = (0<<14) | b->row;
   shadowOAM[50 + b->spriteID].attr1 = (0<<14) | b->col;
   shadowOAM[50 + b->spriteID].attr2 = (((0)*32+(6))) | ((0)<<12);
  } else {
   b->active = 0;
  }
 } else {

  shadowOAM[50 + b->spriteID].attr0 = (2<<8);
 }
}

void fireBullet() {
 for (int i = 0; i < 3; i++) {
  if (bullets[i].active == 0) {
   bullets[i].row = player.screenRow;
   bullets[i].col = player.screenCol;
   bullets[i].active = 1;
   break;
  }
 }
}
