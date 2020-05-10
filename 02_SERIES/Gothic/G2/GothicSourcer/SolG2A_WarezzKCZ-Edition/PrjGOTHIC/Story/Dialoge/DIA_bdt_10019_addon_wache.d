
instance DIA_ADDON_BDT_10019_WACHE_EXIT(C_INFO)
{
	npc = bdt_10019_addon_wache;
	nr = 999;
	condition = dia_addon_10019_wache_exit_condition;
	information = dia_addon_10019_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10019_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10019_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10019_WACHE_HI(C_INFO)
{
	npc = bdt_10019_addon_wache;
	nr = 2;
	condition = dia_addon_10019_wache_hi_condition;
	information = dia_addon_10019_wache_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10019_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10019_wache_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_06_00");	//So, on your way to the mine?
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
	Info_AddChoice(dia_addon_bdt_10019_wache_hi,"Actually, I want to see Raven.",dia_addon_bdt_10019_wache_hi_raven);
	Info_AddChoice(dia_addon_bdt_10019_wache_hi,"Yes.",dia_addon_bdt_10019_wache_hi_ja);
};

func void b_say_wache_kaputt()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_kaputt_15_00");	//Why are they dead?
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_kaputt_06_01");	//(laughs maliciously) They worked themselves to pieces.
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
};

func void dia_addon_bdt_10019_wache_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Raven_15_00");	//Actually, I want to see Raven.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Raven_06_01");	//(warning) Hey - try to enter the temple and you are as dead as the prisoners here.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Raven_06_02");	//Move your ass over into the mine instead.
	b_say_wache_kaputt();
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
};

func void dia_addon_bdt_10019_wache_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_BDT_10019_Wache_Hi_Ja_15_00");	//Yes.
	AI_Output(self,other,"DIA_Addon_BDT_10019_Wache_Hi_Ja_06_01");	//Then watch out for yourself. Watch out better than these guys who are scattered all over the place here did.
	b_say_wache_kaputt();
	Info_ClearChoices(dia_addon_bdt_10019_wache_hi);
};

