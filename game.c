#include "player.h"
#include "game.h"
#include "zombie.h"
#include "introMusic.h"
#include "gameMusic.h"
#include "sound.h"
#include "print.h"
#include <stdlib.h>

OBJ_AFFINE *SHADOW_OAM_AFF = (OBJ_AFFINE*) shadowOAM;

int knifeDamage = 50;
int pistolDamage = 15;
int rifleDamage = 20;
int zombieDamage = 5;

int score = 0;
int lost = 0;

int seconds;
int minutes;
int pistolUnlocked;
int rifleUnlocked;

int pistolRandTimer;
int rifleRandTimer;

int pistolTimerActive;
int rifleTimerActive;

int pistolAmmoSpawned;
int rifleAmmoSpawned;

int pistolAmmoCol;
int pistolAmmoRow;

int rifleAmmoCol;
int rifleAmmoRow;

int zombieStartHealth;
int bossStartHealth;

int check = 1;

int buffer = 15;

void initGame() {

    hOff = 0;
    vOff = 0;

    seconds = 0;
    minutes = 0;
    pistolUnlocked = 0;
    rifleUnlocked = 0;

    pistolAmmo = 0;
    pistolStockPile = 0;

    rifleAmmo = 0;
    rifleStockPile = 0;

    pistolFound = 0;
    rifleFound = 0;

    pistolActive = 0;
    rifleActive = 0;

    pistolAmmoSpawned = 0;
    rifleAmmoSpawned = 0;

    activeBosses = 0;
    activeZombies = 0;

    

    initPlayer();
    initZombies();
    initDirections();
    initBullets();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    
}

void updateGame() {
    updatePlayer();
    updateZombies();
    updateBullets();

    timedEvents();
    equipPistol();
    equipRifle();

    if (pistolFound) {
        pistolAmmoSpawn();
    }

    if (rifleFound) {
        rifleAmmoSpawn();
    }

    pistolAmmoCollision();
    rifleAmmoCollision();
    

    if (player.health <= 0) {
        lost = 1;
    }
    
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    REG_BG1HOFF = hOff / 2;
    REG_BG1VOFF = vOff / 2;

    

}

void shadowGame() {
    shadowPlayer();
    shadowZombies();
    shadowBullets();
    userInterface();

    shadowPistolAmmo();
    shadowRifleAmmo();

    // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr0 = 50 | ATTR0_SQUARE | ATTR0_REGULAR;
    // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr1 = 50 | ATTR1_TINY;
    // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr2 = ATTR2_PALROW(8) | ATTR2_TILEID(7, 29);

    // if (check) {

    //     shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr0 = (50 - vOff) | ATTR0_WIDE | ATTR0_REGULAR;
    //     shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr1 = (50 - hOff) | ATTR1_MEDIUM;
    //     shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(11, 25);
    // }
    
}


void initDirections() {
    //NORTH
    SHADOW_OAM_AFF[0].a = 0;                         // [cos        -sin]
    SHADOW_OAM_AFF[0].b = -255;                      // [sin         cos]
    SHADOW_OAM_AFF[0].c = 255;
    SHADOW_OAM_AFF[0].d = 0;

    //NORTHEAST
    SHADOW_OAM_AFF[1].a = 181;
    SHADOW_OAM_AFF[1].b = -181;
    SHADOW_OAM_AFF[1].c = 181;
    SHADOW_OAM_AFF[1].d = 181;

    // EAST
    SHADOW_OAM_AFF[2].a = 255;
    SHADOW_OAM_AFF[2].b = 0;
    SHADOW_OAM_AFF[2].c = 0;
    SHADOW_OAM_AFF[2].d = 255;

    //SOUTHEAST
    SHADOW_OAM_AFF[3].a = 181;
    SHADOW_OAM_AFF[3].b = 181;
    SHADOW_OAM_AFF[3].c = -181;
    SHADOW_OAM_AFF[3].d = 181;

    //SOUTH
    SHADOW_OAM_AFF[4].a = 0;
    SHADOW_OAM_AFF[4].b = 255;
    SHADOW_OAM_AFF[4].c = -255;
    SHADOW_OAM_AFF[4].d = 0;

    //SOUTHWEST
    SHADOW_OAM_AFF[5].a = -181;
    SHADOW_OAM_AFF[5].b = 181;
    SHADOW_OAM_AFF[5].c = -181;
    SHADOW_OAM_AFF[5].d = -181;

    // WEST
    SHADOW_OAM_AFF[6].a = -255;
    SHADOW_OAM_AFF[6].b = 0;
    SHADOW_OAM_AFF[6].c = 0;
    SHADOW_OAM_AFF[6].d = -255;

    //NORTHWEST
    SHADOW_OAM_AFF[7].a = -181;
    SHADOW_OAM_AFF[7].b = -181;
    SHADOW_OAM_AFF[7].c = 181;
    SHADOW_OAM_AFF[7].d = -181;
}

