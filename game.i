# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2
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
# 4 "game.c" 2
# 1 "introMusic.h" 1


extern const unsigned int introMusic_sampleRate;
extern const unsigned int introMusic_length;
extern const signed char introMusic_data[];
# 5 "game.c" 2
# 1 "gameMusic.h" 1


extern const unsigned int gameMusic_sampleRate;
extern const unsigned int gameMusic_length;
extern const signed char gameMusic_data[];
# 6 "game.c" 2
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
# 7 "game.c" 2
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
# 8 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3






typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 9 "game.c" 2


# 10 "game.c"
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
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

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

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;

    (*(volatile unsigned short *)0x04000014) = hOff / 2;
    (*(volatile unsigned short *)0x04000016) = vOff / 2;



}

void shadowGame() {
    shadowPlayer();
    shadowZombies();
    shadowBullets();
    userInterface();

    shadowPistolAmmo();
    shadowRifleAmmo();
# 142 "game.c"
}


void initDirections() {

    SHADOW_OAM_AFF[0].a = 0;
    SHADOW_OAM_AFF[0].b = -255;
    SHADOW_OAM_AFF[0].c = 255;
    SHADOW_OAM_AFF[0].d = 0;


    SHADOW_OAM_AFF[1].a = 181;
    SHADOW_OAM_AFF[1].b = -181;
    SHADOW_OAM_AFF[1].c = 181;
    SHADOW_OAM_AFF[1].d = 181;


    SHADOW_OAM_AFF[2].a = 255;
    SHADOW_OAM_AFF[2].b = 0;
    SHADOW_OAM_AFF[2].c = 0;
    SHADOW_OAM_AFF[2].d = 255;


    SHADOW_OAM_AFF[3].a = 181;
    SHADOW_OAM_AFF[3].b = 181;
    SHADOW_OAM_AFF[3].c = -181;
    SHADOW_OAM_AFF[3].d = 181;


    SHADOW_OAM_AFF[4].a = 0;
    SHADOW_OAM_AFF[4].b = 255;
    SHADOW_OAM_AFF[4].c = -255;
    SHADOW_OAM_AFF[4].d = 0;


    SHADOW_OAM_AFF[5].a = -181;
    SHADOW_OAM_AFF[5].b = 181;
    SHADOW_OAM_AFF[5].c = -181;
    SHADOW_OAM_AFF[5].d = -181;


    SHADOW_OAM_AFF[6].a = -255;
    SHADOW_OAM_AFF[6].b = 0;
    SHADOW_OAM_AFF[6].c = 0;
    SHADOW_OAM_AFF[6].d = -255;


    SHADOW_OAM_AFF[7].a = -181;
    SHADOW_OAM_AFF[7].b = -181;
    SHADOW_OAM_AFF[7].c = 181;
    SHADOW_OAM_AFF[7].d = -181;
}


void timedEvents() {
    if (seconds % buffer == 0 && activeZombies < 10 && zombieNotSpawned) {
        spawnZombie();
        zombieNotSpawned = 0;

    } else if (seconds % 15 != 0 ) { zombieNotSpawned = 1; }

    if (seconds >= 20) {

        if (!pistolFound) {
            shadowOAM[10 + 5 + 30 + 10].attr0 = (pistolRow - vOff) | (1 << 14) | (0 << 8);
            shadowOAM[10 + 5 + 30 + 10].attr1 = (pistolCol - hOff) | (2 << 14);
            shadowOAM[10 + 5 + 30 + 10].attr2 = ((6) << 12) | ((25)*32 + (11));

            pistolActive = 1;


        } else {
            shadowOAM[10 + 5 + 30 + 10].attr0 = (pistolRow - vOff) | (1 << 14) | (2 << 8);
            shadowOAM[10 + 5 + 30 + 10].attr1 = (pistolCol - hOff) | (2 << 14);
            shadowOAM[10 + 5 + 30 + 10].attr2 = ((6) << 12) | ((25)*32 + (11));
        }
    }

    if (seconds >= 40) {

        if (!rifleFound) {
            shadowOAM[10 + 5 + 30 + 11].attr0 = (rifleRow - vOff) | (1 << 14) | (0 << 8);
            shadowOAM[10 + 5 + 30 + 11].attr1 = (rifleCol - hOff) | (2 << 14);
            shadowOAM[10 + 5 + 30 + 11].attr2 = ((7) << 12) | ((25)*32 + (15));

            rifleActive = 1;


        } else {
            shadowOAM[10 + 5 + 30 + 11].attr0 = (rifleRow - vOff) | (1 << 14) | (2 << 8);
            shadowOAM[10 + 5 + 30 + 11].attr1 = (rifleCol - hOff) | (2 << 14);
            shadowOAM[10 + 5 + 30 + 11].attr2 = ((7) << 12) | ((25)*32 + (15));
        }

        if (seconds >= 10) {
            zombieStartHealth = 125;
            if (seconds % buffer == 0 && activeBosses < 5 && bossNotSpawned) {

                bossNotSpawned = 0;

            } else if (seconds % buffer != 0 ) { bossNotSpawned = 1; }

        }

    }
}

