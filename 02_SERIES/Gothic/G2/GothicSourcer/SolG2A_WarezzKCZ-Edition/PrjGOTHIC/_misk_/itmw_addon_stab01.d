
instance ITMW_ADDON_STAB01(C_ITEM)
{
	name = "Magician's wand";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB01;
	damagetotal = DAMAGE_STAB01;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB01;
	on_equip = mw2h_plus_equip_03;
	on_unequip = mw2h_plus_unequip_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STAB01;
	visual = "ItMW_MageStaff_Good_2H_01.3DS";
	effect = "SPELLFX_MAGESTAFF1";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_STAB02(C_ITEM)
{
	name = "Magic wand";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB02;
	damagetotal = DAMAGE_STAB02;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB02;
	on_equip = equip_zauberstab;
	on_unequip = unequip_zauberstab;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = CONDITION_STAB02;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF2";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_BONUS_MANA;
	count[3] = 20;
	text[4] = NAME_MANA_NEEDED;
	count[4] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_zauberstab()
{
	if(Npc_IsPlayer(self))
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 20;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 20;
		b_meleeweaponchange(0,0,20);
	};
};

func void unequip_zauberstab()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_meleeweaponundochange();
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 20;
		if(self.attribute[ATR_MANA] > 20)
		{
			self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 20;
		}
		else
		{
			self.attribute[ATR_MANA] = 0;
		};
	};
};


