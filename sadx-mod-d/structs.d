module structs;

import ninja;
import enums;

align (1) extern (C):

struct Rotation
{
	int x, y, z;
}

alias Rotation3 = Rotation;

extern (C) alias void function(ObjectMaster *) ObjectFuncPtr;
extern (C) alias void function(NJS_MESHSET_SADX*, NJS_POINT3*, NJS_VECTOR*) VBufferFuncPtr;


// TODO: Grab actual structs from disassembly.
alias void ABC_TXT_struct;
alias void ChaoHudThing;
alias void PDS_VIBPARAM;
alias void pvm_thing;
alias void struct_1;
alias void what;

struct AllocatedMem
{
	AllocatedMem *next;
	AllocatedMem *field_4;
	AllocatedMem *field_8;
	int PointsToLastThingMaybe;
	int field_10;
	int field_14;
	int field_18;
	int field_1C;
	int data;
	int field_24;
	int field_28;
	int field_2C;
	int field_30;
	int field_34;
	int field_38;
	int field_3C;
}

struct SaveFileInfo
{
	const(char) *Filename;
	uint LowDate;
	uint HighDate;
	SaveFileInfo *Next;
}

struct LineInfo
{
	NJS_POINT3 *Points;
	int *Colors;
	int field_8;
	int Count;
}

struct FogData
{
	float Layer;
	float Distance;
	int Color;
	int Toggle;
}

struct PVMEntry
{
	const(char) * Name;
	NJS_TEXLIST *TexList;
}

struct LevelPVMList
{
	short Level;
	short NumTextures;
	PVMEntry *PVMList;
}

struct ObjectListEntry
{
	char Flags;
	char ObjectListIndex;
	short UseDistance;
	float Distance;
	int field_8;
	ObjectFuncPtr LoadSub;
	const(char) *Name;
}

struct StartPosition
{
	short LevelID;
	short ActID;
	NJS_VECTOR Position;
	int YRot;
}

struct ControllerData
{
	uint ID;
	uint Support;
	uint HeldButtons;
	uint NotHeldButtons;
	uint PressedButtons;
	uint ReleasedButtons;
	ushort RTriggerPressure;
	ushort LTriggerPressure;
	short LeftStickX;
	short LeftStickY;
	short RightStickX;
	short RightStickY;
	char * Name;
	void * Extend;
	uint Old;
	void * Info;
}

struct PolarCoord
{
	Angle direction;
	float magnitude;
}

struct SETEntry
{
	short ObjectType;
	short XRotation;
	short YRotation;
	short ZRotation;
	NJS_VECTOR Position;
	NJS_VECTOR Properties;
}

struct RecapScreen
{
	float Speed;
	int LineCount;
	const(char) **TextData;
}

struct COL
{
	NJS_VECTOR Center;
	float Radius;
	int[2] Padding;
	NJS_OBJECT *Model;
	int anonymous_6;
	int Flags;
}

struct GeoAnimData
{
	int anonymous_0;
	float anonymous_1;
	float anonymous_2;
	NJS_OBJECT *Model;
	NJS_ACTION *Animation;
	NJS_TEXLIST *TexList;
}

struct LandTable
{
	short COLCount;
	short AnimCount;
	// see LandTableFlags enum
	int Flags;
	float Unknown_1;
	COL *Col;
	GeoAnimData *AnimData;
	const(char) *TexName;
	NJS_TEXLIST *TexList;
	int Unknown_4;
	int Unknown_5;
}

struct P2Path
{
	int field_0;
	NJS_VECTOR Position;
}

struct Loop
{
	short Ang_X;
	short Ang_Y;
	float Dist;
	NJS_VECTOR Position;
}

struct LoopHead
{
	short Unknown_0;
	short Count;
	float TotalDist;
	Loop *LoopList;
	ObjectFuncPtr Object;
}

struct AnimData_t
{
	NJS_ACTION *Animation;
	char Instance;
	char Property;
	short NextAnim;
	float TransitionSpeed;
	float AnimationSpeed;
}

