module ninja.pad;

import ninja.types;

/*
 *  Shinobi Library
 *  Copyright (c) 1998 SEGA
 *
 *       Peripheral
 *
 *  Module  : Library Header File
 *  File    : sg_pad.h
 *  Create  : 1998-03-25
 *  Modify  : 1999-05-27
 *  Version : 1.50
 *  Note    :
 */


/*
 *  DEFINES / MACROS
 */

/******** ポート番号定数 ***************************************************/
/******** Control port number **********************************************/
enum PDD_PORT_A0 =    0;                   /* Port A0                      */
enum PDD_PORT_A1 =    1;                   /* Port A1                      */
enum PDD_PORT_A2 =    2;                   /* Port A2                      */
enum PDD_PORT_A3 =    3;                   /* Port A3                      */
enum PDD_PORT_A4 =    4;                   /* Port A4                      */
enum PDD_PORT_A5 =    5;                   /* Port A5                      */
enum PDD_PORT_B0 =    6;                   /* Port B0                      */
enum PDD_PORT_B1 =    7;                   /* Port B1                      */
enum PDD_PORT_B2 =    8;                   /* Port B2                      */
enum PDD_PORT_B3 =    9;                   /* Port B3                      */
enum PDD_PORT_B4 =   10;                   /* Port B4                      */
enum PDD_PORT_B5 =   11;                   /* Port B5                      */
enum PDD_PORT_C0 =   12;                   /* Port C0                      */
enum PDD_PORT_C1 =   13;                   /* Port C1                      */
enum PDD_PORT_C2 =   14;                   /* Port C2                      */
enum PDD_PORT_C3 =   15;                   /* Port C3                      */
enum PDD_PORT_C4 =   16;                   /* Port C4                      */
enum PDD_PORT_C5 =   17;                   /* Port C5                      */
enum PDD_PORT_D0 =   18;                   /* Port D0                      */
enum PDD_PORT_D1 =   19;                   /* Port D1                      */
enum PDD_PORT_D2 =   20;                   /* Port D2                      */
enum PDD_PORT_D3 =   21;                   /* Port D3                      */
enum PDD_PORT_D4 =   22;                   /* Port D4                      */
enum PDD_PORT_D5 =   23;                   /* Port D5                      */

/******** ボタン・レバーサポート状態 ***************************************/
/******** Which button does controller have ? ******************************/
enum PDD_DEV_SUPPORT_AY2 =   (1 << 21);    /* アナログ軸Y2を持つ           */
										   /* Analog axis Y2               */
enum PDD_DEV_SUPPORT_AX2 =   (1 << 20);    /* アナログ軸X2を持つ           */
										   /* Analog axis X2               */
enum PDD_DEV_SUPPORT_AY1 =   (1 << 19);    /* アナログ軸Y1を持つ           */
										   /* Analog axis Y1               */
enum PDD_DEV_SUPPORT_AX1 =   (1 << 18);    /* アナログ軸X1を持つ           */
										   /* Analog axis X1               */
enum PDD_DEV_SUPPORT_AL =    (1 << 17);    /* アナログ軸Lを持つ            */
										   /* Analog trigger L             */
enum PDD_DEV_SUPPORT_AR =    (1 << 16);    /* アナログ軸Rを持つ            */
										   /* Analog trigger R             */
enum PDD_DEV_SUPPORT_KRB =   (1 << 15);    /* デジタル十字キーB右を持つ    */
										   /* Right button B               */
enum PDD_DEV_SUPPORT_KLB =   (1 << 14);    /* デジタル十字キーB左を持つ    */
										   /* Left button B                */
enum PDD_DEV_SUPPORT_KDB =   (1 << 13);    /* デジタル十字キーB下を持つ    */
										   /* Down button B                */
enum PDD_DEV_SUPPORT_KUB =   (1 << 12);    /* デジタル十字キーB上を持つ    */
										   /* Up button B                  */
