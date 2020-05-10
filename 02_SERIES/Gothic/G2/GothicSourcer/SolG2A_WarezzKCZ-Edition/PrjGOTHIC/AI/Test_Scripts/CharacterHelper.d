
var int levelup;
var int levelstart;
var int magiestart;
var int attributestart;
var int kampfstart;
var int diebstart;

instance MOBSIBRIEF(C_ITEM)
{
	name = "MobsiBrief";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemobsibrief;
	scemename = "MAP";
	description = name;
};


func void usemobsibrief()
{
	var int ndocid;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"StandardBrief");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Now everything will be all right again.");
	Doc_PrintLines(ndocid,0,"PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;");
	Doc_PrintLines(ndocid,0,"self.aivar[AIV_INVINCIBLE] = FALSE;");
	Doc_Show(ndocid);
};


instance ITSE_ADDON_SACK(C_ITEM)
{
	name = "The bag is full of new weapons!";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 25;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_sack;
	description = name;
	text[1] = "Many different weapons";
};


func void use_sack()
{
	Print("I found a stack of new weapons!");
	CreateInvItems(self,itmw_1h_sword_l_03,1);
	CreateInvItems(self,itmw_addon_stab01,1);
	CreateInvItems(self,itmw_addon_stab02,1);
	CreateInvItems(self,itmw_addon_stab03,1);
	CreateInvItems(self,itmw_addon_stab04,1);
	CreateInvItems(self,itmw_addon_stab05,1);
	CreateInvItems(self,itmw_addon_hacker_1h_01,1);
	CreateInvItems(self,itmw_addon_hacker_2h_01,1);
	CreateInvItems(self,itmw_addon_hacker_2h_02,1);
	CreateInvItems(self,itmw_addon_hacker_1h_02,1);
	CreateInvItems(self,itmw_addon_keule_1h_01,1);
	CreateInvItems(self,itmw_addon_keule_2h_01,1);
};


instance ITFO_TESTTRIGGER(C_ITEM)
{
	name = "Trigger 'Enter Jharkendar first time' function";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemename = "FOODHUGE";
	on_state[0] = use_testtrigger;
	description = name;
};


func void use_testtrigger()
{
	enter_addonworld_firsttime_trigger_func();
};


instance CH(NPC_DEFAULT)
{
	name[0] = "Character helper";
	guild = GIL_NONE;
	id = 0;
	voice = 15;
	flags = 0;
	npctype = NPCTYPE_FRIEND;
	aivar[AIV_IGNORESARMOR] = TRUE;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	fight_tactic = FAI_HUMAN_MASTER;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_PLAYER,BODYTEX_PLAYER,-1);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_0;
};


func void rtn_start_0()
{
	ta_stand_armscrossed(8,0,23,0,"XXX");
	ta_stand_armscrossed(23,0,8,0,"XXX");
};

