
instance PAL_2004_BRUDER(NPC_DEFAULT)
{
	name[0] = NAME_PALADIN;
	guild = GIL_NONE;
	id = 2004;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	attribute[ATR_STRENGTH] = 10;
	attribute[ATR_DEXTERITY] = 10;
	attribute[ATR_MANA_MAX] = 0;
	attribute[ATR_MANA] = 0;
	attribute[ATR_HITPOINTS_MAX] = 1;
	attribute[ATR_HITPOINTS] = 1;
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	CreateInvItems(self,itru_pallight,1);
	CreateInvItems(self,itru_teleportpassow,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL02,BODYTEX_N,itar_pal_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_2004;
};


func void rtn_start_2004()
{
	ta_stand_guarding(8,0,23,0,"OW_SPAWN_BRUDER");
	ta_stand_guarding(23,0,8,0,"OW_SPAWN_BRUDER");
};

