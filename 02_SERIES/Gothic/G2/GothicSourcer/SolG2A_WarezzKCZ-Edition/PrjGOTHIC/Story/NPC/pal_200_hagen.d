
instance PAL_200_HAGEN(NPC_DEFAULT)
{
	name[0] = "Lord Hagen";
	guild = GIL_PAL;
	id = 200;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_MURDER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_pal_sword);
	EquipItem(self,itmi_geralthair);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_TOUGH_OKYL,BODYTEX_N,itar_pal_hlc);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_200;
};


func void rtn_start_200()
{
	ta_stand_armscrossed(8,0,20,0,"NW_CITY_HAGEN");
	ta_stand_armscrossed(20,0,8,0,"NW_CITY_HAGEN");
};

func void rtn_castle_200()
{
	ta_sit_throne(8,0,20,0,"NW_CITY_LHCASTLE_THRONE");
	ta_sit_throne(20,0,8,0,"NW_CITY_LHCASTLE_THRONE");
};

func void rtn_shipfree_200()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_UPTOWNPARADE_HAGEN");
	ta_stand_guarding(23,0,8,0,"NW_CITY_UPTOWNPARADE_HAGEN");
};


instance ITMI_GERALTHAIR(C_ITEM)
{
	name = "Hagen's wig";
	mainflag = ITEM_KAT_NF;
	flags = 0;
	value = 0;
	wear = WEAR_HEAD;
	visual = "ItMi_GeraltHair.3DS";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
};

