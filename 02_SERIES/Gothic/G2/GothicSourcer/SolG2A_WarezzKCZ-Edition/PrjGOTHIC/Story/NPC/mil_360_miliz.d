
instance MIL_360_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 360;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_TOUGHBALD_NEK,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_360;
};


func void rtn_start_360()
{
	ta_stand_guarding(4,45,21,0,"NW_CITY_TEMPLE_VTRS_02");
	ta_stand_guarding(21,0,4,45,"NW_CITY_ANDRE_ADDWATCH");
};

