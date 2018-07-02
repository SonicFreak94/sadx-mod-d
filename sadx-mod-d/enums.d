module enums;

/**
 * SADX Mod Loader.
 * SADX enums.
 */

import ninja.types;

// SADX Enums

T levelact(T)(level, act)
{
	return (level << 8) | act;
}

enum StatusBits
{
	Ground,
	Unknown1,
	Hurt,
	ObjectInteract,
	Unknown2,
	Unknown3,
	Unknown4,
	Unknown5,
	Ball,
	LightDash,
	Attack,
	HoldObject,
	DoNextAction,
	OnPath,
	DisableControl,
	Unknown6
}

enum Status : ushort
{
	Ground = (1 << StatusBits.Ground),
	Unknown1 = (1 << StatusBits.Unknown1),
	Hurt = (1 << StatusBits.Hurt),
	ObjectInteract = (1 << StatusBits.ObjectInteract),
	Unknown2 = (1 << StatusBits.Unknown2),
	Unknown3 = (1 << StatusBits.Unknown3),
	Unknown4 = (1 << StatusBits.Unknown4),
	Unknown5 = (1 << StatusBits.Unknown5),
	Ball = (1 << StatusBits.Ball),
	LightDash = (1 << StatusBits.LightDash),
	Attack = (1 << StatusBits.Attack),
	HoldObject = (1 << StatusBits.HoldObject),
	DoNextAction = (1 << StatusBits.DoNextAction),
	OnPath = (1 << StatusBits.OnPath),
	DisableControl = (1 << StatusBits.DisableControl),
	Unknown6 = (1 << StatusBits.Unknown6)
}

enum PowerupBits
{
	Barrier,
	MagneticBarrier,
	Unknown1,
	Unknown2,
	Unknown3,
	Unknown4,
	Unknown5,
	Unknown6,
	Unknown7,
	Unknown8,
	Unknown9,
	Unknown10,
	Unknown11,
	Unknown12,
	Dead,
	Invincibility
}

enum Powerups : ushort
{
	Barrier = (1 << PowerupBits.Barrier),
	MagneticBarrier = (1 << PowerupBits.MagneticBarrier),
	Unknown1 = (1 << PowerupBits.Unknown1),
	Unknown2 = (1 << PowerupBits.Unknown2),
	Unknown3 = (1 << PowerupBits.Unknown3),
	Unknown4 = (1 << PowerupBits.Unknown4),
	Unknown5 = (1 << PowerupBits.Unknown5),
	Unknown6 = (1 << PowerupBits.Unknown6),
	Unknown7 = (1 << PowerupBits.Unknown7),
	Unknown8 = (1 << PowerupBits.Unknown8),
	Unknown9 = (1 << PowerupBits.Unknown9),
	Unknown10 = (1 << PowerupBits.Unknown10),
	Unknown11 = (1 << PowerupBits.Unknown11),
	Unknown12 = (1 << PowerupBits.Unknown12),
	Dead = (1 << PowerupBits.Dead),
	Invincibility = (1 << PowerupBits.Invincibility)
}

enum UpgradeBits
{
	CrystalRing,
	LightShoes,
	AncientLight,
	JetAnklet,
	RhythmBadge,
	FightingGloves,
	ShovelClaw,
	LongHammer,
	WarriorFeather,
	LaserBlaster,
	JetBooster,
	PowerRod,
	LifeRing,
	SuperSonic = 15
}

enum Upgrades
{
	CrystalRing = (1 << UpgradeBits.CrystalRing),
	LightShoes = (1 << UpgradeBits.LightShoes),
	AncientLight = (1 << UpgradeBits.AncientLight),
	SonicMask = CrystalRing | LightShoes | AncientLight,
	JetAnklet = (1 << UpgradeBits.JetAnklet),
	RhythmBadge = (1 << UpgradeBits.RhythmBadge),
	TailsMask = JetAnklet | RhythmBadge,
	FightingGloves = (1 << UpgradeBits.FightingGloves),
	ShovelClaw = (1 << UpgradeBits.ShovelClaw),
	KnucklesMask = FightingGloves | ShovelClaw,
	LongHammer = (1 << UpgradeBits.LongHammer),
	WarriorFeather = (1 << UpgradeBits.WarriorFeather),
	AmyMask = LongHammer | WarriorFeather,
	LaserBlaster = (1 << UpgradeBits.LaserBlaster),
	JetBooster = (1 << UpgradeBits.JetBooster),
	GammaMask = LaserBlaster | JetBooster,
	PowerRod = (1 << UpgradeBits.PowerRod),
	LifeRing = (1 << UpgradeBits.LifeRing),
	BigMask = PowerRod | LifeRing,
	UpgradesMask = SonicMask | TailsMask | KnucklesMask | AmyMask | GammaMask | BigMask,
	SuperSonic = (1 << UpgradeBits.SuperSonic)
}

enum Characters
{
	Sonic,
	Eggman,
	Tails,
	Knuckles,
	Tikal,
	Amy,
	Gamma,
	Big,
	MetalSonic
}

enum CharacterFlags
{
	Sonic	= (1 << Characters.Sonic),
	Eggman	= (1 << Characters.Eggman),
	Tails	= (1 << Characters.Tails),
	Knuckles	= (1 << Characters.Knuckles),
	Tikal	= (1 << Characters.Tikal),
	Amy	= (1 << Characters.Amy),
	Gamma	= (1 << Characters.Gamma),
	Big	= (1 << Characters.Big)
}

enum LevelIDs
{
	HedgehogHammer,
	EmeraldCoast,
	WindyValley,
	TwinklePark,
	SpeedHighway,
	RedMountain,
	SkyDeck,
	LostWorld,
	IceCap,
	Casinopolis,
	FinalEgg,
	B,
	HotShelter,
	D,
	E,
	Chaos0,
	Chaos2,
	Chaos4,
	Chaos6,
	PerfectChaos,
	EggHornet,
	EggWalker,
	EggViper,
	Zero,
	E101,
	E101R,
	StationSquare,
	EggCarrierOutside = 29,
	EggCarrierInside = 32,
	MysticRuins,
	Past,
	TwinkleCircuit,
	SkyChase1,
	SkyChase2,
	SandHill,
	SSGarden,
	ECGarden,
	MRGarden,
	ChaoRace,
	Invalid
}

enum GameModes
{
	Restart,
	Logo,
	Exit,
	Adventure_ActionStg = 4,
	Adventure_Field,
	Movie = 8,
	Trial,
	Mission,
	CharSel,
	Menu,
	Restart2,
	StartAdventure = 17,
	Adventure_Story,
	StartCredits = 21,
	Credits,
}

