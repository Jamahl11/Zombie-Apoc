#include "zombie.h"
#include "player.h"
#include "game.h"
#include "mode0.h"
#include "print.h"
#include <stdlib.h>
#include <math.h>

int activeZombies;
int activeBosses;
int zombieNotSpawned = 1;
int bossNotSpawned = 1;

int zombieStarthealth = 100;

int bossStartHealth = 200;


ZOMBIE zombies[maxZombies];
ZOMBIE bosses[maxBosses];

void initZombies() {

    for (int i = 0; i < maxZombies; i++) {
        ZOMBIE temp = {.row = 25, .col = 122, .rdel = 1, .cdel = 1, .width = 16, .height = 16, .aniCounter = 0, .aniState = zombieMove, .curFrame = 0,
                            .numFrames = zombieMoveFrames, .isMelee = 0, .isBoss = 0, .frameSpeed = defaultFrames, .health = 100, .active = 0};
        
        // if (i < 1) {
        //     temp.active = 1;
        // }
        zombies[i] = temp;
    }

    for (int i = 0; i < maxBosses; i++) {
        ZOMBIE temp = {.row = 100, .col = 122, .rdel = 1, .cdel = 1, .width = 32, .height = 32, .aniCounter = 0, .aniState = bossMove, .curFrame = 0,
                            .numFrames = bossMoveFrames, .isMelee = 0, .isBoss = 1, .frameSpeed = defaultFrames, .health = 150};
        
        if (i < activeBosses) {
            temp.active = 1;
        }
        bosses[i] = temp;
    }

    activeZombies = 0;
    activeBosses = 0;
}

void updateZombies() {

    ZOMBIE* ptr;
    for (int i = 0; i < maxZombies; i++) {
        ptr = &zombies[i];

        if (ptr-> active) {
            moveZombies(ptr);
            zombieMelee(ptr);
        }
        
    }

    for (int i = 0; i < maxBosses; i++) {
        ptr = &bosses[i];
        
        if (ptr-> active) {
            moveZombies(ptr);
            zombieMelee(ptr);
        }
    }

    //mgba_printf("%d", seconds);
}

void moveZombies(ZOMBIE* zombie) {

    if (!zombie->isMelee) {
        if ((zombie->row + zombie->height) - player.row < 0) {                             //above player

            if (zombie->col - player.col < 0) {                                                 //above left
                zombie->row += zombie->rdel;
                zombie->col += zombie->cdel;
                zombie->direction = SOUTHEAST;


            } else if (zombie->col - player.col == 0) {                                         //above same col
                zombie->row += zombie->rdel;
                zombie->direction = SOUTH;

            } else {                                                                            //above right
                zombie->row += zombie->rdel;
                zombie->col -= zombie->cdel;
                zombie->direction = SOUTHWEST;
            }

        } else if (zombie->row - (player.row + player.height) > 0) {                        //below player

            if (zombie->col - player.col < 0) {                                                 //below left
                zombie->row -= zombie->rdel;
                zombie->col += zombie->cdel;
                zombie->direction = NORTHEAST;

            } else if (zombie->col - player.col == 0) {                                         //below same col
                zombie->row -= zombie->rdel;
                zombie->direction = NORTH;

            } else {                                                                            //below right
                zombie->row -= zombie->rdel;
                zombie->col -= zombie->cdel;
                zombie->direction = NORTHWEST;
            }

        } else {                                                                            //same row as player
            
            if ((zombie->col + zombie->width) - player.col < 0) {                               //same row left
                zombie->col += zombie->cdel;
                zombie->direction = EAST;

            } else if (zombie->col - (player.col + player.width) > 0) {                         //same row right
                zombie->col -= zombie->cdel;
                zombie->direction = WEST;

            } else {                                                                        //if a zombie makes it to this step it means it cannot get any closer to the player, in this case we want to orientate the zombie to correctly face the player
                orientateZombie(zombie);
                if (zombie->isBoss) {
                    zombie->curFrame = bossAttackStart;

                } else {
                    zombie->curFrame = 0;
                }
                zombie->aniCounter = 1;
                zombie->isMelee = 1;
            } 
        }
    }

    if (zombie->aniCounter % zombie->frameSpeed == 0) {
        zombie->curFrame = (zombie->curFrame + 1) % zombie->numFrames;
    }
    zombie->aniCounter++;

    

}

void orientateZombie(ZOMBIE* zombie) {
    if (zombie->row - player.row < 0) {

        if (zombie->col - player.col < 0) {
            zombie->direction = SOUTHEAST;

        } else if (zombie->col - player.col == 0) {
            zombie->direction = SOUTH;

        } else {
            zombie->direction = SOUTHWEST;
        }

    } else if (zombie->row - player.row == 0) {

        if (zombie->col - player.col < 0) {
            zombie->direction = EAST;

        } else {
            zombie->direction = WEST;
        }

    } else {

        if (zombie->col - player.col < 0) {
            zombie->direction = NORTHEAST;

        } else if (zombie->col - player.col == 0) {
            zombie->direction = NORTH;
            
        } else {
            zombie->direction = NORTHWEST;
        }
    }
}

