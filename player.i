# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1

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


extern BULLET bullets[30];

extern int knifeDamage;
extern int pistolDamage;
extern int rifleDamage;
# 92 "player.h"
void initPlayer();
void updatePlayer();
void shadowPlayer();

void movePlayer();
void playerState();

void playerReload();
void reloadLogic();
void playerMelee();
void changeWeapon();
void playerShoot();
int playerCollision();
void playerCheckMeleeSuccess();
void healthRegen();
# 117 "player.h"
void initBullets();
void updateBullets();
void shadowBullets();

void orientateBullets(BULLET *);
void moveBullets(BULLET *);
void bulletCollision();


extern int hOff;
extern int vOff;
void screenOffset();
# 2 "player.c" 2
# 1 "game.h" 1
# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 85 "mode0.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
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
# 154 "mode0.h"
void hideSprites();






typedef struct {
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
} SPRITE;
# 192 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 245 "mode0.h"
typedef void (*ihp)(void);
# 294 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);

int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, int colShift, int rowShift);

int collisionClimb(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, int colShift, int rowShift);
# 2 "game.h" 2



void initGame();
void updateGame();
void shadowGame();


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
# 59 "game.h"
extern int knifeDamage;
extern int pistolDamage;
extern int rifleDamage;
extern int zombieDamage;

extern int score;
extern int lost;
extern int pistolUnlocked;
extern int rifleUnlocked;


extern int cheat;
# 3 "player.c" 2

# 1 "zombie.h" 1


typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int isMelee;
    int health;
    int isBoss;
    int active;
    unsigned short direction;
    int frameSpeed;
    int shotBy;
} ZOMBIE;
# 42 "zombie.h"
extern int activeZombies;
extern int activeBosses;
extern int zombieNotSpawned;
extern int bossNotSpawned;

extern int zombieStartHealth;
extern int bossStartHealth;



extern ZOMBIE zombies[];
extern ZOMBIE bosses[];


void initZombies();
void updateZombies();
void shadowZombies();

void zombieMelee(ZOMBIE *);
void moveZombies(ZOMBIE *);
void orientateZombie(ZOMBIE *);
void zombieBlood(ZOMBIE *);

void decrementZombieHealth(ZOMBIE *);
void decrementPlayerHealth(ZOMBIE*);

int checkProximity(ZOMBIE *);
int checkColumns(ZOMBIE *);
int checkRows(ZOMBIE *);

void spawnZombie();
void spawnBossZombie();
void zombieOrientate(ZOMBIE *);


int proximityHelper(ZOMBIE *);



void destroyZombies();
# 5 "player.c" 2
# 1 "print.h" 1
# 26 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 27 "print.h" 2
# 36 "print.h"

# 36 "print.h"
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
uint8_t mgba_open(void);
void mgba_close(void);
# 6 "player.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSound();
void unpauseSound();
void stopSound();
# 46 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 7 "player.c" 2


# 1 "pistolFire.h" 1


extern const unsigned int pistolFire_sampleRate;
extern const unsigned int pistolFire_length;
extern const signed char pistolFire_data[];
# 10 "player.c" 2
# 1 "pistolReload.h" 1


extern const unsigned int pistolReload_sampleRate;
extern const unsigned int pistolReload_length;
extern const signed char pistolReload_data[];
# 11 "player.c" 2
# 1 "pistolClick.h" 1


extern const unsigned int pistolClick_sampleRate;
extern const unsigned int pistolClick_length;
extern const signed char pistolClick_data[];
# 12 "player.c" 2
# 1 "rifleShot.h" 1


extern const unsigned int rifleShot_sampleRate;
extern const unsigned int rifleShot_length;
extern const signed char rifleShot_data[];
# 13 "player.c" 2
# 1 "rifleReload.h" 1


extern const unsigned int rifleReload_sampleRate;
extern const unsigned int rifleReload_length;
extern const signed char rifleReload_data[];
# 14 "player.c" 2
# 1 "rifleClick.h" 1


extern const unsigned int rifleClick_sampleRate;
extern const unsigned int rifleClick_length;
extern const signed char rifleClick_data[];
# 15 "player.c" 2
# 1 "collisionMap.h" 1
# 21 "collisionMap.h"
extern const unsigned short collisionMapBitmap[131072];


extern const unsigned short collisionMapPal[256];
# 16 "player.c" 2

PLAYER player;
BULLET bullets[30];

u16 direction;
int frames = 20;


int weapon;

