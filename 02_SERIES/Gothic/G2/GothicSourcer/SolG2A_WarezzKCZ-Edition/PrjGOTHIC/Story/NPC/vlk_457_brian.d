
instance VLK_457_BRIAN(NPC_DEFAULT)
{
	name[0] = "Brian";
	guild = GIL_VLK;
	id = 457;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_NORMAL_KIRGO,BODYTEX_B,itar_smith);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_457;
};


func void rtn_start_457()
{
	ta_smith_sharp(7,5,15,51,"NW_CITY_SMITH_SHARP");
	ta_smith_fire(15,51,16,3,"NW_CITY_SMITH_FIRE");
	ta_smith_anvil(16,3,16,17,"NW_CITY_SMITH_ANVIL");
	ta_smith_fire(16,17,16,29,"NW_CITY_SMITH_FIRE");
	ta_smith_anvil(16,29,16,40,"NW_CITY_SMITH_ANVIL");
	ta_smith_cool(16,40,16,50,"NW_CITY_SMITH_COOL");
	ta_smith_anvil(16,50,16,55,"NW_CITY_SMITH_ANVIL");
	ta_wash_self(16,55,17,5,"NW_CITY_SMITH_02");
	ta_smith_fire(17,5,17,10,"NW_CITY_SMITH_FIRE");
	ta_smith_anvil(17,10,17,20,"NW_CITY_SMITH_ANVIL");
	ta_smith_fire(17,20,17,30,"NW_CITY_SMITH_FIRE");
	ta_smith_anvil(17,30,17,50,"NW_CITY_SMITH_ANVIL");
	ta_smith_cool(17,50,17,56,"NW_CITY_SMITH_COOL");
	ta_smith_sharp(17,56,18,15,"NW_CITY_SMITH_SHARP");
	ta_stand_armscrossed(18,15,19,15,"NW_CITY_SMITH_01");
	ta_smith_sharp(19,15,20,20,"NW_CITY_SMITH_SHARP");
	ta_wash_self(20,20,20,35,"NW_CITY_SMITH_02");
	ta_sit_table(20,35,23,15,"NW_CITY_TAVERN_TABLE_02");
	ta_smalltalk(23,15,0,25,"NW_CITY_MERCHANT_PATH_14");
	ta_sleep(0,25,7,5,"NW_CITY_BED_BRIAN");
};

func void rtn_lighthouse_457()
{
	ta_stand_guarding(8,0,20,0,"NW_LIGHTHOUSE_IN_01");
	ta_sit_throne(20,0,8,0,"NW_LIGHTHOUSE_IN_03");
};

