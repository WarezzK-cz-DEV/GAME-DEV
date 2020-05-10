
instance BDT_1203_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1203;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL02,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	start_aistate = zs_bandit;
	daily_routine = rtn_bdt_1203;
};


func void rtn_bdt_1203()
{
	ta_stand_armscrossed(8,0,19,0,"OW_PATH_NL_BNDTCAVE_03");
	ta_stand_armscrossed(19,0,8,0,"OW_PATH_NL_BNDTCAVE_03");
};

