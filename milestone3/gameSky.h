
//{{BLOCK(gameSky)

//======================================================================
//
//	gameSky, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 289 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9248 + 2048 = 11808
//
//	Time-stamp: 2019-03-29, 17:51:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESKY_H
#define GRIT_GAMESKY_H

#define gameSkyTilesLen 9248
extern const unsigned short gameSkyTiles[4624];

#define gameSkyMapLen 2048
extern const unsigned short gameSkyMap[1024];

#define gameSkyPalLen 512
extern const unsigned short gameSkyPal[256];

#endif // GRIT_GAMESKY_H

//}}BLOCK(gameSky)
