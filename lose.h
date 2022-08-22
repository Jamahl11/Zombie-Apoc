
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 546 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17472 + 2048 = 20032
//
//	Time-stamp: 2022-04-29, 01:56:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 17472
extern const unsigned short loseTiles[8736];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
