
instance KDF_512_CORIOLAN(NPC_DEFAULT)
{
	name[0] = "Coriolan";
	guild = GIL_KDF;
	id = 512;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_GILBERT,BODYTEX_B,itar_kdf_l_wh);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_start_512;
};


func void rtn_start_512()
{
	ta_guard_passage(8,0,23,0,"NW_MONASTERY_CORIOLAN");
	ta_guard_passage(23,0,8,0,"NW_MONASTERY_CORIOLAN");
};

