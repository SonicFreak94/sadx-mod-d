module ninja.def;

import ninja.types;

/*
	Ninja Library
	
	COPYRIGHT (C) SEGA ENTERPRISES,LTD.
*/

/*--------------------------------------*/
/*      BIT                             */
/*--------------------------------------*/
enum
{
	_BIT0,  _BIT1,  _BIT2,  _BIT3,  _BIT4,  _BIT5,  _BIT6,  _BIT7,
	_BIT8,  _BIT9,  _BIT10, _BIT11, _BIT12, _BIT13, _BIT14, _BIT15,
	_BIT16, _BIT17, _BIT18, _BIT19, _BIT20, _BIT21, _BIT22, _BIT23,
	_BIT24, _BIT25, _BIT26, _BIT27, _BIT28, _BIT29, _BIT30, _BIT31
}

enum
{
	BIT_0  = (1 << _BIT0),
	BIT_1  = (1 << _BIT1),
	BIT_2  = (1 << _BIT2),
	BIT_3  = (1 << _BIT3),
	BIT_4  = (1 << _BIT4),
	BIT_5  = (1 << _BIT5),
	BIT_6  = (1 << _BIT6),
	BIT_7  = (1 << _BIT7),
	BIT_8  = (1 << _BIT8),
	BIT_9  = (1 << _BIT9),
	BIT_10 = (1 << _BIT10),
	BIT_11 = (1 << _BIT11),
	BIT_12 = (1 << _BIT12),
	BIT_13 = (1 << _BIT13),
	BIT_14 = (1 << _BIT14),
	BIT_15 = (1 << _BIT15),
	BIT_16 = (1 << _BIT16),
	BIT_17 = (1 << _BIT17),
	BIT_18 = (1 << _BIT18),
	BIT_19 = (1 << _BIT19),
	BIT_20 = (1 << _BIT20),
	BIT_21 = (1 << _BIT21),
	BIT_22 = (1 << _BIT22),
	BIT_23 = (1 << _BIT23),
	BIT_24 = (1 << _BIT24),
	BIT_25 = (1 << _BIT25),
	BIT_26 = (1 << _BIT26),
	BIT_27 = (1 << _BIT27),
	BIT_28 = (1 << _BIT28),
	BIT_29 = (1 << _BIT29),
	BIT_30 = (1 << _BIT30),
	BIT_31 = (1 << _BIT31)
}

/*--------------------------------------*/
/*      SCREEN RESOLUTION               */
/*--------------------------------------*/
enum NJD_DSP_NTSC = (0x0);
enum NJD_DSP_VGA  = (0x1);
enum NJD_DSP_PAL  = (0x2);

enum NJD_DSP_NONINTER = (0x00);
enum NJD_DSP_INTER    = (0x04);
enum NJD_DSP_PSINTER  = (0x08);

enum NJD_DSP_WIDTH_320 = (0x000);
enum NJD_DSP_WIDTH_640 = (0x010);

enum NJD_DSP_HEIGHT_240 = (0x000);
enum NJD_DSP_HEIGHT_480 = (0x020);
enum NJD_DSP_HEIGHT_NRM = (0x000);
enum NJD_DSP_HEIGHT_EXT = (0x040);

enum NJD_DSP_ANTI                  = (0x00010000);
enum NJD_PALEXT_HEIGHT_RATIO_1_033 = (0x00000000);
enum NJD_PALEXT_HEIGHT_RATIO_1_066 = (0x00020000);
enum NJD_PALEXT_HEIGHT_RATIO_1_100 = (0x00040000);
enum NJD_PALEXT_HEIGHT_RATIO_1_133 = (0x00060000);
enum NJD_PALEXT_HEIGHT_RATIO_1_166 = (0x00080000);

enum NJD_DSP_320x240     = (NJD_DSP_WIDTH_320 | NJD_DSP_HEIGHT_240);
enum NJD_DSP_640x240     = (NJD_DSP_WIDTH_640 | NJD_DSP_HEIGHT_240);
enum NJD_DSP_320x480     = (NJD_DSP_WIDTH_320 | NJD_DSP_HEIGHT_480);
enum NJD_DSP_640x480     = (NJD_DSP_WIDTH_640 | NJD_DSP_HEIGHT_480);
enum NJD_DSP_640x240_EXT = (NJD_DSP_WIDTH_640 | NJD_DSP_HEIGHT_240 | NJD_DSP_HEIGHT_EXT);
enum NJD_DSP_640x480_EXT = (NJD_DSP_WIDTH_640 | NJD_DSP_HEIGHT_480 | NJD_DSP_HEIGHT_EXT);

