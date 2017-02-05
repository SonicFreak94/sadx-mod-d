module ninja.types;

/*
	Ninja Library
	
	COPYRIGHT (C) SEGA ENTERPRISES,LTD.
*/

alias Uint8   = ubyte;        /*  unsigned 1 byte integer     */
alias Sint8   = char;         /*  signed 1 byte integer       */
alias Uint16  = ushort;       /*  unsigned 2 byte integer     */
alias Sint16  = short;        /*  signed 2 byte integer       */
alias Uint32  = uint;         /*  unsigned 4 byte integer     */
alias Sint32  = int;          /*  signed 4 byte integer       */
alias Float32 = float;        /*  4 byte real number          */
alias Float64 = double;       /*  8 byte real number          */
alias Float   = float;        /*  4 byte real number          */
alias Double  = double;       /*  8 byte real number          */
alias Void    = void;         /*  void                        */
alias Bool    = Sint32;       /*  Bool                        */

/*--------------------------------------*/
/*      Basic Define                    */
/*--------------------------------------*/
alias int     Int;
alias Sint32  Angle;
alias Float[16]   NJS_MATRIX;
alias Float* NJS_MATRIX_PTR;
alias Float[128] NJS_FOG_TABLE;

enum
{
	M00, M01, M02, M03,
	M10, M11, M12, M13,
	M20, M21, M22, M23,
	M30, M31, M32, M33
}

import ninja.def : NJD_SYS_ATTR_SIZE;
alias Sint8[NJD_SYS_ATTR_SIZE] NJS_SYS_ATTR;
extern (C) alias NJS_INT_FUNC = void function();

struct NJS_SYSTEMINFO
{
	Uint32 NativeLimit;
	Uint32 NativeCurrent;
	Uint32 NativePeak;
	Uint32[5] InternalVertexBufSize;
	Uint32[5] MaxVertexBufSize;
	Uint32 LastTATime;
	Uint32 LastRenderTime;
	Uint32[5] CurrentVertexBufSize;
	Uint32 reserved0;
	Uint32 reserved1;
	Uint32 reserved2;
	Uint32 reserved3;
	Uint32 reserved4;
	Uint32 reserved5;
	Uint32 reserved6;
	Uint32 reserved7;
	Uint32 reserved8;
	Uint32 reserved9;
	Uint32 reserved10;
	Uint32 reserved11;
};

struct NJS_TEX
{
	Sint16  u;
	Sint16  v;
};

struct NJS_BGRA
{
	Uint8   b;
	Uint8   g;
	Uint8   r;
	Uint8   a;
};

union NJS_COLOR
{
	Uint32  color;
	NJS_TEX tex;
	NJS_BGRA argb;
};

struct NJS_ARGB
{
	Float   a;
	Float   r;
	Float   g;
	Float   b;
};

struct NJS_POINT2I
{
	Sint16  x;
	Sint16  y;
};

struct NJS_POINT2
{
	Float  x;
	Float  y;
};

struct NJS_POINT3
{
	Float   x;
	Float   y;
	Float   z;
};
alias NJS_POINT3 NJS_VECTOR;

struct NJS_POINT2COL
{
	NJS_POINT2*  p;
	NJS_COLOR*   col;
	NJS_COLOR*   tex;
	Uint32      num;
};

struct NJS_POINT3COL
{
	NJS_POINT3*  p;
	NJS_COLOR*   col;
	NJS_COLOR*   tex;
	Uint32      num;
};

struct NJS_LINE
{
	Float   px,py,pz;
	Float   vx,vy,vz;
};
alias NJS_LINE NJS_PLANE;
alias NJS_LINE NJS_PVECTOR;


/* コリジョン用構造体追加 */
struct NJS_SPHERE
{
	NJS_POINT3 c;
	Float      r;
};

struct NJS_CAPSULE
{
	NJS_POINT3 c1;
	NJS_POINT3 c2;
	Float      r;
};

struct NJS_BOX
{
	NJS_POINT3[8] v;
};

struct NJS_RECT
{
	NJS_POINT3[4] v;
};
/* 追加終わり */


struct NJS_VIEW
{
	NJS_MATRIX m;
	Float   px,py,pz;
	Float   vx,vy,vz;
	Angle   roll;
	Float   apx,apy,apz;
	Float   avx,avy,avz;
	Angle   aroll;
};

