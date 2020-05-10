
const int VALUE_ITAM_ADDON_FRANCO = 1200;
const int HP_ITAM_ADDON_FRANCO = 40;
const int STR_FRANCO = 4;
const int DEX_FRANCO = 4;
const int VALUE_ITRI_ADDON_HEALTH_01 = 400;
const int VALUE_ITAM_ADDON_HEALTH = 800;
const int VALUE_ITRI_ADDON_MANA_01 = 1000;
const int VALUE_ITAM_ADDON_MANA = 2000;
const int VALUE_ITRI_ADDON_STR_01 = 500;
const int VALUE_ITAM_ADDON_STR = 1000;
const int HP_RING_SOLO_BONUS = 20;
const int HP_RING_DOUBLE_BONUS = 60;
const int HP_AMULETT_SOLO_BONUS = 40;
const int HP_AMULETT_EINRING_BONUS = 80;
const int HP_AMULETT_ARTEFAKT_BONUS = 160;
const int MA_RING_SOLO_BONUS = 5;
const int MA_RING_DOUBLE_BONUS = 15;
const int MA_AMULETT_SOLO_BONUS = 10;
const int MA_AMULETT_EINRING_BONUS = 20;
const int MA_AMULETT_ARTEFAKT_BONUS = 40;
const int STR_RING_SOLO_BONUS = 5;
const int STR_RING_DOUBLE_BONUS = 15;
const int STR_AMULETT_SOLO_BONUS = 10;
const int STR_AMULETT_EINRING_BONUS = 20;
const int STR_AMULETT_ARTEFAKT_BONUS = 40;

