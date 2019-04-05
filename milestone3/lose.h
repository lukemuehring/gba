
//{{BLOCK(lose)

//======================================================================
//
//	lose, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 22 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 1408 + 8192 = 10112
//
//	Time-stamp: 2019-04-04, 22:19:44
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 1408
extern const unsigned short loseTiles[704];

#define loseMapLen 8192
extern const unsigned short loseMap[4096];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)
