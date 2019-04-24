#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "collisionmap.h"
#include "sound.h"
#include "ump45.h"
#include "reload1.h"
#include "reload2.h"
#include "dryfire.h"
#include "hitSFX.h"


// Variables
PLAYER player;
UZI uzi;
POLICE police[NUMPOLICE];
OBSTACLE obs[OBSTACLECOUNT];
BULLET bullets[BULLETCOUNT];

//Game Variables
int ghostMode;
int infiniteAmmo;
int hasLost;
int time;
int cycleTime;
int timeWhenHit;
int timeWhenReload;
int mosaic;
int bulletsFired;
int alreadyExecuted1;
int alreadyExecuted2;
int alreadyExecuted3;

int instructions; //we are currently in instructions

//Backgroud Variables
int hOffBG0;
int vOffBG0;
int hOffBG3;
int vOffBG3;

//Uzi enum
enum {IDLE, FIRING};

//Sprite Indexes Used:
//0, 1-NUMOBSTACLES, 25, 50-NUMBULLETS, 60-NUMPOLICE 

void initInstructions() {
	instructions = 1;

	//PLAYER
		player.screenRow = SCREENHEIGHT - 32; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level, player on top 
		player.screenCol = (SCREENWIDTH / 2) - 32; //arbitrarily chosen
		player.cdel = 1;
		player.rdel = 0; 
		player.height = 16;
		player.width = 56;
		player.stunned = 0;
		player.recovering = 0;
		player.reloading = 0;

		bulletsFired = 0;

		//Uzi sprite also instantiated here
	    uzi.screenRow = player.screenRow; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level, uzi on top 
		uzi.screenCol = player.screenCol + 36; //arbitrarily chosen, 36 from where the uzi is on the car
		uzi.aniState = IDLE;
		uzi.prevAniState = IDLE;

		//For the Reloading text
		alreadyExecuted1 = 0;
		alreadyExecuted2 = 0;
		alreadyExecuted3 = 0;

		//Animation
		player.curFrame = 0;
	    player.numFrames = 2;

	for (int i = 0; i < NUMPOLICE; i++) {
		initInstructionsPolice(&police[i], i + 1);
	}
	
	for (int i = 0; i < OBSTACLECOUNT; i++)
    	initObstacle(&obs[i], i + 1, i % NUMOBSTYPES);

    initBullets();

    time = 0;
    cycleTime = 0;
    hasLost = 0;
    ghostMode = 0;
}

// Initialize the game
void initGame() {
	instructions = 0;
	//initializing background offset registers and encoding the offset using 1/256 fixed point encoding
	vOffBG0 = SHIFTUP(39); //@bg offset off by 1?
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

    time = 0;
    cycleTime = 0;
    hasLost = 0;
    ghostMode = 0;

    setupTimeInterrupts();  

    REG_MOSAIC = 0;
    mosaic = 0;
 }

void updateInstructions() {
	updatePlayer();

	//Update all the bullets
	for (int i = 0; i < BULLETCOUNT; i++)
		updateBullets(&bullets[i]);

	for (int i = 0; i < NUMPOLICE; i++) {
		updatePolice(&police[i]);
	}

	//obstacles
	//Obstacles at sprite index 1 to NUMOBSTACLES-1.
		
	//Pothole
	shadowOAM[1].attr0 = ATTR0_WIDE | (ROWMASK & (56 + 8));
	shadowOAM[1].attr1 = ATTR1_TINY |  (COLMASK & (16));
	shadowOAM[1].attr2 = (ATTR2_TILEID(0,9)) | ATTR2_PALROW(1) | ATTR2_PRIORITY(3); //@ set priorities to make the signs draw over the potholes.

	//Sign
	shadowOAM[2].attr0 = ATTR0_TALL | (ROWMASK & 56);
	shadowOAM[2].attr1 = ATTR1_TINY |  (COLMASK & (16 + 32));
	shadowOAM[2].attr2 = (ATTR2_TILEID(0,25)) | ATTR2_PRIORITY(1);

	//Long sign
	shadowOAM[3].attr0 = ATTR0_TALL | (ROWMASK & (56 - 8));
	shadowOAM[3].attr1 = ATTR1_SMALL |  (COLMASK & (16 + 32 + 32));
	shadowOAM[3].attr2 = (ATTR2_TILEID(0,26)) | ATTR2_PRIORITY(1);
				
		


	//Update all the sprites in actual OAM
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 128 * 4);

	cycleTime++;
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

	//draw score
	updateScore();

	//Update all the sprites in actual OAM
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 128 * 4);

	cycleTime++;
}

