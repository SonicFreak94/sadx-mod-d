module ninja.cnk;

import ninja.types;
import ninja.def;

/*


	COPYRIGHT (C) SEGA ENTERPRISES,LTD.
*/


/*======================================*/
/*                                      */
/*      Chunk Table                     */
/*                                      */
/*======================================*/
/* Chunk type offset */
enum NJD_NULLOFF =             0; /* null chunk (16 bits size)            */
enum NJD_BITSOFF =             1; /* chunk bits offset (16 bits size)     */
enum NJD_TINYOFF =             8; /* chunk tiny offset (32 bits size)     */
enum NJD_MATOFF =             16; /* chunk material offset (32 bits size) */
enum NJD_VERTOFF =            32; /* chunk vertex offset (32 bits size)   */
enum NJD_VOLOFF =             56; /* chunk volume offset (32 bits size)   */
enum NJD_STRIPOFF =           64; /* chunk strip offset                   */
enum NJD_ENDOFF =            255; /* end chunk offset (16 bits size)      */

/*------------*/
/* Chunk Null */
/*------------*/
/* <Format>=[ChunkHead(16)](16 bits chunk) */
enum NJD_CN =     (NJD_NULLOFF+0);/* NULL chunk for boundary control      */

/*-----------*/
/* Chunk End */
/*-----------*/
/* <Format>=[ChunkHead(16)](16 bits chunk) */
enum NJD_CE =      (NJD_ENDOFF+0);

/*------------*/
/* Chunk Bits */
/*------------*/
/* <Format>=[bits(8)|ChunkHead(8)](16 bits chunk) */
/* BA  : Blend Alpha                      */
/*       13-11 = SRC Alpha Instruction(3) */
/*       10- 8 = DST Alpha Instruction(3) */
/* DA  : Mipmap 'D' adjust                */
/*       11- 8 = Mipmap 'D' adjust(4)     */
/* EXP : Specular Exponent                */
/*       12- 8 = Exponent(5) range:0-16   */
/* CP  : Cache Polygon List               */
/*       15- 8 = Cache Number range:0-255 */
/* DP  : Draw Polygon List                */
/*       15- 8 = Cache Number range:0-255 */
enum NJD_CB_BA =   (NJD_BITSOFF+0);
enum NJD_CB_DA =   (NJD_BITSOFF+1);
enum NJD_CB_EXP =  (NJD_BITSOFF+2);
enum NJD_CB_CP =   (NJD_BITSOFF+3);
enum NJD_CB_DP =   (NJD_BITSOFF+4);


/*------------*/
/* Chunk Tiny */
/*------------*/
/* <Format>=[headbits(8)|ChunkHead(8)][texbits(3)|TexId(13)] (32 bits chunk) */
/* TID : Set Texture                      */
/*     <headbits>                         */
/*       15-14 = FlipUV(2)                */
/*       13-12 = ClampUV(2)               */
/*       11- 8 = Mipmap 'D' adjust(4)     */
/*     <texbits>                          */
/*       15-14 = Filter Mode(2)           */
/*       13    = Super Sample(1)          */
/*     (TexId Max = 8191)                 */
enum NJD_CT_TID =  (NJD_TINYOFF+0);

/* 2para modifier */
enum NJD_CT_TID2 = (NJD_TINYOFF+1);

/*----------------*/
/* Chunk Material */
/*----------------*/
/* <Format>=[ChunkHead][Size][Data]                        */
/*       13-11 = SRC Alpha Instruction(3)                  */
/*       10- 8 = DST Alpha Instruction(3)                  */
/* D  : Diffuse (ARGB)                            bit 0    */
/* A  : Ambient (RGB)                             bit 1    */
/* S  : Specular(ERGB) E:exponent(5) range:0-16   bit 2    */
enum NJD_CM_D =    (NJD_MATOFF+1);  /* [CHead][4(Size)][ARGB]              */
enum NJD_CM_A =    (NJD_MATOFF+2);  /* [CHead][4(Size)][NRGB] N: NOOP(255) */
enum NJD_CM_DA =   (NJD_MATOFF+3);  /* [CHead][8(Size)][ARGB][NRGB]        */
enum NJD_CM_S =    (NJD_MATOFF+4);  /* [CHead][4(Size)][ERGB] E: Exponent  */
enum NJD_CM_DS =   (NJD_MATOFF+5);  /* [CHead][8(Size)][ARGB][ERGB]        */
enum NJD_CM_AS =   (NJD_MATOFF+6);  /* [CHead][8(Size)][NRGB][ERGB]        */
enum NJD_CM_DAS =  (NJD_MATOFF+7);  /* [CHead][12(Size)][ARGB][NRGB][ERGB] */

