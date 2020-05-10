
instance DIA_ANGAR_NW_KAP5_EXIT(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 999;
	condition = dia_angar_nw_kap5_exit_condition;
	information = dia_angar_nw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angar_nw_kap5_exit_condition()
{
	return TRUE;
};

func void dia_angar_nw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_NW_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 59;
	condition = dia_angar_nw_alldragonsdead_condition;
	information = dia_angar_nw_alldragonsdead_info;
	description = "How's it going?";
};


func int dia_angar_nw_alldragonsdead_condition()
{
	return TRUE;
};

func void dia_angar_nw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Angar_NW_AllDragonsDead_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_01");	//Quite well. But I still have these miserable headaches, although they've gotten better since I'm no longer in the Valley of the Mines.
	if(ANGAR_ISONBOARD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Angar_NW_AllDragonsDead_04_02");	//I'll stay here. Then you'll know where to find me if you need me.
	};
};


instance DIA_ANGAR_NW_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_knowwhereenemy_condition;
	information = dia_angar_nw_knowwhereenemy_info;
	permanent = TRUE;
	description = "I'm going to leave Khorinis. Would you like to join me?";
};


func int dia_angar_nw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (ANGAR_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_angar_nw_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_angar_nw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_00");	//I'm going to leave Khorinis. Would you like to join me?
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_01");	//The farther I get from the Valley of Mines, the better. When do we go?
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Angar's grateful for every mile he can put between himself and the Valley of Mines. He's offered to come with me on my journey.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_15_02");	//Right now, I've got enough people to man the ship. Maybe I'll get back to you later.
		AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_04_03");	//Fine. I'm here if you need me.
	}
	else
	{
		Info_ClearChoices(dia_angar_nw_knowwhereenemy);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"I'll let you know when it's time to go.",dia_angar_nw_knowwhereenemy_no);
		Info_AddChoice(dia_angar_nw_knowwhereenemy,"Go to the harbor, then. I'll meet you there later.",dia_angar_nw_knowwhereenemy_yes);
	};
};

func void dia_angar_nw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_Yes_15_00");	//Go to the harbor, then. I'll meet you there later.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_Yes_04_01");	//On my way.
	self.flags = NPC_FLAG_IMMORTAL;
	ANGAR_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_angar_nw_knowwhereenemy);
};

func void dia_angar_nw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Angar_NW_KnowWhereEnemy_No_15_00");	//I'll let you know when it's time to go.
	AI_Output(self,other,"DIA_Angar_NW_KnowWhereEnemy_No_04_01");	//Good.
	ANGAR_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_angar_nw_knowwhereenemy);
};


instance DIA_ANGAR_NW_LEAVEMYSHIP(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_leavemyship_condition;
	information = dia_angar_nw_leavemyship_info;
	permanent = TRUE;
	description = "Stay here and take care of your pain.";
};


func int dia_angar_nw_leavemyship_condition()
{
	if((ANGAR_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_leavemyship_info()
{
	AI_Output(other,self,"DIA_Angar_NW_LeaveMyShip_15_00");	//Stay here and take care of your pain.
	AI_Output(self,other,"DIA_Angar_NW_LeaveMyShip_04_01");	//All right. I'll go back. Maybe it's better that way.
	ANGAR_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ANGAR_NW_STILLNEEDYOU(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 55;
	condition = dia_angar_nw_stillneedyou_condition;
	information = dia_angar_nw_stillneedyou_info;
	permanent = TRUE;
	description = "Come back on board.";
};


func int dia_angar_nw_stillneedyou_condition()
{
	if(((ANGAR_ISONBOARD == LOG_OBSOLETE) || (ANGAR_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_angar_nw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Angar_NW_StillNeedYou_15_00");	//Come back on board.
	AI_Output(self,other,"DIA_Angar_NW_StillNeedYou_04_01");	//You're worse than I am. A bit more decisiveness would do you good. See you later.
	self.flags = NPC_FLAG_IMMORTAL;
	ANGAR_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_ANGAR_NW_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 900;
	condition = dia_angar_nw_pickpocket_condition;
	information = dia_angar_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_nw_pickpocket_condition()
{
	return c_beklauen(47,34);
};

func void dia_angar_nw_pickpocket_info()
{
	Info_ClearChoices(dia_angar_nw_pickpocket);
	Info_AddChoice(dia_angar_nw_pickpocket,DIALOG_BACK,dia_angar_nw_pickpocket_back);
	Info_AddChoice(dia_angar_nw_pickpocket,DIALOG_PICKPOCKET,dia_angar_nw_pickpocket_doit);
};

func void dia_angar_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_nw_pickpocket);
};

func void dia_angar_nw_pickpocket_back()
{
	Info_ClearChoices(dia_angar_nw_pickpocket);
};


instance DIA_ANGAR_NW_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar_nw;
	nr = 7;
	condition = dia_angar_nw_foundamulett_condition;
	information = dia_angar_nw_foundamulett_info;
	description = "I found your amulet.";
};


func int dia_angar_nw_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_nw_foundamulett_info()
{
	b_angarsamulettabgeben();
};

