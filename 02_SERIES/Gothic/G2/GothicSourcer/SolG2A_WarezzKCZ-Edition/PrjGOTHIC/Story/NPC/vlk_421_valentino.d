
instance VLK_421_VALENTINO(NPC_DEFAULT)
{
	name[0] = "Valentino";
	guild = GIL_VLK;
	id = 421;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_vlk_mace);
	CreateInvItems(self,itmi_gold,200);
	CreateInvItems(self,itke_valentino,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald.",FACE_N_NORMAL03,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_421;
};


func void rtn_start_421()
{
	ta_sit_bench(10,0,11,15,"NW_CITY_HABOUR_PUFF_VLNT");
	ta_stand_drinking(11,15,13,0,"NW_CITY_HABOUR_PUFF_IN_07");
	ta_stand_armscrossed(13,0,15,0,"NW_CITY_MERCHANT_PATH_16");
	ta_stand_drinking(15,0,17,0,"NW_CITY_HABOUR_PUFF_IN_07");
	ta_stand_armscrossed(17,0,19,11,"NW_CITY_MERCHANT_PATH_16");
	ta_smalltalk(19,11,21,10,"NW_CITY_MERCHANT_PATH_25");
	ta_stand_armscrossed(21,10,0,15,"NW_CITY_MERCHANT_TAVERN01_IN");
	ta_sit_chair(0,15,4,0,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	ta_sleep(4,0,10,0,"NW_CITY_REICH03_BED_01");
};

func void rtn_vatrasaway_421()
{
	ta_smalltalk(10,0,20,0,"NW_CITY_MERCHANT_TAVERN01_01");
	ta_sit_chair(20,0,4,0,"NW_CITY_MERCHANT_TAVERN01_BACKROOM");
	ta_sleep(4,0,10,0,"NW_CITY_REICH03_BED_01");
};

