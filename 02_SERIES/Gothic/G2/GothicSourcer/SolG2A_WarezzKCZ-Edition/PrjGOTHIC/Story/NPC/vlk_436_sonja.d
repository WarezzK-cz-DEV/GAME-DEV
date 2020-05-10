
instance VLK_436_SONJA(NPC_DEFAULT)
{
	name[0] = "Sonja";
	guild = GIL_VLK;
	id = 436;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	EquipItem(self,itmi_sonjawig);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_L_CHARLOTTE2,BODYTEXBABE_L,itar_baron_babe_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_436;
};


func void rtn_start_436()
{
	ta_sit_throne(11,0,14,0,"NW_CITY_PUFF_THRONE");
	ta_dance(14,0,17,0,"NW_PUFF_DANCE");
	ta_stand_wp(17,0,17,10,"NW_CITY_HABOUR_PUFF_SONJA");
	ta_bathtub(17,10,18,0,"NW_CITY_HABOUR_PUFF_SONJA");
	ta_sit_throne(18,0,20,0,"NW_CITY_PUFF_THRONE");
	ta_dance(20,0,23,0,"NW_CITY_PUFF_THRONE");
	ta_stand_wp(23,0,23,10,"NW_CITY_HABOUR_PUFF_SONJA");
	ta_bathtub(23,10,0,10,"NW_CITY_HABOUR_PUFF_SONJA");
	ta_sit_throne(0,10,3,0,"NW_CITY_PUFF_THRONE");
	ta_sleep(3,0,11,0,"NW_CITY_SONJA_BED");
};


instance ITMI_SONJAWIG(C_ITEM)
{
	name = "Sonja's wig";
	mainflag = ITEM_KAT_NF;
	flags = 0;
	value = 0;
	wear = WEAR_HEAD;
	visual = "ITMI_SONJAWIG_01.3DS";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
};