enum LevelAndActIDs
{
	HedgehogHammer,
	EmeraldCoast1 = LevelIDs.EmeraldCoast << 8,
	EmeraldCoast2,
	EmeraldCoast3,
	WindyValley1 = LevelIDs.WindyValley << 8,
	WindyValley2,
	WindyValley3,
	TwinklePark1 = LevelIDs.TwinklePark << 8,
	TwinklePark2,
	TwinklePark3,
	SpeedHighway1 = LevelIDs.SpeedHighway << 8,
	SpeedHighway2,
	SpeedHighway3,
	RedMountain1 = LevelIDs.RedMountain << 8,
	RedMountain2,
	RedMountain3,
	SkyDeck1 = LevelIDs.SkyDeck << 8,
	SkyDeck2,
	SkyDeck3,
	LostWorld1 = LevelIDs.LostWorld << 8,
	LostWorld2,
	LostWorld3,
	IceCap1 = LevelIDs.IceCap << 8,
	IceCap2,
	IceCap3,
	IceCap4,
	Casinopolis1 = LevelIDs.Casinopolis << 8,
	Casinopolis2,
	Casinopolis3,
	Casinopolis4,
	FinalEgg1 = LevelIDs.FinalEgg << 8,
	FinalEgg2,
	FinalEgg3,
	HotShelter1 = LevelIDs.HotShelter << 8,
	HotShelter2,
	HotShelter3,
	HotShelter4,
	Chaos0 = LevelIDs.Chaos0 << 8,
	Chaos2 = LevelIDs.Chaos2 << 8,
	Chaos4 = LevelIDs.Chaos4 << 8,
	Chaos6 = LevelIDs.Chaos6 << 8,
	PerfectChaos = LevelIDs.PerfectChaos << 8,
	EggHornet = LevelIDs.EggHornet << 8,
	EggWalker = LevelIDs.EggWalker << 8,
	EggViper = LevelIDs.EggViper << 8,
	Zero = LevelIDs.Zero << 8,
	E101 = LevelIDs.E101 << 8,
	E101R = LevelIDs.E101R << 8,
	StationSquare1 = LevelIDs.StationSquare << 8,
	StationSquare2,
	StationSquare3,
	StationSquare4,
	StationSquare5,
	StationSquare6,
	EggCarrierOutside1 = LevelIDs.EggCarrierOutside << 8,
	EggCarrierOutside2,
	EggCarrierOutside3,
	EggCarrierOutside4,
	EggCarrierOutside5,
	EggCarrierOutside6,
	EggCarrierOutside7,
	EggCarrierInside1 = LevelIDs.EggCarrierInside << 8,
	EggCarrierInside2,
	EggCarrierInside3,
	EggCarrierInside4,
	EggCarrierInside5,
	EggCarrierInside6,
	MysticRuins1 = LevelIDs.MysticRuins << 8,
	MysticRuins2,
	MysticRuins3,
	MysticRuins4,
	Past1 = LevelIDs.Past << 8,
	Past2,
	Past3,
	TwinkleCircuit1 = LevelIDs.TwinkleCircuit << 8,
	TwinkleCircuit2,
	TwinkleCircuit3,
	TwinkleCircuit4,
	TwinkleCircuit5,
	TwinkleCircuit6,
	SkyChase1 = LevelIDs.SkyChase1 << 8,
	SkyChase2 = LevelIDs.SkyChase2 << 8,
	SandHill = LevelIDs.SandHill << 8,
	SSGarden = LevelIDs.SSGarden << 8,
	ECGarden = LevelIDs.ECGarden << 8,
	MRGarden = LevelIDs.MRGarden << 8,
	ChaoRace = LevelIDs.ChaoRace << 8
}

enum Levels2P
{
	WindyValley,
	SpeedHighway,
	SkyDeck,
	IceCap,
	Casinopolis
}

enum ColFlags : Uint32
{
	Solid          = 0x1,
	Water          = 0x2,
	NoFriction     = 0x4,
	NoAccel        = 0x8,
	UseSkyDrawDist = 0x20,
	IncAccel       = 0x80,
	Dig            = 0x100,
	NoClimb        = 0x1000,
	Hurt           = 0x10000,
	Footprints     = 0x100000,
	NoAlphaSortPls = 0x1000000,
	AlphaSortThing = 0x2000000,
	UvManipulation = 0x4000000,
	UseRotation    = 0x10000000,
	Visible        = 0x80000000
}

enum LevelItemAccess_Levels
{
	StationSquare,
	MysticRuins,
	EggCarrier,
	Other
}

