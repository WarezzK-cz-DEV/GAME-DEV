
prototype MST_DEFAULT_BLOODFLY(C_NPC)
{
	name[0] = "Bloodfly";
	guild = GIL_BLOODFLY;
	aivar[AIV_MM_REAL_ID] = ID_BLOODFLY;
	level = 5;
	attribute[ATR_STRENGTH] = 40;
	attribute[ATR_DEXTERITY] = 40;
	attribute[ATR_HITPOINTS_MAX] = 100;
	attribute[ATR_HITPOINTS] = 100;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 20;
	protection[PROT_EDGE] = 20;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 20;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_POINT;
	fight_tactic = FAI_BLOODFLY;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_SHORT;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_WUSELSTART] = ONLYROUTINE;
};

func void b_setvisuals_bloodfly()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",1,DEFAULT,"",DEFAULT,DEFAULT,-1);
};

func void b_setvisuals_ybloodfly()
{
	Mdl_SetVisual(self,"Bloodfly.mds");
	Mdl_SetVisualBody(self,"Blo_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance BLOODFLY(MST_DEFAULT_BLOODFLY)
{
	b_setvisuals_bloodfly();
	Npc_SetToFistMode(self);
};

instance YBLOODFLY(MST_DEFAULT_BLOODFLY)
{
	name[0] = "Small bloodfly";
	level = 4;
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 25;
	attribute[ATR_HITPOINTS_MAX] = 70;
	attribute[ATR_HITPOINTS] = 70;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 0;
	protection[PROT_EDGE] = 0;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	b_setvisuals_ybloodfly();
	Mdl_SetModelScale(self,0.9,0.9,0.9);
	Npc_SetToFistMode(self);
};

instance SLEEPFLY(MST_DEFAULT_BLOODFLY)
{
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_SLEEPSTART] = ONLYROUTINE;
	b_setvisuals_bloodfly();
	Npc_SetToFistMode(self);
};