func void b_setheroexp()
{
	var string attributes;
	hero.exp = 250 * (hero.level + 1) * hero.level;
	hero.exp_next = 250 * (hero.level + 2) * (hero.level + 1);
	hero.lp = hero.level * LP_PER_LEVEL;
	hero.attribute[ATR_HITPOINTS_MAX] = 40 + (10 * hero.level);
	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	attributes = "Level up! Learning points: ";
	attributes = ConcatStrings(attributes,IntToString(hero.lp));
	attributes = ConcatStrings(attributes," Hitpoints: ");
	attributes = ConcatStrings(attributes,IntToString(hero.attribute[ATR_HITPOINTS_MAX]));
	PrintScreen(attributes,-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void b_setheroweapon()
{
	if(hero.level <= 6)
	{
		CreateInvItems(hero,itrw_crossbow_l_01,1);
	}
	else if(hero.level <= 12)
	{
		CreateInvItems(hero,itrw_bow_l_04,1);
		CreateInvItems(hero,itrw_crossbow_l_02,1);
	}
	else if(hero.level <= 18)
	{
		CreateInvItems(hero,itrw_bow_m_02,1);
		CreateInvItems(hero,itrw_crossbow_m_02,1);
	}
	else if(hero.level <= 24)
	{
		CreateInvItems(hero,itrw_bow_m_04,1);
		CreateInvItems(hero,itrw_crossbow_h_01,1);
	}
	else if(hero.level <= 30)
	{
		CreateInvItems(hero,itrw_bow_h_02,1);
		CreateInvItems(hero,itrw_crossbow_h_02,1);
	}
	else if(hero.level <= 36)
	{
		CreateInvItems(hero,itrw_bow_h_04,1);
		CreateInvItems(hero,itrw_bow_l_04,1);
	};
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
};

func void b_setheroequipment()
{
	CreateInvItems(hero,itrw_arrow,300);
	CreateInvItems(hero,itlstorch,30);
	CreateInvItems(hero,itmi_gold,50000);
	CreateInvItems(hero,itpo_health_addon_04,25);
	CreateInvItems(hero,itpo_mana_addon_04,25);
	CreateInvItems(hero,itke_lockpick,30);
	CreateInvItems(hero,itmw_flameberge,1);
	CreateInvItems(hero,itmw_anduril,1);
	CreateInvItems(hero,itar_geralt_addon,1);
	CreateInvItems(hero,itrw_bow_h_04,1);
};

func void b_setkdfrunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1)
	{
		CreateInvItems(hero,itru_light,1);
		CreateInvItems(hero,itru_firebolt,1);
		CreateInvItems(hero,itru_lightheal,1);
		CreateInvItems(hero,itru_sumgobskel,1);
		CreateInvItems(hero,itru_zap,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		CreateInvItems(hero,itru_instantfireball,1);
		CreateInvItems(hero,itru_icebolt,1);
		CreateInvItems(hero,itru_sumwolf,1);
		CreateInvItems(hero,itru_windfist,1);
		CreateInvItems(hero,itru_sleep,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		CreateInvItems(hero,itru_mediumheal,1);
		CreateInvItems(hero,itru_firestorm,1);
		CreateInvItems(hero,itru_thunderball,1);
		CreateInvItems(hero,itru_sumskel,1);
		CreateInvItems(hero,itru_fear,1);
		CreateInvItems(hero,itru_icecube,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		CreateInvItems(hero,itru_sumgol,1);
		CreateInvItems(hero,itru_harmundead,1);
		CreateInvItems(hero,itru_lightningflash,1);
		CreateInvItems(hero,itru_chargefireball,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		CreateInvItems(hero,itru_pyrokinesis,1);
		CreateInvItems(hero,itru_icewave,1);
		CreateInvItems(hero,itru_sumdemon,1);
		CreateInvItems(hero,itru_fullheal,1);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		CreateInvItems(hero,itru_firerain,1);
		CreateInvItems(hero,itru_breathofdeath,1);
		CreateInvItems(hero,itru_massdeath,1);
		CreateInvItems(hero,itru_armyofdarkness,1);
		CreateInvItems(hero,itru_shrink,1);
	};
};

func void b_setkdwrunes()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2)
	{
		CreateInvItem(hero,itru_icelance);
		CreateInvItem(hero,itru_whirlwind);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		CreateInvItem(hero,itru_thunderstorm);
		CreateInvItem(hero,itru_geyser);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		CreateInvItem(hero,itru_waterfist);
	};
};

func void b_setpaladinequipment()
{
	CreateInvItems(hero,itru_pallight,1);
	CreateInvItems(hero,itru_pallightheal,1);
	CreateInvItems(hero,itru_palholybolt,1);
	CreateInvItems(hero,itru_palmediumheal,1);
	CreateInvItems(hero,itru_palrepelevil,1);
	CreateInvItems(hero,itru_palfullheal,1);
	CreateInvItems(hero,itru_paldestroyevil,1);
	CreateInvItems(hero,itru_palteleportsecret,1);
};


instance CH_EXIT(C_INFO)
{
	npc = ch;
	nr = 999;
	condition = ch_exit_condition;
	information = ch_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int ch_exit_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (LEVELUP == FALSE))
	{
		return TRUE;
	};
};

func void ch_exit_info()
{
	AI_StopProcessInfos(self);
	LEVELUP = FALSE;
	LEVELSTART = FALSE;
	MAGIESTART = FALSE;
	ATTRIBUTESTART = FALSE;
	KAMPFSTART = FALSE;
	DIEBSTART = FALSE;
};


instance CH_RESET(C_INFO)
{
	npc = ch;
	nr = 20;
	condition = ch_reset_condition;
	information = ch_reset_info;
	permanent = TRUE;
	description = "Total character reset";
};


func int ch_reset_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_reset_info()
{
	hero.guild = GIL_NONE;
	Npc_SetTrueGuild(hero,GIL_NONE);
	hero.lp = 10;
	hero.level = 1;
	hero.exp = 24990;
	hero.exp_next = 25000;
	hero.attribute[ATR_STRENGTH] = 10;
	hero.attribute[ATR_DEXTERITY] = 10;
	hero.attribute[ATR_MANA_MAX] = 10;
	hero.attribute[ATR_MANA] = 10;
	hero.attribute[ATR_HITPOINTS] = 10;
	hero.attribute[ATR_HITPOINTS_MAX] = 10;
	Npc_SetTalentSkill(hero,NPC_TALENT_ALCHEMY,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_RUNES,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_MAGE,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_BOW,0);
	other.hitchance[NPC_TALENT_BOW] = 1;
	Npc_SetTalentSkill(hero,NPC_TALENT_CROSSBOW,0);
	other.hitchance[NPC_TALENT_CROSSBOW] = 1;
	Npc_SetTalentSkill(hero,NPC_TALENT_1H,0);
	other.hitchance[NPC_TALENT_1H] = 1;
	Npc_SetTalentSkill(hero,NPC_TALENT_2H,0);
	other.hitchance[NPC_TALENT_2H] = 1;
	Npc_SetTalentSkill(hero,NPC_TALENT_SNEAK,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_PICKLOCK,1);
	Npc_SetTalentSkill(hero,NPC_TALENT_PICKPOCKET,0);
	Npc_SetTalentSkill(hero,NPC_TALENT_TAKEANIMALTROPHY,0);
	AI_EquipBestArmor(hero);
	AI_EquipBestMeleeWeapon(hero);
	AI_EquipBestRangedWeapon(hero);
};


instance CH_TELE1(C_INFO)
{
	npc = ch;
	nr = 25;
	condition = ch_tele1_condition;
	information = ch_tele1_info;
	permanent = TRUE;
	description = "Teleport to the Valley of Mines";
};


func int ch_tele1_condition()
{
	if((LEVELSTART == TRUE) && (CURRENTLEVEL == NEWWORLD_ZEN))
	{
		return TRUE;
	};
};

func void ch_tele1_info()
{
	Npc_ClearAIQueue(hero);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NW_TELEPORTSTATION_MT");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
};


instance CH_TELEOW1(C_INFO)
{
	npc = ch;
	nr = 25;
	condition = ch_teleow1_condition;
	information = ch_teleow1_info;
	permanent = TRUE;
	description = "Teleport to the Castle";
};


func int ch_teleow1_condition()
{
	if((LEVELSTART == TRUE) && (CURRENTLEVEL == OLDWORLD_ZEN))
	{
		return TRUE;
	};
};

func void ch_teleow1_info()
{
	Npc_ClearAIQueue(hero);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"OC_CENTER_05_B");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
};


instance CH_TELE2(C_INFO)
{
	npc = ch;
	nr = 27;
	condition = ch_tele2_condition;
	information = ch_tele2_info;
	permanent = TRUE;
	description = "Teleport to the city";
};


func int ch_tele2_condition()
{
	if((LEVELSTART == TRUE) && (CURRENTLEVEL == NEWWORLD_ZEN))
	{
		return TRUE;
	};
};

func void ch_tele2_info()
{
	Npc_ClearAIQueue(hero);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NW_CITY_MAINSTREET_03");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
};


instance CH_TELE3(C_INFO)
{
	npc = ch;
	nr = 26;
	condition = ch_tele3_condition;
	information = ch_tele3_info;
	permanent = TRUE;
	description = "Teleport to Jharkendar";
};


func int ch_tele3_condition()
{
	if((LEVELSTART == TRUE) && (CURRENTLEVEL == NEWWORLD_ZEN))
	{
		return TRUE;
	};
};

func void ch_tele3_info()
{
	Npc_ClearAIQueue(hero);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"NW_TROLLAREA_PORTAL_09");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
};


