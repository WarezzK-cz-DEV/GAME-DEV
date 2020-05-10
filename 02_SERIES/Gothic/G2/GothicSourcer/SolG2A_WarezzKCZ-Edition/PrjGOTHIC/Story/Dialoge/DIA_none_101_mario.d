
instance DIA_NONE_101_MARIO_EXIT(C_INFO)
{
	npc = none_101_mario;
	nr = 999;
	condition = dia_none_101_mario_exit_condition;
	information = dia_none_101_mario_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_none_101_mario_exit_condition()
{
	return TRUE;
};

func void dia_none_101_mario_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_JOB(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_job_condition;
	information = dia_none_101_mario_job_info;
	permanent = TRUE;
	description = "What are you doing here?";
};


func int dia_none_101_mario_job_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && (Npc_KnowsInfo(other,dia_none_101_mario_youneedme) == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_job_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//I hope it won't be too long before a ship comes in where I can hire on.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//This hanging around is really getting on my nerves.
};


instance DIA_NONE_101_MARIO_YOUNEEDME(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_youneedme_condition;
	information = dia_none_101_mario_youneedme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_101_mario_youneedme_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_youneedme_info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//I've heard that you're looking for people for your ship?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//And?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//I'm in!
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Mario, a former marine, spoke to me in the harbor pub. He wants to come on the ship.");
};


instance DIA_NONE_101_MARIO_WHYNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 5;
	condition = dia_none_101_mario_whyneedyou_condition;
	information = dia_none_101_mario_whyneedyou_info;
	permanent = FALSE;
	description = "Why would I take you along?";
};


func int dia_none_101_mario_whyneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Why would I take you along?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Quite simply, because you need me.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//I'm... I was a lieutenant with the royal navy.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//I've served as a marine on the King Rhobar and the Pride of Myrtana.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//In the Battle of the Eastern Archipelago, I single-handedly sent two dozen orcs back to Beliar's realm.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//Unfortunately, there were too few of us after our flagship sank, and we were forced to retreat.
};


instance DIA_NONE_101_MARIO_WHYHERE(C_INFO)
{
	npc = none_101_mario;
	nr = 7;
	condition = dia_none_101_mario_whyhere_condition;
	information = dia_none_101_mario_whyhere_info;
	permanent = FALSE;
	description = "Why are you here, then?";
};


func int dia_none_101_mario_whyhere_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyhere_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//Why are you here, then?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//The fleet is routed, and the payroll coffers are empty.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//After my discharge I wound up stranded in this dump, and I'm looking for a new berth.
};


instance DIA_NONE_101_MARIO_ABILITIES(C_INFO)
{
	npc = none_101_mario;
	nr = 8;
	condition = dia_none_101_mario_abilities_condition;
	information = dia_none_101_mario_abilities_info;
	permanent = FALSE;
	description = "What can you do?";
};


func int dia_none_101_mario_abilities_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_abilities_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//What can you do?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//I'm trained for boarding and close combat, plus I'm a passable shot with the ship's cannon.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//I bet there's a thing or two that I can teach you on the trip.
	b_logentry(TOPIC_CREW,"Mario seems to be a dab hand at naval warfare. He may be able to teach me a thing or two.");
};


instance DIA_NONE_101_MARIO_YOURPRICE(C_INFO)
{
	npc = none_101_mario;
	nr = 9;
	condition = dia_none_101_mario_yourprice_condition;
	information = dia_none_101_mario_yourprice_info;
	permanent = FALSE;
	description = "What are you asking?";
};


func int dia_none_101_mario_yourprice_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_yourprice_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//What are you asking?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//What can I ask? I'd be glad to get away from here.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//A hand for a bunk. I help you and you take me along.
};


instance DIA_NONE_101_MARIO_COULDBEDANGEROUS(C_INFO)
{
	npc = none_101_mario;
	nr = 10;
	condition = dia_none_101_mario_couldbedangerous_condition;
	information = dia_none_101_mario_couldbedangerous_info;
	permanent = FALSE;
	description = "The journey may be perilous.";
};


func int dia_none_101_mario_couldbedangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_yourprice) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_couldbedangerous_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//The journey may be perilous.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//I'm used to danger. When you're out there, every day is dangerous.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//The next storm could be your death, and the monsters of the deep could swallow your ship whole.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//And I don't need to mention the orcish galleys, do I? Believe me, there's nothing I'm afraid of. A sailor who's afraid is already dead.
};


instance DIA_NONE_101_MARIO_DONTNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 13;
	condition = dia_none_101_mario_dontneedyou_condition;
	information = dia_none_101_mario_dontneedyou_info;
	permanent = FALSE;
	description = "I have no use for you.";
};


func int dia_none_101_mario_dontneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_dontneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//I have no use for you.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//I'm the best sailor you'll find here.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//From the look of you, you don't know the first thing about navigation.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//So think twice before you trust anyone.
};


instance DIA_NONE_101_MARIO_NEEDGOODMEN(C_INFO)
{
	npc = none_101_mario;
	nr = 2;
	condition = dia_none_101_mario_needgoodmen_condition;
	information = dia_none_101_mario_needgoodmen_info;
	permanent = FALSE;
	description = "I can always use good people.";
};


func int dia_none_101_mario_needgoodmen_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_needgoodmen_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//I can always use good people.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Sure thing, I'll see you on the ship.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	MARIO_ISONBOARD = LOG_SUCCESS;
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


instance DIA_MARIO_LEAVEMYSHIP(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_leavemyship_condition;
	information = dia_mario_leavemyship_info;
	permanent = TRUE;
	description = "I can't use you after all!";
};


func int dia_mario_leavemyship_condition()
{
	if((MARIO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_mario_leavemyship_info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//I can't use you after all!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//As you like. You know where to find me!
	MARIO_ISONBOARD = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MARIO_STILLNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_stillneedyou_condition;
	information = dia_mario_stillneedyou_info;
	permanent = TRUE;
	description = "I can use you after all!";
};


func int dia_mario_stillneedyou_condition()
{
	if((MARIO_ISONBOARD == LOG_OBSOLETE) || (MARIO_ISONBOARD == LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_mario_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//I can use you after all!
	if(MARIO_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//I knew it! I'll see you on the ship!
		MARIO_ISONBOARD = LOG_SUCCESS;
		AI_StopProcessInfos(self);
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//You can't treat me like that. I'll gut you!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc = none_101_mario;
	nr = 900;
	condition = dia_mario_pickpocket_condition;
	information = dia_mario_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mario_pickpocket_condition()
{
	return c_beklauen(71,220);
};

func void dia_mario_pickpocket_info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_BACK,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,dia_mario_pickpocket_doit);
};

func void dia_mario_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