///---------------------------------------------------- USER INTERFACE -------------------------------------------------------
void timedEvents() {
    if (seconds % buffer == 0 && activeZombies < maxZombies && zombieNotSpawned) {
        spawnZombie();
        zombieNotSpawned = 0;

    } else if (seconds % 15 != 0 ) { zombieNotSpawned = 1; }

    if (seconds >= 20) {
        
        if (!pistolFound) {
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr0 = (pistolRow - vOff) | ATTR0_WIDE | ATTR0_REGULAR;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr1 = (pistolCol - hOff) | ATTR1_MEDIUM;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr2 = ATTR2_PALROW(6) | ATTR2_TILEID(11, 25);

            pistolActive = 1;
            // mgba_printf("%d , %d", player.col, player.row);

        } else {
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr0 = (pistolRow - vOff) | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr1 = (pistolCol - hOff) | ATTR1_MEDIUM;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 10].attr2 = ATTR2_PALROW(6) | ATTR2_TILEID(11, 25);
        }    
    }

    if (seconds >= 40) {

        if (!rifleFound) {
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 11].attr0 = (rifleRow - vOff) | ATTR0_WIDE | ATTR0_REGULAR;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 11].attr1 = (rifleCol - hOff) | ATTR1_MEDIUM;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 11].attr2 = ATTR2_PALROW(7) | ATTR2_TILEID(15, 25);

            rifleActive = 1;
            // mgba_printf("%d , %d", player.col, player.row);

        } else {
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 11].attr0 = (rifleRow - vOff) | ATTR0_WIDE | ATTR0_HIDE;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 11].attr1 = (rifleCol - hOff) | ATTR1_MEDIUM;
            shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 11].attr2 = ATTR2_PALROW(7) | ATTR2_TILEID(15, 25);
        }

        if (seconds >= 10) {
            zombieStartHealth = 125;
            if (seconds % buffer == 0 && activeBosses < maxBosses && bossNotSpawned) {
                //spawnBossZombie();
                bossNotSpawned = 0;

            } else if (seconds % buffer != 0 ) { bossNotSpawned = 1; }

        }  

    }
}

void equipPistol() {
    // if (collision(player.col, player.row, player.width, player.height, pistolCol - hOff, pistolRow - vOff, 16, 16)) {
        
    // }


    if (collision(player.col, player.row, player.width, player.height, pistolCol, pistolRow, 32, 16) && pistolActive ) {
        pistolFound = 1;
        pistolAmmo = 12;
        pistolStockPile = 72;
        pistolActive = 0;
        // mgba_printf("collision is working.");
        // mgba_printf("hoff: %d, voff: %d", hOff, vOff);

    }
}

void equipRifle() {
    if (collision(player.col, player.row, player.width, player.height, rifleCol, rifleRow, 32, 16) && rifleActive ) {
        rifleFound = 1;
        rifleAmmo = 30;
        rifleStockPile = 72;
        rifleActive = 0;
        // mgba_printf("collision is working.");
        // mgba_printf("hoff: %d, voff: %d", hOff, vOff);

    }

}