int hOff;
int vOff;

int pistolUnlocked;
int rifleUnlocked;

int pistolAmmo;
int pistolStockPile;

int rifleAmmo;
int rifleStockPile;

int pistolFound;
int rifleFound;

int pistolActive;
int rifleActive;

int pistolCol = 120;
int pistolRow = 55;

int rifleCol = 336;
int rifleRow = 72;

int rifleCol;
int rifleRow;

unsigned char * collisionMap = (unsigned char*) collisionMapBitmap;




void initPlayer() {
    player.row = 160 / 2 - player.width / 2 + vOff;
    player.col = 240 / 2 - player.height / 2 + hOff;
    player.height = 16;
    player.width = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 16;
    player.aniState = 0;
    player.bulletTimer = 15;
    player.isReloading = 0;
    player.isMelee = 0;
    player.health = 100;
    player.isHit = 0;
    player.healthRegenBuffer = 150;

}

void updatePlayer() {

    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && player.isMelee != 1 && player.isReloading != 1 && weapon != knife) {
        if ( weapon == pistol) {
            if (pistolAmmo < 12 && pistolStockPile > 0) {
                player.isReloading = 1;
                player.aniCounter = 1;
                player.curFrame = 0;
                playSoundB(pistolReload_data, pistolReload_length, 0);

            } else {playSoundB(pistolClick_data, pistolClick_length, 0);}


        } else {
            if (rifleAmmo < 30 && rifleStockPile > 0) {
                player.isReloading = 1;
                player.aniCounter = 1;
                player.curFrame = 0;
                playSoundB(rifleReload_data, rifleReload_length, 0);

            } else {playSoundB(rifleClick_data, rifleClick_length, 0);}
        }
# 108 "player.c"
    }

    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) && player.isReloading != 1 && player.isMelee != 1) {
        player.isMelee = 1;
        player.aniCounter = 1;
        player.curFrame = 0;

        if (cheat) {
            destroyZombies();
        }

    }

    if ((!(~(oldButtons) & ((1 << 9))) && (~buttons & ((1 << 9)))) && player.isReloading != 1 && player.isMelee != 1) {
        changeWeapon();
    }

    if ((!(~(oldButtons) & ((1 << 8))) && (~buttons & ((1 << 8)))) && player.isReloading != 1 && player.isMelee != 1 && (weapon == pistol || weapon == rifle) ) {

        if (weapon == pistol) {

            if (pistolAmmo > 0) {
                playerShoot();
                playSoundB(pistolFire_data, pistolFire_length, 0);

            } else {playSoundB(pistolClick_data, pistolClick_length, 0);}

        } else {

            if (rifleAmmo > 0) {
                playerShoot();
                playSoundB(rifleShot_data, rifleShot_length, 0);

            } else {playSoundB(rifleClick_data, rifleClick_length, 0);}
        }
    }

    movePlayer();
    playerState();
    playerReload();
    playerMelee();
    healthRegen();

}





void shadowPlayer() {

    shadowOAM[0].attr0 = (player.row - vOff) | (0 << 14) | (1 << 8);
    shadowOAM[0].attr1 = (player.col - hOff) | direction | (1 << 14);
    shadowOAM[0].attr2 = ((0) << 12) | (((player.curFrame * 2))*32 + ((2 * player.aniState)));

}


void movePlayer() {

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, player.cdel, -player.rdel)) {
            player.row -= player.rdel;
            player.col += player.cdel;
        }

        screenOffset();
        direction = (1 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, player.cdel, player.rdel)) {
            player.row += player.rdel;
            player.col += player.cdel;
        }

        screenOffset();
        direction = (3 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, -player.cdel, -player.rdel)) {
            player.row -= player.rdel;
            player.col -= player.cdel;
        }

        screenOffset();
        direction = (7 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, -player.cdel, player.rdel)) {
            player.row += player.rdel;
            player.col -= player.cdel;
        }

        screenOffset();
        direction = (5 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, 0, -player.rdel)) {
            player.row -= player.rdel;
        }

        screenOffset();
        direction = (0 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, player.cdel, 0)) {
            player.col += player.cdel;
        }

        screenOffset();
        direction = (2 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, 0, player.rdel)) {
            player.row += player.rdel;
        }

        screenOffset();
        direction = (4 << 9);

    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        if (playerCollision() && collisionCheck(collisionMap, 512, player.col, player.row, player.width, player.height, -player.cdel, 0)) {
            player.col -= player.cdel;
        }

        screenOffset();
        direction = (6 << 9);
    }

    int current = collisionMap[((player.row + (player.height / 2)) * (512) + (player.col + (player.width / 2)))];
    if ( current == 1) {
        lost = 1;
    }

}

