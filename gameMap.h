
//{{BLOCK(gameMap)

//======================================================================
//
//	gameMap, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 591 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 37824 + 4096 = 42432
//
//	Time-stamp: 2022-04-22, 19:34:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEMAP_H
#define GRIT_GAMEMAP_H

#define gameMapTilesLen 37824
extern const unsigned short gameMapTiles[18912];

#define gameMapMapLen 4096
extern const unsigned short gameMapMap[2048];

#define gameMapPalLen 512
extern const unsigned short gameMapPal[256];

#endif // GRIT_GAMEMAP_H

//}}BLOCK(gameMap)
