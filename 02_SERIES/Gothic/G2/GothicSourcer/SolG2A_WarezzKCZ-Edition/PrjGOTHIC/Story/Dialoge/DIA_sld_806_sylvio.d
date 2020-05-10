
instance DIA_SYLVIO_EXIT(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 999;
	condition = dia_sylvio_exit_condition;
	information = dia_sylvio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sylvio_exit_condition()
{
	return TRUE;
};

func void dia_sylvio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_HALLO(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 1;
	condition = dia_sylvio_hallo_condition;
	information = dia_sylvio_hallo_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_sylvio_hallo_condition()
{
	return TRUE;
};

func void dia_sylvio_hallo_info()
{
	AI_Output(other,self,"DIA_Sylvio_Hallo_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Sylvio_Hallo_09_01");	//Have I given you permission to address me?
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_THEKLA(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 2;
	condition = dia_sylvio_thekla_condition;
	information = dia_sylvio_thekla_info;
	permanent = FALSE;
	description = "Thekla has a problem with you.";
};


func int dia_sylvio_thekla_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem))
	{
		return TRUE;
	};
};

func void dia_sylvio_thekla_info()
{
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_00");	//Thekla has a problem with you.
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_01");	//So? What is the dear lady's problem? And why doesn't she come herself?
	AI_Output(other,self,"DIA_Sylvio_Thekla_15_02");	//You know that damn well...
	AI_Output(self,other,"DIA_Sylvio_Thekla_09_03");	//(cynically friendly) Why don't you go discuss that with my friend Bullco for a while?
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_GOSSIP(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 3;
	condition = dia_sylvio_gossip_condition;
	information = dia_sylvio_gossip_info;
	permanent = FALSE;
	description = "A lot of people talk about you...";
};


func int dia_sylvio_gossip_condition()
{
	return TRUE;
};

func void dia_sylvio_gossip_info()
{
	AI_Output(other,self,"DIA_Sylvio_Gossip_15_00");	//A lot of people talk about you...
	AI_Output(self,other,"DIA_Sylvio_Gossip_09_01");	//A lot of people talk too much.
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ABOUTLEE(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 4;
	condition = dia_sylvio_aboutlee_condition;
	information = dia_sylvio_aboutlee_info;
	permanent = FALSE;
	description = "What do you think of Lee?";
};


func int dia_sylvio_aboutlee_condition()
{
	return TRUE;
};

func void dia_sylvio_aboutlee_info()
{
	AI_Output(other,self,"DIA_Sylvio_AboutLee_15_00");	//What do you think of Lee?
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_01");	//(lightly ironic) Oh, he's a good fighter. I wouldn't ever want to pick a fight with him.
	AI_Output(self,other,"DIA_Sylvio_AboutLee_09_02");	//(cold) Unless, of course, it couldn't be avoided.
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_MENDEFEATED(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 5;
	condition = dia_sylvio_mendefeated_condition;
	information = dia_sylvio_mendefeated_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sylvio_mendefeated_condition()
{
	var int victories;
	victories = 0;
	if(rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		victories = victories + 1;
	};
	if((MIS_JARVIS_SLDKO != FALSE) && (victories >= 2))
	{
		return TRUE;
	};
};

func void dia_sylvio_mendefeated_info()
{
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_00");	//It has come to my attention that you have it in for my boys!
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_01");	//And as far as I know, you're one of Lee's protégés.
	AI_Output(self,other,"DIA_Sylvio_MenDefeated_09_02");	//I'm warning you! A few things are going to be different around here soon, and we'll talk about this again then!
	SYLVIO_MENDEFEATED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ASSHOLE(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 2;
	condition = dia_sylvio_asshole_condition;
	information = dia_sylvio_asshole_info;
	permanent = FALSE;
	description = "Hey, asshole...";
};


func int dia_sylvio_asshole_condition()
{
	if(SYLVIO_ANGEQUATSCHT >= 1)
	{
		return TRUE;
	};
};

func void dia_sylvio_asshole_info()
{
	AI_Output(other,self,"DIA_Sylvio_Asshole_15_00");	//Hey, asshole...
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_01");	//You don't actually think I'd get involved in a duel with you?
	AI_Output(self,other,"DIA_Sylvio_Asshole_09_02");	//Go crawl back under your rock.
	SYLVIO_ANGEQUATSCHT = SYLVIO_ANGEQUATSCHT + 1;
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIOSLD_PICKPOCKET(C_INFO)
{
	npc = sld_806_sylvio;
	nr = 900;
	condition = dia_sylviosld_pickpocket_condition;
	information = dia_sylviosld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sylviosld_pickpocket_condition()
{
	return c_beklauen(80,210);
};

func void dia_sylviosld_pickpocket_info()
{
	Info_ClearChoices(dia_sylviosld_pickpocket);
	Info_AddChoice(dia_sylviosld_pickpocket,DIALOG_BACK,dia_sylviosld_pickpocket_back);
	Info_AddChoice(dia_sylviosld_pickpocket,DIALOG_PICKPOCKET,dia_sylviosld_pickpocket_doit);
};

func void dia_sylviosld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sylviosld_pickpocket);
};

func void dia_sylviosld_pickpocket_back()
{
	Info_ClearChoices(dia_sylviosld_pickpocket);
};

