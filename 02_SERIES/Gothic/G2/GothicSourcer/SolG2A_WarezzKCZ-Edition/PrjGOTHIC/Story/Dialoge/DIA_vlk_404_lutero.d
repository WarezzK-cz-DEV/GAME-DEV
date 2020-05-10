
instance DIA_LUTERO_EXIT(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 999;
	condition = dia_lutero_exit_condition;
	information = dia_lutero_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lutero_exit_condition()
{
	return TRUE;
};

func void dia_lutero_exit_info()
{
	AI_StopProcessInfos(self);
	if((LUTERO_KRALLEN == LOG_RUNNING) && (MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) == FALSE))
	{
		LUTERO_KRALLEN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_LUTERO_HALLO(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_hallo_condition;
	information = dia_lutero_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_hallo_condition()
{
	if(((other.guild != GIL_NONE) || (other.guild != GIL_NOV)) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_hallo_info()
{
	AI_Output(self,other,"DIA_Lutero_Hallo_13_00");	//My name is Lutero. I buy and sell all kinds of things.
	AI_Output(other,self,"DIA_Lutero_Hallo_15_01");	//What wares do you have to offer?
	AI_Output(self,other,"DIA_Lutero_Hallo_13_02");	//Well, especially rare and unusual things. So far I have always managed to fulfill my customers' wishes.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Lutero deals in unusual and rare objects in the upper quarter.");
};


instance DIA_LUTERO_GETLOST(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_getlost_condition;
	information = dia_lutero_getlost_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lutero_getlost_condition()
{
	if(((other.guild == GIL_NONE) || (other.guild == GIL_NOV)) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lutero_getlost_info()
{
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_00");	//Scram, buster! Don't you have anything to do? Then go find work - but elsewhere!
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_GetLost_13_01");	//What do you want, novice? Shouldn't you be in the monastery?
	};
	AI_StopProcessInfos(self);
};


instance DIA_LUTERO_SNAPPER(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_snapper_condition;
	information = dia_lutero_snapper_info;
	permanent = FALSE;
	description = "Are you looking for anything in particular?";
};


func int dia_lutero_snapper_condition()
{
	if((other.guild != GIL_NONE) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_lutero_snapper_info()
{
	AI_Output(other,self,"DIA_Lutero_Snapper_15_00");	//Are you looking for anything in particular?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_01");	//Yes, for my current assignment I need the claws of a snapper.
	AI_Output(self,other,"DIA_Lutero_Snapper_13_02");	//But not just any old claws. It would have to be something special - the claws of a mighty beast who has killed many men already, or something like that.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_03");	//Where can I find snappers?
	AI_Output(self,other,"DIA_Lutero_Snapper_13_04");	//There are a few of them on this island, but most of them live in the Valley of Mines.
	AI_Output(other,self,"DIA_Lutero_Snapper_15_05");	//And what's in it for me?
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_06");	//I could find you a runestone.
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_07");	//I could get you a ring of invincibility.
	};
	AI_Output(other,self,"DIA_Lutero_Hello_15_08");	//I'll see what I can do.
	Log_CreateTopic(TOPIC_LUTERO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LUTERO,LOG_RUNNING);
	b_logentry(TOPIC_LUTERO,"The merchant Lutero is looking for the claws of a particularly powerful snapper.");
	LUTERO_KRALLEN = LOG_RUNNING;
};


instance DIA_LUTERO_KRALLE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_kralle_condition;
	information = dia_lutero_kralle_info;
	permanent = FALSE;
	description = "I've got some special snapper claws for you.";
};


func int dia_lutero_kralle_condition()
{
	if((Npc_HasItems(other,itat_clawleader) >= 1) && Npc_KnowsInfo(other,dia_lutero_snapper))
	{
		return TRUE;
	};
};

func void dia_lutero_kralle_info()
{
	AI_Output(other,self,"DIA_Lutero_Kralle_15_00");	//I've got some special snapper claws for you.
	LUTERO_KRALLEN = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lutero_Kralle_13_01");	//My customer will be happy to hear that.
	b_giveinvitems(other,self,itat_clawleader,1);
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_02");	//I don't have the runestone here. But I know where it can be found.
		AI_Output(self,other,"DIA_Lutero_Hello_13_03");	//On your way from town to the inn, you'll pass under a bridge.
		AI_Output(self,other,"DIA_Lutero_Hello_13_04");	//There, in a cave, a friend of mine has deposited a runestone in a chest. Here's the key.
		b_giveinvitems(self,other,itke_rune_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Lutero_Hello_13_05");	//Here's the ring I promised you.
		b_giveinvitems(self,other,itri_prot_total_01,1);
	};
};


instance DIA_LUTERO_TRADE(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 5;
	condition = dia_lutero_trade_condition;
	information = dia_lutero_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_lutero_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_lutero_hallo))
	{
		return TRUE;
	};
};

func void dia_lutero_trade_info()
{
	AI_Output(other,self,"DIA_Lutero_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
};


instance DIA_LUTERO_PICKPOCKET(C_INFO)
{
	npc = vlk_404_lutero;
	nr = 900;
	condition = dia_lutero_pickpocket_condition;
	information = dia_lutero_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lutero_pickpocket_condition()
{
	return c_beklauen(58,65);
};

func void dia_lutero_pickpocket_info()
{
	Info_ClearChoices(dia_lutero_pickpocket);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_BACK,dia_lutero_pickpocket_back);
	Info_AddChoice(dia_lutero_pickpocket,DIALOG_PICKPOCKET,dia_lutero_pickpocket_doit);
};

func void dia_lutero_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lutero_pickpocket);
};

func void dia_lutero_pickpocket_back()
{
	Info_ClearChoices(dia_lutero_pickpocket);
};

