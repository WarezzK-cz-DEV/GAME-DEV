
const int VALUE_ITAR_GOVERNOR = 1100;
const int VALUE_ITAR_JUDGE = 0;
const int VALUE_ITAR_SMITH = 0;
const int VALUE_ITAR_BARKEEPER = 0;
const int VALUE_ITAR_VLK_L = 120;
const int VALUE_ITAR_VLK_M = 120;
const int VALUE_ITAR_VLK_H = 120;
const int VALUE_ITAR_VLKBABE_L = 0;
const int VALUE_ITAR_VLKBABE_M = 0;
const int VALUE_ITAR_VLKBABE_H = 0;
const int VALUE_ITAR_MIL_L = 600;
const int VALUE_ITAR_MIL_M = 1800;
const int VALUE_ITAR_PAL_M = 5000;
const int VALUE_ITAR_PAL_H = 20000;
const int VALUE_ITAR_BAU_L = 80;
const int VALUE_ITAR_BAU_M = 100;
const int VALUE_ITAR_BAUBABE_L = 0;
const int VALUE_ITAR_BAUBABE_M = 0;
const int VALUE_ITAR_SLD_L = 500;
const int VALUE_ITAR_SLD_M = 750;
const int VALUE_ITAR_DJG_CRAWLER = 1500;
const int VALUE_ITAR_SLD_H = 2200;
const int VALUE_ITAR_NOV_L = 280;
const int VALUE_ITAR_KDF_L = 500;
const int VALUE_ITAR_KDF_H = 3000;
const int VALUE_ITAR_LEATHER_L = 250;
const int VALUE_ITAR_BDT_M = 550;
const int VALUE_ITAR_BDT_H = 2100;
const int VALUE_ITAR_DJG_L = 3000;
const int VALUE_ITAR_DJG_M = 12000;
const int VALUE_ITAR_DJG_H = 20000;
const int VALUE_ITAR_XARDAS = 15000;
const int VALUE_ITAR_LESTER = 300;
const int VALUE_ITAR_DIEGO = 450;
const int VALUE_ITAR_CORANGAR = 600;
const int VALUE_ITAR_DEMENTOR = 500;
const int VALUE_ITAR_KDW_H = 3200;
const int VALUE_ITAR_PRISONER = 10;
const int VALUE_ITAR_OLDCAMP_GUARD_L = 2700;
const int VALUE_ITAR_OLDCAMP_GUARD_M = 3200;
const int VALUE_ITAR_OLDCAMP_GUARD_H = 1300;