enum EventFlags
{
	SonicUnlockedAdventure      = 0x41,
	TailsUnlockedAdventure      = 0x42,
	KnucklesUnlockedAdventure   = 0x43,
	AmyUnlockedAdventure        = 0x44,
	GammaUnlockedAdventure      = 0x45,
	BigUnlockedAdventure        = 0x46,
	SuperSonicUnlockedAdventure = 0x47,
	SonicAdventureComplete      = 0x48,
	TailsAdventureComplete      = 0x49,
	KnucklesAdventureComplete   = 0x4A,
	AmyAdventureComplete        = 0x4B,
	GammaAdventureComplete      = 0x4C,
	BigAdventureComplete        = 0x4D,
	SuperSonicAdventureComplete = 0x4E,
	GoldChaoEgg                 = 0x4F,
	SilverChaoEgg               = 0x50,
	BlackChaoEgg                = 0x51,
	Sonic_HotelOpen             = 0x81,
	Sonic_StationOpen           = 0x82,
	Sonic_CasinoAlwaysOpen      = 0x84,
	Sonic_IceStoneAvailable     = 0x85,
	Sonic_HotelToCasinoOpen     = 0x86,
	Sonic_CasinopolisOpen       = 0x87,
	Sonic_StationToCasinoOpen   = 0x88,
	Sonic_TwinkleParkOpen       = 0x89,
	Sonic_TwinkleCircuitOpen    = 0x8A,
	Sonic_SpeedHighwayOpen      = 0x8C,
	Sonic_LightShoes            = 0x8D,
	Sonic_CrystalRing           = 0x8E,
	Sonic_EggCarrierTransformed = 0x91,
	Sonic_EggCarrierOpen        = 0x92,
	Sonic_EggCarrierSunk        = 0x93,
	Sonic_WindyValleyOpen       = 0x94,
	Sonic_AngelIslandOpen       = 0x96,
	Sonic_IceCapOpen            = 0x97,
	Sonic_RedMountainOpen       = 0x99,
	Sonic_ShrineOpen            = 0x9A,
	Sonic_JungleOpen            = 0x9B,
	Sonic_LostWorldOpen         = 0x9C,
	Sonic_FinalEggFieldOpen     = 0x9D,
	Sonic_AncientLight          = 0x9F,
	Sonic_FinalEggOpen          = 0xA0,
	Sonic_TrainOpen             = 0xA1,
	Sonic_GammaDefeated         = 0xA4,
	Sonic_KnucklesDefeated      = 0xA5,
	Sonic_EmeraldCoastClear     = 0xA6,
	Sonic_WindyValleyClear      = 0xA7,
	Sonic_CasinopolisClear      = 0xA8,
	Sonic_TwinkleParkClear      = 0xA9,
	Sonic_SpeedHighwayClear     = 0xAA,
	Sonic_RedMountainClear      = 0xAB,
	Sonic_IceCapClear           = 0xAC,
	Sonic_SkyDeckClear          = 0xAD,
	Sonic_LostWorldClear        = 0xAE,
	Sonic_FinalEggClear         = 0xAF,
	Sonic_Chaos0Clear           = 0xB0,
	Sonic_Chaos4Clear           = 0xB1,
	Sonic_Chaos6Clear           = 0xB2,
	Sonic_EggHornetClear        = 0xB3,
	Sonic_EggViperClear         = 0xB4,
	Sonic_SkyChaseAct1Clear     = 0xB5,
	Sonic_SkyChaseAct2Clear     = 0xB6,
	Sonic_AdventureClear1       = 0xB7,
	Sonic_AdventureClear2       = 0xB8,
	Sonic_AdventureClear3       = 0xB9,
	Tails_HotelOpen             = 0xC1,
	Tails_CasinopolisOpen       = 0xC5,
	Tails_StationOpen           = 0xCA,
	Tails_JetAnklet             = 0xCD,
	Tails_EggCarrierSunk        = 0xD2,
	Tails_WindyValleyOpen       = 0xD3,
	Tails_IceCapOpen            = 0xD6,
	Tails_RhythmBadge           = 0xDB,
	Tails_TrainOpen             = 0xDC,
	Tails_WindyValleyClear      = 0xE1,
	Tails_CasinopolisClear      = 0xE2,
	Tails_SpeedHighwayClear     = 0xE3,
	Tails_IceCapClear           = 0xE4,
	Tails_SkyDeckClear          = 0xE5,
	Tails_SandHillClear         = 0xE6,
	Tails_Chaos4Clear           = 0xE7,
	Tails_EggWalkerClear        = 0xE8,
	Tails_EggHornetClear        = 0xE9,
	Tails_SkyChaseAct1Clear     = 0xEA,
	Tails_SkyChaseAct2Clear     = 0xEB,
	Tails_EmeraldCoastClear     = 0xEC,
	Tails_RedMountainClear      = 0xED,
	Knuckles_CasinopolisOpen    = 0x103,
	Knuckles_EggCarrierSunk     = 0x10F,
	Knuckles_ShovelClaw         = 0x119,
	Knuckles_FightingGloves     = 0x11A,
	Knuckles_CasinopolisClear   = 0x11F,
	Knuckles_SpeedHighwayClear  = 0x120,
	Knuckles_RedMountainClear   = 0x121,
	Knuckles_LostWorldClear     = 0x122,
	Knuckles_Chaos2Clear        = 0x123,
	Knuckles_Chaos6Clear        = 0x124,
	Knuckles_Chaos4Clear        = 0x125,
	Knuckles_SkyDeckClear       = 0x126,
	Amy_EggCarrierSunk          = 0x14D,
	Amy_WarriorFeather          = 0x152,
	Amy_TwinkleParkClear        = 0x156,
	Amy_HotShelterClear         = 0x157,
	Amy_FinalEggClear           = 0x158,
	Amy_ZeroClear               = 0x159,
	Amy_LongHammer              = 0x15E,
	Gamma_JetBooster            = 0x189,
	Gamma_LaserBlaster          = 0x18A,
	Gamma_EggCarrierSunk        = 0x18C,
	Gamma_WindyValleyOpen       = 0x190,
	Gamma_EmeraldCoastClear     = 0x19B,
	Gamma_WindyValleyClear      = 0x19C,
	Gamma_RedMountainClear      = 0x19D,
	Gamma_HotShelterClear       = 0x19E,
	Gamma_FinalEggClear         = 0x19F,
	Gamma_E101Clear             = 0x1A0,
	Gamma_E101mkIIClear         = 0x1A1,
	Big_EggCarrierSunk          = 0x1CB,
	Big_LifeRing                = 0x1D0,
	Big_PowerRod                = 0x1D1,
	Big_EmeraldCoastClear       = 0x1D5,
	Big_HotShelterClear         = 0x1D6,
	Big_TwinkleParkClear        = 0x1D7,
	Big_IceCapClear             = 0x1D8,
	Big_Chaos6Clear             = 0x1D9
}

enum TimesOfDay
{
	Day,
	Evening,
	Night
}

enum MissionFlagBits
{
	Started,
	Found = 6,
	Complete
}

enum MissionFlags
{
	Started = (1 << MissionFlagBits.Started),
	Found = (1 << MissionFlagBits.Found),
	Complete = (1 << MissionFlagBits.Complete)
}

enum LandTableFlagBits
{
	Animation,
	TextureList,
	TextureName = 3
}

enum LandTableFlags
{
	Animation = (1 << LandTableFlagBits.Animation),
	TextureList = (1 << LandTableFlagBits.TextureList),
	TextureName = (1 << LandTableFlagBits.TextureName)
}

enum NPCTextControl
{
	EventFlag = -7,
	NPCFlag,
	Character,
	Voice,
	SetEventFlag,
	NewGroup,
	End
}

enum ButtonBits
{
	C,
	B,
	A,
	Start,
	Up,
	Down,
	Left,
	Right,
	Z,
	Y,
	X,
	D,
	Up2,
	Down2,
	Left2,
	Right2,
	R,
	L
}

enum Buttons : int
{
	C      = (1 << ButtonBits.C),
	B      = (1 << ButtonBits.B),
	A      = (1 << ButtonBits.A),
	Start  = (1 << ButtonBits.Start),
	Up     = (1 << ButtonBits.Up),
	Down   = (1 << ButtonBits.Down),
	Left   = (1 << ButtonBits.Left),
	Right  = (1 << ButtonBits.Right),
	Z      = (1 << ButtonBits.Z),
	Y      = (1 << ButtonBits.Y),
	X      = (1 << ButtonBits.X),
	D      = (1 << ButtonBits.D),
	Up2    = (1 << ButtonBits.Up2),
	Down2  = (1 << ButtonBits.Down2),
	Left2  = (1 << ButtonBits.Left2),
	Right2 = (1 << ButtonBits.Right2),
	R      = (1 << ButtonBits.R),
	L      = (1 << ButtonBits.L)
}

enum Languages
{
	Japanese,
	English,
	French,
	Spanish,
	German
}

enum PauseOptions
{
	Continue	= 0x01,
	Restart	= 0x02,
	Controls	= 0x04,
	Quit		= 0x08,
	Map		= 0x10,
	Camera		= 0x20,
	Missions	= 0x40,
	Unknown	= 0x80
}