struct NJS_SCREEN
{
	Float   dist;
	Float   w,h;
	Float   cx,cy;
};


/*--------------------------------------*/
/*      Texture Structure               */
/*--------------------------------------*/
struct NJS_TEXSURFACE
{
	Uint32 Type;
	Uint32 BitDepth;
	Uint32 PixelFormat;
	Uint32 nWidth;
	Uint32 nHeight;
	Uint32 TextureSize;
	Uint32 fSurfaceFlags;
	Uint32* pSurface;
	Uint32* pVirtual;
	Uint32* pPhysical;
};
	
struct NJS_TEXINFO
{
	void* 			   texaddr; /* texture address   			*/
	NJS_TEXSURFACE	texsurface;	/* texture surface 				*/
};

struct NJS_TEXNAME
{
	void*            filename;  /* texture filename strings     */
	Uint32               attr;  /* texture attribute            */
	Uint32            texaddr;  /* texture memory list address  */
};

struct NJS_TEXLIST
{
	NJS_TEXNAME*     textures;  /* texture array                */
	Uint32          nbTexture;  /* texture count                */
};

struct NJS_TEXMEMLIST
{
	Uint32			globalIndex;/* global unique texture ID     */
	Uint32			bank;		/* palette bank 				*/
	Uint32			tspparambuffer;/* TSPParambuffer			*/
	Uint32			texparambuffer;/* TextureParambuffer		*/
	Uint32			texaddr;	/* texture flag					*/
	NJS_TEXINFO		texinfo;	/* texinfo						*/
	Uint16			count;		/* texture count  				*/
	Uint16			dummy;
};

struct NJS_TEXPALETTE
{
	void* 			palette;	/*	palette pointer				*/
	Uint16 			mode;		/*	color mode					*/
	Sint16 			bank;		/*	bank						*/
	Sint16 			offset;		/*	entry offset				*/
	Sint16 			count;		/*	entry count					*/
};

struct NJS_TEXERRSTAT
{
	Uint32	n;
	Uint32	globalIndex;
	Sint32	texerr;
	Sint32	gdstat;
	Sint32	gderr;
	Sint32	reserved0;
	Sint32	reserved1;
	Sint32	reserved2;
};

struct NJS_PVRHEADERDATA
{
	Uint32 nTextureType;
	Uint16 nWidth;
	Uint16 nHeight;
};

/*--------------------------------------*/
/*      Model Structure                 */
/*--------------------------------------*/
/*
 * NJS_MODEL
 */
struct NJS_MATERIAL
{
	NJS_COLOR         diffuse;
	NJS_COLOR        specular;
	Float            exponent;
	Uint32         attr_texId;  /* attribute and texture ID in texlist        */
	Uint32          attrflags;  /* attribute flags */
};

struct NJS_MESHSET
{
	Uint16          type_matId; /* meshset type and attr index
								   14-15 : meshset type bits
									0-13 : material id(0-4095)  */
	Uint16          nbMesh;     /* mesh count                   */
	Sint16*          meshes;    /* mesh array                   */
	Uint32*          attrs;     /* attribure                    */
	NJS_VECTOR*      normals;   /* mesh normal list             */
	NJS_COLOR*       vertcolor; /* polygon vertex color list    */
	NJS_COLOR*       vertuv;    /* polygon vertex uv list       */
};

struct NJS_MESHSET_SADX
{
	Uint16          type_matId; /* meshset type and attr index
	14-15 : meshset type bits
	0-13 : material id(0-4095)  */
	Uint16          nbMesh;     /* mesh count                   */
	Sint16*          meshes;    /* mesh array                   */
	Uint32*          attrs;     /* attribure                    */
	NJS_VECTOR*      normals;   /* mesh normal list             */
	NJS_COLOR*       vertcolor; /* polygon vertex color list    */
	NJS_COLOR*       vertuv;    /* polygon vertex uv list       */
	void* buffer;
};

struct NJS_MODEL
{
	NJS_POINT3*      points;    /* vertex list                  */
	NJS_VECTOR*      normals;   /* vertex normal list           */
	Sint32          nbPoint;    /* vertex count                 */
	NJS_MESHSET*     meshsets;  /* meshset list                 */
	NJS_MATERIAL*    mats;      /* material list                */
	Uint16          nbMeshset;  /* meshset count                */
	Uint16          nbMat;      /* material count               */
	NJS_POINT3      center;     /* model center                 */
	Float			r;			/* ??????????? */
};

