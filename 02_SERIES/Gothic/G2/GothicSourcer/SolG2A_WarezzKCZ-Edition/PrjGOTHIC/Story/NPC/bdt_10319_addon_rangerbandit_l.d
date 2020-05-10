
instance BDT_10319_ADDON_RANGERBANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10319;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_HOMER,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_10319;
};


func void rtn_start_10319()
{
	ta_stand_guarding(8,0,22,0,"NW_ONARFOREST_BDTCAVE_02");
	ta_stand_guarding(22,0,8,0,"NW_ONARFOREST_BDTCAVE_02");
};

