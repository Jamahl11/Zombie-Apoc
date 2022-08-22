# 1 "zombie.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "zombie.c"
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
# 2 "zombie.c" 2
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
# 3 "zombie.c" 2
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
# 4 "zombie.c" 2

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
# 6 "zombie.c" 2
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

# 7 "zombie.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 1 3






# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 8 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 2 3



# 86 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 150 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
    typedef float float_t;
    typedef double double_t;
# 194 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 290 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);





extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long int llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);
extern float hypotf (float, float);
# 422 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3
extern long double atanl (long double);
extern long double cosl (long double);
extern long double sinl (long double);
extern long double tanl (long double);
extern long double tanhl (long double);
extern long double frexpl (long double, int *);
extern long double modfl (long double, long double *);
extern long double ceill (long double);
extern long double fabsl (long double);
extern long double floorl (long double);
extern long double log1pl (long double);
extern long double expm1l (long double);




extern long double acosl (long double);
extern long double asinl (long double);
extern long double atan2l (long double, long double);
extern long double coshl (long double);
extern long double sinhl (long double);
extern long double expl (long double);
extern long double ldexpl (long double, int);
extern long double logl (long double);
extern long double log10l (long double);
extern long double powl (long double, long double);
extern long double sqrtl (long double);
extern long double fmodl (long double, long double);
extern long double hypotl (long double, long double);


extern long double copysignl (long double, long double);
extern long double nanl (const char *);
extern int ilogbl (long double);
extern long double asinhl (long double);
extern long double cbrtl (long double);
extern long double nextafterl (long double, long double);
extern float nexttowardf (float, long double);
extern double nexttoward (double, long double);
extern long double nexttowardl (long double, long double);
extern long double logbl (long double);
extern long double log2l (long double);
extern long double rintl (long double);
extern long double scalbnl (long double, int);
extern long double exp2l (long double);
extern long double scalblnl (long double, long);
extern long double tgammal (long double);
extern long double nearbyintl (long double);
extern long int lrintl (long double);
extern long long int llrintl (long double);
extern long double roundl (long double);
extern long lroundl (long double);
extern long long int llroundl (long double);
extern long double truncl (long double);
extern long double remquol (long double, long double, int *);
extern long double fdiml (long double, long double);
extern long double fmaxl (long double, long double);
extern long double fminl (long double, long double);
extern long double fmal (long double, long double, long double);

extern long double acoshl (long double);
extern long double atanhl (long double);
extern long double remainderl (long double, long double);
extern long double lgammal (long double);
extern long double erfl (long double);
extern long double erfcl (long double);
# 662 "/opt/devkitpro/devkitARM/arm-none-eabi/include/math.h" 3

# 8 "zombie.c" 2


# 9 "zombie.c"
int activeZombies;
int activeBosses;
int zombieNotSpawned = 1;
int bossNotSpawned = 1;

int zombieStarthealth = 100;

int bossStartHealth = 200;


ZOMBIE zombies[10];
ZOMBIE bosses[5];