struct NJS_MODEL_SADX
{
	NJS_POINT3*      points;    /* vertex list                  */
	NJS_VECTOR*      normals;   /* vertex normal list           */
	Sint32          nbPoint;    /* vertex count                 */
	NJS_MESHSET_SADX* meshsets;  /* meshset list                 */
	NJS_MATERIAL*    mats;      /* material list                */
	Uint16          nbMeshset;  /* meshset count                */
	Uint16          nbMat;      /* material count               */
	NJS_POINT3      center;     /* model center                 */
	Float			r;			/* ??????????? */
	void*            buffer;
};

/*
 * NJS_OBJECT
 */
struct NJS_OBJECT {
	Uint32          evalflags;  /* evalation flags              */
	NJS_MODEL*       model;     /* model data pointer           */
	Float[3]           pos;     /* translation                  */
	Angle[3]           ang;     /* rotation                     */
	Float[3]           scl;     /* scaling                      */
	NJS_OBJECT*      child;     /* child object                 */
	NJS_OBJECT*      sibling;   /* sibling object               */
};

/*
 * NJS_MOTION
 */
/* key frame animation */
struct NJS_MKEY_F
{
	Uint32          keyframe;
	Float[3]           key;
};

struct NJS_MKEY_A
{
	Uint32          keyframe;
	Angle[3]           key;     /* angle                        */
};

struct NJS_MKEY_AX
{
	Uint32          keyframe;
	Angle           angle;      /* angle                        */
	Float[3]           axe;     /* axe vector                   */
};

struct NJS_MKEY_P
{
	Uint32          keyframe;
	void*            key;        /* pointer                     */
};

struct NJS_MKEY_F1
{
	Uint32          keyframe;
	Float           key;
};

struct NJS_MKEY_F2
{
	Uint32          keyframe;
	Float[2]           key;
};

struct NJS_MKEY_SPOT
{
	Uint32          keyframe;
	Float           nrang;
	Float           frang;
	Angle           iang;
	Angle           oang;
};

struct NJS_MKEY_UI32
{
	Uint32          keyframe;
	Uint32          key;
};

struct NJS_MKEY_SI32
{
	Uint32          keyframe;
	Sint32          key;
};
alias NJS_MKEY_SI32 NJS_MKEY_A1;

struct NJS_MKEY_QUAT
{
	Uint32          keyframe;
	Float[4]           key;
};

/*
 * NJS_MDATA
 */
/* 1 factor : pos or ang or scl or shape or vec */
struct NJS_MDATA1
{
	void*[1]            p;      /* factor pointer               */
	Uint32[1]          nb;      /* factor count                 */
};

/* 2 factors : pos and ang, pos and vec(light motion), etc      */
struct NJS_MDATA2
{
	void*[2]            p;      /* factor pointer               */
	Uint32[2]          nb;      /* factor count                 */
};

/* 3 factors : pos and ang and scl, pos and ang and shape, etc  */
struct NJS_MDATA3
{
	void*[3]            p;      /* factor pointer               */
	Uint32[3]          nb;      /* factor count                 */
};

/* 4 factors : pos and ang and scl and shape, etc               */
struct NJS_MDATA4
{
	void*[4]            p;      /* factor pointer               */
	Uint32[4]          nb;      /* factor count                 */
};

/* 5 factors : etc               */
struct NJS_MDATA5
{
	void*[5]            p;      /* factor pointer               */
	Uint32[5]          nb;      /* factor count                 */
};

struct NJS_MOTION
{
	void*            mdata;     /* NJS_MDATA array              */
	Uint32          nbFrame;    /* frame count                  */
	Uint16          type;       /* motion type  NJD_MTYPE_...   */
	Uint16          inp_fn;     /* interpolation & factor count */
};

struct NJS_ACTION
{
	NJS_OBJECT*      object;    /* Object Tree top pointer      */
	NJS_MOTION*      motion;    /* motion                       */
static if(0) {
	NJS_TEXLIST*     texlist;   /* current texture list         */
}
};

struct NJS_MOTION_LINK
{
	NJS_MOTION*[2]		motion;		/* motion's pointers */
	Float[2]			frame;		/* current frames */
};

struct NJS_ACTION_LINK
{
	NJS_OBJECT*		object;		/* object's pointer */
	NJS_MOTION_LINK*	motionlink;	/* motion-link's pointer */
};