instance ITAR_GOVERNOR(C_ITEM)
{
	name = "Governor's doublet";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_governor;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3ds";
	visual_change = "Armor_Governor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_governor;
	on_unequip = unequip_governor;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_governor()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (20 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_governor()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (20 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_JUDGE(C_ITEM)
{
	name = "Judge's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_judge;
	wear = WEAR_TORSO;
	visual = "ItAr_Governor.3DS";
	visual_change = "Armor_Judge.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_judge;
	on_unequip = unequip_judge;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
};


func void equip_judge()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_judge()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SMITH(C_ITEM)
{
	name = "Smith's apron";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 15;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = value_itar_smith;
	wear = WEAR_TORSO;
	visual = "ItAr_Smith.3DS";
	visual_change = "Armor_Smith.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_smith;
	on_unequip = unequip_smith;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
};


func void equip_smith()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (15 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_smith()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (15 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_BARKEEPER(C_ITEM)
{
	name = "Barkeeper's apron";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_barkeeper;
	wear = WEAR_TORSO;
	visual = "ItAr_Wirt.3DS";
	visual_change = "Armor_Barkeeper.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_barkeeper;
	on_unequip = unequip_barkeeper;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
};


func void equip_barkeeper()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_barkeeper()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_VLK_L(C_ITEM)
{
	name = "Citizen's clothing";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlk_l;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_L.3DS";
	visual_change = "Armor_Vlk_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_vlk_l;
	on_unequip = unequip_vlk_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_vlk_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_vlk_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_VLK_M(C_ITEM)
{
	name = "Merchant's clothing";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlk_m;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_M.3DS";
	visual_change = "Armor_Vlk_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_vlk_m;
	on_unequip = unequip_vlk_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_vlk_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_vlk_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_VLK_H(C_ITEM)
{
	name = "Wealthy citizen's clothing";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlk_h;
	wear = WEAR_TORSO;
	visual = "ItAr_VLK_H.3DS";
	visual_change = "Armor_Vlk_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_vlk_h;
	on_unequip = unequip_vlk_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_vlk_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_vlk_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_VLKBABE_L(C_ITEM)
{
	name = "Citizen's clothing (Female)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlkbabe_l;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_vlkbabe_l;
	on_unequip = unequip_vlkbabe_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_vlkbabe_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_vlkbabe_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_VLKBABE_M(C_ITEM)
{
	name = "Merchant clothing (Female)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlkbabe_m;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_vlkbabe_m;
	on_unequip = unequip_vlkbabe_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_vlkbabe_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_vlkbabe_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_VLKBABE_H(C_ITEM)
{
	name = "Wealthy citizen's clothing (Female)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_vlkbabe_h;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_VlkBabe_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_vlkbabe_h;
	on_unequip = unequip_vlkbabe_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_vlkbabe_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_vlkbabe_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_MIL_L(C_ITEM)
{
	name = "Light militia armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_mil_l;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_L.3DS";
	visual_change = "Armor_Mil_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_mil_l;
	on_unequip = unequip_itar_mil_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_mil_l()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (30 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_mil_l()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (30 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_MIL_M(C_ITEM)
{
	name = "Heavy militia armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_mil_m;
	wear = WEAR_TORSO;
	visual = "ItAr_MIL_M.3DS";
	visual_change = "Armor_MIL_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_mil_m;
	on_unequip = unequip_itar_mil_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_mil_m()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (55 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_mil_m()
{
	if(Npc_IsPlayer(self))
	{
		MILARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (55 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(MIL01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_PAL_M(C_ITEM)
{
	name = "Knight's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 30;
	value = value_itar_pal_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_M.3ds";
	visual_change = "Armor_Pal_M.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_pal_m;
	on_unequip = unequip_pal_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_pal_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_pal_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_PAL_H(C_ITEM)
{
	name = "Paladin's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 75;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	value = value_itar_pal_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_H.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_pal_h;
	on_unequip = unequip_pal_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_pal_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (100 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_pal_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (100 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_PAL_HLC(C_ITEM)
{
	name = "Lord's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 40;
	value = VALUE_ITAR_PAL_H;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "ARMOR_PAL_HLC.asc";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_pal_hlc;
	on_unequip = unequip_pal_hlc;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_pal_hlc()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_pal_hlc()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT(C_ITEM)
{
	name = "Royal Vengardian armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = 6500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight;
	on_unequip = unequip_w2_tknight;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (60 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (60 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD1(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 2";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 0;
	value = 8500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd1;
	on_unequip = unequip_w2_tknight_grd1;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd1()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd1()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD2(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 3";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 5;
	value = 11500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd2.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd2;
	on_unequip = unequip_w2_tknight_grd2;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd2()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (70 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd2()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (70 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD3(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 4";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	value = 14500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd3.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd3;
	on_unequip = unequip_w2_tknight_grd3;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd3()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd3()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD4(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 5";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 10;
	value = 17500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd4.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd4;
	on_unequip = unequip_w2_tknight_grd4;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd4()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd4()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD5(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 6";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 80;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 20;
	value = 19500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd5.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd5;
	on_unequip = unequip_w2_tknight_grd5;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd5()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (100 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd5()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (100 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD6(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 7";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 110;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 90;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	value = 22500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd6.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd6;
	on_unequip = unequip_w2_tknight_grd6;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd6()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (110 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd6()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (110 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_W2_TKNIGHT_GRD7(C_ITEM)
{
	name = "Royal Vengardian armor Lv. 8";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 120;
	protection[PROT_BLUNT] = 110;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 60;
	protection[PROT_MAGIC] = 30;
	value = 27500;
	wear = WEAR_TORSO;
	visual = "Armor_W2_TKnight.3ds";
	visual_change = "Armor_W2_TKnight_Grd7.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_w2_tknight_grd7;
	on_unequip = unequip_w2_tknight_grd7;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_w2_tknight_grd7()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (120 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_w2_tknight_grd7()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (120 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_BAU_L(C_ITEM)
{
	name = "Farmer's clothing";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bau_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_L.3DS";
	visual_change = "Armor_Bau_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_bau_l;
	on_unequip = unequip_bau_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_bau_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_bau_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_BAU_M(C_ITEM)
{
	name = "Landowner's clothing";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bau_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Bau_M.3ds";
	visual_change = "Armor_Bau_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_bau_m;
	on_unequip = unequip_bau_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_bau_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_bau_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_BAUBABE_L(C_ITEM)
{
	name = "Farmer's light-colored dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_baubabe_l;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_baubabe_l;
	on_unequip = unequip_baubabe_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
};


func void equip_baubabe_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_baubabe_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_BAUBABE_M(C_ITEM)
{
	name = "Farmer's green dress";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_baubabe_m;
	wear = WEAR_TORSO;
	visual = "ItAr_VLKBabe.3DS";
	visual_change = "Armor_BauBabe_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_baubabe_m;
	on_unequip = unequip_baubabe_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
};


func void equip_baubabe_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_baubabe_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_L(C_ITEM)
{
	name = "Light mercenary armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_L.3ds";
	visual_change = "Armor_Sld_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_l;
	on_unequip = unequip_itar_sld_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_sld_l()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_sld_l()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_SLD_M(C_ITEM)
{
	name = "Medium mercenary armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_M.3ds";
	visual_change = "Armor_Sld_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_m;
	on_unequip = unequip_itar_sld_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_sld_m()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (45 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_sld_m()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (45 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_SLD_H(C_ITEM)
{
	name = "Heavy mercenary armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 0;
	value = value_itar_sld_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Sld_H.3ds";
	visual_change = "Armor_Sld_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_sld_h;
	on_unequip = unequip_itar_sld_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_sld_h()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (75 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_sld_h()
{
	if(Npc_IsPlayer(self))
	{
		SLDARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (75 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(SLD01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_SLD_G3_BASE(C_ITEM)
{
	name = "Myrtana mercenary armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 35;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 5;
	protection[PROT_MAGIC] = 0;
	value = 350;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3_V2.3ds";
	visual_change = "Armor_Sld_G3.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_base;
	on_unequip = unequip_sld_g3_base;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_base()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (35 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_base()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (35 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_G3_GRD1(C_ITEM)
{
	name = "Myrtana mercenary armor Lv. 2";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 5;
	value = 450;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3_V2.3ds";
	visual_change = "Armor_Sld_G3_Grd1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_grd1;
	on_unequip = unequip_sld_g3_grd1;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_grd1()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_grd1()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_G3_GRD2(C_ITEM)
{
	name = "Myrtana mercenary armor Lv. 3";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 15;
	protection[PROT_MAGIC] = 5;
	value = 650;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3_V2.3ds";
	visual_change = "Armor_Sld_G3_Grd2.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_grd2;
	on_unequip = unequip_sld_g3_grd2;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_grd2()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (45 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_grd2()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (45 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_G3_GRD3(C_ITEM)
{
	name = "Myrtana mercenary armor Lv. 4";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 10;
	value = 1050;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3_V2.3ds";
	visual_change = "Armor_Sld_G3_Grd3.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_grd3;
	on_unequip = unequip_sld_g3_grd3;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_grd3()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (55 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_grd3()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (55 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_G3_GRD4(C_ITEM)
{
	name = "Myrtana mercenary armor Lv. 5";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 10;
	value = 2450;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3.3ds";
	visual_change = "Armor_Sld_G3_Grd4.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_grd4;
	on_unequip = unequip_sld_g3_grd4;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_grd4()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_grd4()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_G3_GRD5(C_ITEM)
{
	name = "Myrtana mercenary armor Lv. 6";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 15;
	value = 3450;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3.3ds";
	visual_change = "Armor_Sld_G3_Grd5.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_grd5;
	on_unequip = unequip_sld_g3_grd5;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_grd5()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (75 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_grd5()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (75 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_SLD_G3_GRD6(C_ITEM)
{
	name = "Myrtana mercenary armor Lv. 7";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 85;
	protection[PROT_BLUNT] = 75;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 15;
	value = VALUE_ITAR_SLD_H;
	wear = WEAR_TORSO;
	visual = "Armor_Sld_G3.3ds";
	visual_change = "Armor_Sld_G3_Grd6.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_sld_g3_grd6;
	on_unequip = unequip_sld_g3_grd6;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_sld_g3_grd6()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (85 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_sld_g3_grd6()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (85 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_DJG_CRAWLER(C_ITEM)
{
	name = "Crawler plate armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 70;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_djg_crawler;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_Crawler.3ds";
	visual_change = "Armor_Djg_Crawler.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_djg_crawler;
	on_unequip = unequip_itar_djg_crawler;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_djg_crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (70 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(MC_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_djg_crawler()
{
	if(Npc_IsPlayer(self))
	{
		MCARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (70 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(MC_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_DJG_L(C_ITEM)
{
	name = "Light Dragon hunter's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 80;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 55;
	protection[PROT_MAGIC] = 10;
	value = value_itar_djg_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_L.3ds";
	visual_change = "Armor_Djg_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_djg_l;
	on_unequip = unequip_djg_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_djg_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_djg_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_DJG_M(C_ITEM)
{
	name = "Medium Dragon hunter's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 70;
	protection[PROT_BLUNT] = 90;
	protection[PROT_POINT] = 85;
	protection[PROT_FIRE] = 70;
	protection[PROT_MAGIC] = 15;
	value = value_itar_djg_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_M.3ds";
	visual_change = "Armor_Djg_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_djg_m;
	on_unequip = unequip_djg_m;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_djg_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (70 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_djg_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (70 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_DJG_H(C_ITEM)
{
	name = "Heavy Dragon hunter's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 75;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 95;
	protection[PROT_FIRE] = 85;
	protection[PROT_MAGIC] = 20;
	value = value_itar_djg_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Djg_H.3ds";
	visual_change = "Armor_Djg_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_djg_h;
	on_unequip = unequip_djg_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_djg_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (75 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_djg_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (75 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_NOV_L(C_ITEM)
{
	name = "Novice's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 10;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 5;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 10;
	value = value_itar_nov_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Nov_L.3ds";
	visual_change = "Armor_Nov_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_nov_l;
	on_unequip = unequip_itar_nov_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_nov_l()
{
	if(Npc_IsPlayer(self))
	{
		NOVARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(NOV01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_nov_l()
{
	if(Npc_IsPlayer(self))
	{
		NOVARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (10 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(NOV01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_KDF_L(C_ITEM)
{
	name = "Fire mage's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 50;
	value = value_itar_kdf_l;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_kdf_l;
	on_unequip = unequip_itar_kdf_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_KDF_L_WH(C_ITEM)
{
	name = "Fire mage's robe (with hood)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 10;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 60;
	value = VALUE_ITAR_KDF_L;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_Kdf_L_WH.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_kdf_l;
	on_unequip = unequip_itar_kdf_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_kdf_l()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (20 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_kdf_l()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (20 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_KDF_H(C_ITEM)
{
	name = "Heavy fire robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 100;
	value = value_itar_kdf_h;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_kdf_h;
	on_unequip = unequip_itar_kdf_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_KDF_H_WH(C_ITEM)
{
	name = "Heavy fire robe (with hood)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 110;
	value = VALUE_ITAR_KDF_H;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_H.3ds";
	visual_change = "Armor_Kdf_H_WH.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_kdf_h;
	on_unequip = unequip_itar_kdf_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_kdf_h()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (50 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_kdf_h()
{
	if(Npc_IsPlayer(self))
	{
		KDFARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (50 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(KDF01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_KDW_H(C_ITEM)
{
	name = "Water mage's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 80;
	value = value_itar_kdw_h;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_KdW_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_kdw_h;
	on_unequip = unequip_kdw_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_KDW_H_WH(C_ITEM)
{
	name = "Water mage's robe (with hood)";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 40;
	protection[PROT_MAGIC] = 90;
	value = VALUE_ITAR_KDW_H;
	wear = WEAR_TORSO;
	visual = "ItAr_KdW_H.3ds";
	visual_change = "Armor_KdW_H_WH.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_kdw_h;
	on_unequip = unequip_kdw_h;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_kdw_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_kdw_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_LEATHER_L(C_ITEM)
{
	name = "Leather armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 20;
	protection[PROT_BLUNT] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 20;
	value = value_itar_leather_l;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l;
	on_unequip = unequip_itar_leather_l;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_leather_l()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (20 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_leather_l()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (20 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_LEATHER_L_GRD1(C_ITEM)
{
	name = "Improved leather armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 25;
	protection[PROT_MAGIC] = 25;
	value = VALUE_ITAR_LEATHER_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L_GRD1.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l_grd1;
	on_unequip = unequip_itar_leather_l_grd1;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_leather_l_grd1()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_leather_l_grd1()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_LEATHER_L_GRD2(C_ITEM)
{
	name = "Belted leather armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 27;
	protection[PROT_BLUNT] = 27;
	protection[PROT_POINT] = 27;
	protection[PROT_FIRE] = 27;
	protection[PROT_MAGIC] = 27;
	value = VALUE_ITAR_LEATHER_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L_GRD2.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l_grd2;
	on_unequip = unequip_itar_leather_l_grd2;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_leather_l_grd2()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (27 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_leather_l_grd2()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (27 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_LEATHER_L_GRD3(C_ITEM)
{
	name = "Thickened leather armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 30;
	protection[PROT_BLUNT] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 30;
	value = VALUE_ITAR_LEATHER_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L_GRD3.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l_grd3;
	on_unequip = unequip_itar_leather_l_grd3;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_leather_l_grd3()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (30 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_leather_l_grd3()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (30 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_LEATHER_L_GRD4(C_ITEM)
{
	name = "Reinforced leather armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 40;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 30;
	value = VALUE_ITAR_LEATHER_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L_GRD4.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l_grd4;
	on_unequip = unequip_itar_leather_l_grd4;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_leather_l_grd4()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_leather_l_grd4()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_LEATHER_L_GRD5(C_ITEM)
{
	name = "Heavy leather armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 30;
	protection[PROT_MAGIC] = 30;
	value = VALUE_ITAR_LEATHER_L;
	wear = WEAR_TORSO;
	visual = "ItAr_Leather_L.3ds";
	visual_change = "Armor_Leather_L_GRD5.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_itar_leather_l_grd5;
	on_unequip = unequip_itar_leather_l_grd5;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_itar_leather_l_grd5()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = TRUE;
		STAT_SWORDDEF = STAT_SWORDDEF + (50 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] += BA_BONUS01;
			self.protection[PROT_BLUNT] += BA_BONUS01;
			self.protection[PROT_POINT] += BA_BONUS01;
			self.protection[PROT_MAGIC] += BA_BONUS01;
			self.protection[PROT_FIRE] += BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF + (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};

func void unequip_itar_leather_l_grd5()
{
	if(Npc_IsPlayer(self))
	{
		LEATHERARMOR_EQUIPPED = FALSE;
		STAT_SWORDDEF = STAT_SWORDDEF - (50 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		if(LEATHER01_EQUIPPED == TRUE)
		{
			self.protection[PROT_EDGE] -= BA_BONUS01;
			self.protection[PROT_BLUNT] -= BA_BONUS01;
			self.protection[PROT_POINT] -= BA_BONUS01;
			self.protection[PROT_MAGIC] -= BA_BONUS01;
			self.protection[PROT_FIRE] -= BA_BONUS01;
			STAT_SWORDDEF = STAT_SWORDDEF - (BA_BONUS01 * 1);
			Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
		};
	};
};


instance ITAR_BDT_M(C_ITEM)
{
	name = "Medium bandit's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 15;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_m;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_M.3ds";
	visual_change = "Armor_Bdt_M.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_bdt_m;
	on_unequip = unequip_bdt_m;
	description = name;
	text[0] = PRINT_ADDON_BDTARMOR;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_BLUNT;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_PROT_POINT;
	count[3] = protection[PROT_POINT];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_bdt_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_bdt_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_BDT_H(C_ITEM)
{
	name = "Heavy bandit's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 40;
	protection[PROT_BLUNT] = 40;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_bdt_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Bdt_H.3ds";
	visual_change = "Armor_Bdt_H.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_bdt_h;
	on_unequip = unequip_bdt_h;
	description = name;
	text[0] = PRINT_ADDON_BDTARMOR;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_BLUNT;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_PROT_POINT;
	count[3] = protection[PROT_POINT];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_bdt_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_bdt_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (40 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_XARDAS(C_ITEM)
{
	name = "Black mage's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 70;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 80;
	value = value_itar_xardas;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Xardas.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_xardas;
	on_unequip = unequip_xardas;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_xardas()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (50 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_xardas()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (50 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_LESTER(C_ITEM)
{
	name = "Lester's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 25;
	protection[PROT_BLUNT] = 25;
	protection[PROT_POINT] = 25;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_lester;
	wear = WEAR_TORSO;
	visual = "ItAr_Lester.3ds";
	visual_change = "Armor_Lester.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_lester;
	on_unequip = unequip_lester;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_lester()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_lester()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (25 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_DIEGO(C_ITEM)
{
	name = "Diego's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 35;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 35;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_diego;
	wear = WEAR_TORSO;
	visual = "ItAr_Diego.3ds";
	visual_change = "Armor_Diego.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_diego;
	on_unequip = unequip_diego;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[4] = NAME_BONUS_DEX;
	count[4] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_diego()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (35 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
	Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
};

func void unequip_diego()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (35 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
	Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
};


instance ITAR_CORANGAR(C_ITEM)
{
	name = "Cor Angar's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 25;
	value = value_itar_corangar;
	wear = WEAR_TORSO;
	visual = "ItAr_CorAngar.3ds";
	visual_change = "Armor_CorAngar.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_corangar;
	on_unequip = unequip_corangar;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_corangar()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (60 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_corangar()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (60 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_DEMENTOR(C_ITEM)
{
	name = "Dark cloak";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 80;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 35;
	protection[PROT_MAGIC] = 65;
	value = value_itar_dementor;
	wear = WEAR_TORSO;
	visual = "ItAr_Xardas.3ds";
	visual_change = "Armor_Dementor.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_dementor;
	on_unequip = unequip_dementor;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_dementor()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_dementor()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (80 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_PRISONER(C_ITEM)
{
	name = "Convict's pants";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 5;
	protection[PROT_BLUNT] = 15;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_MAGIC] = 0;
	value = value_itar_prisoner;
	wear = WEAR_TORSO;
	visual = "ItAr_Prisoner.3ds";
	visual_change = "Armor_Prisoner.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_prisoner;
	on_unequip = unequip_prisoner;
	description = name;
	text[0] = NAME_PROT_EDGE;
	count[0] = protection[PROT_EDGE];
	text[1] = NAME_PROT_BLUNT;
	count[1] = protection[PROT_BLUNT];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_prisoner()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (5 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_prisoner()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (5 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_OLDCAMP_GUARD_L(C_ITEM)
{
	name = "Light armor of the guard of the Old Camp";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 45;
	protection[PROT_BLUNT] = 45;
	protection[PROT_POINT] = 45;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_oldcamp_guard_l;
	wear = WEAR_TORSO;
	visual = "grdl.3ds";
	visual_change = "ARMOR_OLD_GRDL.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_oldcamp_guard_l;
	on_unequip = unequip_oldcamp_guard_l;
	description = name;
	text[0] = PRINT_ADDON_BDTARMOR;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_BLUNT;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_PROT_POINT;
	count[3] = protection[PROT_POINT];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_oldcamp_guard_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (45 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_oldcamp_guard_l()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (45 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_OLDCAMP_GUARD_M(C_ITEM)
{
	name = "Medium armor of the guard of the Old Camp";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 55;
	protection[PROT_BLUNT] = 55;
	protection[PROT_POINT] = 55;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_oldcamp_guard_m;
	wear = WEAR_TORSO;
	visual = "grdm.3ds";
	visual_change = "ARMOR_OLD_GRDM.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_oldcamp_guard_m;
	on_unequip = unequip_oldcamp_guard_m;
	description = name;
	text[0] = PRINT_ADDON_BDTARMOR;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_BLUNT;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_PROT_POINT;
	count[3] = protection[PROT_POINT];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_oldcamp_guard_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (55 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_oldcamp_guard_m()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (55 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};


instance ITAR_OLDCAMP_GUARD_H(C_ITEM)
{
	name = "Heavy armor of the guard of the Old Camp";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 65;
	protection[PROT_BLUNT] = 65;
	protection[PROT_POINT] = 65;
	protection[PROT_FIRE] = 0;
	protection[PROT_MAGIC] = 0;
	value = value_itar_oldcamp_guard_h;
	wear = WEAR_TORSO;
	visual = "ItAr_Thorus_ADDON.3ds";
	visual_change = "Armor_Thorus_ADDON.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	on_equip = equip_oldcamp_guard_h;
	on_unequip = unequip_oldcamp_guard_h;
	description = name;
	text[0] = PRINT_ADDON_BDTARMOR;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_BLUNT;
	count[2] = protection[PROT_BLUNT];
	text[3] = NAME_PROT_POINT;
	count[3] = protection[PROT_POINT];
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_oldcamp_guard_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF + (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

func void unequip_oldcamp_guard_h()
{
	if(Npc_IsPlayer(self))
	{
		STAT_SWORDDEF = STAT_SWORDDEF - (65 * 1);
		Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	};
};