instance ITAM_ADDON_FRANCO(C_ITEM)
{
	name = "Franco's amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_franco;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_franco;
	on_unequip = unequip_itam_addon_franco;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = STR_FRANCO;
	text[3] = NAME_BONUS_DEX;
	count[3] = DEX_FRANCO;
	text[4] = NAME_BONUS_HP;
	count[4] = hp_itam_addon_franco;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_franco()
{
	self.attribute[ATR_STRENGTH] += STR_FRANCO;
	self.attribute[ATR_DEXTERITY] += DEX_FRANCO;
	self.attribute[ATR_HITPOINTS_MAX] += HP_ITAM_ADDON_FRANCO;
	self.attribute[ATR_HITPOINTS] += HP_ITAM_ADDON_FRANCO;
};

func void unequip_itam_addon_franco()
{
	self.attribute[ATR_STRENGTH] -= STR_FRANCO;
	self.attribute[ATR_DEXTERITY] -= DEX_FRANCO;
	self.attribute[ATR_HITPOINTS_MAX] -= HP_ITAM_ADDON_FRANCO;
	if(self.attribute[ATR_HITPOINTS] > (HP_ITAM_ADDON_FRANCO + 2))
	{
		self.attribute[ATR_HITPOINTS] -= HP_ITAM_ADDON_FRANCO;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_ADDON_HEALTH(C_ITEM)
{
	name = "Amulet of the Healers";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_health;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_health;
	on_unequip = unequip_itam_addon_health;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = HP_AMULETT_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_health()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_AMULETT_EQUIPPED = TRUE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};

func void unequip_itam_addon_health()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_AMULETT_EQUIPPED = FALSE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_HEALTH_01(C_ITEM)
{
	name = "Ring of the Healers";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = value_itri_addon_health_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_health_01;
	on_unequip = unequip_itri_addon_health_01;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = HP_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_health_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_1_EQUIPPED = TRUE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_health_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_1_EQUIPPED = FALSE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_HEALTH_02(C_ITEM)
{
	name = "Ring of the Healers";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_ITRI_ADDON_HEALTH_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_health_02;
	on_unequip = unequip_itri_addon_health_02;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = HP_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_health_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_2_EQUIPPED = TRUE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_health_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_hp_artefaktvalue();
	HP_RING_2_EQUIPPED = FALSE;
	newvalue = c_hp_artefaktvalue();
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + (newvalue - oldvalue);
};


instance ITAM_ADDON_MANA(C_ITEM)
{
	name = "Amulet of the Priests";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_mana;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_mana;
	on_unequip = unequip_itam_addon_mana;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = MA_AMULETT_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_mana()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_AMULETT_EQUIPPED = TRUE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};

func void unequip_itam_addon_mana()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_AMULETT_EQUIPPED = FALSE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_MANA_01(C_ITEM)
{
	name = "Ring of the Priests";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = value_itri_addon_mana_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_mana_01;
	on_unequip = unequip_itri_addon_mana_01;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = MA_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_mana_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_1_EQUIPPED = TRUE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_mana_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_1_EQUIPPED = FALSE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};


instance ITRI_ADDON_MANA_02(C_ITEM)
{
	name = "Ring of the Priests";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_ITRI_ADDON_MANA_01;
	visual = "ItRi_Prot_Total_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_mana_02;
	on_unequip = unequip_itri_addon_mana_02;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = MA_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_mana_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_2_EQUIPPED = TRUE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};

func void unequip_itri_addon_mana_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_ma_artefaktvalue();
	MA_RING_2_EQUIPPED = FALSE;
	newvalue = c_ma_artefaktvalue();
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + (newvalue - oldvalue);
};


instance ITAM_ADDON_STR(C_ITEM)
{
	name = "Amulet of the Warriors";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = value_itam_addon_str;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_addon_str;
	on_unequip = unequip_itam_addon_str;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = STR_AMULETT_SOLO_BONUS;
	text[2] = NAME_PROT_BLUNT;
	count[2] = STR_AMULETT_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_addon_str()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_AMULETT_EQUIPPED = TRUE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
	STAT_SWORDDEF = STAT_SWORDDEF + ((newvalue - oldvalue) * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_itam_addon_str()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_AMULETT_EQUIPPED = FALSE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
	STAT_SWORDDEF = STAT_SWORDDEF + ((newvalue - oldvalue) * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITRI_ADDON_STR_01(C_ITEM)
{
	name = "Ring of the Warriors";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = value_itri_addon_str_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_str_01;
	on_unequip = unequip_itri_addon_str_01;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = STR_RING_SOLO_BONUS;
	text[2] = NAME_PROT_BLUNT;
	count[2] = STR_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_str_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_1_EQUIPPED = TRUE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
	STAT_SWORDDEF = STAT_SWORDDEF + ((newvalue - oldvalue) * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_itri_addon_str_01()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_1_EQUIPPED = FALSE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
	STAT_SWORDDEF = STAT_SWORDDEF + ((newvalue - oldvalue) * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITRI_ADDON_STR_02(C_ITEM)
{
	name = "Ring of the Warriors";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_ITRI_ADDON_STR_01;
	visual = "ItRi_Prot_Total_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_addon_str_02;
	on_unequip = unequip_itri_addon_str_02;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = STR_RING_SOLO_BONUS;
	text[2] = NAME_PROT_BLUNT;
	count[2] = STR_RING_SOLO_BONUS;
	text[3] = PRINT_ADDON_KUMU_01;
	text[4] = PRINT_ADDON_KUMU_02;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_addon_str_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_2_EQUIPPED = TRUE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
	STAT_SWORDDEF = STAT_SWORDDEF + ((newvalue - oldvalue) * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_itri_addon_str_02()
{
	var int oldvalue;
	var int newvalue;
	oldvalue = c_str_artefaktvalue();
	STR_RING_2_EQUIPPED = FALSE;
	newvalue = c_str_artefaktvalue();
	self.protection[PROT_EDGE] += newvalue - oldvalue;
	self.protection[PROT_BLUNT] += newvalue - oldvalue;
	STAT_SWORDDEF = STAT_SWORDDEF + ((newvalue - oldvalue) * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITRI_ENCHSTR_01(C_ITEM)
{
	name = "Ring of lower fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 350;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchstr_01;
	on_unequip = unequip_enchstr_01;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchstr_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,4);
};

func void unequip_enchstr_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-4);
};


instance ITRI_ENCHSTR_02(C_ITEM)
{
	name = "Ring of fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 650;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchstr_02;
	on_unequip = unequip_enchstr_02;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchstr_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,7);
};

func void unequip_enchstr_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-7);
};


instance ITRI_ENCHSTR_03(C_ITEM)
{
	name = "Ring of major fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 950;
	visual = "ItRi_Str_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchstr_03;
	on_unequip = unequip_enchstr_03;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchstr_03()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
};

func void unequip_enchstr_03()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
};


instance ITAM_ENCHSTRG_01(C_ITEM)
{
	name = "Amulet of lower fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 500;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchstrg_01;
	on_unequip = unequip_itam_enchstrg_01;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchstrg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,5);
};

func void unequip_itam_enchstrg_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
};


instance ITAM_ENCHSTRG_02(C_ITEM)
{
	name = "Amulet of fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchstrg_02;
	on_unequip = unequip_itam_enchstrg_02;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchstrg_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
};

func void unequip_itam_enchstrg_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
};


instance ITAM_ENCHSTRG_03(C_ITEM)
{
	name = "Amulet of major fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1500;
	visual = "ItAm_Strg_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchstrg_03;
	on_unequip = unequip_itam_enchstrg_03;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchstrg_03()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,15);
};

func void unequip_itam_enchstrg_03()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-15);
};