/*
 * 3DLIB WORK BUFFER
 */
union NJS_CLIP_BUF
{
	Uint32		work;	/* work	*/
	Uint32		clip;	/* clip	*/

};

struct NJS_VERTEX_BUF
{
	NJS_CLIP_BUF a;			/* union			: 32		*/
	Float		sx,sy;		/* screen point		: 36 40		*/
	Float		oow;		/* 1/w				: 44		*/
	NJS_POINT3	point;		/* vertex point		:  0  4  8	*/
	Uint32		reserve;	/* clip				: 28		*/
	Float		u,v;		/* U, V				: 48 52		*/
	Float[2]		inten;	/* Intensity		: 56 60		*/
	NJS_VECTOR	vector;		/* vertex normal	: 12 16 20	*/
	Uint32		flag;		/* flag				: 24		*/
};			/* TotalSize		: 64		*/

struct NJS_VERTEX_BUF2
{
	NJS_CLIP_BUF a;			/* union			: 4	*/
	Float		sx,sy;		/* screen point		:12	*/
	Float		oow;		/* 1/w				:16	*/
	NJS_POINT3	point;		/* vertex point		:44	*/
	Uint32		reserve;	/* clip				:64	*/
	NJS_ARGB	col;
	NJS_VECTOR	vector;		/* vertex normal	:56	*/
	Uint32		flag;		/* flag				:58	*/
};			/* TotalSize		: 64		*/


struct NJS_VERTEX_BUF_0
{
	NJS_CLIP_BUF a;			/* union			: 32		*/
	Float		sx,sy;		/* screen point		: 36 40		*/
	Float		oow;		/* 1/w				: 44		*/
	NJS_POINT3	point;		/* vertex point		:  0  4  8	*/
	Uint32		reserve;	/* clip				: 28		*/
	Float		u,v;		/* U, V				: 48 52		*/
	Float[2]		inten;	/* Intensity		: 56 60		*/
	NJS_VECTOR	vector;		/* vertex normal	: 12 16 20	*/
	Uint32		flag;		/* flag				: 24		*/
};

struct NJS_VERTEX_BUF_1
{
	NJS_CLIP_BUF a;			/* union			: 4	*/
	Float		sx,sy;		/* screen point		:12	*/
	Float		oow;		/* 1/w				:16	*/
	NJS_POINT3	point;		/* vertex point		:44	*/
	Uint32		reserve;	/* clip				:64	*/
	NJS_ARGB	col;
	NJS_VECTOR	vector;		/* vertex normal	:56	*/
	Uint32		flag;		/* flag				:58	*/
};

struct NJS_VERTEX_BUF_3
{
	NJS_CLIP_BUF a;			/* union			: 4	*/
	Float		sx,sy;		/* screen point		:12	*/
	Float		oow;		/* 1/w				:16	*/
	Float		u,v;		/* U V				:24	*/
	Uint32[2]		col;		/* pack col			:32	*/
	NJS_POINT3	point;		/* vertex point		:44	*/
	NJS_VECTOR	vector;		/* vertex normal	:56	*/
	Uint32		flag;		/* flag				:58	*/
	Uint32		reserve;	/* clip				:64	*/
};

struct NJS_VERTEX_BUF_7
{
	NJS_CLIP_BUF a;			/* union			: 32		*/
	Float		sx,sy;		/* screen point		: 36 40		*/
	Float		oow;		/* 1/w				: 44		*/
	NJS_POINT3	point;		/* vertex point		:  0  4  8	*/
	Uint32		reserve;	/* clip				: 28		*/
	Float		u,v;		/* U, V				: 48 52		*/
	Float[2]		inten;	/* Intensity		: 56 60		*/
	NJS_VECTOR	vector;		/* vertex normal	: 12 16 20	*/
	Uint32		flag;		/* flag				: 24		*/
};

struct NJS_VERTEX_BUF_X
{
	NJS_VECTOR	vector;		/* vertex normal	:12	*/
	Uint32		clip;		/* clip				:16	*/
	Float		sx,sy;		/* screen point		:24	*/
	Float		oow;		/* 1/w				:28	*/
	Float		inten;		/* intensity		:32	*/
};


/*--------------------------------------*/
/*      Light Structure                 */
/*--------------------------------------*/
/*
 * NJS_LIGHT_CAL
 */
