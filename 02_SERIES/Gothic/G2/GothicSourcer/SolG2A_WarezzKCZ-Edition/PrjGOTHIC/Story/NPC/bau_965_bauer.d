
instance BAU_965_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 965;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_NORMALBART_RUFUS,BODYTEX_L,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_965;
};


func void rtn_start_965()
{
	ta_smalltalk(8,0,13,0,"NW_FARM3_STABLE_OUT_03");
	ta_sit_chair(13,0,14,0,"NW_FARM3_ADDHOUSE_IN_03");
	ta_smalltalk(14,0,20,30,"NW_FARM3_OUT_LH_04");
	ta_stand_armscrossed(20,30,0,0,"NW_FARM3_STABLE_REST_02");
	ta_sleep(0,0,8,0,"NW_FARM3_ADDHOUSE_IN_04");
};

func void rtn_fleefrompass_965()
{
	ta_sit_campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_05");
	ta_sit_campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_05");
};