struct PhysicsData_t
{
	int HangTime;
	float FloorGrip;
	float HSpeedCap;
	float VSpeedCap;
	float MaxAccel;
	float field_14;
	float JumpSpeed;
	float SpringControl;
	float field_20;
	float RollCancel;
	float RollEnd;
	float Run1;
	float Knockback;
	float Run2;
	float JumpAddSpeed;
	float GroundAccel;
	float AirAccel;
	float GroundDecel;
	float Brake;
	float AirBrake;
	float AirDecel;
	float RollDecel;
	float GravityAdd;
	float HitSpeed;
	float MinSpeed;
	float field_64;
	float field_68;
	float field_6C;
	float RippleSize;
	float CollisionSize;
	float Gravity;
	float CameraY;
	float YOff;
}

struct WeldInfo
{
	NJS_OBJECT *BaseModel;
	NJS_OBJECT *ModelA;
	NJS_OBJECT *ModelB;
	char VertexPairCount;
	char WeldType;
	short anonymous_5;
	NJS_VECTOR *VertexBuffer;
	ushort *VertIndexes;
}

struct OffsetAnimData
{
	int FrameNum;
	void *anonymous_0;
}

struct AnimFrame_1
{
	void *Item1Off;
	int Item1Count;
}

struct AnimFrame_2
{
	void *Item1Off;
	void *Item2Off;
	int Item1Count;
	int Item2Count;
}

struct AnimFrame_3
{
	void *Item1Off;
	void *Item2Off;
	void *Item3Off;
	int Item1Count;
	int Item2Count;
	int Item3Count;
}

struct AnimThing
{
	short State;
	short field_2;
	short Index;
	short LastIndex;
	short LastIndex2;
	short field_A;
	short field_C;
	short field_E;
	float Frame;
	int dword14;
	float *pfloat18;
	float *pfloat1C;
	AnimData_t *AnimData;
	WeldInfo *weldInfo;
	NJS_ACTION *action;
}

struct struct_a3
{
	int ShadowRotationX;
	int ShadowRotationY;
	int ColFlagsA;
	int ColFlagsB;
	float DistanceMin;
	float DistanceMax;
	int ColFlagsC;
	int ColFlagsD;
	float ShadowScale;
}

struct CharObj2
{
	float SpindashSpeed;
	short Upgrades;
	short Powerups;
	short JumpTime;
	short field_A;
	short UnderwaterTime;
	short IdleTime;
	short StatusBackup;
	int field_12;
	char[2] gap16;
	float LoopDist;
	float Up;
	NJS_VECTOR SomeKindOfSpeedOffset;
	NJS_VECTOR field_2C;
	NJS_VECTOR Speed;
	NJS_VECTOR field_44;
	NJS_VECTOR SurfaceNormal;
	int SurfaceFlags;
	int SurfaceFlags_Old;
	void *array_1x132;
	ObjectMaster *ObjectHeld;
	void *field_6C;
	void *SomePointer;
	int field_74;
	void *array_15x32;
	short SonicSpinTimeProbably;
	short SonicSpinTimer;
	short LightdashTime;
	short LightdashTimer;
	int field_84;
	NJS_VECTOR field_88;
	float SomeFrameNumberThing;
	float TailsFlightTime;
	PhysicsData_t PhysicsData;
	AnimThing AnimationThing;
	NJS_VECTOR[12] SoManyVectors;
	struct_a3 _struct_a3;
}

struct CollisionData
{
	char field_0;
	char field_1;
	char field_2;
	char field_3;
	int field_4;
	NJS_VECTOR origin;
	NJS_VECTOR scale;
	int field_20;
	Rotation3 rotation;
}
struct CollisionThing
{
	char field_0;
	char field_1;
	short FlagsMaybe;
	EntityData1 *Entity;
}

struct CollisionInfo
{
	short List;
	short ThingCount;
	short Flags;
	short Count;
	float Radius;
	CollisionData *CollisionArray;
	CollisionThing[16] CollisionThings;
	int CollisionThingsEnd;
	int field_94;
	int field_98;
	ObjectMaster *Object;
	short field_A0;
	short field_A2;
	CollisionInfo *CollidingObject;
}

struct DynamicCOL
{
	int Flags;
	NJS_OBJECT *Model;
	ObjectMaster *Entity;
}