void zombieMelee(ZOMBIE* zombie) {
    if (zombie->isMelee) {
        if (!zombie->isBoss) {
            zombie->frameSpeed = meleeFrames;
            zombie->aniState = zombieAttack;
            zombie->numFrames = zombieAttackFrames;

            if (zombie->curFrame == 5 && checkProximity(zombie)) {
                decrementPlayerHealth(zombie);
                player.isHit = 1;
                player.healthRegenBuffer = 150;
            }
            if (zombie->curFrame == zombieAttackFrames - 1) {
                zombie->aniState = zombieMove;
                zombie->numFrames = zombieMoveFrames;
                zombie->curFrame = 0;
                zombie->isMelee = 0;
                zombie->frameSpeed = defaultFrames;
            }

        } else {
            zombie->numFrames = bossAttackEnd;
            zombie->frameSpeed = bossMeleeSpeed;
            if (zombie->curFrame == zombie->numFrames - 1) {
                zombie->numFrames = bossMoveFrames;
                zombie->curFrame = 0;
                zombie->isMelee = 0;
                zombie->frameSpeed = defaultFrames;
            }
        }
    }
}



void shadowZombies() {
    ZOMBIE* zombie;
    for (int i = 0; i < maxZombies; i++) {
        zombie = &zombies[i];

        if (zombie->active) {
            shadowOAM[i + 1].attr0 = (zombie->row - vOff) | ATTR0_SQUARE | ATTR0_AFFINE;
            shadowOAM[i + 1].attr1 = (zombie->col - hOff) | zombie->direction | ATTR1_SMALL;
            shadowOAM[i + 1].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID((2 * zombie->aniState), (zombie->curFrame * 2));

        } 
        else {
            shadowOAM[i + 1].attr0 = (zombie->row - vOff) | ATTR0_SQUARE | ATTR0_HIDE;
            shadowOAM[i + 1].attr1 = (zombie->col - hOff) | zombie->direction | ATTR1_SMALL;
            shadowOAM[i + 1].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID((2 * zombie->aniState), (zombie->curFrame * 2));
        }
    }

    for (int i = 0; i < maxBosses; i++) {
        zombie = &bosses[i];

        if (zombie->active) {
            shadowOAM[i + maxZombies + 1].attr0 = (zombie->row - vOff) | ATTR0_SQUARE | ATTR0_AFFINE;
            shadowOAM[i + maxZombies + 1].attr1 = (zombie->col - hOff) | zombie->direction | ATTR1_MEDIUM;
            shadowOAM[i + maxZombies + 1].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID((2 * zombie->aniState), (zombie->curFrame * 4));

        }  else {
            shadowOAM[i + maxZombies + 1].attr0 = (zombie->row - vOff) | ATTR0_SQUARE | ATTR0_HIDE;
            shadowOAM[i + maxZombies + 1].attr1 = (zombie->col - hOff) | zombie->direction | ATTR1_MEDIUM;
            shadowOAM[i + maxZombies + 1].attr2 = ATTR2_PALROW(2) | ATTR2_TILEID((2 * zombie->aniState), (zombie->curFrame * 4));

        }
        
    }
}

void decrementZombieHealth(ZOMBIE* zombie) {
    if (zombie->shotBy == rifle) {
        zombie->health -= rifleDamage;

    } else if (zombie->shotBy == pistol) {
        zombie->health -= pistolDamage;

    } else {
        zombie->health -= 10;
    }

    if (zombie->health <= 0) {
        zombie->active = 0;
        zombieBlood(zombie);

        if (!zombie->isBoss) {
            activeZombies--;
            score += 20;

        } else { activeBosses--; }
        score += 10;
    }
}

int checkProximity(ZOMBIE* zombie) {

    // radius pathagream
    int playerCol = player.col + (player.width / 2);
    int playerRow = player.row + (player.height / 2);

    int zombieCol = zombie->col + (zombie->width / 2);
    int zombieRow = zombie->row + (zombie->height / 2);

    int x = pow( (playerCol - zombieCol), 2 );
    int y = pow( (playerRow - zombieRow), 2 );

    if ((x + y) <= 325) {
        return 1;

    } else {return 0;}
    
}




int checkColumns(ZOMBIE* zombie) {

    if ( (player.col >= zombie->col) && (player.col <= zombie->col + zombie->width) ) {
        return 1;
    }

    if ( (player.col + player.width >= zombie->col) && (player.col + player.width <= zombie->col + zombie->width) ) {
        return 1;
    }

    return 0;
}

int checkRows(ZOMBIE* zombie) {

    if ( (player.row >= zombie->row) && (player.row <= zombie->row + zombie->height) ) {
        return 1;
    }

    if ( (player.row + player.height >= zombie->row) && (player.row + player.height <= zombie->row + zombie->height) ) {
        return 1;
    }

    return 0;
}


void spawnZombie() {
    ZOMBIE* zombie;
    for (int i = 0; i < maxZombies; i++) {
        if (!zombies[i].active) {
            zombie = &zombies[i];
            zombie->active = 1;
            zombie->health = zombieStarthealth;

            zombieOrientate(zombie);

            activeZombies++;
            break;
        }
    }
}