void updateScore() {
	

	//score text
	shadowOAM[100].attr0 = ATTR0_WIDE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
	shadowOAM[100].attr1 = ATTR1_SMALL |  (COLMASK & (4));
	shadowOAM[100].attr2 = (ATTR2_TILEID(12,17)) | ATTR2_PRIORITY(0);

	//thousands digit 
	//hundreds digit
	
	//ones digit
	int currentTime = cycleTime;
	int currentDigit = cycleTime % 10;
	shadowOAM[101].attr0 = ATTR0_SQUARE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
	shadowOAM[101].attr1 = ATTR1_TINY |  (COLMASK & (72));
	shadowOAM[101].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

	//tens digit
	currentTime = currentTime / 10;
	currentDigit = currentTime % 10;
	shadowOAM[102].attr0 = ATTR0_SQUARE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
	shadowOAM[102].attr1 = ATTR1_TINY |  (COLMASK & (64));
	shadowOAM[102].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

	//Hundreds digit
	currentTime = currentTime / 10;
	currentDigit = currentTime % 10;
	shadowOAM[103].attr0 = ATTR0_SQUARE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
	shadowOAM[103].attr1 = ATTR1_TINY |  (COLMASK & (56));
	shadowOAM[103].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

	//Thousands digit
	currentTime = currentTime / 10;
	currentDigit = currentTime % 10;
	shadowOAM[104].attr0 = ATTR0_SQUARE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
	shadowOAM[104].attr1 = ATTR1_TINY |  (COLMASK & (48));
	shadowOAM[104].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);

	//Ten thousands digit
	currentTime = currentTime / 10;
	currentDigit = currentTime % 10;
	shadowOAM[105].attr0 = ATTR0_SQUARE | (ROWMASK & (SCREENHEIGHT - 16)) | ATTR0_MOSAIC;
	shadowOAM[105].attr1 = ATTR1_TINY |  (COLMASK & (40));
	shadowOAM[105].attr2 = (ATTR2_TILEID(13,17 + currentDigit)) | ATTR2_PRIORITY(0);
}

// Initialize the player
void initPlayer() {

	player.screenRow = ROADROW - 64; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level, player on top 
	player.screenCol = (SCREENWIDTH / 2) - 48; //arbitrarily chosen
	player.cdel = 1;
	player.rdel = 0; 
	player.height = 16;
	player.width = 56;
	player.stunned = 0;
	player.recovering = 0;
	player.reloading = 0;

	bulletsFired = 0;

	//Uzi sprite also instantiated here
    uzi.screenRow = player.screenRow; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level, uzi on top 
	uzi.screenCol = player.screenCol + 36; //arbitrarily chosen, 36 from where the uzi is on the car
	uzi.aniState = IDLE;
	uzi.prevAniState = IDLE;

	//For the Reloading text
	alreadyExecuted1 = 0;
	alreadyExecuted2 = 0;
	alreadyExecuted3 = 0;

	//Animation
	player.curFrame = 0;
    player.numFrames = 2;
}

void initInstructionsPolice(POLICE* p, int spriteID) {
	p->spriteID = spriteID;
	p->width = 56;
	p->height = 16;
	p->row = player.screenRow;
	p->col = (player.screenCol - 72); //@ seperate the police locations
	p->cdel = 1;
	
	//Animation
	p->curFrame = 0;
    p->numFrames = 3;
}

void initPolice(POLICE* p, int spriteID) {
	p->spriteID = spriteID;
	p->width = 56;
	p->height = 16;
	p->row = ROADLOW - 16;
	p->col = (player.screenCol - 96); //@ seperate the police locations
	p->cdel = 1;
	
	//Animation
	p->curFrame = 0;
    p->numFrames = 3;
}

