
instance BDT_10012_ADDON_BANDIT(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 10012;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_TAL_AMBIENT;
	aivar[91] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itsh_g3_01_old);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_TOUGH_SANTINO,BODYTEX_L,itar_bdt_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_10012;
};


func void rtn_start_10012()
{
	ta_sit_bench(22,2,6,0,"ADW_SWAMP_SIT_BENCH_01");
	ta_smalltalk(6,0,10,2,"BL_FIGHT_03");
	ta_sit_bench(10,2,11,56,"ADW_SWAMP_SIT_BENCH_01");
	ta_smalltalk(11,56,14,2,"BL_FIGHT_03");
	ta_sit_bench(14,2,14,56,"ADW_SWAMP_SIT_BENCH_01");
	ta_smalltalk(14,56,16,14,"BL_FIGHT_03");
	ta_sit_bench(16,14,17,16,"ADW_SWAMP_SIT_BENCH_01");
	ta_smalltalk(17,16,22,2,"BL_FIGHT_03");
};