struct EntityData1
{
	char Action;
	char NextAction;
	char Unknown;
	char Index;
	short Status;
	short InvulnerableTime;
	char CharIndex;
	char CharID;
	short field_A;
	NJS_OBJECT* Object;
	Loop* LoopData;
	Rotation3 Rotation;
	NJS_VECTOR Position;
	NJS_VECTOR Scale;
	CollisionInfo* collisionInfo;
	void *field_3C;
}

struct HomingAttackTarget
{
	EntityData1 *entity;
	float distance;
}

struct EntityData2
{
	CharObj2 *CharacterData;
	NJS_VECTOR VelocityDirection;
	NJS_VECTOR SomeCollisionVector;
	Rotation3 Forward;
	int field_28;
	int field_2C;
	int field_30;
	float field_34;
	float field_38;
	float SomeMultiplier;
}

struct ObjectData2
{
	char[4] gap_0;
	NJS_VECTOR field_4;
	char[62] gap_10;
	short field_4E;
	NJS_VECTOR vector_a;
	NJS_VECTOR vector_b;
	NJS_VECTOR vector_c;
	char[4] gap_74;
	float field_78;
	char[16] gap_7C;
	float field_8C;
	char[12] gap_90;
	int field_9C;
	float field_A0;
	int field_A4;
	float field_A8;
	float field_AC;
	float field_B0;
	float field_B4;
	float field_B8;
	float field_BC;
	float field_C0;
	float field_C4;
	int field_C8;
	char[220] gap_CC;
	int field_1A8;
	char[4] gap_1AC;
	int field_1B0;
	char[28] gap_1B4;
	int field_1D0;
	int field_1D4;
	float field_1D8;
	float field_1DC;
	float field_1E0;
	char[16] gap_1E4;
	NJS_ACTION *AnimHead_ptr_A;
	NJS_ACTION *AnimHead_ptr_B;
	NJS_MATRIX matrix;
}

mixin template SETObjData_t()
{
	char LoadCount;
	Uint8 f1;
	short Flags;
	ObjectMaster *ObjInstance;
	SETEntry *setEntry;
	float Distance;
}

struct SETObjData
{
	mixin SETObjData_t;
}

struct PRM_Entry
{
	char Mission;
	char Display;
	char List;
	char field_3;
	char Goal;
	char NumItems;
	char TimerSecs;
	char field_7;
	char Appearance;
	char field_9;
	char field_A;
	char field_B;
}

struct MissionSETData
{
	mixin SETObjData_t;
	PRM_Entry *PRMEntry;
}

union SETDataUnion
{
	SETObjData SETData;
	MissionSETData missionSETData;
}

struct ObjectMaster
{
	ObjectMaster *Next;
	ObjectMaster *Previous;
	ObjectMaster *Parent;
	ObjectMaster *Child;
	ObjectFuncPtr MainSub;
	ObjectFuncPtr DisplaySub;
	ObjectFuncPtr DeleteSub;
	SETDataUnion SETData;
	EntityData1 *Data1;
	void *Data2;
	void *UnknownA_ptr;
	void *UnknownB_ptr;
	int field_30;
}

struct VideoData
{
	const(char) *Filename;
	int field_4;
	int NumFrames;
	short Width;
	short Height;
}

struct PathDataPtr
{
	int LevelAct;
	LoopHead **PathList;
}

struct ObjectList
{
	int Count;
	ObjectListEntry *List;
}

struct LevelItemAccess
{
	int Character;
	int Level;
}

struct CharSelData
{
	ObjectFuncPtr CodePointer;
	NJS_TEXLIST *TextureList;
	NJS_ACTION **anonymous_1;
	int *anonymous_2;
}

struct CharacterLightData
{
	float field_0;
	char anonymous_0;
	char anonymous_1;
	char anonymous_2;
	char anonymous_3;
	float anonymous_4;
	float anonymous_5;
	float anonymous_6;
	float anonymous_7;
	float anonymous_8;
	float anonymous_9;
	float anonymous_10;
	float anonymous_11;
	float anonymous_12;
	float anonymous_13;
}

