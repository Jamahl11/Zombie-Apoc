

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

//ZOMBIE STATE DEFS
#define zombieMove 11
#define zombieAttack 12


#define zombieMoveFrames 16
#define zombieAttackFrames 9

#define maxZombies 10

#define bossMove 13    // BOSS ZOMBIE MOVEMENT AND ATTACK FRAMES IN THE SAME COLUMN

#define bossMoveFrames 5

#define bossAttackStart 5  // BOSS ZOMBIE ATTACK STARTS AT 5TH SPRITE 
#define bossAttackEnd 9    //BOSS ZOMBIE ATTACK ENDS AT 7TH SPRITE (accounts for modding of curFrame)

#define maxBosses 5

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

int checkProximity(ZOMBIE *);     // CHECKS HOW CLOSE THE ZOMBIE IS TO THE PLAYER, USED IN THE ZOMBIE MELEE FUNCTION
int checkColumns(ZOMBIE *);       // CHECKS IF ZOMBIE AND PLAYER COLUMNS ARE INTERSECTING 
int checkRows(ZOMBIE *);          // CHECKS IF ZOMBIE AND PLAYER ROWS ARE INTERSECTING

void spawnZombie();
void spawnBossZombie();
void zombieOrientate(ZOMBIE *);


int proximityHelper(ZOMBIE *);

#define bossMeleeSpeed 10

void destroyZombies();