enum MusicIDs
{
	advamy, AmyTutorial = advamy,
	advbig, BigTutorial = advbig,
	adve102, E102Tutorial = adve102,
	advknkls, KnucklesTutorial = advknkls,
	advmiles, TailsTutorial = advmiles,
	advsonic, SonicTutorial = advsonic,
	amy, AmyMySweetPassion = amy,
	big, BigLazyDaysLivinInParadise = big,
	bossall, BossOthers = bossall,
	bosse101, BossE101mkII = bosse101,
	bossevnt, BossEvent = bossevnt,
	bosstrgt, BossESeries = bosstrgt,
	casino1, CasinopolisMainHall = casino1,
	casino2, CasinopolisDilapidatedWay = casino2,
	casino3, CasinopolisSONICPinball = casino3,
	casino4, CasinopolisNiGHTSPinball = casino4,
	chao, ThemeOfChao = chao,
	chaogoal, ChaoRaceGoal = chaogoal,
	chaohall, ChaoRaceEntrance_OLD = chaohall,
	chaorace, ChaoRace = chaorace,
	chaos, BossChaos = chaos,
	chaos_6, BossChaos6 = chaos_6,
	chaos_p1, BossPerfectChaos1 = chaos_p1,
	chaos_p2, BossPerfectChaos2 = chaos_p2,
	charactr, CharacterSelect = charactr,
	circuit, TwinkleCircuit = circuit,
	Continue,
	e102, ThemeOfE102 = e102,
	ecoast1, EmeraldCoastAzureBlueWorld = ecoast1,
	ecoast2, EmeraldCoastWindyAndRipply = ecoast2,
	ecoast3, EmeraldCoastBigFishin = ecoast3,
	egcarer1, EggCarrier = egcarer1,
	egcarer2, EggCarrierTheOcean = egcarer2,
	eggman, ThemeOfDrEggman = eggman,
	eggmbl23, BossEggWalkerViper = eggmbl23,
	eggrobo, BossZERO = eggrobo,
	evtbgm00, EventSadness = evtbgm00,
	evtbgm01, EventStrain = evtbgm01,
	evtbgm02, EventUnbound = evtbgm02,
	evtbgm03, EventGoodbye = evtbgm03,
	evtbgm04, EventThePast = evtbgm04,
	evtbgm05, EventFanfare4DrEggman = evtbgm05,
	finaleg1, FinalEggMechanicalResonance = finaleg1,
	finaleg2, FinalEggCrankTheHeatUp = finaleg2,
	fishget, FishGet = fishget,
	fishing, FishHit = fishing,
	fishmiss, FishMiss = fishmiss,
	hammer, HedgehogHammer = hammer,
	highway1, SpeedHighwaySpeedHighway = highway1,
	highway2, SpeedHighwayGoinDown = highway2,
	highway3, SpeedHighwayAtDawn = highway3,
	hurryup, AmyHurryUp = hurryup,
	icecap1, IcecapSnowyMountain = icecap1,
	icecap2, IcecapLimestoneCave = icecap2,
	icecap3, IcecapSnowboard = icecap3,
	invncibl, Invincibility = invncibl,
	item1, Item = item1,
	jingle_1, JingleA = jingle_1,
	jingle_2, JingleB = jingle_2,
	jingle_3, JingleC = jingle_3,
	jingle_4, JingleD = jingle_4,
	jingle_5, JingleE = jingle_5,
	KNUCKLES, KnucklesUnknownFromME = KNUCKLES,
	lstwrld1, LostWorldTrickyMaze = lstwrld1,
	lstwrld2, LWorldDangerChasedbyRock = lstwrld2,
	lstwrld3, LostWorldLeadingLights = lstwrld3,
	mainthem, OpenYourHeart = mainthem,
	mstcln, MysticRuins = mstcln,
	nights_a,
	nights_k,
	nights_s,
	one_up, Extend = one_up,
	option, Options = option,
	redmntn1, RedMountainMtRedASymbolOfThrill = redmntn1,
	redmntn2, RedMountainRedHotSkull = redmntn2,
	rndclear, RoundClear = rndclear,
	s_square, StationSquare = s_square,
	sandhill, SandHill = sandhill,
	scramble, TornadoScramble = scramble,
	shelter1, HotShelterBadTasteAquarium = shelter1,
	shelter2, HotShelterRedBarrageArea = shelter2,
	skydeck1, SkyDeckSkydeckAGoGo = skydeck1,
	skydeck2, SkyDeckGeneralOffensive = skydeck2,
	sonic, SonicItDoesntMatter = sonic,
	sonic_cd, PalmtreePanic = sonic_cd,
	speedup, SpeedUp = speedup,
	sprsonic, ThemeOfSuperSonic = sprsonic,
	ssracing, SuperSonicRacing = ssracing,
	tails, TailsBelieveInMyself = tails,
	theamy, AmyAppearance = theamy,
	thebig, BigAppearance = thebig,
	thee102, E102Appearance = thee102,
	theknkls, KnucklesAppearance = theknkls,
	themiles, TailsAppearance = themiles,
	thesonic, SonicAppearance = thesonic,
	tical, ThemeOfTikal = tical,
	timer, Timer = timer,
	titl_egg, EggCarrierTransform = titl_egg,
	titl_mr1,
	titl_mr2,
	titl_ss,
	title, MainMenu = title,
	title2, TitleScreen = title2,
	trial, Trial = trial,
	twnklpk1, TwinkleParkTwinklePark = twnklpk1,
	twnklpk2, TwinkleParkPleasureCastle = twnklpk2,
	twnklpk3, TwinkleParkAmyMirrorRoom = twnklpk3,
	wndyvly1, WindyValleyWindyHill = wndyvly1,
	wndyvly2, WindyValleyTornado = wndyvly2,
	wndyvly3, WindyValleyTheAir = wndyvly3,
	MSTART_44, MissionStart = MSTART_44,
	MCLEAR_44, MissionClear = MCLEAR_44,
	chao_k_net_fine, ChaoLevelUp = chao_k_net_fine,
	chao_g_iede, ChaoGoodbye = chao_g_iede,
	chao_r_e, ChaoNaming = chao_r_e,
	c_btl_cv, ChaoRaceEntrance = c_btl_cv,
	chao_r_gate_open, ChaoRaceGateOpen = chao_r_gate_open,
	chao_g_born_h2, ChaoHeroChaosBorn2 = chao_g_born_h2,
	chao_g_born_d2, ChaoDarkChaosBorn2 = chao_g_born_d2,
	chao_g_born_c, ChaoChaosBorn = chao_g_born_c,
	chao_g_born_h, ChaoHeroChaosBorn = chao_g_born_h,
	chao_g_born_d, ChaoDarkChaosBorn = chao_g_born_h,
	chao_g_dead, ChaoDied = chao_g_dead,
	chao_g_dance, ChaoDance = chao_g_dance,
	chao_k_m, ChaoBlackMarket = chao_k_m
}

enum LoadObj : Sint8
{
	Data2 = 0x1,
	Data1 = 0x2,
	UnknownA = 0x4,
	UnknownB = 0x8,
}


// Chao Enums
// From here with slight modifications: http://chao.tehfusion.co.uk/chao-hacking/
// Chao gardens

enum SADXChaoStage : Sint8
{
	None            = -1,
	Race            = 1,
	RaceEntry       = 2,
	ChaoTransporter = 3,
	StationSquare   = 4,
	EggCarrier      = 5,
	MysticRuins     = 6,
	BlackMarket     = 7,
}

enum SA2BChaoStage : Sint8
{
	None            = -1,
	NeutralGarden   = 1,
	HeroGarden      = 2,
	DarkGarden      = 3,
	Race            = 4,
	RaceEntrance    = 5,
	Kindergarten    = 6,
	Lobby           = 7,
	RaceEntrance_2P = 8,
	Stadium         = 9,
	Karate          = 10,
	Karate_2P       = 11,
	Transporter     = 12,
}

// Chao evolution