// Initialize an obstacle, inactive by default
void initObstacle(OBSTACLE* e, int spriteID, int spriteType) {
	e->spriteID = spriteID;
	e->spriteType = spriteType;
	e->hp = 0;
	e->destructible = 1;
	e->active = 0;

	//Animation
	// e->aniCounter = 0;
	// e->curFrame = 0;

	//Dependent on Obstacle Type
	switch(e->spriteType) {
		case POTHOLE:
			e->width = 16;
			e->height = 8;
			e->cdel = -2;
			e->row = ROADLOW - 8; //on the road
			e->col = SCREENWIDTH;
			e->curFrame = 0;
			e->numFrames = 4;

			break;
		case BIRD:
			e->width = 8;
			e->height = 8;
			e->cdel = -3;
			if ((rand() % 2) == 0) {
				e->row = ROADROW - 18;
			} else {
				e->row = ROADHIGH; //bird is above the normal level @in future make this random between normal and high
			}
			e->col = SCREENWIDTH;
			e->curFrame = 0;
			e->numFrames = 2;			
			break;
		case SIGN:
			e->width = 8;
			e->height = 16;
			e->cdel = -2;
			e->row = ROADLOW - 16; //normal level, hits low and normal
			e->col = SCREENWIDTH;
			break;
		case LONGSIGN:
			e->width = 8;
			e->height = 24;
			e->cdel = -2;
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
		//Some uzi animation housekeeping
		uzi.prevAniState = uzi.aniState;
		if (uzi.prevAniState == FIRING) {
			uzi.aniState = IDLE;
		}

        // Control movement and change animation state
		if((BUTTON_PRESSED(BUTTON_UP) && (player.screenRow == (ROADROW - 8)))) {
				player.rdel -= JUMPIMPULSE;
		} 
			if (!(player.screenRow >= MAPHEIGHT - player.height) 
				&& !(player.screenRow + player.height + SHIFTDOWN(player.rdel) >= ROADLOW)) {

				player.rdel += GRAVITY;
			} else if (!instructions) {
				player.rdel = 0;
				player.screenRow = ROADROW - 8;
			} else {
				player.rdel = 0;
				player.screenRow = SCREENHEIGHT - 32;
			}

		if (player.reloading == 1) {
			if (BUTTON_PRESSED(BUTTON_A)) {
				playSoundA(dryfire,DRYFIRELEN,DRYFIREFREQ, 0);

			}
			if (!(time > timeWhenReload + 7)) {
				//show reloading sprite starting at 20
				int startingCol = SCREENWIDTH - 64 - 32;
				int startingRow = SCREENHEIGHT - 16;
				
				shadowOAM[20].attr0 = ATTR0_WIDE | (ROWMASK & (startingRow)) | ATTR0_MOSAIC;
				shadowOAM[20].attr1 = ATTR1_LARGE | (COLMASK & (startingCol));
				shadowOAM[20].attr2 = (ATTR2_TILEID(6,16)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0); 

				if ((time > (timeWhenReload + 2)) && !(alreadyExecuted1)) {
					shadowOAM[21].attr0 = ATTR0_SQUARE | (ROWMASK & startingRow) | ATTR0_MOSAIC;
					shadowOAM[21].attr1 = ATTR1_TINY | (COLMASK & (64 + startingCol));
					shadowOAM[21].attr2 = (ATTR2_TILEID(6,24)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0); 
					playSoundA(reload1, RELOAD1LEN, RELOAD1FREQ, 0);
					alreadyExecuted1 = 1;

				}
				if ((time > (timeWhenReload + 4)) && !(alreadyExecuted2)) {
					shadowOAM[22].attr0 = ATTR0_SQUARE | (ROWMASK & startingRow) | ATTR0_MOSAIC;
					shadowOAM[22].attr1 = ATTR1_TINY | (COLMASK & (72 + startingCol));
					shadowOAM[22].attr2 = (ATTR2_TILEID(6,24)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0); 
					playSoundA(reload1, RELOAD1LEN, RELOAD1FREQ, 0);
					alreadyExecuted2 = 1;
				}
				if ((time > (timeWhenReload + 6)) && !(alreadyExecuted3)) {
					shadowOAM[23].attr0 = ATTR0_SQUARE | (ROWMASK & startingRow) | ATTR0_MOSAIC;
					shadowOAM[23].attr1 = ATTR1_TINY | (COLMASK & (80 + startingCol));
					shadowOAM[23].attr2 = (ATTR2_TILEID(6,24)) | ATTR2_PALROW(0) | ATTR2_PRIORITY(0); 
					playSoundA(reload2, RELOAD2LEN, RELOAD2FREQ, 0);
					alreadyExecuted3 = 1;
				}
			} else {
				shadowOAM[20].attr0 = ATTR0_HIDE;
				shadowOAM[21].attr0 = ATTR0_HIDE;
				shadowOAM[22].attr0 = ATTR0_HIDE;
				shadowOAM[23].attr0 = ATTR0_HIDE;
				player.reloading = 0;
				bulletsFired = 0;
				alreadyExecuted1 = 0;
				alreadyExecuted2 = 0;
				alreadyExecuted3 = 0;
			}
		}

		if(BUTTON_PRESSED(BUTTON_A) && !(player.reloading)) {
			fireBullet();

			if (!ghostMode) {
				bulletsFired++;
			}
			if (bulletsFired == 3) {
				player.reloading = 1;
				timeWhenReload = time;
			}
		}

		if(BUTTON_HELD(BUTTON_B)) {
			ghostMode = 1;
			infiniteAmmo = 1;
			shadowOAM[20].attr0 = ATTR0_HIDE;
				shadowOAM[21].attr0 = ATTR0_HIDE;
				shadowOAM[22].attr0 = ATTR0_HIDE;
				shadowOAM[23].attr0 = ATTR0_HIDE;
				player.reloading = 0;
				bulletsFired = 0;
				alreadyExecuted1 = 0;
				alreadyExecuted2 = 0;
				alreadyExecuted3 = 0;
		} else {
			ghostMode = 0;
			infiniteAmmo = 0;
		}

		if(BUTTON_HELD(BUTTON_A) && infiniteAmmo) {
			fireBullet();
		}	

		player.screenRow += SHIFTDOWN(player.rdel);

		//Timing of hitstun: 2 seconds
		if (time >= (timeWhenHit + 4)) { 
			player.stunned = 0;
		}

		//Timing of recovery: 5 seconds after being hit
		if ((time >= (timeWhenHit + 10)) && (time <= (timeWhenHit + 14))) { 
			player.recovering = 1;
		} else {
			player.recovering = 0;
		}

		if (((cycleTime % 10) == 0) && player.recovering && (player.screenCol != ((SCREENWIDTH / 2) - 48) )/*default position*/) {
			player.screenCol++;
		}

		if (((cycleTime % 5) == 0) && (mosaic > 0)) {
			mosaic--;
			REG_MOSAIC = (mosaic << 8) | (mosaic << 12);
		}


		//player is at sprite index 25
		if (player.stunned && ((cycleTime % 6) == 0)) {

			shadowOAM[25].attr0 = ATTR0_HIDE | ATTR0_WIDE | (ROWMASK & player.screenRow) | ATTR0_MOSAIC;
			shadowOAM[0].attr0 = ATTR0_HIDE | ATTR0_SQUARE | (ROWMASK & player.screenRow) | ATTR0_MOSAIC;

		} else {

			shadowOAM[25].attr0 = ATTR0_WIDE | (ROWMASK & player.screenRow) | ATTR0_MOSAIC;
			shadowOAM[0].attr0 = ATTR0_SQUARE | (ROWMASK & player.screenRow) | ATTR0_MOSAIC;

		}

		
		shadowOAM[25].attr1 = ATTR1_LARGE | (COLMASK & player.screenCol);

		//Animation
		if ((player.screenRow == (ROADROW - 8)) || (instructions && (player.screenRow == (SCREENHEIGHT - 32)))) {
			if (cycleTime % 10 == 0) {
				player.curFrame = (player.curFrame + 1) % player.numFrames;
			}
    	} else {
    		player.curFrame = 0;
    	}

		if (ghostMode) {
			shadowOAM[25].attr2 = (ATTR2_TILEID(14 + (player.curFrame * 4),0)) | ATTR2_PALROW(2) | ATTR2_PRIORITY(1); 
		} else {
			shadowOAM[25].attr2 = (ATTR2_TILEID(6 + (player.curFrame * 4),0)) | ATTR2_PALROW(2) | ATTR2_PRIORITY(1); 
		}

		//Uzi at sprite index 0
		shadowOAM[0].attr1 = ATTR1_SMALL | (COLMASK & (player.screenCol + 35));
		shadowOAM[0].attr2 = (ATTR2_TILEID(0 + (uzi.aniState * 2),0)) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0); 
			
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
					e->hp++;
					if (e->hp >= 3) {
						e->active = 0;
					}
				}
			}
		}

		//Check if this obstacle is hitting the player
		if (!(player.stunned) && collision(player.screenRow, player.screenCol, player.height, player.width, e->row, e->col, e->height, e->width) && !(ghostMode)) {
			player.screenCol -= 16;
			playSoundA(hitSFX,HITSFXLEN,HITSFXFREQ, 0);
			player.stunned = 1;
			timeWhenHit = time;
			mosaic = 3;
			REG_MOSAIC = (mosaic << 8) | (mosaic << 12); 
		}

		//moving the obstacle to the left
		e-> col += e-> cdel;

		if (cycleTime % 20 == 0) {
				e->curFrame = (e->curFrame + 1) % e->numFrames;
		}

		//Obstacles at sprite index 1 to NUMOBSTACLES-1.
		switch(e->spriteType) {
			case POTHOLE:
				//Potholes are at tile (0,9) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_WIDE | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_TINY |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(e->curFrame,9)) | ATTR2_PALROW(1) | ATTR2_PRIORITY(3); //@ set priorities to make the signs draw over the potholes
				break;
			case BIRD:
				//Birds are at tile (0,7) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_SQUARE | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_TINY | (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(e->curFrame, 7)) | ATTR2_PRIORITY(1);
				break;
			case SIGN:

				//Signs are at tile (1,9) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_TALL | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_TINY |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(0 + (e->hp * 4) ,25)) | ATTR2_PRIORITY(1);
				break;
			case LONGSIGN:
				//Long signs are at tile (1,10) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_TALL | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_SMALL |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(0 + (e->hp * 4),26)) | ATTR2_PRIORITY(1);
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
			hideSprites();
		}
	//putting the police at sprite index 60
	//police are tile (4,0) on spritesheet @

	if (cycleTime % 10 == 0) {
				p->curFrame = (p->curFrame + 1) % p->numFrames;
	}

	shadowOAM[60 + p->spriteID].attr0 = ATTR0_WIDE | (ROWMASK & p->row);
	shadowOAM[60 + p->spriteID].attr1 = ATTR1_LARGE |  (COLMASK & p->col);
	shadowOAM[60 + p->spriteID].attr2 = (ATTR2_TILEID(6 + (p->curFrame * 4),8)) | ATTR2_PALROW(2) | ATTR2_PRIORITY(1); 
}

void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active == 0) {
			bullets[i].row = player.screenRow - 1;
			bullets[i].col = player.screenCol + 40; //40 so that bullets spawn around the windows
			bullets[i].active = 1;
			playSoundA(ump45, UMP45LEN, UMP45FREQ, 0);
			uzi.aniState = FIRING;
			break;
		}
	}
}

void setup_int_in_one_minute() {
	REG_TM2CNT = 0;
	REG_TM3CNT = 0;
	REG_TM2D = -8192; //.5 second 
	REG_TM3D = -120; //60 seconds = 1 minute
	REG_TM2CNT = TM_IRQ | TM_FREQ_1024 | TIMER_ON;
	REG_TM3CNT = TM_CASCADE | TIMER_ON;
}

void setupTimeInterrupts() {
    REG_IME = 0;
    REG_IE |= 1 << 5; //Sets REG_IE to enable Timer 2 interrupts at bit 5, |= cause we might have other interrupts
    setup_int_in_one_minute(); //sets up the timers and enables the interrupt for Timer 1
    REG_IME = 1;
}