/* Bump */
enum NJD_CM_BU =   (NJD_MATOFF+8);  /* [CHead][12(Size)][dx(16)][dy(16)][dz(16)]
									   [ux(16)][uy(16)][uz(16)]            */

/* 2para modifier */
enum NJD_CM_D2 =   (NJD_MATOFF+9);  /* [CHead][4(Size)][ARGB]              */
enum NJD_CM_A2 =   (NJD_MATOFF+10); /* [CHead][4(Size)][NRGB] N: NOOP(255) */
enum NJD_CM_DA2 =  (NJD_MATOFF+11); /* [CHead][8(Size)][ARGB][NRGB]        */
enum NJD_CM_S2 =   (NJD_MATOFF+12); /* [CHead][4(Size)][ERGB] E: Exponent  */
enum NJD_CM_DS2 =  (NJD_MATOFF+13); /* [CHead][8(Size)][ARGB][ERGB]        */
enum NJD_CM_AS2 =  (NJD_MATOFF+14); /* [CHead][8(Size)][NRGB][ERGB]        */
enum NJD_CM_DAS2 = (NJD_MATOFF+15); /* [CHead][12(Size)][ARGB][NRGB][ERGB] */

/*--------------*/
/* Chunk Vertex */
/*--------------*/
/* <Format>=[headbits(8)|ChunkHead(8)]                                    */
/*          [Size(16)][IndexOffset(16)][nbIndices(16)]                    */
/*     <headbits>(NF only)                                                */
/*        9- 8 = WeightStatus(2) Start, Middle, End                       */
/* VN  : use vertex normal                                                */
/* VNX : 32bits vertex normal  reserved(2)|x(10)|y(10)|z(10)              */
/* SH  : SH4 optimize                                                     */
/* D8  : Diffuse ARGB8888 only                                            */
/* S5  : Diffuse RGB565 and Specular RGB565                               */
/* S4  : Diffuse RGB4444 and Specular RGB565                              */
/* IN  : Diffuse(16)|Specular(16)                                         */
/* NF  : NinjaFlags32 for extention                                       */
/* UF  : UserFlags32                                                      */
 
/* optimize for SH4 */
enum NJD_CV_SH =     (NJD_VERTOFF+0);  /* x,y,z,1.0F, ...                 */
enum NJD_CV_VN_SH =  (NJD_VERTOFF+1);  /* x,y,z,1.0F,nx,ny,nz,0.0F,...    */

/* chunk vertex */
enum NJD_CV =        (NJD_VERTOFF+2);  /* x,y,z, ...                      */
enum NJD_CV_D8 =     (NJD_VERTOFF+3);  /* x,y,z,D8888,...                 */  
enum NJD_CV_UF =     (NJD_VERTOFF+4);  /* x,y,z,UserFlags32, ...          */
enum NJD_CV_NF =     (NJD_VERTOFF+5);  /* x,y,z,NinjaFlags32,...          */
enum NJD_CV_S5 =     (NJD_VERTOFF+6);  /* x,y,z,D565|S565,...             */
enum NJD_CV_S4 =     (NJD_VERTOFF+7);  /* x,y,z,D4444|S565,...            */
enum NJD_CV_IN =     (NJD_VERTOFF+8);  /* x,y,z,D16|S16,...               */
 