enum ChaoType : Sint8
{
	Empty          = 0,
	Egg            = 1,
	Child          = 2,
	Good           = 3, // Unobtainable
	Bad            = 4, // Unobtainable
	Neutral_Normal = 5,
	Hero_Normal    = 6,
	Dark_Normal    = 7,
	Neutral_Swim   = 8,
	Hero_Swim      = 9,
	Dark_Swim      = 10,
	Neutral_Fly    = 11,
	Hero_Fly       = 12,
	Dark_Fly       = 13,
	Neutral_Run    = 14,
	Hero_Run       = 15,
	Dark_Run       = 16,
	Neutral_Power  = 17,
	Hero_Power     = 18,
	Dark_Power     = 19,
	Neutral_Chaos  = 20,
	Hero_Chaos     = 21,
	Dark_Chaos     = 22,
	Tails          = 23, // Character chao
	Knuckles       = 24, // Character chao
	Amy            = 25, // Character chao
}

// Chao stats

enum ChaoGrade : Sint8
{
	E = 0,
	D = 1,
	C = 2,
	B = 3,
	A = 4,
	S = 5,
}

// Chao appearance

enum ChaoEmotiball : Sint8
{
	Normal = 0,
	Flame  = 1,
	None   = 2,
}

enum ChaoEyes : Sint8
{
	Normal         = 0,
	Painful        = 1,
	ClosedStraight = 2,
	ClosedHappy    = 3,
	ClosedUp       = 4,
	Tiny           = 5,
	Circles        = 6,
	ClosedDown     = 7,
	Tiny2          = 8, // Identical to "Tiny"
	HalfClosed     = 9,
	Mean           = 10,
	GreenChaos     = 11,
	BlueChaos      = 12,
	YellowChaos    = 13,
}

enum ChaoMedal : Sint8
{
	None       = 0, // Won in SA2B
	Aquamarine = 1, // Won in SA2B
	Topaz      = 2, // Won in SA2B
	Peridot    = 3, // Won in SA2B
	Garnet     = 4, // Won in SA2B
	Onyx       = 5, // Won in SA2B
	Diamond    = 6, // Won in SA2B
	Beginner   = 7, // Won in SA2B
	Challenge  = 8, // Won in SA2B
	Hero       = 9, // Won in SA2B
	Dark       = 10, // Won in SA2B
	Pearl      = 11, // Won in SADX
	Amethyst   = 12, // Won in SADX
	Emerald    = 13, // Won in SADX
	Ruby       = 14, // Won in SADX
	Sapphire   = 15, // Won in SADX
}

enum ChaoMouth : Sint8
{
	None               = 0,
	ToothySmile        = 1,
	Open               = 2,
	ClosedSmile        = 3,
	ClosedFrown        = 4,
	OpenSmile          = 5,
	OpenFrown          = 6,
	ClosedSmile2       = 7, // Identical to "Closed Smile"
	Squiggly           = 8,
	ToothyFrown        = 9,
	ClosedFrown2       = 10, // Identical to "Closed Frown"
	WideOpen           = 11,
	ClosedFrown3       = 12, // Identical to "Closed Frown"
	StraightMoustache  = 13,
	SquigglyMoustache1 = 14,
	SquigglyMoustache2 = 15,
}

enum SADXBodyType : Sint8
{
	Normal  = 0,
	EggChao = 1,
	Omochao = 2,
	None    = 3,
}

enum SA2BBodyType : Sint8
{
	Normal  = 0,
	EggChao = 1,
	Omochao = 2,
	Animal  = 3,
	None    = 5,
}

enum SADXRetailColour : Sint8
{
	Normal            = 0,
	Yellow            = 1,
	White             = 2,
	Brown             = 3,
	Aqua              = 4,
	Pink              = 5,
	Blue              = 6,
	Grey              = 7,
	Green             = 8,
	Red               = 9,
	LightGreen        = 10,
	Purple            = 11,
	Orange            = 12,
	Black             = 13,
	TransparentRed    = 14, // Unobtainable
	TransparentPurple = 15, // Unobtainable
	Invisible         = 16, // Unobtainable
}

enum SADXSteamColour : Sint8
{
	Normal          = 0,
	Yellow          = 1,
	White           = 2,
	Brown           = 3,
	Aqua            = 4,
	Pink            = 5,
	Blue            = 6,
	Grey            = 7,
	Green           = 8,
	Red             = 9,
	LightGreen      = 10,
	Purple          = 11,
	Orange          = 12,
	Black           = 13,
	Invisible       = 14, // Unobtainable
	TransparentGrey = 16, // Unobtainable
}

enum SA2BColour : Sint8
{
	Normal    = 0,
	Yellow    = 1,
	White     = 2,
	Brown     = 3,
	SkyBlue   = 4,
	Pink      = 5,
	Blue      = 6,
	Grey      = 7,
	Green     = 8,
	Red       = 9,
	LimeGreen = 10,
	Purple    = 11,
	Orange    = 12,
	Black     = 13,
}
// Values 15-255 all have various different, unobtainable colours in SA2B. However, there are far too many to list here at this time. Contact me if you happen to need more information about these.

enum SADXEggColour : Sint8
{
	Normal                   = 0,
	Yellow_MonoTone          = 1,
	White_MonoTone           = 2,
	Brown_MonoTone           = 3,
	Aqua_MonoTone            = 4,
	Pink_MonoTone            = 5,
	Blue_MonoTone            = 6,
	Grey_MonoTone            = 7,
	Green_MonoTone           = 8,
	Red_MonoTone             = 9,
	LightGreen_MonoTone      = 10,
	Purple_MonoTone          = 11,
	Orange_MonoTone          = 12,
	Black_MonoTone           = 13,
	Yellow_TwoTone           = 14,
	White_TwoTone            = 15,
	Brown_TwoTone            = 16,
	Aqua_TwoTone             = 17,
	Pink_TwoTone             = 18,
	Blue_TwoTone             = 19,
	Grey_TwoTone             = 20,
	Green_TwoTone            = 21,
	Red_TwoTone              = 22,
	LightGreen_TwoTone       = 23,
	Purple_TwoTone           = 24,
	Orange_TwoTone           = 25,
	Black_TwoTone            = 26,
	NormalShiny              = 27,
	YellowShiny_MonoTone     = 28,
	WhiteShiny_MonoTone      = 29,
	BrownShiny_MonoTone      = 30,
	AquaShiny_MonoTone       = 31,
	PinkShiny_MonoTone       = 32,
	BlueShiny_MonoTone       = 33,
	GreyShiny_MonoTone       = 34,
	GreenShiny_MonoTone      = 35,
	RedShiny_MonoTone        = 36,
	LightGreenShiny_MonoTone = 37,
	PurpleShiny_MonoTone     = 38,
	OrangeShiny_MonoTone     = 39,
	BlackShiny_MonoTone      = 40,
	YellowShiny_TwoTone      = 41,
	WhiteShiny_TwoTone       = 42,
	BrownShiny_TwoTone       = 43,
	AquaShiny_TwoTone        = 44,
	PinkShiny_TwoTone        = 45,
	BlueShiny_TwoTone        = 46,
	GreyShiny_TwoTone        = 47,
	GreenShiny_TwoTone       = 48,
	RedShiny_TwoTone         = 49,
	LightGreenShiny_TwoTone  = 50,
	PurpleShiny_TwoTone      = 51,
	OrangeShiny_TwoTone      = 52,
	BlackShiny_TwoTone       = 53,
	YellowJewel              = 54,
	WhiteJewel               = 55,
	PinkJewel                = 56,
	BlueJewel                = 57,
	GreenJewel               = 58,
	PurpleJewel              = 59,
	AquaJewel                = 60,
	RedJewel                 = 61,
	BlackJewel               = 62,
	LightGreenJewel          = 63,
	OrangeJewel              = 64,
	Pearl                    = 65, // Unobtainable
	Metal1                   = 66, // Unobtainable
	Metal2                   = 67, // Unobtainable
	Glass                    = 68, // Unobtainable
}