void playerState() {

    if (player.isReloading != 1 && player.isMelee != 1) {

        if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) || (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4))) || (~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) || (~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
            if (weapon == knife) {
                player.aniState = 1;
                player.numFrames = 16;

            } else if (weapon == pistol) {
                player.aniState = 5;
                player.numFrames = 5;

            } else {
                player.aniState = 7;
                player.numFrames = 5;
            }

        } else {
            if (weapon == knife) {
                player.aniState = 0;
                player.numFrames = 12;

            } else if (weapon == pistol) {
                player.aniState = 3;
                player.numFrames = 6;

            } else {
                player.aniState = 7;
                player.numFrames = 5;
            }
        }
    }

    if (player.aniCounter % frames == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }
    player.aniCounter++;
}

void playerReload() {

    if (weapon == pistol && player.isReloading ) {
        frames = 10;
        player.aniState = 6;
        player.numFrames = 11;

        if (player.curFrame == 11 - 1) {
            player.aniState = 3;
            player.numFrames = 6;
            player.curFrame = 0;
            player.isReloading = 0;
            frames = 20;

            reloadLogic();

        }

    } else if (weapon == rifle && player.isReloading ) {
        frames = 20;
        player.aniState = 10;
        player.numFrames = 7;

        if (player.curFrame == 7 - 1) {
            player.aniState = 7;
            player.numFrames = 5;
            player.curFrame = 0;
            player.isReloading = 0;
            frames = 20;

            reloadLogic();
        }

    }
}

void reloadLogic() {

    if (weapon == pistol) {

        if (pistolAmmo == 0) {

            if (pistolStockPile <= 12) {
                pistolAmmo = pistolStockPile;
                pistolStockPile = 0;

            } else {
                pistolAmmo = 12;
                pistolStockPile = pistolStockPile - 12;
            }

        } else {
            int bulletsNeed = 12 - pistolAmmo;

            if (pistolStockPile > bulletsNeed) {
                pistolAmmo = 12;
                pistolStockPile = pistolStockPile - bulletsNeed;

            } else {
                pistolAmmo = pistolAmmo + pistolStockPile;
                pistolStockPile = 0;
            }
        }

    } else {

        if (rifleAmmo == 0) {

            if (rifleStockPile <= 30) {
                rifleAmmo = rifleStockPile;
                rifleStockPile = 0;

            } else {
                rifleAmmo = 30;
                rifleStockPile = rifleStockPile - 30;
            }

        } else {
            int bulletsNeed = 30 - rifleAmmo;

            if (rifleStockPile > bulletsNeed) {
                rifleAmmo = 30;
                rifleStockPile = rifleStockPile - bulletsNeed;

            } else {
                rifleAmmo = rifleAmmo + rifleStockPile;
                rifleStockPile = 0;
            }
        }

    }
}

void playerMelee() {

    if (weapon == pistol && player.isMelee) {
        frames = 5;
        player.aniState = 4;
        player.numFrames = 9;

        if (player.curFrame == 4) {
            playerCheckMeleeSuccess();
        }

        if (player.curFrame == 9 - 1) {
            player.aniState = 3;
            player.numFrames = 6;
            player.curFrame = 0;
            player.isMelee = 0;
            frames = 20;

        }

    } else if (weapon == rifle && player.isMelee) {
        frames = 5;
        player.aniState = 8;
        player.numFrames = 12;

        if (player.curFrame == 7) {
            playerCheckMeleeSuccess();
        }

        if (player.curFrame == 12 - 1) {
            player.aniState = 7;
            player.numFrames = 5;
            player.curFrame = 0;
            player.isMelee = 0;
            frames = 20;
        }

    } else if (weapon == knife && player.isMelee) {
        frames = 5;
        player.aniState = 2;
        player.numFrames = 15;

        if (player.curFrame == 8) {
            playerCheckMeleeSuccess();

        }

        if (player.curFrame == 15 - 1) {
            player.aniState = 0;
            player.numFrames = 12;
            player.curFrame = 0;
            player.isMelee = 0;
            frames = 20;
        }
    }
}

