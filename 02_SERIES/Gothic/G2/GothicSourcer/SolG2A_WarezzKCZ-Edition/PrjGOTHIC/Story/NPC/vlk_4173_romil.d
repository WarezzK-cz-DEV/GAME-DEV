
instance VLK_4173_ROMIL(NPC_DEFAULT)
{
	name[0] = "Romil";
	guild = GIL_VLK;
	id = 4173;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_HOMER,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_4173;
};


func void rtn_start_4173()
{
	ta_stand_armscrossed(8,0,10,0,"NW_CITY_HABOUR_NTHLH_02");
	ta_stand_sweeping(10,0,10,30,"NW_CITY_HABOUR_NTHLH_01");
	ta_stand_armscrossed(10,30,15,0,"NW_CITY_HABOUR_NTHLH_02");
	ta_stand_sweeping(15,0,15,30,"NW_CITY_HABOUR_NTHLH_01");
	ta_stand_armscrossed(15,30,23,0,"NW_CITY_HABOUR_NTHLH_02");
	ta_sleep(23,0,8,0,"NW_CITY_HABOUR_NTHLH_05");
};