enum SA2BEggColour : Sint8
{
	Normal                  = 0,
	Yellow_MonoTone         = 1,
	White_MonoTone          = 2,
	Brown_MonoTone          = 3,
	SkyBlue_MonoTone        = 4,
	Pink_MonoTone           = 5,
	Blue_MonoTone           = 6,
	Grey_MonoTone           = 7,
	Green_MonoTone          = 8,
	Red_MonoTone            = 9,
	LimeGreen_MonoTone      = 10,
	Purple_MonoTone         = 11,
	Orange_MonoTone         = 12,
	Black_MonoTone          = 13,
	Yellow_TwoTone          = 14,
	White_TwoTone           = 15,
	Brown_TwoTone           = 16,
	SkyBlue_TwoTone         = 17,
	Pink_TwoTone            = 18,
	Blue_TwoTone            = 19,
	Grey_TwoTone            = 20,
	Green_TwoTone           = 21,
	Red_TwoTone             = 22,
	LimeGreen_TwoTone       = 23,
	Purple_TwoTone          = 24,
	Orange_TwoTone          = 25,
	Black_TwoTone           = 26,
	NormalShiny             = 27,
	YellowShiny_MonoTone    = 28,
	WhiteShiny_MonoTone     = 29,
	BrownShiny_MonoTone     = 30,
	SkyBlueShiny_MonoTone   = 31,
	PinkShiny_MonoTone      = 32,
	BlueShiny_MonoTone      = 33,
	GreyShiny_MonoTone      = 34,
	GreenShiny_MonoTone     = 35,
	RedShiny_MonoTone       = 36,
	LimeGreenShiny_MonoTone = 37,
	PurpleShiny_MonoTone    = 38,
	OrangeShiny_MonoTone    = 39,
	BlackShiny_MonoTone     = 40,
	YellowShiny_TwoTone     = 41,
	WhiteShiny_TwoTone      = 42,
	BrownShiny_TwoTone      = 43,
	SkyBlueShiny_TwoTone    = 44,
	PinkShiny_TwoTone       = 45,
	BlueShiny_TwoTone       = 46,
	GreyShiny_TwoTone       = 47,
	GreenShiny_TwoTone      = 48,
	RedShiny_TwoTone        = 49,
	LimeGreenShiny_TwoTone  = 50,
	PurpleShiny_TwoTone     = 51,
	OrangeShiny_TwoTone     = 52,
	BlackShiny_TwoTone      = 53,
	GlitchyNormal           = 54, // Unobtainable
}

enum SADXTexture : Sint8
{
	None            = 0,
	YellowJewel     = 1,
	WhiteJewel      = 2,
	PinkJewel       = 3,
	BlueJewel       = 4,
	GreenJewel      = 5,
	PurpleJewel     = 6,
	AquaJewel       = 7,
	RedJewel        = 8,
	BlackJewel      = 9,
	LightGreenJewel = 10,
	OrangeJewel     = 11,
	Pearl           = 12, // Unobtainable
	Metal1          = 13, // Unobtainable
	Metal2          = 14, // Unobtainable
	Glass           = 15, // Unobtainable
	Moon            = 16, // Unobtainable
}
// Values 17-125 all have various different, unobtainable textures. These appear to be random game textures applied to the chao. I have documented all of these in my notes, but there are far too many to list here at this time. Contact me if you happen to need more information about these.

enum SA2BTexture : Sint8
{
	None           = 0,
	YellowJewel    = 1,
	WhiteJewel     = 2,
	PinkJewel      = 3,
	BlueJewel      = 4,
	GreenJewel     = 5,
	PurpleJewel    = 6,
	SkyBlueJewel   = 7,
	RedJewel       = 8,
	BlackJewel     = 9,
	LimeGreenJewel = 10,
	OrangeJewel    = 11,
	Pearl          = 12, // Unobtainable
	Metal1         = 13, // Unobtainable
	Metal2         = 14, // Unobtainable
	Glass          = 15, // Unobtainable
	Moon           = 16, // Unobtainable
}
// Values 17-109 all have various different, unobtainable textures. These appear to be random game textures applied to the chao. I have documented all of these in my notes, but there are far too many to list here at this time. Contact me if you happen to need more information about these.

// Chao personality

enum ChaoFavouriteFruit : Sint8
{
	RoundFruit1    = 0,
	RoundFruit2    = 1,
	TriangleFruit1 = 2,
	TriangleFruit2 = 3,
	SquareFruit1   = 4,
	SquareFruit2   = 5,
	None1          = 6,
	None2          = 7,
}

// Chao learnt abilities

enum ChaoClassroomLessonFlags : Sint32
{
	None          = 0,
	DrawingLevel1 = 1,
	DrawingLevel2 = 1 << 1,
	DrawingLevel3 = 1 << 2,
	DrawingLevel4 = 1 << 3,
	DrawingLevel5 = 1 << 4,
	ShakeDance    = 1 << 8,
	SpinDance     = 1 << 9,
	StepDance     = 1 << 10,
	GoGoDance     = 1 << 11,
	Exercise      = 1 << 12,
	SongLevel1    = 1 << 16,
	SongLevel2    = 1 << 17,
	SongLevel3    = 1 << 18,
	SongLevel4    = 1 << 19,
	SongLevel5    = 1 << 20,
	Bell          = 1 << 24,
	Castanets     = 1 << 25,
	Cymbals       = 1 << 26,
	Drum          = 1 << 27,
	Flute         = 1 << 28,
	Maracas       = 1 << 29,
	Trumpet       = 1 << 30,
	Tambourine    = 1 << 31,
}

enum SADXAnimalFlags : Sint16
{
	None     = 0,
	Seal     = 1,
	Penguin  = 1 << 1,
	Otter    = 1 << 2,
	Peacock  = 1 << 3,
	Swallow  = 1 << 4,
	Parrot   = 1 << 5,
	Deer     = 1 << 6,
	Rabbit   = 1 << 7,
	Kangaroo = 1 << 8,
	Gorilla  = 1 << 9,
	Lion     = 1 << 10,
	Elephant = 1 << 11,
	Mole     = 1 << 12,
	Koala    = 1 << 13,
	Skunk    = 1 << 14,
}

enum SA2BAnimalFlags : Uint32
{
	None        = 0,
	Penguin     = 1,
	Seal        = 1 << 1,
	Otter       = 1 << 2,
	Rabbit      = 1 << 3,
	Cheetah     = 1 << 4,
	Warthog     = 1 << 5,
	Bear        = 1 << 6,
	Tiger       = 1 << 7,
	Gorilla     = 1 << 8,
	Peacock     = 1 << 9,
	Parrot      = 1 << 10,
	Condor      = 1 << 11,
	Skunk       = 1 << 12,
	Sheep       = 1 << 13,
	Raccoon     = 1 << 14,
	HalfFish    = 1 << 15,
	SkeletonDog = 1 << 16,
	Bat         = 1 << 17,
	Dragon      = 1 << 18,
	Unicorn     = 1 << 19,
	Phoenix     = 1 << 20,
}