enum PDD_DEV_SUPPORT_TD =    (1 << 11);    /* Dボタンを持つ                */
										   /* D button                     */
enum PDD_DEV_SUPPORT_TX =    (1 << 10);    /* Xボタンを持つ                */
										   /* X button                     */
enum PDD_DEV_SUPPORT_TY =    (1 <<  9);    /* Yボタンを持つ                */
										   /* Y button                     */
enum PDD_DEV_SUPPORT_TZ =    (1 <<  8);    /* Zボタンを持つ                */
										   /* Z button                     */
enum PDD_DEV_SUPPORT_KR =    (1 <<  7);    /* デジタル十字キーA右を持つ    */
										   /* Right button A               */
enum PDD_DEV_SUPPORT_KL =    (1 <<  6);    /* デジタル十字キーA左を持つ    */
										   /* Left button A                */
enum PDD_DEV_SUPPORT_KD =    (1 <<  5);    /* デジタル十字キーA下を持つ    */
										   /* Down button A                */
enum PDD_DEV_SUPPORT_KU =    (1 <<  4);    /* デジタル十字キーA上を持つ    */
										   /* UP button A                  */
enum PDD_DEV_SUPPORT_ST =    (1 <<  3);    /* スタートボタンを持つ         */
										   /* Start button                 */
enum PDD_DEV_SUPPORT_TA =    (1 <<  2);    /* Aボタンを持つ                */
										   /* A button                     */
enum PDD_DEV_SUPPORT_TB =    (1 <<  1);    /* Bボタンを持つ                */
										   /* B button                     */
enum PDD_DEV_SUPPORT_TC =    (1 <<  0);    /* Cボタンを持つ                */
										   /* C button                     */

/******** ボタン定数 *******************************************************/
/******** Button ***********************************************************/
enum PDD_DGT_TL =    (1 << 17);            /* Lボタン(エミュレーション)    */
										   /* L button(emulation)          */
enum PDD_DGT_TR =    (1 << 16);            /* Rボタン(エミュレーション)    */
										   /* R button(emulation)          */
enum PDD_DGT_KRB =   (1 << 15);            /* デジタル十字キーB右          */
										   /* Right button B               */
enum PDD_DGT_KLB =   (1 << 14);            /* デジタル十字キーB左          */
										   /* Left button B                */
enum PDD_DGT_KDB =   (1 << 13);            /* デジタル十字キーB下          */
										   /* Down button B                */
enum PDD_DGT_KUB =   (1 << 12);            /* デジタル十字キーB上          */
										   /* Up button B                  */
enum PDD_DGT_TD =    (1 << 11);            /* Dボタン                      */
										   /* D button                     */
enum PDD_DGT_TX =    (1 << 10);            /* Xボタン                      */
										   /* X button                     */
enum PDD_DGT_TY =    (1 <<  9);            /* Yボタン                      */
										   /* Y button                     */
enum PDD_DGT_TZ =    (1 <<  8);            /* Zボタン                      */
										   /* Z button                     */
enum PDD_DGT_KR =    (1 <<  7);            /* デジタル十字キーA右          */
										   /* Right button A               */
enum PDD_DGT_KL =    (1 <<  6);            /* デジタル十字キーA左          */
										   /* Left button A                */
enum PDD_DGT_KD =    (1 <<  5);            /* デジタル十字キーA下          */
										   /* Down button A                */
enum PDD_DGT_KU =    (1 <<  4);            /* デジタル十字キーA上          */
										   /* Up button A                  */
enum PDD_DGT_ST =    (1 <<  3);            /* スタートボタン               */
										   /* Start button                 */
enum PDD_DGT_TA =    (1 <<  2);            /* Aボタン                      */
										   /* A button                     */
enum PDD_DGT_TB =    (1 <<  1);            /* Bボタン                      */
										   /* B button                     */
enum PDD_DGT_TC =    (1 <<  0);            /* Cボタン                      */
										   /* C button                     */

