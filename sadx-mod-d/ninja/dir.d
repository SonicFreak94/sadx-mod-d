module ninja.dir;

import ninja.types;

/*


COPYRIGHT (C) SEGA ENTERSRISES,LTD.
*/


struct NJS_DIRECT_HEAD
{
	Float		x,y,z;
	Float		r;
	void		*next;
	Uint32		nOP,nTR;
	Uint32		mode;					/* 0:normal 1:D8				*/
}

struct NJS_DIRECT_GLOBAL
{
	Uint32		GP;
	Uint32		mode;					/* 0:normal 1:environment map	*/
	Float		sg,sb,sa,sr;
	Float		dg,db,da,dr;
	Uint32		TSPPARAM,TEXTUREADDR;
	Uint32		GLOBALPARAM,ISPPARAM;
	Uint32		num;
	Uint32		texid;
}

struct NJS_DIRECT_GLOBAL_D8
{
	Uint32		GP;
	Uint32		mode;
	Uint32		TSPPARAM,TEXTUREADDR;
	Uint32		GLOBALPARAM,ISPPARAM;
	Uint32		num;
	Uint32		texid;
}

struct NJS_DIRECT_VERTEX
{
	Float		px,py,pz;
	Float		nz,nx,ny;
	Uint32		uv;
	Uint32		param;
}

struct NJS_DIRECT_VERTEX_D8
{
	Float		px,py,pz,one;
	Uint32		base,off;
	Uint32		param;
	Uint32		uv;
}

struct NJS_DIRECT_BUF
{
	Float		px,py,pz;
	Float		nx,ny,nz;
	Uint32		col;
	Uint32		dmy;
}

struct NJS_DIRECT_COMPILE_LIGHT
{
	Float	x,y,z;
	Float	inten,ambient;
	Float	r,g,b;
}

 /* _NINJA_DIR_H_ */

/*
 * End Of File
 */
