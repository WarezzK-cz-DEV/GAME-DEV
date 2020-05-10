
instance BAU_981_GROM(NPC_DEFAULT)
{
	name[0] = "Grom";
	guild = GIL_OUT;
	id = 981;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_GILBERT,BODYTEX_P,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_981;
};


func void rtn_start_981()
{
	ta_campfire_fry(8,0,9,0,"NW_CASTLEMINE_TROLL_CAMPFIRE");
	ta_woodcutting(9,0,13,0,"NW_CASTLEMINE_TROLL_04_C");
	ta_campfire_fry(13,0,14,0,"NW_CASTLEMINE_TROLL_CAMPFIRE");
	ta_woodcutting(14,0,16,0,"NW_CASTLEMINE_TROLL_04_C");
	ta_campfire_fry(16,0,17,0,"NW_CASTLEMINE_TROLL_CAMPFIRE");
	ta_woodcutting(17,0,19,0,"NW_CASTLEMINE_TROLL_04_C");
	ta_campfire_fry(19,0,20,0,"NW_CASTLEMINE_TROLL_CAMPFIRE");
	ta_woodcutting(20,0,21,0,"NW_CASTLEMINE_TROLL_04_C");
	ta_campfire_fry(21,0,23,0,"NW_CASTLEMINE_TROLL_CAMPFIRE");
	ta_sleep(23,0,8,0,"NW_CASTLEMINE_TROLL_04_B");
};

