
instance VLK_4171_ANSELM(NPC_DEFAULT)
{
	name[0] = "Anselm";
	guild = GIL_VLK;
	id = 4171;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_WEAK_CIPHER_ALT,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_start_4171;
};


func void rtn_start_4171()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_MERCHANT_BKSSTAND");
	ta_sleep(22,0,8,0,"NW_CITY_MERCHANT_BKSSLEEP");
};

