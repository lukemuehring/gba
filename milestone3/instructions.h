
//{{BLOCK(instructions)

//======================================================================
//
//	instructions, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 41 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 2624 + 8192 = 11328
//
//	Time-stamp: 2019-04-04, 22:17:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONS_H
#define GRIT_INSTRUCTIONS_H

#define instructionsTilesLen 2624
extern const unsigned short instructionsTiles[1312];

#define instructionsMapLen 8192
extern const unsigned short instructionsMap[4096];

#define instructionsPalLen 512
extern const unsigned short instructionsPal[256];

#endif // GRIT_INSTRUCTIONS_H

//}}BLOCK(instructions)
