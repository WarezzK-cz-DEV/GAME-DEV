
instance VLK_4172_SELIVAN(NPC_DEFAULT)
{
	name[0] = "Selivan";
	guild = GIL_VLK;
	id = 4172;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_BARTHOLO,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_4172;
};


func void rtn_start_4172()
{
	ta_stand_armscrossed(8,0,23,0,"NW_CITY_HABOUR_ENCHANT_IN_STAND");
	ta_sleep(23,0,8,0,"NW_CITY_HABOUR_ENCHANT_IN_05");
};

