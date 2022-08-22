
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 151 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 4832 + 2048 = 7392
//
//	Time-stamp: 2022-04-29, 01:37:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define instructionsTilesLen 4832
extern const unsigned short instructionsTiles[2416];

#define instructionsMapLen 2048
extern const unsigned short instructionsMap[1024];

#define instructionsPalLen 512
extern const unsigned short instructionsPal[256];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(instructions)