/******** エラー定数 *******************************************************/
/******** Error code *******************************************************/
enum PDD_ERR_OK =       0x00000000;        /* エラーなし                   */
										   /* No error                     */
enum PDD_ERR_RETRY =    0xff0000fc;        /* Transmit Againによるリトライ */
										   /* Retry error                  */
enum PDD_ERR_GENERIC =  0xff000000;        /* 未定義エラー                 */
										   /* Undefined error              */

/******** 論理モード定数 ***************************************************/
/******** Logic mode *******************************************************/
enum PDD_PLOGIC_ACTIVE =    0;             /* 正論理(デフォルト)           */
										   /* Active logic(default)        */
enum PDD_PLOGIC_NEGATIVE =  1;             /* 負論理                       */
										   /* Negative logic               */

/******** Maple モード定数 *************************************************/
/******** Maple mode *******************************************************/
enum PDD_MODE_TYPE_A =      1;             /* MapleタイプA(SET4用)         */
										   /* Maple type A (fot SET4)      */
enum PDD_MODE_TYPE_B =      0;             /* MapleタイプB(SET5以降用)     */
										   /* Maple type B (fot SET5,DC)   */

/******** ガンモード定数 ***************************************************/
/******** Gun mode *********************************************************/
enum PDD_GUNMODE_OFF =   0x00000000;       /* 通常モード                   */
										   /* Normal mode (not gun mode)   */
enum PDD_GUNMODE_A =     0x00000001;       /* PORT Aガンモード             */
										   /* Port A gun mode              */
enum PDD_GUNMODE_B =     0x00000002;       /* PORT Bガンモード             */
										   /* Port B gun mode              */
enum PDD_GUNMODE_C =     0x00000004;       /* PORT Cガンモード             */
										   /* Port C gun mode              */
enum PDD_GUNMODE_D =     0x00000008;       /* PORT Dガンモード             */
										   /* Port D gun mode              */
enum PDD_GUNMODE_ALL =   0x0000000f;       /* 全ポートガンモード           */
										   /* All ports gun mode           */

/******** ワーク容量計算 ***************************************************/
/******** Calculate work size **********************************************/
 auto PDM_WORK_SIZE(  ARG1 )(ARG1 num) { return (num * 1024 * 2); }


/*
 *  PERIPHERAL INFO
 */

/******** ペリフェラルタイプ ***********************************************/
/******** Peripheral type **************************************************/
enum PDD_DEVTYPE_CONTROLLER =   (1 << 0);  /* コントローラ                 */
										   /* Controller                   */
enum PDD_DEVTYPE_STORAGE =      (1 << 1);  /* ストレージ                   */
										   /* Storage                      */
enum PDD_DEVTYPE_LCD =          (1 << 2);  /* LCD                          */
										   /* LCD                          */
enum PDD_DEVTYPE_TIMER =        (1 << 3);  /* タイマ                       */
										   /* Timer                        */
enum PDD_DEVTYPE_SOUNDINPUT =   (1 << 4);  /* 音声入力                     */
										   /* Sound input device           */
enum PDD_DEVTYPE_KEYBOARD =     (1 << 6);  /* キーボード                   */
										   /* Keyboard                     */
enum PDD_DEVTYPE_LIGHTGUN =     (1 << 7);  /* ライトガン                   */
										   /* Light gun controller         */
enum PDD_DEVTYPE_VIBRATION =    (1 << 8);  /* 振動デバイス                 */
										   /* Vibration device             */

/******** エリアコード *****************************************************/
/******** Area code ********************************************************/
enum PDD_DEVAREA_USA =          (1 << 0);  /* 北アメリカ地区               */
										   /* North America                */
enum PDD_DEVAREA_JAPAN =        (1 << 1);  /* 日本地区                     */
										   /* Japan                        */
enum PDD_DEVAREA_ASIA =         (1 << 2);  /* アジア地区                   */
										   /* Asia                         */
enum PDD_DEVAREA_EUROPE =       (1 << 3);  /* ヨーロッパ地区               */
										   /* Europe                       */
