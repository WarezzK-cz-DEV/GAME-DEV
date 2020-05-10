
instance DIA_PAL_262_EXIT(C_INFO)
{
	npc = pal_262_wache;
	nr = 999;
	condition = dia_pal_262_exit_condition;
	information = dia_pal_262_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_262_exit_condition()
{
	return TRUE;
};

func void dia_pal_262_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_262_GREET(C_INFO)
{
	npc = pal_262_wache;
	nr = 2;
	condition = dia_pal_262_greet_condition;
	information = dia_pal_262_greet_info;
	important = TRUE;
};


func int dia_pal_262_greet_condition()
{
	return TRUE;
};

func void dia_pal_262_greet_info()
{
	AI_Output(self,other,"DIA_PAL_262_GREET_10_00");	//Stop - who are you?
	AI_Output(other,self,"DIA_PAL_262_GREET_15_01");	//The question where I come from is much more important. I came across the pass.
	AI_Output(other,self,"DIA_PAL_262_GREET_15_02");	//So are you going to stop me now, or can I go in?
	AI_Output(self,other,"DIA_PAL_262_GREET_10_03");	//Well, I couldn't know that. Of course you're allowed in.
	AI_StopProcessInfos(self);
};


instance DIA_WACHE_PERM(C_INFO)
{
	npc = pal_262_wache;
	nr = 3;
	condition = dia_wache_perm_condition;
	information = dia_wache_perm_info;
	permanent = TRUE;
	description = "Who's in charge here?";
};


func int dia_wache_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_262_greet))
	{
		return TRUE;
	};
};

func void dia_wache_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Wache_PERM_15_00");	//Who's in charge here?
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_01");	//Our commander Garond and his two advisors, the paladins Oric and Parcival.
	AI_Output(self,other,"DIA_Addon_Wache_PERM_10_02");	//Just walk on in. During the day, you can find them in the throne room on the ground floor.
};

