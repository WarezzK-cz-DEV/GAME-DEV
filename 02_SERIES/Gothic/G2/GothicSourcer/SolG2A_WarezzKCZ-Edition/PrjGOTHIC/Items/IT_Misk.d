
const int VALUE_SWORDBLADE = 50;
const int VALUE_SWORDBLADEHOT = 50;
const int VALUE_SWORDRAWHOT = 50;
const int VALUE_SWORDRAW = 50;
const int VALUE_BRUSH = 3;
const int VALUE_FLASK = 10;
const int VALUE_STOMPER = 3;
const int VALUE_PAN = 20;
const int VALUE_SAW = 90;
const int VALUE_BROOM = 10;
const int VALUE_RAKE = 10;
const int VALUE_HAMMER = 90;
const int VALUE_SCOOP = 13;
const int VALUE_NUGGET = 300;
const int VALUE_JOINT = 30;
const int VALUE_ALARMHORN = 10;
const int VALUE_LUTE = 150;
const int VALUE_GOLD = 1;
const int VALUE_RUNEBLANK = 100;
const int VALUE_SULFUR = 20;
const int VALUE_QUARTZ = 20;
const int VALUE_PITCH = 20;
const int VALUE_ROCKCRYSTAL = 30;
const int VALUE_AQUAMARINE = 100;
const int VALUE_HOLYWATER = 20;
const int VALUE_COAL = 15;
const int VALUE_DARKPEARL = 1100;
const int VALUE_ITMI_APFELTABAK = 10;
const int VALUE_ITMI_PILZTABAK = 10;
const int VALUE_ITMI_SUMPFTABAK = 10;
const int VALUE_ITMI_DOPPELTABAK = 10;
const int VALUE_ITMI_HONIGTABAK = 10;
const int VALUE_SILVERRING = 120;
const int VALUE_SILVERNECKLACE = 200;
const int VALUE_SILVERCANDLEHOLDER = 50;
const int VALUE_SILVERPLATE = 100;
const int VALUE_SILVERCUP = 100;
const int VALUE_SILVERCHALICE = 250;
const int VALUE_GOLDPLATE = 200;
const int VALUE_GOLDRING = 250;
const int VALUE_GOLDNECKLACE = 300;
const int VALUE_GOLDCANDLEHOLDER = 120;
const int VALUE_GOLDCUP = 350;
const int VALUE_BLOODCUP = 200;
const int VALUE_GOLDCHALICE = 500;
const int VALUE_GOLDCHEST = 750;
const int VALUE_JEWELERYCHEST = 1000;
const int VALUE_INNOSSTATUE = 100;
const int VALUE_SEXTANT = 1500;

