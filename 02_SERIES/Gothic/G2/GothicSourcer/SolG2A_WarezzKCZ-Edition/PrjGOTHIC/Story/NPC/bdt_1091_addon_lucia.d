
instance BDT_1091_ADDON_LUCIA(NPC_DEFAULT)
{
	name[0] = "Lucia";
	guild = GIL_BDT;
	id = 1091;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_BL_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_rapier);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_GREYCLOTH,BODYTEXBABE_F,itar_lucia_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_1091;
};


func void rtn_start_1091()
{
	ta_stand_wp(7,0,12,0,"BL_INN_05_D");
	ta_stand_sweeping(12,0,14,0,"BL_INN_05_B");
	ta_stand_wp(14,0,14,50,"BL_INN_05_D");
	ta_sit_chair(14,50,15,10,"BL_INN_UPSIDE_SLEEP_02");
	ta_bathtub(15,10,16,0,"BL_INN_UPSIDE_BATH_01");
	ta_stand_wp(16,0,17,0,"BL_INN_05_D");
	ta_stand_sweeping(17,0,17,50,"BL_INN_05_B");
	ta_sit_chair(17,50,18,0,"BL_INN_UPSIDE_SLEEP_02");
	ta_bathtub(18,0,19,0,"BL_INN_UPSIDE_BATH_01");
	ta_stand_wp(19,0,21,0,"BL_INN_05_D");
	ta_potion_alchemy(21,0,1,0,"BL_INN_UP_LABOR");
	ta_sleep(1,0,7,0,"BL_INN_UPSIDE_SLEEP_01");
};

