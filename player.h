
typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int bulletTimer;
    int isReloading;
    int isMelee;
    int health;
    int isHit;
    int healthRegenBuffer;
} PLAYER;

extern PLAYER player;
enum {knife, pistol, rifle};

typedef struct bullet {
    int row; int col;
    int height; int width;
    int active;
    int cdel;
    int rdel;
    int direction;
    int gunFired;
} BULLET;

//weapon variables
extern int weapon;

extern int pistolAmmo;
extern int pistolStockPile;

extern int rifleAmmo;
extern int rifleStockPile;

extern int pistolFound;
extern int rifleFound;

extern int pistolActive;
extern int rifleActive;


extern int pistolRow;
extern int pistolCol;

extern int rifleRow;
extern int rifleCol;

#define BULLETCOUNT 30
extern BULLET bullets[BULLETCOUNT];

extern int knifeDamage;
extern int pistolDamage;
extern int rifleDamage;


//PLAYER STATE DEFs
#define knifeIdle 0 
#define knifeMove 1
#define knifeMelee 2
#define pistolIdle 3
#define pistolMelee 4
#define pistolMove 5
#define pistolReload 6
#define rifleIdle 7
#define rifleMelee 8
#define rifleMove 9
#define rifleReload 10

#define knifeIdleFrames 12
#define knifeMoveFrames 16
#define knifeMeleeFrames 15
#define pistolIdleFrames 6
#define pistolMeleeFrames 9
#define pistolMoveFrames 5
#define pistolReloadFrames 11
#define rifleIdleFrames 5
#define rifleMeleeFrames 12
#define rifleMoveFrames 7
#define rifleReloadFrames 7


//PLAYER METHODS 
void initPlayer();
void updatePlayer();
void shadowPlayer(); // ShadowOAM FOR PLAYER

void movePlayer();  // noves player in the correct direction and orientation depending on directional button input
void playerState(); // changes the aniState/numFrames of the player depending on button input 

void playerReload();
void reloadLogic();
void playerMelee();
void changeWeapon();
void playerShoot();
int playerCollision();
void playerCheckMeleeSuccess();
void healthRegen();



// FRAME RATE CHANGE  (HOW LONG IT TAKES FOR ANIMATION OF PLAYER TO CHANGE/ THE SPEED AT WHICH THE CHARACTER ANIMATES, LOWER FRAME HIGHER SPEED)
#define defaultFrames 20
#define pistolReloadTime 10
#define reloadFrames 20
#define meleeFrames 5

// BULLET METHODS
void initBullets();
void updateBullets();
void shadowBullets();

void orientateBullets(BULLET *);   // CORRECTLY CHANGES THE BULLETS ROW, COL, RDEL, CDEL, AND AFFINE MATRIX DEPENDING ON THE DIRECTION THE PLAYER WAS FACING
void moveBullets(BULLET *);
void bulletCollision();  // DETECTS IF ZOMBIE WAS HIT BY A BULLET

// SCREEN OFFSET
extern int hOff;
extern int vOff;
void screenOffset();

//Keeps track if guns have been unlocked