struct PaletteLight
{
	Uint8 Level;
	Uint8 Act;
	Uint8 Type;
	Uint8 Flags;
	NJS_VECTOR Direction;
	float DIF; // (0~4 ) Diffuse
	float AMB_R; // (0~4 ) Ambient R
	float AMB_G; // (0~4 ) Ambient G
	float AMB_B; // (0~4 ) Ambient B
	float CO_pow; // (0~99) [unused] Upper Color Power (higher is less visible)
	float CO_R; // (0~4 ) [unused] Upper Color R
	float CO_G; // (0~4 ) [unused] Upper Color G
	float CO_B; // (0~4 ) [unused] Upper Color B
	float SP_pow; // (0~99) Upper Specular Power (higher is less visible)
	float SP_R; // (0~4 ) Upper Specular R
	float SP_G; // (0~4 ) Upper Specular G
	float SP_B; // (0~4 ) Upper Specular B
	float CO2_pow; // (0~99) [unused] Lower Color Power (higher is less visible)
	float CO2_R; // (0~4 ) [unused] Lower Color R
	float CO2_G; // (0~4 ) [unused] Lower Color G
	float CO2_B; // (0~4 ) [unused] Lower Color B
	float SP2_pow; // (0~99) [unused] Lower Specular Power (higher is less visible)
	float SP2_R; // (0~4 ) [unused] Lower Specular R
	float SP2_G; // (0~4 ) [unused] Lower Specular G
	float SP2_B; // (0~4 ) [unused] Lower Specular B
}

struct SecondaryEntrance
{
	NJS_VECTOR Position;
	int YRot;
}

struct TextureAnimationData
{
	NJS_OBJECT *Model;
	char MatCount;
	char[8] MatIDs;
	char TexID;
	short TexTime;
}

struct LevelClearFlagData
{
	short Level;
	short FlagOffset;
}

struct NextLevelData
{
	char CGMovie;
	char CurrentLevel;
	char NextLevelAdventure;
	char NextActAdventure;
	char StartPointAdventure;
	char AltNextLevel;
	char AltNextAct;
	char AltStartPoint;
}

struct FieldStartPosition
{
	short LevelID;
	short FieldID;
	NJS_VECTOR Position;
	int YRot;
}

struct LevelCutsceneData
{
	char Level;
	char Act;
	short Character;
	char field_4;
	char field_5;
	short Cutscene;
	char field_8;
	char field_9;
	char field_A;
	char field_B;
}

struct CutsceneData
{
	ObjectFuncPtr Function;
	void *Textures;
}

struct HintText_Text
{
	const(char) *Message;
	int Time;
}

struct HintText_Entry
{
	short *Properties;
	HintText_Text *Text;
}

struct AdventureData_t
{
	char TimeOfDay;
	char field_1;
	short field_2;
	short field_4;
	short Entrance;
	short LevelAct;
	short field_A;
}

struct SceneSelectData
{
	void *Code;
	char Level;
	char Act;
	short Entrance;
	char[32] Name;
}

struct TrialLevelListEntry
{
	char Level;
	char Act;
}

struct TrialLevelList
{
	TrialLevelListEntry *Levels;
	int Count;
}

struct SoundFileInfo
{
	int Bank;
	const(char) *Filename;
}

struct SoundList
{
	int Count;
	SoundFileInfo *List;
}

extern (C) alias void function(EntityData1*) ItemBoxFunction;

struct ItemBoxData
{
	int Texture;
	ItemBoxFunction Function;
}

struct Time
{
	char Minutes;
	char Seconds;
	char Frames;
}

struct TwinkleCircuitTimes
{
	Time[3] BestTimes;
	Time Lap1Time;
	Time Lap2Time;
}