void initZombies() {

    for (int i = 0; i < 10; i++) {
        ZOMBIE temp = {.row = 25, .col = 122, .rdel = 1, .cdel = 1, .width = 16, .height = 16, .aniCounter = 0, .aniState = 11, .curFrame = 0,
                            .numFrames = 16, .isMelee = 0, .isBoss = 0, .frameSpeed = 20, .health = 100, .active = 0};




        zombies[i] = temp;
    }

    for (int i = 0; i < 5; i++) {
        ZOMBIE temp = {.row = 100, .col = 122, .rdel = 1, .cdel = 1, .width = 32, .height = 32, .aniCounter = 0, .aniState = 13, .curFrame = 0,
                            .numFrames = 5, .isMelee = 0, .isBoss = 1, .frameSpeed = 20, .health = 150};

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
    for (int i = 0; i < 10; i++) {
        ptr = &zombies[i];

        if (ptr-> active) {
            moveZombies(ptr);
            zombieMelee(ptr);
        }

    }

    for (int i = 0; i < 5; i++) {
        ptr = &bosses[i];

        if (ptr-> active) {
            moveZombies(ptr);
            zombieMelee(ptr);
        }
    }


}

void moveZombies(ZOMBIE* zombie) {

    if (!zombie->isMelee) {
        if ((zombie->row + zombie->height) - player.row < 0) {

            if (zombie->col - player.col < 0) {
                zombie->row += zombie->rdel;
                zombie->col += zombie->cdel;
                zombie->direction = (3 << 9);


            } else if (zombie->col - player.col == 0) {
                zombie->row += zombie->rdel;
                zombie->direction = (4 << 9);

            } else {
                zombie->row += zombie->rdel;
                zombie->col -= zombie->cdel;
                zombie->direction = (5 << 9);
            }

        } else if (zombie->row - (player.row + player.height) > 0) {

            if (zombie->col - player.col < 0) {
                zombie->row -= zombie->rdel;
                zombie->col += zombie->cdel;
                zombie->direction = (1 << 9);

            } else if (zombie->col - player.col == 0) {
                zombie->row -= zombie->rdel;
                zombie->direction = (0 << 9);

            } else {
                zombie->row -= zombie->rdel;
                zombie->col -= zombie->cdel;
                zombie->direction = (7 << 9);
            }

        } else {

            if ((zombie->col + zombie->width) - player.col < 0) {
                zombie->col += zombie->cdel;
                zombie->direction = (2 << 9);

            } else if (zombie->col - (player.col + player.width) > 0) {
                zombie->col -= zombie->cdel;
                zombie->direction = (6 << 9);

            } else {
                orientateZombie(zombie);
                if (zombie->isBoss) {
                    zombie->curFrame = 5;

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
            zombie->direction = (3 << 9);

        } else if (zombie->col - player.col == 0) {
            zombie->direction = (4 << 9);

        } else {
            zombie->direction = (5 << 9);
        }

    } else if (zombie->row - player.row == 0) {

        if (zombie->col - player.col < 0) {
            zombie->direction = (2 << 9);

        } else {
            zombie->direction = (6 << 9);
        }

    } else {

        if (zombie->col - player.col < 0) {
            zombie->direction = (1 << 9);

        } else if (zombie->col - player.col == 0) {
            zombie->direction = (0 << 9);

        } else {
            zombie->direction = (7 << 9);
        }
    }
}

void zombieMelee(ZOMBIE* zombie) {
    if (zombie->isMelee) {
        if (!zombie->isBoss) {
            zombie->frameSpeed = 5;
            zombie->aniState = 12;
            zombie->numFrames = 9;

            if (zombie->curFrame == 5 && checkProximity(zombie)) {
                decrementPlayerHealth(zombie);
                player.isHit = 1;
                player.healthRegenBuffer = 150;
            }
            if (zombie->curFrame == 9 - 1) {
                zombie->aniState = 11;
                zombie->numFrames = 16;
                zombie->curFrame = 0;
                zombie->isMelee = 0;
                zombie->frameSpeed = 20;
            }

        } else {
            zombie->numFrames = 9;
            zombie->frameSpeed = 10;
            if (zombie->curFrame == zombie->numFrames - 1) {
                zombie->numFrames = 5;
                zombie->curFrame = 0;
                zombie->isMelee = 0;
                zombie->frameSpeed = 20;
            }
        }
    }
}



void shadowZombies() {
    ZOMBIE* zombie;
    for (int i = 0; i < 10; i++) {
        zombie = &zombies[i];

        if (zombie->active) {
            shadowOAM[i + 1].attr0 = (zombie->row - vOff) | (0 << 14) | (1 << 8);
            shadowOAM[i + 1].attr1 = (zombie->col - hOff) | zombie->direction | (1 << 14);
            shadowOAM[i + 1].attr2 = ((1) << 12) | (((zombie->curFrame * 2))*32 + ((2 * zombie->aniState)));

        }
        else {
            shadowOAM[i + 1].attr0 = (zombie->row - vOff) | (0 << 14) | (2 << 8);
            shadowOAM[i + 1].attr1 = (zombie->col - hOff) | zombie->direction | (1 << 14);
            shadowOAM[i + 1].attr2 = ((1) << 12) | (((zombie->curFrame * 2))*32 + ((2 * zombie->aniState)));
        }
    }

    for (int i = 0; i < 5; i++) {
        zombie = &bosses[i];

        if (zombie->active) {
            shadowOAM[i + 10 + 1].attr0 = (zombie->row - vOff) | (0 << 14) | (1 << 8);
            shadowOAM[i + 10 + 1].attr1 = (zombie->col - hOff) | zombie->direction | (2 << 14);
            shadowOAM[i + 10 + 1].attr2 = ((2) << 12) | (((zombie->curFrame * 4))*32 + ((2 * zombie->aniState)));

        } else {
            shadowOAM[i + 10 + 1].attr0 = (zombie->row - vOff) | (0 << 14) | (2 << 8);
            shadowOAM[i + 10 + 1].attr1 = (zombie->col - hOff) | zombie->direction | (2 << 14);
            shadowOAM[i + 10 + 1].attr2 = ((2) << 12) | (((zombie->curFrame * 4))*32 + ((2 * zombie->aniState)));

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
    for (int i = 0; i < 10; i++) {
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
    for (int i = 0; i < 5; i++) {
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
        case 0:
            zombie->row = vOff;
            zombie->col = hOff + (rand() % 240);
            break;
        case 1:
            zombie->row = vOff + 160;
            zombie->col = hOff + (rand() % 240);
            break;
        case 2:
            zombie->row = vOff + (rand() % 160);
            zombie->col = hOff + 240;
            break;
        case 3:
            zombie->row = vOff + (rand() % 160);
            zombie->col = hOff;
            break;
    }
}




void zombieBlood(ZOMBIE* zombie) {

    if (zombie->row <= 224) {

        if (zombie->col <= 240) {

            int col = zombie->col / 8;
            int row = zombie->row / 8;
            ((screenblock *)0x6000000)[27].tilemap[((row) * (32) + (col))] = 1;
            ((screenblock *)0x6000000)[27].tilemap[((row) * (32) + (col + 1))] = 1;
            ((screenblock *)0x6000000)[27].tilemap[((row + 1) * (32) + (col))] = 1;
            ((screenblock *)0x6000000)[27].tilemap[((row + 1) * (32) + (col + 1))] = 1;


        } else if (zombie->col >= 280) {

            int col = (zombie->col - 256) / 8;
            int row = zombie->row / 8;
            ((screenblock *)0x6000000)[28].tilemap[((row) * (32) + (col))] = 105;
            ((screenblock *)0x6000000)[28].tilemap[((row) * (32) + (col + 1))] = 105;
            ((screenblock *)0x6000000)[28].tilemap[((row + 1) * (32) + (col))] = 105;
            ((screenblock *)0x6000000)[28].tilemap[((row + 1) * (32) + (col + 1))] = 105;
        }


    } else if (zombie->row >= 256) {

            if (zombie->col <= 240) {

                int col = zombie->col / 8;
                int row = (zombie->row - 256) / 8;
                ((screenblock *)0x6000000)[29].tilemap[((row) * (32) + (col))] = 787;
                ((screenblock *)0x6000000)[29].tilemap[((row) * (32) + (col + 1))] = 787;
                ((screenblock *)0x6000000)[29].tilemap[((row + 1) * (32) + (col))] = 787;
                ((screenblock *)0x6000000)[29].tilemap[((row + 1) * (32) + (col + 1))] = 787;

            } else {
                int col = (zombie->col - 256) / 8;
                int row = (zombie->row - 256) / 8;
                ((screenblock *)0x6000000)[30].tilemap[((row) * (32) + (col))] = 787;
                ((screenblock *)0x6000000)[30].tilemap[((row) * (32) + (col + 1))] = 787;
                ((screenblock *)0x6000000)[30].tilemap[((row + 1) * (32) + (col))] = 787;
                ((screenblock *)0x6000000)[30].tilemap[((row + 1) * (32) + (col + 1))] = 787;
            }

    }
}



void decrementPlayerHealth(ZOMBIE* zombie) {

    if (zombie->isBoss) {
        player.health -= zombieDamage * 2;

    } else {
        player.health -= zombieDamage;
    }

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



void destroyZombies() {
    ZOMBIE* ptr;
    for (int i = 0; i < 10; i++) {
        ptr = &zombies[i];

        ptr-> active = 0;

    }


    for (int i = 0; i < 5; i++) {
        ptr = &bosses[i];

        ptr-> active = 0;

    }
}