enum NJD_CV_VN =     (NJD_VERTOFF+9);  /* x,y,z,nx,ny,nz, ...             */
enum NJD_CV_VN_D8 =  (NJD_VERTOFF+10); /* x,y,z,nx,ny,nz,D8888,...        */
enum NJD_CV_VN_UF =  (NJD_VERTOFF+11); /* x,y,z,nx,ny,nz,UserFlags32,...  */
enum NJD_CV_VN_NF =  (NJD_VERTOFF+12); /* x,y,z,nx,ny,nz,NinjaFlags32,... */
enum NJD_CV_VN_S5 =  (NJD_VERTOFF+13); /* x,y,z,nx,ny,nz,D565|S565,...    */
enum NJD_CV_VN_S4 =  (NJD_VERTOFF+14); /* x,y,z,nx,ny,nz,D4444|S565,...   */
enum NJD_CV_VN_IN =  (NJD_VERTOFF+15); /* x,y,z,nx,ny,nz,D16|S16,...      */

enum NJD_CV_VNX =    (NJD_VERTOFF+16); /* x,y,z,nxyz32, ...               */
enum NJD_CV_VNX_D8 = (NJD_VERTOFF+17); /* x,y,z,nxyz32,D8888,...          */
enum NJD_CV_VNX_UF = (NJD_VERTOFF+18); /* x,y,z,nxyz32,UserFlags32,...    */


/*--------------*/
/* Chunk vOlume */
/*--------------*/
/* UserFlags N=0,1(16bit*1),2(16bit*2),3(16bit*3)                         */
/* <Format P3>=[ChunkHead(16)][Size(16)][UserOffset(2)|nbPolygon(14)]     */
/*            i0, i1, i2, UserflagPoly0(*N),                              */
/*            i3, i4, i5, UserflagPoly1(*N), ...                          */
/* <Format P4>=[ChunkHead(16)][Size(16)][UserOffset(2)|nbPolygon(14)]     */
/*            i0, i1, i2, i3, UserflagPoly0(*N),                          */
/*            i4, i5, i6, i7, UserflagPoly1(*N), ...                      */
/* <Format ST>=[ChunkHead(16)][Size(16)][UserOffset(2)|nbStrip(14)]       */
/*          [flag|len, i0, i1, i2, Userflag2(*N), i3, Userflag3(*N), ...  */
/* P3  : Polygon3     (Modifier Volume)                                   */
/* P4  : Polygon4                                                         */
/* ST  : triangle STrip(Trimesh)                                          */

enum NJD_CO_P3 =       (NJD_VOLOFF+0);
enum NJD_CO_P4 =       (NJD_VOLOFF+1);
enum NJD_CO_ST =       (NJD_VOLOFF+2);

/*-------------*/
/* Chunk Strip */
/*-------------*/
/* UserFlags N=0,1(16bit*1),2(16bit*2),3(16bit*3)                         */
/* <Format1>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15), index0(16), index1(16),                    */
/*            index2, UserFlag2(*N), ...]                                 */
/* <Format2>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15),                                            */
/*            index0(16), U0(16), V0(16),                                 */
/*            index1, U1, V1,                                             */
/*            index2, U2, V2, UserFlag2(*N), ... ]                        */
/* <Format3>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15),                                            */
/*            index0(16), vnx0(16), vny0(16), vnz0(16),                   */
/*            index1, vnx1, vny1, vny1,                                   */
/*            index2, vnx2, vny2, vnz2, UserFlag2(*N),                    */
/*            index3, vnx2, vny2, vnz2, UserFlag3(*N), ... ]              */
/* <Format4>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15),                                            */
/*            index0(16), U0(16), V0(16), vnx0(16), vny0(16), vnz0(16),   */
/*            index1, U1, V1, vnx1, vny1, vny1,                           */
/*            index2, U2, V2, vnx2, vny2, vnz2, UserFlag2(*N),            */
/*            index3, U3, V3, vnx3, vny3, vnz3, UserFlag3(*N), ... ]      */
/* <Format5>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15),                                            */
/*            index0(16), AR0(16), GB0(16),                               */
/*            index1, AR1, GB1,                                           */
/*            index2, AR2, GB2, UserFlag2(*N),                            */
/*            index3, AR3, GB3, UserFlag3(*N), ... ]                      */
/* <Format6>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15),                                            */
/*            index0(16), U0(16), V0(16), AR0(16), GB0(16),               */
/*            index1, U1, V1, AR1, GB1,                                   */
/*            index2, U2, V2, AR2, GB2, UserFlag2(*N), ... ]              */
/*                                                                        */
/* << 2para modifiler >>                                                  */
/* <Format7>=[CFlags(8)|CHead(8)][Size(16)][UserOffset(2)|nbStrip(14)]    */
/*           [flag(1)|len(15),                                            */
/*            index0(16), U0a(16), V0a(16), U0b(16), V0b(16),             */
/*            index1, U1a, V1a, U1b, V1b,                                 */
/*            index2, U2a, V2a, U2b, V2b, UserFlag2(*N), ... ]            */
/*                                                                        */
/* UV  : Uv (0-255)                                                       */
/* UVH : Uv (0-1023)                                                      */
/* VN  : Vertex Normal                                                    */
/* D8  : Strip Color ARGB8888                                             */