instance ITBE_ADDONENCHSTR_01(C_ITEM)
{
	name = "Belt of lower fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 500;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addonenchstr_01;
	on_unequip = unequip_itbe_addonenchstr_01;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addonenchstr_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,5);
};

func void unequip_itbe_addonenchstr_01()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-5);
};


instance ITBE_ADDONENCHSTR_02(C_ITEM)
{
	name = "Belt of fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 1000;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addonenchstr_02;
	on_unequip = unequip_itbe_addonenchstr_02;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addonenchstr_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,10);
};

func void unequip_itbe_addonenchstr_02()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
};


instance ITBE_ADDONENCHSTR_03(C_ITEM)
{
	name = "Belt of major fortitude";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 1500;
	visual = "ItMi_Belt_08.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addonenchstr_03;
	on_unequip = unequip_itbe_addonenchstr_03;
	description = name;
	text[2] = NAME_BONUS_STR;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addonenchstr_03()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,15);
};

func void unequip_itbe_addonenchstr_03()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-15);
};


instance ITRI_ENCHDEX_01(C_ITEM)
{
	name = "Ring of lower agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 350;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchdex_01;
	on_unequip = unequip_enchdex_01;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchdex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,4);
};

func void unequip_enchdex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-4);
};


instance ITRI_ENCHDEX_02(C_ITEM)
{
	name = "Ring of agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 650;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchdex_02;
	on_unequip = unequip_enchdex_02;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchdex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,7);
};

func void unequip_enchdex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-7);
};


instance ITRI_ENCHDEX_03(C_ITEM)
{
	name = "Ring of major agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 950;
	visual = "ItRi_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchdex_03;
	on_unequip = unequip_enchdex_03;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchdex_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_enchdex_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance ITAM_ENCHDEXR_01(C_ITEM)
{
	name = "Amulet of lower agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 500;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchdexr_01;
	on_unequip = unequip_itam_enchdexr_01;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchdexr_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void unequip_itam_enchdexr_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};


instance ITAM_ENCHDEXR_02(C_ITEM)
{
	name = "Amulet of agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchdexr_02;
	on_unequip = unequip_itam_enchdexr_02;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchdexr_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_itam_enchdexr_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance ITAM_ENCHDEXR_03(C_ITEM)
{
	name = "Amulet of major agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1500;
	visual = "ItAm_Dex_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchdexr_03;
	on_unequip = unequip_itam_enchdexr_03;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchdexr_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,15);
};

func void unequip_itam_enchdexr_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-15);
};


instance ITBE_ADDONENCHDEX_01(C_ITEM)
{
	name = "Belt of lower agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 500;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addonenchdex_01;
	on_unequip = unequip_itbe_addonenchdex_01;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addonenchdex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
};

func void unequip_itbe_addonenchdex_01()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-5);
};


