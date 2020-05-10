
instance BDT_10315_ADDON_RANGERBANDIT_M(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10315;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL03,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_10315;
};


func void rtn_start_10315()
{
	ta_stand_armscrossed(8,0,22,0,"NW_ONARFOREST_BDTCAVE_02");
	ta_stand_armscrossed(22,0,8,0,"NW_ONARFOREST_BDTCAVE_02");
};