enum NJD_CS =          (NJD_STRIPOFF+0);  /* <Format1>   */
enum NJD_CS_UVN =      (NJD_STRIPOFF+1);  /* <Format2>   */
enum NJD_CS_UVH =      (NJD_STRIPOFF+2);  /* <Format2>   */

enum NJD_CS_VN =       (NJD_STRIPOFF+3);  /* <Format3>   */
enum NJD_CS_UVN_VN =   (NJD_STRIPOFF+4);  /* <Format4>   */
enum NJD_CS_UVH_VN =   (NJD_STRIPOFF+5);  /* <Format4>   */

enum NJD_CS_D8 =       (NJD_STRIPOFF+6);  /* <Format5>   */
enum NJD_CS_UVN_D8 =   (NJD_STRIPOFF+7);  /* <Format6>   */
enum NJD_CS_UVH_D8 =   (NJD_STRIPOFF+8);  /* <Format6>   */

/* 2para modifier */
enum NJD_CS_2 =        (NJD_STRIPOFF+9);  /* <Format1>   */
enum NJD_CS_UVN2 =     (NJD_STRIPOFF+10); /* <Format7>   */
enum NJD_CS_UVH2 =     (NJD_STRIPOFF+11); /* <Format7>   */

/*======================================*/
/*                                      */
/*      Chunk Flags                     */
/*                                      */
/*======================================*/
/*------------*/
/* Chunk Bits */
/*------------*/

/** Flags Blending SRC **/

/* ZER : Zero                                            */
/* ONE : One                                             */
/* OC  : `Other' Color                                   */
/* IOC : Inverse `Other' Color                           */
/* SA  : Src Alpha                                       */
/* ISA : Inverse SRC Alpha                               */
/* DA  : DST Alpha                                       */
/* IDA : Inverse DST Alpha                               */

/* Flag Blending Src */

enum NJD_FBS_SHIFT =     11;
enum NJD_FBS_ZER =      (0<<NJD_FBS_SHIFT);
enum NJD_FBS_ONE =      (1<<NJD_FBS_SHIFT);
enum NJD_FBS_OC =       (2<<NJD_FBS_SHIFT);
enum NJD_FBS_IOC =      (3<<NJD_FBS_SHIFT);
enum NJD_FBS_SA =       (4<<NJD_FBS_SHIFT);
enum NJD_FBS_ISA =      (5<<NJD_FBS_SHIFT);
enum NJD_FBS_DA =       (6<<NJD_FBS_SHIFT);
enum NJD_FBS_IDA =      (7<<NJD_FBS_SHIFT);

enum NJD_FBS_MASK =     (0x7<<NJD_FBS_SHIFT);

/* Flag Blending Dst */

enum NJD_FBD_SHIFT =     8;
enum NJD_FBD_ZER =      (0<<NJD_FBD_SHIFT);
enum NJD_FBD_ONE =      (1<<NJD_FBD_SHIFT);
enum NJD_FBD_OC =       (2<<NJD_FBD_SHIFT);
enum NJD_FBD_IOC =      (3<<NJD_FBD_SHIFT);
enum NJD_FBD_SA =       (4<<NJD_FBD_SHIFT);
enum NJD_FBD_ISA =      (5<<NJD_FBD_SHIFT);
enum NJD_FBD_DA =       (6<<NJD_FBD_SHIFT);
enum NJD_FBD_IDA =      (7<<NJD_FBD_SHIFT);

