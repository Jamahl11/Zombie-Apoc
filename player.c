#include "player.h"
#include "game.h"
#include "mode0.h"
#include "zombie.h"
#include "print.h"
#include "sound.h"

//GUN SOUNDS
#include "pistolFire.h"
#include "pistolReload.h"
#include "pistolClick.h"
#include "rifleShot.h"
#include "rifleReload.h"
#include "rifleClick.h"
#include "collisionMap.h"

PLAYER player;
BULLET bullets[BULLETCOUNT];

u16 direction;
int frames = defaultFrames;


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

int rifleCol = 336;    ///336
int rifleRow = 72;     ///72

int rifleCol;
int rifleRow;

unsigned char * collisionMap = (unsigned char*) collisionMapBitmap;




void initPlayer() {
    player.row = SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.col = SCREENWIDTH / 2 - player.height / 2 + hOff;
    player.height = 16;
    player.width = 16;
    player.rdel = 1;
    player.cdel = 1;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = knifeMoveFrames;
    player.aniState = knifeIdle;
    player.bulletTimer = 15;
    player.isReloading = 0;
    player.isMelee = 0;
    player.health = 100;
    player.isHit = 0;
    player.healthRegenBuffer = 150;

}

void updatePlayer() {
    
    if (BUTTON_PRESSED(BUTTON_A) && player.isMelee != 1 && player.isReloading != 1 && weapon != knife) {
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

        
        

        // if (weapon == pistol) { playSoundB(pistolReload_data, pistolReload_length, 0); }
        // else { playSoundB(rifleReload_data, rifleReload_length, 0); }
        

    }

    if (BUTTON_PRESSED(BUTTON_B) && player.isReloading != 1 && player.isMelee != 1) {
        player.isMelee = 1;
        player.aniCounter = 1;
        player.curFrame = 0;

        if (cheat) {
            destroyZombies();
        }
        
    }

    if (BUTTON_PRESSED(BUTTON_L) && player.isReloading != 1 && player.isMelee != 1) {
        changeWeapon();
    }

    if (BUTTON_PRESSED(BUTTON_R) && player.isReloading != 1 && player.isMelee != 1 && (weapon == pistol || weapon == rifle) ) {

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

    shadowOAM[0].attr0 = (player.row - vOff) | ATTR0_SQUARE | ATTR0_AFFINE;
    shadowOAM[0].attr1 = (player.col - hOff) | direction | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID((2 * player.aniState), (player.curFrame * 2));

}


void movePlayer() {
    
    if (BUTTON_HELD(BUTTON_UP) && BUTTON_HELD(BUTTON_RIGHT)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, player.cdel, -player.rdel)) {
            player.row -= player.rdel;
            player.col += player.cdel;
        }

        screenOffset();
        direction = NORTHEAST;

    } else if (BUTTON_HELD(BUTTON_DOWN) && BUTTON_HELD(BUTTON_RIGHT)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, player.cdel, player.rdel)) {
            player.row += player.rdel;
            player.col += player.cdel;
        }

        screenOffset();
        direction = SOUTHEAST;

    } else if (BUTTON_HELD(BUTTON_UP) && BUTTON_HELD(BUTTON_LEFT)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, -player.cdel, -player.rdel)) {
            player.row -= player.rdel;
            player.col -= player.cdel;
        }
        
        screenOffset();
        direction = NORTHWEST;

    } else if (BUTTON_HELD(BUTTON_DOWN) && BUTTON_HELD(BUTTON_LEFT)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, -player.cdel, player.rdel)) {
            player.row += player.rdel;
            player.col -= player.cdel;
        }
        
        screenOffset();
        direction = SOUTHWEST;

    } else if (BUTTON_HELD(BUTTON_UP)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, 0, -player.rdel)) {
            player.row -= player.rdel;
        }
        
        screenOffset();
        direction = NORTH;

    } else if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, player.cdel, 0)) {
            player.col += player.cdel;
        }
        
        screenOffset();
        direction = EAST;

    } else if (BUTTON_HELD(BUTTON_DOWN)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, 0, player.rdel)) {
            player.row += player.rdel;
        }
        
        screenOffset();
        direction = SOUTH;

    } else if (BUTTON_HELD(BUTTON_LEFT)) {
        if (playerCollision() && collisionCheck(collisionMap, MAPWIDTH, player.col, player.row, player.width, player.height, -player.cdel, 0)) {
            player.col -= player.cdel;
        }
        
        screenOffset();
        direction = WEST;
    }

    int current = collisionMap[OFFSET(player.col + (player.width / 2), player.row + (player.height / 2), MAPWIDTH)];
    if ( current == 1) {
        lost = 1;
    }
    
}

