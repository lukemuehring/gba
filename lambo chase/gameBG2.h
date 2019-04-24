
//{{BLOCK(gameBG2)

//======================================================================
//
//	gameBG2, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 1141 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 73024 + 8192 = 81728
//
//	Time-stamp: 2019-04-12, 21:27:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG2_H
#define GRIT_GAMEBG2_H

#define gameBG2TilesLen 73024
extern const unsigned short gameBG2Tiles[36512];

#define gameBG2MapLen 8192
extern const unsigned short gameBG2Map[4096];

#define gameBG2PalLen 512
extern const unsigned short gameBG2Pal[256];

#endif // GRIT_GAMEBG2_H

//}}BLOCK(gameBG2)
