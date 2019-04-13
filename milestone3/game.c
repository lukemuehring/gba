#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
POLICE police[NUMPOLICE];
OBSTACLE obs[OBSTACLECOUNT];
BULLET bullets[BULLETCOUNT];
int ghostMode;
int hasLost;
int score;

//Backgroud Variables
int hOffBG0;
int vOffBG0;
int hOffBG3;
int vOffBG3;

// Initialize the game
void initGame() {
	//initializing background offset registers and encoding the offset using 1/256 fixed point encoding
	vOffBG0 = SHIFTUP(295);
    hOffBG0 = SHIFTUP(0);
    vOffBG3 = SHIFTUP(48);
    hOffBG3 = SHIFTUP(0);

	initPlayer();

	for (int i = 0; i < NUMPOLICE; i++) {
		initPolice(&police[i], i + 1);
	}
	
	for (int i = 0; i < OBSTACLECOUNT; i++)
    	initObstacle(&obs[i], i + 1, i % NUMOBSTYPES);

    initBullets();

    score = 0;
    hasLost = 0;
    ghostMode = 0;
 }

// Updates the game each frame
void updateGame() {
	hOffBG0+= 768; //3 * (256)
	hOffBG3+= 64; // .5

	//shift back down encoding 
	REG_BG0HOFF = SHIFTDOWN(hOffBG0);
    REG_BG0VOFF = SHIFTDOWN(vOffBG0);
	REG_BG3HOFF = SHIFTDOWN(hOffBG3);
    REG_BG3VOFF = SHIFTDOWN(vOffBG3);

	updatePlayer();

	int randomIndex; //This is for spawning a random obstacle in the obstacle array at a random time between 1-3 seconds.

	//Random timing
	if (rand() % 100 == 0) {
		randomIndex = rand() % OBSTACLECOUNT;
		if ((&obs[randomIndex])->active == 0) {
			spawnObstacle(&obs[randomIndex]); 
		}
	}

	// Update all the obstacles
	for (int i = 0; i < OBSTACLECOUNT; i++)
		updateObstacles(&obs[i]);

	//Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullets(&bullets[i]);

	for (int i = 0; i < NUMPOLICE; i++) {
		updatePolice(&police[i]);
	}

	//Update all the sprites in actual OAM
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 128 * 4);

	score++;
}

// Initialize the player
void initPlayer() {

	player.screenRow = ROADROW - 16; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level
	player.screenCol = (SCREENWIDTH / 2)- 30; //arbitrarily chosen
	player.cdel = 1;
	player.rdel = 1;
	player.height = 16;
	player.width = 32;

	//Animation
	/*int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;*/
}

void initPolice(POLICE* p, int spriteID) {
	p->spriteID = spriteID;
	p->width = 32;
	p->height = 16;
	p->row = ROADLOW - 16;
	p->col = (player.screenCol - (player.width * 2) - 16); //@ seperate the police locations
	p->cdel = 1;
	
	//Animation
	/*int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;*/
}

