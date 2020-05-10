
instance BDT_10316_ADDON_RANGERBANDIT_M(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10316;
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
	daily_routine = rtn_start_10316;
};


func void rtn_start_10316()
{
	ta_stand_guarding(8,0,22,0,"NW_ONARFOREST_BDTCAVE_09");
	ta_stand_guarding(22,0,8,0,"NW_ONARFOREST_BDTCAVE_09");
};

