
instance SLD_805_CORD(NPC_DEFAULT)
{
	name[0] = "Cord";
	guild = GIL_NONE;
	id = 805;
	aivar[90] = TRUE;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NPCISRANGER] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_2h_special_01);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_CORD,BODYTEX_N,itar_sld_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_805;
};


func void rtn_start_805()
{
	ta_practice_sword(7,40,18,25,"NW_BIGFARM_CORD");
	ta_sit_chair(18,25,23,0,"NW_BIGFARM_HOUSE_19_SLDSIT");
	ta_sleep(23,0,7,40,"NW_BIGFARM_HOUSE_08");
};

func void rtn_prerangermeeting_805()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_04");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_04");
};

func void rtn_rangermeeting_805()
{
	ta_rangermeeting(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_rangermeeting(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

func void rtn_parking_805()
{
	ta_stand_armscrossed(5,0,20,0,"NW_TAVERNE_IN_RANGERMEETING");
	ta_stand_armscrossed(20,0,5,0,"NW_TAVERNE_IN_RANGERMEETING");
};

