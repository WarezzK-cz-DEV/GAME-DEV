
instance DIA_ADDON_WACHE_02_EXIT(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 999;
	condition = dia_addon_wache_02_exit_condition;
	information = dia_addon_wache_02_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_wache_02_exit_condition()
{
	return TRUE;
};

func void dia_addon_wache_02_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_WACHE_02_PICKPOCKET(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 900;
	condition = dia_addon_wache_02_pickpocket_condition;
	information = dia_addon_wache_02_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_wache_02_pickpocket_condition()
{
	return c_beklauen(38,101);
};

func void dia_addon_wache_02_pickpocket_info()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
	Info_AddChoice(dia_addon_wache_02_pickpocket,DIALOG_BACK,dia_addon_wache_02_pickpocket_back);
	Info_AddChoice(dia_addon_wache_02_pickpocket,DIALOG_PICKPOCKET,dia_addon_wache_02_pickpocket_doit);
};

func void dia_addon_wache_02_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};

func void dia_addon_wache_02_pickpocket_back()
{
	Info_ClearChoices(dia_addon_wache_02_pickpocket);
};


instance DIA_ADDON_WACHE_02_HI(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 2;
	condition = dia_addon_wache_02_hi_condition;
	information = dia_addon_wache_02_hi_info;
	permanent = FALSE;
	description = "How's it going?";
};


func int dia_addon_wache_02_hi_condition()
{
	return TRUE;
};

func void dia_addon_wache_02_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Hi_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_01");	//Wait a minute, don't I know you from somewhere?
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Wache_02_Hi_13_02");	//Hmm... no. You're not him. Go on, piss off.
};


instance DIA_ADDON_WACHE_02_ATTENTAT(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 2;
	condition = dia_addon_wache_02_attentat_condition;
	information = dia_addon_wache_02_attentat_info;
	permanent = FALSE;
	description = "What do you know about the attack?";
};


func int dia_addon_wache_02_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_wache_02_hi) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_wache_02_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_Attentat_15_00");	//What do you know about the attack?
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_01");	//What do I know about it? (laughs) I broke the guy's legs.
	AI_Output(self,other,"DIA_Addon_Wache_02_Attentat_13_02");	//(threatening) And I'll do the same to anybody else who wants to attack Esteban...
};


instance DIA_ADDON_WACHE_02_PERM(C_INFO)
{
	npc = bdt_10005_addon_wache_02;
	nr = 99;
	condition = dia_addon_wache_02_perm_condition;
	information = dia_addon_wache_02_perm_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_wache_02_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_wache_02_hi))
	{
		return TRUE;
	};
};

func void dia_addon_wache_02_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_02_perm_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_01");	//Quiet up to now.
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Wache_02_perm_13_02");	//You look for the traitor - then we'll take care of him...
	};
};

