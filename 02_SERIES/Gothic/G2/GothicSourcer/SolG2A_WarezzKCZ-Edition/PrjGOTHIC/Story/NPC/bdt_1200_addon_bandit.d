
instance BDT_1200_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1200;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_N_MUD,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	start_aistate = zs_bandit;
	daily_routine = rtn_bdt_1200;
};


func void rtn_bdt_1200()
{
	ta_stand_guarding(8,0,19,0,"OW_PATH_NL_BNDTCAVE_02");
	ta_stand_guarding(19,0,8,0,"OW_PATH_NL_BNDTCAVE_02");
};

