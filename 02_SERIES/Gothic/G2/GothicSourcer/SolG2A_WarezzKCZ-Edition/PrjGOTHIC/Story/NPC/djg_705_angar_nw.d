
instance DJG_705_ANGAR_NW(NPC_DEFAULT)
{
	name[0] = "Angar";
	guild = GIL_DJG;
	id = 7050;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_zweihaender2);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_CORANGAR,BODYTEX_B,itar_corangar);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_7050;
};


func void rtn_start_7050()
{
	ta_stand_armscrossed(6,0,10,0,"NW_FARM3_OUT_04_ANG");
	ta_stand_armscrossed(10,0,11,0,"NW_FARM3_TO_ONAR_08");
	ta_stand_armscrossed(11,0,13,0,"NW_FARM3_OUT_04_ANG");
	ta_stand_armscrossed(13,0,14,0,"NW_FARM3_PATH_03");
	ta_stand_armscrossed(14,0,16,0,"NW_FARM3_OUT_04_ANG");
	ta_stand_armscrossed(16,0,17,0,"NW_FARM3_TO_ONAR_08");
	ta_stand_armscrossed(17,0,19,0,"NW_FARM3_OUT_04_ANG");
	ta_stand_armscrossed(19,0,20,0,"NW_FARM3_PATH_03");
	ta_sit_campfire(20,0,6,0,"NW_FARM3_STABLE_REST_ANG");
};

func void rtn_waitforship_7050()
{
	ta_stand_armscrossed(8,0,23,0,"NW_WAITFOR_SHIP_03");
	ta_stand_armscrossed(23,0,8,0,"NW_WAITFOR_SHIP_03");
};

func void rtn_ship_7050()
{
	ta_stand_armscrossed(8,0,23,0,"SHIP_CREW_03");
	ta_stand_armscrossed(23,0,8,0,"SHIP_CREW_03");
};

