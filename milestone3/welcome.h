
//{{BLOCK(welcome)

//======================================================================
//
//	welcome, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 53 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 3392 + 8192 = 12096
//
//	Time-stamp: 2019-04-04, 22:16:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WELCOME_H
#define GRIT_WELCOME_H

#define welcomeTilesLen 3392
extern const unsigned short welcomeTiles[1696];

#define welcomeMapLen 8192
extern const unsigned short welcomeMap[4096];

#define welcomePalLen 512
extern const unsigned short welcomePal[256];

#endif // GRIT_WELCOME_H

//}}BLOCK(welcome)
