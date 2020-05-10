
instance BDT_1201_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1201;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH_SANTINO,BODYTEX_L,itar_bdt_h);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_bandit;
	daily_routine = rtn_bdt_1201;
};


func void rtn_bdt_1201()
{
	ta_sit_bench(8,0,19,0,"OW_PATH_NL_BNDTCAVE_03");
	ta_sit_bench(19,0,8,0,"OW_PATH_NL_BNDTCAVE_03");
};