enum PDD_DEVAREA_RESERVED1 =    (1 << 4);  /* 予約地区1                    */
										   /* Reserved area 1              */
enum PDD_DEVAREA_RESERVED2 =    (1 << 5);  /* 予約地区2                    */
										   /* Reserved area 2              */
enum PDD_DEVAREA_RESERVED3 =    (1 << 6);  /* 予約地区3                    */
										   /* Reserved area 3              */
enum PDD_DEVAREA_RESERVED4 =    (1 << 7);  /* 予約地区4                    */
										   /* Reserved area 4              */

/******** コネクタの向き ***************************************************/
/******** Connector direction **********************************************/
enum PDD_CONDIR_TOPSIDE =       0;         /* 上                           */
										   /* Top side                     */
enum PDD_CONDIR_BOTTOMSIDE =    1;         /* 下                           */
										   /* Bottom side                  */
enum PDD_CONDIR_LEFTSIDE =      2;         /* 左                           */
										   /* Left side                    */
enum PDD_CONDIR_RIGHTSIDE =     3;         /* 右                           */
										   /* Right side                   */


/*
 *  TYPEDEFS
 */

/******** ペリフェラル情報構造体 *******************************************/
/******** Peripheral information structure *********************************/
struct PDS_PERIPHERALINFO
{
	Uint32 type;                /* ペリフェラルのタイプ                    */
								/* Peripheral type                         */
	Uint32[3] reserved;         /* 予約                                    */
								/* Reserved                                */
	Uint8 is_root;              /* ルートデバイスかどうかを表す            */
								/* Is root device ?                        */
	Uint8 area_code;            /* エリアコード                            */
								/* Area code                               */
	Uint8[2] connector_dir;     /* コネクタの向き                          */
								/* Connector direction                     */
	char[32] product_name;      /* 製品名                                  */
								/* Product name                            */
	char[64] license;           /* ライセンス                              */
								/* License string                          */
	Uint16 stdby_pow;           /* スタンバイ消費電流                      */
								/* Standby power                           */
	Uint16 max_pow;             /* 最大消費電流                            */
								/* Max power                               */
};

/******** ペリフェラルデータ構造体 *****************************************/
/******** Peripheral structure *********************************************/
struct PDS_PERIPHERAL
{
	Uint32 id;                            /* デバイスID(参照しないで下さい)*/
										  /* Device ID(Please do not refer)*/
	Uint32 support;                       /* ボタンのサポート情報          */
										  /* Buttons controller has        */
	Uint32 on;                            /* 現在押されているボタン        */
										  /* Buttons pressed               */
	Uint32 off;                           /* 現在放されているボタン        */
										  /* Buttons released              */
	Uint32 press;                         /* 現在押された瞬間にあるボタン  */
										  /* Buttons pressed now(edge)     */
	Uint32 release;                       /* 現在放された瞬間にあるボタン  */
										  /* Buttons released now(edge     */
	Uint16 r;                             /* 軸データR     (     0～255  ) */
										  /* R Trigger     (     0- 255  ) */
	Uint16 l;                             /* 軸データL     (     0～255  ) */
										  /* L Trigger     (     0- 255  ) */
	Sint16 x1;                            /* 軸データX1    (  -128～127  ) */
										  /* Axis X1       (  -128- 127  ) */
	Sint16 y1;                            /* 軸データY1    (  -128～127  ) */
										  /* Axis Y1       (  -128- 127  ) */
	Sint16 x2;                            /* 軸データX2    (  -128～127  ) */
										  /* Axis X2       (  -128- 127  ) */
	Sint16 y2;                            /* 軸データY2    (  -128～127  ) */
										  /* Axis Y2       (  -128- 127  ) */
	char* name;                           /* デバイス名称                  */
										  /* Controller name               */
	void* extend;                         /* 拡張データアドレス            */
										  /* Extended data address         */
	Uint32 old;                           /* 予約                          */
										  /* Reserved                      */
	PDS_PERIPHERALINFO* info;             /* ペリフェラル情報へのポインタ  */
										  /* Pointer to peripheral info.   */
};

