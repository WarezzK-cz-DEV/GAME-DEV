
instance DIA_RUPERT_EXIT(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 999;
	condition = dia_rupert_exit_condition;
	information = dia_rupert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rupert_exit_condition()
{
	return TRUE;
};

func void dia_rupert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUPERT_PICKPOCKET(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_pickpocket_condition;
	information = dia_rupert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rupert_pickpocket_condition()
{
	return c_beklauen(18,10);
};

func void dia_rupert_pickpocket_info()
{
	Info_ClearChoices(dia_rupert_pickpocket);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_BACK,dia_rupert_pickpocket_back);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_PICKPOCKET,dia_rupert_pickpocket_doit);
};

func void dia_rupert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rupert_pickpocket);
};

func void dia_rupert_pickpocket_back()
{
	Info_ClearChoices(dia_rupert_pickpocket);
};


instance DIA_RUPERT_HELLO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_hello_condition;
	information = dia_rupert_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rupert_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_rupert_hello_info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Hello, stranger!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//You must be hungry and thirsty - can I perhaps interest you in my wares?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "I was actually on my way to see the paladins...";
};


func int dia_rupert_zupal_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void dia_rupert_zupal_info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//I was actually on my way to see the paladins...
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//There's little chance of that. Since the paladins made themselves at home in the upper end of town, hardly anyone gets in there any more.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "Can you help me get into the upper quarter?";
};


func int dia_rupert_helpmeintoov_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_zupal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_helpmeintoov_info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Can you help me get into the upper quarter?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Me? No, I don't have much say here myself!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//There are only a few people here in the lower city who have enough influence to get you past the guards.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Matteo, my boss, is one of them. Maybe you should talk to him.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"If I want to get in the upper quarter, I'll need the help of some influential citizens from the lower part of town.");
	b_logentry(TOPIC_OV,"The merchant Matteo is one of the influential citizens of the lower part of town.");
};


instance DIA_RUPERT_WOMATTEO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_womatteo_condition;
	information = dia_rupert_womatteo_info;
	permanent = FALSE;
	description = "Where can I find Matteo?";
};


func int dia_rupert_womatteo_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_womatteo_info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Where can I find Matteo?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//You're standing right outside his shop. Just go on in. He's practically always there.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Matteo's shop is at the south gate of the city. He sells equipment, weapons and supplies.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_RUPERT_WEREINFLUSS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 2;
	condition = dia_rupert_wereinfluss_condition;
	information = dia_rupert_wereinfluss_info;
	permanent = FALSE;
	description = "What about the other influential citizens?";
};


func int dia_rupert_wereinfluss_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_wereinfluss_info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//What about the other influential citizens?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//The merchants and master craftsmen here on the main street are the most important figures in the city.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//You should try to get accepted by one of them as an apprentice - like me.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//Since I started working for Matteo, the people in the city treat me with respect!
	b_logentry(TOPIC_OV,"I should try to start work as an apprentice for one of the master craftsmen.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "I need some money, and I'm looking for work.";
};


func int dia_rupert_work_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rupert_work_info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//I need some money, and I'm looking for work.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//I've heard that Bosper has trouble with his suppliers. His shop is right over there.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//They say he pays pretty well.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "What can you offer me?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//What do you have to offer?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//At the moment, I don't have much choice.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//The damned landowner doesn't deliver any more, and what we get from the small farms isn't enough to meet the demands of the city.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "Show me your wares.";
	trade = TRUE;
};


func int dia_rupert_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer))
	{
		return TRUE;
	};
};

func void dia_rupert_trade_info()
{
	if(Npc_HasItems(self,itfo_cheese) < 5)
	{
		CreateInvItems(self,itfo_cheese,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Show me your wares.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//I must beg your pardon for my poor selection. A man in your position is certainly used to better.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "Tell me more about the peasants' revolt.";
};


func int dia_rupert_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Tell me more about the peasants' revolt.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//It's quite simple: Onar, the fat landowner, won't pay any more taxes to the city.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//Imagine! We're at war with the orcs and the fat slob wants everything for himself!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//Normally, the city guard would take firm measures in such cases.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//But now comes the best part: they say Onar has hired mercenaries to keep the troops from the city off his back!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//MERCENARIES! The whole thing will end in a damn war! As if ONE war weren't enough!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "What do you know about Onar's mercenaries?";
};


func int dia_rupert_mercs_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_rupert_mercs_info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//What do you know about Onar's mercenaries?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//I heard that most of them are former convicts from the mining colony.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//And their leader is supposed to have been a big shot with the King - a general or something - whom they put away as a traitor!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//These are terrible times.
};

