
instance VLK_491_VANJA(NPC_DEFAULT)
{
	name[0] = "Vanja";
	guild = GIL_VLK;
	id = 491;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_B_REDLOCKS,BODYTEXBABE_B,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_491;
};


func void rtn_start_491()
{
	ta_stand_sweeping(8,0,8,30,"NW_CITY_PUFF_ROOM_01");
	ta_stand_sweeping(8,30,9,0,"NW_CITY_HABOUR_PUFF_PECK");
	ta_stand_sweeping(9,0,9,30,"NW_CITY_HABOUR_PUFF_SONJA");
	ta_stand_sweeping(9,30,10,0,"NW_CITY_HABOUR_PUFF_NADJA");
	ta_sweep_fp(10,0,10,30,"NW_CITY_PUFF_ROOM_01");
	ta_sweep_fp(10,30,11,0,"NW_CITY_HABOUR_PUFF_PECK");
	ta_sweep_fp(11,0,11,30,"NW_CITY_HABOUR_PUFF_SONJA");
	ta_sweep_fp(11,30,12,0,"NW_CITY_HABOUR_PUFF_NADJA");
	ta_smalltalk(12,0,17,0,"NW_CITY_HABOUR_PUFF_VANJA");
	ta_smoke_joint(17,0,17,30,"NW_CITY_HABOUR_PECK_VANYA");
	ta_smalltalk(17,30,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

func void rtn_alone_491()
{
	ta_stand_sweeping(8,0,23,0,"NW_CITY_HABOUR_PUFF_VANJA");
	ta_stand_sweeping(23,0,8,0,"NW_CITY_HABOUR_PUFF_VANJA");
};

