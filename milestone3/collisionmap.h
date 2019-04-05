
//{{BLOCK(collisionmap)

//======================================================================
//
//	collisionmap, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 3 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 192 + 2048 = 2752
//
//	Time-stamp: 2019-04-02, 21:45:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_COLLISIONMAP_H
#define GRIT_COLLISIONMAP_H

#define collisionmapTilesLen 192
extern const unsigned short collisionmapTiles[96];

#define collisionmapMapLen 2048
extern const unsigned short collisionmapMap[1024];

#define collisionmapPalLen 512
extern const unsigned short collisionmapPal[256];

#endif // GRIT_COLLISIONMAP_H

//}}BLOCK(collisionmap)