void changeWeapon() {
    if (weapon == knife) {
        if (pistolFound) {
            weapon = pistol;
            player.aniState = 3;
            player.numFrames = 6;
            player.curFrame = 0;
            playSoundB(pistolClick_data, pistolClick_length, 0);

        } else if (rifleFound) {
            weapon = rifle;
            player.aniState = 7;
            player.numFrames = 5;
            player.curFrame = 0;
            playSoundB(rifleClick_data, rifleClick_length, 0);
        }


    } else if (weapon == pistol) {
        if (rifleFound) {
            weapon = rifle;
            player.aniState = 7;
            player.numFrames = 5;
            player.curFrame = 0;
            playSoundB(rifleClick_data, rifleClick_length, 0);

        } else {
            weapon = knife;
            player.aniState = 0;
            player.numFrames = 12;
            player.curFrame = 0;
        }

    } else if (weapon == rifle) {
        weapon = knife;
        player.aniState = 0;
        player.numFrames = 12;
        player.curFrame = 0;
    }
}

void playerShoot() {

    for (int i = 0; i < 30; i++) {
        if (!bullets[i].active) {
            BULLET* ptr = &bullets[i];
            orientateBullets(ptr);
            break;
        }
    }

    if (weapon == pistol) {
        pistolAmmo--;

    } else {rifleAmmo--;}

}

void playerCheckMeleeSuccess() {
    ZOMBIE* zombie;
    for (int i = 0; i < 10; i++) {
        zombie = &zombies[i];

        if (zombie->active && proximityHelper(zombie)) {
            decrementZombieHealth(zombie);
        }
    }

    for (int i = 0; i < 5; i++) {
        zombie = &bosses[i];

        if (zombie->active && proximityHelper(zombie)) {
            decrementZombieHealth(zombie);
        }
    }
}

void healthRegen() {
    if (player.health < 100) {

        if (player.isHit) {
            player.healthRegenBuffer--;

        } else {
            player.health++;
        }


        if (player.healthRegenBuffer == 0) {
            player.isHit = 0;
            player.healthRegenBuffer = 150;
        }
    }
}






 void initBullets() {

    for (int i = 0; i < 30; i++) {
        BULLET temp = {.width = 5, .height = 8, .row = 100, .col = 100, .active = 0, .cdel = 2, .rdel = 2};
        bullets[i] = temp;
    }
}

void updateBullets() {

    BULLET* bullet;
    for (int i = 0; i < 30; i++) {
        bullet = &bullets[i];

        if (bullet->active) {
            moveBullets(bullet);
        }
    }
    bulletCollision();

}

void moveBullets(BULLET * bullet) {
    bullet->row += bullet->rdel;
    bullet->col += bullet->cdel;

    if (bullet->row < 0 || bullet->row + bullet->height > 159 || bullet->col < 0 || bullet->col + bullet->width > 239) {
        bullet->active = 0;
    }
}

void orientateBullets(BULLET * bullet) {
    bullet->active = 1;

    if (direction == (0 << 9)) {
        bullet->direction = (0 << 9);
        bullet->rdel = -10;
        bullet->cdel = 0;

        if (weapon == rifle) {
            bullet->row = player.row - 6 - vOff;
            bullet->col = player.col + 9 - hOff;
            bullet->gunFired = rifle;

        } else {
            bullet->row = player.row - 8 - vOff;
            bullet->col = player.col + 8 - hOff;
            bullet->gunFired = pistol;
        }

    } else if (direction == (1 << 9)) {
        bullet->direction = (1 << 9);
        bullet->cdel = 10;
        bullet->rdel = -10;

        if (weapon == rifle) {
            bullet->col = player.col + player.width - 2 - hOff;
            bullet->row = player.row - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col + player.width - 2 - hOff;
            bullet->row = player.row - vOff;
            bullet->gunFired = pistol;
        }

    } else if (direction == (2 << 9)) {
        bullet->direction = (2 << 9);
        bullet->cdel = 10;
        bullet->rdel = 0;

        if (weapon == rifle) {
            bullet->col = player.col + player.width - hOff;
            bullet->row = player.row + 9 - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col + player.width - hOff;
            bullet->row = player.row + 8 - vOff;
            bullet->gunFired = pistol;
        }

    } else if (direction == (3 << 9)) {
        bullet->direction = (3 << 9);
        bullet->cdel = 10;
        bullet->rdel = 10;

        if (weapon == rifle) {
            bullet->col = player.col + 8 - hOff;
            bullet->row = player.row + 14 - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col + 10 - hOff;
            bullet->row = player.row + 14 - vOff;
            bullet->gunFired = pistol;
        }

    } else if (direction == (4 << 9)) {
        bullet->direction = (4 << 9);
        bullet->cdel = 0;
        bullet->rdel = 10;

        if (weapon == rifle) {
            bullet->col = player.col - 1 - hOff;
            bullet->row = player.row + player.height - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col - hOff;
            bullet->row = player.row + player.height - vOff;
            bullet->gunFired = pistol;
        }

    } else if (direction == (5 << 9)) {
        bullet->direction = (5 << 9);
        bullet->cdel = -10;
        bullet->rdel = 10;

        if (weapon == rifle) {
            bullet->col = player.col - 9 - hOff;
            bullet->row = player.row + player.height - 6 - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col - 8 - hOff;
            bullet->row = player.row + player.height - 5 - vOff;
            bullet->gunFired = pistol;
        }

    } else if (direction == (6 << 9)) {
        bullet->direction = (6 << 9);
        bullet->cdel = -10;
        bullet->rdel = 0;

        if (weapon == rifle) {
            bullet->col = player.col - 5 - hOff;
            bullet->row = player.row - 1 - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col - 8 - hOff;
            bullet->row = player.row - 1 - vOff;
            bullet->gunFired = pistol;
        }

    } else {
        bullet->direction = (7 << 9);
        bullet->cdel = -10;
        bullet->rdel = -10;

        if (weapon == rifle) {
            bullet->col = player.col - 1 - hOff;
            bullet->row = player.row - 6 - vOff;
            bullet->gunFired = rifle;

        } else {
            bullet->col = player.col - hOff;
            bullet->row = player.row - 5 - vOff;
            bullet->gunFired = pistol;
        }
    }
}

