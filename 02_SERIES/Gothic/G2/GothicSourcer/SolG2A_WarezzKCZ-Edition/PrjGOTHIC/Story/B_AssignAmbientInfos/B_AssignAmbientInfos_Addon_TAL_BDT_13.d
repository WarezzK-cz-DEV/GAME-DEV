
instance DIA_ADDON_TAL_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_tal_bdt_13_exit_condition;
	information = dia_addon_tal_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tal_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TAL_BDT_13_HI(C_INFO)
{
	nr = 2;
	condition = dia_addon_tal_bdt_13_hi_condition;
	information = dia_addon_tal_bdt_13_hi_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_tal_bdt_13_hi_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_hi_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Hi_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_01");	//Either you'll get eaten by a beast or you'll get eaten by a beast.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Hi_13_02");	//This swamp will be our grave...
};


instance DIA_ADDON_TAL_BDT_13_TAL(C_INFO)
{
	nr = 3;
	condition = dia_addon_tal_bdt_13_tal_condition;
	information = dia_addon_tal_bdt_13_tal_info;
	permanent = TRUE;
	description = "What do you know about this valley?";
};


func int dia_addon_tal_bdt_13_tal_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_tal_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_Tal_15_00");	//What do you know about this valley?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_01");	//There's loads of old stuff here. Raven's ordered us to gather up everything.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_Tal_13_02");	//No idea what he wants with it, but nobody in his right mind would risk his neck for a few old rocks...
};


instance DIA_ADDON_TAL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_tal_bdt_13_news_condition;
	information = dia_addon_tal_bdt_13_news_info;
	permanent = TRUE;
	description = "Is there anything new?";
};


func int dia_addon_tal_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_tal_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_TAL_BDT_13_News_15_00");	//Is there anything new?
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_01");	//We really put one over on those pirates.
	AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_02");	//They provided us with prisoners, but never saw a coin for it. No wonder they're angry.
	if(BDT_13_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_TAL_BDT_13_News_13_03");	//But what can they do? Attack the camp? (laughs) HAHAHA.
		BDT_13_EINMAL = TRUE;
	};
};

func void b_assignambientinfos_addon_tal_bdt_13(var C_NPC slf)
{
	dia_addon_tal_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_hi.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_tal.npc = Hlp_GetInstanceID(slf);
	dia_addon_tal_bdt_13_news.npc = Hlp_GetInstanceID(slf);
};

