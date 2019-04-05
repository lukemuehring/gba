// Player Struct
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

// Police Struct
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

// States used for pikachu.aniState
// Idle does not have an actual image associated with it;..
// Whenever pikachu is idle, just show whatever state pikachu was before (prevAniState)
// enum { PIKAFRONT, PIKABACK, PIKARIGHT, PIKALEFT, PIKAIDLE};

// Constants
#define OBSTACLECOUNT 1
#define BULLETCOUNT 3
#define NUMSPRITETYPES 3
#define ROADROW (160 - 64)

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
void initObstacles();
void updateObstacles(OBSTACLE *);
void initBullets();
void updateBullets(BULLET *);
void fireBullet();
