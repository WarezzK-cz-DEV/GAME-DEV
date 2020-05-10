
prototype MST_DEFAULT_DRAGE(C_NPC)
{
	name[0] = "Demon";
	guild = GIL_DEMON;
	aivar[AIV_MM_REAL_ID] = ID_D_RAGE;
	level = 30;
	bodystateinterruptableoverride = TRUE;
	attribute[ATR_STRENGTH] = 135;
	attribute[ATR_DEXTERITY] = 135;
	attribute[ATR_HITPOINTS_MAX] = 440;
	attribute[ATR_HITPOINTS] = 440;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 125;
	protection[PROT_EDGE] = 125;
	protection[PROT_POINT] = 125;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 100;
	protection[PROT_MAGIC] = 100;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
	aivar[AIV_MM_SLEEPSTART] = 11;
};

func void b_setvisuals_drage()
{
	Mdl_SetVisual(self,"Rage.mds");
	Mdl_SetVisualBody(self,"Rage_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance DRAGE(MST_DEFAULT_DRAGE)
{
	b_setvisuals_drage();
	Npc_SetToFistMode(self);
};

