
var int dia_salandril_pickpocket_perm;
var int dia_salandril_pickpocket_removed;

instance DIA_SALANDRIL_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_exit_condition;
	information = dia_salandril_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_salandril_exit_info()
{
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_PICKPOCKET(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 900;
	condition = dia_salandril_pickpocket_condition;
	information = dia_salandril_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_KEY;
};


func int dia_salandril_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (DIA_SALANDRIL_PICKPOCKET_PERM == FALSE) && ((Npc_HasItems(self,itke_salandril) >= 1) || (DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_salandril_pickpocket_info()
{
	Info_ClearChoices(dia_salandril_pickpocket);
	Info_AddChoice(dia_salandril_pickpocket,DIALOG_BACK,dia_salandril_pickpocket_back);
	Info_AddChoice(dia_salandril_pickpocket,DIALOG_PICKPOCKET,dia_salandril_pickpocket_doit);
};

func void dia_salandril_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
		{
			CreateInvItem(self,itke_salandril);
			DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
		};
		b_giveinvitems(self,other,itke_salandril,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		DIA_SALANDRIL_PICKPOCKET_PERM = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_salandril_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
		{
			CreateInvItem(self,itke_salandril);
			DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
		};
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_salandril_pickpocket_back()
{
	Info_ClearChoices(dia_salandril_pickpocket);
};


instance DIA_SALANDRIL_HALLO(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_hallo_condition;
	information = dia_salandril_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salandril_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_salandril_hallo_info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//Welcome, traveler. Looking for a fine potion?
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//I have a large selection and reasonable prices. And my potions are much better than the stuff that Zuris sells.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Salandril sells potions. His shop is in the upper quarter.");
};


instance DIA_SALANDRIL_TRANK(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_trank_condition;
	information = dia_salandril_trank_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salandril_trank_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_OLDWORLD == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_salandril_kloster) == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_trank_info()
{
	AI_Output(self,other,"DIA_Salandril_Trank_13_00");	//I've heard you were with the paladins in the Valley of Mines. I'm impressed.
	AI_Output(self,other,"DIA_Salandril_Trank_13_01");	//You should take your time and browse my goods. Right now, I have a very special potion to offer.
	CreateInvItems(self,itpo_perm_dex,1);
};


instance DIA_SALANDRIL_TRADE(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 9;
	condition = dia_salandril_trade_condition;
	information = dia_salandril_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_salandril_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_salandril_kloster) == FALSE)
	{
		return TRUE;
	};
};

func void dia_salandril_trade_info()
{
	if(SALANDRIL_FLAG == 1)
	{
		b_clearalchemyinv(self);
		if(SALANDRIL_FLASKS > 0)
		{
			CreateInvItems(self,itmi_flask,SALANDRIL_FLASKS);
		};
		SALANDRIL_FLAG = 0;
	};
	if(Npc_HasItems(self,itke_salandril) >= 1)
	{
		Npc_RemoveInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = TRUE;
	};
	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//It's my pleasure, reverend brother.
		if(MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING)
		{
			SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//It's my pleasure, noble warrior.
	};
};


instance DIA_SALANDRIL_KAP3_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap3_exit_condition;
	information = dia_salandril_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_salandril_kap3_exit_info()
{
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KLOSTER(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_kloster_condition;
	information = dia_salandril_kloster_info;
	description = "You go to the monastery now to be judged.";
};


func int dia_salandril_kloster_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) || (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_salandril_kloster_info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//You go to the monastery now to be judged.
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//What? Have you gone off your rocker? Like hell I will. Those miserable magicians don't have the slightest proof against me.
	if((hero.guild == GIL_KDF) && (SC_KNOWSPROSPEKTORSALANDRIL == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//And what about those fake ore mining shares you've huckstered all over the country? They bear your signature. You're guilty.
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//I have my orders, and I'm going to carry them out. So either you go now, or I'll make you.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//What? I'll drag you through town by your collar like a filthy rag.
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SALANDRIL_GEHINSKLOSTER(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_gehinskloster_condition;
	information = dia_salandril_gehinskloster_info;
	description = "So are you going to the monastery now, or should I give you another...?";
};


func int dia_salandril_gehinskloster_condition()
{
	if(((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) || (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && Npc_KnowsInfo(other,dia_salandril_kloster))
	{
		return TRUE;
	};
};

func void dia_salandril_gehinskloster_info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//So are you going to the monastery now, or should I give you another...?
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//You'll live to regret to this. Yes, damnit, I'll go to that monastery, but don't you think you'll get away with this.
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_SUCCESS;
};


instance DIA_SALANDRIL_VERSCHWINDE(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_verschwinde_condition;
	information = dia_salandril_verschwinde_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_salandril_verschwinde_condition()
{
	if((MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_salandril_verschwinde_info()
{
	b_verschwinde_stimme13();
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP4_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap4_exit_condition;
	information = dia_salandril_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_salandril_kap4_exit_info()
{
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP5_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap5_exit_condition;
	information = dia_salandril_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_salandril_kap5_exit_info()
{
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP6_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap6_exit_condition;
	information = dia_salandril_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_salandril_kap6_exit_info()
{
	if(DIA_SALANDRIL_PICKPOCKET_REMOVED == TRUE)
	{
		CreateInvItem(self,itke_salandril);
		DIA_SALANDRIL_PICKPOCKET_REMOVED = FALSE;
	};
	AI_StopProcessInfos(self);
};