enum ChaoToyFlags : Sint16
{
	None        = 0,
	Rattle      = 1,
	Car         = 1 << 1,
	PictureBook = 1 << 2,
	SonicDoll   = 1 << 4,
	Broomstick  = 1 << 5,
	Unknown     = 1 << 6, // (glitch toy)
	PogoStick   = 1 << 7,
	Crayons     = 1 << 8,
	BubbleWand  = 1 << 9,
	Shovel      = 1 << 10,
	WateringCan = 1 << 11,
}

// Garden items

enum ChaoItemCategory : Sint8
{
	Egg       = 1,
	Fruit     = 3,
	Seed      = 7, // SA2B only
	Hat       = 9,
	MenuTheme = 16, // SA2B only
}

enum SADXAnimal : Sint8
{
	None     = -1,
	Seal     = 0,
	Penguin  = 1,
	Otter    = 2,
	Peacock  = 3,
	Swallow  = 4,
	Parrot   = 5,
	Deer     = 6,
	Rabbit   = 7,
	Kangaroo = 8,
	Gorilla  = 9,
	Lion     = 10,
	Elephant = 11,
	Mole     = 12,
	Koala    = 13,
	Skunk    = 14,
}

enum SA2BAnimal : Sint8
{
	None             = -1,
	Penguin          = 0,
	Seal             = 1,
	Otter            = 2,
	Rabbit           = 3,
	Cheetah          = 4,
	Warthog          = 5,
	Bear             = 6,
	Tiger            = 7,
	Gorilla          = 8,
	Peacock          = 9,
	Parrot           = 10,
	Condor           = 11,
	Skunk            = 12,
	Sheep            = 13,
	Raccoon          = 14,
	HalfFish         = 15,
	SkeletonDog      = 16,
	Bat              = 17,
	Dragon           = 18,
	Unicorn          = 19,
	Phoenix          = 20,
	YellowChaosDrive = 21,
	GreenChaosDrive  = 22,
	RedChaosDrive    = 23,
	PurpleChaosDrive = 24,
}

enum SADXFruit : Sint8
{
	None            = -1,
	RegularFruit    = 24, // The standard garden fruit of SADX
	StrongFruit     = 3, // Comes from SA2B
	TastyFruit      = 4, // Comes from SA2B
	HeroFruit       = 5,
	DarkFruit       = 6,
	RoundFruit      = 7,
	TriangularFruit = 8,
	CubicleFruit    = 9,
	HeartFruit      = 10,
	ChaoFruit       = 11,
	Mushroom        = 20,
	MushroomAlt     = 21, // Gives 2x the bonus of "Mushroom"
	OrangeFruit     = 13, // Comes from TCG
	BlueFruit       = 14, // Comes from TCG
	PinkFruit       = 15, // Comes from TCG
	GreenFruit      = 16, // Comes from TCG
	PurpleFruit     = 17, // Comes from TCG
	YellowFruit     = 18, // Comes from TCG
	RedFruit        = 19, // Comes from TCG
	SmartFruit      = 12, // Unobtainable
}

enum SA2BFruit : Sint8
{
	None            = -1,
	ChaoGardenFruit = 0,
	HeroGardenFruit = 1,
	DarkGardenFruit = 2,
	StrongFruit     = 3,
	TastyFruit      = 4,
	HeroFruit       = 5,
	DarkFruit       = 6,
	RoundFruit      = 7,
	TriangleFruit   = 8,
	SquareFruit     = 9,
	HeartFruit      = 10,
	ChaoFruit       = 11,
	Mushroom        = 20,
	MushroomAlt     = 21, // Gives 2x the bonus of "Mushroom"
	OrangeFruit     = 13, // Comes from TCG
	BlueFruit       = 14, // Comes from TCG
	PinkFruit       = 15, // Comes from TCG
	GreenFruit      = 16, // Comes from TCG
	PurpleFruit     = 17, // Comes from TCG
	YellowFruit     = 18, // Comes from TCG
	RedFruit        = 19, // Comes from TCG
	SmartFruit      = 12, // Unobtainable
	MintCandy       = 22, // Unobtainable
	Grapes          = 23, // Unobtainable
}

enum SADXHat : Sint8
{
	None                              = 0,
	Pumpkin                           = 1,
	Skull                             = 2,
	Apple                             = 3,
	Bucket                            = 4,
	EmptyCan                          = 5,
	CardboardBox                      = 6,
	FlowerPot                         = 7,
	PaperBag                          = 8,
	Pan                               = 9,
	Stump                             = 10,
	Watermelon                        = 11,
	RedWoolBeanie                     = 12,
	BlueWoolBeanie                    = 13,
	BlackWoolBeanie                   = 14,
	Pacifier                          = 15,
	NormalEggShell                    = 16,
	Yellow_MonoTone_EggShell          = 17,
	White_MonoTone_EggShell           = 18,
	Brown_MonoTone_EggShell           = 19,
	Aqua_MonoTone_EggShell            = 20,
	Pink_MonoTone_EggShell            = 21,
	Blue_MonoTone_EggShell            = 22,
	Grey_MonoTone_EggShell            = 23,
	Green_MonoTone_EggShell           = 24,
	Red_MonoTone_EggShell             = 25,
	LightGreen_MonoTone_EggShell      = 26,
	Purple_MonoTone_EggShell          = 27,
	Orange_MonoTone_EggShell          = 28,
	Black_MonoTone_EggShell           = 29,
	Yellow_TwoTone_EggShell           = 30,
	White_TwoTone_EggShell            = 31,
	Brown_TwoTone_EggShell            = 32,
	Aqua_TwoTone_EggShell             = 33,
	Pink_TwoTone_EggShell             = 34,
	Blue_TwoTone_EggShell             = 35,
	Grey_TwoTone_EggShell             = 36,
	Green_TwoTone_EggShell            = 37,
	Red_TwoTone_EggShell              = 38,
	LightGreen_TwoTone_EggShell       = 39,
	Purple_TwoTone_EggShell           = 40,
	Orange_TwoTone_EggShell           = 41,
	Black_TwoTone_EggShell            = 42,
	NormalShinyEggShell               = 43,
	YellowShiny_MonoTone_EggShell     = 44,
	WhiteShiny_MonoTone_EggShell      = 45,
	BrownShiny_MonoTone_EggShell      = 46,
	AquaShiny_MonoTone_EggShell       = 47,
	PinkShiny_MonoTone_EggShell       = 48,
	BlueShiny_MonoTone_EggShell       = 49,
	GreyShiny_MonoTone_EggShell       = 50,
	GreenShiny_MonoTone_EggShell      = 51,
	RedShiny_MonoTone_EggShell        = 52,
	LightGreenShiny_MonoTone_EggShell = 53,
	PurpleShiny_MonoTone_EggShell     = 54,
	OrangeShiny_MonoTone_EggShell     = 55,
	BlackShiny_MonoTone_EggShell      = 56,
	YellowShiny_TwoTone_EggShell      = 57,
	WhiteShiny_TwoTone_EggShell       = 58,
	BrownShiny_TwoTone_EggShell       = 59,
	AquaShiny_TwoTone_EggShell        = 60,
	PinkShiny_TwoTone_EggShell        = 61,
	BlueShiny_TwoTone_EggShell        = 62,
	GreyShiny_TwoTone_EggShell        = 63,
	GreenShiny_TwoTone_EggShell       = 64,
	RedShiny_TwoTone_EggShell         = 65,
	LightGreenShiny_TwoTone_EggShell  = 66,
	PurpleShiny_TwoTone_EggShell      = 67,
	OrangeShiny_TwoTone_EggShell      = 68,
	BlackShiny_TwoTone_EggShell       = 69,
	YellowJewelEggShell               = 70,
	WhiteJewelEggShell                = 71,
	PinkJewelEggShell                 = 72,
	BlueJewelEggShell                 = 73,
	GreenJewelEggShell                = 74,
	PurpleJewelEggShell               = 75,
	AquaJewelEggShell                 = 76,
	RedJewelEggShell                  = 77,
	BlackJewelEggShell                = 78,
	LightGreenJewelEggShell           = 79,
	OrangeJewelEggShell               = 80,
	PearlEggShell                     = 81, // Unobtainable
	Metal1EggShell                    = 82, // Unobtainable
	Metal2EggShell                    = 83, // Unobtainable
	GlassEggShell                     = 84, // Unobtainable
}