instance ITMW_ADDON_STAB03(C_ITEM)
{
	name = "Wand of Water";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB03;
	damagetotal = DAMAGE_STAB03;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB03;
	on_equip = mw2h_plus_equip_04;
	on_unequip = mw2h_plus_unequip_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STAB03;
	visual = "ItMW_MageStaff_Blades_2H_01.3DS";
	effect = "SPELLFX_MAGESTAFF3";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_04;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_STAB04(C_ITEM)
{
	name = "Ulthar's wand";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB04;
	damagetotal = DAMAGE_STAB04;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB04;
	on_equip = mw2h_plus_equip_04;
	on_unequip = mw2h_plus_unequip_04;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STAB04;
	visual = "ItMW_MageStaff_Good_2H_02.3DS";
	effect = "SPELLFX_MAGESTAFF4";
	description = "Ulthar enchanted this wand";
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_04;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_STAB05(C_ITEM)
{
	name = "Typhoon";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STAB05;
	damagetotal = DAMAGE_STAB05;
	damagetype = DAM_BLUNT;
	range = RANGE_STAB05;
	on_equip = mw2h_plus_equip_05;
	on_unequip = mw2h_plus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STAB05;
	visual = "ItMW_MageStaff_Blades_2H_01.3DS";
	effect = "SPELLFX_MAGESTAFF5";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_05;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_HACKER_1H_01(C_ITEM)
{
	name = "Machete";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_MACHETE;
	damagetotal = DAMAGE_MACHETE;
	damagetype = DAM_EDGE;
	range = RANGE_MACHETE;
	on_equip = mw1h_plus_equip_03;
	on_unequip = mw1h_plus_unequip_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MACHETE;
	visual = "ItMw_1H_Machete_02.3DS";
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

instance ITMW_ADDON_HACKER_1H_02(C_ITEM)
{
	name = "Old machete";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ALTMACHETE;
	damagetotal = DAMAGE_ALTMACHETE;
	damagetype = DAM_EDGE;
	range = RANGE_ALTMACHETE;
	on_equip = mw1h_plus_equip_02;
	on_unequip = mw1h_plus_unequip_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ALTMACHETE;
	visual = "ItMw_1H_Machete_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = WAFFENBONUS_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_HACKER_2H_01(C_ITEM)
{
	name = "Giant machete";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_HACKER;
	damagetotal = DAMAGE_HACKER;
	damagetype = DAM_EDGE;
	range = RANGE_HACKER;
	on_equip = mw2h_plus_equip_03;
	on_unequip = mw2h_plus_unequip_03;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HACKER;
	visual = "ItMw_2H_Machete_02.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_HACKER_2H_02(C_ITEM)
{
	name = "Old giant machete";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_ALTHACKER;
	damagetotal = DAMAGE_ALTHACKER;
	damagetype = DAM_EDGE;
	range = RANGE_ALTHACKER;
	on_equip = mw2h_plus_equip_02;
	on_unequip = mw2h_plus_unequip_02;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ALTHACKER;
	visual = "ItMw_2H_Machete_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_BONUS_2H;
	count[4] = WAFFENBONUS_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_KEULE_1H_01(C_ITEM)
{
	name = "Wind cudgel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_WINDKNECHT;
	damagetotal = DAMAGE_WINDKNECHT;
	damagetype = DAM_BLUNT;
	range = RANGE_WINDKNECHT;
	on_equip = mw1h_minus_equip_10;
	on_unequip = mw1h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_WINDKNECHT;
	visual = "ItMW_Club_1H_01.3DS";
	description = name;
	text[0] = NAME_ONEHANDED;
	text[1] = NAME_DAM_BLUNT;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_1H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMW_ADDON_KEULE_2H_01(C_ITEM)
{
	name = "Storm cudgel";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_STURMKNECHT;
	damagetotal = DAMAGE_STURMKNECHT;
	damagetype = DAM_BLUNT;
	range = RANGE_STURMKNECHT;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_STURMKNECHT;
	visual = "ItMW_Club_2H_01.3DS";
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

instance ITMW_FRANCISDAGGER_MIS(C_ITEM)
{
	name = "Good dagger";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = 10;
	damagetotal = DAMAGE_VLKDOLCH;
	damagetype = DAM_EDGE;
	range = RANGE_VLKDOLCH;
	on_equip = mw1h_plus_equip_05;
	on_unequip = mw1h_plus_unequip_05;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKDOLCH;
	visual = "Itmw_005_1h_dagger_01.3DS";
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

instance ITMW_RANGERSTAFF_ADDON(C_ITEM)
{
	name = "'Ring of Water' quarterstaff";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_WOOD;
	value = VALUE_RANGERSTAFF;
	damagetotal = DAMAGE_RANGERSTAFF;
	damagetype = DAM_BLUNT;
	range = RANGE_RANGERSTAFF;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_RANGERSTAFF;
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

instance ITMW_ADDON_PIR2HAXE(C_ITEM)
{
	name = "Plank breaker";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_PIR2HAXE;
	damagetotal = DAMAGE_PIR2HAXE;
	damagetype = DAM_EDGE;
	range = RANGE_PIR2HAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PIR2HAXE;
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

instance ITMW_ADDON_PIR1HAXE(C_ITEM)
{
	name = "Boarding pike";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_METAL;
	value = VALUE_PIR1HAXE;
	damagetotal = DAMAGE_PIR1HAXE;
	damagetype = DAM_EDGE;
	range = RANGE_PIR1HAXE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_PIR1HAXE;
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

instance ITRW_ADDON_MAGICARROW(C_ITEM)
{
	name = "Magic arrow";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_ARROW";
	value = VALUE_PFEIL;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_ADDON_FIREARROW(C_ITEM)
{
	name = "Fire arrow";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_BOW | ITEM_MULTI;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREARROW";
	value = VALUE_PFEIL;
	visual = "ItRw_Arrow.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_ADDON_MAGICBOW(C_ITEM)
{
	name = "Magic bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_MAGICBOW;
	damagetotal = DAMAGE_MAGICBOW;
	damagetype = DAM_MAGIC;
	munition = itrw_addon_magicarrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_MAGICBOW;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_ADDON_FIREBOW(C_ITEM)
{
	name = "Firebow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW;
	material = MAT_WOOD;
	value = VALUE_FIREBOW;
	damagetotal = DAMAGE_FIREBOW;
	damagetype = DAM_MAGIC;
	munition = itrw_addon_firearrow;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_FIREBOW";
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_FIREBOW;
	visual = "ItRw_Bow_H_04.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_ADDON_MAGICBOLT(C_ITEM)
{
	name = "Magic quarrel";
	mainflag = ITEM_KAT_MUN;
	flags = ITEM_CROSSBOW | ITEM_MULTI;
	value = VALUE_BOLZEN;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_BOLT";
	visual = "ItRw_Bolt.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRW_ADDON_MAGICCROSSBOW(C_ITEM)
{
	name = "Magic crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	wear = WEAR_EFFECT;
	effect = "SPELLFX_CROSSBOW";
	value = VALUE_MAGICCROSSBOW;
	damagetotal = DAMAGE_MAGICCROSSBOW;
	damagetype = DAM_MAGIC;
	munition = itrw_addon_magicbolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_MAGICCROSSBOW;
	visual = "ItRw_Crossbow_H_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

