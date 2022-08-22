
//{{BLOCK(instruct)

//======================================================================
//
//	instruct, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 55 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1760 + 2048 = 4320
//
//	Time-stamp: 2022-04-03, 23:10:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCT_H
#define GRIT_INSTRUCT_H

#define instructTilesLen 1760
extern const unsigned short instructTiles[880];

#define instructMapLen 2048
extern const unsigned short instructMap[1024];

#define instructPalLen 512
extern const unsigned short instructPal[256];

#endif // GRIT_INSTRUCT_H

//}}BLOCK(instruct)
