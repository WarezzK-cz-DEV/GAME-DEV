
instance PAL_217_MARCOS(NPC_DEFAULT)
{
	name[0] = "Marcos";
	guild = GIL_OUT;
	id = 217;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_OCMAIN;
	aivar[91] = TRUE;
	aivar[90] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_pal_sword);
	EquipItem(self,itsh_paladin_a);
	CreateInvItems(self,itpo_health_03,2);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_TOUGH_RODRIGUEZ,BODYTEX_P,itar_pal_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_start_217;
};


func void rtn_start_217()
{
	ta_stand_guarding(8,0,23,0,"OW_STAND_MRCS");
	ta_stand_guarding(23,0,8,0,"OW_STAND_MRCS");
};