void shadowBullets() {
    BULLET* bullet;
    for (int i = 0; i < 30; i++) {
        bullet = &bullets[i];

        if (bullet->active) {
            shadowOAM[i + 10 + 5 + 1].attr0 = bullet->row | (0 << 14) | (1 << 8);
            shadowOAM[i + 10 + 5 + 1].attr1 = bullet->col | bullet->direction | (0 << 14);
            shadowOAM[i + 10 + 5 + 1].attr2 = ((3) << 12) | ((0)*32 + (30));

        } else {
             shadowOAM[i + 10 + 5 + 1].attr0 = bullet->row | (0 << 14) | (2 << 8);
        }
    }
}

void bulletCollision() {
    BULLET* bullet;
    ZOMBIE* zombie;

    for (int i = 0; i < 30; i++) {
        bullet = &bullets[i];

        if (bullet->active) {

            for (int j = 0; j < 10; j++) {
                zombie = &zombies[j];

                if (zombie->active && collision(bullet->col + 2, bullet->row + 2, 4, 4, zombie->col - hOff, zombie->row - vOff, zombie->width, zombie->height)) {
                    zombie->shotBy = bullet->gunFired;
                    bullet->active = 0;
                    decrementZombieHealth(zombie);
                }
            }

            for (int k = 0; k < 5; k++) {
                zombie = &bosses[k];

                if (zombie->active && collision(bullet->col + 2, bullet->row + 2, 4, 4, zombie->col, zombie->row, zombie->width, zombie->height)) {
                    zombie->shotBy = bullet->gunFired;
                    bullet->active = 0;
                    decrementZombieHealth(zombie);
                }
            }
        }
    }
}

int playerCollision() {
    ZOMBIE* zombie;


if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }

    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width, zombie->height)) {
                    return 0;
                }
            }
        }
    }


    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }


    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && (~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row - 1, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row - 1, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }



    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }

    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width, zombie->height)) {
                    return 0;
                }
            }
        }
    }


    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }


    else if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        for (int i = 0; i < 10; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }

        }

        for (int i = 0; i < 5; i++) {
            zombie = &bosses[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }

    return 1;
}

void screenOffset() {

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6)))) {

        if ( (vOff - 1 >= 0) && ( (player.row - vOff) <= (160 / 2))) {

            vOff-= player.rdel;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7)))) {

        if ((vOff + 160) < 512 && ( (player.row - vOff) >= (160 / 2))) {

            vOff+= player.rdel;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {

        if ((hOff - 1 >= 0) && ( (player.col - hOff) <= (240 / 2))) {

            hOff-= player.cdel;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {

        if ((hOff + 240) < 512 && ( (player.col - hOff) >= (240 / 2))) {

            hOff+= player.cdel;
        }
    }
}
