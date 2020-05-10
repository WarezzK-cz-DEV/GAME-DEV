
instance BDT_1202_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1202;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[91] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	EquipItem(self,itsh_g3_01_old);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL01,BODYTEX_B,itar_bdt_h);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_bandit;
	daily_routine = rtn_bdt_1202;
};


func void rtn_bdt_1202()
{
	ta_sit_bench(8,0,19,0,"OW_PATH_NL_BNDTCAVE_04");
	ta_sit_bench(19,0,8,0,"OW_PATH_NL_BNDTCAVE_04");
};

