
instance DIA_SARAH_EXIT(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 999;
	condition = dia_sarah_exit_condition;
	information = dia_sarah_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sarah_exit_condition()
{
	return TRUE;
};

func void dia_sarah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_PICKPOCKET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 900;
	condition = dia_sarah_pickpocket_condition;
	information = dia_sarah_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_sarah_pickpocket_condition()
{
	return c_beklauen(57,60);
};

func void dia_sarah_pickpocket_info()
{
	Info_ClearChoices(dia_sarah_pickpocket);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_BACK,dia_sarah_pickpocket_back);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_PICKPOCKET,dia_sarah_pickpocket_doit);
};

func void dia_sarah_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sarah_pickpocket);
};

func void dia_sarah_pickpocket_back()
{
	Info_ClearChoices(dia_sarah_pickpocket);
};


instance DIA_SARAH_GREET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 1;
	condition = dia_sarah_greet_condition;
	information = dia_sarah_greet_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_greet_info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//Ah! There you are again!
};


instance DIA_SARAH_HALLO(C_INFO)
{
	npc = vlk_470_sarah;
	condition = dia_sarah_hallo_condition;
	information = dia_sarah_hallo_info;
	permanent = FALSE;
	description = "How's business?";
};


func int dia_sarah_hallo_condition()
{
	return TRUE;
};

func void dia_sarah_hallo_info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//How's business?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//When the paladins came, I first thought that was a good business opportunity.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//But they let Harad make their weapons, and neither Hakon nor I make even one gold piece off of them.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//Moreover, the farmers no longer supply us with food, and all the prices have gone up.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Sarah sells weapons at the marketplace.");
};


instance DIA_SARAH_BAUERN(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 2;
	condition = dia_sarah_bauern_condition;
	information = dia_sarah_bauern_info;
	permanent = FALSE;
	description = "What's the problem with the farmers?";
};


func int dia_sarah_bauern_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo))
	{
		return TRUE;
	};
};

func void dia_sarah_bauern_info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//What's the problem with the farmers?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//They refuse to deliver their goods.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//Now that the ships no longer come in, the city depends entirely on supplies provided by the farmers, of course.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//And Onar, the largest farmer, has hired mercenaries to protect his farm from the city guards. Otherwise, they'd simply snatch the goods for themselves.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//But the mercenaries don't just guard Onar's farm.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//They come as far as the small farms outside of town to intimidate the farmers.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//I saw them as I was passing Akil's farm. I wouldn't like to be in his shoes now.
};


instance DIA_SARAH_AKILSHOF(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 3;
	condition = dia_sarah_akilshof_condition;
	information = dia_sarah_akilshof_info;
	permanent = FALSE;
	description = "Where can I find Akil's farm?";
};


func int dia_sarah_akilshof_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_bauern))
	{
		return TRUE;
	};
};

func void dia_sarah_akilshof_info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//Where will I find Akil's farm?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//If you go out of the east gate here and follow the road to the right, you'll come to a stairway.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//It leads up to Akil's farm.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//But I wouldn't go there now - the mercenaries are certainly still there.
};


instance DIA_SARAH_TRADE(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_trade_condition;
	information = dia_sarah_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_sarah_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo) && (MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_sarah_trade_info()
{
	if(SARAH_FLAG == 1)
	{
		b_clearsmithinv(self);
		if(SARAH_SWORDRAWS > 0)
		{
			CreateInvItems(self,itmiswordraw,SARAH_SWORDRAWS);
		};
		SARAH_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
	SARAH_WAFFENGESEHEN = TRUE;
};


instance DIA_SARAH_IMKNAST(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_imknast_condition;
	information = dia_sarah_imknast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_imknast_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_sarah_imknast_info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//You! You dare show your face here! I cannot prove it, but I bet that you played a part in this dirty game.
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//It's your fault that I'm here. Yours, and that of this damned Canthar - may Innos punish you!
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_SUCCESS(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 4;
	condition = dia_sarah_success_condition;
	information = dia_sarah_success_info;
	permanent = FALSE;
	description = "Canthar was trying to trick you...";
};


func int dia_sarah_success_condition()
{
	if(CANTHAR_AUSGELIEFERT == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_success_info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//Canthar was trying to trick you, and to get your booth for himself. But I've turned him over to the city guard.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//Then you've made an enemy of a dangerous man. I've known the bastard for a long time, and he's always wanted my place for himself.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//Take this weapon as a token of my gratitude.
	b_giveplayerxp(XP_CANTHARIMKNAST);
	b_giveinvitems(self,other,itmw_piratensaebel,1);
};