instance CH_TELE4(C_INFO)
{
	npc = ch;
	nr = 28;
	condition = ch_tele4_condition;
	information = ch_tele4_info;
	permanent = TRUE;
	description = "Teleport to monastery";
};


func int ch_tele4_condition()
{
	if((LEVELSTART == TRUE) && (CURRENTLEVEL == NEWWORLD_ZEN))
	{
		return TRUE;
	};
};

func void ch_tele4_info()
{
	Npc_ClearAIQueue(hero);
	Wld_PlayEffect("spellFX_Teleport_RING",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_TELEPORT_CAST");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
	AI_Teleport(hero,"KLOSTER");
	AI_StopProcessInfos(self);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(hero);
	AI_StopProcessInfos(other);
	AI_StopProcessInfos(self);
};


instance CH_GUILD(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = ch_guild_condition;
	information = ch_guild_info;
	important = FALSE;
	permanent = TRUE;
	description = "Guild choice";
};


func int ch_guild_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_guild_info()
{
	Info_ClearChoices(ch_guild);
	Info_AddChoice(ch_guild,DIALOG_BACK,ch_guild_back);
	Info_AddChoice(ch_guild,"Novice",ch_nov);
	Info_AddChoice(ch_guild,"Magician",ch_kdf);
	Info_AddChoice(ch_guild,"Mercenary",ch_sld);
	Info_AddChoice(ch_guild,"Dragon hunter",ch_djg);
	Info_AddChoice(ch_guild,"Militia",ch_mil);
	Info_AddChoice(ch_guild,"Paladin",ch_pal);
	Info_AddChoice(ch_guild,"Guildless",ch_none);
	Info_AddChoice(ch_guild,"Fake bandit",ch_fakebandit);
};

func void ch_guild_back()
{
	Info_ClearChoices(ch_guild);
};

func void ch_fakebandit()
{
	CreateInvItems(hero,itar_bdt_m,1);
	CreateInvItems(hero,itar_bdt_h,1);
	CreateInvItems(hero,itar_oldcamp_guard_h,1);
	AI_EquipBestArmor(hero);
};

func void ch_nov()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	CreateInvItem(hero,itar_nov_l);
	AI_EquipArmor(hero,itar_nov_l);
};

func void ch_kdf()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_KDF;
	Npc_SetTrueGuild(other,GIL_KDF);
	CreateInvItem(hero,itar_kdf_l);
	AI_EquipArmor(hero,itar_kdf_l);
};

func void ch_sld()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_SLD;
	Npc_SetTrueGuild(other,GIL_SLD);
	CreateInvItem(hero,itar_sld_h);
	AI_EquipArmor(hero,itar_sld_h);
};

func void ch_djg()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_DJG;
	Npc_SetTrueGuild(other,GIL_DJG);
	CreateInvItem(hero,itar_djg_m);
	AI_EquipArmor(hero,itar_djg_m);
};

func void ch_mil()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_MIL;
	Npc_SetTrueGuild(other,GIL_MIL);
	CreateInvItem(hero,itar_mil_l);
	AI_EquipArmor(hero,itar_mil_l);
};

func void ch_pal()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	CreateInvItem(hero,itar_pal_h);
	AI_EquipArmor(hero,itar_pal_h);
	b_setpaladinequipment();
};

func void ch_none()
{
	Info_ClearChoices(ch_guild);
	other.guild = GIL_NONE;
	Npc_SetTrueGuild(other,GIL_NONE);
	AI_UnequipArmor(hero);
};


instance CH_LEVEL_START(C_INFO)
{
	npc = ch;
	condition = ch_level_start_condition;
	information = ch_level_start_info;
	description = "Level, learning points, guild";
	permanent = TRUE;
};


func int ch_level_start_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (LEVELUP == FALSE))
	{
		return TRUE;
	};
};

func void ch_level_start_info()
{
	LEVELSTART = TRUE;
};


instance CH_LEVEL_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = ch_level_stopper_condition;
	information = ch_level_stopper_info;
	description = DIALOG_BACK;
	permanent = TRUE;
};


func int ch_level_stopper_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_level_stopper_info()
{
	Info_ClearChoices(ch_level_stopper);
	LEVELSTART = FALSE;
};


instance CH_LERNPUNKTE(C_INFO)
{
	npc = ch;
	nr = 1;
	condition = ch_lernpunkte_condition;
	information = ch_lernpunkte_info;
	description = "Learning points";
	permanent = TRUE;
};


func int ch_lernpunkte_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_lernpunkte_info()
{
	Info_ClearChoices(ch_lernpunkte);
	Info_AddChoice(ch_lernpunkte,DIALOG_BACK,ch_lernpunkte_back);
	Info_AddChoice(ch_lernpunkte,"Learning points +50",ch_lernpunkte_50);
	Info_AddChoice(ch_lernpunkte,"Learning points +25",ch_lernpunkte_25);
	Info_AddChoice(ch_lernpunkte,"Learning points +10",ch_lernpunkte_10);
	Info_AddChoice(ch_lernpunkte,"Learning points +5 ",ch_lernpunkte_5);
};

func void ch_lernpunkte_back()
{
	Info_ClearChoices(ch_lernpunkte);
};

