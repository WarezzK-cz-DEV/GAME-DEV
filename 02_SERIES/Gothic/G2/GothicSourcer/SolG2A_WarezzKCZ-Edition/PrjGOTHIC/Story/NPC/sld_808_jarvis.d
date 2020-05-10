
instance SLD_808_JARVIS(NPC_DEFAULT)
{
	name[0] = "Jarvis";
	guild = GIL_SLD;
	id = 808;
	aivar[90] = TRUE;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_TORLOF,BODYTEX_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_808;
};


func void rtn_start_808()
{
	ta_sit_chair(7,5,17,35,"NW_BIGFARM_KITCHEN_07");
	ta_sit_chair(17,35,22,50,"NW_BIGFARM_HOUSE_17_SLDSIT");
	ta_sit_chair(22,50,0,5,"NW_BIGFARM_KITCHEN_07");
	ta_sleep(0,5,7,5,"NW_BIGFARM_HOUSE_08");
};