struct SaveFileData
{
	int Checksum;
	int PlayTime;
	int[32] HighScores;
	Time[28] BestTimes;
	short[12] BestWeights;
	short[8] anonymous_4;
	short[32] MostRings;
	int[6] SkyChase1HighScores;
	int[6] SkyChase2HighScores;
	int[6] IceCapHighScores;
	int[6] SandHillHighScores;
	int HedgehogHammerHighScore1;
	int HedgehogHammerHighScore2;
	int HedgehogHammerHighScore3;
	TwinkleCircuitTimes[6] TwinkleCircuitBestTimes;
	Time[18] BossBestTimes;
	char[17] Emblems;
	char Options;
	char[7] Lives;
	char LastCharacter;
	char Rumble;
	char[1] gap_25b;
	short LastLevel;
	char[2] gap_25e;
	char[64] EventFlags;
	char[64] NPCFlags;
	char[8] gap_2e0;
	AdventureData_t[8] AdventureData;
	char[344] LevelClear;
	char[60] MissionFlags;
	int BlackMarketRings;
	int[10] MetalHighScores;
	Time[10] MetalBestTimes;
	short[10] MetalMostRings;
	char[2] gap_53a;
	int[3] MetalIceCapHighScores;
	int[3] MetalSandHillHighScores;
	TwinkleCircuitTimes MetalTwinkleCircuitBestTimes;
	Time[3] MetalBossBestTimes;
	int MetalEmblems;
}

struct DrawDistance
{
	float Minimum;
	float Maximum;
}

struct RestartData
{
	short Level;
	char Minute;
	char Second;
	char Frame;
	char[3] anonymous_0;
	int CheckpointHit;
	NJS_VECTOR Position;
	Rotation3 Rotation;
}

struct MESFileText
{
	short *field_0;
	const(char) **field_4;
}

struct MESFileHeader
{
	int Count;
	MESFileText *Texts;
}

struct FieldNPCDataYRot
{
	NJS_VECTOR Position;
	short YRot;
	char TextNum;
	char CharacterNum;
}

struct FieldNPCDataXYZRot
{
	NJS_VECTOR Position;
	short XRot;
	short YRot;
	short ZRot;
	char TextNum;
	char CharacterNum;
}

struct FieldNPCList
{
	void *Data;
	int Count;
}

struct MusicInfo
{
	const(char) *Name;
	int Loop;
}

struct SoundTestEntry
{
	const(char) *Name;
	int ID;
}

struct SoundTestCategory
{
	SoundTestEntry *Entries;
	int Count;
}

struct DeathZone
{
	int Characters;
	NJS_OBJECT *Model;
}

struct SkyboxScale
{
	NJS_VECTOR Far, Normal, Near;
}

struct StageLightData
{
	char level;
	char act;
	char index;
	char use_direction;
	NJS_VECTOR direction;
	float specular;
	float multiplier;
	float[3] diffuse;
	float[3] ambient;
}

struct OceanData
{
	NJS_VECTOR Position;
	char TextureIndex;
	char OtherIndexIdk;
	char PlaneCount;
	char PrimitiveCount;
	NJS_POINT2 Offset;
	char VBuffIndex;
	char field_19;
	char field_1A;
	char field_1B;
}

struct CreditsInfo
{
	const(char) **names;
	NJS_TEXLIST **texlists;
	int count;
	const(char) *endimagename;
	NJS_TEXLIST *endtexlist;
	short *coordinates;
}

struct CreditsEntry
{
	char SomeIndex;
	char field_1;
	char field_2;
	char field_3;
	const(char) *Line;
}

struct CreditsList
{
	CreditsEntry *Entries;
	int Count;
}

// Chao

struct ChaoCharacterBond
{
	char a;
	char b;
	int unknown;
}

struct ChaoDNA
{
	char ResetTrigger;
	char[91] field_1;
	char SwimStatGrade1;
	char SwimStatGrade2;
	char FlyStatGrade1;
	char FlyStatGrade2;
	char RunStatGrade1;
	char RunStatGrade2;
	char PowerStatGrade1;
	char PowerStatGrade2;
	char StaminaStatGrade1;
	char StaminaStatGrade2;
	char LuckStatGrade1;
	char LuckStatGrade2;
	char IntelligenceStatGrade1;
	char IntelligenceStatGrade2;
	char UnknownStatGrade1;
	char UnknownStatGrade2;
	char[34] field_4A4;
	char FavoriteFruit1;
	char FavoriteFruit2;
	char[4] field_4C8;
	char Color1;
	char Color2;
	char MonotoneFlag1;
	char MonotoneFlag2;
	char Texture1;
	char Texture2;
	char ShinyFlag1;
	char ShinyFlag2;
	char EggColor1;
	char EggColor2;
	char[6] gap_4D6;
}