void equipPistol() {





    if (collision(player.col, player.row, player.width, player.height, pistolCol, pistolRow, 32, 16) && pistolActive ) {
        pistolFound = 1;
        pistolAmmo = 12;
        pistolStockPile = 72;
        pistolActive = 0;



    }
}

void equipRifle() {
    if (collision(player.col, player.row, player.width, player.height, rifleCol, rifleRow, 32, 16) && rifleActive ) {
        rifleFound = 1;
        rifleAmmo = 30;
        rifleStockPile = 72;
        rifleActive = 0;



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
        shadowOAM[10 + 5 + 30 + 17].attr0 = (pistolAmmoRow - vOff) | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 17].attr1 = (pistolAmmoCol - hOff) | (0 << 14);
        shadowOAM[10 + 5 + 30 + 17].attr2 = ((8) << 12) | ((29)*32 + (7));

    } else {
        shadowOAM[10 + 5 + 30 + 17].attr0 = (pistolAmmoRow - vOff) | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 17].attr1 = (pistolAmmoCol - hOff) | (0 << 14);
        shadowOAM[10 + 5 + 30 + 17].attr2 = ((8) << 12) | ((29)*32 + (7));
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
        shadowOAM[10 + 5 + 30 + 17].attr0 = (rifleAmmoRow - vOff) | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 17].attr1 = (rifleAmmoCol - hOff) | (0 << 14);
        shadowOAM[10 + 5 + 30 + 17].attr2 = ((8) << 12) | ((29)*32 + (7));

    } else {
        shadowOAM[10 + 5 + 30 + 17].attr0 = (rifleAmmoRow - vOff) | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 17].attr1 = (rifleAmmoCol - hOff) | (1 << 14);
        shadowOAM[10 + 5 + 30 + 17].attr2 = ((8) << 12) | ((29)*32 + (7));
    }
}

void rifleAmmoCollision() {
    if (rifleAmmoSpawned && collision(player.col, player.row, player.width, player.height, rifleAmmoCol, rifleAmmoRow, 8, 8)) {
        rifleAmmoSpawned = 0;
        rifleStockPile = rifleStockPile + 60;
    }
}





void userInterface() {
    showScore();
    showHealth();
    showGun();
}

void showScore() {
    shadowOAM[10 + 5 + 30 + 1].attr0 = 2 | (0 << 14) | (0 << 8);
    shadowOAM[10 + 5 + 30 + 1].attr1 = 230 | (0 << 14);
    shadowOAM[10 + 5 + 30 + 1].attr2 = ((4) << 12) | ((0)*32 + (31));

    shadowOAM[10 + 5 + 30 + 2].attr0 = 2 | (0 << 14) | (2 << 8);
    shadowOAM[10 + 5 + 30 + 2].attr1 = 225 | (0 << 14);

    shadowOAM[10 + 5 + 30 + 3].attr0 = 2 | (0 << 14) | (2 << 8);
    shadowOAM[10 + 5 + 30 + 3].attr1 = 220 | (0 << 14);

    shadowOAM[10 + 5 + 30 + 4].attr0 = 2 | (0 << 14) | (2 << 8);
    shadowOAM[10 + 5 + 30 + 4].attr1 = 215 | (0 << 14);

    if ( score < 100) {
        shadowOAM[10 + 5 + 30 + 2].attr0 = 2 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 2].attr2 = ((4) << 12) | ((score / 10)*32 + (31));

    } else if (score < 1000) {

        shadowOAM[10 + 5 + 30 + 2].attr0 = 2 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 2].attr2 = ((4) << 12) | (((score / 10) % 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 3].attr0 = 2 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 3].attr2 = ((4) << 12) | (((score / 10) / 10)*32 + (31));




    }
}

