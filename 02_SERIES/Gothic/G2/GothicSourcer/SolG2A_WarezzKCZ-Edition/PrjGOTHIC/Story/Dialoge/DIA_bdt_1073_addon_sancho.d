
instance DIA_ADDON_SANCHO_EXIT(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 999;
	condition = dia_addon_sancho_exit_condition;
	information = dia_addon_sancho_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_sancho_exit_condition()
{
	return TRUE;
};

func void dia_addon_sancho_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SANCHO_PICKPOCKET(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 900;
	condition = dia_addon_sancho_pickpocket_condition;
	information = dia_addon_sancho_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_sancho_pickpocket_condition()
{
	return c_beklauen(50,40);
};

func void dia_addon_sancho_pickpocket_info()
{
	Info_ClearChoices(dia_addon_sancho_pickpocket);
	Info_AddChoice(dia_addon_sancho_pickpocket,DIALOG_BACK,dia_addon_sancho_pickpocket_back);
	Info_AddChoice(dia_addon_sancho_pickpocket,DIALOG_PICKPOCKET,dia_addon_sancho_pickpocket_doit);
};

func void dia_addon_sancho_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_sancho_pickpocket);
};

func void dia_addon_sancho_pickpocket_back()
{
	Info_ClearChoices(dia_addon_sancho_pickpocket);
};


instance DIA_ADDON_SANCHO_HI(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 2;
	condition = dia_addon_sancho_hi_condition;
	information = dia_addon_sancho_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_sancho_hi_condition()
{
	return TRUE;
};

func void dia_addon_sancho_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_00");	//Shit, another new boy. (laughs) Here for the gold, too, aren't you?
	AI_Output(other,self,"DIA_Addon_Sancho_HI_15_01");	//Gold?
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_02");	//(laughing) Quit trying to kid me!
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_03");	//All the new boys who come here want into the mine.
	AI_Output(self,other,"DIA_Addon_Sancho_HI_06_04");	//But don't think it's that easy!
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_SANCHO_LAGER(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 2;
	condition = dia_addon_sancho_lager_condition;
	information = dia_addon_sancho_lager_info;
	permanent = FALSE;
	description = "How do I get to the camp?";
};


func int dia_addon_sancho_lager_condition()
{
	return TRUE;
};

func void dia_addon_sancho_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Lager_15_00");	//How do I get to the camp?
	AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_01");	//Just follow the boardwalk!
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_02");	//But if you want to get into the mine, you'll have to get past Franco.
		AI_Output(self,other,"DIA_Addon_Sancho_Lager_06_03");	//He expects all the new boys to slave away out here for a while first!
	};
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"All the new people have to work in the swamp before they gain access to the mine.");
};


instance DIA_ADDON_SANCHO_MINE(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 3;
	condition = dia_addon_sancho_mine_condition;
	information = dia_addon_sancho_mine_info;
	permanent = FALSE;
	description = "Tell me more about the mine...";
};


func int dia_addon_sancho_mine_condition()
{
	if(!Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Mine_15_00");	//Tell me more about the mine...
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_01");	//I'll give you some good advice: if you want to get in there, get in good with Franco. He's the boss out here.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_02");	//He decides who's the next to go in.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_03");	//But he'll only let you in if you don't goldbrick out here.
	AI_Output(self,other,"DIA_Addon_Sancho_Mine_06_04");	//So go to him and let him give you a job!
	b_logentry(TOPIC_ADDON_FRANCO,"FRANCO decides who gets into the camp. He also hands out the assignments.");
};


instance DIA_ADDON_SANCHO_FRANCO(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 4;
	condition = dia_addon_sancho_franco_condition;
	information = dia_addon_sancho_franco_info;
	permanent = FALSE;
	description = "Where do I find this Franco?";
};


func int dia_addon_sancho_franco_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_mine) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_franco_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Franco_15_00");	//Where do I find this Franco?
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_01");	//He mostly hangs out in the court in front of the camp.
	AI_Output(self,other,"DIA_Addon_Sancho_Franco_06_02");	//Get in good with him or you'll wind up with a crappy job like me!
	b_logentry(TOPIC_ADDON_FRANCO,"Franco hangs out in the yard in front of the camp.");
};


instance DIA_ADDON_SANCHO_SPITZEL(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 5;
	condition = dia_addon_sancho_spitzel_condition;
	information = dia_addon_sancho_spitzel_info;
	permanent = FALSE;
	description = "Do you have to hang around here all the time?";
};


func int dia_addon_sancho_spitzel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_franco) || Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_sancho_spitzel_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Spitzel_15_00");	//Do you have to hang around here all the time?
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_01");	//I'm supposed to check out all the new boys, to make sure that none of them are spies.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_02");	//But you can forget it. I mean, we're at the end of the world here - in the middle of a swamp.
	AI_Output(self,other,"DIA_Addon_Sancho_Spitzel_06_03");	//No one can find us, no one will find us - and why should someone go to the trouble of sending us a spy?
};


instance DIA_ADDON_SANCHO_PERM(C_INFO)
{
	npc = bdt_1073_addon_sancho;
	nr = 99;
	condition = dia_addon_sancho_perm_condition;
	information = dia_addon_sancho_perm_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_addon_sancho_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_sancho_spitzel))
	{
		return TRUE;
	};
};


var int comment_franco;
var int comment_esteban;

func void dia_addon_sancho_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Sancho_Perm_15_00");	//What's new?
	if(Npc_IsDead(franco) && (COMMENT_FRANCO == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_01");	//I heard you killed Franco. Nice work...
		if(!Npc_IsDead(carlos))
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_02");	//... but now we've got that Carlos on our backs. He doesn't take any nonsense...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_03");	//And you did in Carlos, too? Pal, you're a real nasty killer, aren't you? Just leave me alone.
		};
		COMMENT_FRANCO = TRUE;
	}
	else if(Npc_IsDead(esteban) && (COMMENT_ESTEBAN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_04");	//I heard you killed Esteban. Hey, man, you're planning something, aren't you?
		COMMENT_ESTEBAN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Sancho_Perm_06_05");	//Nah, there's nothing new right now.
	};
};