func void ch_lernpunkte_50()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 50;
	PrintScreen("+50 Learning points",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void ch_lernpunkte_25()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 25;
	PrintScreen("+25 Learning points",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void ch_lernpunkte_10()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 10;
	PrintScreen("+10 Learning points",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};

func void ch_lernpunkte_5()
{
	Info_ClearChoices(ch_lernpunkte);
	hero.lp = hero.lp + 5;
	PrintScreen("+5 Learning points",-1,-1,FONT_SCREEN,3);
	Snd_Play("LEVELUP");
};


instance CH_LEVELUP(C_INFO)
{
	npc = ch;
	nr = 2;
	condition = ch_levelup_condition;
	information = ch_levelup_info;
	description = "Level up";
	permanent = TRUE;
};


func int ch_levelup_condition()
{
	if(LEVELSTART == TRUE)
	{
		return TRUE;
	};
};

func void ch_levelup_info()
{
	LEVELUP = TRUE;
	LEVELSTART = FALSE;
};


instance CH_LEVELUP_STOP(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = ch_levelup_stop_condition;
	information = ch_levelup_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int ch_levelup_stop_condition()
{
	if(LEVELUP == TRUE)
	{
		return TRUE;
	};
};

func void ch_levelup_stop_info()
{
	LEVELSTART = TRUE;
	LEVELUP = FALSE;
};


instance CH_LEVEL_NIEDRIG(C_INFO)
{
	npc = ch;
	nr = 2;
	condition = ch_level_niedrig_condition;
	information = ch_level_niedrig_info;
	description = "Level choice 1-25";
	permanent = TRUE;
};


func int ch_level_niedrig_condition()
{
	if(LEVELUP == TRUE)
	{
		return TRUE;
	};
};

func void ch_level_niedrig_info()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Level 21-25",ch_level21);
	Info_AddChoice(ch_level_niedrig,"Level 16-20",ch_level16);
	Info_AddChoice(ch_level_niedrig,"Level 11-15",ch_level11);
	Info_AddChoice(ch_level_niedrig,"Level 6-10",ch_level6);
	Info_AddChoice(ch_level_niedrig,"Level 1-5",ch_level1);
};


instance CH_LEVEL_HOCH(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = ch_level_hoch_condition;
	information = ch_level_hoch_info;
	description = "Level choice 26-50";
	permanent = TRUE;
};


func int ch_level_hoch_condition()
{
	if(LEVELUP == TRUE)
	{
		return TRUE;
	};
};

func void ch_level_hoch_info()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Level 46-50",ch_level46);
	Info_AddChoice(ch_level_hoch,"Level 41-45",ch_level41);
	Info_AddChoice(ch_level_hoch,"Level 36-40",ch_level36);
	Info_AddChoice(ch_level_hoch,"Level 31-35",ch_level31);
	Info_AddChoice(ch_level_hoch,"Level 26-30",ch_level26);
};

func void ch_level46()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Level 50",ch_level_50);
	Info_AddChoice(ch_level_hoch,"Level 49",ch_level_49);
	Info_AddChoice(ch_level_hoch,"Level 48",ch_level_48);
	Info_AddChoice(ch_level_hoch,"Level 47",ch_level_47);
	Info_AddChoice(ch_level_hoch,"Level 46",ch_level_46);
};

func void ch_level41()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Level 45",ch_level_45);
	Info_AddChoice(ch_level_hoch,"Level 44",ch_level_44);
	Info_AddChoice(ch_level_hoch,"Level 43",ch_level_43);
	Info_AddChoice(ch_level_hoch,"Level 42",ch_level_42);
	Info_AddChoice(ch_level_hoch,"Level 41",ch_level_41);
};

func void ch_level36()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Level 40",ch_level_40);
	Info_AddChoice(ch_level_hoch,"Level 39",ch_level_39);
	Info_AddChoice(ch_level_hoch,"Level 38",ch_level_38);
	Info_AddChoice(ch_level_hoch,"Level 37",ch_level_37);
	Info_AddChoice(ch_level_hoch,"Level 36",ch_level_36);
};

func void ch_level31()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Level 35",ch_level_35);
	Info_AddChoice(ch_level_hoch,"Level 34",ch_level_34);
	Info_AddChoice(ch_level_hoch,"Level 33",ch_level_33);
	Info_AddChoice(ch_level_hoch,"Level 32",ch_level_32);
	Info_AddChoice(ch_level_hoch,"Level 31",ch_level_31);
};

func void ch_level26()
{
	Info_ClearChoices(ch_level_hoch);
	Info_AddChoice(ch_level_hoch,DIALOG_BACK,ch_level_hoch_back);
	Info_AddChoice(ch_level_hoch,"Level 30",ch_level_30);
	Info_AddChoice(ch_level_hoch,"Level 29",ch_level_29);
	Info_AddChoice(ch_level_hoch,"Level 28",ch_level_28);
	Info_AddChoice(ch_level_hoch,"Level 27",ch_level_27);
	Info_AddChoice(ch_level_hoch,"Level 26",ch_level_26);
};

func void ch_level21()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Level 25",ch_level_25);
	Info_AddChoice(ch_level_niedrig,"Level 24",ch_level_24);
	Info_AddChoice(ch_level_niedrig,"Level 23",ch_level_23);
	Info_AddChoice(ch_level_niedrig,"Level 22",ch_level_22);
	Info_AddChoice(ch_level_niedrig,"Level 21",ch_level_21);
};

func void ch_level16()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Level 20",ch_level_20);
	Info_AddChoice(ch_level_niedrig,"Level 19",ch_level_19);
	Info_AddChoice(ch_level_niedrig,"Level 18",ch_level_18);
	Info_AddChoice(ch_level_niedrig,"Level 17",ch_level_17);
	Info_AddChoice(ch_level_niedrig,"Level 16",ch_level_16);
};

func void ch_level11()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Level 15",ch_level_15);
	Info_AddChoice(ch_level_niedrig,"Level 14",ch_level_14);
	Info_AddChoice(ch_level_niedrig,"Level 13",ch_level_13);
	Info_AddChoice(ch_level_niedrig,"Level 12",ch_level_12);
	Info_AddChoice(ch_level_niedrig,"Level 11",ch_level_11);
};

func void ch_level6()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Level 10",ch_level_10);
	Info_AddChoice(ch_level_niedrig,"Level 9",ch_level_9);
	Info_AddChoice(ch_level_niedrig,"Level 8",ch_level_8);
	Info_AddChoice(ch_level_niedrig,"Level 7",ch_level_7);
	Info_AddChoice(ch_level_niedrig,"Level 6",ch_level_6);
};

func void ch_level1()
{
	Info_ClearChoices(ch_level_niedrig);
	Info_AddChoice(ch_level_niedrig,DIALOG_BACK,ch_level_niedrig_back);
	Info_AddChoice(ch_level_niedrig,"Level 5",ch_level_5);
	Info_AddChoice(ch_level_niedrig,"Level 4",ch_level_4);
	Info_AddChoice(ch_level_niedrig,"Level 3",ch_level_3);
	Info_AddChoice(ch_level_niedrig,"Level 2",ch_level_2);
	Info_AddChoice(ch_level_niedrig,"Level 1",ch_level_1);
};

func void ch_level_niedrig_back()
{
	Info_ClearChoices(ch_level_niedrig);
};

func void ch_level_hoch_back()
{
	Info_ClearChoices(ch_level_hoch);
};

