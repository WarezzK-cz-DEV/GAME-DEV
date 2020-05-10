
instance DIA_GORNNW_NACH_DJG_KAP5_EXIT(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 999;
	condition = dia_gornnw_nach_djg_kap5_exit_condition;
	information = dia_gornnw_nach_djg_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_nach_djg_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_nach_djg_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_NACH_DJG_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 59;
	condition = dia_gornnw_nach_djg_alldragonsdead_condition;
	information = dia_gornnw_nach_djg_alldragonsdead_info;
	permanent = TRUE;
	description = "Are you relaxed?";
};


func int dia_gornnw_nach_djg_alldragonsdead_condition()
{
	if(GORN_ISONBOARD != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Are you relaxed?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Sure, why not? The dragons are dead, aren't they?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//The case is a little more complicated.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(laughs) Well. Like always. Let me know when you need my axe.
};


instance DIA_GORNNW_NACH_DJG_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_knowwhereenemy_condition;
	information = dia_gornnw_nach_djg_knowwhereenemy_info;
	permanent = TRUE;
	description = "I could use you and your axe.";
};


func int dia_gornnw_nach_djg_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (GORN_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//I could use you and your axe.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Well. I'm not surprised. What can I do for you?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Would you sail to an island with me and kick some enemy butt?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(laughs) Sure. Right away. Just tell me what to do.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Gorn was all for it when I told him about the island. If I need an axe, I should take him along.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//At the moment, my crew is already complete, but I'll think about taking you on board, too.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//If you have to kick someone else off your crew because of me, then take the weakest.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//In these rough times, you need every man who can lend a hand.
	}
	else
	{
		Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"I'll let you know when it's time.",dia_gornnw_nach_djg_knowwhereenemy_no);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Come aboard with me. Wait for me at the harbor.",dia_gornnw_nach_djg_knowwhereenemy_yes);
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Come aboard with me. Wait for me at the harbor.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//A ship? Ha! I can say one thing for you. It's never boring with you. See you soon.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};

func void dia_gornnw_nach_djg_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//I'll let you know when it's time.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//All right.
	GORN_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};


instance DIA_GORNNW_NACH_DJG_LEAVEMYSHIP(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_leavemyship_condition;
	information = dia_gornnw_nach_djg_leavemyship_info;
	permanent = TRUE;
	description = "Maybe you had better stay here.";
};


func int dia_gornnw_nach_djg_leavemyship_condition()
{
	if((GORN_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_leavemyship_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Maybe you had better stay here.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//I'm supposed to let you go alone? Mmh. It's not easy for me, but it's your war. Come to me if you want me to follow you after all.
	GORN_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNNW_NACH_DJG_STILLNEEDYOU(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_stillneedyou_condition;
	information = dia_gornnw_nach_djg_stillneedyou_info;
	permanent = TRUE;
	description = "Come back. I need you.";
};


func int dia_gornnw_nach_djg_stillneedyou_condition()
{
	if(((GORN_ISONBOARD == LOG_OBSOLETE) || (GORN_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_stillneedyou_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Come back. I need you.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//There you are. And I thought you wanted to let me rot here while you had all the fun. See you later.
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
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


instance DIA_FIGHTER_NACH_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 900;
	condition = dia_fighter_nach_djg_pickpocket_condition;
	information = dia_fighter_nach_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_nach_djg_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_fighter_nach_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_BACK,dia_fighter_nach_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_nach_djg_pickpocket_doit);
};

func void dia_fighter_nach_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

func void dia_fighter_nach_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