void spawnBossZombie() {
    ZOMBIE* zombie;
    for (int i = 0; i < maxBosses; i++) {
        if (!bosses[i].active) {
            zombie = &bosses[i];
            zombie->active = 1;
            zombie->health = bossStartHealth;

            zombieOrientate(zombie);

            activeBosses++;
            break;
        }
    }
}

void zombieOrientate(ZOMBIE* zombie) {
    int num = rand() % 4;
    zombie->health = zombieStarthealth;

    switch (num) {
        case 0:                                                             ///SPAWN AT TOP OF SCREEN
            zombie->row = vOff;
            zombie->col = hOff + (rand() % 240);
            break;
        case 1:                                                             ///SPAWN AT BOTTOM OF SCREEN
            zombie->row = vOff + SCREENHEIGHT;
            zombie->col = hOff + (rand() % 240);
            break;
        case 2:                                                             ///SPAWN ON RIGHT SIDE OF SCREEN
            zombie->row = vOff + (rand() % 160);
            zombie->col = hOff + SCREENWIDTH;
            break;
        case 3:
            zombie->row = vOff + (rand() % 160);
            zombie->col = hOff;                              ///SPAWN ON LEFT SIDE OF SCREEN
            break;
    }
}


//SCREENBLOCK[27].tilemap[OFFSET(1,0, 32)] = 1;
    
void zombieBlood(ZOMBIE* zombie) {

    if (zombie->row <= 224) {
        
        if (zombie->col <= 240) {                                           //// TOP LEFT
            
            int col = zombie->col / 8;
            int row = zombie->row / 8;
            SCREENBLOCK[27].tilemap[OFFSET(col, row, 32)] = 1;
            SCREENBLOCK[27].tilemap[OFFSET(col + 1, row, 32)] = 1;
            SCREENBLOCK[27].tilemap[OFFSET(col, row + 1, 32)] = 1;
            SCREENBLOCK[27].tilemap[OFFSET(col + 1, row + 1, 32)] = 1;
            

        } else if (zombie->col >= 280) {                                    //// TOP RIGHT

            int col = (zombie->col - 256) / 8;
            int row = zombie->row / 8;
            SCREENBLOCK[28].tilemap[OFFSET(col, row, 32)] = 105;
            SCREENBLOCK[28].tilemap[OFFSET(col + 1, row, 32)] = 105;
            SCREENBLOCK[28].tilemap[OFFSET(col, row + 1, 32)] = 105;
            SCREENBLOCK[28].tilemap[OFFSET(col + 1, row + 1, 32)] = 105;
        }


    } else if (zombie->row >= 256) {                                        ///// BOTTOM
            
            if (zombie->col <= 240) {

                int col = zombie->col / 8;
                int row = (zombie->row - 256) / 8;
                SCREENBLOCK[29].tilemap[OFFSET(col, row, 32)] = 787;
                SCREENBLOCK[29].tilemap[OFFSET(col + 1, row, 32)] = 787;
                SCREENBLOCK[29].tilemap[OFFSET(col, row + 1, 32)] = 787;
                SCREENBLOCK[29].tilemap[OFFSET(col + 1, row + 1, 32)] = 787;

            } else {
                int col = (zombie->col - 256) / 8;
                int row = (zombie->row - 256) / 8;
                SCREENBLOCK[30].tilemap[OFFSET(col, row, 32)] = 787;
                SCREENBLOCK[30].tilemap[OFFSET(col + 1, row, 32)] = 787;
                SCREENBLOCK[30].tilemap[OFFSET(col, row + 1, 32)] = 787;
                SCREENBLOCK[30].tilemap[OFFSET(col + 1, row + 1, 32)] = 787;
            }
                
    }
}

////-------------------------------------------- PLAYER METHODS THAT TAKE ZOMBIE PARAMETER -------------------------------------------------

void decrementPlayerHealth(ZOMBIE* zombie) {
    
    if (zombie->isBoss) {
        player.health -= zombieDamage * 2;

    } else {
        player.health -= zombieDamage;
    }
    //mgba_printf("%d", player.health);
}

int proximityHelper(ZOMBIE* zombie) {
    int playerCol = player.col + (player.width / 2);
    int playerRow = player.row + (player.height / 2);

    int zombieCol = zombie->col + (zombie->width / 2);
    int zombieRow = zombie->row + (zombie->height / 2);

    int x = pow( (playerCol - zombieCol), 2 );
    int y = pow( (playerRow - zombieRow), 2 );

    if ((x + y) <= 400) {
        return 1;

    } else {return 0;}
}

////----------------------------------------------------------------------------------------------------------------------------------------

void destroyZombies() {
    ZOMBIE* ptr;
    for (int i = 0; i < maxZombies; i++) {
        ptr = &zombies[i];

        ptr-> active = 0;
           
    }
        

    for (int i = 0; i < maxBosses; i++) {
        ptr = &bosses[i];
        
        ptr-> active = 0;
        
    }
}