func void ch_level_1()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 1;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_2()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 2;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_3()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 3;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_4()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 4;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_5()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 5;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_6()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 6;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_7()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 7;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_8()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 8;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_9()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 9;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_10()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 10;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_11()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 11;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_12()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 12;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_13()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 13;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_14()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 14;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_15()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 15;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_16()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 16;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_17()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 17;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_18()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 18;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_19()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 19;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_20()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 20;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_21()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 21;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_22()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 22;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_23()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 23;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_24()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 24;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_25()
{
	Info_ClearChoices(ch_level_niedrig);
	hero.level = 25;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_26()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 26;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_27()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 27;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_28()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 28;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_29()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 29;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_30()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 30;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_31()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 31;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_32()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 32;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_33()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 33;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_34()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 34;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_35()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 35;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_36()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 36;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_37()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 37;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_38()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 38;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_39()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 39;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_40()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 40;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_41()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 41;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_42()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 42;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_43()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 43;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_44()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 44;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_45()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 45;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_46()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 46;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_47()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 47;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_48()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 48;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_49()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 49;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};

func void ch_level_50()
{
	Info_ClearChoices(ch_level_hoch);
	hero.level = 50;
	b_setheroexp();
	b_setheroweapon();
	b_setheroequipment();
};


instance DIA_CH_ATTRIBUTE_START(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_attribute_start_condition;
	information = dia_ch_attribute_start_info;
	permanent = TRUE;
	description = "Strength and dexterity";
};


func int dia_ch_attribute_start_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (LEVELUP == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_attribute_start_info()
{
	ATTRIBUTESTART = TRUE;
};


instance DIA_CH_ATTRIBUTE_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_attribute_stopper_condition;
	information = dia_ch_attribute_stopper_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_ch_attribute_stopper_condition()
{
	if(ATTRIBUTESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_attribute_stopper_info()
{
	ATTRIBUTESTART = FALSE;
};


instance DIA_CH_STRENGTH(C_INFO)
{
	npc = ch;
	nr = 2;
	condition = dia_ch_strength_condition;
	information = dia_ch_strength_info;
	permanent = TRUE;
	description = "Increase strength";
};


func int dia_ch_strength_condition()
{
	if(ATTRIBUTESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_strength_info()
{
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +20",b_getlearncostattribute(other,ATR_STRENGTH,20)),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +10",b_getlearncostattribute(other,ATR_STRENGTH,10)),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +5",b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +1",b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ch_strength_1);
};

func void dia_ch_strength_back()
{
	Info_ClearChoices(dia_ch_strength);
};

func void dia_ch_strength_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +20",b_getlearncostattribute(other,ATR_STRENGTH,20)),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +10",b_getlearncostattribute(other,ATR_STRENGTH,10)),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +5",b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +1",b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ch_strength_1);
};

func void dia_ch_strength_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +20",b_getlearncostattribute(other,ATR_STRENGTH,20)),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +10",b_getlearncostattribute(other,ATR_STRENGTH,10)),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +5",b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +1",b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ch_strength_1);
};

func void dia_ch_strength_10()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,10,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +20",b_getlearncostattribute(other,ATR_STRENGTH,20)),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +10",b_getlearncostattribute(other,ATR_STRENGTH,10)),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +5",b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +1",b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ch_strength_1);
};

func void dia_ch_strength_20()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,20,T_MAX);
	Info_ClearChoices(dia_ch_strength);
	Info_AddChoice(dia_ch_strength,DIALOG_BACK,dia_ch_strength_back);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +20",b_getlearncostattribute(other,ATR_STRENGTH,20)),dia_ch_strength_20);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +10",b_getlearncostattribute(other,ATR_STRENGTH,10)),dia_ch_strength_10);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +5",b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ch_strength_5);
	Info_AddChoice(dia_ch_strength,b_buildlearnstring("Strength +1",b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ch_strength_1);
};


instance DIA_CH_DEX(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_dex_condition;
	information = dia_ch_dex_info;
	permanent = TRUE;
	description = "Increase dexterity";
};


func int dia_ch_dex_condition()
{
	if(ATTRIBUTESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_dex_info()
{
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +20",b_getlearncostattribute(other,ATR_DEXTERITY,20)),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +10",b_getlearncostattribute(other,ATR_DEXTERITY,10)),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +5",b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +1",b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ch_dex_1);
};

func void dia_ch_dex_back()
{
	Info_ClearChoices(dia_ch_dex);
};

func void dia_ch_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +20",b_getlearncostattribute(other,ATR_DEXTERITY,20)),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +10",b_getlearncostattribute(other,ATR_DEXTERITY,10)),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +5",b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +1",b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ch_dex_1);
};

func void dia_ch_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +20",b_getlearncostattribute(other,ATR_DEXTERITY,20)),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +10",b_getlearncostattribute(other,ATR_DEXTERITY,10)),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +5",b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +1",b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ch_dex_1);
};

func void dia_ch_dex_10()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,10,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +20",b_getlearncostattribute(other,ATR_DEXTERITY,20)),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +10",b_getlearncostattribute(other,ATR_DEXTERITY,10)),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +5",b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +1",b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ch_dex_1);
};

func void dia_ch_dex_20()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,20,T_MAX);
	Info_ClearChoices(dia_ch_dex);
	Info_AddChoice(dia_ch_dex,DIALOG_BACK,dia_ch_dex_back);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +20",b_getlearncostattribute(other,ATR_DEXTERITY,20)),dia_ch_dex_20);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +10",b_getlearncostattribute(other,ATR_DEXTERITY,10)),dia_ch_dex_10);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +5",b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ch_dex_5);
	Info_AddChoice(dia_ch_dex,b_buildlearnstring("Dexterity +1",b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ch_dex_1);
};


instance DIA_CH_MAGIE(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_magie_condition;
	information = dia_ch_magie_info;
	permanent = TRUE;
	description = "Magic: mana, runes, circles";
};


