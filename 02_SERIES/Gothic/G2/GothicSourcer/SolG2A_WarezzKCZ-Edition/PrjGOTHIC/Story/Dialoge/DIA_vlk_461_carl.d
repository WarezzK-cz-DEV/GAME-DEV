
instance DIA_CARL_EXIT(C_INFO)
{
	npc = vlk_461_carl;
	nr = 999;
	condition = dia_carl_exit_condition;
	information = dia_carl_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_carl_exit_condition()
{
	return TRUE;
};

func void dia_carl_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_carlsayhallo()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_00");	//It would seem that we have a few thieves in the city who steal stuff from the rich people.
	AI_Output(self,other,"DIA_Carl_Hallo_05_01");	//The city guard recently turned the harbor district upside-down - but they didn't find anything.
};


instance DIA_CARL_PICKPOCKET(C_INFO)
{
	npc = vlk_461_carl;
	nr = 900;
	condition = dia_carl_pickpocket_condition;
	information = dia_carl_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_carl_pickpocket_condition()
{
	return c_beklauen(34,40);
};

func void dia_carl_pickpocket_info()
{
	Info_ClearChoices(dia_carl_pickpocket);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_BACK,dia_carl_pickpocket_back);
	Info_AddChoice(dia_carl_pickpocket,DIALOG_PICKPOCKET,dia_carl_pickpocket_doit);
};

func void dia_carl_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_carl_pickpocket);
};

func void dia_carl_pickpocket_back()
{
	Info_ClearChoices(dia_carl_pickpocket);
};


instance DIA_CARL_HALLO(C_INFO)
{
	npc = vlk_461_carl;
	nr = 2;
	condition = dia_carl_hallo_condition;
	information = dia_carl_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_carl_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_carl_hallo_info()
{
	AI_Output(self,other,"DIA_Carl_Hallo_05_02");	//What led you into this poor area? What are looking for here?
	Info_ClearChoices(dia_carl_hallo);
	Info_AddChoice(dia_carl_hallo,"I've lost my way.",dia_carl_hallo_verlaufen);
	Info_AddChoice(dia_carl_hallo,"I'm just looking around a bit.",dia_carl_hallo_umsehen);
};

func void dia_carl_hallo_verlaufen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_verlaufen_15_00");	//I've lost my way.
	AI_Output(self,other,"DIA_Carl_Hallo_verlaufen_05_01");	//Then watch out that you aren't robbed.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};

func void dia_carl_hallo_umsehen()
{
	AI_Output(other,self,"DIA_Carl_Hallo_umsehen_15_00");	//I'm just looking around a bit.
	AI_Output(self,other,"DIA_Carl_Hallo_umsehen_05_01");	//Aha. Then you had better not be caught looking around.
	b_carlsayhallo();
	Info_ClearChoices(dia_carl_hallo);
};


instance DIA_CARL_DIEBE(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_diebe_condition;
	information = dia_carl_diebe_info;
	permanent = FALSE;
	description = "What do you know about the thieves?";
};


func int dia_carl_diebe_condition()
{
	return TRUE;
};

func void dia_carl_diebe_info()
{
	AI_Output(other,self,"DIA_Carl_Diebe_15_00");	//What do you know about the thieves?
	AI_Output(self,other,"DIA_Carl_Diebe_05_01");	//Nothing. But all the citizens are scared and have become distrustful - particularly towards strangers.
	AI_Output(self,other,"DIA_Carl_Diebe_05_02");	//Don't get caught in strange houses - no one takes kindly to that.
	AI_Output(self,other,"DIA_Carl_Diebe_05_03");	//Yes, you have to protect yourself against thieves. A sturdy cudgel works best.
};


instance DIA_CARL_LERNEN(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_lernen_condition;
	information = dia_carl_lernen_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_carl_lernen_condition()
{
	return TRUE;
};

func void dia_carl_lernen_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	AI_Output(self,other,"DIA_Carl_Lernen_05_01");	//Oh, I'm forging a fews fittings and nails, and repairing iron parts.
	if((PLAYER_TALENT_SMITH[0] || PLAYER_TALENT_SMITH[13]) == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//I already know how to do that!
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Good, we can get started as soon as you're ready.
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Get the gold, then I'll train you.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, the smith in the harbor district, can teach me how to forge armor.");
	}
	else if((PLAYER_TALENT_SMITH[0] || PLAYER_TALENT_SMITH[13]) == FALSE)
	{
		AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//I'll think about it.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, the smith in the harbor district, can teach me how to forge armor.");
	};
};


instance DIA_CARL_REQUEST(C_INFO)
{
	npc = vlk_461_carl;
	nr = 3;
	condition = dia_carl_request_condition;
	information = dia_carl_request_info;
	permanent = TRUE;
	description = "Teach me how to forge an armor (250 gold).";
};


func int dia_carl_request_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_lernen) && (CARL_TEACHARMOR == FALSE) && ((PLAYER_TALENT_SMITH[0] || PLAYER_TALENT_SMITH[13]) == TRUE))
	{
		return TRUE;
	};
};