struct ChaoDataBase
{
	char[18] gap_0;
	char[7] Name;
	char[7] gap_19;
	char SwimFraction;
	char FlyFraction;
	char RunFraction;
	char PowerFraction;
	char StaminaFraction;
	char LuckyFraction;
	char IntelligenceFraction;
	char UnknownFraction;
	char SwimGrade;
	char FlyGrade;
	char RunGrade;
	char PowerGrade;
	char StaminaGrade;
	char LuckyGrade;
	char IntelligenceGrade;
	char UnknownGrade;
	char SwimLevel;
	char FlyLevel;
	char RunLevel;
	char PowerLevel;
	char StaminaLevel;
	char LuckLevel;
	char IntelligenceLevel;
	char UnknownLevel;
	short SwimStat;
	short FlyStat;
	short RunStat;
	short PowerStat;
	short StaminaStat;
	short LuckStat;
	char IntelligenceStat;
	char UnknownStat;
	char[58] field_46;
	ChaoType Type;
	char Garden;
	short Happiness;
	short field_84;
	short ClockRollovers;
	short field_88;
	short Lifespan;
	short Lifespan2;
	short Reincarnations;
	char[24] field_90;
	float PowerRun;
	float FlySwim;
	float Alignment;
	char[12] gap_B4;
	float EvolutionProgress;
	char[13] gap_C4;
	char EyeType;
	char MouthType;
	char BallType;
	char[1] gap_D4;
	char Headgear;
	char HideFeet;
	char Medal;
	char Color;
	char MonotoneHighlights;
	char Texture;
	char Shiny;
	char EggColor;
	SADXBodyType BodyType;
	char BodyTypeAnimal;
	char[57] field_DF;
	int SA2AnimalBehavior;
	SA2BAnimal SA2BArmType;
	SA2BAnimal SA2BEarType;
	SA2BAnimal SA2BForeheadType;
	SA2BAnimal SA2BHornType;
	SA2BAnimal SA2BLegType;
	SA2BAnimal SA2BTailType;
	SA2BAnimal SA2BWingType;
	SA2BAnimal SA2BFaceType;
	char[8] field_124;
	char Joy;
	char field_12D;
	char UrgeToCry;
	char Fear;
	char field_130;
	char Dizziness;
	char[2] field_132;
	short Sleepiness;
	short Tiredness;
	short Hunger;
	short MateDesire;
	short Boredom;
	char[10] field_13E;
	short Energy;
	char Normal_Curiosity;
	char field_14B;
	char CryBaby_Energetic;
	char Naive_Normal;
	char[2] field_14E;
	char Normal_BigEater;
	char[4] field_151;
	char Normal_Carefree;
	char field_156;
	char FavoriteFruit;
	char[2] field_158;
	char CoughLevel;
	char ColdLevel;
	char RashLevel;
	char RunnyNoseLevel;
	char HiccupsLevel;
	char StomachAcheLevel;
	char[4] field_160;
	short SA2BToys;
	char[6] field_166;
	ChaoCharacterBond[6] SA2BCharacterBonds;
	char[680] field_190;
	ChaoDNA DNA;
	int field_4DC;
	int SADXAnimalBehaviors;
	SADXAnimal ArmType;
	SADXAnimal EarType;
	SADXAnimal EyebrowType;
	SADXAnimal ForeheadType;
	SADXAnimal LegType;
	SADXAnimal TailType;
	SADXAnimal WingType;
	SADXAnimal UnknownType;
	char[16] field_4EC;
	ChaoCharacterBond[6] SADXCharacterBonds;
}

struct ChaoData
{
	ChaoDataBase data;
	char[736] field_520;
}

struct ChaoUnknownB
{
	short field_0;
	short field_2;
	short field_4;
	short field_6;
	float field_8;
	int field_C;
	int field_10;
	int field_14;
	int field_18;
}

struct ChaoUnknown
{
	short field_0;
	short field_2;
	int field_4;
	int field_8;
	int field_C;
	float field_10;
	short field_14;
	short field_16;
	ChaoUnknownB[32] field_18;
}

