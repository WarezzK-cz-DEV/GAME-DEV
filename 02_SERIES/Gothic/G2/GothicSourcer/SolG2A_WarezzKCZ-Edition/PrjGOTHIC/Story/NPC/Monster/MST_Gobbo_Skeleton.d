
prototype MST_DEFAULT_GOBBO_SKELETON(C_NPC)
{
	name[0] = "Goblin skeleton";
	guild = GIL_GOBBO_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_GOBBO_SKELETON;
	level = 16;
	attribute[ATR_STRENGTH] = 80;
	attribute[ATR_DEXTERITY] = 80;
	attribute[ATR_HITPOINTS_MAX] = 175;
	attribute[ATR_HITPOINTS] = 175;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 45;
	protection[PROT_EDGE] = 90;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 75;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 25;
	damagetype = DAM_BLUNT;
	fight_tactic = FAI_GOBBO;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_LONG;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_gobbo_skeleton()
{
	Mdl_SetVisual(self,"Gobbo.mds");
	Mdl_SetVisualBody(self,"Gobbo_Skeleton_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance GOBBO_SKELETON(MST_DEFAULT_GOBBO_SKELETON)
{
	b_setvisuals_gobbo_skeleton();
	Npc_SetToFightMode(self,itmw_1h_bau_mace);
};

instance SUMMONED_GOBBO_SKELETON(MST_DEFAULT_GOBBO_SKELETON)
{
	name[0] = "Summoned goblin skeleton";
	guild = gil_summoned_gobbo_skeleton;
	aivar[AIV_MM_REAL_ID] = id_summoned_gobbo_skeleton;
	level = 0;
	aivar[AIV_PARTYMEMBER] = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	start_aistate = zs_mm_rtn_summoned;
	b_setvisuals_gobbo_skeleton();
	Npc_SetToFightMode(self,itmw_1h_bau_mace);
};

instance GOBBO_SKELETONOWDEMONTOWER(MST_DEFAULT_GOBBO_SKELETON)
{
	b_setvisuals_gobbo_skeleton();
	Npc_SetToFightMode(self,itmw_1h_bau_mace);
};