void endScore() {

    shadowOAM[10 + 5 + 30 + 1].attr0 = 100 | (0 << 14) | (0 << 8);
    shadowOAM[10 + 5 + 30 + 1].attr1 = 230 | (0 << 14);
    shadowOAM[10 + 5 + 30 + 1].attr2 = ((4) << 12) | ((0)*32 + (31));

    shadowOAM[10 + 5 + 30 + 2].attr0 = 100 | (0 << 14) | (2 << 8);
    shadowOAM[10 + 5 + 30 + 2].attr1 = 225 | (0 << 14);

    shadowOAM[10 + 5 + 30 + 3].attr0 = 100 | (0 << 14) | (2 << 8);
    shadowOAM[10 + 5 + 30 + 3].attr1 = 220 | (0 << 14);

    shadowOAM[10 + 5 + 30 + 4].attr0 = 100 | (0 << 14) | (2 << 8);
    shadowOAM[10 + 5 + 30 + 4].attr1 = 215 | (0 << 14);

    if ( score < 100) {
        shadowOAM[10 + 5 + 30 + 2].attr0 = 100 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 2].attr2 = ((4) << 12) | ((score / 10)*32 + (31));

    } else if (score < 1000) {

        shadowOAM[10 + 5 + 30 + 2].attr0 = 100 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 2].attr2 = ((4) << 12) | (((score / 10) % 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 3].attr0 = 100 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 3].attr2 = ((4) << 12) | (((score / 10) / 10)*32 + (31));




    }
}

void showHealth() {

    if (player.health == 100) {

        shadowOAM[10 + 5 + 30 + 5].attr0 = 4 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 5].attr1 = 55 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 5].attr2 = ((4) << 12) | ((1)*32 + (31));

        shadowOAM[10 + 5 + 30 + 6].attr0 = 4 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 6].attr1 = 60 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 6].attr2 = ((4) << 12) | ((0)*32 + (31));

        shadowOAM[10 + 5 + 30 + 7].attr0 = 4 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 7].attr1 = 65 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 7].attr2 = ((4) << 12) | ((0)*32 + (31));

    } else {
        shadowOAM[10 + 5 + 30 + 5].attr0 = 4 | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 5].attr1 = 55 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 5].attr2 = ((4) << 12) | ((1)*32 + (31));

        shadowOAM[10 + 5 + 30 + 6].attr0 = 4 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 6].attr1 = 60 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 6].attr2 = ((4) << 12) | ((player.health / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 7].attr0 = 4 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 7].attr1 = 65 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 7].attr2 = ((4) << 12) | ((player.health % 10)*32 + (31));
    }

    shadowOAM[10 + 5 + 30 + 8].attr0 = 0 | (1 << 14) | (0 << 8);
    shadowOAM[10 + 5 + 30 + 8].attr1 = 21 | (2 << 14);
    shadowOAM[10 + 5 + 30 + 8].attr2 = ((4) << 12) | ((27)*32 + (7));



}