func int dia_ch_magie_condition()
{
	if((LEVELSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (KAMPFSTART == FALSE) && (DIEBSTART == FALSE) && (LEVELUP == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_magie_info()
{
	MAGIESTART = TRUE;
};


instance DIA_CH_MAGIE_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_magie_stopper_condition;
	information = dia_ch_magie_stopper_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_ch_magie_stopper_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_magie_stopper_info()
{
	MAGIESTART = FALSE;
};


instance DIA_CH_MANA(C_INFO)
{
	npc = ch;
	nr = 3;
	condition = dia_ch_mana_condition;
	information = dia_ch_mana_info;
	permanent = TRUE;
	description = "Increase mana";
};


func int dia_ch_mana_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_mana_info()
{
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +20",b_getlearncostattribute(other,ATR_MANA_MAX,20)),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +10",b_getlearncostattribute(other,ATR_MANA_MAX,10)),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +5",b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +1",b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_ch_mana_1);
};

func void dia_ch_mana_back()
{
	Info_ClearChoices(dia_ch_mana);
};

func void dia_ch_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +20",b_getlearncostattribute(other,ATR_MANA_MAX,20)),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +10",b_getlearncostattribute(other,ATR_MANA_MAX,10)),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +5",b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +1",b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_ch_mana_1);
};

func void dia_ch_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +20",b_getlearncostattribute(other,ATR_MANA_MAX,20)),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +10",b_getlearncostattribute(other,ATR_MANA_MAX,10)),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +5",b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +1",b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_ch_mana_1);
};

func void dia_ch_mana_10()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,10,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +20",b_getlearncostattribute(other,ATR_MANA_MAX,20)),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +10",b_getlearncostattribute(other,ATR_MANA_MAX,10)),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +5",b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +1",b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_ch_mana_1);
};

func void dia_ch_mana_20()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,20,T_MAX);
	Info_ClearChoices(dia_ch_mana);
	Info_AddChoice(dia_ch_mana,DIALOG_BACK,dia_ch_mana_back);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +20",b_getlearncostattribute(other,ATR_MANA_MAX,20)),dia_ch_mana_20);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +10",b_getlearncostattribute(other,ATR_MANA_MAX,10)),dia_ch_mana_10);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +5",b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_ch_mana_5);
	Info_AddChoice(dia_ch_mana,b_buildlearnstring("Mana +1",b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_ch_mana_1);
};


instance DIA_CH_KREISE(C_INFO)
{
	npc = ch;
	nr = 4;
	condition = dia_ch_kreise_condition;
	information = dia_ch_kreise_info;
	permanent = TRUE;
	description = "Magic Circles";
};


func int dia_ch_kreise_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kreise_info()
{
	Info_ClearChoices(dia_ch_kreise);
	Info_AddChoice(dia_ch_kreise,DIALOG_BACK,ch_kreise_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_ch_kreise,b_buildlearnstring(NAME_CIRCLE_1,b_getlearncosttalent(other,NPC_TALENT_MAGE,1)),ch_kreise_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_ch_kreise,b_buildlearnstring(NAME_CIRCLE_2,b_getlearncosttalent(other,NPC_TALENT_MAGE,2)),ch_kreise_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_ch_kreise,b_buildlearnstring(NAME_CIRCLE_3,b_getlearncosttalent(other,NPC_TALENT_MAGE,3)),ch_kreise_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_ch_kreise,b_buildlearnstring(NAME_CIRCLE_4,b_getlearncosttalent(other,NPC_TALENT_MAGE,4)),ch_kreise_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_ch_kreise,b_buildlearnstring(NAME_CIRCLE_5,b_getlearncosttalent(other,NPC_TALENT_MAGE,5)),ch_kreise_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_ch_kreise,b_buildlearnstring(NAME_CIRCLE_6,b_getlearncosttalent(other,NPC_TALENT_MAGE,6)),ch_kreise_6);
	};
};

func void ch_kreise_back()
{
	Info_ClearChoices(dia_ch_kreise);
};

func void ch_kreise_1()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,1);
	b_setkdfrunes();
};

func void ch_kreise_2()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,2);
	b_setkdfrunes();
	b_setkdwrunes();
};

func void ch_kreise_3()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,3);
	b_setkdfrunes();
	b_setkdwrunes();
};

func void ch_kreise_4()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,4);
	b_setkdfrunes();
	b_setkdwrunes();
};

func void ch_kreise_5()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,5);
	b_setkdfrunes();
};

func void ch_kreise_6()
{
	Info_ClearChoices(dia_ch_kreise);
	b_teachmagiccircle(self,other,6);
	b_setkdfrunes();
};


instance DIA_CH_RUNEN(C_INFO)
{
	npc = ch;
	nr = 5;
	condition = dia_ch_runen_condition;
	information = dia_ch_runen_info;
	permanent = TRUE;
	description = "Runes";
};


func int dia_ch_runen_condition()
{
	if(MAGIESTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_runen_info()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6)
	{
		Info_AddChoice(dia_ch_runen,NAME_CIRCLE_6,dia_ch_runen_6);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5)
	{
		Info_AddChoice(dia_ch_runen,NAME_CIRCLE_5,dia_ch_runen_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_ch_runen,NAME_CIRCLE_4,dia_ch_runen_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3)
	{
		Info_AddChoice(dia_ch_runen,NAME_CIRCLE_3,dia_ch_runen_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_AddChoice(dia_ch_runen,NAME_CIRCLE_2,dia_ch_runen_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1)
	{
		Info_AddChoice(dia_ch_runen,NAME_CIRCLE_1,dia_ch_runen_1);
	};
};

func void dia_ch_runen_back()
{
	Info_ClearChoices(dia_ch_runen);
};

func void dia_ch_runen_1()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),ch_training_runen_circle_1_spl_summongoblinskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),ch_training_runen_circle_1_spl_lightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),ch_training_runen_circle_1_spl_zap);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FIREBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIREBOLT)),ch_training_runen_circle_1_spl_firebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),ch_training_runen_circle_1_spl_light);
	};
};

func void ch_training_runen_circle_1_spl_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void ch_training_runen_circle_1_spl_firebolt()
{
	b_teachplayertalentrunes(self,other,SPL_FIREBOLT);
};

