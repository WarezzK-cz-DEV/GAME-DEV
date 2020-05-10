
instance DIA_ELENA_EXIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 999;
	condition = dia_elena_exit_condition;
	information = dia_elena_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_elena_exit_condition()
{
	return TRUE;
};

func void dia_elena_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ELENA_HALLO(C_INFO)
{
	npc = bau_911_elena;
	nr = 1;
	condition = dia_elena_hallo_condition;
	information = dia_elena_hallo_info;
	permanent = FALSE;
	description = "Hello, pretty girl.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Hello, pretty girl.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Hm. Just where did you escape from?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//What did you want?
	};
};


instance DIA_ELENA_AUFSTAND(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_aufstand_condition;
	information = dia_elena_aufstand_info;
	permanent = FALSE;
	description = "They say you are revolting against the King?";
};


func int dia_elena_aufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufstand_info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//They say you are revolting against the King?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//My father has decided that it's time we defended ourselves.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//The militia never helped us anyway. They only came here to drag off our provisions.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "What kind of work is to be had here on the farm?";
};


func int dia_elena_arbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_arbeit_info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//What kind of work is to be had here on the farm?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//My father pays money to all the men who help defend the farm.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Are you interested? You don't look like someone who has a passion for field labor.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//How much does your father pay?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//You'd have to negotiate that with him.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//All I know is that each mercenary here gets paid every day.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "Are there any rules here that I should stick to?";
};


func int dia_elena_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_regeln_info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Are there any rules here that I should stick to?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//You don't touch anything here that isn't yours.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//You stay away from areas that are none of your business.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//And if you must pick a fight, stick to the mercenaries.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//If you start a brawl with the farmers, everybody here will be against you.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "What's your job here?";
};


func int dia_elena_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufgabe_info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//What's your job here?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//I sell the goods that we produce. If you want to buy something, just let me know.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//But let me warn you. I won't stand for either haggling or stealing, understood?
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Elena sells goods on Onar's farm.");
};


var int elena_trade_mit_mir;

instance DIA_ELENA_TRADE(C_INFO)
{
	npc = bau_911_elena;
	nr = 7;
	condition = dia_elena_trade_condition;
	information = dia_elena_trade_info;
	permanent = TRUE;
	description = "Show me your wares!";
	trade = TRUE;
};


func int dia_elena_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_aufgabe) || (ELENA_TRADE_MIT_MIR == TRUE))
	{
		return TRUE;
	};
};

func void dia_elena_trade_info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Show me your wares!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//What can I offer you?
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "Has anything significant happened lately?";
};


func int dia_elena_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_perm_info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Has anything significant happened lately?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//A few days ago, my father decreed that we're no longer allowed to sell anything in town.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//So now I'm staying here on the farm and selling my wares to visitors only.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//The militia attacks on the neighboring farms are getting more frequent. Only a question of time until my father will intervene.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//The land has become quite unsafe. Now no one ventures beyond his own fields. It's been a long time since any of us has been to town.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//The mercenaries have become more and more restless. But since Sylvio and his boys have left, they seem to relax a little.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Everybody keeps talking about the impending orc attack. But I don't really believe in that. I think we're safe from them here on the farm.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "You're selling mine shares?";
};


func int dia_elena_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_minenanteil_info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//You're selling mine shares?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//So what. I paid an arm and a leg for them myself.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ELENA_PICKPOCKET(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_pickpocket_condition;
	information = dia_elena_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_elena_pickpocket_condition()
{
	return c_beklauen(30,35);
};

func void dia_elena_pickpocket_info()
{
	Info_ClearChoices(dia_elena_pickpocket);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_BACK,dia_elena_pickpocket_back);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_PICKPOCKET,dia_elena_pickpocket_doit);
};

func void dia_elena_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_elena_pickpocket);
};

func void dia_elena_pickpocket_back()
{
	Info_ClearChoices(dia_elena_pickpocket);
};

