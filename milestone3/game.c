#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
OBSTACLE obs[OBSTACLECOUNT];
BULLET bullets[BULLETCOUNT];
int hasLost;
int score;

// Initialize the game
void initGame() {
	initPlayer();
    initObstacles();
    initBullets();
    score = 0;
    hasLost = 0;
 }

// Updates the game each frame
void updateGame() {
	updatePlayer();

	// Update all the obstacles
	for (int i = 0; i < OBSTACLECOUNT; i++)
		updateObstacles(&obs[i]);

	//Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullets(&bullets[i]);

	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Initialize the player
void initPlayer() {

	player.screenRow = SCREENHEIGHT - 64;
	player.screenCol = SCREENWIDTH / 2 - 30;
	player.cdel = 1;
	player.height = 8;
	player.width = 16;

}

// Initialize the obstacles
void initObstacles() {
	for (int i = 0; i < OBSTACLECOUNT; i++) {
		obs[i].spriteID = i + 1;
		obs[i].spriteType = i % NUMSPRITETYPES;
		obs[i].hp = 3;
		obs[i].destructible = 1;
		obs[i].active = 1;

		//Animation
		// obs[i].aniCounter = 0;
		// obs[i].curFrame = 0;

		//Dependent on Obstacle Type
		obs[i].row = player.screenRow;
		obs[i].col = SCREENWIDTH - obs[i].width - 1;
		obs[i].width = 8;
		obs[i].height = 8;
		obs[i].cdel = -1;
	}
}

// Initialize the bullets
void initBullets() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].row = player.screenRow;
		bullets[i].col = player.screenCol + player.width;
		bullets[i].cdel = 8;
		bullets[i].height = 8;
		bullets[i].width = 8;
		bullets[i].active = 0;
		bullets[i].spriteID = i + 1;
	}
}

// Handle every-frame actions of the player
void updatePlayer() {
        // Control movement and change animation state
		if(BUTTON_HELD(BUTTON_UP)) {
			player.screenRow = ROADROW - 16;
		} else if(BUTTON_HELD(BUTTON_DOWN)) {
			player.screenRow = ROADROW + 16;
		} else {
			player.screenRow = ROADROW;
		}
		if(BUTTON_PRESSED(BUTTON_A)) {
			fireBullet();
		}

		//player is at sprite index 0
		shadowOAM[0].attr0 = ATTR0_WIDE | player.screenRow;
		shadowOAM[0].attr1 = ATTR1_MEDIUM | player.screenCol;
		shadowOAM[0].attr2 = (ATTR2_TILEID(0,0)) | ATTR2_PALROW(0); 
}



// Handle every-frame actions of an obstacle
void updateObstacles(OBSTACLE* e) {
	if (e->col <= 0 /*if the obstacle goes off the left side of the screen */) {
		e->active = 0;
	}
	if (e->active) {
		//Check if this obstacle is hitting any bullets.
		for (int i = 0; i < BULLETCOUNT; i++) {
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

		//Check if this obstacle is hitting the player
		if (collision(player.screenRow, player.screenCol, player.height, player.width, e->row, e->col, e->height, e->width)) {
			hasLost = 1;
		}

		//moving the obstacle to the left
		e-> col += e-> cdel;

		//obstacles at sprite index 1 to NUMOBSTACLES
		//current obtacle is at tile (0,2) on spritesheet
		shadowOAM[e->spriteID].attr0 = ATTR0_WIDE | e->row;
		shadowOAM[e->spriteID].attr1 = ATTR1_SMALL | e->col;
		shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(0,9)) | ATTR2_PALROW(0);

		// e->aniCounter++;


	} else { //Obstacle is not active anymore
		shadowOAM[e->spriteID].attr0 = ATTR0_HIDE;
	}
}

void updateBullets(BULLET* b) {
	if (b->active) {
		b->col += b->cdel;
		if (!(b->col > SCREENWIDTH /* if the bullet is not off of the screen */ )) {
			//putting the bullets at sprite index 50
			//bullets are tile (0,4) on spritesheet
			shadowOAM[50 + b->spriteID].attr0 = ATTR0_SQUARE | b->row;
			shadowOAM[50 + b->spriteID].attr1 = ATTR1_TINY | b->col;
			shadowOAM[50 + b->spriteID].attr2 = (ATTR2_TILEID(0,6)) | ATTR2_PALROW(0); 
		} else {
			b->active = 0;
		}	
	} else {
		//if inactive, hide the bullet.
		shadowOAM[50 + b->spriteID].attr0 = ATTR0_HIDE;
	}
}

void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active == 0) {
			bullets[i].row = player.screenRow;
			bullets[i].col = player.screenCol;
			bullets[i].active = 1;
			break;
		}
	}
}

