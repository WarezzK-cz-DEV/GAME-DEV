
prototype MST_DEFAULT_DRACONIAN(C_NPC)
{
	name[0] = "Lizard man";
	guild = GIL_DRACONIAN;
	aivar[AIV_MM_REAL_ID] = ID_DRACONIAN;
	level = 35;
	attribute[ATR_STRENGTH] = 125;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_HITPOINTS_MAX] = 400;
	attribute[ATR_HITPOINTS] = 400;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 130;
	protection[PROT_EDGE] = 130;
	protection[PROT_POINT] = 130;
	protection[PROT_FIRE] = 130;
	protection[PROT_FLY] = 65;
	protection[PROT_MAGIC] = 75;
	hitchance[NPC_TALENT_1H] = 80;
	hitchance[NPC_TALENT_2H] = 80;
	hitchance[NPC_TALENT_BOW] = 80;
	hitchance[NPC_TALENT_CROSSBOW] = 80;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
};

func void b_setvisuals_draconian()
{
	Mdl_SetVisual(self,"Draconian.mds");
	Mdl_SetVisualBody(self,"Draconian_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRACONIAN(MST_DEFAULT_DRACONIAN)
{
	b_setvisuals_draconian();
	EquipItem(self,itmw_2h_orcmace_02);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

