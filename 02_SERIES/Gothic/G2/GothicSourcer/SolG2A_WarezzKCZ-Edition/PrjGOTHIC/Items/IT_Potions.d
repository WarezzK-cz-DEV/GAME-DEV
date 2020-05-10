
const int VALUE_HPESSENZ = 40;
const int VALUE_HPEXTRAKT = 60;
const int VALUE_HPELIXIER = 80;
const int VALUE_BAPEHBE = 150;
const int HP_BAPEHBE = 1;
const int VALUE_MANAESSENZ = 25;
const int VALUE_MANAEXTRAKT = 50;
const int VALUE_MANAELIXIER = 80;
const int VALUE_STRELIXIER = 900;
const int VALUE_DEFELIXIER = 1200;
const int STR_ELIXIER = 3;
const int VALUE_DEXELIXIER = 900;
const int DEX_ELIXIER = 3;
const int VALUE_HPMAXELIXIER = 1300;
const int HPMAX_ELIXIER = 20;
const int VALUE_MANAMAXELIXIER = 1300;
const int VALUE_MUSHROOMMP = 1800;
const int MANAMAX_ELIXIER = 5;
const int VALUE_MEGADRINK = 1800;
const int STRORDEX_MEGADRINK = 15;
const int VALUE_SPEED = 200;
const int TIME_SPEED = 80000;
const int VALUE_MANATRUNK = 160;
const int VALUE_HPTRUNK = 160;
const int POT_ESSENCE = 30;
const int POT_EXTRACT = 50;
const int POT_ELIXIR = 70;
var int heal;

instance ITPO_MANA_01(C_ITEM)
{
	name = "Essence of mana";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAESSENZ;
	visual = "ItPo_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_01;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_MANA_30;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_mana_01()
{
	HEAL = 0 + ((self.attribute[ATR_MANA_MAX] * POT_ESSENCE) / 100);
	Npc_ChangeAttribute(self,ATR_MANA,HEAL);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_MANA == TRUE))
	{
		CONSTANTINO_MANA_TIME += 3;
		if(CONSTANTINO_MANA_TIME > POT_ESSENCE)
		{
			CONSTANTINO_MANA_TIME = POT_ESSENCE;
		};
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITPO_MANA_02(C_ITEM)
{
	name = "Extract of mana";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAEXTRAKT;
	visual = "ItPo_Mana_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_02;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_MANA_50;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAEXTRAKT;
};


func void useitpo_mana_02()
{
	HEAL = 0 + ((self.attribute[ATR_MANA_MAX] * POT_EXTRACT) / 100);
	Npc_ChangeAttribute(self,ATR_MANA,HEAL);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_MANA == TRUE))
	{
		CONSTANTINO_MANA_TIME += 5;
		if(CONSTANTINO_MANA_TIME > POT_EXTRACT)
		{
			CONSTANTINO_MANA_TIME = POT_EXTRACT;
		};
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITPO_MANA_03(C_ITEM)
{
	name = "Elixir of mana";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAELIXIER;
	visual = "ItPo_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_03;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_MANA_70;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_mana_03()
{
	HEAL = 0 + ((self.attribute[ATR_MANA_MAX] * POT_ELIXIR) / 100);
	Npc_ChangeAttribute(self,ATR_MANA,HEAL);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_MANA == TRUE))
	{
		CONSTANTINO_MANA_TIME += 10;
		if(CONSTANTINO_MANA_TIME > POT_ELIXIR)
		{
			CONSTANTINO_MANA_TIME = POT_ELIXIR;
		};
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITPO_HEALTH_01(C_ITEM)
{
	name = "Essence of healing";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPESSENZ;
	visual = "ItPo_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_01;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_HP_30;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void useitpo_health_01()
{
	HEAL = 0 + ((self.attribute[ATR_HITPOINTS_MAX] * POT_ESSENCE) / 100);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HEAL);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_HEAL == TRUE))
	{
		CONSTANTINO_HEAL_TIME += 10;
		if(CONSTANTINO_HEAL_TIME > POT_ESSENCE)
		{
			CONSTANTINO_HEAL_TIME = POT_ESSENCE;
		};
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITPO_HEALTH_02(C_ITEM)
{
	name = "Extract of healing";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPEXTRAKT;
	visual = "ItPo_Health_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_02;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_HP_40;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPEXTRAKT;
};


func void useitpo_health_02()
{
	HEAL = 0 + ((self.attribute[ATR_HITPOINTS_MAX] * POT_EXTRACT) / 100);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HEAL);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_HEAL == TRUE))
	{
		CONSTANTINO_HEAL_TIME += 10;
		if(CONSTANTINO_HEAL_TIME > POT_EXTRACT)
		{
			CONSTANTINO_HEAL_TIME = POT_EXTRACT;
		};
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITPO_HEALTH_03(C_ITEM)
{
	name = "Elixir of healing";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItPo_Health_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_03;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_HP_70;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPELIXIER;
};


func void useitpo_health_03()
{
	HEAL = 0 + ((self.attribute[ATR_HITPOINTS_MAX] * POT_ELIXIR) / 100);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HEAL);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero)) && (CONSTANTINO_HEAL == TRUE))
	{
		CONSTANTINO_HEAL_TIME += 10;
		if(CONSTANTINO_HEAL_TIME > POT_ELIXIR)
		{
			CONSTANTINO_HEAL_TIME = POT_ELIXIR;
		};
	};
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITPO_BAPEHBE(C_ITEM)
{
	name = "Berry broth";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_BAPEHBE;
	visual = "ItPo_BAPEHbE.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_bapehbe;
	scemename = "POTIONFAST";
	description = name;
	text[0] = "Healing broth made from woodland berries.";
	text[1] = NAME_BONUS_HP_30;
	text[2] = NAME_BONUS_HPRM;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BAPEHBE;
};


