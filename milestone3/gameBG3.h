
//{{BLOCK(gameBG3)

//======================================================================
//
//	gameBG3, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 91 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 5824 + 4096 = 10432
//
//	Time-stamp: 2019-04-16, 21:34:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG3_H
#define GRIT_GAMEBG3_H

#define gameBG3TilesLen 5824
extern const unsigned short gameBG3Tiles[2912];

#define gameBG3MapLen 4096
extern const unsigned short gameBG3Map[2048];

#define gameBG3PalLen 512
extern const unsigned short gameBG3Pal[256];

#endif // GRIT_GAMEBG3_H

//}}BLOCK(gameBG3)