void playerState() {

    if (player.isReloading != 1 && player.isMelee != 1) {

        if (BUTTON_HELD(BUTTON_UP) || BUTTON_HELD(BUTTON_RIGHT) || BUTTON_HELD(BUTTON_DOWN) || BUTTON_HELD(BUTTON_LEFT)) {
            if (weapon == knife) {
                player.aniState = knifeMove;
                player.numFrames = knifeMoveFrames;

            } else if (weapon == pistol) {
                player.aniState = pistolMove;
                player.numFrames = pistolMoveFrames;

            } else {
                player.aniState = rifleIdle;                    //// currently rifle move frames a little wonkie lol and the look basically the same
                player.numFrames = rifleIdleFrames;
            }

        } else {
            if (weapon == knife) {
                player.aniState = knifeIdle;
                player.numFrames = knifeIdleFrames;

            } else if (weapon == pistol) {
                player.aniState = pistolIdle;
                player.numFrames = pistolIdleFrames;

            } else {
                player.aniState = rifleIdle;
                player.numFrames = rifleIdleFrames;
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
        frames = pistolReloadTime;
        player.aniState = pistolReload;
        player.numFrames = pistolReloadFrames;

        if (player.curFrame == pistolReloadFrames - 1) {
            player.aniState = pistolIdle;
            player.numFrames = pistolIdleFrames;
            player.curFrame = 0;
            player.isReloading = 0;
            frames = defaultFrames;
            
            reloadLogic();

        }

    } else if (weapon == rifle && player.isReloading ) {
        frames = reloadFrames;
        player.aniState = rifleReload;
        player.numFrames = rifleReloadFrames;

        if (player.curFrame == rifleReloadFrames - 1) {
            player.aniState = rifleIdle;
            player.numFrames = rifleIdleFrames;
            player.curFrame = 0;
            player.isReloading = 0;
            frames = defaultFrames;

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
        frames = meleeFrames;
        player.aniState = pistolMelee;
        player.numFrames = pistolMeleeFrames;

        if (player.curFrame == 4) {
            playerCheckMeleeSuccess();
        }

        if (player.curFrame == pistolMeleeFrames - 1) {
            player.aniState = pistolIdle;
            player.numFrames = pistolIdleFrames;
            player.curFrame = 0;
            player.isMelee = 0;
            frames = defaultFrames;

        }

    } else if (weapon == rifle && player.isMelee) {
        frames = meleeFrames;
        player.aniState = rifleMelee;
        player.numFrames = rifleMeleeFrames;

        if (player.curFrame == 7) {
            playerCheckMeleeSuccess();
        }

        if (player.curFrame == rifleMeleeFrames - 1) {
            player.aniState = rifleIdle;
            player.numFrames = rifleIdleFrames;
            player.curFrame = 0;
            player.isMelee = 0;
            frames = defaultFrames;
        }

    } else if (weapon == knife && player.isMelee) {
        frames = meleeFrames;
        player.aniState = knifeMelee;
        player.numFrames = knifeMeleeFrames;

        if (player.curFrame == 8) {
            playerCheckMeleeSuccess();
            
        }

        if (player.curFrame == knifeMeleeFrames - 1) {
            player.aniState = knifeIdle;
            player.numFrames = knifeIdleFrames;
            player.curFrame = 0;
            player.isMelee = 0;
            frames = defaultFrames;
        }
    }
}

void changeWeapon() {
    if (weapon == knife) {                                  ////add pistol and rifle unlocked variables
        if (pistolFound) {
            weapon = pistol;
            player.aniState = pistolIdle;
            player.numFrames = pistolIdleFrames;
            player.curFrame = 0;
            playSoundB(pistolClick_data, pistolClick_length, 0);

        } else if (rifleFound) {
            weapon = rifle;
            player.aniState = rifleIdle;
            player.numFrames = rifleIdleFrames;
            player.curFrame = 0;
            playSoundB(rifleClick_data, rifleClick_length, 0);
        }
        

    } else if (weapon == pistol) {
        if (rifleFound) {
            weapon = rifle;
            player.aniState = rifleIdle;
            player.numFrames = rifleIdleFrames;
            player.curFrame = 0;
            playSoundB(rifleClick_data, rifleClick_length, 0);

        } else {
            weapon = knife;
            player.aniState = knifeIdle;
            player.numFrames = knifeIdleFrames;
            player.curFrame = 0;
        }
        
    } else if (weapon == rifle) {
        weapon = knife;
        player.aniState = knifeIdle;
        player.numFrames = knifeIdleFrames;
        player.curFrame = 0;
    }
}

void playerShoot() {

    for (int i = 0; i < BULLETCOUNT; i++) {
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
    for (int i = 0; i < maxZombies; i++) {
        zombie = &zombies[i];
        //mgba_printf("we reached here.");
        if (zombie->active && proximityHelper(zombie)) {
            decrementZombieHealth(zombie);
        }
    }

    for (int i = 0; i < maxBosses; i++) {
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


//////// PLAYER DECREMENT HEALTH METHOD IS IN ZOMBIE C FILE BECAUSE IT TAKES ZOMBIE PARAMETER//////////////////

// -------------------------------------------------    BULLET METHODS -------------------------------------------------------------

 void initBullets() {

    for (int i = 0; i < BULLETCOUNT; i++) {
        BULLET temp = {.width = 5, .height = 8, .row = 100, .col = 100, .active = 0, .cdel = 2, .rdel = 2};
        bullets[i] = temp;
    }
}

void updateBullets() {
    
    BULLET* bullet;
    for (int i = 0; i < BULLETCOUNT; i++) {
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

    if (direction == NORTH) {
        bullet->direction = NORTH;
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

    } else if (direction == NORTHEAST) {
        bullet->direction = NORTHEAST;
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

    } else if (direction == EAST) {
        bullet->direction = EAST;
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

    } else if (direction == SOUTHEAST) {
        bullet->direction = SOUTHEAST;
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

    } else if (direction == SOUTH) {
        bullet->direction = SOUTH;
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

    } else if (direction == SOUTHWEST) {
        bullet->direction = SOUTHWEST;
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

    } else if (direction == WEST) {
        bullet->direction = WEST;
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
        bullet->direction = NORTHWEST;
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
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullet = &bullets[i];

        if (bullet->active) {
            shadowOAM[i + maxZombies + maxBosses + 1].attr0 = bullet->row | ATTR0_SQUARE | ATTR0_AFFINE;
            shadowOAM[i + maxZombies + maxBosses + 1].attr1 = bullet->col | bullet->direction | ATTR1_TINY;
            shadowOAM[i + maxZombies + maxBosses + 1].attr2 = ATTR2_PALROW(3) | ATTR2_TILEID(30, 0);

        } else {
             shadowOAM[i + maxZombies + maxBosses + 1].attr0 = bullet->row | ATTR0_SQUARE | ATTR0_HIDE;
        }
    }
}

void bulletCollision() {
    BULLET* bullet;
    ZOMBIE* zombie;

    for (int i = 0; i < BULLETCOUNT; i++) {
        bullet = &bullets[i];

        if (bullet->active) {

            for (int j = 0; j < maxZombies; j++) {
                zombie = &zombies[j];

                if (zombie->active && collision(bullet->col + 2, bullet->row + 2, 4, 4, zombie->col - hOff, zombie->row - vOff, zombie->width, zombie->height)) {
                    zombie->shotBy = bullet->gunFired;
                    bullet->active = 0;
                    decrementZombieHealth(zombie);
                }
            }

            for (int k = 0; k < maxBosses; k++) {
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

//////CHECKS IF PLAYER CAN MOVE UP AND RIGHT
if (BUTTON_HELD(BUTTON_UP) && BUTTON_HELD(BUTTON_RIGHT)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col + 1, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }
//////CHECKS IF PLAYER CAN MOVE DOWN AND RIGHT
    else if (BUTTON_HELD(BUTTON_DOWN) && BUTTON_HELD(BUTTON_RIGHT)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col + 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width, zombie->height)) {
                    return 0;
                }
            }
        }
    }

//////CHECKS IF PLAYER CAN MOVE DOWN AND LEFT
    else if (BUTTON_HELD(BUTTON_DOWN) && BUTTON_HELD(BUTTON_LEFT)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col - 1, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }

//////CHECKS IF PLAYER CAN MOVE UP AND LEFT
    else if (BUTTON_HELD(BUTTON_UP) && BUTTON_HELD(BUTTON_LEFT)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row - 1, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col - 1, player.row - 1, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }


//////CHECKS IF PLAYER CAN MOVE UP
    else if (BUTTON_HELD(BUTTON_UP)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col, player.row - 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }
//////CHECKS IF PLAYER CAN MOVE RIGHT
    else if (BUTTON_HELD(BUTTON_RIGHT)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col + 1, player.row, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col + 1, player.row, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width, zombie->height)) {
                    return 0;
                }
            }
        }
    }

//////CHECKS IF PLAYER CAN MOVE DOWN
    else if (BUTTON_HELD(BUTTON_DOWN)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
            zombie = &bosses[i];
            
            if (zombie->active) {
                if (collision(player.col, player.row + 1, player.width - 8, player.height - 8, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        }
    }

//////CHECKS IF PLAYER CAN MOVE LEFT
    else if (BUTTON_HELD(BUTTON_LEFT)) {
        for (int i = 0; i < maxZombies; i++) {
            zombie = &zombies[i];

            if (zombie->active) {
                if (collision(player.col - 1, player.row, player.width - 4, player.height - 4, zombie->col, zombie->row, zombie->width - 4, zombie->height - 4)) {
                    return 0;
                }
            }
        
        }

        for (int i = 0; i < maxBosses; i++) {
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

    if (BUTTON_HELD(BUTTON_UP)) {

        if ( (vOff - 1 >= 0) && ( (player.row - vOff) <= (SCREENHEIGHT / 2))) {
                
            vOff-= player.rdel;
        }
    } 

    if (BUTTON_HELD(BUTTON_DOWN)) {

        if ((vOff + SCREENHEIGHT) < MAPHEIGHT && ( (player.row - vOff) >= (SCREENHEIGHT / 2))) {

            vOff+= player.rdel;
        }
    }
    
    if (BUTTON_HELD(BUTTON_LEFT)) {

        if ((hOff - 1 >= 0) && ( (player.col - hOff) <= (SCREENWIDTH / 2))) {

            hOff-= player.cdel;
        }
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {

        if ((hOff + SCREENWIDTH) < MAPWIDTH && ( (player.col - hOff) >= (SCREENWIDTH / 2))) {

            hOff+= player.cdel;
        }
    }
}