struct ChaoUnknownE
{
	char[960] pad;
}

struct ChaoUnknownD
{
	short field_0;
	short field_2;
	short field_4;
	short field_6;
	int field_8;
	int field_C;
	int field_10;
	int field_14;
	int field_18;
}

struct ChaoData1
{
	EntityData1 entity;
	char[8] field_40;
	ObjectMaster *ObjectMaster_ptr1;
	char[4] field_4C;
	ObjectMaster *ObjectMaster_ptr2;
	char[12] field_54;
	int field_60;
	char[4] field_64;
	int field_68;
	ChaoDataBase *ChaoDataBase_ptr;
	char[64] field_70;
	int field_B0;
	char[4] field_B4;
	int field_B8;
	char[264] MotionTable;
	ChaoUnknownD[7] unknown_d;
	char[424] field_288;
	int field_430;
	char[16] field_434;
	int field_444;
	char[8] field_448;
	int field_450;
	char[208] field_454;
	int field_524;
	char[160] field_528;
	ChaoUnknownE *unknown_e_1;
	ChaoUnknownE *unknown_e_2;
	char[216] field_5D0;
	short field_6A8;
	char[310] field_6AA;
	char field_7E0;
	char[19] field_7E1;
	ChaoUnknown[5] UnknownArray;
	char UnknownArrayEnd;
	char[922] field_19ED;
	char field_1D87;
}

struct ChaoData2
{
	char[44] field_0;
	int field_2C;
	char[4] gap_30;
	float field_34;
	char[4] gap_38;
	float field_3C;
	char field_40;
	char[1] gap_41;
	short field_42;
	char[4] gap_44;
	int field_48;
	char[20] gap_4C;
	NJS_VECTOR some_vector;
	char[64] gap_6C;
	float field_AC;
	char[4] field_B0;
	float field_B4;
	float field_B8;
	float field_BC;
	float field_C0;
	float field_C4;
	float field_C8;
	float field_CC;
	float field_D0;
	char[407] gap_d4;
	char field_26B;
}

struct ChaoDebugFunction
{
	int Enabled;
	extern (C) void function(ObjectMaster* _this) Function;
	const(char) *Name;
}

struct BlackMarketItem
{
	ChaoItemCategory Category;
	Sint8 Type;
}


struct ChaoTreeSpawn
{
	NJS_VECTOR a;
	NJS_VECTOR b;
	NJS_VECTOR c;
	NJS_VECTOR d;
	NJS_VECTOR e;
	NJS_VECTOR f;
	NJS_VECTOR g;
	NJS_VECTOR h;
	NJS_VECTOR i;
	NJS_VECTOR j;
}

// Model Queue

union PointType
{
	NJS_POINT2COL POINT2COL;
	NJS_POINT3COL POINT3COL;
}

struct QueuedModelNode
{
	QueuedModelNode *Next;
	float Depth;
	Uint8 Flags;
	char BlendMode;
	short TexNum;
	NJS_TEXLIST *TexList;
	NJS_ARGB Color;
	int Control3D;
	int ConstantAndAttr;
	int ConstantOrAttr;
}

struct QueuedModelMotionThing
{
	QueuedModelNode Node;
	int Unknown;
	PointType Points;
	char[48] field_40;
	float FrameNumber;
	NJS_OBJECT *Object;
	NJS_MOTION *Motion;
	NJS_MOTION *MotionMaybe;
	Uint32 Attributes;
	float Scale;
	extern (C) void function(NJS_MODEL_SADX*) DrawCallback;
}

struct QueuedModelTextureMemList
{
	QueuedModelNode Node;
	NJS_MODEL_SADX *Model;
	NJS_MATRIX Transform;
	NJS_TEXTURE_VTX *TexturedVertices;
	int Count;
	int TextureId;
	int Flags;
}

struct QueuedModelAction
{
	QueuedModelNode Node;
	int field_2C;
	NJS_MATRIX Transform;
	float FrameNumber;
	NJS_ACTION Action;
}

struct QueuedModelObject
{
	QueuedModelNode Node;
	NJS_OBJECT *Object;
	NJS_MATRIX Transform;
}