instance ITMI_STOMPER(C_ITEM)
{
	name = "Wooden stomper";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STOMPER;
	visual = "ItMi_Stomper.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_RUNEBLANK(C_ITEM)
{
	name = "Blank rune";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RUNEBLANK;
	visual = "ItMi_RuneBlank.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PLIERS(C_ITEM)
{
	name = "Tongs";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RUNEBLANK;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PLIERS_ARMR(C_ITEM)
{
	name = "Tongs";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Pliers_Armr.3DS";
	material = MAT_METAL;
	description = "Tongs with plate";
};

instance ITMI_PLIERS_SMLT(C_ITEM)
{
	name = "Tongs";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Pliers_Smlt.3DS";
	material = MAT_METAL;
	description = "Tongs with smelted iron";
};

instance ITMI_PLIERS_SMLT_2(C_ITEM)
{
	name = "Tongs";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Pliers_Smlt_2.3DS";
	material = MAT_METAL;
	description = "Tongs with smelted ore";
};

instance ITMI_FLASK(C_ITEM)
{
	name = "Lab water bottle";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_FLASK;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_HAMMER(C_ITEM)
{
	name = "Hammer";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HAMMER;
	visual = "ItMi_Hammer.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_TEXTILE(C_ITEM)
{
	name = "Textile";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 30;
	visual = "ItMi_Textile_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 80;
	inv_rotz = 10;
	inv_rotx = 140;
};

instance ITMI_LEATHER(C_ITEM)
{
	name = "Leather";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 65;
	visual = "ItMi_Leather_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 105;
	inv_rotz = 145;
	inv_rotx = 40;
};

instance ITMI_WOODBAR(C_ITEM)
{
	name = "Wooden bar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 8;
	visual = "ItMi_WoodBar_01.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 105;
	inv_rotz = 145;
	inv_rotx = 40;
};

instance ITMI_WOODBAR_BIG(C_ITEM)
{
	name = "Wooden billet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 12;
	visual = "ItMi_WoodBar_02.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 105;
	inv_rotz = 145;
	inv_rotx = 40;
};

instance ITMI_BRANCH(C_ITEM)
{
	name = "Branch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ITMI_BRANCH.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_SCOOP(C_ITEM)
{
	name = "Spoon";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SCOOP;
	visual = "ItMi_Scoop.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PAN(C_ITEM)
{
	name = "Pan";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PAN;
	visual = "ItMi_Pan.3DS";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PANFULL(C_ITEM)
{
	name = "Pan";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PAN;
	visual = "ItMi_PanFull.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SAW(C_ITEM)
{
	name = "Saw";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SAW;
	visual = "ItMi_Saw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDRAW(C_ITEM)
{
	name = "Raw steel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDRAW;
	visual = "ItMiSwordraw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDRAWHOT(C_ITEM)
{
	name = "Red hot steel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDRAWHOT;
	visual = "ItMiSwordrawhot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDBLADEHOT(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMiSwordbladehot.3DS";
	material = MAT_METAL;
	description = name;
};

instance ITMISWORDBLADE(C_ITEM)
{
	name = "Blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMiSwordblade.3DS";
	material = MAT_METAL;
	description = name;
};

instance ITMI_1H_SPECIAL_01_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_01_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore longsword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_01_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_01_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore longsword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_01_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_01_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore two-hander'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_01_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_01_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore two-hander'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_02_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_02_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore bastard sword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_02_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_02_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore bastard sword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_02_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_02_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Heavy ore two-hander'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_02_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_02_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Heavy ore two-hander'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_03_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_03_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Orcish ore battle sword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_03_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_03_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Orcish ore battle sword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_03_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_03_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Heavy orcish ore battle sword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_03_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_03_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Heavy orcish ore battle sword'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_04_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_04_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore Dragonslayer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_SPECIAL_04_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_Special_04_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Ore Dragonslayer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_04_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_04_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Large ore Dragonslayer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_SPECIAL_04_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_Special_04_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Large ore Dragonslayer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_DEATHBRINGER_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_DEATHBRINGER_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Deathbringer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1H_DEATHBRINGER_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1H_DEATHBRINGER_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Deathbringer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_DEATHBRINGER_BLADE(C_ITEM)
{
	name = "Red hot blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_DEATHBRINGER_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Heavy Deathbringer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2H_DEATHBRINGER_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2H_DEATHBRINGER_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge 'Heavy Deathbringer'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_BROOM(C_ITEM)
{
	name = "Broom";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BROOM;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	scemename = "BROOM";
	on_state[0] = use_broom;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_broom()
{
	if(Npc_IsPlayer(self) && (Wld_GetPlayerPortalGuild() == GIL_NOV) && (MIS_PARLANFEGEN == LOG_RUNNING))
	{
		b_say(self,self,"$NOSWEEPING");
		Print(PRINT_NOSWEEPING);
	};
};


instance ITMI_LUTE(C_ITEM)
{
	name = "Lute";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LUTE;
	visual = "ItMi_Lute.3DS";
	material = MAT_WOOD;
	scemename = "LUTE";
	on_state[0] = use_lute;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_lute()
{
};


instance ITMI_BRUSH(C_ITEM)
{
	name = "Brush";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BRUSH;
	visual = "ItMi_Brush.3ds";
	material = MAT_WOOD;
	scemename = "BRUSH";
	on_state[0] = use_brush;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_brush()
{
};


instance ITMI_LWORK_01(C_ITEM)
{
	name = "";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_LWORK_01.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_JOINT(C_ITEM)
{
	name = "A stalk of swampweed";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JOINT;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemename = "JOINT";
	on_state[0] = use_joint;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


func void use_joint()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITMI_PACKET(C_ITEM)
{
	name = "Packet";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
};


func void usepacket()
{
};


instance ITMI_POCKET(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE | ITEM_MULTI;
	flags = 0;
	value = 10;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usepocket;
	description = name;
	text[2] = "A narrow bag,";
	text[3] = "not very heavy.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usepocket()
{
	CreateInvItems(hero,itmi_gold,10);
	Print(PRINT_FOUNDGOLD10);
	Snd_Play("Geldbeutel");
};


instance ITMI_NUGGET(C_ITEM)
{
	name = "Lump of ore";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_NUGGET;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_GOLD(C_ITEM)
{
	name = "Gold";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLD;
	visual = "ItMi_Gold.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_OLDCOIN(C_ITEM)
{
	name = "Old coin";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_GOLDCANDLEHOLDER(C_ITEM)
{
	name = "Gold candlestick";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCANDLEHOLDER;
	visual = "ItMi_GoldCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDNECKLACE(C_ITEM)
{
	name = "Gold necklace";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = VALUE_GOLDNECKLACE;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ITMI_SILVERRING(C_ITEM)
{
	name = "Silver ring";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = VALUE_SILVERRING;
	visual = "ItMi_SilverRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITMI_SILVERCUP(C_ITEM)
{
	name = "Silver chalice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCUP;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SILVERPLATE(C_ITEM)
{
	name = "Silver plate";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERPLATE;
	visual = "ItMi_SilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDPLATE(C_ITEM)
{
	name = "Gold plate";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDCUP(C_ITEM)
{
	name = "Gold chalice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCUP;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_BLOODCUP_MIS(C_ITEM)
{
	name = "Blood chalice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_BLOODCUP;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "Many people died for this chalice";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDRING(C_ITEM)
{
	name = "Gold ring";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = VALUE_GOLDRING;
	visual = "ItMi_GoldRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITMI_SILVERCHALICE(C_ITEM)
{
	name = "Silver dish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCHALICE;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_JEWELERYCHEST(C_ITEM)
{
	name = "Jewel casket";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JEWELERYCHEST;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDCHALICE(C_ITEM)
{
	name = "Gold dish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCHALICE;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDCHEST(C_ITEM)
{
	name = "Casket";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCHEST;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_INNOSSTATUE(C_ITEM)
{
	name = "Statue of Innos";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SEXTANT(C_ITEM)
{
	name = "Sextant";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SEXTANT;
	visual = "ItMi_Sextant.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SILVERCANDLEHOLDER(C_ITEM)
{
	name = "Silver candlestick";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCANDLEHOLDER;
	visual = "ItMi_SilverCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SILVERNECKLACE(C_ITEM)
{
	name = "Silver necklace";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = VALUE_SILVERNECKLACE;
	visual = "ItMi_SilverNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SULFUR(C_ITEM)
{
	name = "Sulfur";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SULFUR;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_QUARTZ(C_ITEM)
{
	name = "Glacier quartz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_QUARTZ;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ITMI_PITCH(C_ITEM)
{
	name = "Pitch";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PITCH;
	visual = "ItMi_Pitch.3DS";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ROCKCRYSTAL(C_ITEM)
{
	name = "Rock crystal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ROCKCRYSTAL;
	visual = "ItMi_Rockcrystal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_AQUAMARINE(C_ITEM)
{
	name = "Acquamarine";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_AQUAMARINE;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_HOLYWATER(C_ITEM)
{
	name = "Holy water";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOLYWATER;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_COAL(C_ITEM)
{
	name = "Coal";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_COAL;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_DARKPEARL(C_ITEM)
{
	name = "Black pearl";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKPEARL;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_DIAMOND(C_ITEM)
{
	name = "Diamond";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1400;
	visual = "ItMi_Diamond.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_DMNDFRAGMENTS_01(C_ITEM)
{
	name = "Diamond fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItMi_Diamond_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_DMNDDUST_01(C_ITEM)
{
	name = "Diamond dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1100;
	visual = "ItMi_Diamond_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_SAPPHIRE(C_ITEM)
{
	name = "Sapphier";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1200;
	visual = "ItMi_Sapphire.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_SPPHRFRAGMENTS_01(C_ITEM)
{
	name = "Sapphier fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 110;
	visual = "ItMi_Sapphire_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_SPPHRDUST_01(C_ITEM)
{
	name = "Sapphier dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItMi_Sapphire_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_EMERALD(C_ITEM)
{
	name = "Emerald";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1000;
	visual = "ItMi_Emerald.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_EMRLDFRAGMENTS_01(C_ITEM)
{
	name = "Emerald fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItMi_Emerald_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_EMRLDDUST_01(C_ITEM)
{
	name = "Emerald dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 900;
	visual = "ItMi_Emerald_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_RUBY(C_ITEM)
{
	name = "Ruby";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1100;
	visual = "ItMi_Ruby.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 165;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_RUBFRAGMENTS_01(C_ITEM)
{
	name = "Ruby fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 80;
	visual = "ItMi_Ruby_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 165;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_RUBDUST_01(C_ITEM)
{
	name = "Ruby dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 800;
	visual = "ItMi_Ruby_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_TOPAZ(C_ITEM)
{
	name = "Topaz";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 670;
	visual = "ItMi_Topaz.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_TPZFRAGMENTS_01(C_ITEM)
{
	name = "Topaz fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 60;
	visual = "ItMi_Topaz_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_TPZDUST_01(C_ITEM)
{
	name = "Topaz dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 570;
	visual = "ItMi_Topaz_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_AMETHYST(C_ITEM)
{
	name = "Amethyst";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 290;
	visual = "ItMi_Amethyst.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 200;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_AMTHSTFRAGMENTS_01(C_ITEM)
{
	name = "Amethyst fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 40;
	visual = "ItMi_Amethyst_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 200;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_AMTHSTDUST_01(C_ITEM)
{
	name = "Amethyst dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 140;
	visual = "ItMi_Amethyst_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_AMBER(C_ITEM)
{
	name = "Amber";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 90;
	visual = "ItMi_Amber.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_AMBRFRAGMENTS_01(C_ITEM)
{
	name = "Amber fragments";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 40;
	visual = "ItMi_Amber_Fragments.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 0;
	inv_rotx = 90;
};

instance ITMI_AMBRDUST_01(C_ITEM)
{
	name = "Amber dust";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 60;
	visual = "ItMi_Amber_Dust.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 125;
	inv_rotx = 180;
	inv_rotz = 180;
};

instance ITMI_APFELTABAK(C_ITEM)
{
	name = "Apple tobacco";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_apfeltabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "A bag of apple tobacco.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PILZTABAK(C_ITEM)
{
	name = "Mushroom tobacco";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_pilztabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Dark-mushroom tobacco.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_DOPPELTABAK(C_ITEM)
{
	name = "Double apple";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_doppeltabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Tastes a lot like apple...";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_HONIGTABAK(C_ITEM)
{
	name = "Honey tobacco";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_honigtabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Sweet honey tobacco.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SUMPFTABAK(C_ITEM)
{
	name = "Herb tobacco";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_sumpftabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Swampweed blend.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