struct NJS_LIGHT_CAL
{
/*************/
	Float       ratten;         /* attenuation rate             */
	Float       ipd;		    /* inner product                */
/*************/
	Float       nrr;            /* limit judgment value         */
	Float       frr;            /* limit judgment value         */
	Float       cosi;           /* limit judgment value         */
	Float       cose;           /* limit judgment value         */
	Float		idev;           /* judgment value of devision   */
	Float		odev;           /* judgment value of devision   */
	Float       rate;           /* attenuation rate(calculated) */
	Float       intns;          /* Intensity (0-1)              */
	Int         exp;            /* exponent(SGI):material       */
/*************/
	Int         reserve;        /*                              */
/*************/
	NJS_POINT3  lpnt;           /* point vector                 */
	NJS_VECTOR  lvctr;          /* directional vector           */
/*************/
	NJS_VECTOR  lmvctr;         /* directional vector           */
/*************/
	NJS_ARGB    atten;          /* intns * argb                 */
	NJS_ARGB    amb;            /* iamb*atten                   */
	NJS_ARGB    dif;            /* idif*atten                   */
	NJS_ARGB    spc;            /* ispc*atten                   */
/*************/
	NJS_ARGB    mamb;           /* amb*material                 */
	NJS_ARGB    mdif;           /* dif*material                 */
	NJS_ARGB    mspc;           /* spc*material                 */
/*************/
};
alias NJS_LIGHT_CAL* NJS_LIGHT_CAL_PTR;

/*
 * NJS_LIGHT_ATTR
 */
struct NJS_LIGHT_ATTR
{
	Int             lsrc;       /* the kind of light source     */
	Float           iamb;       /* ambient's intensity          */
	Float           idif;       /* deffuse light's intensity    */
	Float           ispc;       /* specular light's intensity   */
	Float           nrang;      /* limit value (nearest)        */
	Float           frang;      /* limit value (farthest)       */
	void*            func;       /* the pointer of Callback func.*/
	Angle           iang;       /* limit value (inside)         */
	Angle           oang;       /* limit value (outside)        */
	NJS_ARGB        argb;       /* light's color                */
};
alias NJS_LIGHT_ATTR* NJS_LIGHT_ATTR_PTR;

/*
 * NJS_LIGHT
 */
struct NJS_LIGHT
{
	NJS_MATRIX      mtrx;       /* matrix                       */
	NJS_POINT3      pnt;        /* point vector                 */
	NJS_VECTOR      vctr;       /* directional vector           */
	Int             stat;       /* status                       */
	Int             reserve;    /* reserve                      */
	NJS_LIGHT_CAL   ltcal;      /* calculation                  */
	NJS_LIGHT_ATTR  attr;       /* attribute                    */
};
alias NJS_LIGHT* NJS_LIGHT_PTR;

/*
 * NJS_LIGHT_MATERIAL
 */
struct NJS_LIGHT_MATERIAL
{
	NJS_ARGB        ambient;    /* Ambient color from Material	*/
	NJS_ARGB        diffuse;    /* Diffuse color from Material	*/
	NJS_ARGB        specular;   /* Specular color from Material	*/
	Float           exponent;   /* Exponent from Material		*/
};

/*
 * NJF_LIGHT_FUNC
 */
extern (C) alias NJF_LIGHT_FUNC = void function(NJS_ARGB*, NJS_POINT3*, NJS_VECTOR*, NJS_LIGHT_PTR);

/*--------------------------------------*/
/*      Camera Structure                */
/*--------------------------------------*/

struct NJS_CAMERA
{
	Float px, py, pz;
	Float vx, vy, vz;
	Angle roll;
	Angle ang;
	Float n_clip;
	Float f_clip;
	NJS_VECTOR lx,ly;
};

/*--------------------------------------*/
/*   Light & Camera Motion Structure    */
/*--------------------------------------*/

struct NJS_LACTION
{
	NJS_LIGHT*	light;
	NJS_MOTION*	motion;
};

struct NJS_CACTION
{
	NJS_CAMERA*	camera;
	NJS_MOTION*	motion;
};

struct NJS_MOTION_DATA
{
	Float*	pos;
	Angle*	ang;
	Float*	scl;
};

struct NJS_CMOTION_DATA
{
	Float*	pos;
	Float*	vect;
	Angle*	roll;
	Angle*	ang;
};

struct NJS_LMOTION_DATA
{
	Float*	pos;
	Float*	vect;
	Float*	rgb;
	Float*	inten;
	Float* 	rang;
	Angle*	ang;
};

