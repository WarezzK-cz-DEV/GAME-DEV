
instance BDT_10016_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10016;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	aivar[AIV_STORYBANDIT_ESTEBAN] = TRUE;
	aivar[AIV_STORYBANDIT] = TRUE;
	aivar[91] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itsh_g3_01_old);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_FINGERS,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_10016;
};


func void rtn_start_10016()
{
	ta_sit_chair(2,0,10,0,"ADW_SENAT_CAVE_CHAIR");
	ta_sit_chair(10,0,2,0,"ADW_SENAT_CAVE_CHAIR");
};

func void rtn_stand_10016()
{
	ta_stand_wp(2,0,10,0,"ADW_SENAT_CAVE_CHAIR");
	ta_stand_wp(10,0,2,0,"ADW_SENAT_CAVE_CHAIR");
};