void pistolAmmoSpawn() {
    if (pistolTimerActive) {
        pistolRandTimer--;

        if (pistolRandTimer == 0) {

            pistolTimerActive = 0;
            pistolAmmoCol = rand() % 492;
            pistolAmmoRow = rand() % 242;

            pistolAmmoSpawned = 1;
        }


    } else {
        if (!pistolAmmoSpawned) {
            pistolRandTimer = 250 + rand() % 500;
            pistolTimerActive = 1;
        }
        
    }
}

void shadowPistolAmmo() {

    if (pistolAmmoSpawned) {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr0 = (pistolAmmoRow - vOff) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr1 = (pistolAmmoCol - hOff) | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr2 = ATTR2_PALROW(8) | ATTR2_TILEID(7, 29);

    } else {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr0 = (pistolAmmoRow - vOff) | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr1 = (pistolAmmoCol - hOff) | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr2 = ATTR2_PALROW(8) | ATTR2_TILEID(7, 29);
    }
}

void pistolAmmoCollision() {
    if (pistolAmmoSpawned && collision(player.col, player.row, player.width, player.height, pistolAmmoCol, pistolAmmoRow, 8, 8)) {
        pistolAmmoSpawned = 0;
        pistolStockPile = pistolStockPile + 24;
    }
}

void rifleAmmoSpawn() {
    if (rifleTimerActive) {
        rifleRandTimer--;

        if (rifleRandTimer == 0) {

            rifleTimerActive = 0;
            rifleAmmoCol = rand() % 480;
            rifleAmmoRow = rand() % 230;

            rifleAmmoSpawned = 1;
        }


    } else {
        if (!rifleAmmoSpawned) {
            rifleRandTimer = 250 + rand() % 500;
            rifleTimerActive = 1;
        }
        
    }
}

void shadowRifleAmmo() {

    if (rifleAmmoSpawned) {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr0 = (rifleAmmoRow - vOff) | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr1 = (rifleAmmoCol - hOff) | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr2 = ATTR2_PALROW(8) | ATTR2_TILEID(7, 29);

    } else {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr0 = (rifleAmmoRow - vOff) | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr1 = (rifleAmmoCol - hOff) | ATTR1_SMALL;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 17].attr2 = ATTR2_PALROW(8) | ATTR2_TILEID(7, 29);
    }
}

void rifleAmmoCollision() {
    if (rifleAmmoSpawned && collision(player.col, player.row, player.width, player.height, rifleAmmoCol, rifleAmmoRow, 8, 8)) {
        rifleAmmoSpawned = 0;
        rifleStockPile = rifleStockPile + 60;
    }
}

//--------------------------------------------------------------------------------------------------------------------------------


///---------------------------------------------------- USER INTERFACE -------------------------------------------------------
void userInterface() {
    showScore();
    showHealth();
    showGun();
}

void showScore() {
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 1].attr0 = 2 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 1].attr1 = 230 | ATTR1_TINY;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 1].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, 0);

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr0 = 2 | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr1 = 225 | ATTR1_TINY;

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr0 = 2 | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr1 = 220 | ATTR1_TINY;

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr0 = 2 | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr1 = 215 | ATTR1_TINY;

    if ( score < 100) {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr0 = 2 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, score / 10);

    } else if (score < 1000) {
        
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr0 = 2 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (score / 10) % 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr0 = 2 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (score / 10) / 10);

        // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr0 = 2 | ATTR0_SQUARE | ATTR0_REGULAR;
        // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, ((score / 10) / 10) );

    }
}

void endScore() {

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 1].attr0 = 100 | ATTR0_SQUARE | ATTR0_REGULAR;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 1].attr1 = 230 | ATTR1_TINY;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 1].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, 0);

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr0 = 100 | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr1 = 225 | ATTR1_TINY;

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr0 = 100 | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr1 = 220 | ATTR1_TINY;

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr0 = 100 | ATTR0_SQUARE | ATTR0_HIDE;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr1 = 215 | ATTR1_TINY;

    if ( score < 100) {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr0 = 100 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, score / 10);

    } else if (score < 1000) {
        
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr0 = 100 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 2].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (score / 10) % 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr0 = 100 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 3].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (score / 10) / 10);

        // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr0 = 2 | ATTR0_SQUARE | ATTR0_REGULAR;
        // shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 4].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, ((score / 10) / 10) );

    }    
}