func void dia_carl_request_info()
{
	AI_Output(other,self,"DIA_Carl_bezahlen_15_00");	//I want to train with you.
	if(Npc_KnowsInfo(other,dia_edda_statue))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_01");	//I heard what you did for Edda. I'll train you for nothing.
		CARL_TEACHARMOR = TRUE;
	}
	else if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_02");	//Good, we can get started as soon as you're ready.
		CARL_TEACHARMOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Carl_bezahlen_05_03");	//Get the gold, then I'll train you.
	};
};


instance DIA_CARL_TEACH_ARM(C_INFO)
{
	npc = vlk_461_carl;
	nr = 90;
	condition = dia_carl_teach_arm_condition;
	information = dia_carl_teach_arm_info;
	permanent = TRUE;
	description = "Learn armor crafting/forging.";
};


func int dia_carl_teach_arm_condition()
{
	if((CARL_TEACHARMOR == TRUE) && ((PLAYER_TALENT_ARMOR[0] == FALSE) || (PLAYER_TALENT_ARMOR[1] == FALSE) || (PLAYER_TALENT_ARMOR[2] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_carl_teach_arm_info()
{
	Info_ClearChoices(dia_carl_teach_arm);
	Info_AddChoice(dia_carl_teach_arm,DIALOG_BACK,dia_carl_teach_arm_back);
	if(PLAYER_TALENT_ARMOR[0] == FALSE)
	{
		Info_AddChoice(dia_carl_teach_arm,b_buildlearnstring("Learn armor crafting - Apprentice",b_getlearncosttalent(other,NPC_TALENT_ARMOR,ARMASTERY_1)),dia_carl_teach_arm_armastery_1);
	}
	else if((PLAYER_TALENT_ARMOR[1] == FALSE) && (PLAYER_TALENT_ARMOR[0] == TRUE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_carl_teach_arm,b_buildlearnstring("Learn armor crafting - Expert",b_getlearncosttalent(other,NPC_TALENT_ARMOR,ARMASTERY_2)),dia_carl_teach_arm_armastery_2);
	}
	else if((PLAYER_TALENT_ARMOR[2] == FALSE) && (PLAYER_TALENT_ARMOR[1] == TRUE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_carl_teach_arm,b_buildlearnstring("Learn armor crafting - Master",b_getlearncosttalent(other,NPC_TALENT_ARMOR,ARMASTERY_3)),dia_carl_teach_arm_armastery_3);
	}
	else
	{
		AI_PrintScreen("Not ready yet",-1,52,FONT_SCREENBRIGHTLARGE,2);
		b_endproductiondialog();
	};
};

func void dia_carl_teach_arm_back()
{
	Info_ClearChoices(dia_carl_teach_arm);
};

func void dia_carl_teach_arm_armastery_1()
{
	b_teachplayertalentarmor(self,other,ARMASTERY_1);
	Info_ClearChoices(dia_carl_teach_arm);
};

func void dia_carl_teach_arm_armastery_2()
{
	b_teachplayertalentarmor(self,other,ARMASTERY_2);
	Info_ClearChoices(dia_carl_teach_arm);
};

func void dia_carl_teach_arm_armastery_3()
{
	b_teachplayertalentarmor(self,other,ARMASTERY_3);
	Info_ClearChoices(dia_carl_teach_arm);
};


instance DIA_CARL_TRADEARMOR(C_INFO)
{
	npc = vlk_461_carl;
	nr = 4;
	condition = dia_carl_tradearmor_condition;
	information = dia_carl_tradearmor_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Show me your wares.";
};


func int dia_carl_tradearmor_condition()
{
	if(Npc_KnowsInfo(other,dia_carl_lernen))
	{
		return TRUE;
	};
};

func void dia_carl_tradearmor_info()
{
	b_clearsmithinv(self);
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Show me your wares.
};

