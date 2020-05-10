
prototype MST_DEFAULT_SNAPPER(C_NPC)
{
	name[0] = "Snapper";
	guild = GIL_SNAPPER;
	aivar[AIV_MM_REAL_ID] = ID_SNAPPER;
	level = 12;
	attribute[ATR_STRENGTH] = 85;
	attribute[ATR_DEXTERITY] = 85;
	attribute[ATR_HITPOINTS_MAX] = 220;
	attribute[ATR_HITPOINTS] = 220;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 60;
	protection[PROT_EDGE] = 60;
	protection[PROT_POINT] = 60;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 0;
	protection[PROT_MAGIC] = 0;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_SNAPPER;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_MONSTER_ACTIVE_MAX;
	aivar[AIV_MM_THREATENBEFOREATTACK] = TRUE;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = TRUE;
	aivar[AIV_MM_PACKHUNTER] = TRUE;
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_RESTSTART] = ONLYROUTINE;
};

func void b_setvisuals_snapper()
{
	Mdl_SetVisual(self,"Snapper.mds");
	Mdl_SetVisualBody(self,"Sna_Body",DEFAULT,DEFAULT,"",DEFAULT,DEFAULT,-1);
};


instance SNAPPER(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER1(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER2(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER3(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER4(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER5(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER6(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER7(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_SNAPPER8(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance NEWMINE_LEADSNAPPER(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
	name[0] = "Pack leader";
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 160;
	attribute[ATR_HITPOINTS] = 160;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 20;
	protection[PROT_FIRE] = 0;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 0;
	CreateInvItems(self,itat_clawleader,1);
};

instance GRIMBALD_SNAPPER1(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance GRIMBALD_SNAPPER2(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance GRIMBALD_SNAPPER3(MST_DEFAULT_SNAPPER)
{
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

instance SNAPPERTRANSFORM(MST_DEFAULT_SNAPPER)
{
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,b_stopmagictransform);
	b_setvisuals_snapper();
	Npc_SetToFistMode(self);
};

