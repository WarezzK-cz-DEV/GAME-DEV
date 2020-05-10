
instance BDT_1043_BANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1043;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	aivar[91] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_misc_sword);
	EquipItem(self,itsh_g3_01_old);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_P_NORMALBART01,BODYTEX_P,itar_bdt_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_1043;
};


func void rtn_start_1043()
{
	ta_saw(0,0,12,0,"NW_CASTLEMINE_TOWER__MOBSI");
	ta_woodcutting(12,0,20,0,"NW_CASTLEMINE_TOWER_01");
	ta_saw(20,0,0,0,"NW_CASTLEMINE_TOWER__MOBSI");
};

