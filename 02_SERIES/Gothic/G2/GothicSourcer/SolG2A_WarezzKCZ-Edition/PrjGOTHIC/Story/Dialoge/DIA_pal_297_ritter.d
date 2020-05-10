
instance DIA_PAL_297_EXIT(C_INFO)
{
	npc = pal_297_ritter;
	nr = 999;
	condition = dia_pal_297_exit_condition;
	information = dia_pal_297_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_297_exit_condition()
{
	return TRUE;
};

func void dia_pal_297_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_297_TRESPAS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 2;
	condition = dia_pal_297_trespas_condition;
	information = dia_pal_297_trespas_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_pal_297_trespas_condition()
{
	return TRUE;
};

func void dia_pal_297_trespas_info()
{
	AI_Output(other,self,"DIA_PAL_297_TRESPAS_15_00");	//How's it going?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_01");	//The area here is extremely dangerous, so you should turn back - we certainly don't want anything to happen to you.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_297_TRESPAS_04_02");	//It is very courageous of you to enter the valley. Just as long as you have enough healing potions with you.
	};
};


instance DIA_ADDON_PAL_297_RANGERBANDITS(C_INFO)
{
	npc = pal_297_ritter;
	nr = 5;
	condition = dia_addon_pal_297_rangerbandits_condition;
	information = dia_addon_pal_297_rangerbandits_info;
	description = "Have any bandits passed by here lately?";
};


func int dia_addon_pal_297_rangerbandits_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_pal_297_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_PAL_297_Rangerbandits_15_00");	//Have any bandits passed by here lately?
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_01");	//No idea what you're talking about. As long as we are on guard duty here, nobody passes. And certainly not any lousy bandits.
	AI_Output(self,other,"DIA_Addon_PAL_297_Rangerbandits_04_02");	//Ask those peasants back there. Maybe they've seen something.
};

