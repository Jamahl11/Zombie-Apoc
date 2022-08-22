//FINISHED: The player can go through their melee animations (press z) and reload animations (press x).
//  The player can also loop through his weapons (press a). When the player is holding their pistol or 
//  rifle the player can shoot bullets (press s). The bullets do damage to zombies and will kill them.
//  Zombies chase the player and can go through their melee animations when close to the player and 
//  can do damage to the player. 

//NEEDS TO BE IMPLEMENTED: Logic for the reload function as well as ammo needs to be added so the player
//  cannot shoot infinitely.The player needs to do damage to zombies when they melee and are in range.
//  Logic needs to be added so the player only starts with a knife and must collect a pistol and rifle.
//  Ammo must spawn on the ground randomly after zombies die. I need to background for the game. I need
//  randomly spawn in zombies during the game.
//  The UI for the game needs to be completed.
//  I need to add collision for zombies running into zombies and player running into zombies so they can't
//  walk through each other.

//BUGS: 
//    Sprites are not hiding correctly, not sure why. I got my hideSprites method from Lab 7.
//    When the game first starts their is a black spot in the top left corner of the game. I feel like that
//    has something to do with the sprites not hiding correctly. Another thing to fix is sometimes the zombie 
//    is trying to hit the player, the player doesn't move and they do no damage to the player.

//NOTES:
// make a timer variable to count the seconds/increment every time the timer overflows

#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "playerSpriteSheet.h"
#include "start.h"
#include "instructions.h"
#include "lose.h"
#include "pause.h"
#include "print.h"
#include "FinalProjectTopMap.h"
#include "gameMap.h"
#include "introMusic.h"
#include "gameMusic.h"
#include "sound.h"
#include "topBg.h"
#include "bottomBg.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToInstruct();
void instruct();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();

int cheat = 0;

// States.
enum {
    START,
    INSTRUCT,
    GAME,
    PAUSE,
    LOSE
};
int state;

int seed;


// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main() {
    initialize();
    mgba_open();

    while (1) {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state) {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case INSTRUCT:
            instruct();
            break;
        case PAUSE:
            pause();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA.
void initialize() {
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE; // Bitwise OR the BG(s) you want to use and Bitwise OR SPRITE_ENABLE if you want to use sprites.
    // Don't forget to set up whatever BGs you enabled in the line above!
    REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);



    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    playSoundA(introMusic_data, introMusic_length, 1);
    goToStart();
}

// Sets up the start state.
void goToStart() {
    state = START;
    lost = 0;
    score = 0;
    pistolUnlocked = 0;
    rifleUnlocked = 0;

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    seed = 0;


    //enableTimerInterrupts();

    initGame();

    REG_DISPCTL = MODE0 | BG2_ENABLE | SPRITE_ENABLE;
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, startPal, PALETTE, startPalLen / 2);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2 );
    DMANow(3, startMap, &SCREENBLOCK[31], startMapLen / 2);
}
    
// Runs every frame of the start state.
void start() {
    seed++;

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
        srand(seed);
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstruct();
    }

    if (BUTTON_PRESSED(BUTTON_A)) {
        cheat = 1;
    }
}

void goToInstruct() {
    state = INSTRUCT;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_DISPCTL = MODE0 | BG2_ENABLE | SPRITE_ENABLE;
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2 );
    DMANow(3, instructionsMap, &SCREENBLOCK[31], instructionsMapLen / 2);
}

void instruct() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
}
    
// Sets up the game state.
void goToGame() {

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(27);
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(23);

    stopSound();
    playSoundA(gameMusic_data, gameMusic_length, 1);

    //enableTimerInterrupts();

    DMANow(3, bottomBgPal, PALETTE, topBgPalLen / 2);

    DMANow(3, topBgTiles, &CHARBLOCK[0], topBgTilesLen / 2 );
    DMANow(3, topBgMap, &SCREENBLOCK[27], topBgMapLen / 2);

    DMANow(3, bottomBgTiles, &CHARBLOCK[2], bottomBgTilesLen / 2 );
    DMANow(3, bottomBgMap, &SCREENBLOCK[23], bottomBgMapLen / 2);


    DMANow(3, playerSpriteSheetPal, SPRITEPALETTE, playerSpriteSheetPalLen / 2);
    DMANow(3, playerSpriteSheetTiles, &CHARBLOCK[4], playerSpriteSheetTilesLen / 2);
    
    
    hideSprites();

    //PALETTE[0] = COLOR(28, 5, 16);

    state = GAME;
}

// Runs every frame of the game state.
void game() {
    updateGame();
    shadowGame();

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 128 * 4);


    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        
        goToPause();
    }

    if (lost) {
        REG_BG1CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
        goToLose();
    }
}

// Sets up the pause state.
void goToPause() {
    state = PAUSE;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    stopSound();
    playSoundA(introMusic_data, introMusic_length, 1);
    
    REG_DISPCTL = MODE0 | BG2_ENABLE | SPRITE_ENABLE;
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    

    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2 );
    DMANow(3, pauseMap, &SCREENBLOCK[31], pauseMapLen / 2);

}

// Runs every frame of the pause state.
void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}


// Sets up the lose state.
void goToLose() {
    state = LOSE;
    DMANow(3, losePal, PALETTE, losePalLen / 2);

    REG_DISPCTL = MODE0 | BG2_ENABLE | SPRITE_ENABLE;
    REG_BG2CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    stopSound();
    playSoundA(introMusic_data, introMusic_length, 1);

    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2 );
    DMANow(3, loseMap, &SCREENBLOCK[31], loseMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

// Runs every frame of the lose state.
void lose() {
    showScore();
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}