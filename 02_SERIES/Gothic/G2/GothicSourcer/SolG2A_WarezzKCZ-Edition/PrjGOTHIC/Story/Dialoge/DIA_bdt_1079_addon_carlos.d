
instance DIA_ADDON_CARLOS_EXIT(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 999;
	condition = dia_addon_carlos_exit_condition;
	information = dia_addon_carlos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V3;
};


func int dia_addon_carlos_exit_condition()
{
	return TRUE;
};

func void dia_addon_carlos_exit_info()
{
	AI_Output(other,self,"DIA_GornDJG_StartCamp_By_15_00");	//I'll see you around
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CARLOS_PICKPOCKET(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 900;
	condition = dia_addon_carlos_pickpocket_condition;
	information = dia_addon_carlos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_carlos_pickpocket_condition()
{
	return c_beklauen(71,85);
};

func void dia_addon_carlos_pickpocket_info()
{
	Info_ClearChoices(dia_addon_carlos_pickpocket);
	Info_AddChoice(dia_addon_carlos_pickpocket,DIALOG_BACK,dia_addon_carlos_pickpocket_back);
	Info_AddChoice(dia_addon_carlos_pickpocket,DIALOG_PICKPOCKET,dia_addon_carlos_pickpocket_doit);
};

func void dia_addon_carlos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_carlos_pickpocket);
};

func void dia_addon_carlos_pickpocket_back()
{
	Info_ClearChoices(dia_addon_carlos_pickpocket);
};


instance DIA_ADDON_CARLOS_HI(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 1;
	condition = dia_addon_carlos_hi_condition;
	information = dia_addon_carlos_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_carlos_hi_condition()
{
	if(Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_carlos_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Carlos_HI_12_00");	//Hey, are you the new guy who knocked down Franco?
	Info_ClearChoices(dia_addon_carlos_hi);
	Info_AddChoice(dia_addon_carlos_hi,"What? Me? No!",dia_addon_carlos_hi_no);
	Info_AddChoice(dia_addon_carlos_hi,"Yes. Why?",dia_addon_carlos_hi_yes);
};

func void dia_addon_carlos_hi_yes()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_Yes_15_00");	//Yes, why?
	AI_Output(self,other,"DIA_Addon_Carlos_HI_Yes_12_01");	//(angry) Because now I have to take over his job. You did a great job! Thanks a lot!
	Info_ClearChoices(dia_addon_carlos_hi);
};

func void dia_addon_carlos_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Carlos_HI_No_15_00");	//What? Me? No!
	AI_Output(self,other,"DIA_Addon_Carlos_HI_No_12_01");	//Ah! No offense!
	Info_ClearChoices(dia_addon_carlos_hi);
};


instance DIA_ADDON_CARLOS_ATTENTAT(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 2;
	condition = dia_addon_carlos_attentat_condition;
	information = dia_addon_carlos_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_carlos_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_carlos_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_00");	//After the attacker was dead, Thorus assigned me to get a new man for the camp.
	if(LOGAN_INSIDE == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_01");	//And Franco sent Logan.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_02");	//And Franco sent a new guy.
	};
	AI_Output(self,other,"DIA_Addon_Carlos_Attentat_12_03");	//Hey, I just do what Thorus tells me. I don't know anything about the attack itself.
};


instance DIA_ADDON_CARLOS_PERM(C_INFO)
{
	npc = bdt_1079_addon_carlos;
	nr = 3;
	condition = dia_addon_carlos_perm_condition;
	information = dia_addon_carlos_perm_info;
	permanent = TRUE;
	description = "And what's it like leading the hunters?";
};


func int dia_addon_carlos_perm_condition()
{
	return TRUE;
};

func void dia_addon_carlos_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Carlos_PERM_15_00");	//And what's it like leading the hunters?
	AI_Output(self,other,"DIA_Addon_Carlos_PERM_12_00");	//Leave me alone!
	AI_StopProcessInfos(self);
};

