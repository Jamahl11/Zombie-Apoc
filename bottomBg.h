
//{{BLOCK(bottomBg)

//======================================================================
//
//	bottomBg, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 154 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 4928 + 8192 = 13632
//
//	Time-stamp: 2022-04-28, 16:39:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BOTTOMBG_H
#define GRIT_BOTTOMBG_H

#define bottomBgTilesLen 4928
extern const unsigned short bottomBgTiles[2464];

#define bottomBgMapLen 8192
extern const unsigned short bottomBgMap[4096];

#define bottomBgPalLen 512
extern const unsigned short bottomBgPal[256];

#endif // GRIT_BOTTOMBG_H

//}}BLOCK(bottomBg)