// Initialize an obstacle, inactive by default
void initObstacle(OBSTACLE* e, int spriteID, int spriteType) {
	e->spriteID = spriteID;
	e->spriteType = spriteType;
	e->hp = 3;
	e->destructible = 1;
	e->active = 0;

	//Animation
	// e->aniCounter = 0;
	// e->curFrame = 0;

	//Dependent on Obstacle Type
	switch(e->spriteType) {
		case POTHOLE:
			e->width = 32;
			e->height = 8;
			e->cdel = -1;
			e->row = ROADLOW - 8; //on the road
			e->col = SCREENWIDTH;
			break;
		case BIRD:
			e->width = 8;
			e->height = 8;
			e->cdel = -2;
			e->row = ROADHIGH; //bird is above the normal level @in future make this random between normal and high
			e->col = SCREENWIDTH;
			break;
		case SIGN:
			e->width = 8;
			e->height = 16;
			e->cdel = -1;
			e->row = ROADLOW - 16; //normal level, hits low and normal
			e->col = SCREENWIDTH;
			break;
		case LONGSIGN:
			e->width = 8;
			e->height = 24;
			e->cdel = -1;
			e->row = ROADLOW - 24; //normal level, hits low and normal
			e->col = SCREENWIDTH;

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

//Spawns the obstacle at index i of the obstacle array (we are given a pointer to this obstacle)
void spawnObstacle(OBSTACLE* e) {
	initObstacle(e, e->spriteID, e->spriteType);
	e->active = 1;
}

// Handle every-frame actions of the player
void updatePlayer() {
        // Control movement and change animation state
		if(BUTTON_HELD(BUTTON_UP)) {
			player.screenRow = ROADROW - (16 * 2);
		} else if(BUTTON_HELD(BUTTON_DOWN)) {
			player.screenRow = ROADROW - 8;
		} else {
			player.screenRow = ROADROW - 16;
		}
		if(BUTTON_PRESSED(BUTTON_A)) {
			fireBullet();
		}
		if(BUTTON_HELD(BUTTON_B)) {
			ghostMode = 1;
		} else {
			ghostMode = 0;
		}

		//player is at sprite index 0
		shadowOAM[0].attr0 = ATTR0_WIDE | player.screenRow;
		shadowOAM[0].attr1 = ATTR1_MEDIUM | player.screenCol;

		if (ghostMode) {
			shadowOAM[0].attr2 = (ATTR2_TILEID(2,0)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1); 
		} else {
			shadowOAM[0].attr2 = (ATTR2_TILEID(0,0)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1); 
		}
		
}



// Handle every-frame actions of an obstacle
void updateObstacles(OBSTACLE* e) {

	//if the obstacle goes off the left side of the screen
	if (e->col <= (0 - e->width)) {
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
		if (collision(player.screenRow, player.screenCol, player.height, player.width, e->row, e->col, e->height, e->width) && !(ghostMode)) {
			player.screenCol -= player.width;
		}

		//moving the obstacle to the left
		e-> col += e-> cdel;

		//Obstacles at sprite index 1 to NUMOBSTACLES-1
		switch(e->spriteType) {
			case POTHOLE:
				//Potholes are at tile (0,9) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_WIDE | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_SMALL |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(0,9)) | ATTR2_PRIORITY(3); //@ set priorities to make the signs draw over the potholes
				break;
			case BIRD:
				//Birds are at tile (0,7) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_SQUARE | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_TINY | (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(0,7)) | ATTR2_PRIORITY(1);
				break;
			case SIGN:
				//Signs are at tile (1,9) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_TALL | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_TINY |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(1,9)) | ATTR2_PRIORITY(1);
				break;
			case LONGSIGN:
				//Long signs are at tile (1,10) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_TALL | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_SMALL |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(1,10)) | ATTR2_PRIORITY(1);
				break;
		}	

		// e->aniCounter++;


	} else { //Obstacle is not active anymore
		shadowOAM[e->spriteID].attr0 = ATTR0_HIDE;
	}
}

void updateBullets(BULLET* b) {
	if (b->active) {
		b->col += b->cdel;
		if (!(b->col > SCREENWIDTH + b->width /* if the bullet is not off of the screen */ )) {
			//putting the bullets at sprite index 50
			//bullets are tile (0,4) on spritesheet
			shadowOAM[50 + b->spriteID].attr0 = ATTR0_SQUARE | (ROWMASK & b->row);
			shadowOAM[50 + b->spriteID].attr1 = ATTR1_TINY |  (COLMASK & b->col);
			shadowOAM[50 + b->spriteID].attr2 = (ATTR2_TILEID(0,6)) | ATTR2_PALROW(0); 
		} else {
			b->active = 0;
		}	
	} else {
		//if inactive, hide the bullet.
		shadowOAM[50 + b->spriteID].attr0 = ATTR0_HIDE;
	}
}

void updatePolice(POLICE* p) {
	if (player.screenCol <= (p->col + p->width - 1)) {
			hasLost = 1;
		}
	//putting the police at sprite index 60
	//police are tile (4,0) on spritesheet @
	shadowOAM[60 + p->spriteID].attr0 = ATTR0_WIDE | (ROWMASK & p->row);
	shadowOAM[60 + p->spriteID].attr1 = ATTR1_MEDIUM |  (COLMASK & p->col);
	shadowOAM[60 + p->spriteID].attr2 = (ATTR2_TILEID(4,0)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1); 
}

void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active == 0) {
			bullets[i].row = player.screenRow;
			bullets[i].col = player.screenCol + player.width - 1;
			bullets[i].active = 1;
			break;
		}
	}
}

