#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "collisionmap.h"
#include "sound.h"
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

// Player animation states for aniState
enum {DRIVE, HURT, JUMP, LAND, SHOOT};

//Backgroud Variables
int hOffBG0;
int vOffBG0;
int hOffBG3;
int vOffBG3;

// Initialize the game
void initGame() {
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
    hasLost = 0;
    ghostMode = 0;

    setupTimeInterrupts();  

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
}

// Initialize the player
void initPlayer() {

	player.screenRow = ROADROW - 64; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level, player on top 
	player.screenCol = (SCREENWIDTH / 2) - 48; //arbitrarily chosen
	player.cdel = 1;
	player.rdel = 0; 
	player.height = 16;
	player.width = 56;

	//Animation
	// int aniCounter = 0;
 //    int aniState = DRIVE;
 //    int curFrame = 0;
 //    int numFrames = 3;
 //    int hide;

    uzi.screenRow = player.screenRow; //ROADROW arbitrarily chosen, and we subtract the sprite height to keep it on the same level, uzi on top 
	uzi.screenCol = player.screenCol + 36; //arbitrarily chosen, 36 from where the uzi is on the car

	//Animation
	// int aniCounter = 0;
 //    int aniState = DRIVE;
 //    int curFrame = 0;
 //    int numFrames = 3;
 //    int hide;


}

void initPolice(POLICE* p, int spriteID) {
	p->spriteID = spriteID;
	p->width = 56;
	p->height = 16;
	p->row = ROADLOW - 16;
	p->col = (player.screenCol - 96); //@ seperate the police locations
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
			e->width = 16;
			e->height = 8;
			e->cdel = -2;
			e->row = ROADLOW - 8; //on the road
			e->col = SCREENWIDTH;
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
        // Control movement and change animation state
		if(BUTTON_PRESSED(BUTTON_UP) && (player.screenRow == (ROADROW - 8))) {
				player.rdel -= JUMPIMPULSE;
		} 
			if (!(player.screenRow >= MAPHEIGHT - player.height) 
				&& !(player.screenRow + player.height + SHIFTDOWN(player.rdel) >= ROADLOW)) {

				player.rdel += GRAVITY;
			} else {
				player.rdel = 0;
				player.screenRow = ROADROW - 8;
			}

		if(BUTTON_PRESSED(BUTTON_A)) {
			fireBullet();
		}

		if(BUTTON_HELD(BUTTON_B)) {
			ghostMode = 1;
			infiniteAmmo = 1;
		} else {
			ghostMode = 0;
			infiniteAmmo = 0;
		}

		if(BUTTON_HELD(BUTTON_A) && infiniteAmmo) {
			fireBullet();
		}	

		player.screenRow += SHIFTDOWN(player.rdel);

		//@animation
		// animatePlayer();

		//player is at sprite index 25
		shadowOAM[25].attr0 = ATTR0_WIDE | (ROWMASK & player.screenRow);
		shadowOAM[25].attr1 = ATTR1_LARGE | (COLMASK & player.screenCol);

		//Uzi at sprite index 0
		shadowOAM[0].attr0 = ATTR0_SQUARE | (ROWMASK & player.screenRow);
		shadowOAM[0].attr1 = ATTR1_SMALL | (COLMASK & (player.screenCol + 35));

		if (/*ghostMode*/ time < 5) {
			shadowOAM[25].attr2 = (ATTR2_TILEID(14,0)) | ATTR2_PALROW(2) | ATTR2_PRIORITY(1); 
		} else {
			shadowOAM[25].attr2 = (ATTR2_TILEID(6,0)) | ATTR2_PALROW(2) | ATTR2_PRIORITY(1); 
		}

		shadowOAM[0].attr2 = (ATTR2_TILEID(0,0)) | ATTR2_PALROW(1) | ATTR2_PRIORITY(0); 

		
}

void animatePlayer() {
// 	// Set previous state to current state
//     player.prevAniState = player.aniState;
//     player.aniState = DRIVE;

//      // Change the animation frame every 20 frames of gameplay
//     if(player.aniCounter % 20 == 0) {
//         player.curFrame = (player.curFrame + 1) % player.numFrames;
//     }

//     if(BUTTON_HELD(BUTTON_UP))
//         player.aniState = JUMP;
//     if(BUTTON_HELD(BUTTON_A))
//         player.aniState = SHOOT;
    
//     player.aniCounter++;
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
			player.screenCol -= 16;
			playSoundA(hitSFX,HITSFXLEN,HITSFXFREQ, 0);

		}

		//moving the obstacle to the left
		e-> col += e-> cdel;

		//Obstacles at sprite index 1 to NUMOBSTACLES-1.
		switch(e->spriteType) {
			case POTHOLE:
				//Potholes are at tile (0,9) on spritesheet
				shadowOAM[e->spriteID].attr0 = ATTR0_WIDE | (ROWMASK & e->row);
				shadowOAM[e->spriteID].attr1 = ATTR1_TINY |  (COLMASK & e->col);
				shadowOAM[e->spriteID].attr2 = (ATTR2_TILEID(0,9)) | ATTR2_PALROW(1) | ATTR2_PRIORITY(3); //@ set priorities to make the signs draw over the potholes
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
	shadowOAM[60 + p->spriteID].attr1 = ATTR1_LARGE |  (COLMASK & p->col);
	shadowOAM[60 + p->spriteID].attr2 = (ATTR2_TILEID(6,8)) | ATTR2_PALROW(2) | ATTR2_PRIORITY(1); 
}

void fireBullet() {
	for (int i = 0; i < BULLETCOUNT; i++) {
		if (bullets[i].active == 0) {
			bullets[i].row = player.screenRow;
			bullets[i].col = player.screenCol + 40; //40 so that bullets spawn around the windows
			bullets[i].active = 1;
			break;
		}
	}
}

void setup_int_in_one_minute() {
	REG_TM2CNT = 0;
	REG_TM3CNT = 0;
	REG_TM2D = -0x4000; //1 second 
	REG_TM3D = -60; //60 seconds = 1 minute
	REG_TM2CNT = TM_IRQ | TM_FREQ_1024 | TIMER_ON;
	REG_TM3CNT = TM_CASCADE | TIMER_ON;
}

void setupTimeInterrupts() {
    REG_IME = 0;
    REG_IE |= 1 << 5; //Sets REG_IE to enable Timer 2 interrupts at bit 5, |= cause we might have other interrupts
    setup_int_in_one_minute(); //sets up the timers and enables the interrupt for Timer 1
    REG_IME = 1;
}
