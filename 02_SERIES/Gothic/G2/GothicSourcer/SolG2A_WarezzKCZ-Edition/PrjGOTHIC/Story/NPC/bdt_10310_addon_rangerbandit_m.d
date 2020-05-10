
instance BDT_10310_ADDON_RANGERBANDIT_M(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10310;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[91] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_misc_sword);
	EquipItem(self,itsh_g3_broken);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH02,BODYTEX_L,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_bandit;
};