enum NJD_FBD_MASK =     (0x7<<NJD_FBD_SHIFT);

/** Flag 'D' Adjust **/

enum NJD_FDA_SHIFT =     8;
enum NJD_FDA_025 =      (1<<NJD_FDA_SHIFT);      /* 0.25 */
enum NJD_FDA_050 =      (2<<NJD_FDA_SHIFT);      /* 0.50 */
enum NJD_FDA_075 =      (3<<NJD_FDA_SHIFT);      /* 0.75 */
enum NJD_FDA_100 =      (4<<NJD_FDA_SHIFT);      /* 1.00 */
enum NJD_FDA_125 =      (5<<NJD_FDA_SHIFT);      /* 1.25 */
enum NJD_FDA_150 =      (6<<NJD_FDA_SHIFT);      /* 1.50 */
enum NJD_FDA_175 =      (7<<NJD_FDA_SHIFT);      /* 1.75 */
enum NJD_FDA_200 =      (8<<NJD_FDA_SHIFT);      /* 2.00 */
enum NJD_FDA_225 =      (9<<NJD_FDA_SHIFT);      /* 2.25 */
enum NJD_FDA_250 =      (10<<NJD_FDA_SHIFT);     /* 2.25 */
enum NJD_FDA_275 =      (11<<NJD_FDA_SHIFT);     /* 2.25 */
enum NJD_FDA_300 =      (12<<NJD_FDA_SHIFT);     /* 3.00 */
enum NJD_FDA_325 =      (13<<NJD_FDA_SHIFT);     /* 3.25 */
enum NJD_FDA_350 =      (14<<NJD_FDA_SHIFT);     /* 3.50 */
enum NJD_FDA_375 =      (15<<NJD_FDA_SHIFT);     /* 3.75 */

enum NJD_FDA_MASK =     (0xf<<NJD_FDA_SHIFT);

/** Flag EXPonent range : 0-16 **/

enum NJD_FEXP_SHIFT =    8;
enum NJD_FEXP_00 =      (0<<NJD_FEXP_SHIFT);     /*  0.0 */
enum NJD_FEXP_01 =      (1<<NJD_FEXP_SHIFT);     /*  1.0 */
enum NJD_FEXP_02 =      (2<<NJD_FEXP_SHIFT);     /*  2.0 */
enum NJD_FEXP_03 =      (3<<NJD_FEXP_SHIFT);     /*  3.0 */
enum NJD_FEXP_04 =      (4<<NJD_FEXP_SHIFT);     /*  4.0 */
enum NJD_FEXP_05 =      (5<<NJD_FEXP_SHIFT);     /*  5.0 */
enum NJD_FEXP_06 =      (6<<NJD_FEXP_SHIFT);     /*  6.0 */
enum NJD_FEXP_07 =      (7<<NJD_FEXP_SHIFT);     /*  7.0 */
enum NJD_FEXP_08 =      (8<<NJD_FEXP_SHIFT);     /*  8.0 */
enum NJD_FEXP_09 =      (9<<NJD_FEXP_SHIFT);     /*  9.0 */
enum NJD_FEXP_10 =      (10<<NJD_FEXP_SHIFT);    /* 10.0 */
enum NJD_FEXP_11 =      (11<<NJD_FEXP_SHIFT);    /* 11.0 */
enum NJD_FEXP_12 =      (12<<NJD_FEXP_SHIFT);    /* 12.0 */
enum NJD_FEXP_13 =      (13<<NJD_FEXP_SHIFT);    /* 13.0 */
enum NJD_FEXP_14 =      (14<<NJD_FEXP_SHIFT);    /* 14.0 */
enum NJD_FEXP_15 =      (15<<NJD_FEXP_SHIFT);    /* 15.0 */
enum NJD_FEXP_16 =      (16<<NJD_FEXP_SHIFT);    /* 16.0 */