enum NJD_RESOLUTION_VGA               = (NJD_DSP_VGA | NJD_DSP_NONINTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_320x240_NTSCNI    = (NJD_DSP_NTSC | NJD_DSP_NONINTER | NJD_DSP_320x240);
enum NJD_RESOLUTION_320x240_NTSCI     = (NJD_DSP_NTSC | NJD_DSP_INTER | NJD_DSP_320x240);
enum NJD_RESOLUTION_640x240_NTSCNI    = (NJD_DSP_NTSC | NJD_DSP_NONINTER | NJD_DSP_640x240);
enum NJD_RESOLUTION_640x240_NTSCI     = (NJD_DSP_NTSC | NJD_DSP_INTER | NJD_DSP_640x240);
enum NJD_RESOLUTION_320x480_NTSCNI_FF = (NJD_DSP_NTSC | NJD_DSP_NONINTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_320x480_NTSCNI    = (NJD_DSP_NTSC | NJD_DSP_PSINTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_320x480_NTSCI     = (NJD_DSP_NTSC | NJD_DSP_INTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_640x480_NTSCNI_FF = (NJD_DSP_NTSC | NJD_DSP_NONINTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_640x480_NTSCNI    = (NJD_DSP_NTSC | NJD_DSP_PSINTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_640x480_NTSCI     = (NJD_DSP_NTSC | NJD_DSP_INTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_320x240_PALNI     = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_320x240);
enum NJD_RESOLUTION_320x240_PALI      = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_320x240);
enum NJD_RESOLUTION_640x240_PALNI     = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x240);
enum NJD_RESOLUTION_640x240_PALI      = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x240);
enum NJD_RESOLUTION_320x480_PALNI_FF  = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_320x480_PALNI     = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_320x480_PALI      = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_640x480_PALNI_FF  = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_640x480_PALNI     = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_640x480_PALI      = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x480);

enum NJD_RESOLUTION_VGA_ANTI               = (NJD_RESOLUTION_VGA | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x240_NTSCNI_ANTI    = (NJD_RESOLUTION_320x240_NTSCNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x240_NTSCI_ANTI     = (NJD_RESOLUTION_320x240_NTSCI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x240_NTSCNI_ANTI    = (NJD_RESOLUTION_640x240_NTSCNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x240_NTSCI_ANTI     = (NJD_RESOLUTION_640x240_NTSCI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_NTSCNI_FF_ANTI = (NJD_RESOLUTION_320x480_NTSCNI_FF | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_NTSCNI_ANTI    = (NJD_RESOLUTION_320x480_NTSCNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_NTSCI_ANTI     = (NJD_RESOLUTION_320x480_NTSCI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_NTSCNI_FF_ANTI = (NJD_RESOLUTION_640x480_NTSCNI_FF | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_NTSCNI_ANTI    = (NJD_RESOLUTION_640x480_NTSCNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_NTSCI_ANTI     = (NJD_RESOLUTION_640x480_NTSCI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x240_PALNI_ANTI     = (NJD_RESOLUTION_320x240_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x240_PALI_ANTI      = (NJD_RESOLUTION_320x240_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x240_PALNI_ANTI     = (NJD_RESOLUTION_640x240_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x240_PALI_ANTI      = (NJD_RESOLUTION_640x240_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_PALNI_FF_ANTI  = (NJD_RESOLUTION_320x480_PALNI_FF | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_PALNI_ANTI     = (NJD_RESOLUTION_320x480_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_PALI_ANTI      = (NJD_RESOLUTION_320x480_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_PALNI_FF_ANTI  = (NJD_RESOLUTION_640x480_PALNI_FF | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_PALNI_ANTI     = (NJD_RESOLUTION_640x480_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_PALI_ANTI      = (NJD_RESOLUTION_640x480_PALI | NJD_DSP_ANTI);

enum NJD_RESOLUTION_320x240_VGA      = (NJD_DSP_VGA | NJD_DSP_NONINTER | NJD_DSP_320x240);
enum NJD_RESOLUTION_320x480_VGA      = (NJD_DSP_VGA | NJD_DSP_NONINTER | NJD_DSP_320x480);
enum NJD_RESOLUTION_640x240_VGA      = (NJD_DSP_VGA | NJD_DSP_NONINTER | NJD_DSP_640x240);
enum NJD_RESOLUTION_640x480_VGA      = (NJD_DSP_VGA | NJD_DSP_NONINTER | NJD_DSP_640x480);
enum NJD_RESOLUTION_320x240_VGA_ANTI = (NJD_RESOLUTION_320x240_VGA | NJD_DSP_ANTI);
enum NJD_RESOLUTION_320x480_VGA_ANTI = (NJD_RESOLUTION_320x480_VGA | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x240_VGA_ANTI = (NJD_RESOLUTION_640x240_VGA | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x480_VGA_ANTI = (NJD_RESOLUTION_640x480_VGA | NJD_DSP_ANTI);

enum NJD_RESOLUTION_640x248_PALNI = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x240_EXT | NJD_PALEXT_HEIGHT_RATIO_1_033);
enum NJD_RESOLUTION_640x256_PALNI = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x240_EXT | NJD_PALEXT_HEIGHT_RATIO_1_066);
enum NJD_RESOLUTION_640x264_PALNI = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x240_EXT | NJD_PALEXT_HEIGHT_RATIO_1_100);
enum NJD_RESOLUTION_640x272_PALNI = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x240_EXT | NJD_PALEXT_HEIGHT_RATIO_1_133);
enum NJD_RESOLUTION_640x280_PALNI = (NJD_DSP_PAL | NJD_DSP_NONINTER | NJD_DSP_640x240_EXT | NJD_PALEXT_HEIGHT_RATIO_1_166);

enum NJD_RESOLUTION_640x496_PALNI = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_033);
enum NJD_RESOLUTION_640x512_PALNI = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_066);
enum NJD_RESOLUTION_640x528_PALNI = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_100);
enum NJD_RESOLUTION_640x544_PALNI = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_133);
enum NJD_RESOLUTION_640x560_PALNI = (NJD_DSP_PAL | NJD_DSP_PSINTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_166);

enum NJD_RESOLUTION_640x496_PALI = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_033);
enum NJD_RESOLUTION_640x512_PALI = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_066);
enum NJD_RESOLUTION_640x528_PALI = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_100);
enum NJD_RESOLUTION_640x544_PALI = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_133);
enum NJD_RESOLUTION_640x560_PALI = (NJD_DSP_PAL | NJD_DSP_INTER | NJD_DSP_640x480_EXT | NJD_PALEXT_HEIGHT_RATIO_1_166);

enum NJD_RESOLUTION_640x248_PALNI_ANTI = (NJD_RESOLUTION_640x248_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x256_PALNI_ANTI = (NJD_RESOLUTION_640x256_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x264_PALNI_ANTI = (NJD_RESOLUTION_640x264_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x272_PALNI_ANTI = (NJD_RESOLUTION_640x272_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x280_PALNI_ANTI = (NJD_RESOLUTION_640x280_PALNI | NJD_DSP_ANTI);

enum NJD_RESOLUTION_640x496_PALNI_ANTI = (NJD_RESOLUTION_640x496_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x512_PALNI_ANTI = (NJD_RESOLUTION_640x512_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x528_PALNI_ANTI = (NJD_RESOLUTION_640x528_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x544_PALNI_ANTI = (NJD_RESOLUTION_640x544_PALNI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x560_PALNI_ANTI = (NJD_RESOLUTION_640x560_PALNI | NJD_DSP_ANTI);

enum NJD_RESOLUTION_640x496_PALI_ANTI = (NJD_RESOLUTION_640x496_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x512_PALI_ANTI = (NJD_RESOLUTION_640x512_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x528_PALI_ANTI = (NJD_RESOLUTION_640x528_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x544_PALI_ANTI = (NJD_RESOLUTION_640x544_PALI | NJD_DSP_ANTI);
enum NJD_RESOLUTION_640x560_PALI_ANTI = (NJD_RESOLUTION_640x560_PALI | NJD_DSP_ANTI);

enum NJD_VIDEO_MASK    = (0x00000003);
enum NJD_DSP_MASK      = (0x00000FFF);
enum NJD_WIDTH_MASK    = NJD_DSP_WIDTH_640;
enum NJD_HEIGHT_MASK   = NJD_DSP_HEIGHT_480;
enum NJD_PALEXT_MASK   = (0x000E0000);
enum NJD_PALEXT_OFFSET = (17);

/*--------------------------------------*/
/*      FRAME BUFFER MODE               */
/*--------------------------------------*/
enum NJD_FRAMEBUFFER_MODE_RGB565   = 0;
enum NJD_FRAMEBUFFER_MODE_RGB555   = 1;
enum NJD_FRAMEBUFFER_MODE_ARGB1555 = 3;
enum NJD_FRAMEBUFFER_MODE_RGB888   = 4;
enum NJD_FRAMEBUFFER_MODE_ARGB8888 = 5;

/*--------------------------------------*/
/*      COLOR MODE                      */
/*--------------------------------------*/
enum NJD_ARC1_NORMAL       = (0x00000002);
enum NJD_ARC1_TEXTURE      = (0x0000000A);
enum NJD_ARC1_NORMAL_FLAT  = (0x00000000);
enum NJD_ARC1_TEXTURE_FLAT = (0x00000008);

enum NJD_ARC1_HIGHLIGHT = (0x00000004);
enum NJD_ARC1_OPAQUE    = (0x00080000);
enum NJD_ARC1_TRANS     = (0x02100000);
enum NJD_ARC1_INTENSITY = (0x00000020);
enum NJD_ARC1_PACKED    = (0x00000000);
enum NJD_ARC1_FLOAT     = (0x00000010);

enum NJD_ARC1_UV32_FLOAT = (0x00000000);
enum NJD_ARC1_UV16_FLOAT = (0x00000001);

enum NJD_COLOR_MODE_NORMAL                       = (NJD_ARC1_NORMAL | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_TEXTURE                      = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_FLAT_NORMAL                  = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_FLAT_TEXTURE                 = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_NORMAL             = (NJD_ARC1_NORMAL | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_TEXTURE            = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_NORMAL        = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_TEXTURE       = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_NORMAL_TRANS                 = (NJD_ARC1_NORMAL | NJD_ARC1_TRANS | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_TEXTURE_TRANS                = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_FLAT_NORMAL_TRANS            = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_TRANS | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_FLAT_TEXTURE_TRANS           = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_NORMAL_TRANS       = (NJD_ARC1_NORMAL | NJD_ARC1_TRANS | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_TEXTURE_TRANS      = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_NORMAL_TRANS  = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_TRANS | NJD_ARC1_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_TEXTURE_TRANS = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT);

enum NJD_COLOR_MODE_TEXTURE_UV16                      = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_FLAT_TEXTURE_UV16                 = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_TEXTURE_UV16            = (NJD_ARC1_TEXTURE| NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_TEXTURE_UV16       = (NJD_ARC1_TEXTURE_FLAT| NJD_ARC1_OPAQUE | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_TEXTURE_TRANS_UV16                = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_FLOAT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_FLAT_TEXTURE_TRANS_UV16           = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_FLOAT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_TEXTURE_TRANS_UV16      = (NJD_ARC1_TEXTURE| NJD_ARC1_TRANS | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT | NJD_ARC1_UV16_FLOAT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_TEXTURE_TRANS_UV16 = (NJD_ARC1_TEXTURE_FLAT| NJD_ARC1_TRANS | NJD_ARC1_FLOAT | NJD_ARC1_HIGHLIGHT | NJD_ARC1_UV16_FLOAT);

enum NJD_COLOR_MODE_INTENSITY_NORMAL                       = (NJD_ARC1_NORMAL | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_INTENSITY_TEXTURE                      = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_FLAT_INTENSITY_NORMAL                  = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_FLAT_INTENSITY_TEXTURE                 = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_HIGHLIGHT_INTENSITY_NORMAL             = (NJD_ARC1_NORMAL | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_HIGHLIGHT_INTENSITY_TEXTURE            = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_INTENSITY_NORMAL        = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_INTENSITY_TEXTURE       = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_INTENSITY | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_INTENSITY_NORMAL_TRANS                 = (NJD_ARC1_NORMAL | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_INTENSITY_TEXTURE_TRANS                = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_FLAT_INTENSITY_NORMAL_TRANS            = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_FLAT_INTENSITY_TEXTURE_TRANS           = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_HIGHLIGHT_INTENSITY_NORMAL_TRANS       = (NJD_ARC1_NORMAL | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_HIGHLIGHT_INTENSITY_TEXTURE_TRANS      = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_INTENSITY_NORMAL_TRANS  = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_INTENSITY_TEXTURE_TRANS = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_INTENSITY | NJD_ARC1_HIGHLIGHT);

enum NJD_COLOR_MODE_PACKED_NORMAL                       = (NJD_ARC1_NORMAL | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_PACKED_TEXTURE                      = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_FLAT_PACKED_NORMAL                  = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_FLAT_PACKED_TEXTURE                 = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_HIGHLIGHT_PACKED_NORMAL             = (NJD_ARC1_NORMAL | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_HIGHLIGHT_PACKED_TEXTURE            = (NJD_ARC1_TEXTURE | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_PACKED_NORMAL        = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_PACKED_TEXTURE       = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_OPAQUE | NJD_ARC1_PACKED | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_PACKED_NORMAL_TRANS                 = (NJD_ARC1_NORMAL | NJD_ARC1_TRANS | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_PACKED_TEXTURE_TRANS                = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_FLAT_PACKED_NORMAL_TRANS            = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_TRANS | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_FLAT_PACKED_TEXTURE_TRANS           = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_HIGHLIGHT_PACKED_NORMAL_TRANS       = (NJD_ARC1_NORMAL | NJD_ARC1_TRANS | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_HIGHLIGHT_PACKED_TEXTURE_TRANS      = (NJD_ARC1_TEXTURE | NJD_ARC1_TRANS | NJD_ARC1_PACKED | NJD_ARC1_HIGHLIGHT);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_PACKED_NORMAL_TRANS  = (NJD_ARC1_NORMAL_FLAT | NJD_ARC1_TRANS | NJD_ARC1_PACKED);
enum NJD_COLOR_MODE_HIGHLIGHT_FLAT_PACKED_TEXTURE_TRANS = (NJD_ARC1_TEXTURE_FLAT | NJD_ARC1_TRANS | NJD_ARC1_PACKED | NJD_ARC1_HIGHLIGHT);

/*--------------------------------------*/
/*      Render Mode Define              */
/*--------------------------------------*/
/* Culling Mode */
enum NJD_POLYGON_NOCULLING    = 0;
enum NJD_POLYGON_CULLINGSMALL = 1;
enum NJD_POLYGON_CULLINGACW   = 2;
enum NJD_POLYGON_CULLINGCW    = 3;

/* Color Blending Mode */
/* Target */
enum NJD_SOURCE_COLOR      = 0;
enum NJD_DESTINATION_COLOR = 1;
/* Mode */
enum NJD_COLOR_BLENDING_BOTHINVALPHA = 0;
enum NJD_COLOR_BLENDING_BOTHSRCALPHA = 1;
enum NJD_COLOR_BLENDING_DESTALPHA    = 2;
enum NJD_COLOR_BLENDING_DESTCOLOR    = 3;
enum NJD_COLOR_BLENDING_INVDESTALPHA = 4;
enum NJD_COLOR_BLENDING_INVDESTCOLOR = 5;
enum NJD_COLOR_BLENDING_INVSRCALPHA  = 6;
enum NJD_COLOR_BLENDING_INVSRCCOLOR  = 7;
enum NJD_COLOR_BLENDING_SRCALPHA     = 8;
enum NJD_COLOR_BLENDING_SRCCOLOR     = 9;
enum NJD_COLOR_BLENDING_ONE          = 10;
enum NJD_COLOR_BLENDING_ZERO         = 11;

/* Texture Shading Mode */
enum NJD_TEX_SHADING_MODE_MODULATE      = 0;
enum NJD_TEX_SHADING_MODE_DECALALPHA    = 1;
enum NJD_TEX_SHADING_MODE_MODULATEALPHA = 2;
enum NJD_TEX_SHADING_MODE_DECAL         = 3;

/* UserClippingMode */
enum NJD_CLIP_DISABLE = 0;
enum NJD_CLIP_RESERVE = 1;
enum NJD_CLIP_INSIDE  = 2;
enum NJD_CLIP_OUTSIDE = 3;

/*--------------------------------------*/
/*      SYSTEM ATTR SIZE                */
/*--------------------------------------*/
enum NJD_SYS_ATTR_SIZE = 192;

/*--------------------------------------*/
/*      FATAL ERROR CALL BACK           */
/*--------------------------------------*/
enum NJD_FATAL_ERR_NOQEUE_INTR    = (1);
enum NJD_FATAL_ERR_OVERFLW_VTXBUF = (2);
enum NJD_FATAL_ERR_TOO_MANY_VTX   = (3);
enum NJD_FATAL_ERR_V_NOT_RESPOND  = (4);

/*--------------------------------------*/
/*      Texture Define                  */
/*--------------------------------------*/
/* Texture Size */
enum NJD_TEXSIZE_1    = 1;
enum NJD_TEXSIZE_2    = 2;
enum NJD_TEXSIZE_4    = 4;
enum NJD_TEXSIZE_8    = 8;
enum NJD_TEXSIZE_16   = 16;
enum NJD_TEXSIZE_32   = 32;
enum NJD_TEXSIZE_64   = 64;
enum NJD_TEXSIZE_128  = 128;
enum NJD_TEXSIZE_256  = 256;
enum NJD_TEXSIZE_512  = 512;
enum NJD_TEXSIZE_1024 = 1024;

/* Texture Attr */
/*
|31 -  21|20 - 17|16          |15 - 0|
 texattr reserved texcontinue  pvmentryId
*/
enum NJD_TEXATTR_TYPE_FILE         = 0;
alias NJD_TEXATTR_CACHE            = BIT_31;
alias NJD_TEXATTR_TYPE_MEMORY      = BIT_30;
alias NJD_TEXATTR_BOTH             = BIT_29;
alias NJD_TEXATTR_TYPE_FRAMEBUFFER = BIT_28;

enum NJD_TEXATTR_READAREA_MASK = (BIT_31 | BIT_29);
enum NJD_TEXATTR_READTYPE_MASK = (BIT_30 | BIT_28);

alias NJD_TEXATTR_PALGLOBALINDEX = BIT_24;
alias NJD_TEXATTR_GLOBALINDEX    = BIT_23;
alias NJD_TEXATTR_AUTOMIPMAP     = BIT_22;
alias NJD_TEXATTR_AUTODITHER     = BIT_21;
enum NJD_TEXATTR_MASK            = 0xFFFE0000;

alias NJD_TEXATTR_TEXCONTINUE = BIT_16;

/*
	texaddr
	|31 - 26|25   -     0|
	  bank    globalIndex
*/
enum NJD_TEXBANK_SHIFT     = (26);
enum NJD_TEXBANK_MASK      = (0xFC000000);
enum NJD_TEXPALGLOBAL_MASK = (0x03FFFFFF);

/* Texture Color Format */
enum NJD_TEXFMT_ARGB_1555  = (0x00);
enum NJD_TEXFMT_RGB_565    = (0x01);
enum NJD_TEXFMT_ARGB_4444  = (0x02);
enum NJD_TEXFMT_YUV_422    = (0x03);
enum NJD_TEXFMT_BUMP       = (0x04);
enum NJD_TEXFMT_RGB_555    = (0x05);
enum NJD_TEXFMT_ARGB_8888  = (0x06);
enum NJD_TEXFMT_YUV_420    = (0x06);
enum NJD_TEXFMT_COLOR_MASK = (0xFF);

enum NJD_TEXFMT_TWIDDLED           = (0x0100);
enum NJD_TEXFMT_TWIDDLED_MM        = (0x0200);
enum NJD_TEXFMT_VQ                 = (0x0300);
enum NJD_TEXFMT_VQ_MM              = (0x0400);
enum NJD_TEXFMT_PALETTIZE4         = (0x0500);
enum NJD_TEXFMT_PALETTIZE4_MM      = (0x0600);
enum NJD_TEXFMT_PALETTIZE8         = (0x0700);
enum NJD_TEXFMT_PALETTIZE8_MM      = (0x0800);
enum NJD_TEXFMT_RECTANGLE          = (0x0900);
enum NJD_TEXFMT_STRIDE             = (0x0B00);
enum NJD_TEXFMT_TWIDDLED_RECTANGLE = (0x0D00);
enum NJD_TEXFMT_ABGR               = (0x0E00);
enum NJD_TEXFMT_ABGR_MM            = (0x0F00);

enum NJD_TEXFMT_SMALLVQ    = (0x1000);
enum NJD_TEXFMT_SMALLVQ_MM = (0x1100);

enum NJD_TEXFMT_TYPE_MASK = (0xFF00);

enum NJD_TEXMEM_FREESIZE = (0x00000000);
enum NJD_TEXMEM_MAXBLOCK = (0x00000001);
enum NJD_TEXMEM_MAXSIZE  = (0x00000002);

enum NJD_TEXERR_OTHER       = (1);
enum NJD_TEXERR_FILEOPEN    = (2);
enum NJD_TEXERR_EXTND       = (3);
enum NJD_TEXERR_HEADER      = (4);
enum NJD_TEXERR_FILELOAD    = (5);
enum NJD_TEXERR_SURFACE     = (6);
enum NJD_TEXERR_MAINMEMORY  = (7);
enum NJD_TEXERR_TEXMEMLOAD  = (8);
enum NJD_TEXERR_GLOBALINDEX = (9);

enum NJD_START_GLOBALINEX      = (0xFFFFFFEF);
enum NJD_GLOBAXINDEX_FIRST_VAL = (0xFFFFFFFF);
enum NJD_BANK_FIRST_VAL        = (0xFFFFFFFF);

alias NJD_TEXMEMFLAG_CACHE        = BIT_0;
alias NJD_TEXMEMFLAG_TEXMEM       = BIT_1;
alias NJD_TEXMEMFLAG_PALSRC       = BIT_3;
enum NJD_TEXMEMFLAG_LOADAREA_MASK = (BIT_0 | BIT_1);

enum NJD_GD_SECT_SIZE = 2048;

/* Palette Color bpp */
enum NJD_TEXPALETTE_16BPP = 16;
enum NJD_TEXPALETTE_32BPP = 32;

enum NJD_TEX_STAT_READ  = 0;
enum NJD_TEX_STAT_END   = 1;
enum NJD_TEX_STAT_OPEN  = 2;
enum NJD_TEX_STAT_RWAIT = 4;
enum NJD_TEX_STAT_LOAD  = 5;
enum NJD_TEX_STAT_LWAIT = 6;
enum NJD_TEX_STAT_CLOSE = 7;
enum NJD_TEX_STAT_ERR   = -1;

/* Pixelformat */
enum NJD_PIXELFORMAT_ARGB1555        = (0x00000000);
enum NJD_PIXELFORMAT_RGB565          = (0x08000000);
enum NJD_PIXELFORMAT_ARGB4444        = (0x10000000);
enum NJD_PIXELFORMAT_YUV422          = (0x18000000);
enum NJD_PIXELFORMAT_BUMP            = (0x20000000);
enum NJD_PIXELFORMAT_PALETTIZED_4BPP = (0x28000000);
enum NJD_PIXELFORMAT_PALETTIZED_8BPP = (0x30000000);

/* Surfaceflag */
alias NJD_SURFACEFLAGS_MIPMAPED     = BIT_0;
alias NJD_SURFACEFLAGS_CHROMAKEYFIX = BIT_1;
alias NJD_SURFACEFLAGS_TWIDDLED     = BIT_2;
alias NJD_SURFACEFLAGS_VQ           = BIT_3;
alias NJD_SURFACEFLAGS_STRIDE       = BIT_4;
alias NJD_SURFACEFLAGS_PALETTIZED   = BIT_5;

/*--------------------------------------*/
/*      Model Define                    */
/*--------------------------------------*/
alias NJD_EVAL_UNIT_POS   = BIT_0; /* ignore translation */
alias NJD_EVAL_UNIT_ANG   = BIT_1; /* ignore rotation */
alias NJD_EVAL_UNIT_SCL   = BIT_2; /* ignore scaling */
alias NJD_EVAL_HIDE       = BIT_3; /* do not draw model */
alias NJD_EVAL_BREAK      = BIT_4; /* terminate tracing children */
alias NJD_EVAL_ZXY_ANG    = BIT_5;
alias NJD_EVAL_SKIP       = BIT_6;
alias NJD_EVAL_SHAPE_SKIP = BIT_7;
alias NJD_EVAL_CLIP       = BIT_8;
alias NJD_EVAL_MODIFIER   = BIT_9;
enum NJD_EVAL_MASK        = 0x3ff;

/* SRC Alpha Instr(31-29) */
enum NJD_SA_ZERO      = (0);                        /* 0 zero                */
enum NJD_SA_ONE       = (BIT_29);                   /* 1 one                 */
enum NJD_SA_OTHER     = (BIT_30);                   /* 2 Other Color         */
enum NJD_SA_INV_OTHER = (BIT_30 | BIT_29);          /* 3 Inverse Other Color */
enum NJD_SA_SRC       = (BIT_31);                   /* 4 SRC Alpha           */
enum NJD_SA_INV_SRC   = (BIT_31 | BIT_29);          /* 5 Inverse SRC Alpha   */
enum NJD_SA_DST       = (BIT_31 | BIT_30);          /* 6 DST Alpha           */
enum NJD_SA_INV_DST   = (BIT_31 | BIT_30 | BIT_29); /* 7 Inverse DST Alpha   */
enum NJD_SA_MASK      = (BIT_31 | BIT_30 | BIT_29); /* MASK                  */

/* DST Alpha Instr(28-26) */
enum NJD_DA_ZERO      = (0);                        /* 0 zero                */
enum NJD_DA_ONE       = BIT_26;                     /* 1 one                 */
enum NJD_DA_OTHER     = BIT_27;                     /* 2 Other Color         */
enum NJD_DA_INV_OTHER = (BIT_27 | BIT_26);          /* 3 Inverse Other Color */
enum NJD_DA_SRC       = BIT_28;                     /* 4 SRC Alpha           */
enum NJD_DA_INV_SRC   = (BIT_28 | BIT_26);          /* 5 Inverse SRC Alpha   */
enum NJD_DA_DST       = (BIT_28 | BIT_27);          /* 6 DST Alpha           */
enum NJD_DA_INV_DST   = (BIT_28 | BIT_27 | BIT_26); /* 7 Inverse DST Alpha   */
enum NJD_DA_MASK      = (BIT_28 | BIT_27 | BIT_26); /* MASK                  */

/* filter mode */
enum NJD_FILTER_POINT     = (0);
enum NJD_FILTER_BILINEAR  = BIT_13;
enum NJD_FILTER_TRILINEAR = BIT_14;
enum NJD_FILTER_BLEND     = (BIT_14 | BIT_13);
enum NJD_FILTER_MASK      = (BIT_14 | BIT_13);

/* Mip-Map 'D' adjust */
enum NJD_D_025  = BIT_8;                             /* 0.25        */
enum NJD_D_050  = BIT_9;                             /* 0.50        */
enum NJD_D_075  = (BIT_9 | BIT_8);                   /* 0.75        */
enum NJD_D_100  = BIT_10;                            /* 1.00        */
enum NJD_D_125  = (BIT_10 | BIT_8);                  /* 1.25        */
enum NJD_D_150  = (BIT_10 | BIT_9);                  /* 1.50        */
enum NJD_D_175  = (BIT_10 | BIT_9 | BIT_8);          /* 1.75        */
enum NJD_D_200  = BIT_11;                            /* 2.00        */
enum NJD_D_225  = (BIT_11 | BIT_8);                  /* 2.25        */
enum NJD_D_250  = (BIT_11 | BIT_9);                  /* 2.50        */
enum NJD_D_275  = (BIT_11 | BIT_9 | BIT_8);          /* 2.75        */
enum NJD_D_300  = (BIT_11 | BIT_10);                 /* 3.00        */
enum NJD_D_325  = (BIT_11 | BIT_10 | BIT_8);         /* 3.25        */
enum NJD_D_350  = (BIT_11 | BIT_10 | BIT_9);         /* 3.50        */
enum NJD_D_375  = (BIT_11 | BIT_10 | BIT_9 | BIT_8); /* 3.75        */
enum NJD_D_MASK = (BIT_11 | BIT_10 | BIT_9 | BIT_8); /* MASK        */

/* flags */
enum NJD_FLAG_IGNORE_LIGHT    = BIT_25;
enum NJD_FLAG_USE_FLAT        = BIT_24;
enum NJD_FLAG_DOUBLE_SIDE     = BIT_23;
enum NJD_FLAG_USE_ENV         = BIT_22;
enum NJD_FLAG_USE_TEXTURE     = BIT_21;
enum NJD_FLAG_USE_ALPHA       = BIT_20;
enum NJD_FLAG_IGNORE_SPECULAR = BIT_19;
enum NJD_FLAG_FLIP_U          = BIT_18;
enum NJD_FLAG_FLIP_V          = BIT_17;
enum NJD_FLAG_CLAMP_U         = BIT_16;
enum NJD_FLAG_CLAMP_V         = BIT_15;
enum NJD_FLAG_USE_ANISOTROPIC = BIT_12;
enum NJD_FLAG_PICK            = BIT_7;

/* Mask for flip and clamp */
enum NJD_FLAG_FLIP_MASK  = (NJD_FLAG_FLIP_U | NJD_FLAG_FLIP_V);
enum NJD_FLAG_CLAMP_MASK = (NJD_FLAG_CLAMP_U | NJD_FLAG_CLAMP_V);

/* Mask for the flags evaluated by H/W */
enum NJD_FLAG_HARD_MASK = (NJD_FLAG_USE_ALPHA | NJD_FLAG_FLIP_MASK | NJD_FLAG_CLAMP_MASK | NJD_FLAG_USE_ANISOTROPIC);

/* Mask for the flags evaluated by the library */
enum NJD_FLAG_SOFT_MASK = (NJD_FLAG_IGNORE_LIGHT | NJD_FLAG_PICK | NJD_FLAG_USE_TEXTURE | NJD_FLAG_DOUBLE_SIDE | NJD_FLAG_USE_ENV | NJD_FLAG_USE_FLAT);

/* Mask for entire flag */
enum NJD_FLAG_MASK = (NJD_FLAG_HARD_MASK | NJD_FLAG_SOFT_MASK);

/* Default user mask */
enum NJD_DEFAULT_USER_MASK = (BIT_2 | BIT_1 | BIT_0);

/* Default systm mask */
enum NJD_DEFAULT_SYS_MASK = (~NJD_DEFAULT_USER_MASK);

/* Mask for the field sent direcly to the H/W */
/* NJD_FOG_MASK is not defined anywhere???
enum NJD_SYS_HARD_MASK = (NJD_SA_MASK|NJD_SD_MASK
	|NJD_FOG_MASK|NJD_FLAG_HARD_MASK
	|NJD_D_MASK|NJD_FILTER_MASK);
*/

/* meshset type bits (type_addrId 14-15 bit) */
enum NJD_MESHSET_3       = 0x0000; /* polygon3 meshset         */
enum NJD_MESHSET_4       = 0x4000; /* polygon4 meshset         */
enum NJD_MESHSET_N       = 0x8000; /* polygonN meshset         */
enum NJD_MESHSET_TRIMESH = 0xc000; /* trimesh meshset          */
enum NJD_MESHSET_MASK    = 0xc000; /* meshset type mask        */

/* meshset trimesh end bit */
enum NJD_TRIMESH_END = 0x8000; /* trimesh end bit          */

/* Callback bits (attr_texId 30-31 bit */
enum NJD_POLYGON_CALLBACK  = BIT_31;            /* polygon callback     */
enum NJD_MATERIAL_CALLBACK = BIT_30;            /* material callback    */
enum NJD_CALLBACK_MASK     = (BIT_31 | BIT_30); /* callback mask        */

/*--------------------------------------*/
/*      Motion define                   */
/*--------------------------------------*/
/* motion type bits */

alias NJD_MTYPE_POS_0       = BIT_0;
alias NJD_MTYPE_ANG_1       = BIT_1;
alias NJD_MTYPE_SCL_2       = BIT_2;
alias NJD_MTYPE_VEC_3       = BIT_3;
alias NJD_MTYPE_VERT_4      = BIT_4;
alias NJD_MTYPE_NORM_5      = BIT_5;
alias NJD_MTYPE_TARGET_3    = BIT_6;
alias NJD_MTYPE_ROLL_6      = BIT_7;
alias NJD_MTYPE_ANGLE_7     = BIT_8;
alias NJD_MTYPE_RGB_8       = BIT_9;
alias NJD_MTYPE_INTENSITY_9 = BIT_10;
alias NJD_MTYPE_SPOT_10     = BIT_11;
alias NJD_MTYPE_POINT_10    = BIT_12;
alias NJD_MTYPE_QUAT_1      = BIT_13;

enum NJD_MTYPE_LINER  = 0x0000; /* use liner                */
enum NJD_MTYPE_SPLINE = 0x0040; /* use spline               */
enum NJD_MTYPE_USER   = 0x0080; /* use user function        */
enum NJD_MTYPE_MASK   = 0x00c0; /* motion function mask     */

/*--------------------------------------*/
/*      Light define                    */
/*--------------------------------------*/
/* light type */
enum NJD_CONSTANT     = 0x00; /* constant                 */
enum NJD_AMBIENT      = 0x01; /* ambient                  */
enum NJD_DIR_LIGHT    = 0x02; /* directional light        */
enum NJD_POINT_LIGHT  = 0x04; /* point light              */
enum NJD_SPOT_LIGHT   = 0x08; /* spot light               */
enum NJD_SPEC_DIR     = 0x10; /* dir. light's specular    */
enum NJD_SPEC_POINT   = 0x20; /* point light's specular   */
enum NJD_USER_LIGHT   = 0x40; /* user-defined funcion     */
enum NJD_SIMPLE_LIGHT = 0x80; /* simplified funcion       */
enum NJD_BLOCK_LIGHT  = 0xc0; /* calculated by model      */

enum NJD_LAMBERT_DIR = NJD_AMBIENT | NJD_DIR_LIGHT;
/* dir. light's Lambertian  */
enum NJD_LAMBERT_POINT = NJD_AMBIENT | NJD_POINT_LIGHT;
/* point light's Lambertian */
enum NJD_PHONG_DIR = NJD_AMBIENT | NJD_DIR_LIGHT | NJD_SPEC_DIR;
/* dir. light's Phong       */
enum NJD_PHONG_POINT = NJD_AMBIENT | NJD_POINT_LIGHT | NJD_SPEC_POINT;
/* point light's Phong      */

/* light's ON-OFF flags */
enum NJD_LIGHT_OFF = 0; /* turning off a light      */
enum NJD_LIGHT_ON  = 1; /* turning on a light       */

/* the number of light */
enum NJD_LIGHT_MAX = 32; /* the maximum of lights    */
enum NJD_LIGHT_MIN = 0;  /* the minimum of lights    */

/*--------------------------------------*/
/*      Attribute define                */
/*--------------------------------------*/

enum NJD_DRAW_MASK = 0x0000000f; /* Mask for Drawing Attribute   */

enum NJD_DRAW_NORMAL    = 0x00000000; /* Draw Normally                */
enum NJD_DRAW_FAN       = 0x00000001; /* Draw Radially                */
enum NJD_DRAW_CONNECTED = 0x00000002; /* Draw Continuously            */
enum NJD_DRAW_INSCRIBED = 0x00000010; /* Draw Inscribed Circle        */
enum NJD_FILL           = 0x00000020; /* Fill Polygon                 */
enum NJD_TRANSPARENT    = 0x00000040; /* Be Transparent               */
enum NJD_CALC_LIGHT     = 0x40000000; /* Put under the Light Effect   */
enum NJD_USE_TEXTURE    = 0x80000000; /* Use Texture                  */

/*--------------------------------------*/
/*      Scroll define                   */
/*--------------------------------------*/
/* cell size */
enum NJD_CELL_8   = 8;
enum NJD_CELL_16  = 16;
enum NJD_CELL_32  = 32;
enum NJD_CELL_64  = 64;
enum NJD_CELL_128 = 128;
enum NJD_CELL_256 = 256;

/* the maximum of scroll's value */
enum NJD_CELL_NUM_MAX = 0xFFFF; /* the maximum of cell's number */
enum NJD_MAP_W_MAX    = 0xFF;   /* the maximum of map's width   */
enum NJD_MAP_H_MAX    = 0xFF;   /* the muximum of map's height  */
enum NJD_MAP_MAX      = (NJD_MAP_W_MAX * NJD_MAP_H_MAX);
/* the muximum of map           */

/* 3d control */
alias NJD_CONTROL_3D_DISP_AXIS                 = BIT_0;
alias NJD_CONTROL_3D_NO_CLIP_CHECK             = BIT_1;
alias NJD_CONTROL_3D_CONSTANT_ATTR             = BIT_2;
alias NJD_CONTROL_3D_ENABLE_ALPHA              = BIT_3;
alias NJD_CONTROL_3D_CONSTANT_MATERIAL         = BIT_4;
alias NJD_CONTROL_3D_OFFSET_MATERIAL           = BIT_5;
alias NJD_CONTROL_3D_DEPTH_QUEUE               = BIT_6;
alias NJD_CONTROL_3D_VERTEX_OFFSET             = BIT_7;
alias NJD_CONTROL_3D_MODEL_CLIP                = BIT_8;
alias NJD_CONTROL_3D_CONSTANT_TEXTURE_MATERIAL = BIT_9;
alias NJD_CONTROL_3D_SHADOW                    = BIT_10;
alias NJD_CONTROL_3D_CNK_CONSTANT_ATTR         = BIT_11;
alias NJD_CONTROL_3D_SHADOW_OPAQUE             = BIT_12;
alias NJD_CONTROL_3D_TRANS_MODIFIER            = BIT_13;
alias NJD_CONTROL_3D_USE_PUNCHTHROUGH          = BIT_14;
alias NJD_CONTROL_3D_CNK_BLEND_MODE            = BIT_15;
alias NJD_CONTROL_3D_DISABLE_NEAR_CLIP         = BIT_16;
alias NJD_CONTROL_3D_ENV_UV_SCROLL             = BIT_17;

alias NJD_CONTROL_3D_MIRROR_MODEL = BIT_31;

/* clipping */
alias NJD_CLIP_NEAR   = BIT_0;
alias NJD_CLIP_FAR    = BIT_1;
alias NJD_CLIP_LEFT   = BIT_2;
alias NJD_CLIP_RIGHT  = BIT_3;
alias NJD_CLIP_TOP    = BIT_4;
alias NJD_CLIP_BOTTOM = BIT_5;
enum NJD_CLIP_SCREEN  = (NJD_CLIP_LEFT | NJD_CLIP_RIGHT | NJD_CLIP_TOP | NJD_CLIP_BOTTOM);

/* sprite */
alias NJD_SPRITE_ANGLE = BIT_0;
alias NJD_SPRITE_COLOR = BIT_1;
alias NJD_SPRITE_HFLIP = BIT_2;
alias NJD_SPRITE_VFLIP = BIT_3;
enum NJD_SPRITE_HVFLIP = (NJD_SPRITE_HFLIP | NJD_SPRITE_VFLIP);
alias NJD_SPRITE_SCALE = BIT_4;
alias NJD_SPRITE_ALPHA = BIT_5;

/* texture */
enum NJD_TEXTUREFILTER_POINT_SAMPLE = 0;
enum NJD_TEXTUREFILTER_BILINEAR     = 1;
enum NJD_TEXTUREFILTER_TRILINEAR    = 2;

enum NJD_TEXTURECLAMP_NOCLAMP  = 0;
enum NJD_TEXTURECLAMP_CLAMP_V  = 1;
enum NJD_TEXTURECLAMP_CLAMP_U  = 2;
enum NJD_TEXTURECLAMP_CLAMP_UV = 3;

enum NJD_TEXTUREFLIP_NOFLIP  = 0;
enum NJD_TEXTUREFLIP_FLIP_V  = 1;
enum NJD_TEXTUREFLIP_FLIP_U  = 2;
enum NJD_TEXTUREFLIP_FLIP_UV = 3;

/*--------------------------------------*/
/*      MACRO                           */
/*--------------------------------------*/
/*
 *  COLOR MACRO
 */
auto NJM_COLOR_A(ARG1)(ARG1 col)
{
	return (col >> 24);
}

auto NJM_COLOR_R(ARG1)(ARG1 col)
{
	return ((col >> 16) & 0xFF);
}

auto NJM_COLOR_G(ARG1)(ARG1 col)
{
	return ((col >> 8) & 0xFF);
}

auto NJM_COLOR_B(ARG1)(ARG1 col)
{
	return (col & 0xFF);
}

/*
 *  ANGLE MACRO
 */
enum NJD_PI = 3.141592;

auto NJM_DEG_RAD(ARG1)(ARG1 n)
{
	return (n * NJD_PI / 180.0);
}
/*  deg ¨ rad  */
auto NJM_DEG_ANG(ARG1)(ARG1 n)
{
	return (cast(Angle)((n * 65536.0) / 360.0));
}
/*  deg ¨ ang  */
auto NJM_RAD_ANG(ARG1)(ARG1 n)
{
	return (cast(Angle)((n * 65536.0) / (2 * NJD_PI)));
}
/*  rad ¨ ang  */
auto NJM_RAD_DEG(ARG1)(ARG1 n)
{
	return (n * 180.0 / NJD_PI);
}
/*  rad ¨ deg  */
auto NJM_ANG_DEG(ARG1)(ARG1 n)
{
	return (n * 360.0 / 65536.0);
}
/*  ang ¨ deg  */
auto NJM_ANG_RAD(ARG1)(ARG1 n)
{
	return (n * (2 * NJD_PI) / 65536.0);
}
/*  ang ¨ rad  */
/*
 *	MAX MIN MACRO
 */
auto NJM_MAX(ARG1, ARG2)(ARG1 a, ARG2 b)
{
	return (a > b ? a : b);
}

auto NJM_MIN(ARG1, ARG2)(ARG1 a, ARG2 b)
{
	return (a < b ? a : b);
}

/*
 *  SCROLL MACRO
 */
auto NJM_MAP(ARG1, ARG2, ARG3)(ARG1 celnum, ARG2 u, ARG3 v)
{
	return ((celnum << 16 | u << 8 | v));
}

auto NJM_MAPCELL(ARG1)(ARG1 map)
{
	return ((map >> 16) & 0x0000FFFF);
}

auto NJM_MAPU(ARG1)(ARG1 map)
{
	return ((map >> 8) & 0x000000FF);
}

auto NJM_MAPV(ARG1)(ARG1 map)
{
	return (map & 0x000000FF);
}

/*
 *  LIGHT MACRO
 */
ref auto NJM_LIGHT_INIT_VECTOR(ref in NJS_LIGHT l)
{
	return l.vctr;
} /*  NJS_LIGHT *l */
ref auto NJM_LIGHT_INIT_POINT(ref in NJS_LIGHT l)
{
	return l.pnt;
}

ref auto NJM_LIGHT_MATRIX(ref in NJS_LIGHT l)
{
	return l.mtrx;
}

ref auto NJM_LIGHT_VECTOR(ref in NJS_LIGHT l)
{
	return (l.ltcal).lvctr;
}

ref auto NJM_LIGHT_POINT(ref in NJS_LIGHT l)
{
	return (l.ltcal).lpnt;
}

ref auto NJM_LIGHT_AMB(ref in NJS_LIGHT l)
{
	return (l.ltcal).amb;
}

ref auto NJM_LIGHT_DIF(ref in NJS_LIGHT l)
{
	return (l.ltcal).dif;
}

ref auto NJM_LIGHT_SPC(ref in NJS_LIGHT l)
{
	return (l.ltcal).spc;
}

ref auto NJM_LIGHT_EXP(ref in NJS_LIGHT l)
{
	return (l.ltcal).exp;
}

ref auto NJM_LIGHT_COLOR(ref in NJS_LIGHT l)
{
	return (l.attr).argb;
}

/*
 *  DEBUG MACRO
 */
auto NJM_LOCATION(int x, int y)
{
	return (x << 16 | y);
}

auto NJM_GET_X(int n)
{
	return (cast(Sint16)(n >> 16));
}

auto NJM_GET_Y(int n)
{
	return (cast(Sint16)(n & 0x0000FFFF));
}

/*
 *  TEXTURE MACRO
 */
auto NJM_BANKGLOBALINDEX(int bank, uint globalIndex)
{
	return ((bank << NJD_TEXBANK_SHIFT) | (globalIndex & NJD_TEXPALGLOBAL_MASK));
}

ref auto NJM_TEXTURE_WIDTH(NJS_TEXLIST* texlist, int n)
{
	return ((cast(NJS_TEXMEMLIST*)texlist.textures[n].texaddr).texinfo.texsurface.nWidth);
}

ref auto NJM_TEXTURE_HEIGHT(NJS_TEXLIST* texlist, int n)
{
	return ((cast(NJS_TEXMEMLIST*)texlist.textures[n].texaddr).texinfo.texsurface.nHeight);
}

ref auto NJM_TEXTURE_GLOBALINDEX(NJS_TEXLIST* texlist, int n)
{
	return ((cast(NJS_TEXMEMLIST*)texlist.textures[n].texaddr).globalIndex);
}

ref auto NJM_TEXTURE_SIZE(NJS_TEXLIST* texlist, int n)
{
	return ((cast(NJS_TEXMEMLIST*)texlist.textures[n].texaddr).texinfo.texsurface.TextureSize);
}

/* _NINJA_DEF_H_ */