func void ch_training_runen_circle_1_spl_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void ch_training_runen_circle_1_spl_lightheal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void ch_training_runen_circle_1_spl_summongoblinskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_ch_runen_2()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),ch_training_runen_circle_2_spl_instantfireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),ch_training_runen_circle_2_spl_icebolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),ch_training_runen_circle_2_spl_summonwolf);
	};
	if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),ch_training_runen_circle_2_spl_windfist);
	};
	if(PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),ch_training_runen_circle_2_spl_sleep);
	};
	if(PLAYER_TALENT_RUNES[SPL_WHIRLWIND] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_WHIRLWIND,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WHIRLWIND)),ch_training_runen_circle_2_spl_whirlwind);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICELANCE] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICELANCE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICELANCE)),ch_training_runen_circle_2_spl_icelance);
	};
};

func void ch_training_runen_circle_2_spl_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void ch_training_runen_circle_2_spl_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void ch_training_runen_circle_2_spl_summonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void ch_training_runen_circle_2_spl_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void ch_training_runen_circle_2_spl_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void ch_training_runen_circle_2_spl_whirlwind()
{
	b_teachplayertalentrunes(self,other,SPL_WHIRLWIND);
};

func void ch_training_runen_circle_2_spl_icelance()
{
	b_teachplayertalentrunes(self,other,SPL_ICELANCE);
};

func void dia_ch_runen_3()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),ch_training_runen_circle_3_spl_mediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),ch_training_runen_circle_3_spl_thunderball);
	};
	if(PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),ch_training_runen_circle_3_spl_firestorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),ch_training_runen_circle_3_spl_summonskeleton);
	};
	if(PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),ch_training_runen_circle_3_spl_fear);
	};
	if(PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),ch_training_runen_circle_3_spl_icecube);
	};
	if(PLAYER_TALENT_RUNES[SPL_THUNDERSTORM] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_THUNDERSTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_THUNDERSTORM)),ch_training_runen_circle_3_spl_thunderstorm);
	};
	if(PLAYER_TALENT_RUNES[SPL_GEYSER] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_GEYSER,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_GEYSER)),ch_training_runen_circle_3_spl_geyser);
	};
};

func void ch_training_runen_circle_3_spl_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void ch_training_runen_circle_3_spl_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void ch_training_runen_circle_3_spl_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void ch_training_runen_circle_3_spl_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void ch_training_runen_circle_3_spl_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void ch_training_runen_circle_3_spl_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void ch_training_runen_circle_3_spl_thunderstorm()
{
	b_teachplayertalentrunes(self,other,SPL_THUNDERSTORM);
};

func void ch_training_runen_circle_3_spl_geyser()
{
	b_teachplayertalentrunes(self,other,SPL_GEYSER);
};

func void dia_ch_runen_4()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),ch_training_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),ch_training_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),ch_training_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),ch_training_runen_circle_4_spl_chargefireball);
	};
	if(PLAYER_TALENT_RUNES[SPL_WATERFIST] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_WATERFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WATERFIST)),ch_training_runen_circle_4_spl_waterfist);
	};
};

func void ch_training_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void ch_training_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void ch_training_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void ch_training_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void ch_training_runen_circle_4_spl_waterfist()
{
	b_teachplayertalentrunes(self,other,SPL_WATERFIST);
};

func void dia_ch_runen_5()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),ch_training_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),ch_training_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),ch_training_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),ch_training_runen_circle_5_spl_pyrokinesis);
	};
};

func void ch_training_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void ch_training_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void ch_training_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void ch_training_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_ch_runen_6()
{
	Info_ClearChoices(dia_ch_runen);
	Info_AddChoice(dia_ch_runen,DIALOG_BACK,dia_ch_runen_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),ch_training_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),ch_training_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),ch_training_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),ch_training_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_ch_runen,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),ch_training_runen_circle_6_spl_shrink);
	};
};

func void ch_training_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void ch_training_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void ch_training_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void ch_training_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void ch_training_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


instance DIA_CH_KAMPF_START(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_kampf_start_condition;
	information = dia_ch_kampf_start_info;
	permanent = TRUE;
	description = "Combat skills";
};


func int dia_ch_kampf_start_condition()
{
	if((KAMPFSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (LEVELSTART == FALSE) && (DIEBSTART == FALSE) && (LEVELUP == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_kampf_start_info()
{
	KAMPFSTART = TRUE;
};


instance DIA_CH_KAMPF_STOPPER(C_INFO)
{
	npc = ch;
	nr = 99;
	condition = dia_ch_kampf_stopper_condition;
	information = dia_ch_kampf_stopper_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_ch_kampf_stopper_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_stopper_info()
{
	KAMPFSTART = FALSE;
};


instance DIA_CH_KAMPF_EINHAND(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_kampf_einhand_condition;
	information = dia_ch_kampf_einhand_info;
	permanent = TRUE;
	description = "One-handed weapons";
};


func int dia_ch_kampf_einhand_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_einhand_info()
{
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_1H,20)),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_1H,10)),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_1H,5)),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void dia_ch_kampf_einhand_back()
{
	Info_ClearChoices(dia_ch_kampf_einhand);
};

func void ch_training_combat_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_1H,20)),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_1H,10)),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_1H,5)),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void ch_training_combat_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_1H,20)),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_1H,10)),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_1H,5)),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void ch_training_combat_1h_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,10,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_1H,20)),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_1H,10)),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_1H,5)),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};

func void ch_training_combat_1h_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,20,100);
	Info_ClearChoices(dia_ch_kampf_einhand);
	Info_AddChoice(dia_ch_kampf_einhand,DIALOG_BACK,dia_ch_kampf_einhand_back);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_1H,20)),ch_training_combat_1h_20);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_1H,10)),ch_training_combat_1h_10);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_1H,5)),ch_training_combat_1h_5);
	Info_AddChoice(dia_ch_kampf_einhand,b_buildlearnstring("One-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_1H,1)),ch_training_combat_1h_1);
};


instance DIA_CH_KAMPF_ZWEIHAND(C_INFO)
{
	npc = ch;
	nr = 7;
	condition = dia_ch_kampf_zweihand_condition;
	information = dia_ch_kampf_zweihand_info;
	permanent = TRUE;
	description = "Two-handed weapons";
};


func int dia_ch_kampf_zweihand_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_zweihand_info()
{
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_2H,20)),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_2H,10)),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_2H,5)),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void dia_ch_kampf_zweihand_back()
{
	Info_ClearChoices(dia_ch_kampf_zweihand);
};