instance ITBE_ADDONENCHDEX_02(C_ITEM)
{
	name = "Belt of agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 1000;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addonenchdex_02;
	on_unequip = unequip_itbe_addonenchdex_02;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addonenchdex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_itbe_addonenchdex_02()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance ITBE_ADDONENCHDEX_03(C_ITEM)
{
	name = "Belt of major agility";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_BELT | ITEM_MULTI;
	value = 1500;
	visual = "ItMi_Belt_05.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itbe_addonenchdex_03;
	on_unequip = unequip_itbe_addonenchdex_03;
	description = name;
	text[2] = NAME_BONUS_DEX;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
	inv_rotx = INVCAM_ENTF_MISC2_STANDARD;
};


func void equip_itbe_addonenchdex_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,15);
};

func void unequip_itbe_addonenchdex_03()
{
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-15);
};


instance ITRI_ENCHHP_01(C_ITEM)
{
	name = "Ring of lower vitality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 350;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_enchhp_01;
	on_unequip = unequip_itri_enchhp_01;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = 25;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_enchhp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 25;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 25;
};

func void unequip_itri_enchhp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
	if(self.attribute[ATR_HITPOINTS] > (25 + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITRI_ENCHHP_02(C_ITEM)
{
	name = "Ring of vitality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 550;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_enchhp_02;
	on_unequip = unequip_itri_enchhp_02;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = 50;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_enchhp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 50;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 50;
};

func void unequip_itri_enchhp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 50;
	if(self.attribute[ATR_HITPOINTS] > (50 + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 50;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITRI_ENCHHP_03(C_ITEM)
{
	name = "Ring of major vitality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 750;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_enchhp_03;
	on_unequip = unequip_itri_enchhp_03;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = 75;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_enchhp_03()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 75;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 75;
};

func void unequip_itri_enchhp_03()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 75;
	if(self.attribute[ATR_HITPOINTS] > (75 + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 75;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_ENCHHTP_01(C_ITEM)
{
	name = "Amulet of lower vitality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 550;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchhtp_01;
	on_unequip = unequip_itam_enchhtp_01;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = 50;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchhtp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 50;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 50;
};

func void unequip_itam_enchhtp_01()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 50;
	if(self.attribute[ATR_HITPOINTS] > (50 + 2))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 50;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_ENCHHTP_02(C_ITEM)
{
	name = "Amulet of vitality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 850;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchhtp_02;
	on_unequip = unequip_itam_enchhtp_02;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = 100;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchhtp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 100;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 100;
};

func void unequip_itam_enchhtp_02()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 100;
	if(self.attribute[ATR_HITPOINTS] > (100 + 2))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 100;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITAM_ENCHHTP_03(C_ITEM)
{
	name = "Amulet of major vitality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1150;
	visual = "ItAm_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchhtp_03;
	on_unequip = unequip_itam_enchhtp_03;
	description = name;
	text[2] = NAME_BONUS_HP;
	count[2] = 150;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchhtp_03()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 150;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 150;
};

func void unequip_itam_enchhtp_03()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 150;
	if(self.attribute[ATR_HITPOINTS] > (150 + 2))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 150;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};


instance ITRI_ENCHMANA_01(C_ITEM)
{
	name = "Ring of lower energy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 500;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_enchmana_01;
	on_unequip = unequip_itri_enchmana_01;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_enchmana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 5;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 5;
};

func void unequip_itri_enchmana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 5;
	if(self.attribute[ATR_MANA] >= 5)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 5;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITRI_ENCHMANA_02(C_ITEM)
{
	name = "Ring of energy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 750;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_enchmana_02;
	on_unequip = unequip_itri_enchmana_02;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_enchmana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
};

func void unequip_itri_enchmana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	if(self.attribute[ATR_MANA] >= 10)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITRI_ENCHMANA_03(C_ITEM)
{
	name = "Ring of major energy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 1000;
	visual = "ItRi_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_enchmana_03;
	on_unequip = unequip_itri_enchmana_03;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = 15;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_enchmana_03()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 15;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 15;
};

func void unequip_itri_enchmana_03()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 15;
	if(self.attribute[ATR_MANA] >= 15)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 15;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITAM_ENCHNTMANA_01(C_ITEM)
{
	name = "Amulet of lower energy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchntmana_01;
	on_unequip = unequip_itam_enchntmana_01;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchntmana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
};

func void unequip_itam_enchntmana_01()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	if(self.attribute[ATR_MANA] > 10)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITAM_ENCHNTMANA_02(C_ITEM)
{
	name = "Amulet of energy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1750;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchntmana_02;
	on_unequip = unequip_itam_enchntmana_02;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = 20;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchntmana_02()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 20;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 20;
};

func void unequip_itam_enchntmana_02()
{
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


instance ITAM_ENCHNTMANA_03(C_ITEM)
{
	name = "Amulet of major energy";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 2500;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_enchntmana_03;
	on_unequip = unequip_itam_enchntmana_03;
	description = name;
	text[2] = NAME_BONUS_MANA;
	count[2] = 30;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_enchntmana_03()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 30;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 30;
};

func void unequip_itam_enchntmana_03()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 30;
	if(self.attribute[ATR_MANA] > 30)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 30;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITRI_ADDON_ENCH1H_01(C_ITEM)
{
	name = "Ring of one-handed beginner";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_01.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench1h_01;
	on_unequip = unequip_addon_ench1h_01;
	description = name;
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench1h_01()
{
	self.hitchance[NPC_TALENT_1H] += 4;
	b_addfightskill(self,NPC_TALENT_1H,4);
};

func void unequip_addon_ench1h_01()
{
	self.hitchance[NPC_TALENT_1H] -= 4;
	b_addfightskill(self,NPC_TALENT_1H,-4);
};


instance ITRI_ADDON_ENCH1H_02(C_ITEM)
{
	name = "Ring of one-handed warrior";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Prot_Total_01.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench1h_02;
	on_unequip = unequip_addon_ench1h_02;
	description = name;
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench1h_02()
{
	self.hitchance[NPC_TALENT_1H] += 7;
	b_addfightskill(self,NPC_TALENT_1H,7);
};

func void unequip_addon_ench1h_02()
{
	self.hitchance[NPC_TALENT_1H] -= 7;
	b_addfightskill(self,NPC_TALENT_1H,-7);
};


instance ITRI_ADDON_ENCH1H_03(C_ITEM)
{
	name = "Ring of one-handed master";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1500;
	visual = "ItRi_Prot_Total_01.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench1h_03;
	on_unequip = unequip_addon_ench1h_03;
	description = name;
	text[2] = NAME_ADDON_BONUS_1H;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench1h_03()
{
	self.hitchance[NPC_TALENT_1H] += 10;
	b_addfightskill(self,NPC_TALENT_1H,0);
};

func void unequip_addon_ench1h_03()
{
	self.hitchance[NPC_TALENT_1H] -= 10;
	b_addfightskill(self,NPC_TALENT_1H,0);
};


instance ITRI_ADDON_ENCH2H_01(C_ITEM)
{
	name = "Ring of two-handed beginner";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench2h_01;
	on_unequip = unequip_addon_ench2h_01;
	description = name;
	text[2] = NAME_ADDON_BONUS_2H;
	count[2] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench2h_01()
{
	self.hitchance[NPC_TALENT_2H] += 4;
	b_addfightskill(self,NPC_TALENT_2H,0);
};

func void unequip_addon_ench2h_01()
{
	self.hitchance[NPC_TALENT_2H] -= 4;
	b_addfightskill(self,NPC_TALENT_2H,0);
};


instance ITRI_ADDON_ENCH2H_02(C_ITEM)
{
	name = "Ring of two-handed warrior";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench2h_02;
	on_unequip = unequip_addon_ench2h_02;
	description = name;
	text[2] = NAME_ADDON_BONUS_2H;
	count[2] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench2h_02()
{
	self.hitchance[NPC_TALENT_2H] += 7;
	b_addfightskill(self,NPC_TALENT_2H,0);
};

func void unequip_addon_ench2h_02()
{
	self.hitchance[NPC_TALENT_2H] -= 7;
	b_addfightskill(self,NPC_TALENT_2H,0);
};


instance ITRI_ADDON_ENCH2H_03(C_ITEM)
{
	name = "Ring of two-handed master";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench2h_03;
	on_unequip = unequip_addon_ench2h_03;
	description = name;
	text[2] = NAME_ADDON_BONUS_2H;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench2h_03()
{
	self.hitchance[NPC_TALENT_2H] += 10;
	b_addfightskill(self,NPC_TALENT_2H,0);
};

func void unequip_addon_ench2h_03()
{
	self.hitchance[NPC_TALENT_2H] -= 10;
	b_addfightskill(self,NPC_TALENT_2H,0);
};


instance ITRI_ADDON_ENCHBOWS_01(C_ITEM)
{
	name = "Ring of beginner hunter";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 400;
	visual = "ItRi_Prot_Total_01.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_enchbows_01;
	on_unequip = unequip_addon_enchbows_01;
	description = name;
	text[2] = NAME_ADDON_BONUS_BOWS;
	count[2] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_enchbows_01()
{
	self.hitchance[NPC_TALENT_BOW] += 3;
	b_addfightskill(self,NPC_TALENT_BOW,0);
};

func void unequip_addon_enchbows_01()
{
	self.hitchance[NPC_TALENT_BOW] -= 3;
	b_addfightskill(self,NPC_TALENT_BOW,0);
};


instance ITRI_ADDON_ENCHBOWS_02(C_ITEM)
{
	name = "Ring of skilled hunter";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 700;
	visual = "ItRi_Prot_Total_01.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_enchbows_02;
	on_unequip = unequip_addon_enchbows_02;
	description = name;
	text[2] = NAME_ADDON_BONUS_BOWS;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_enchbows_02()
{
	self.hitchance[NPC_TALENT_BOW] += 5;
	b_addfightskill(self,NPC_TALENT_BOW,0);
};

func void unequip_addon_enchbows_02()
{
	self.hitchance[NPC_TALENT_BOW] -= 5;
	b_addfightskill(self,NPC_TALENT_BOW,0);
};


instance ITRI_ADDON_ENCHBOWS_03(C_ITEM)
{
	name = "Ring of master hunter";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Prot_Total_01.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_enchbows_03;
	on_unequip = unequip_addon_enchbows_03;
	description = name;
	text[2] = NAME_ADDON_BONUS_BOWS;
	count[2] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_enchbows_03()
{
	self.hitchance[NPC_TALENT_BOW] += 7;
	b_addfightskill(self,NPC_TALENT_BOW,0);
};

func void unequip_addon_enchbows_03()
{
	self.hitchance[NPC_TALENT_BOW] -= 7;
	b_addfightskill(self,NPC_TALENT_BOW,0);
};


instance ITRI_ADDON_ENCH_B_01(C_ITEM)
{
	name = "Ring of beginner crossbowman";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 400;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench_b_01;
	on_unequip = unequip_addon_ench_b_01;
	description = name;
	text[2] = NAME_ADDON_BONUS_CROSSBOWS;
	count[2] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench_b_01()
{
	self.hitchance[NPC_TALENT_CROSSBOW] += 3;
	b_addfightskill(self,NPC_TALENT_CROSSBOW,0);
};

func void unequip_addon_ench_b_01()
{
	self.hitchance[NPC_TALENT_CROSSBOW] -= 3;
	b_addfightskill(self,NPC_TALENT_CROSSBOW,0);
};


instance ITRI_ADDON_ENCH_B_02(C_ITEM)
{
	name = "Ring of skilled crossbowman";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 700;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench_b_02;
	on_unequip = unequip_addon_ench_b_02;
	description = name;
	text[2] = NAME_ADDON_BONUS_CROSSBOWS;
	count[2] = 5;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench_b_02()
{
	self.hitchance[NPC_TALENT_CROSSBOW] += 5;
	b_addfightskill(self,NPC_TALENT_CROSSBOW,0);
};

func void unequip_addon_ench_b_02()
{
	self.hitchance[NPC_TALENT_CROSSBOW] -= 5;
	b_addfightskill(self,NPC_TALENT_CROSSBOW,0);
};


instance ITRI_ADDON_ENCH_B_03(C_ITEM)
{
	name = "Ring of master crossbowman";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_addon_ench_b_03;
	on_unequip = unequip_addon_ench_b_03;
	description = name;
	text[2] = NAME_ADDON_BONUS_CROSSBOWS;
	count[2] = 7;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_addon_ench_b_03()
{
	self.hitchance[NPC_TALENT_CROSSBOW] += 7;
	b_addfightskill(self,NPC_TALENT_CROSSBOW,0);
};

func void unequip_addon_ench_b_03()
{
	self.hitchance[NPC_TALENT_CROSSBOW] -= 7;
	b_addfightskill(self,NPC_TALENT_CROSSBOW,0);
};


instance ITRI_ENCHUNIDEF_01(C_ITEM)
{
	name = "Ring of audacity";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 1000;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_enchunidef_01;
	on_unequip = unequip_enchunidef_01;
	description = name;
	text[2] = NAME_ADDON_BONUS_UNIDEF;
	count[2] = 2;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchunidef_01()
{
	self.protection[PROT_EDGE] += 2;
	self.protection[PROT_BLUNT] += 2;
	self.protection[PROT_POINT] += 2;
	self.protection[PROT_FIRE] += 2;
	self.protection[PROT_MAGIC] += 2;
	STAT_SWORDDEF = STAT_SWORDDEF + (2 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_enchunidef_01()
{
	self.protection[PROT_EDGE] -= 2;
	self.protection[PROT_BLUNT] -= 2;
	self.protection[PROT_POINT] -= 2;
	self.protection[PROT_FIRE] -= 2;
	self.protection[PROT_MAGIC] -= 2;
	STAT_SWORDDEF = STAT_SWORDDEF - (2 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITRI_ENCHUNIDEF_02(C_ITEM)
{
	name = "Ring of endurance";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 2000;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_enchunidef_02;
	on_unequip = unequip_enchunidef_02;
	description = name;
	text[2] = NAME_ADDON_BONUS_UNIDEF;
	count[2] = 4;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchunidef_02()
{
	self.protection[PROT_EDGE] += 4;
	self.protection[PROT_BLUNT] += 4;
	self.protection[PROT_POINT] += 4;
	self.protection[PROT_FIRE] += 4;
	self.protection[PROT_MAGIC] += 4;
	STAT_SWORDDEF = STAT_SWORDDEF + (4 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_enchunidef_02()
{
	self.protection[PROT_EDGE] -= 4;
	self.protection[PROT_BLUNT] -= 4;
	self.protection[PROT_POINT] -= 4;
	self.protection[PROT_FIRE] -= 4;
	self.protection[PROT_MAGIC] -= 4;
	STAT_SWORDDEF = STAT_SWORDDEF - (4 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITRI_ENCHUNIDEF_03(C_ITEM)
{
	name = "Ring of immortality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 3000;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = equip_enchunidef_03;
	on_unequip = unequip_enchunidef_03;
	description = name;
	text[2] = NAME_ADDON_BONUS_UNIDEF;
	count[2] = 6;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchunidef_03()
{
	self.protection[PROT_EDGE] += 6;
	self.protection[PROT_BLUNT] += 6;
	self.protection[PROT_POINT] += 6;
	self.protection[PROT_FIRE] += 6;
	self.protection[PROT_MAGIC] += 6;
	STAT_SWORDDEF = STAT_SWORDDEF + (6 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_enchunidef_03()
{
	self.protection[PROT_EDGE] -= 6;
	self.protection[PROT_BLUNT] -= 6;
	self.protection[PROT_POINT] -= 6;
	self.protection[PROT_FIRE] -= 6;
	self.protection[PROT_MAGIC] -= 6;
	STAT_SWORDDEF = STAT_SWORDDEF - (6 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITAM_ENCHNTUNIDEF_01(C_ITEM)
{
	name = "Amulet of audacity";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1200;
	visual = "ItMi_SilverNecklace.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchntunidef_01;
	on_unequip = unequip_enchntunidef_01;
	description = name;
	text[2] = NAME_ADDON_BONUS_UNIDEF;
	count[2] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_enchntunidef_01()
{
	self.protection[PROT_EDGE] += 3;
	self.protection[PROT_BLUNT] += 3;
	self.protection[PROT_POINT] += 3;
	self.protection[PROT_FIRE] += 3;
	self.protection[PROT_MAGIC] += 3;
	STAT_SWORDDEF = STAT_SWORDDEF + (3 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_enchntunidef_01()
{
	self.protection[PROT_EDGE] -= 3;
	self.protection[PROT_BLUNT] -= 3;
	self.protection[PROT_POINT] -= 3;
	self.protection[PROT_FIRE] -= 3;
	self.protection[PROT_MAGIC] -= 3;
	STAT_SWORDDEF = STAT_SWORDDEF - (3 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITAM_ENCHNTUNIDEF_02(C_ITEM)
{
	name = "Amulet of endurance";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 2400;
	visual = "ItMi_SilverNecklace.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchntunidef_02;
	on_unequip = unequip_enchntunidef_02;
	description = name;
	text[2] = NAME_ADDON_BONUS_UNIDEF;
	count[2] = 6;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_enchntunidef_02()
{
	self.protection[PROT_EDGE] += 6;
	self.protection[PROT_BLUNT] += 6;
	self.protection[PROT_POINT] += 6;
	self.protection[PROT_FIRE] += 6;
	self.protection[PROT_MAGIC] += 6;
	STAT_SWORDDEF = STAT_SWORDDEF + (6 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_enchntunidef_02()
{
	self.protection[PROT_EDGE] -= 6;
	self.protection[PROT_BLUNT] -= 6;
	self.protection[PROT_POINT] -= 6;
	self.protection[PROT_FIRE] -= 6;
	self.protection[PROT_MAGIC] -= 6;
	STAT_SWORDDEF = STAT_SWORDDEF - (6 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITAM_ENCHNTUNIDEF_03(C_ITEM)
{
	name = "Amulet of immortality";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 3600;
	visual = "ItMi_SilverNecklace.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchntunidef_03;
	on_unequip = unequip_enchntunidef_03;
	description = name;
	text[2] = NAME_ADDON_BONUS_UNIDEF;
	count[2] = 9;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_enchntunidef_03()
{
	self.protection[PROT_EDGE] += 9;
	self.protection[PROT_BLUNT] += 9;
	self.protection[PROT_POINT] += 9;
	self.protection[PROT_FIRE] += 9;
	self.protection[PROT_MAGIC] += 9;
	STAT_SWORDDEF = STAT_SWORDDEF + (9 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_enchntunidef_03()
{
	self.protection[PROT_EDGE] -= 9;
	self.protection[PROT_BLUNT] -= 9;
	self.protection[PROT_POINT] -= 9;
	self.protection[PROT_FIRE] -= 9;
	self.protection[PROT_MAGIC] -= 9;
	STAT_SWORDDEF = STAT_SWORDDEF - (9 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITRI_ENCHREGHP_01(C_ITEM)
{
	name = "Ring of body regeneration";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 2750;
	visual = "ItMi_SilverRing.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchreghp_01;
	on_unequip = unequip_enchreghp_01;
	description = name;
	text[2] = NAME_BONUS_ENCHREGHP;
	count[2] = 1;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchreghp_01()
{
	if(Npc_IsPlayer(self))
	{
		PASSIVE_ENCHHP += 1;
	};
};

func void unequip_enchreghp_01()
{
	if(Npc_IsPlayer(self))
	{
		PASSIVE_ENCHHP -= 1;
	};
};


instance ITRI_ENCHREGMP_01(C_ITEM)
{
	name = "Ring of mental restoration";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 2750;
	visual = "ItMi_SilverRing.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_enchregmp_01;
	on_unequip = unequip_enchregmp_01;
	description = name;
	text[2] = NAME_BONUS_ENCHREGMP;
	count[2] = 1;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_enchregmp_01()
{
	if(Npc_IsPlayer(self))
	{
		PASSIVE_ENCHMP += 1;
	};
};

func void unequip_enchregmp_01()
{
	if(Npc_IsPlayer(self))
	{
		PASSIVE_ENCHMP -= 1;
	};
};

