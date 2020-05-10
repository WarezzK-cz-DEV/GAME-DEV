
instance DIA_ADDON_MONTY_NW_EXIT(C_INFO)
{
	npc = strf_1124_addon_monty_nw;
	nr = 999;
	condition = dia_addon_monty_nw_exit_condition;
	information = dia_addon_monty_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_monty_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_monty_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MONTY_NW_HI(C_INFO)
{
	npc = strf_1124_addon_monty_nw;
	nr = 2;
	condition = dia_addon_monty_nw_hi_condition;
	information = dia_addon_monty_nw_hi_info;
	permanent = FALSE;
	description = "And? Back to work, are you?";
};


func int dia_addon_monty_nw_hi_condition()
{
	return TRUE;
};

func void dia_addon_monty_nw_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_00");	//And? Back to work, are you?
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_01");	//Oh man - they didn't get anything done while I was gone. Now I have to delve into those construction plans again.
	AI_Output(other,self,"DIA_Addon_Monty_NW_Hi_15_02");	//Oh well. Don't let me keep you, then.
	AI_Output(self,other,"DIA_Addon_Monty_NW_Hi_08_03");	//(laughs) All right. Have a good trip.
};


instance DIA_ADDON_MONTY_NW_PICKPOCKET(C_INFO)
{
	npc = strf_1124_addon_monty_nw;
	nr = 900;
	condition = dia_addon_monty_nw_pickpocket_condition;
	information = dia_addon_monty_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_monty_nw_pickpocket_condition()
{
	return c_beklauen(60,60);
};

func void dia_addon_monty_nw_pickpocket_info()
{
	Info_ClearChoices(dia_addon_monty_nw_pickpocket);
	Info_AddChoice(dia_addon_monty_nw_pickpocket,DIALOG_BACK,dia_addon_monty_nw_pickpocket_back);
	Info_AddChoice(dia_addon_monty_nw_pickpocket,DIALOG_PICKPOCKET,dia_addon_monty_nw_pickpocket_doit);
};

func void dia_addon_monty_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_monty_nw_pickpocket);
};

func void dia_addon_monty_nw_pickpocket_back()
{
	Info_ClearChoices(dia_addon_monty_nw_pickpocket);
};

