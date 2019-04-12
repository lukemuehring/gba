
//{{BLOCK(gameBG1)

//======================================================================
//
//	gameBG1, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 144 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 9216 + 8192 = 17920
//
//	Time-stamp: 2019-04-11, 21:59:55
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG1_H
#define GRIT_GAMEBG1_H

#define gameBG1TilesLen 9216
extern const unsigned short gameBG1Tiles[4608];

#define gameBG1MapLen 8192
extern const unsigned short gameBG1Map[4096];

#define gameBG1PalLen 512
extern const unsigned short gameBG1Pal[256];

#endif // GRIT_GAMEBG1_H

//}}BLOCK(gameBG1)