enum SA2BHat : Sint8
{
	None                             = 0,
	Pumpkin                          = 1,
	Skull                            = 2,
	Apple                            = 3,
	Bucket                           = 4,
	EmptyCan                         = 5,
	CardboardBox                     = 6,
	FlowerPot                        = 7,
	PaperBag                         = 8,
	Pan                              = 9,
	Stump                            = 10,
	Watermelon                       = 11,
	RedWoolBeanie                    = 12,
	BlueWoolBeanie                   = 13,
	BlackWoolBeanie                  = 14,
	Pacifier                         = 15,
	NormalEggShell                   = 16,
	Yellow_MonoTone_EggShell         = 17,
	White_MonoTone_EggShell          = 18,
	Brown_MonoTone_EggShell          = 19,
	SkyBlue_MonoTone_EggShell        = 20,
	Pink_MonoTone_EggShell           = 21,
	Blue_MonoTone_EggShell           = 22,
	Grey_MonoTone_EggShell           = 23,
	Green_MonoTone_EggShell          = 24,
	Red_MonoTone_EggShell            = 25,
	LimeGreen_MonoTone_EggShell      = 26,
	Purple_MonoTone_EggShell         = 27,
	Orange_MonoTone_EggShell         = 28,
	Black_MonoTone_EggShell          = 29,
	Yellow_TwoTone_EggShell          = 30,
	White_TwoTone_EggShell           = 31,
	Brown_TwoTone_EggShell           = 32,
	SkyBlue_TwoTone_EggShell         = 33,
	Pink_TwoTone_EggShell            = 34,
	Blue_TwoTone_EggShell            = 35,
	Grey_TwoTone_EggShell            = 36,
	Green_TwoTone_EggShell           = 37,
	Red_TwoTone_EggShell             = 38,
	LimeGreen_TwoTone_EggShell       = 39,
	Purple_TwoTone_EggShell          = 40,
	Orange_TwoTone_EggShell          = 41,
	Black_TwoTone_EggShell           = 42,
	NormalShinyEggShell              = 43,
	YellowShiny_MonoTone_EggShell    = 44,
	WhiteShiny_MonoTone_EggShell     = 45,
	BrownShiny_MonoTone_EggShell     = 46,
	SkyBlueShiny_MonoTone_EggShell   = 47,
	PinkShiny_MonoTone_EggShell      = 48,
	BlueShiny_MonoTone_EggShell      = 49,
	GreyShiny_MonoTone_EggShell      = 50,
	GreenShiny_MonoTone_EggShell     = 51,
	RedShiny_MonoTone_EggShell       = 52,
	LimeGreenShiny_MonoTone_EggShell = 53,
	PurpleShiny_MonoTone_EggShell    = 54,
	OrangeShiny_MonoTone_EggShell    = 55,
	BlackShiny_MonoTone_EggShell     = 56,
	YellowShiny_TwoTone_EggShell     = 57,
	WhiteShiny_TwoTone_EggShell      = 58,
	BrownShiny_TwoTone_EggShell      = 59,
	SkyBlueShiny_TwoTone_EggShell    = 60,
	PinkShiny_TwoTone_EggShell       = 61,
	BlueShiny_TwoTone_EggShell       = 62,
	GreyShiny_TwoTone_EggShell       = 63,
	GreenShiny_TwoTone_EggShell      = 64,
	RedShiny_TwoTone_EggShell        = 65,
	LimeGreenShiny_TwoTone_EggShell  = 66,
	PurpleShiny_TwoTone_EggShell     = 67,
	OrangeShiny_TwoTone_EggShell     = 68,
	BlackShiny_TwoTone_EggShell      = 69,
	GlitchyNormalEggShell            = 70,
}

enum ChaoSeed : Sint8
{
	None = -1,
	StrongSeed = 0,
	TastySeed = 1,
	HeroSeed = 2,
	DarkTheme = 3,
	RoundSeed = 4,
	TriangleTheme = 5,
	SquareSeed = 6,
}

enum ChaoStatIndex
{
	Swim         = 0x0,
	Fly          = 0x1,
	Run          = 0x2,
	Power        = 0x3,
	Stamina      = 0x4,
	Luck         = 0x5,
	Intelligence = 0x6,
	Unknown      = 0x7,
}

enum Theme : Sint8
{
	Omochao = 0,
	Amy = 1,
	Maria = 2,
}

// Draw Queue

enum QueuedModelType : byte
{
	Zero           = 0x0,
	BasicModel     = 0x1,
	Sprite2D       = 0x2,
	Sprite3D       = 0x3,
	Line3D         = 0x4,
	_3DLinesMaybe   = 0x5,
	_2DLinesMaybe   = 0x6,
	_3DTriFanThing  = 0x7,
	ActionPtr      = 0x8,
	Rect           = 0x9,
	Object_        = 0xA,
	Action         = 0xB,
	Callback       = 0xC,
	TextureMemList = 0xD,
	Line2D         = 0xE,
	MotionThing    = 0xF,
}

enum QueuedModelFlags
{
	ZTestWrite = 0x10,
	FogEnabled = 0x20,
	Unknown_02 = 0x40,
	Unknown_03 = 0x80,
}

enum QueuedModelFlagsB : byte
{
	EnableZWrite     = 0x1,
	NoColor          = 0x2,
	SomeTextureThing = 0x4,
	Unknown_3        = 0x8,
	AlwaysShow       = 0x10,
}

enum RenderFlags : int
{
	EnvironmentMap   = 0x1,
	ConstantMaterial = 0x2,
	OffsetMaterial   = 0x4,
	Unknown_8        = 0x8,
	Unknown_10       = 0x10,
}