void showHealth() {

    if (player.health == 100) {

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 5].attr0 = 4 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 5].attr1 = 55 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 5].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, 1);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 6].attr0 = 4 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 6].attr1 = 60 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 6].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, 0);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 7].attr0 = 4 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 7].attr1 = 65 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 7].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, 0);

    } else {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 5].attr0 = 4 | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 5].attr1 = 55 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 5].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, 1);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 6].attr0 = 4 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 6].attr1 = 60 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 6].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, player.health / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 7].attr0 = 4 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 7].attr1 = 65 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 7].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, player.health % 10);
    }

    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 8].attr0 = 0 | ATTR0_WIDE | ATTR0_REGULAR;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 8].attr1 = 21 | ATTR1_MEDIUM;
    shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 8].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(7, 27);

    

}

void showGun() {
    
    if (weapon == knife) {
        
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr0 = 135 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr1 = 10 | ATTR1_MEDIUM;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr2 = ATTR2_PALROW(5) | ATTR2_TILEID(7, 25);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr0 = 140 | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr1 = 50 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolAmmo / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr0 = 140 | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr1 = 55 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolAmmo % 10);

        //STOCKPILE
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr0 = 140 | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr1 = 65 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (pistolStockPile / 10) / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr0 = 140 | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr1 = 70 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolStockPile / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr0 = 140 | ATTR0_SQUARE | ATTR0_HIDE;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr1 = 75 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolStockPile % 10);

    } else if (weapon == pistol) {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr0 = 135 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr1 = 10 | ATTR1_MEDIUM;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr2 = ATTR2_PALROW(6) | ATTR2_TILEID(11, 25);

        //AMMO
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr1 = 50 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolAmmo / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr1 = 55 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolAmmo % 10);

        //STOCKPILE
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr1 = 65 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (pistolStockPile / 10) / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr1 = 70 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (pistolStockPile / 10) % 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr1 = 75 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, pistolStockPile % 10);

        

    } else {
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr0 = 135 | ATTR0_WIDE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr1 = 10 | ATTR1_MEDIUM;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 9].attr2 = ATTR2_PALROW(7) | ATTR2_TILEID(15, 25);

        //AMMO
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr1 = 50 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 12].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, rifleAmmo / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr1 = 55 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 13].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, rifleAmmo % 10);

        //STOCKPILE
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr1 = 65 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 14].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (rifleStockPile / 10) / 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr1 = 70 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 15].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, (rifleStockPile / 10) % 10);

        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr0 = 140 | ATTR0_SQUARE | ATTR0_REGULAR;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr1 = 75 | ATTR1_TINY;
        shadowOAM[maxZombies + maxBosses + BULLETCOUNT + 16].attr2 = ATTR2_PALROW(4) | ATTR2_TILEID(31, rifleStockPile % 10);
    }
}
//--------------------------------------------------------------------------------------------------------------------------------

void setupInterrupts() {

	REG_IME = 0;


    REG_INTERRUPT = interruptHandler;
    
	REG_IME = 1;
    enableTimerInterrupts();
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
}

void interruptHandler() {

	REG_IME = 0;

	if(REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {

     
            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
                }
            }
        }

        if (soundB.isPlaying) {


            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = TIMER_OFF;
                }
            }
		}


		REG_IF |= INT_VBLANK;
	}

    if (REG_IF & INT_TM2) {
        seconds = (seconds + 1) % 60;
        
    }

    if (REG_IF & INT_TM3) {
        minutes++;
        
    }

    REG_IF = REG_IF;
	REG_IME = 1;
}

void enableTimerInterrupts(void) {
  REG_IE |=  INT_TM2 | INT_TM3;

  REG_TM2CNT = 0;
  REG_TM2D = (65536 - 16384);
  REG_TM2CNT |= TM_FREQ_1024 | TIMER_ON | TM_IRQ; 

//   REG_TM3CNT = 0;
//   REG_TM3D = (65536 - 60);
//   REG_TM3CNT |= TM_CASCADE | TIMER_ON | TM_IRQ;
}

