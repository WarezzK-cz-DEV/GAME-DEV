
instance DIA_ADDON_TAL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_1_exit_condition;
	information = dia_addon_tal_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_1_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_1_hi_condition;
	information = dia_addon_tal_bdt_1_hi_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_tal_bdt_1_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Hi_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_01");	//I'm waiting until they ask for someone new and it's my turn.
	if(!Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_02");	//Of all the people that are out here, only Franco can get in.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Hi_01_03");	//Now that Franco is dead, hopefully I have a better chance.
	};
};


instance DIA_ADDON_TAL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_1_lager_condition;
	information = dia_addon_tal_bdt_1_lager_info;
	permanent = TRUE;
	description = "What can you tell me about the camp?";
};


func int dia_addon_tal_bdt_1_lager_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Lager_15_00");	//What can you tell me about the camp?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_01");	//Watch out who you tangle with! If you start a fight for no reason, you'll have them all against you, fast!
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Lager_01_02");	//Most of them are nervous about their gold and some of the boys are watching out for each other.
};


instance DIA_ADDON_TAL_BDT_1_RAVEN(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_1_raven_condition;
	information = dia_addon_tal_bdt_1_raven_info;
	permanent = TRUE;
	description = "What do you know about Raven?";
};


func int dia_addon_tal_bdt_1_raven_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_1_raven_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_1_Raven_15_00");	//What do you know about Raven?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_01");	//He's the guy who first showed up here with his boys.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_02");	//He's the leader of the camp. You don't mess around with him, let me tell you.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_1_Raven_01_03");	//Once they needed five new men because he had taken out his anger on some of his own people.
};

func void b_assignambientinfos_addon_tal_bdt_1(var C_NPC slf)
{
	dia_addon_tal_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_1_raven.npc = Hlp_GetInstanceID(slf);
};

