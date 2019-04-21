
//{{BLOCK(welcome)

//======================================================================
//
//	welcome, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 507 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 32448 + 2048 = 35008
//
//	Time-stamp: 2019-04-18, 17:14:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WELCOME_H
#define GRIT_WELCOME_H

#define welcomeTilesLen 32448
extern const unsigned short welcomeTiles[16224];

#define welcomeMapLen 2048
extern const unsigned short welcomeMap[1024];

#define welcomePalLen 512
extern const unsigned short welcomePal[256];

#endif // GRIT_WELCOME_H

//}}BLOCK(welcome)