void showGun() {

    if (weapon == knife) {

        shadowOAM[10 + 5 + 30 + 9].attr0 = 135 | (1 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 9].attr1 = 10 | (2 << 14);
        shadowOAM[10 + 5 + 30 + 9].attr2 = ((5) << 12) | ((25)*32 + (7));

        shadowOAM[10 + 5 + 30 + 12].attr0 = 140 | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 12].attr1 = 50 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 12].attr2 = ((4) << 12) | ((pistolAmmo / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 13].attr0 = 140 | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 13].attr1 = 55 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 13].attr2 = ((4) << 12) | ((pistolAmmo % 10)*32 + (31));


        shadowOAM[10 + 5 + 30 + 14].attr0 = 140 | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 14].attr1 = 65 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 14].attr2 = ((4) << 12) | (((pistolStockPile / 10) / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 15].attr0 = 140 | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 15].attr1 = 70 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 15].attr2 = ((4) << 12) | ((pistolStockPile / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 16].attr0 = 140 | (0 << 14) | (2 << 8);
        shadowOAM[10 + 5 + 30 + 16].attr1 = 75 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 16].attr2 = ((4) << 12) | ((pistolStockPile % 10)*32 + (31));

    } else if (weapon == pistol) {
        shadowOAM[10 + 5 + 30 + 9].attr0 = 135 | (1 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 9].attr1 = 10 | (2 << 14);
        shadowOAM[10 + 5 + 30 + 9].attr2 = ((6) << 12) | ((25)*32 + (11));


        shadowOAM[10 + 5 + 30 + 12].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 12].attr1 = 50 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 12].attr2 = ((4) << 12) | ((pistolAmmo / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 13].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 13].attr1 = 55 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 13].attr2 = ((4) << 12) | ((pistolAmmo % 10)*32 + (31));


        shadowOAM[10 + 5 + 30 + 14].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 14].attr1 = 65 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 14].attr2 = ((4) << 12) | (((pistolStockPile / 10) / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 15].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 15].attr1 = 70 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 15].attr2 = ((4) << 12) | (((pistolStockPile / 10) % 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 16].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 16].attr1 = 75 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 16].attr2 = ((4) << 12) | ((pistolStockPile % 10)*32 + (31));



    } else {
        shadowOAM[10 + 5 + 30 + 9].attr0 = 135 | (1 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 9].attr1 = 10 | (2 << 14);
        shadowOAM[10 + 5 + 30 + 9].attr2 = ((7) << 12) | ((25)*32 + (15));


        shadowOAM[10 + 5 + 30 + 12].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 12].attr1 = 50 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 12].attr2 = ((4) << 12) | ((rifleAmmo / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 13].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 13].attr1 = 55 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 13].attr2 = ((4) << 12) | ((rifleAmmo % 10)*32 + (31));


        shadowOAM[10 + 5 + 30 + 14].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 14].attr1 = 65 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 14].attr2 = ((4) << 12) | (((rifleStockPile / 10) / 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 15].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 15].attr1 = 70 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 15].attr2 = ((4) << 12) | (((rifleStockPile / 10) % 10)*32 + (31));

        shadowOAM[10 + 5 + 30 + 16].attr0 = 140 | (0 << 14) | (0 << 8);
        shadowOAM[10 + 5 + 30 + 16].attr1 = 75 | (0 << 14);
        shadowOAM[10 + 5 + 30 + 16].attr2 = ((4) << 12) | ((rifleStockPile % 10)*32 + (31));
    }
}


void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;


    *((ihp*)0x03007FFC) = interruptHandler;

 *(unsigned short*)0x4000208 = 1;
    enableTimerInterrupts();
    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;
}

void interruptHandler() {

 *(unsigned short*)0x4000208 = 0;

 if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {


            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
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
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                }
            }
  }


  *(volatile unsigned short*)0x4000202 |= 1 << 0;
 }

    if (*(volatile unsigned short*)0x4000202 & 1<<5) {
        seconds = (seconds + 1) % 60;

    }

    if (*(volatile unsigned short*)0x4000202 & 1<<6) {
        minutes++;

    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;
 *(unsigned short*)0x4000208 = 1;
}

void enableTimerInterrupts(void) {
  *(unsigned short*)0x4000200 |= 1<<5 | 1<<6;

  *(volatile unsigned short*)0x400010A = 0;
  *(volatile unsigned short*)0x4000108 = (65536 - 16384);
  *(volatile unsigned short*)0x400010A |= 3 | (1<<7) | (1<<6);




}
