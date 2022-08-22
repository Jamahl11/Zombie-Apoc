#include "mode0.h"



void initGame();
void updateGame();
void shadowGame();

// GAME EVENTS
void timedEvents();
void equipPistol();
void equipRifle();

void pistolAmmoSpawn();
void shadowPistolAmmo();
void pistolAmmoCollision();

void rifleAmmoSpawn();
void shadowRifleAmmo();
void rifleAmmoCollision();

void initDirections();
void userInterface();
void showScore();
void showHealth();
void showGun();

void endScore();

void interruptHandler();
void setupInterrupts();

void enableTimerInterrupts(void);

extern int seconds;
extern int minutes;

// AFFINE STRUCT & SHADOWOAM
typedef struct {
    u16 fill0[3];
    short a;
    u16 fill1[3];
    short b;
    u16 fill2[3];
    short c;
    u16 fill[3];
    short d;
} OBJ_AFFINE;

#define NORTH (0 << 9)
#define NORTHEAST (1 << 9)
#define EAST (2 << 9)
#define SOUTHEAST (3 << 9)
#define SOUTH (4 << 9) 
#define SOUTHWEST (5 << 9)
#define WEST (6 << 9)
#define NORTHWEST (7 << 9)

extern int knifeDamage;
extern int pistolDamage;
extern int rifleDamage;
extern int zombieDamage;

extern int score;
extern int lost;
extern int pistolUnlocked;
extern int rifleUnlocked;


extern int cheat;

