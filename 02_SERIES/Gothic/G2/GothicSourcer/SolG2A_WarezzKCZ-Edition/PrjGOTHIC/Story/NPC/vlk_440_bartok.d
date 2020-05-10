
instance VLK_440_BARTOK(NPC_DEFAULT)
{
	name[0] = "Bartok";
	guild = GIL_VLK;
	id = 440;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	level = 25;
	attribute[ATR_STRENGTH] = 155;
	attribute[ATR_DEXTERITY] = 155;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 700;
	attribute[ATR_HITPOINTS] = 700;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itrw_bow_m_03);
	EquipItem(self,itmw_addon_hacker_1h_01);
	b_createambientinv(self);
	CreateInvItems(self,itrw_arrow,20);
	CreateInvItems(self,itpo_health_addon_04,2);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_IMPORTANT_ARTO,BODYTEX_N,itar_leather_l_grd3);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_440;
};


func void rtn_start_440()
{
	ta_stand_drinking(7,0,9,15,"NW_CITY_MERCHANT_PATH_33");
	ta_sit_bench(9,15,10,45,"NW_CITY_PATH_HABOUR_08_BENCH");
	ta_stand_drinking(10,45,15,15,"NW_CITY_MERCHANT_PATH_33");
	ta_stand_eating(15,15,16,45,"NW_CITY_MERCHANT_PATH_28_F");
	ta_stand_drinking(16,45,20,45,"NW_CITY_MERCHANT_PATH_33");
	ta_sit_table(20,45,0,0,"NW_CITY_TAVERN_TABLE_01");
	ta_sit_bench(0,0,7,0,"NW_CITY_MERCHANT_TAVERN01_FRONT");
};

func void rtn_guidemitte_440()
{
	ta_guide_player(8,0,20,0,"NW_FARM1_CITYWALL_FOREST_03");
	ta_guide_player(20,0,8,0,"NW_FARM1_CITYWALL_FOREST_03");
};

func void rtn_guideende_440()
{
	ta_guide_player(8,0,20,0,"NW_FARM1_CITYWALL_FOREST_07");
	ta_guide_player(20,0,8,0,"NW_FARM1_CITYWALL_FOREST_07");
};