enum NJD_FEXP_MASK =    (0x1f<<NJD_FEXP_SHIFT);


/*--------------------*/
/* Chunk Multi Lights */
/*--------------------*/

enum NJD_CNK_EASY_MULTILIGHT_1 =			1;
enum NJD_CNK_EASY_MULTILIGHT_2 =			2;
enum NJD_CNK_EASY_MULTILIGHT_3 =			3;
enum NJD_CNK_EASY_MULTILIGHT_4 =			4;
enum NJD_CNK_EASY_MULTILIGHT_5 =			5;
enum NJD_CNK_EASY_MULTILIGHT_6 =			6;

enum NJD_CNK_EASY_MULTILIGHT_ALL =			0;

enum NJD_CNK_SIMPLE_MULTILIGHT_1 =			1;
enum NJD_CNK_SIMPLE_MULTILIGHT_2 =			2;
enum NJD_CNK_SIMPLE_MULTILIGHT_3 =			3;
enum NJD_CNK_SIMPLE_MULTILIGHT_4 =			4;
enum NJD_CNK_SIMPLE_MULTILIGHT_5 =			5;
enum NJD_CNK_SIMPLE_MULTILIGHT_6 =			6;

enum NJD_CNK_SIMPLE_MULTILIGHT_ALL =		0;


/*------------*/
/* Chunk Tiny */
/*------------*/
/** TexId **/
/* Flag FLip <headbits> */
enum NJD_FFL_U =         BIT_15;
enum NJD_FFL_V =         BIT_14;
/* Flag CLamp <headbits> */
enum NJD_FCL_U =         BIT_13;
enum NJD_FCL_V =         BIT_12;

  /* Look at Chunk Bits about 'D' adust */

/* Flag Filter Mode<texbits> */
/* PS   : Point Sampled                   */
/* BF   : Bilinear Filter                 */
/* TF_A : Tri-liner Filter A              */
/* TF_B : Tri-liner Filter B              */
enum NJD_FFM_SHIFT =      14;
enum NJD_FFM_PS =        (0<<NJD_FFM_SHIFT);
enum NJD_FFM_BF =        (1<<NJD_FFM_SHIFT);
enum NJD_FFM_TF_A =      (2<<NJD_FFM_SHIFT);
enum NJD_FFM_TF_B =      (3<<NJD_FFM_SHIFT);

enum NJD_FFM_MASK =      (0x3<<NJD_FFM_SHIFT);

/* Flag Super Sample<texbits> */
enum NJD_FSS =           BIT_13;

enum NJD_TID_MASK =      (~(NJD_FSS|NJD_FFM_MASK));

/*--------------*/
/* Chunk Vertex */
/*--------------*/
/* Flag Weight status (NF only) */
enum NJD_FW_SHIFT =     8;
enum NJD_FW_START =    (0<<NJD_FW_SHIFT);      /* Start  */
enum NJD_FW_MIDDLE =   (1<<NJD_FW_SHIFT);      /* Middle */
enum NJD_FW_END =      (2<<NJD_FW_SHIFT);      /* End    */

enum NJD_FW_MASK =     (0x2<<NJD_FW_SHIFT);

/* Flag Vertex */
enum NJD_FV_SHIFT =     8;
enum NJD_FV_CONT =     (0x80<<NJD_FV_SHIFT);   /* vertex calculation continue */

/*-------------*/
/* Chunk Strip */
/*-------------*/
/** Flag STrip **/
/* <Format>=[ChunkFlags(8)|ChunkHead(8)](16 bits size)   */
/* IL  : Ignore light                                    */
/* IS  : Ignore specular                                 */
/* IA  : Ignore ambient                                  */
/* UA  : Use alpha                                       */
/* DB  : Double side                                     */
/* FL  : Flat shading                                    */
/* ENV : Environment                                     */
enum NJD_FST_SHIFT =      8;
enum NJD_FST_IL =        (0x01<<NJD_FST_SHIFT);
enum NJD_FST_IS =        (0x02<<NJD_FST_SHIFT);
enum NJD_FST_IA =        (0x04<<NJD_FST_SHIFT);
enum NJD_FST_UA =        (0x08<<NJD_FST_SHIFT);
enum NJD_FST_DB =        (0x10<<NJD_FST_SHIFT);
enum NJD_FST_FL =        (0x20<<NJD_FST_SHIFT);
enum NJD_FST_ENV =       (0x40<<NJD_FST_SHIFT);
enum NJD_FST_MASK =      (0xFF<<NJD_FST_SHIFT);

