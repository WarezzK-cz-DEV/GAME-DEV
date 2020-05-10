
const int VALUE_WEED = 1;
const int VALUE_BEET = 3;
const int HP_BEET = 2;
const int VALUE_SWAMPHERB = 10;
const int VALUE_MANA_HERB_01 = 10;
const int MANA_MANA_HERB_01 = 10;
const int VALUE_MANA_HERB_02 = 20;
const int MANA_MANA_HERB_02 = 15;
const int VALUE_MANA_HERB_03 = 40;
const int MANA_MANA_HERB_03 = 20;
const int VALUE_HEALTH_HERB_01 = 20;
const int HP_HEALTH_HERB_01 = 10;
const int VALUE_HEALTH_HERB_02 = 40;
const int HP_HEALTH_HERB_02 = 20;
const int VALUE_HEALTH_HERB_03 = 60;
const int HP_HEALTH_HERB_03 = 30;
const int VALUE_DEX_HERB_01 = 250;
const int VALUE_STRENGTH_HERB_01 = 500;
const int VALUE_SPEED_HERB_01 = 100;
const int SPEED_BOOST = 15000;
const int VALUE_MUSHROOM_01 = 10;
const int HP_MUSHROOM_01 = 3;
const int VALUE_MUSHROOM_02 = 30;
const int HP_MUSHROOM_02 = 7;
const int VALUE_FORESTBERRY = 10;
const int HP_FORESTBERRY = 5;
const int VALUE_BLUEPLANT = 10;
const int VALUE_GRAVEMOSS = 200;
const int HP_BLUEPLANT = 5;
const int MANA_BLUEPLANT = 5;
const int VALUE_PLANEBERRY = 10;
const int HP_PLANEBERRY = 5;
const int VALUE_TEMP_HERB = 100;
const int HP_TEMP_HERB = 5;
const int VALUE_PERM_HERB = 500;
const int HP_PERM_HERB = 5;

instance ITPL_WEED(C_ITEM)
{
	name = "Weeds";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WEED;
	visual = "ItPl_Weed.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WEED;
};

instance ITPL_BEET(C_ITEM)
{
	name = "Turnip";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEET;
	visual = "ItPl_Beet.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_beet;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_HPED_5;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BEET;
};


func void use_beet()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
};


instance ITPL_SWAMPHERB(C_ITEM)
{
	name = "Swampweed";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SWAMPHERB;
	visual = "ItPl_SwampHerb.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_swampherb;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SWAMPHERB;
};


func void use_swampherb()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITPL_MANA_HERB_01(C_ITEM)
{
	name = "Fire nettle";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MANA_HERB_01;
	visual = "ItPl_Mana_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itpl_mana_herb_01;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_MPED_2;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANA_HERB_01;
};


func void use_itpl_mana_herb_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,2);
};


instance ITPL_MANA_HERB_02(C_ITEM)
{
	name = "Fireweed";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MANA_HERB_02;
	visual = "ItPl_Mana_Herb_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itpl_mana_herb_02;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_MPED_5;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANA_HERB_02;
};


func void use_itpl_mana_herb_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,5);
};


instance ITPL_MANA_HERB_03(C_ITEM)
{
	name = "Fire root";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MANA_HERB_03;
	visual = "ItPl_Mana_Herb_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_itpl_mana_herb_03;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_MPED_10;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANA_HERB_03;
};


func void use_itpl_mana_herb_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,10);
};


instance ITPL_HEALTH_HERB_01(C_ITEM)
{
	name = "Healing plant";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEALTH_HERB_01;
	visual = "ItPl_Health_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itpl_health_herb_01;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_HPED_5;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_HEALTH_HERB_01;
};


func void use_itpl_health_herb_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,5);
};


instance ITPL_HEALTH_HERB_02(C_ITEM)
{
	name = "Healing herb";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEALTH_HERB_02;
	visual = "ItPl_Health_Herb_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itpl_health_herb_02;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_HPED_10;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_HEALTH_HERB_02;
};


func void use_itpl_health_herb_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,10);
};


instance ITPL_HEALTH_HERB_03(C_ITEM)
{
	name = "Healing root";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEALTH_HERB_03;
	visual = "ItPl_Health_Herb_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itpl_health_herb_03;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_HPED_15;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_HEALTH_HERB_03;
};


