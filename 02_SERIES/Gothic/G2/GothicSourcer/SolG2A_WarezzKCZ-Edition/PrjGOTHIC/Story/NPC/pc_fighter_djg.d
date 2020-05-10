
instance PC_FIGHTER_DJG(NPC_DEFAULT)
{
	name[0] = "Gorn";
	guild = GIL_DJG;
	id = 704;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_IGNORESARMOR] = TRUE;
	level = 40;
	attribute[ATR_STRENGTH] = 300;
	attribute[ATR_DEXTERITY] = 150;
	attribute[ATR_MANA_MAX] = 10;
	attribute[ATR_MANA] = 10;
	attribute[ATR_HITPOINTS_MAX] = 2000;
	attribute[ATR_HITPOINTS] = 2000;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_berserkeraxt);
	EquipItem(self,itrw_crossbow_m_01);
	CreateInvItems(self,itpo_health_addon_04,3);
	CreateInvItems(self,itmi_oldcoin,1);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_GORN,BODYTEX_B,itar_djg_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,90);
	daily_routine = rtn_prestart_704;
};


func void rtn_prestart_704()
{
	ta_stand_armscrossed(8,0,23,0,"OW_DJG_STARTCAMP_01");
	ta_stand_armscrossed(23,0,8,0,"OW_DJG_STARTCAMP_01");
};

func void rtn_start_704()
{
	ta_sit_campfire(8,0,23,0,"OW_CAMP_GESTATH");
	ta_sit_campfire(23,0,8,0,"OW_CAMP_GESTATH");
};

func void rtn_runtorockruinbridge_704()
{
	ta_runtowp(8,0,23,0,"LOCATION_19_01");
	ta_runtowp(23,0,8,0,"LOCATION_19_01");
};

func void rtn_tot_704()
{
	ta_stand_armscrossed(8,0,23,0,"TOT");
	ta_stand_armscrossed(23,0,8,0,"TOT");
};

