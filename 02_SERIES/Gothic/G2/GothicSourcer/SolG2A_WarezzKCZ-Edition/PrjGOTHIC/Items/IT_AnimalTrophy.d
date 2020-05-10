
const int VALUE_BCKOPF = 50;
const int VALUE_MEATBUGFLESH = 10;
const int VALUE_SHEEPFUR = 10;
const int VALUE_WOLFFUR = 20;
const int VALUE_BUGMANDIBLES = 15;
const int VALUE_CLAW = 15;
const int VALUE_LURKERCLAW = 15;
const int VALUE_TEETH = 15;
const int VALUE_WING = 20;
const int VALUE_REPTILESKIN = 25;
const int VALUE_WARGFUR = 35;
const int VALUE_DRGSNAPPERHORN = 100;
const int VALUE_CRAWLERPLATE = 50;
const int VALUE_SHADOWFUR = 250;
const int VALUE_SHARKSKIN = 200;
const int VALUE_TROLLFUR = 300;
const int VALUE_WARANFIRETONGUE = 300;
const int VALUE_SHADOWHORN = 300;
const int VALUE_SHARKTEETH = 300;
const int VALUE_TROLLBLACKFUR = 350;
const int VALUE_GOBLINBONE = 10;
const int VALUE_SKELETONBONE = 10;
const int VALUE_DEMONHEART = 300;
const int VALUE_STONEGOLEMHEART = 300;
const int VALUE_FIREGOLEMHEART = 300;
const int VALUE_ICEGOLEMHEART = 300;
const int VALUE_ICEDRAGONHEART = 400;
const int VALUE_FIREDRAGONHEART = 400;
const int VALUE_SWAMPDRAGONHEART = 400;
const int VALUE_ROCKDRAGONHEART = 400;
const int VALUE_DRAGONBLOOD = 200;
const int VALUE_DRAGONSCALE = 200;
const int VALUE_KEILERFUR = 25;

instance ITAT_ADDON_BCKOPF(C_ITEM)
{
	name = "Mantis' head";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BCKOPF;
	visual = "ItAt_Blattcrawler_01.3DS";
	material = MAT_LEATHER;
	description = "A head of a mantis";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_MEATBUGFLESH(C_ITEM)
{
	name = "Bug meat";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEATBUGFLESH;
	visual = "ItAt_Meatbugflesh.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_meatbugflesh;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_meatbugflesh()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,3);
};


instance ITAT_SHEEPFUR(C_ITEM)
{
	name = "Sheep skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHEEPFUR;
	visual = "ItAt_SheepFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WOLFFUR(C_ITEM)
{
	name = "Wolf skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WOLFFUR;
	visual = "ItAt_WolfFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_BUGMANDIBLES(C_ITEM)
{
	name = "Field raider mandibles";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BUGMANDIBLES;
	visual = "ItAt_BugMandibles.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CLAW(C_ITEM)
{
	name = "Claws";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CLAW;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_LURKERCLAW(C_ITEM)
{
	name = "Lurker claw";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LURKERCLAW;
	visual = "ItAt_LurkerClaw.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TEETH(C_ITEM)
{
	name = "Teeth";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TEETH;
	visual = "ItAt_Teeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WING(C_ITEM)
{
	name = "Bloodfly wings";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WING;
	visual = "ItAt_Wing.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_LURKERSKIN(C_ITEM)
{
	name = "Reptile skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_REPTILESKIN;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WARGFUR(C_ITEM)
{
	name = "Warg skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WARGFUR;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ADDON_KEILERFUR(C_ITEM)
{
	name = "Boar skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_KEILERFUR;
	visual = "ItAt_WargFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRGSNAPPERHORN(C_ITEM)
{
	name = "Dragonsnapper's horn";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DRGSNAPPERHORN;
	visual = "ItAt_DrgSnapperHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_CRAWLERPLATE(C_ITEM)
{
	name = "Minecrawler plates";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERPLATE;
	visual = "ItAt_CrawlerPlate.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHADOWFUR(C_ITEM)
{
	name = "Hide of a shadowbeast";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWFUR;
	visual = "ItAt_ShadowFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHARKSKIN(C_ITEM)
{
	name = "Swampshark skin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHARKSKIN;
	visual = "ItAt_SharkSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLFUR(C_ITEM)
{
	name = "Troll hide";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLFUR;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TROLLBLACKFUR(C_ITEM)
{
	name = "Black troll hide";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLBLACKFUR;
	visual = "ItAt_TrollFur.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_WARANFIRETONGUE(C_ITEM)
{
	name = "Tongue of fire lizard";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WARANFIRETONGUE;
	visual = "ItAt_WaranFiretongue.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHADOWHORN(C_ITEM)
{
	name = "Shadowbeast's horn";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHADOWHORN;
	visual = "ItAt_ShadowHorn.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SHARKTEETH(C_ITEM)
{
	name = "Teeth of a swampshark";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SHARKTEETH;
	visual = "ItAt_SharkTeeth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_STONEGOLEMHEART(C_ITEM)
{
	name = "Heart of a stone golem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_STONEGOLEMHEART;
	visual = "ItAt_StoneGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_FIREGOLEMHEART(C_ITEM)
{
	name = "Heart of a fire golem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_FIREGOLEMHEART;
	visual = "ItAt_FireGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ICEGOLEMHEART(C_ITEM)
{
	name = "Heart of an ice golem";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ICEGOLEMHEART;
	visual = "ItAt_IceGolemHeart.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_GOBLINBONE(C_ITEM)
{
	name = "Goblin's bone";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOBLINBONE;
	visual = "ItAt_GoblinBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SKELETONBONE(C_ITEM)
{
	name = "Skeleton's bone";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SKELETONBONE;
	visual = "ItAt_SkeletonBone.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DEMONHEART(C_ITEM)
{
	name = "Heart of a demon";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DEMONHEART;
	visual = "ItAt_DemonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ICEDRAGONHEART(C_ITEM)
{
	name = "Heart of an ice dragon";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ICEDRAGONHEART;
	visual = "ItAt_IcedragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_ROCKDRAGONHEART(C_ITEM)
{
	name = "Heart of a stone dragon";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_ROCKDRAGONHEART;
	visual = "ItAt_RockdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_SWAMPDRAGONHEART(C_ITEM)
{
	name = "Heart of a swamp dragon";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SWAMPDRAGONHEART;
	visual = "ItAt_SwampdragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_FIREDRAGONHEART(C_ITEM)
{
	name = "Heart of a fire dragon";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_FIREDRAGONHEART;
	visual = "ItAt_FiredragonHeart.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRAGONBLOOD(C_ITEM)
{
	name = "Dragon's blood";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_DRAGONBLOOD;
	visual = "ItAt_DragonBlood.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITAT_DRAGONSCALE(C_ITEM)
{
	name = "Dragon's scales";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DRAGONSCALE;
	visual = "ItAt_DragonScale.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

