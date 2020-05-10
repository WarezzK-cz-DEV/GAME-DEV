
const int SMALLBUFF = 10;
const int MEDIUMBUFF = 20;
const int BIGBUFF = 35;
const int LEGENDARYBUFF = 50;

instance ITMW_1H_MACE_L_01(C_ITEM)
{
	name = "Poker";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SCHUERHAKEN;
	damagetotal = DAMAGE_SCHUERHAKEN;
	damagetype = DAM_BLUNT;
	range = RANGE_SCHUERHAKEN;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHUERHAKEN;
	visual = "Itmw_005_1h_poker_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BAU_AXE(C_ITEM)
{
	name = "Sickle";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_BAUAXE;
	damagetotal = DAMAGE_BAUAXE;
	damagetype = DAM_EDGE;
	range = RANGE_BAUAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BAUAXE;
	visual = "Itmw_007_1h_sickle_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_VLK_MACE(C_ITEM)
{
	name = "Staff";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_VLKMACE;
	damagetotal = DAMAGE_VLKMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_VLKMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKMACE;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_L_03(C_ITEM)
{
	name = "Cudgel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_BELEGNAGEL;
	damagetotal = DAMAGE_BELEGNAGEL;
	damagetype = DAM_BLUNT;
	range = RANGE_BELEGNAGEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BELEGNAGEL;
	visual = "ItMw_008_1h_mace_light_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BAU_MACE(C_ITEM)
{
	name = "Heavy branch";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_BAUMACE;
	damagetotal = DAMAGE_BAUMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_BAUMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BAUMACE;
	visual = "ItMw_010_1h_Club_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_VLK_AXE(C_ITEM)
{
	name = "Axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_VLKAXE;
	damagetotal = DAMAGE_VLKAXE;
	damagetype = DAM_EDGE;
	range = RANGE_VLKAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKAXE;
	visual = "Itmw_010_1h_vlk_hatchet_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MACE_L_04(C_ITEM)
{
	name = "Blacksmith's hammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SCHMIEDEHAMMER;
	damagetotal = DAMAGE_SCHMIEDEHAMMER;
	damagetype = DAM_BLUNT;
	range = RANGE_SCHMIEDEHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHMIEDEHAMMER;
	visual = "ItMw_010_1h_sledgehammer_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD1(C_ITEM)
{
	name = "Short militia sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD1;
	damagetotal = DAMAGE_SHORTSWORD1;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD1;
	visual = "ItMw_010_1h_Sword_short_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_NAGELKNUEPPEL(C_ITEM)
{
	name = "Spiked club";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAGELKNUEPPEL;
	damagetotal = DAMAGE_NAGELKNUEPPEL;
	damagetype = DAM_BLUNT;
	range = RANGE_NAGELKNUEPPEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NAGELKNUEPPEL;
	visual = "ItMw_012_1h_Nailmace_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SWORD_L_03(C_ITEM)
{
	name = "Wolf's knife";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_WOLFSKLINGE;
	damagetotal = DAMAGE_WOLFSKLINGE;
	damagetype = DAM_EDGE;
	range = RANGE_WOLFSKLINGE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_WOLFSKLINGE;
	visual = "ItMw_012_1h_Knife_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD2(C_ITEM)
{
	name = "Rough short sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD2;
	damagetotal = DAMAGE_SHORTSWORD2;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD2;
	visual = "ItMw_012_1h_Sword_short_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SENSE(C_ITEM)
{
	name = "Small scythe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SENSE;
	damagetotal = DAMAGE_SENSE;
	damagetype = DAM_EDGE;
	range = RANGE_SENSE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SENSE;
	visual = "ItMw_012_1h_Scythe_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_NOV_MACE(C_ITEM)
{
	name = "Fighting pike";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_NOVMACE;
	damagetotal = DAMAGE_NOVMACE + SMALLBUFF;
	damagetype = DAM_BLUNT;
	range = RANGE_NOVMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NOVMACE;
	visual = "ItMw_020_2h_Nov_Staff_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BAU_AXE(C_ITEM)
{
	name = "Woodcutter's axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_BAU2HAXT;
	damagetotal = DAMAGE_BAU2HAXT + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_BAU2HAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BAU2HAXT;
	visual = "ItMw_020_2h_Axe_Lumberjack_01.3ds";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_AXE_L_01(C_ITEM)
{
	name = "Pick";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_SPITZHACKE;
	damagetotal = DAMAGE_SPITZHACKE + SMALLBUFF;
	damagetype = DAM_BLUNT;
	range = RANGE_SPITZHACKE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPITZHACKE;
	visual = "ItMw_020_2h_Pickaxe_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MISC_SWORD(C_ITEM)
{
	name = "Rusty sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MISCSWORD;
	damagetotal = DAMAGE_MISCSWORD;
	damagetype = DAM_EDGE;
	range = RANGE_MISCSWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MISCSWORD;
	visual = "ItMw_020_1h_sword_old_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MISC_AXE(C_ITEM)
{
	name = "Rusty axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_MISCAXE;
	damagetotal = DAMAGE_MISCAXE + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_MISCAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MISCAXE;
	visual = "ItMw_025_2h_Misc_Axe_old_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SWORD_M_01(C_ITEM)
{
	name = "Rusty two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_MISC2HSWORD;
	damagetotal = DAMAGE_MISC2HSWORD + SMALLBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_MISC2HSWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MISC2HSWORD;
	visual = "ItMw_025_2h_Sword_old_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_MIL_SWORD(C_ITEM)
{
	name = "Rough broadsword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MILSCHWERT;
	damagetotal = DAMAGE_MILSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_MILSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MILSCHWERT;
	visual = "Itmw_025_1h_Mil_Sword_broad_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SLD_AXE(C_ITEM)
{
	name = "Rough hatchet";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SLD1HAXT;
	damagetotal = DAMAGE_SLD1HAXT;
	damagetype = DAM_EDGE;
	range = RANGE_SLD1HAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD1HAXT;
	visual = "ItMw_025_1h_sld_axe_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SLD_SWORD(C_ITEM)
{
	name = "Rough sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SLD1HSCHWERT;
	damagetotal = DAMAGE_SLD1HSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_SLD1HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD1HSCHWERT;
	visual = "ItMw_025_1h_sld_sword_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SLD_AXE(C_ITEM)
{
	name = "Rough war axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_SLD2HAXE;
	damagetotal = DAMAGE_SLD2HAXE + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD2HAXE;
	visual = "ItMw_035_2h_sld_axe_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SLD_SWORD(C_ITEM)
{
	name = "Rough two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SLD2HSCHWERT;
	damagetotal = DAMAGE_SLD2HSCHWERT + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SLD2HSCHWERT;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_PAL_SWORD(C_ITEM)
{
	name = "Paladin's sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_PALSCHWERT;
	damagetotal = DAMAGE_PALSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_PALSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PALSCHWERT;
	visual = "ItMw_030_1h_PAL_Sword_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_PAL_SWORD(C_ITEM)
{
	name = "Paladin's two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_PALZWEIHAENDER;
	damagetotal = DAMAGE_PALZWEIHAENDER + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_PALZWEIHAENDER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PALZWEIHAENDER;
	visual = "ItMw_040_2h_PAL_Sword_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_01(C_ITEM)
{
	name = "Light orc axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_01;
	damagetotal = DAMAGE_ORKAXT_01 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_01;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_01;
	visual = "ItMw_2H_OrcAxe_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_02(C_ITEM)
{
	name = "Medium orc axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_02;
	damagetotal = DAMAGE_ORKAXT_02 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_02;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_02;
	visual = "ItMw_2H_OrcAxe_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_03(C_ITEM)
{
	name = "Heavy orc axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_03;
	damagetotal = DAMAGE_ORKAXT_03 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_03;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_03;
	visual = "ItMw_2H_OrcAxe_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCAXE_04(C_ITEM)
{
	name = "Brutal orc axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKAXT_04;
	damagetotal = DAMAGE_ORKAXT_04 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ORKAXT_04;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKAXT_04;
	visual = "ItMw_2H_OrcAxe_04.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCSWORD_01(C_ITEM)
{
	name = "Lizard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ORKSCHWERT;
	damagetotal = DAMAGE_ORKSCHWERT + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ORKSCHWERT;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHWERT;
	visual = "ItMw_2H_OrcSword_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCMACE_02(C_ITEM)
{
	name = "Lizard war hammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_ORKSCHWERT;
	damagetotal = DAMAGE_ORKSCHWERT + BIGBUFF;
	damagetype = DAM_BLUNT;
	range = RANGE_ORKSCHWERT;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHWERT;
	visual = "ItMw_2H_OrcMace_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_ORCSWORD_02(C_ITEM)
{
	name = "Orcish war sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ORKSCHWERT_01;
	damagetotal = DAMAGE_ORKSCHWERT_01 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ORKSCHWERT_01;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHWERT_01;
	visual = "ItMw_2H_OrcSword_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD3(C_ITEM)
{
	name = "Short sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD3;
	damagetotal = DAMAGE_SHORTSWORD3;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD3;
	visual = "ItMw_016_1h_Sword_short_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_NAGELKEULE(C_ITEM)
{
	name = "Spiked cudgel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAGELKEULE;
	damagetotal = DAMAGE_NAGELKEULE;
	damagetype = DAM_BLUNT;
	range = RANGE_NAGELKEULE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NAGELKEULE;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD4(C_ITEM)
{
	name = "Wolf's tooth";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD4;
	damagetotal = DAMAGE_SHORTSWORD4;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD4;
	visual = "ItMw_020_1h_Sword_short_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRIEGSKEULE(C_ITEM)
{
	name = "War cudgel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_KRIEGSKEULE;
	damagetotal = DAMAGE_KRIEGSKEULE;
	damagetype = DAM_BLUNT;
	range = RANGE_KRIEGSKEULE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSKEULE;
	visual = "ItMw_022_1h_mace_war_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RICHTSTAB(C_ITEM)
{
	name = "Judge's staff";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_RICHTSTAB;
	damagetotal = DAMAGE_RICHTSTAB + SMALLBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_RICHTSTAB;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RICHTSTAB;
	visual = "ItMw_025_2h_Staff_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SHORTSWORD5(C_ITEM)
{
	name = "Fine short sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SHORTSWORD5;
	damagetotal = DAMAGE_SHORTSWORD5;
	damagetype = DAM_EDGE;
	range = RANGE_SHORTSWORD5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SHORTSWORD5;
	visual = "ItMw_025_1h_Sword_short_05.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRIEGSHAMMER1(C_ITEM)
{
	name = "Warhammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_KRIEGSHAMMER1;
	damagetotal = DAMAGE_KRIEGSHAMMER1;
	damagetype = DAM_BLUNT;
	range = RANGE_KRIEGSHAMMER1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSHAMMER1;
	visual = "ItMw_028_1h_warhammer_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_JBHAMMER(C_ITEM)
{
	name = "Hammer of Justice";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_JBHAMMER;
	damagetotal = DAMAGE_JBHAMMER + BIGBUFF;
	damagetype = DAM_BLUNT;
	range = RANGE_JBHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_JBHAMMER;
	visual = "ItMw_JBHammer_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_BS;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_HELLEBARDE(C_ITEM)
{
	name = "Halberd";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_HELLEBARDE;
	damagetotal = DAMAGE_HELLEBARDE + SMALLBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_HELLEBARDE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HELLEBARDE;
	visual = "itmw_028_2h_halberd_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_NAGELKEULE2(C_ITEM)
{
	name = "Heavy spiked cudgel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_NAGELKEULE2;
	damagetotal = DAMAGE_NAGELKEULE2;
	damagetype = DAM_BLUNT;
	range = RANGE_NAGELKEULE2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_NAGELKEULE2;
	visual = "ItMw_018_1h_Mace_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHIFFSAXT(C_ITEM)
{
	name = "Sailor's axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_SCHIFFSAXT;
	damagetotal = DAMAGE_SCHIFFSAXT;
	damagetype = DAM_EDGE;
	range = RANGE_SCHIFFSAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHIFFSAXT;
	visual = "ItMw_030_1h_axe_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_PIRATENSAEBEL(C_ITEM)
{
	name = "Pirate's cutlass";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_PIRATENSAEBEL;
	damagetotal = DAMAGE_PIRATENSAEBEL;
	damagetype = DAM_EDGE;
	range = RANGE_PIRATENSAEBEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PIRATENSAEBEL;
	visual = "ItMw_030_1h_sword_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT(C_ITEM)
{
	name = "Rough longsword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT;
	damagetotal = DAMAGE_SCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT;
	visual = "ItMw_030_1h_sword_long_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_COMMON_01(C_ITEM)
{
	name = "Sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_COMMON1;
	damagetotal = DAMAGE_COMMON1;
	damagetype = DAM_EDGE;
	range = RANGE_COMMON1;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_COMMON1;
	visual = "ItMw_030_1h_Common_Sword_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STABKEULE(C_ITEM)
{
	name = "Staff mace";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STABKEULE;
	damagetotal = DAMAGE_STABKEULE + MEDIUMBUFF;
	damagetype = DAM_BLUNT;
	range = RANGE_STABKEULE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STABKEULE;
	visual = "ItMw_032_2h_staff_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER1(C_ITEM)
{
	name = "Light two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER1;
	damagetotal = DAMAGE_ZWEIHAENDER1 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER1;
	visual = "ItMw_032_2h_sword_light_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STEINBRECHER(C_ITEM)
{
	name = "Stonebreaker";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_STEINBRECHER;
	damagetotal = DAMAGE_STEINBRECHER;
	damagetype = DAM_BLUNT;
	range = RANGE_STEINBRECHER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STEINBRECHER;
	visual = "ItMw_035_1h_mace_war_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SPICKER(C_ITEM)
{
	name = "Skullsplitter";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_SPICKER;
	damagetotal = DAMAGE_SPICKER;
	damagetype = DAM_BLUNT;
	range = RANGE_SPICKER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPICKER;
	visual = "ItMw_035_1h_mace_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STREITAXT1(C_ITEM)
{
	name = "Light battle axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_STREITAXT1;
	damagetotal = DAMAGE_STREITAXT1 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_STREITAXT1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STREITAXT1;
	visual = "ItMw_035_2h_Axe_light_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT1(C_ITEM)
{
	name = "Fine sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT1;
	damagetotal = DAMAGE_SCHWERT1;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT1;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT1;
	visual = "ItMw_035_1h_Sword_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT2(C_ITEM)
{
	name = "Longsword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT2;
	damagetotal = DAMAGE_SCHWERT2;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT2;
	visual = "ItMw_037_1h_sword_long_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_DOPPELAXT(C_ITEM)
{
	name = "Double-bladed axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_DOPPELAXT;
	damagetotal = DAMAGE_DOPPELAXT;
	damagetype = DAM_EDGE;
	range = RANGE_DOPPELAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DOPPELAXT;
	visual = "ItMw_040_1h_Axe_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_BARTAXT(C_ITEM)
{
	name = "Beard axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_BARTAXT;
	damagetotal = DAMAGE_BARTAXT;
	damagetype = DAM_EDGE;
	range = RANGE_BARTAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BARTAXT;
	visual = "ItMw_040_1h_axe_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_MORGENSTERN(C_ITEM)
{
	name = "Flail";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_MORGENSTERN;
	damagetotal = DAMAGE_MORGENSTERN;
	damagetype = DAM_BLUNT;
	range = RANGE_MORGENSTERN;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MORGENSTERN;
	visual = "ItMW_045_1h_mace_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT3(C_ITEM)
{
	name = "Rough bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT3;
	damagetotal = DAMAGE_SCHWERT3;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT3;
	visual = "ItMw_045_1h_Sword_Bastard_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT4(C_ITEM)
{
	name = "Fine longsword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT4;
	damagetotal = DAMAGE_SCHWERT4;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT4;
	on_equip = mw1h_plus_equip_06;
	on_unequip = mw1h_plus_unequip_06;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT4;
	visual = "ItMw_045_1h_Sword_long_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_06;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_01(C_ITEM)
{
	name = "Ore longsword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_1;
	damagetotal = DAMAGE_SPECIAL_1H_1;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_1;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_01_NS(C_ITEM)
{
	name = "Ore longsword (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_1;
	damagetotal = DAMAGE_SPECIAL_1H_1_NS;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_1;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_1;
	visual = "ItMw_045_1h_Sword_smith_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_01(C_ITEM)
{
	name = "Ore two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_1;
	damagetotal = DAMAGE_SPECIAL_2H_1 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_1;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_1;
	visual = "ItMw_050_2h_Sword_smith_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_01_NS(C_ITEM)
{
	name = "Ore two-hander (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_1;
	damagetotal = DAMAGE_SPECIAL_2H_1_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_1;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_1;
	visual = "ItMw_050_2h_Sword_smith_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RUBINKLINGE(C_ITEM)
{
	name = "Ruby blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RUBINKLINGE;
	damagetotal = DAMAGE_RUBINKLINGE;
	damagetype = DAM_EDGE;
	range = RANGE_RUBINKLINGE;
	on_equip = mw1h_plus_equip_07;
	on_unequip = mw1h_plus_unequip_07;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RUBINKLINGE;
	visual = "ItMw_050_1h_sword_05.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_07;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STREITKOLBEN(C_ITEM)
{
	name = "Mace";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_STREITKOLBEN;
	damagetotal = DAMAGE_STREITKOLBEN;
	damagetype = DAM_BLUNT;
	range = RANGE_STREITKOLBEN;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STREITKOLBEN;
	visual = "ItMw_050_1h_mace_war_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER2(C_ITEM)
{
	name = "Two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER2;
	damagetotal = DAMAGE_ZWEIHAENDER2 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER2;
	visual = "ItMw_055_2h_sword_light_05.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RUNENSCHWERT(C_ITEM)
{
	name = "Rune sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RUNENSCHWERT;
	damagetotal = DAMAGE_RUNENSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_RUNENSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RUNENSCHWERT;
	visual = "ItMw_055_1h_sword_long_05.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RABENSCHNABEL(C_ITEM)
{
	name = "Raven's beak";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_RABENSCHNABEL;
	damagetotal = DAMAGE_RABENSCHNABEL;
	damagetype = DAM_BLUNT;
	range = RANGE_RABENSCHNABEL;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RABENSCHNABEL;
	visual = "ItMw_058_1h_warhammer_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHWERT5(C_ITEM)
{
	name = "Fine bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SCHWERT5;
	damagetotal = DAMAGE_SCHWERT5;
	damagetype = DAM_EDGE;
	range = RANGE_SCHWERT5;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWERT5;
	visual = "ItMw_058_1h_Sword_Bastard_02.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_INQUISITOR(C_ITEM)
{
	name = "Inquisitor";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_INQUISITOR;
	damagetotal = DAMAGE_INQUISITOR;
	damagetype = DAM_EDGE;
	range = RANGE_INQUISITOR;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_INQUISITOR;
	visual = "ItMw_060_1h_mace_war_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STREITAXT2(C_ITEM)
{
	name = "Battle axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_STREITAXT2;
	damagetotal = DAMAGE_STREITAXT2 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_STREITAXT2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STREITAXT2;
	visual = "ItMw_060_2h_axe_heavy_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER3(C_ITEM)
{
	name = "Rune power";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER3;
	damagetotal = DAMAGE_ZWEIHAENDER3 + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER3;
	visual = "ItMw_060_2h_sword_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_02(C_ITEM)
{
	name = "Ore bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_2;
	damagetotal = DAMAGE_SPECIAL_1H_2;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_2;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_02_NS(C_ITEM)
{
	name = "Ore bastard sword (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_2;
	damagetotal = DAMAGE_SPECIAL_1H_2_NS;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_2;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_2;
	visual = "ItMw_060_1h_Sword_smith_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_02(C_ITEM)
{
	name = "Heavy ore two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_2;
	damagetotal = DAMAGE_SPECIAL_2H_2 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_2;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_2;
	visual = "ItMw_070_2h_Sword_smith_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_02_NS(C_ITEM)
{
	name = "Heavy ore two-hander (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_2;
	damagetotal = DAMAGE_SPECIAL_2H_2_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_2;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_2;
	visual = "ItMw_070_2h_Sword_smith_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ELBASTARDO(C_ITEM)
{
	name = "El Bastardo";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_ELBASTARDO;
	damagetotal = DAMAGE_ELBASTARDO;
	damagetype = DAM_EDGE;
	range = RANGE_ELBASTARDO;
	on_equip = mw1h_plus_equip_08;
	on_unequip = mw1h_plus_unequip_08;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ELBASTARDO;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_08;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRIEGSHAMMER2(C_ITEM)
{
	name = "Heavy warhammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_KRIEGSHAMMER2;
	damagetotal = DAMAGE_KRIEGSHAMMER2;
	damagetype = DAM_BLUNT;
	range = RANGE_KRIEGSHAMMER2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSHAMMER2;
	visual = "ItMw_065_1h_warhammer_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FOLTERAXT(C_ITEM)
{
	name = "Torturer's axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_FOLTERAXT;
	damagetotal = DAMAGE_FOLTERAXT;
	damagetype = DAM_EDGE;
	range = RANGE_FOLTERAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FOLTERAXT;
	visual = "ItMw_065_2h_greataxe_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ORKSCHLAECHTER(C_ITEM)
{
	name = "Orc slayer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ORKSCHLAECHTER;
	damagetotal = DAMAGE_ORKSCHLAECHTER;
	damagetype = DAM_EDGE;
	range = RANGE_ORKSCHLAECHTER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ORKSCHLAECHTER;
	visual = "ItMw_065_1h_sword_bastard_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ZWEIHAENDER4(C_ITEM)
{
	name = "Heavy two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ZWEIHAENDER4;
	damagetotal = DAMAGE_ZWEIHAENDER4 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_ZWEIHAENDER4;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ZWEIHAENDER4;
	visual = "ItMw_068_2h_sword_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SCHLACHTAXT(C_ITEM)
{
	name = "War axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_SCHLACHTAXT;
	damagetotal = DAMAGE_SCHLACHTAXT + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SCHLACHTAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHLACHTAXT;
	visual = "ItMw_070_2h_axe_heavy_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KRUMMSCHWERT(C_ITEM)
{
	name = "Heavy cutlass";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SCIMITAR;
	damagetotal = DAMAGE_SCIMITAR + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SCIMITAR;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCIMITAR;
	visual = "ItMw_070_2h_sword_09.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_BARBARENSTREITAXT(C_ITEM)
{
	name = "Barbarian battleaxe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_BARBARENSTREITAXT;
	damagetotal = DAMAGE_BARBARENSTREITAXT + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_BARBARENSTREITAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BARBARENSTREITAXT;
	visual = "ItMw_075_2h_axe_heavy_04.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_STURMBRINGER(C_ITEM)
{
	name = "Stormbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_STURMBRINGER;
	damagetotal = DAMAGE_STURMBRINGER + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_STURMBRINGER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STURMBRINGER;
	visual = "ItMw_075_2h_sword_heavy_03.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_DEATHBRINGER(C_ITEM)
{
	name = "Deathbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_1H_DEATHBRINGER;
	damagetotal = DAMAGE_1H_DEATHBRINGER;
	damagetype = DAM_EDGE;
	range = RANGE_1H_DEATHBRINGER;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_1H_DEATHBRINGER;
	visual = "ItMw_1H_Deathbringer.3DS";
	description = name;
	text[0] = NAME_ONEHANDED_DS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_DEATHBRINGER_NS(C_ITEM)
{
	name = "Deathbringer (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_1H_DEATHBRINGER;
	damagetotal = DAMAGE_1H_DEATHBRINGER_NS;
	damagetype = DAM_EDGE;
	range = RANGE_1H_DEATHBRINGER;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_1H_DEATHBRINGER;
	visual = "ItMw_1H_Deathbringer.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_DEATHBRINGER(C_ITEM)
{
	name = "Heavy Deathbringer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_2H_DEATHBRINGER;
	damagetotal = DAMAGE_2H_DEATHBRINGER + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_2H_DEATHBRINGER;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_2H_DEATHBRINGER;
	visual = "ItMw_2H_Deathbringer.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_DS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_DEATHBRINGER_NS(C_ITEM)
{
	name = "Heavy Deathbringer (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_2H_DEATHBRINGER;
	damagetotal = DAMAGE_2H_DEATHBRINGER_NS + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_2H_DEATHBRINGER;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_2H_DEATHBRINGER;
	visual = "ItMw_2H_Deathbringer.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_03(C_ITEM)
{
	name = "Orcish ore battle sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_3;
	damagetotal = DAMAGE_SPECIAL_1H_3;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_3;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_03_NS(C_ITEM)
{
	name = "Orcish ore battle sword (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_3;
	damagetotal = DAMAGE_SPECIAL_1H_3_NS;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_3;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_3;
	visual = "ItMw_075_1h_sword_smith_04.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_03(C_ITEM)
{
	name = "Heavy Orcish ore battle sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_3;
	damagetotal = DAMAGE_SPECIAL_2H_3 + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_3;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_3;
	visual = "ItMw_090_2h_sword_smith_04.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_03_NS(C_ITEM)
{
	name = "Heavy orcish ore battle sword (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_3;
	damagetotal = DAMAGE_SPECIAL_2H_3_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_3;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_3;
	visual = "ItMw_090_2h_sword_smith_04.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_BERSERKERAXT(C_ITEM)
{
	name = "Berserker's axe";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_BERSERKERAXT;
	damagetotal = DAMAGE_BERSERKERAXT + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_BERSERKERAXT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BERSERKERAXT;
	visual = "ItMw_080_2h_axe_heavy_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_DRACHENSCHNEIDE(C_ITEM)
{
	name = "Dragon Slicer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_DRACHENSCHNEIDE;
	damagetotal = DAMAGE_DRACHENSCHNEIDE + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_DRACHENSCHNEIDE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DRACHENSCHNEIDE;
	visual = "itMw_080_2h_sword_heavy_04.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_04(C_ITEM)
{
	name = "Ore Dragonslayer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_4;
	damagetotal = DAMAGE_SPECIAL_1H_4;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_4;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_4;
	visual = "ItMw_090_1h_sword_smith_05.3DS";
	description = name;
	text[0] = NAME_ONEHANDED_DS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_SPECIAL_04_NS(C_ITEM)
{
	name = "Ore Dragonslayer (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_4;
	damagetotal = DAMAGE_SPECIAL_1H_4_NS;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_4;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_4;
	visual = "ItMw_090_1h_sword_smith_05.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_04(C_ITEM)
{
	name = "Large ore Dragonslayer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_4;
	damagetotal = DAMAGE_SPECIAL_2H_4 + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_4;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_4;
	visual = "ItMw_110_2h_sword_smith_05.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_DS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_SPECIAL_04_NS(C_ITEM)
{
	name = "Large ore Dragonslayer (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SPECIAL_2H_4;
	damagetotal = DAMAGE_SPECIAL_2H_4_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_2H_4;
	on_equip = mw2h_plus_equip_10;
	on_unequip = mw2h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_2H_4;
	visual = "ItMw_110_2h_sword_smith_05.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BLESSED_01(C_ITEM)
{
	name = "Rough ore blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BLESSED_1H_1;
	damagetotal = DAMAGE_BLESSED_1H_1;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_1H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_1H_1;
	visual = "ItMw_1H_OrderSword.3ds";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BLESSDMGADD_01;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BLESSED_02(C_ITEM)
{
	name = "Blessed ore blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BLESSED_1H_2;
	damagetotal = DAMAGE_BLESSED_1H_2;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_1H_2;
	visual = "ItMw_1H_OrderSword.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BLESSDMGADD_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_BLESSED_03(C_ITEM)
{
	name = "Wrath of Innos";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BLESSED_1H_3;
	damagetotal = DAMAGE_BLESSED_1H_3;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_1H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_1H_3;
	visual = "ItMw_1H_OrderSword.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BLESSDMGADD_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BLESSED_01(C_ITEM)
{
	name = "Rough ore sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_BLESSED_2H_1;
	damagetotal = DAMAGE_BLESSED_2H_1 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_2H_1;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_2H_1;
	visual = "ItMw_2H_OrderSword.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BLESSDMGADD_01;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BLESSED_02(C_ITEM)
{
	name = "Sword of the Order";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_BLESSED_2H_2;
	damagetotal = DAMAGE_BLESSED_2H_2 + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_2H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_2H_2;
	visual = "ItMw_2H_OrderSword.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BLESSDMGADD_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2H_BLESSED_03(C_ITEM)
{
	name = "Holy executioner";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_BLESSED_2H_3;
	damagetotal = DAMAGE_BLESSED_2H_3 + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_BLESSED_2H_3;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_BLESSED_2H_3;
	visual = "ItMw_2H_OrderSword.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BLESSDMGADD_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FLAMEBERGE(C_ITEM)
{
	name = "Flamberge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FLAMEBERGE;
	damagetotal = DAMAGE_FLAMEBERGE + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FLAMEBERGE;
	on_equip = mw2h_minus_equip_05;
	on_unequip = mw2h_minus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FLAMEBERGE;
	visual = "ItMw_Flameberge_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_HS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FLAMEBERGE_GRD1(C_ITEM)
{
	name = "Flamberge with jagged edge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FLAMEBERGE;
	damagetotal = DAMAGE_FLAMEBERGE_GRD1 + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FLAMEBERGE;
	on_equip = mw2h_minus_equip_07;
	on_unequip = mw2h_minus_unequip_07;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FLAMEBERGE;
	visual = "ItMw_Flameberge_01_Grd1.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_HS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_07;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FLAMEBERGE_GRD2(C_ITEM)
{
	name = "Fine flamberge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FLAMEBERGE;
	damagetotal = DAMAGE_FLAMEBERGE_GRD2 + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FLAMEBERGE;
	on_equip = mw2h_minus_equip_09;
	on_unequip = mw2h_minus_unequip_09;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FLAMEBERGE;
	visual = "ItMw_Flameberge_01_Grd2.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_HS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_09;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FLAMEBERGE_GRD3(C_ITEM)
{
	name = "Fine hilted flamberge";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FLAMEBERGE;
	damagetotal = DAMAGE_FLAMEBERGE_GRD3 + LEGENDARYBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FLAMEBERGE;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FLAMEBERGE;
	visual = "ItMw_Flameberge_01_Grd3.3DS";
	description = name;
	text[0] = NAME_TWOHANDED_HS;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FLAMEBERGE_NS(C_ITEM)
{
	name = "Flamberge (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FLAMEBERGE;
	damagetotal = DAMAGE_FLAMEBERGE_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FLAMEBERGE;
	on_equip = mw2h_minus_equip_05;
	on_unequip = mw2h_minus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FLAMEBERGE;
	visual = "ItMw_Flameberge_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_CLAYMORE(C_ITEM)
{
	name = "Claymore";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_CLAYMORE;
	damagetotal = DAMAGE_CLAYMORE + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_CLAYMORE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_CLAYMORE;
	visual = "ItMw_Claymore_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_CLAYMORE_NS(C_ITEM)
{
	name = "Claymore (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_CLAYMORE;
	damagetotal = DAMAGE_CLAYMORE_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_CLAYMORE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_CLAYMORE;
	visual = "ItMw_Claymore_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2HFINESWORD(C_ITEM)
{
	name = "Steel two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_2HFINESWORD;
	damagetotal = DAMAGE_2HFINESWORD + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_2HFINESWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_2HFINESWORD;
	visual = "ItMw_2Hfinesword_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_2HFINESWORD_NS(C_ITEM)
{
	name = "Steel two-hander (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_2HFINESWORD;
	damagetotal = DAMAGE_2HFINESWORD_NS + SMALLBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_2HFINESWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_2HFINESWORD;
	visual = "ItMw_2Hfinesword_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1HFINESWORD(C_ITEM)
{
	name = "Steel longsword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_1HFINESWORD;
	damagetotal = DAMAGE_1HFINESWORD;
	damagetype = DAM_EDGE;
	range = RANGE_1HFINESWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_1HFINESWORD;
	visual = "ItMw_1Hfinesword_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1HFINESWORD_NS(C_ITEM)
{
	name = "Steel longsword (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_1HFINESWORD;
	damagetotal = DAMAGE_1HFINESWORD_NS;
	damagetype = DAM_EDGE;
	range = RANGE_1HFINESWORD;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_1HFINESWORD;
	visual = "ItMw_1Hfinesword_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_DEMONSLAYER(C_ITEM)
{
	name = "Demonslayer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_DEMONSLAYER;
	damagetotal = DAMAGE_DEMONSLAYER + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_DEMONSLAYER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DEMONSLAYER;
	visual = "ItMw_DemonSlayer.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_DEMONSLAYER_NS(C_ITEM)
{
	name = "Demonslayer (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_DEMONSLAYER;
	damagetotal = DAMAGE_DEMONSLAYER_NS + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_DEMONSLAYER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DEMONSLAYER;
	visual = "ItMw_DemonSlayer.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FIRSTBLADE(C_ITEM)
{
	name = "Blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_FIRSTBLADE;
	damagetotal = DAMAGE_FIRSTBLADE;
	damagetype = DAM_EDGE;
	range = RANGE_FIRSTBLADE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FIRSTBLADE;
	visual = "ItMw_FirstBlade.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FIRSTBLADE_NS(C_ITEM)
{
	name = "Blade (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_FIRSTBLADE;
	damagetotal = DAMAGE_FIRSTBLADE_NS;
	damagetype = DAM_EDGE;
	range = RANGE_FIRSTBLADE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FIRSTBLADE;
	visual = "ItMw_FirstBlade.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FIRSTBLADE2H(C_ITEM)
{
	name = "Two-handed blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FIRSTBLADE2H;
	damagetotal = DAMAGE_FIRSTBLADE2H + MEDIUMBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FIRSTBLADE2H;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FIRSTBLADE2H;
	visual = "ItMw_FirstBlade2H.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FIRSTBLADE2H_NS(C_ITEM)
{
	name = "Two-handed blade (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_FIRSTBLADE2H;
	damagetotal = DAMAGE_FIRSTBLADE2H_NS + SMALLBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_FIRSTBLADE2H;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FIRSTBLADE2H;
	visual = "ItMw_FirstBlade2H.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FINEBASTARD(C_ITEM)
{
	name = "Fine bastard blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_FINEBASTARD;
	damagetotal = DAMAGE_FINEBASTARD;
	damagetype = DAM_EDGE;
	range = RANGE_FINEBASTARD;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FINEBASTARD;
	visual = "ItMw_FineBastard.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FINEBASTARD_NS(C_ITEM)
{
	name = "Fine bastard blade (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_FINEBASTARD;
	damagetotal = DAMAGE_FINEBASTARD_NS;
	damagetype = DAM_EDGE;
	range = RANGE_FINEBASTARD;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_FINEBASTARD;
	visual = "ItMw_FineBastard.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_GLAMDRING(C_ITEM)
{
	name = "Magician's blade";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_GLAMDRING;
	damagetotal = DAMAGE_GLAMDRING;
	damagetype = DAM_EDGE;
	range = RANGE_GLAMDRING;
	on_equip = glamdring_equip_10;
	on_unequip = glamdring_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_GLAMDRING;
	visual = "ItMw_Glamdring.3DS";
	description = "Magician's blade - Maximum mana increased by 30";
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	count[5] = value;
};

instance ITMW_ANDURIL(C_ITEM)
{
	name = "Elegant bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ANDURIL;
	damagetotal = DAMAGE_ANDURIL;
	damagetype = DAM_EDGE;
	range = RANGE_ANDURIL;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ANDURIL;
	visual = "ItMw_AndurilBlade.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ANDURIL_GRD1(C_ITEM)
{
	name = "Elegant serrated bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ANDURIL;
	damagetotal = DAMAGE_ANDURIL_GRD1;
	damagetype = DAM_EDGE;
	range = RANGE_ANDURIL;
	on_equip = mw1h_plus_equip_07;
	on_unequip = mw1h_plus_unequip_07;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ANDURIL;
	visual = "ItMw_AndurilBlade_Grd1.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_07;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ANDURIL_GRD2(C_ITEM)
{
	name = "Fine serrated bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ANDURIL;
	damagetotal = DAMAGE_ANDURIL_GRD2;
	damagetype = DAM_EDGE;
	range = RANGE_ANDURIL;
	on_equip = mw1h_plus_equip_04;
	on_unequip = mw1h_plus_unequip_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ANDURIL;
	visual = "ItMw_AndurilBlade_Grd2.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ANDURIL_GRD3(C_ITEM)
{
	name = "Reinforced fine serrated bastard sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ANDURIL;
	damagetotal = DAMAGE_ANDURIL_GRD3;
	damagetype = DAM_EDGE;
	range = RANGE_ANDURIL;
	on_equip = mw1h_plus_equip_01;
	on_unequip = mw1h_plus_unequip_01;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ANDURIL;
	visual = "ItMw_AndurilBlade_Grd3.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_01;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ANDURIL_NS(C_ITEM)
{
	name = "Elegant bastard sword (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ANDURIL;
	damagetotal = DAMAGE_ANDURIL_NS;
	damagetype = DAM_EDGE;
	range = RANGE_ANDURIL;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ANDURIL;
	visual = "ItMw_AndurilBlade.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SOT(C_ITEM)
{
	name = "Sword Of Truth";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SOT;
	damagetotal = DAMAGE_SOT;
	damagetype = DAM_EDGE;
	range = RANGE_SOT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SOT;
	visual = "ItMw_SoT.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_SOT_NS(C_ITEM)
{
	name = "Sword Of Truth (NOT SHARPENED)";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_SOT;
	damagetotal = DAMAGE_SOT_NS;
	damagetype = DAM_EDGE;
	range = RANGE_SOT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SOT;
	visual = "ItMw_SoT.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_VLK_DAGGER(C_ITEM)
{
	name = "Dagger";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_VLKDOLCH;
	damagetotal = DAMAGE_VLKDOLCH;
	damagetype = DAM_EDGE;
	range = RANGE_VLKDOLCH;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_VLKDOLCH;
	visual = "Itmw_005_1h_dagger_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_1H_ASSN_DAGGER(C_ITEM)
{
	name = "Assassin's dagger";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ASSNDAG;
	damagetotal = DAMAGE_ASSNDAG;
	damagetype = DAM_EDGE;
	range = RANGE_ASSNDAG;
	on_equip = equip_itmw_dagger_dex_15;
	on_unequip = unequip_itmw_dagger_dex_15;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_ASSNDAG;
	visual = "Itmw_Assn_Dagger_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED_BACKSTAB;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_BONUS_DAGDEX;
	count[4] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itmw_dagger_dex_15()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,15);
	if(Npc_IsPlayer(self))
	{
		if(hero.level >= 45)
		{
			BACKSTAB = 275;
		}
		else if((hero.level >= 40) && (hero.level < 45))
		{
			BACKSTAB = 250;
		}
		else if((hero.level >= 35) && (hero.level < 40))
		{
			BACKSTAB = 225;
		}
		else if((hero.level >= 30) && (hero.level < 35))
		{
			BACKSTAB = 200;
		}
		else if((hero.level >= 25) && (hero.level < 30))
		{
			BACKSTAB = 175;
		}
		else if((hero.level >= 20) && (hero.level < 25))
		{
			BACKSTAB = 150;
		}
		else if((hero.level >= 15) && (hero.level < 20))
		{
			BACKSTAB = 125;
		}
		else if((hero.level >= 10) && (hero.level < 15))
		{
			BACKSTAB = 100;
		}
		else if((hero.level >= 5) && (hero.level < 10))
		{
			BACKSTAB = 75;
		}
		else if((hero.level >= 1) && (hero.level < 5))
		{
			BACKSTAB = 50;
		};
	};
};

func void unequip_itmw_dagger_dex_15()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-15);
	if(Npc_IsPlayer(self))
	{
		BACKSTAB = 0;
	};
};


instance ITMW_1H_VLK_SWORD(C_ITEM)
{
	name = "Rapier";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_VLKSCHWERT;
	damagetotal = DAMAGE_VLKSCHWERT;
	damagetype = DAM_EDGE;
	range = RANGE_VLKSCHWERT;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_VLKSCHWERT;
	visual = "ItMw_018_1h_SwordCane_01.3ds";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_RAPIER(C_ITEM)
{
	name = "Rapier sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_RAPIER;
	damagetotal = DAMAGE_RAPIER;
	damagetype = DAM_EDGE;
	range = RANGE_RAPIER;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_RAPIER;
	visual = "ItMw_Rapier.3ds";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_GADDARE(C_ITEM)
{
	name = "Gaddar";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 1835;
	damagetotal = 100;
	damagetype = DAM_EDGE;
	range = 90;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 60;
	visual = "ItMw_Gaddare.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_FLYSSA(C_ITEM)
{
	name = "Flyssa";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = 2615;
	damagetotal = 140;
	damagetype = DAM_EDGE;
	range = 110;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 140;
	visual = "ItMw_Flyssa.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_MEISTERDEGEN(C_ITEM)
{
	name = "Master sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MEISTERDEGEN;
	damagetotal = DAMAGE_MEISTERDEGEN;
	damagetype = DAM_EDGE;
	range = RANGE_MEISTERDEGEN;
	on_equip = mw1h_plus_equip_10;
	on_unequip = mw1h_plus_unequip_10;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_MEISTERDEGEN;
	visual = "ItMw_065_1h_SwordCane_02.3ds";
	description = name;
	text[0] = NAME_ONEHANDED_MASTER;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_KATANA(C_ITEM)
{
	name = "Katana";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_KATANA;
	damagetotal = DAMAGE_KATANA + BIGBUFF;
	damagetype = DAM_EDGE;
	range = RANGE_KATANA;
	on_equip = mw2h_plus_equip_15;
	on_unequip = mw2h_plus_unequip_15;
	cond_atr[1] = ATR_STRENGTH;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[1] = CONDITION_KATANA;
	cond_value[2] = CONDITION_KATANA;
	visual = "ItMw_Katana_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STRDEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_15;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Bandits' rapier";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_BANDITTRADER;
	damagetotal = DAMAGE_PIR1HSWORD;
	damagetype = DAM_EDGE;
	range = RANGE_MISCAXE;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_COMMON1;
	visual = "ItMw_BanditRapier_01.3ds";
	description = name;
	text[0] = "The letter 'F' is carved on the pommel";
	text[1] = NAME_ONEHANDED;
	text[2] = NAME_DAM_EDGE;
	count[2] = damagetotal;
	text[3] = NAME_RANGE;
	count[3] = range;
	text[4] = NAME_DEX_NEEDED;
	count[4] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_BETTY(C_ITEM)
{
	name = "Betty";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_BETTY;
	damagetotal = DAMAGE_BETTY;
	damagetype = DAM_EDGE;
	range = RANGE_ELBASTARDO;
	cond_atr[1] = ATR_STRENGTH;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[1] = CONDITION_MILSCHWERT;
	cond_value[2] = CONDITION_ELBASTARDO;
	visual = "ItMw_065_1h_sword_bastard_03.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[1];
	text[4] = NAME_DEX_NEEDED;
	count[4] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

