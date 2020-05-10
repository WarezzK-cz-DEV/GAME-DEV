
instance VLK_471_EDDA(NPC_DEFAULT)
{
	name[0] = "Edda";
	guild = GIL_VLK;
	id = 471;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe.",FACEBABE_B_REDLOCKS,BODYTEX_B,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_471;
};


func void rtn_start_471()
{
	ta_sleep(1,15,6,25,"NW_CITY_HABOUR_POOR_AREA_HUT_06_BED_01");
	ta_sit_bench(6,25,7,25,"NW_CITY_HABOUR_POOR_AREA_CAULDRONADD2");
	ta_cook_cauldron(7,25,12,15,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	ta_sit_bench(12,15,13,35,"NW_CITY_HABOUR_POOR_AREA_CAULDRONADD2");
	ta_cook_cauldron(13,35,15,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	ta_stand_sweeping(15,0,17,0,"NW_CITY_HABOUR_POOR_AREA_HUT_06_IN");
	ta_cook_cauldron(17,0,19,0,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
	ta_sit_bench(19,0,20,35,"NW_CITY_HABOUR_POOR_AREA_CAULDRONADD2");
	ta_cook_cauldron(20,35,1,15,"NW_CITY_HABOUR_POOR_AREA_CAULDRON");
};