func void ch_training_combat_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_2H,20)),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_2H,10)),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_2H,5)),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void ch_training_combat_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_2H,20)),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_2H,10)),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_2H,5)),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void ch_training_combat_2h_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,10,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_2H,20)),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_2H,10)),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_2H,5)),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};

func void ch_training_combat_2h_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,20,100);
	Info_ClearChoices(dia_ch_kampf_zweihand);
	Info_AddChoice(dia_ch_kampf_zweihand,DIALOG_BACK,dia_ch_kampf_zweihand_back);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +20",b_getlearncosttalent(other,NPC_TALENT_2H,20)),ch_training_combat_2h_20);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +10",b_getlearncosttalent(other,NPC_TALENT_2H,10)),ch_training_combat_2h_10);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +5",b_getlearncosttalent(other,NPC_TALENT_2H,5)),ch_training_combat_2h_5);
	Info_AddChoice(dia_ch_kampf_zweihand,b_buildlearnstring("Two-handed weapons +1",b_getlearncosttalent(other,NPC_TALENT_2H,1)),ch_training_combat_2h_1);
};


instance DIA_CH_KAMPF_BOGEN(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_kampf_bogen_condition;
	information = dia_ch_kampf_bogen_info;
	permanent = TRUE;
	description = "Bows";
};


func int dia_ch_kampf_bogen_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_bogen_info()
{
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +20",b_getlearncosttalent(other,NPC_TALENT_BOW,20)),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +10",b_getlearncosttalent(other,NPC_TALENT_BOW,10)),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +5",b_getlearncosttalent(other,NPC_TALENT_BOW,5)),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void dia_ch_kampf_bogen_back()
{
	Info_ClearChoices(dia_ch_kampf_bogen);
};

func void ch_training_combat_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +20",b_getlearncosttalent(other,NPC_TALENT_BOW,20)),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +10",b_getlearncosttalent(other,NPC_TALENT_BOW,10)),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +5",b_getlearncosttalent(other,NPC_TALENT_BOW,5)),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void ch_training_combat_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +20",b_getlearncosttalent(other,NPC_TALENT_BOW,20)),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +10",b_getlearncosttalent(other,NPC_TALENT_BOW,10)),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +5",b_getlearncosttalent(other,NPC_TALENT_BOW,5)),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void ch_training_combat_bow_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,10,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +20",b_getlearncosttalent(other,NPC_TALENT_BOW,20)),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +10",b_getlearncosttalent(other,NPC_TALENT_BOW,10)),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +5",b_getlearncosttalent(other,NPC_TALENT_BOW,5)),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};

func void ch_training_combat_bow_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,20,100);
	Info_ClearChoices(dia_ch_kampf_bogen);
	Info_AddChoice(dia_ch_kampf_bogen,DIALOG_BACK,dia_ch_kampf_bogen_back);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +20",b_getlearncosttalent(other,NPC_TALENT_BOW,20)),ch_training_combat_bow_20);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +10",b_getlearncosttalent(other,NPC_TALENT_BOW,10)),ch_training_combat_bow_10);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +5",b_getlearncosttalent(other,NPC_TALENT_BOW,5)),ch_training_combat_bow_5);
	Info_AddChoice(dia_ch_kampf_bogen,b_buildlearnstring("Bows +1",b_getlearncosttalent(other,NPC_TALENT_BOW,1)),ch_training_combat_bow_1);
};


instance DIA_CH_KAMPF_ARMBRUST(C_INFO)
{
	npc = ch;
	nr = 8;
	condition = dia_ch_kampf_armbrust_condition;
	information = dia_ch_kampf_armbrust_info;
	permanent = TRUE;
	description = "Crossbows";
};


func int dia_ch_kampf_armbrust_condition()
{
	if(KAMPFSTART == TRUE)
	{
		return TRUE;
	};
};

func void dia_ch_kampf_armbrust_info()
{
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,20)),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,10)),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void dia_ch_kampf_armbrust_back()
{
	Info_ClearChoices(dia_ch_kampf_armbrust);
};

func void ch_training_combat_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,20)),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,10)),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void ch_training_combat_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,20)),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,10)),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void ch_training_combat_crossbow_10()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,10,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,20)),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,10)),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};

func void ch_training_combat_crossbow_20()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,20,100);
	Info_ClearChoices(dia_ch_kampf_armbrust);
	Info_AddChoice(dia_ch_kampf_armbrust,DIALOG_BACK,dia_ch_kampf_armbrust_back);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +20",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,20)),ch_training_combat_crossbow_20);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +10",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,10)),ch_training_combat_crossbow_10);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +5",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),ch_training_combat_crossbow_5);
	Info_AddChoice(dia_ch_kampf_armbrust,b_buildlearnstring("Crossbows +1",b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),ch_training_combat_crossbow_1);
};


instance DIA_CH_DIEB_START(C_INFO)
{
	npc = ch;
	nr = 6;
	condition = dia_ch_dieb_start_condition;
	information = dia_ch_dieb_start_info;
	permanent = TRUE;
	description = "Thief skills";
};


func int dia_ch_dieb_start_condition()
{
	if((KAMPFSTART == FALSE) && (MAGIESTART == FALSE) && (ATTRIBUTESTART == FALSE) && (LEVELSTART == FALSE) && (DIEBSTART == FALSE) && (LEVELUP == FALSE))
	{
		return TRUE;
	};
};

func void dia_ch_dieb_start_info()
{
	Info_ClearChoices(dia_ch_dieb_start);
	Info_AddChoice(dia_ch_dieb_start,DIALOG_BACK,dia_ch_dieb_start_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE)
	{
		Info_AddChoice(dia_ch_dieb_start,b_buildlearnstring("Pickpocketing",b_getlearncosttalent(other,NPC_TALENT_PICKPOCKET,1)),ch_training_thief_pickpocket);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_ch_dieb_start,b_buildlearnstring("Lock picking",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1)),ch_training_thief_picklock);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_ch_dieb_start,b_buildlearnstring("Sneaking",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),ch_training_thief_sneak);
	};
};

func void dia_ch_dieb_start_back()
{
	Info_ClearChoices(dia_ch_dieb_start);
};

func void ch_training_thief_pickpocket()
{
	b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET);
};

func void ch_training_thief_picklock()
{
	b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK);
};

func void ch_training_thief_sneak()
{
	b_teachthieftalent(self,other,NPC_TALENT_SNEAK);
};

