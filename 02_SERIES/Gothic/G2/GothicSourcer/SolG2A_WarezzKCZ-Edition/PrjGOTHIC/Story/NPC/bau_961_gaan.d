
instance BAU_961_GAAN(NPC_DEFAULT)
{
	name[0] = "Gaan";
	guild = GIL_NONE;
	id = 961;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NPCISRANGER] = TRUE;
	level = 20;
	attribute[ATR_STRENGTH] = 120;
	attribute[ATR_DEXTERITY] = 140;
	attribute[ATR_MANA_MAX] = 1000;
	attribute[ATR_MANA] = 1000;
	attribute[ATR_HITPOINTS_MAX] = 550;
	attribute[ATR_HITPOINTS] = 550;
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_mace);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL02,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_prestart_961;
};


func void rtn_prestart_961()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM3_PATH_LEVELCHANGE_02");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM3_PATH_LEVELCHANGE_02");
};

func void rtn_start_961()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM3_GAAN");
	ta_stand_armscrossed(23,0,8,0,"NW_FARM3_STABLE_REST_02");
};

func void rtn_rangeradd_961()
{
	ta_stand_armscrossed(8,0,16,0,"NW_FARM3_GAANADD");
	ta_sit_chair(16,0,0,0,"NW_FARM3_HOUSE_IN_CHAIR");
	ta_sleep(0,0,8,0,"NW_FARM3_HOUSE_IN_BED");
};

func void rtn_prerangermeeting_961()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_03");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_03");
};

func void rtn_rangermeeting_961()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_parking_961()
{
	ta_stand_armscrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_stand_armscrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

