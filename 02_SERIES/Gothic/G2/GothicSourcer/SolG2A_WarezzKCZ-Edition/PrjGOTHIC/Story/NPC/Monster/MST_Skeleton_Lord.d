
prototype MST_SKELETON_LORD(C_NPC)
{
	name[0] = "Shadow warrior";
	guild = GIL_SKELETON;
	aivar[AIV_MM_REAL_ID] = ID_SKELETON;
	aivar[90] = TRUE;
	level = 50;
	attribute[ATR_STRENGTH] = 175;
	attribute[ATR_DEXTERITY] = 100;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	attribute[ATR_MANA_MAX] = 200;
	attribute[ATR_MANA] = 200;
	protection[PROT_BLUNT] = 90;
	protection[PROT_EDGE] = 180;
	protection[PROT_POINT] = 500;
	protection[PROT_FIRE] = 100;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 50;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_zweihaender2);
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_skeleton_lord()
{
	Mdl_SetVisual(self,"HumanS.mds");
	Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
	Mdl_ApplyOverlayMds(self,"humans_2hST3.mds");
	Mdl_ApplyOverlayMds(self,"humans_BowT1.mds");
	Mdl_ApplyOverlayMds(self,"humans_CBowT1.mds");
	b_setnpcvisual(self,MALE,"Ske_Head",0,0,itar_pal_skel);
};


instance SKELETON_LORD(MST_SKELETON_LORD)
{
	b_setvisuals_skeleton_lord();
};

instance CRYPT_SKELETON_LORD(MST_SKELETON_LORD)
{
	name[0] = "Shadow Lord Inubis";
	b_setvisuals_skeleton_lord();
	CreateInvItems(self,itmi_gold,500);
	CreateInvItems(self,itpo_mana_03,2);
	CreateInvItems(self,itpo_health_03,2);
};

instance SKELETON_LORD_ARCHOL(MST_SKELETON_LORD)
{
	name[0] = "Shadow lord Archol";
	level = 60;
	attribute[ATR_HITPOINTS_MAX] = 880;
	attribute[ATR_HITPOINTS] = 880;
	b_setvisuals_skeleton_lord();
	CreateInvItems(self,itmi_gold,650);
	CreateInvItems(self,itke_evt_undead_01,1);
};

