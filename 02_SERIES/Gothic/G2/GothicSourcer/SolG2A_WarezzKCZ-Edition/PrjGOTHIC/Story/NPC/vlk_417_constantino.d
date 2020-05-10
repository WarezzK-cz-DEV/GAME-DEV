
instance VLK_417_CONSTANTINO(NPC_DEFAULT)
{
	name[0] = "Constantino";
	guild = GIL_VLK;
	id = 417;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_OLDBALD_JEREMIAH,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_417;
};


func void rtn_start_417()
{
	ta_potion_alchemy(8,0,14,0,"NW_CITY_ALCHEMY_VELAX");
	ta_read_bookstand(14,0,17,10,"NW_CITY_BOOK_VELAX");
	ta_potion_alchemy(17,10,20,0,"NW_CITY_ALCHEMY_VELAX");
	ta_sit_throne(20,0,22,0,"NW_CITY_BOOK_VELAX");
	ta_sleep(22,0,8,0,"NW_CITY_BED_VELAX");
};

