
instance BAU_950_LOBART(NPC_DEFAULT)
{
	name[0] = "Lobart";
	guild = GIL_OUT;
	id = 950;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_SENYAN,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_950;
};


func void rtn_start_950()
{
	ta_stand_guarding(7,30,12,0,"NW_FARM1_LOBART");
	ta_sit_chair(12,0,13,0,"NW_FARM1_ENTRANCE_01");
	ta_saw(13,0,14,0,"NW_FARM1_OUT_ADD_09");
	ta_woodcutting(14,0,17,0,"NW_FARM1_MWC_02");
	ta_stand_guarding(17,0,19,0,"NW_FARM1_OUT_04");
	ta_sit_chair(19,0,23,0,"NW_FARM1_ENTRANCE_01");
	ta_sleep(23,0,7,30,"NW_FARM1_INHOUSE_BED_01");
};

func void rtn_obesessionritual_950()
{
	ta_stand_guarding(7,30,23,0,"NW_FARM1_OUT_05");
	ta_stand_guarding(23,0,7,30,"NW_FARM1_OUT_05");
};

