
//{{BLOCK(gameBG1)

//======================================================================
//
//	gameBG1, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 144 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 9216 + 4096 = 13824
//
//	Time-stamp: 2019-04-13, 00:33:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG1_H
#define GRIT_GAMEBG1_H

#define gameBG1TilesLen 9216
extern const unsigned short gameBG1Tiles[4608];

#define gameBG1MapLen 4096
extern const unsigned short gameBG1Map[2048];

#define gameBG1PalLen 512
extern const unsigned short gameBG1Pal[256];

#endif // GRIT_GAMEBG1_H

//}}BLOCK(gameBG1)
