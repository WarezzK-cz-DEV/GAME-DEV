
const int VALUE_GOLDNUGGET = 18;
const int VALUE_IRONNUGGET = 2;
const int VALUE_WHITEPEARL = 120;
const int VALUE_ADDON_JOINT_01 = 60;

instance ITMI_GOLDNUGGET_ADDON(C_ITEM)
{
	name = "Gold nugget";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDNUGGET;
	visual = "ItMi_GoldNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_IRONNUGGET_ADDON(C_ITEM)
{
	name = "Iron ore";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_IronNugget_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_STEELBAR(C_ITEM)
{
	name = "Steel bar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 75;
	visual = "ItMi_SteelBar_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_MAGICBAR(C_ITEM)
{
	name = "Ore bar";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 400;
	visual = "ItMi_MagicBar_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_FIRSTBLADE_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_firstblade_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Blade>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FIRSTBLADE_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_firstblade_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Blade>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1HFINESWORD_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1hfinesword_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Steel longsword>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_1HFINESWORD_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_1hfinesword_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Steel longsword>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_SOT_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_SoT_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Sword Of Truth>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_SOT_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_SoT_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Sword Of Truth>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FINEBASTARD_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_FineBastard_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Fine bastard sword>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FINEBASTARD_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_FineBastard_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Fine bastard sword>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_ANDURIL_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Anduril_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Elegant bastard sword>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_ANDURIL_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Anduril_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Elegant bastard sword>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FIRSTBLADE2H_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_firstblade2h_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Two-handed blade>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FIRSTBLADE2H_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_firstblade2h_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Two-handed blade>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2HFINESWORD_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2hfinesword_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Steel two-hander>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_2HFINESWORD_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_2hfinesword_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Steel two-hander>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_CLAYMORE_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Claymore_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Claymore>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_CLAYMORE_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Claymore_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Claymore>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_DEMONSLAYER_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_DemonSlayer_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Demonslayer>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_DEMONSLAYER_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_DemonSlayer_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Demonslayer>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FLAMEBERGE_BLADE(C_ITEM)
{
	name = "Unfinished blade (incandescent)";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_FlameBerge_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Flamberge>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_FLAMEBERGE_BLADE_NH(C_ITEM)
{
	name = "Unfinished blade";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_FlameBerge_Blade.3ds";
	material = MAT_STONE;
	description = name;
	text[2] = "Used to forge <<Flamberge>>";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_BLADE_STANDARD;
	inv_rotz = INVCAM_Z_BLADE_STANDARD;
	inv_rotx = INVCAM_X_BLADE_STANDARD;
};

instance ITMI_ADDON_WHITEPEARL(C_ITEM)
{
	name = "Pearl";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_WHITEPEARL;
	visual = "ItMi_WhitePearl_01.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_ADDON_JOINT_01(C_ITEM)
{
	name = "Green novice";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ADDON_JOINT_01;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemename = "JOINT";
	on_state[0] = use_addon_joint_01;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


var int firstjoint;

func void use_addon_joint_01()
{
	if(Npc_IsPlayer(self))
	{
		if(FIRSTJOINT == FALSE)
		{
			FIRSTJOINT = TRUE;
			b_giveplayerxp(5);
		};
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITMI_BALTRAMPAKET(C_ITEM)
{
	name = "Baltram's shipment";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "A heavy package of goods";
	text[3] = "from Akil the farmer";
};

instance ITMI_PACKET_BALTRAM4SKIP_ADDON(C_ITEM)
{
	name = "Package for Skip";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "This heavy package of goods";
	text[3] = "is meant for the pirate Skip";
};

instance ITMI_BROMORSGELD_ADDON(C_ITEM)
{
	name = "Bromor's golden dish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_NUGGET;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "The name 'Bromor' ";
	text[3] = "is scratched into the bottom";
	text[4] = "of the dish with a sharp object.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_ADDON_CAVALORNSBEUTEL(C_ITEM)
{
	name = "Cavalorn's leather bag";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_NUGGET;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_cavalornsbeutel;
	description = name;
	text[1] = "It bears a tag with the name 'Cavalorn'.";
	text[2] = "There is a lump of ore inside.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cavalornsbeutel()
{
	CreateInvItems(hero,itmi_nugget,1);
	Print(PRINT_FOUNDORENUGGET);
	SC_OPENEDCAVALORNSBEUTEL = TRUE;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"I found a bag with one lump of ore near Cavalorn's hut in the Valley of mines. That old rogue Cavalorn must have forgotten it here.");
};


instance ITMI_SKULL(C_ITEM)
{
	name = "Skull";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 10;
	visual = "DT_SKELETON_V01_HEAD.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ITMI_IECELLO(C_ITEM)
{
	name = "Cello";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Cello.3ds";
	material = MAT_WOOD;
	scemename = "CELLO";
	on_state[0] = use_cello;
	description = name;
};


func void use_cello()
{
};


instance ITMI_IECELLOBOW(C_ITEM)
{
	name = "Cello bow";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_CelloBow.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_IEDRUM(C_ITEM)
{
	name = "Drum";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drum.3ds";
	material = MAT_WOOD;
	scemename = "PAUKE";
	on_state[0] = use_drum;
	description = name;
};


func void use_drum()
{
};


instance ITMI_IEDRUMSCHEIT(C_ITEM)
{
	name = "Trumpet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Drumscheit.3ds";
	material = MAT_WOOD;
	scemename = "DRUMSCHEIT";
	on_state[0] = use_drumscheit;
	description = name;
};


func void use_drumscheit()
{
};


instance ITMI_IEDRUMSTICK(C_ITEM)
{
	name = "Drumstick";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DrumStick.3ds";
	material = MAT_WOOD;
	description = name;
};

instance ITMI_IEDUDELBLAU(C_ITEM)
{
	name = "Blue bagpipes";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelBlau.3ds";
	material = MAT_WOOD;
	scemename = "DUDEL";
	on_state[0] = use_dudel;
	description = name;
};


func void use_dudel()
{
};


instance ITMI_IEDUDELGELB(C_ITEM)
{
	name = "Yellow bagpipes";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_DudelGelb.3ds";
	material = MAT_WOOD;
	scemename = "DUDEL";
	on_state[0] = use_dudel;
	description = name;
};

instance ITMI_IEHARFE(C_ITEM)
{
	name = "Harp";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Harfe.3ds";
	material = MAT_WOOD;
	scemename = "HARFE";
	on_state[0] = use_harfe;
	description = name;
};


func void use_harfe()
{
};


instance ITMI_IELAUTE(C_ITEM)
{
	name = "Lute";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 1;
	visual = "Itmi_IE_Laute.3ds";
	material = MAT_WOOD;
	scemename = "IELAUTE";
	on_state[0] = use_laute;
	description = name;
};


func void use_laute()
{
};


instance ITMI_ADDON_LENNAR_PAKET(C_ITEM)
{
	name = "Jingling package";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	on_state[0] = use_lennarpaket;
	material = MAT_LEATHER;
	description = name;
	text[2] = "There are many lock picks inside";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_lennarpaket()
{
	b_playerfinditem(itke_lockpick,LENNAR_PICKLOCK_AMOUNT);
	Snd_Play("Geldbeutel");
	LENNARPAKET_OPEN = TRUE;
};


instance ITMI_ZEITSPALT_ADDON(C_ITEM)
{
	name = "Black ore";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Zeitspalt_Addon.3DS";
	scemename = "MAPSEALED";
	on_state[0] = use_zeitspalt_addon;
	material = MAT_STONE;
	description = name;
	text[3] = "Effects unknown.";
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};


func void use_zeitspalt_addon()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("spellFX_BELIARSRAGE",self,self,0,0,0,FALSE);
		Wld_StopEffect("SLOW_MOTION");
		Wld_PlayEffect("SLOW_MOTION",self,self,0,0,0,FALSE);
	};
};

