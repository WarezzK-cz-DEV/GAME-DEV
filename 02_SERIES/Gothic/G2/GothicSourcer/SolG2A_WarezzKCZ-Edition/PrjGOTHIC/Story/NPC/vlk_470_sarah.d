
instance VLK_470_SARAH(NPC_DEFAULT)
{
	name[0] = "Sarah";
	guild = GIL_KDW;
	id = 470;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,7);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_katana);
	EquipItem(self,itmi_sarahwig);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BLONDIE,BODYTEXBABE_F,itar_w2_ves);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_start_470;
};


func void rtn_start_470()
{
	ta_stand_armscrossed(7,15,17,50,"NW_CITY_SARAH");
	ta_smith_fire(17,50,18,0,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_anvil(18,0,18,10,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_fire(18,10,18,20,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_anvil(18,20,18,30,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_cool(18,30,18,40,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_sharp(18,40,18,50,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_fire(18,50,19,0,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_anvil(19,0,19,10,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_fire(19,10,19,20,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_anvil(19,20,19,30,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_fire(19,30,19,40,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_anvil(19,40,19,50,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_smith_cool(19,50,20,0,"NW_CITY_MERCHANT_SARAH_SMITH");
	ta_piano(20,0,0,15,"TAVERN02");
	ta_sleep(0,15,7,15,"NW_CITY_MERCHANT_SARAH_SLEEP");
};

func void rtn_stiers_470()
{
	ta_sit_chair(10,15,11,0,"NW_NM_02_ADD_06");
	ta_bathtub(11,0,12,0,"NW_NM_02_ADD_07");
	ta_piano(12,0,2,15,"TAVERN02");
	ta_sleep(2,15,10,15,"NW_NM_02_ADD_05");
};

func void rtn_knast_470()
{
	ta_stand_armscrossed(8,0,20,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	ta_stand_armscrossed(20,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void rtn_tot_470()
{
	ta_stand_armscrossed(5,15,20,15,"TOT");
	ta_sleep(20,15,5,15,"TOT");
};


instance ITMI_SARAHWIG(C_ITEM)
{
	name = "Sarah's wig";
	mainflag = ITEM_KAT_NF;
	flags = 0;
	value = 0;
	wear = WEAR_HEAD;
	visual = "ITMI_SARAHWIG_01.3DS";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
};


func int b_usepiano()
{
	if(Npc_HasItems(self,itar_w2_ves) >= 1)
	{
		return TRUE;
	}
	else
	{
		AI_PlayAni(self,"T_DONTKNOW");
		return FALSE;
	};
};