/*--------------------------------------------------------------------------*/

 /* _SG_PAD_H_ */



/*
	Ninja Library

	COPYRIGHT (C) SEGA ENTERPRISES,LTD.
*/


/*
 *  DEFINES / MACROS
 */

/******** ポート番号定数 ***************************************************/
alias   PDD_PORT_A0 NJD_PORT_A0;              /* ポートA0                 */
alias   PDD_PORT_A1 NJD_PORT_A1;              /* ポートA1                 */
alias   PDD_PORT_A2 NJD_PORT_A2;              /* ポートA2                 */
alias   PDD_PORT_A3 NJD_PORT_A3;              /* ポートA3                 */
alias   PDD_PORT_A4 NJD_PORT_A4;              /* ポートA4                 */
alias   PDD_PORT_A5 NJD_PORT_A5;              /* ポートA5                 */
alias   PDD_PORT_B0 NJD_PORT_B0;              /* ポートB0                 */
alias   PDD_PORT_B1 NJD_PORT_B1;              /* ポートB1                 */
alias   PDD_PORT_B2 NJD_PORT_B2;              /* ポートB2                 */
alias   PDD_PORT_B3 NJD_PORT_B3;              /* ポートB3                 */
alias   PDD_PORT_B4 NJD_PORT_B4;              /* ポートB4                 */
alias   PDD_PORT_B5 NJD_PORT_B5;              /* ポートB5                 */
alias   PDD_PORT_C0 NJD_PORT_C0;              /* ポートC0                 */
alias   PDD_PORT_C1 NJD_PORT_C1;              /* ポートC1                 */
alias   PDD_PORT_C2 NJD_PORT_C2;              /* ポートC2                 */
alias   PDD_PORT_C3 NJD_PORT_C3;              /* ポートC3                 */
alias   PDD_PORT_C4 NJD_PORT_C4;              /* ポートC4                 */
alias   PDD_PORT_C5 NJD_PORT_C5;              /* ポートC5                 */
alias   PDD_PORT_D0 NJD_PORT_D0;              /* ポートD0                 */
alias   PDD_PORT_D1 NJD_PORT_D1;              /* ポートD1                 */
alias   PDD_PORT_D2 NJD_PORT_D2;              /* ポートD2                 */
alias   PDD_PORT_D3 NJD_PORT_D3;              /* ポートD3                 */
alias   PDD_PORT_D4 NJD_PORT_D4;              /* ポートD4                 */
alias   PDD_PORT_D5 NJD_PORT_D5;              /* ポートD5                 */