struct QueuedModelActionPtr
{
	QueuedModelNode Node;
	int field_2C;
	NJS_MATRIX Transform;
	NJS_ACTION *Action;
	float FrameNumber;
}

struct QueuedModelLineA
{
	QueuedModelNode Node;
	int Unknown;
	PointType Points;
	NJS_MATRIX Transform;
	Uint32 Attributes;
	Uint32 TextureNum;
}

struct QueuedModelLineB
{
	QueuedModelLineA Base;
	float Pri;
}

struct QueuedModelParticle
{
	QueuedModelNode Node;
	char[36] idk;
}

struct QueuedModelCallback
{
	QueuedModelNode Node;
	int Unknown;
	NJS_MATRIX Transform;
	extern (C) void function(void*) UserFunction;
	void *UserData;
}

struct QueuedModelRect
{
	QueuedModelNode Node;
	int Unknown;
	float Left;
	float Top;
	float Right;
	float Bottom;
	float Depth;
	NJS_COLOR Color;
}

struct QueuedModelSprite
{
	QueuedModelNode Node;
	int Unknown;
	NJS_SPRITE Sprite;
	Uint32 SpriteFlags;
	float SpritePri;
	NJS_MATRIX Transform;
}

struct QueuedModelPointer
{
	QueuedModelNode Node;
	NJS_MODEL_SADX *Model;
	NJS_MATRIX Transform;
}

struct QueuedModel
{
	NJS_MODEL_SADX model;
	NJS_MESHSET_SADX meshset;
}

struct DrawQueueHead
{
	DrawQueueHead *next;
	DrawQueueHead *prev;
}

// Vertex Buffers

struct FVFStruct_A
{
	NJS_VECTOR position;
	Uint32 diffuse;
	float u;
	float v;
}

struct FVFStruct_B
{
	NJS_VECTOR position;
}

struct FVFStruct_C
{
	NJS_VECTOR position;
	NJS_VECTOR normal;
}

struct FVFStruct_D
{
	NJS_VECTOR position;
	float u;
	float v;
}

struct FVFStruct_E
{
	NJS_VECTOR position;
	NJS_VECTOR normal;
	float u;
	float v;
}

struct FVFStruct_F
{
	NJS_VECTOR position;
	Uint32 diffuse;
}

struct FVFStruct_G
{
	NJS_VECTOR position;
	NJS_VECTOR normal;
	Uint32 diffuse;
}

struct FVFStruct_H
{
	NJS_VECTOR position;
	Uint32 diffuse;
	float u;
	float v;
}

struct FVFStruct_I
{
	NJS_VECTOR position;
	NJS_VECTOR normal;
	Uint32 diffuse;
	float u;
	float v;
}

struct FVFStruct_J
{
	float x;
	float y;
	float z;
	float rhw;
	Uint32 diffuse;
}

struct FVFStruct_H_B
{
	NJS_VECTOR position;
	float u;
	float v;
	int diffuse;
}

struct FVFStruct_K
{
	FVFStruct_J base;
	float u;
	float v;
}

struct OceanGarbage
{
	FVFStruct_H_B[4] points;
}

struct struct_v3
{
	int SomeFlag;
	int dword4;
	int ShadowRotationX;
	int ShadowRotationY;
	float Distance;
	NJS_VECTOR njs_vector14;
}

struct Mysterious64Bytes
{
	NJS_VECTOR Position;
	struct_v3 struct_v3_a;
	struct_v3 struct_v3_b;
}

struct ChunkModelThing
{
	NJS_CNK_OBJECT *model;
	NJS_TEXLIST *texlist;
	float scale;
	int what;
}

struct ChunkObjectPointer
{
	NJS_CNK_OBJECT[2] base;
	char[48] field_68;
	ChunkModelThing thing;
	int useTransform;
	NJS_VECTOR position;
	Rotation3 rotation;
}

struct NBChunk
{
	short Type;
	short field_2;
	int Size;
}

struct TitleCardTexture
{
	int Level;
	const(char) *TextureName;
}

struct TitleCardTextureList
{
	int Count;
	TitleCardTexture *List;
}