
instance ITPO_ADDON_GEIST_01(C_ITEM)
{
	name = "Potion of mental alteration";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_ALTERATION;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_geist_01;
	scemename = "POTIONFAST";
	description = name;
	text[2] = "Take PRECAUTIONS before using!";
	text[3] = "Can strongly influence the mind";
	text[4] = "or kill the one who drinks it";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_geist_01()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 1000;
};


instance ITPO_ADDON_GEIST_02(C_ITEM)
{
	name = "Potion of mental alteration";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_ALTERATION;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_geist_02;
	scemename = "POTIONFAST";
	description = name;
	text[2] = "Take PRECAUTIONS before using!";
	text[3] = "Can strongly influence the mind";
	text[4] = "or kill the one who drinks it";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_geist_02()
{
	if(Npc_IsPlayer(self))
	{
		b_giveplayerxp(XP_AMBIENT * 5);
	};
};


instance ITPO_HEALTH_ADDON_04(C_ITEM)
{
	name = "Pure life potion";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPTRUNK;
	visual = "ItPo_Const_Heal_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_04;
	scemename = "POTIONFAST";
	description = name;
	text[2] = "Complete health regeneration.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPTRUNK;
};


func void useitpo_health_04()
{
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
};


instance ITPO_MANA_ADDON_04(C_ITEM)
{
	name = "Pure mana potion";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANATRUNK;
	visual = "ItPo_Const_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_04;
	scemename = "POTIONFAST";
	description = name;
	text[2] = "Complete mana regeneration";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANATRUNK;
};


func void useitpo_mana_04()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
};


instance ITPO_CONST_HEAL_01(C_ITEM)
{
	name = "Healing potions enhancer";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAEXTRAKT;
	visual = "ItPo_Const_Heal_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_const_heal_01;
	scemename = "POTIONFAST";
	description = name;
	text[2] = "Enhances the effect of healing potions permanently.";
	text[3] = "Healing potions will give you health regeneration for a few seconds.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAEXTRAKT;
};


func void useitpo_const_heal_01()
{
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_HEAL == FALSE))
	{
		CONSTANTINO_HEAL = TRUE;
	};
};


instance ITPO_CONST_MANA_01(C_ITEM)
{
	name = "Mana potions enhancer";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAEXTRAKT;
	visual = "ItPo_Const_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_const_mana_01;
	scemename = "POTIONFAST";
	description = name;
	text[2] = "Enhances the effect of mana potions permanently.";
	text[3] = "Mana potions will give you mana regeneration for a few seconds.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAEXTRAKT;
};


func void useitpo_const_mana_01()
{
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_MANA == FALSE))
	{
		CONSTANTINO_MANA = TRUE;
	};
};