/** UserFlag Offset Mask **/
enum NJD_UFO_SHIFT =      14;
enum NJD_UFO_0 =         (0<<NJD_UFO_SHIFT);
enum NJD_UFO_1 =         (1<<NJD_UFO_SHIFT);
enum NJD_UFO_2 =         (2<<NJD_UFO_SHIFT);
enum NJD_UFO_3 =         (3<<NJD_UFO_SHIFT);
enum NJD_UFO_MASK =      (0x3<<NJD_UFO_SHIFT); /* 0 - 3 */


/*------------------*/
/*	Structure		*/
/*------------------*/
/*
 * NJS_CNK_MODEL
 */
struct NJS_CNK_MODEL
{
	Sint32*            vlist;   /* vertex list                  */
	Sint16*            plist;   /* polygon list                 */
	NJS_POINT3        center;   /* model center                 */
	Float                  r;   /* radius                       */
};

/*
 * NJS_CNK_OBJECT
 */
struct NJS_CNK_OBJECT
{
	Uint32          evalflags;  /* evalation flags              */
	NJS_CNK_MODEL*   model;     /* model data pointer           */
	Float[3]           pos;     /* translation                  */
	Angle[3]           ang;     /* rotation                     */
	Float[3]           scl;     /* scaling                      */
	NJS_CNK_OBJECT*  child;     /* child object                 */
	NJS_CNK_OBJECT*  sibling;   /* sibling object               */
};



/** Vertex Buffer    **/
struct NJS_CNK_VERTEX_BUF
{
	Sint32    clip;             /* clip flag        00:04*/
	Float    sx;                /* Screen X         04:08*/
	Float    sy;                /* Screen Y         08:12*/
	Float    ooz;               /* One over Z       12:16*/
	NJS_POINT3    p;            /* 3D Point         16:28*/
	Uint32    dmy1;             /* dummy            28:32*/
	Sint32    vtype;            /* vetex type       32:36*/
	NJS_VECTOR    v;            /* Normal vector    36:48*/
	union _col                  /*                  48:56*/
	{
		Uint32[2]    argb;      /* Packed Color     48:56*/
		Float[2]    inten;      /* intensity        48:56*/
	}            /* Normal vector    36:48*/
	_col col;                      /* color            48:56*/
	Sint32    NinjaFlag;        /* Ninja Flag       56:60*/
	Sint32    UserFlag;         /* User Flag        60:64*/
};

struct NJS_CNK_EASY_BUF
{
	Float    x;                /* Screen X                */
	Float    y;                /* Screen Y                */
	Float    ooz;              /* One over Z              */
	Float    inten;            /* intensity               */
};

struct NJS_CNK_SIMPLE_BUF
{
	Float    z;                /* 3D Z                    */
	Float    x;                /* Screen X                */
	Float    y;                /* Screen Y                */
	Float    ooz;              /* One over Z              */
	Float    inten;            /* Intensity               */
	Float    spec;             /* Specular                */
	Float    nx;               /* Normal X                */
	Float    ny;               /* Normal Y                */
};

struct NJS_CNK_EASYMULTI_BUF
{
	Float    z;                /* 3D Z                    */
	Float    x;                /* Screen X                */
	Float    y;                /* Screen Y                */
	Float    ooz;              /* One over Z              */
	Float    a;                /* Alpha                   */
	Float    r;                /* Red                     */
	Float    g;                /* Green                   */
	Float    b;                /* Blue                    */
};

 /* _NINJA_CNK_H_ */

/*
 * End Of File
 */