/******** ボタン・レバーサポート状態 ***************************************/
alias PDD_DEV_SUPPORT_AY2 NJD_DEV_SUPPORT_AY2; /* アナログ軸Y2を持つ      */
alias PDD_DEV_SUPPORT_AX2 NJD_DEV_SUPPORT_AX2; /* アナログ軸X2を持つ      */
alias PDD_DEV_SUPPORT_AY1 NJD_DEV_SUPPORT_AY1; /* アナログ軸Y1を持つ      */
alias PDD_DEV_SUPPORT_AX1 NJD_DEV_SUPPORT_AX1; /* アナログ軸X1を持つ      */
alias  PDD_DEV_SUPPORT_AL NJD_DEV_SUPPORT_AL;  /* アナログ軸Lを持つ       */
alias  PDD_DEV_SUPPORT_AR NJD_DEV_SUPPORT_AR;  /* アナログ軸Rを持つ       */
alias PDD_DEV_SUPPORT_KRB NJD_DEV_SUPPORT_KRB; /* 十字キーB右を持つ       */
alias PDD_DEV_SUPPORT_KLB NJD_DEV_SUPPORT_KLB; /* 十字キーB左を持つ       */
alias PDD_DEV_SUPPORT_KDB NJD_DEV_SUPPORT_KDB; /* 十字キーB下を持つ       */
alias PDD_DEV_SUPPORT_KUB NJD_DEV_SUPPORT_KUB; /* 十字キーB上を持つ       */
alias  PDD_DEV_SUPPORT_TD NJD_DEV_SUPPORT_TD;  /* Dボタンを持つ           */
alias  PDD_DEV_SUPPORT_TX NJD_DEV_SUPPORT_TX;  /* Xボタンを持つ           */
alias  PDD_DEV_SUPPORT_TY NJD_DEV_SUPPORT_TY;  /* Yボタンを持つ           */
alias  PDD_DEV_SUPPORT_TZ NJD_DEV_SUPPORT_TZ;  /* Zボタンを持つ           */
alias  PDD_DEV_SUPPORT_KR NJD_DEV_SUPPORT_KR;  /* 十字キーA右を持つ       */
alias  PDD_DEV_SUPPORT_KL NJD_DEV_SUPPORT_KL;  /* 十字キーA左を持つ       */
alias  PDD_DEV_SUPPORT_KD NJD_DEV_SUPPORT_KD;  /* 十字キーA下を持つ       */
alias  PDD_DEV_SUPPORT_KU NJD_DEV_SUPPORT_KU;  /* 十字キーA上を持つ       */
alias  PDD_DEV_SUPPORT_ST NJD_DEV_SUPPORT_ST;  /* スタートボタンを持つ    */
alias  PDD_DEV_SUPPORT_TA NJD_DEV_SUPPORT_TA;  /* Aボタンを持つ           */
alias  PDD_DEV_SUPPORT_TB NJD_DEV_SUPPORT_TB;  /* Bボタンを持つ           */
alias  PDD_DEV_SUPPORT_TC NJD_DEV_SUPPORT_TC;  /* Cボタンを持つ           */

/******** ボタン定数 *******************************************************/
alias    PDD_DGT_TL NJD_DGT_TL;           /* Lボタン(エミュレーション)    */
alias    PDD_DGT_TR NJD_DGT_TR;           /* Rボタン(エミュレーション)    */
alias   PDD_DGT_KRB NJD_DGT_KRB;          /* デジタル十字キーB右          */
alias   PDD_DGT_KLB NJD_DGT_KLB;          /* デジタル十字キーB左          */
alias   PDD_DGT_KDB NJD_DGT_KDB;          /* デジタル十字キーB下          */
alias   PDD_DGT_KUB NJD_DGT_KUB;          /* デジタル十字キーB上          */
alias    PDD_DGT_TD NJD_DGT_TD;           /* Dボタン                      */
alias    PDD_DGT_TX NJD_DGT_TX;           /* Xボタン                      */
alias    PDD_DGT_TY NJD_DGT_TY;           /* Yボタン                      */
alias    PDD_DGT_TZ NJD_DGT_TZ;           /* Zボタン                      */
alias    PDD_DGT_KR NJD_DGT_KR;           /* デジタル十字キーA右          */
alias    PDD_DGT_KL NJD_DGT_KL;           /* デジタル十字キーA左          */
alias    PDD_DGT_KD NJD_DGT_KD;           /* デジタル十字キーA下          */
alias    PDD_DGT_KU NJD_DGT_KU;           /* デジタル十字キーA上          */
alias    PDD_DGT_ST NJD_DGT_ST;           /* スタートボタン               */
alias    PDD_DGT_TA NJD_DGT_TA;           /* Aボタン                      */
alias    PDD_DGT_TB NJD_DGT_TB;           /* Bボタン                      */
alias    PDD_DGT_TC NJD_DGT_TC;           /* Cボタン                      */


/*
 *  TYPEDEFS
 */

alias PDS_PERIPHERAL NJS_PERIPHERAL;

enum NJD_USER_CONTINUE =  0;
enum NJD_USER_EXIT =      (-1);

 /* _NINJAPAD_H_ */