func void use_itpl_health_herb_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,15);
};


instance ITPL_DEX_HERB_01(C_ITEM)
{
	name = "Goblin berries";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_DEX_HERB_01;
	visual = "ItPl_Dex_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_dex_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_DEX;
	count[1] = 1;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEX_HERB_01;
};


func void use_dex_herb_01()
{
	b_raiseattribute(self,ATR_DEXTERITY,1);
};


instance ITPL_STRENGTH_HERB_01(C_ITEM)
{
	name = "Dragonroot";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_strength_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_STR;
	count[1] = 1;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRENGTH_HERB_01;
};


func void use_strength_herb_01()
{
	b_raiseattribute(self,ATR_STRENGTH,1);
};


instance ITPL_SPEED_HERB_01(C_ITEM)
{
	name = "Snapperweed";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SPEED_HERB_01;
	visual = "ItPl_Speed_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_speed_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = "Temporarily increases the speed";
	text[3] = NAME_SEC_DURATION;
	count[3] = SPEED_BOOST / 1000;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SPEED_HERB_01;
};


func void use_speed_herb_01()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",SPEED_BOOST / 1000);
};


instance ITPL_MUSHROOM_01(C_ITEM)
{
	name = "Dark mushroom";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOM_01;
	visual = "ItPl_Mushroom_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mushroom_01;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_MPED_3;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_MUSHROOM_01;
};


func void use_mushroom_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance ITPL_MUSHROOM_02(C_ITEM)
{
	name = "Digger's meat";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOM_02;
	visual = "ItPl_Mushroom_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mushroom_02;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_HPED_7;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MUSHROOM_02;
};


func void use_mushroom_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,7);
};


instance ITPL_BLUEPLANT(C_ITEM)
{
	name = "Blue elder";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BLUEPLANT;
	visual = "ItPl_Blueplant.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_blueplant;
	scemename = "FOOD";
	description = name;
	text[2] = NAME_BONUS_HPED_5;
	text[3] = NAME_BONUS_MPED_5;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BLUEPLANT;
};


func void use_blueplant()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BLUEPLANT);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BLUEPLANT);
};


instance ITPL_FORESTBERRY(C_ITEM)
{
	name = "Woodland berry";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FORESTBERRY;
	visual = "ItPl_Forestberry.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_forestberry;
	description = name;
	text[2] = NAME_BONUS_HPED_5;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FORESTBERRY;
};


func void use_forestberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FORESTBERRY);
};


instance ITPL_PLANEBERRY(C_ITEM)
{
	name = "Meadow berry";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_PLANEBERRY;
	visual = "ItPl_Planeberry.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_planeberry;
	description = name;
	text[2] = NAME_BONUS_HPED_5;
	text[5] = NAME_VALUE;
	count[5] = VALUE_PLANEBERRY;
};


func void use_planeberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_PLANEBERRY);
};


instance ITPL_TEMP_HERB(C_ITEM)
{
	name = "Meadow knotweed";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_TEMP_HERB;
	visual = "ItPl_Temp_Herb.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_temp_herb;
	description = name;
	text[2] = NAME_BONUS_HPED_5;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_TEMP_HERB;
};


func void use_temp_herb()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_TEMP_HERB);
};


instance ITPL_GRAVEMOSS(C_ITEM)
{
	name = "Grave moss";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_GRAVEMOSS;
	visual = "ItPl_GraveMoss.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	description = name;
	text[3] = "Alchemical ingredient";
	text[5] = NAME_VALUE;
	count[5] = VALUE_GRAVEMOSS;
};

instance ITPL_PERM_HERB(C_ITEM)
{
	name = "King's sorrel";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_PERM_HERB;
	visual = "ItPl_Perm_Herb.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_perm_herb;
	description = name;
	text[2] = NAME_BONUS_HM;
	text[3] = NAME_INFO_KG;
	text[5] = NAME_VALUE;
	count[5] = VALUE_PERM_HERB;
};


func void use_perm_herb()
{
	var int hpres;
	var int manares;
	hpres = 0 + ((self.attribute[ATR_HITPOINTS_MAX] * 100) / 100);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,hpres);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	manares = 0 + ((self.attribute[ATR_MANA_MAX] * 100) / 100);
	Npc_ChangeAttribute(self,ATR_MANA,manares);
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

