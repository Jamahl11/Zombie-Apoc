
//{{BLOCK(topBg)

//======================================================================
//
//	topBg, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 918 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 29376 + 8192 = 38080
//
//	Time-stamp: 2022-04-28, 16:25:26
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_TOPBG_H
#define GRIT_TOPBG_H

#define topBgTilesLen 29376
extern const unsigned short topBgTiles[14688];

#define topBgMapLen 8192
extern const unsigned short topBgMap[4096];

#define topBgPalLen 512
extern const unsigned short topBgPal[256];

#endif // GRIT_TOPBG_H

//}}BLOCK(topBg)
