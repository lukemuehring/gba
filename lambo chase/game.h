// Player Struct
typedef struct {
    int screenRow;
    int screenCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int curFrame;
    int numFrames;
    int stunned;
    int recovering;
    int reloading;
} PLAYER;

typedef struct {
    int screenRow;
    int screenCol;
    int rdel;
    int cdel;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} UZI;

// Police Struct
typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int spriteID;
    int curFrame;
    int numFrames;
} POLICE;

//bullet Struct
typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
    int cdel;
    int spriteID;
} BULLET;

//Obstacle Struct
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

// States used for pikachu.aniState
// Idle does not have an actual image associated with it;..
// Whenever pikachu is idle, just show whatever state pikachu was before (prevAniState)
// enum { PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};

// Constants
#define OBSTACLECOUNT 10
#define BULLETCOUNT 20
#define NUMOBSTYPES 4
#define ROADROW (160 - 64)
#define ROADLOW (160 - 64) + 8
#define ROADHIGH (160 - 64) - 32
#define NUMPOLICE 3
#define GRAVITY 40 //
#define JUMPIMPULSE 1000

#define MAPHEIGHT 256
#define MAPWIDTH 512

//Obstacle Types Enum
enum {POTHOLE, BIRD, SIGN, LONGSIGN};

// Variables
extern PLAYER player;
extern OBSTACLE obs[OBSTACLECOUNT];
extern int cycleTime;
extern int hasLost;
extern int time;	

// Prototypes
void initInstructions();
void initInstructionsPolice();
void initGame();
void updateInstructions();
void updateGame();
void initPlayer();
void updatePlayer();
void initPolice(POLICE *, int);
void updatePolice(POLICE *);
void updateScore();
void initObstacle(OBSTACLE *, int, int);
void spawnObstacle(OBSTACLE *);
void updateObstacles(OBSTACLE *);
void initBullets();
void updateBullets(BULLET *);
void fireBullet();
void setupTimeInterrupts();
void setup_int_in_one_minute();
