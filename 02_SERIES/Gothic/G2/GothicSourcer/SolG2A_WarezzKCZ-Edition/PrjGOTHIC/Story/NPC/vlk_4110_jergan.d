
instance VLK_4110_JERGAN(NPC_DEFAULT)
{
	name[0] = "Jergan";
	guild = GIL_NONE;
	id = 4110;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_IGNORESARMOR] = TRUE;
	aivar[AIV_NPCISRANGER] = TRUE;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	EquipItem(self,itrw_bow_m_03);
	b_createambientinv(self);
	CreateInvItems(self,itrw_arrow,15);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WHISTLER,BODYTEX_PLAYER,itar_troll_addon);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,85);
	daily_routine = rtn_start_4110;
};


func void rtn_start_4110()
{
	ta_stand_armscrossed(8,0,23,0,"OW_STAND_JERGAN");
	ta_stand_armscrossed(23,0,8,0,"OW_STAND_JERGAN");
};

func void rtn_fajeth_4110()
{
	ta_stand_armscrossed(8,0,23,0,"OW_NEWMINE_04");
	ta_stand_armscrossed(23,0,8,0,"OW_NEWMINE_04");
};

