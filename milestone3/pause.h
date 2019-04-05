
//{{BLOCK(pause)

//======================================================================
//
//	pause, 512x512@8, 
//	+ palette 256 entries, not compressed
//	+ 26 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 1664 + 8192 = 10368
//
//	Time-stamp: 2019-04-04, 22:18:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSE_H
#define GRIT_PAUSE_H

#define pauseTilesLen 1664
extern const unsigned short pauseTiles[832];

#define pauseMapLen 8192
extern const unsigned short pauseMap[4096];

#define pausePalLen 512
extern const unsigned short pausePal[256];

#endif // GRIT_PAUSE_H

//}}BLOCK(pause)