func void useitpo_bapehbe()
{
	var string concattext;
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_BAPEHBE);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BAPEHBE);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(HP_BAPEHBE));
	PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
};


instance ITPO_PERM_DEF(C_ITEM)
{
	name = "Elixir of protection";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_DEFELIXIER;
	visual = "ItPo_Perm_DEF.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_def;
	scemename = "POTION";
	description = name;
	text[1] = NAME_BONUS_DEF;
	text[2] = PRINT_PERMDEF;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEFELIXIER;
};


func void useitpo_perm_def()
{
	Wld_PlayEffect("SPELLFX_DEFSMOKE",hero,hero,3,3,3,FALSE);
	self.protection[PROT_EDGE] += 10;
	self.protection[PROT_BLUNT] += 10;
	self.protection[PROT_POINT] += 10;
	STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	PrintScreen(PRINT_PERMDEF,-1,-1,FONT_SCREEN,4);
};


instance ITPO_PERM_STR(C_ITEM)
{
	name = "Elixir of strength";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STRELIXIER;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_str;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_STR;
	count[1] = STR_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRELIXIER;
};


func void useitpo_perm_str()
{
	b_raiseattribute(self,ATR_STRENGTH,STR_ELIXIER);
};


instance ITPO_PERM_DEX(C_ITEM)
{
	name = "Elixir of dexterity";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_DEXELIXIER;
	visual = "ItPo_Perm_DEX.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_dex;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEXELIXIER;
};


func void useitpo_perm_dex()
{
	b_raiseattribute(self,ATR_DEXTERITY,DEX_ELIXIER);
};


instance ITPO_PERM_HEALTH(C_ITEM)
{
	name = "Elixir of life";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPMAXELIXIER;
	visual = "ItPo_Perm_Health.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_health;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPMAXELIXIER;
};


func void useitpo_perm_health()
{
	b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_ELIXIER);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_ELIXIER);
};


instance ITPO_PERM_MANA(C_ITEM)
{
	name = "Elixir of spirit";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAMAXELIXIER;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_mana;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAMAXELIXIER;
};


func void useitpo_perm_mana()
{
	b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_ELIXIER);
	Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_ELIXIER);
};


instance ITPO_PERM_MUSHROOMMP(C_ITEM)
{
	name = "Elixir of dark mushrooms";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOMMP;
	visual = "ItPo_MushroomMP_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mushroommp;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MUSHROOMMP;
};


func void useitpo_mushroommp()
{
	b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_ELIXIER);
	Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_ELIXIER);
};


instance ITPO_SPEED(C_ITEM)
{
	name = "Potion of speed";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_SPEED;
	visual = "ItPo_Speed.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_speed;
	scemename = "POTIONFAST";
	description = name;
	text[1] = "Temporarily increases the speed";
	text[3] = "Duration - 80 seconds";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_speed()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_SPEED);
};


instance ITPO_MEGADRINK(C_ITEM)
{
	name = "Embarla Firgasto";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MEGADRINK;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_megadrink;
	scemename = "POTIONFAST";
	description = name;
	text[3] = "Effects unknown.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_megadrink()
{
	if(self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
	{
		b_raiseattribute(self,ATR_DEXTERITY,STRORDEX_MEGADRINK);
	}
	else
	{
		b_raiseattribute(self,ATR_STRENGTH,STRORDEX_MEGADRINK);
	};
	Npc_ChangeAttribute(self,ATR_MANA,-ATR_MANA);
	Snd_Play("DEM_Warn");
};

