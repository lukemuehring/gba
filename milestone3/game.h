// Player Struct
typedef struct {
    int screenRow;
    int screenCol;
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

// Police Struct
typedef struct {
    int row;
    int col;
    int cdel;
    int width;
    int height;
    int spriteID;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
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
#define OBSTACLECOUNT 6
#define BULLETCOUNT 3
#define NUMOBSTYPES 4
#define ROADROW (160 - 64)
#define ROADLOW (160 - 64) + 8
#define ROADHIGH (160 - 64) - 32
#define NUMPOLICE 3

//Obstacle Types Enum
enum {POTHOLE, BIRD, SIGN, LONGSIGN};

// Variables
extern PLAYER player;
extern OBSTACLE obs[OBSTACLECOUNT];
extern int hasLost;
extern int score;	

// Prototypes
void initGame();
void updateGame();
void initPlayer();
void updatePlayer();
void initPolice(POLICE *, int);
void updatePolice(POLICE *);
void initObstacle(OBSTACLE *, int, int);
void spawnObstacle(OBSTACLE *);
void updateObstacles(OBSTACLE *);
void initBullets();
void updateBullets(BULLET *);
void fireBullet();
