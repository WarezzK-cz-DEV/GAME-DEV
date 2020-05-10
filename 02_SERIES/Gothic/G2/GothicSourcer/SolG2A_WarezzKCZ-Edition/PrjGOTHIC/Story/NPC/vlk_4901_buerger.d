
instance VLK_4901_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 4901;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL14,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,45);
	daily_routine = rtn_prestart_4901;
};


func void rtn_prestart_4901()
{
	ta_sit_chair(8,0,19,10,"NW_CITY_HABOUR_NHDUSE_01");
	ta_sit_bench(19,10,21,45,"NW_CITY_MERCHANT_PATH_25");
	ta_sleep(21,45,8,0,"NW_CITY_HABOUR_NHDUSE_SLEEP2");
};

func void rtn_start_4901()
{
	ta_sit_chair(8,0,12,35,"NW_CITY_HABOUR_NHDUSE_01");
	ta_smalltalk(12,35,16,5,"NW_CITY_HABOUR_HUT_08");
	ta_sit_chair(16,5,19,10,"NW_CITY_HABOUR_NHDUSE_01");
	ta_sit_bench(19,10,21,45,"NW_CITY_MERCHANT_PATH_25");
	ta_sleep(21,45,8,0,"NW_CITY_HABOUR_NHDUSE_SLEEP2");
};

