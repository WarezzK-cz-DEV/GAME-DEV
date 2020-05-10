
instance ITRW_ARROW(C_ITEM)
{
	name = "Arrow";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	value = VALUE_PFEIL;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOLT(C_ITEM)
{
	name = "Bolt";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = VALUE_BOLZEN;
	visual = "ItRw_Bolt.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_MIL_CROSSBOW(C_ITEM)
{
	name = "Militia crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_MILARMBRUST;
	damagetotal = DAMAGE_MILARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MILARMBRUST;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_SLD_BOW(C_ITEM)
{
	name = "Bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_SLDBOGEN;
	damagetotal = DAMAGE_SLDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_SLDBOGEN;
	visual = "ItRw_Sld_Bow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_01(C_ITEM)
{
	name = "Short bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KURZBOGEN;
	damagetotal = DAMAGE_KURZBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KURZBOGEN;
	visual = "ItRw_Bow_L_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_02(C_ITEM)
{
	name = "Willow bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_WEIDENBOGEN;
	damagetotal = DAMAGE_WEIDENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_WEIDENBOGEN;
	visual = "ItRw_Bow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_03(C_ITEM)
{
	name = "Hunting bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGEN;
	damagetotal = DAMAGE_JAGDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGEN;
	visual = "ItRw_Bow_M_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_L_04(C_ITEM)
{
	name = "Elm bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_ULMENBOGEN;
	damagetotal = DAMAGE_ULMENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_ULMENBOGEN;
	visual = "ItRw_Bow_M_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_01(C_ITEM)
{
	name = "Composite bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KOMPOSITBOGEN;
	damagetotal = DAMAGE_KOMPOSITBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KOMPOSITBOGEN;
	visual = "ItRw_Bow_M_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_02(C_ITEM)
{
	name = "Ash bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_ESCHENBOGEN;
	damagetotal = DAMAGE_ESCHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_ESCHENBOGEN;
	visual = "ItRw_Bow_M_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_03(C_ITEM)
{
	name = "Longbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_LANGBOGEN;
	damagetotal = DAMAGE_LANGBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_LANGBOGEN;
	visual = "ItRw_Bow_M_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_M_04(C_ITEM)
{
	name = "Beech bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_BUCHENBOGEN;
	damagetotal = DAMAGE_BUCHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_BUCHENBOGEN;
	visual = "ItRw_Bow_M_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_01(C_ITEM)
{
	name = "Bone bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KNOCHENBOGEN;
	damagetotal = DAMAGE_KNOCHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KNOCHENBOGEN;
	visual = "ItRw_Bow_H_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_02(C_ITEM)
{
	name = "Oak bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_EICHENBOGEN;
	damagetotal = DAMAGE_EICHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_EICHENBOGEN;
	visual = "ItRw_Bow_H_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_03(C_ITEM)
{
	name = "War bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_KRIEGSBOGEN;
	damagetotal = DAMAGE_KRIEGSBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_KRIEGSBOGEN;
	visual = "ItRw_Bow_H_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_H_04(C_ITEM)
{
	name = "Dragon bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_DRACHENBOGEN;
	damagetotal = DAMAGE_DRACHENBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_DRACHENBOGEN;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_D_R2(C_ITEM)
{
	name = "Fine longbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_BOWDR2;
	damagetotal = DAMAGE_BOWDR2;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_BOWDR2;
	visual = "Itrw_Bow_D_R2.mms";
	on_equip = rw_plus_equip_10;
	on_unequip = rw_plus_unequip_10;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOWS;
	count[4] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_LONG_ARABIC(C_ITEM)
{
	name = "Assassin's bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_BOWLONGARABIC;
	damagetotal = DAMAGE_BOWLONGARABIC;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_BOWLONGARABIC;
	visual = "ItRw_Bow_Long_Arabic.mms";
	on_equip = rw_plus_equip_07;
	on_unequip = rw_plus_unequip_07;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOWS;
	count[4] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_R2_SLD(C_ITEM)
{
	name = "Combat bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_BOWR2SLD;
	damagetotal = DAMAGE_BOWR2SLD;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_BOWR2SLD;
	visual = "ItRw_Bow_R2_Sld.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_G4_OAK_BOW_01(C_ITEM)
{
	name = "Fine oak bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_G4OAKBOW;
	damagetotal = DAMAGE_G4OAKBOW;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_G4OAKBOW;
	visual = "ItRw_G4_Oak_Bow_01.mms";
	on_equip = rw_plus_equip_05;
	on_unequip = rw_plus_unequip_05;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_BOWS;
	count[4] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_BOW_R2_COBRA(C_ITEM)
{
	name = "Heavy steel bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_BOWR2COBRA;
	damagetotal = DAMAGE_BOWR2COBRA;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[1] = ATR_STRENGTH;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[1] = CONDITION_BAU2HAXT;
	cond_value[2] = CONDITION_BOWR2COBRA;
	visual = "ItRw_Bow_R2_Cobra.mms";
	on_equip = rw_minus_equip_05;
	on_unequip = rw_minus_unequip_05;
	description = name;
	text[0] = NAME_GREATBOWBONUS;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = "Dexterity required 150 - Strength required 50";
	text[4] = NAME_ADDON_MALUS_BOWS;
	count[4] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_WOLF(C_ITEM)
{
	name = "Wolf's bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = 110;
	damagetotal = 110;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = 110;
	visual = "ITRW_BOW_A_WOLFRIPPER.mms";
	on_equip = rw_minus_equip_10;
	on_unequip = rw_minus_unequip_10;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_BOWS;
	count[4] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_L_01(C_ITEM)
{
	name = "Hunter's crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_JAGDARMBRUST;
	damagetotal = DAMAGE_JAGDARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_JAGDARMBRUST;
	visual = "ItRw_Crossbow_L_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_L_02(C_ITEM)
{
	name = "Light crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_M_01(C_ITEM)
{
	name = "Crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_ARMBRUST;
	damagetotal = DAMAGE_ARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ARMBRUST;
	visual = "ItRw_Crossbow_M_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_M_02(C_ITEM)
{
	name = "War crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_KRIEGSARMBRUST;
	damagetotal = DAMAGE_KRIEGSARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_KRIEGSARMBRUST;
	visual = "ItRw_Crossbow_M_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_H_01(C_ITEM)
{
	name = "Heavy crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_SCHWEREARMBRUST;
	damagetotal = DAMAGE_SCHWEREARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SCHWEREARMBRUST;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_CROSSBOW_H_02(C_ITEM)
{
	name = "Dragon hunter's crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_DRACHENJAEGERARMBRUST;
	damagetotal = DAMAGE_DRACHENJAEGERARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_DRACHENJAEGERARMBRUST;
	visual = "ItRw_Crossbow_H_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