/*--------------------------------------*/
/*      Scroll Structure                */
/*--------------------------------------*/
/*
 * NJS_SCLATTR
 */
alias Uint32 NJS_SCLATTR;     /* scroll attribute structure   */

/*
 * NJS_SCLMTRX
 */
alias Float[4] NJS_SCLMTRX;   /* scroll rotation matrix       */

/*
 *NJS_SCROLL
 */
struct NJS_SCROLL
{
	Uint16      celps;          /* pixel size of the cells      */
	Uint16      mapw;           /* number of the width of map   */
	Uint16      maph;           /* number of the height of map  */
	Uint16      sw,sh;          /* size of the scroll draw      */
	NJS_TEXLIST* list;			/* texlist ID                   */
	Uint32*      map;           /* map array pointer            */
	Float       px,py;          /* scroll transration           */
	Float       bx,by;          /* map draw scroll              */
	Float       pr;             /* priority                     */
	Uint16      sflag;          /* scale flag                   */
	Float       sx,sy;          /* scale x,y                    */
	Float		spx,spy;		/* center of scale x,y			*/
	Uint16      mflag;          /* matrix flag                  */
	Float       cx,cy;          /* center of rotation x,y       */
	NJS_SCLMTRX m;              /* rotation matrix              */
	Uint32      colmode;        /* color mode                   */
	NJS_POINT2[2]	clip;
	NJS_SCLATTR attr;           /* scroll attribute             */
	NJS_COLOR	sclc;
};

enum SM {
	_SM00,_SM01,
	_SM10,_SM11
};

/*--------------------------------------*/
/*      Sprite                          */
/*--------------------------------------*/
struct NJS_TEXANIM
{
	Sint16		sx,sy;			/* size				*/
	Sint16      cx,cy;          /* center           */
	Sint16      u1,v1;          /* upper left       */
	Sint16      u2,v2;          /* lower right      */
	Sint16      texid;          /* texture id       */
	Sint16      attr;           /* attribute        */
};

struct NJS_SPRITE
{
	NJS_POINT3  p;              /* point            */
	Float       sx,sy;          /* scale            */
	Angle       ang;            /* angle            */
	NJS_TEXLIST* tlist;         /* texture list     */
	NJS_TEXANIM* tanim;         /* animation list   */
};

/*--------------------------------------*/
/*      Low Level                       */
/*--------------------------------------*/

struct NJS_POLYGON_VTX
{
	Float	x;
	Float	y;
	Float	z;
	Uint32	col;
};

struct NJS_TEXTURE_VTX
{
	Float	x;
	Float	y;
	Float	z;
	Float	u;
	Float	v;
	Uint32	col;
};

struct NJS_TEXTUREH_VTX
{
	Float	x;
	Float	y;
	Float	z;
	Float	u;
	Float	v;
	Uint32	bcol;
	Uint32	ocol;
};

/*--------------------------------------*/
/*      Math                            */
/*--------------------------------------*/
struct NJS_SPLINE
{
	int		keys;			/* keyframes between two points which must be interpolated */
	int*		iparam;		/* attribute data (integer) */
	float*	fparam;		/* attribute data (float) */
};

struct NJS_QUATERNION
{
	float	re;					/* real (or scalor) part of quaternion		*/
	float[3]	im;				/* imaginary (or vector) part of quaternion	*/
};


/*--------------------------------------*/
/*      Multi Pass                      */
/*--------------------------------------*/

struct NJS_PASS_INFO
{
	Bool			bPreSort;
	Sint32[5]			nSize;
};

struct NJS_VERTEXBUFFER_INFO
{
	Sint32			nNumOfMaxPass;
	NJS_PASS_INFO[8]	sPassInfo;
};


/*--------------------------------------*/
/*      Quad Draw                       */
/*--------------------------------------*/

struct NJS_QUAD_TEXTURE
{
	Float	x1,y1,x2,y2;
	Float	u1,v1,u2,v2;
};

struct NJS_QUAD_TEXTURE_EX
{
	Float	x,y,z;
	Float	vx1,vy1;
	Float	vx2,vy2;
	Uint32	dmy;
	Float	u,v;
	Float	vu1,vv1;
	Float	vu2,vv2;
	Uint32[2]	dmy2;
};




 /* _NINJA_STR_H_ */
