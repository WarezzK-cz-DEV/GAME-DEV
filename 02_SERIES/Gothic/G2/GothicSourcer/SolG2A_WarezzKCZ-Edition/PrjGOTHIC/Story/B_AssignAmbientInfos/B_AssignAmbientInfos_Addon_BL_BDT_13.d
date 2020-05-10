
instance DIA_ADDON_BL_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_13_exit_condition;
	information = dia_addon_bl_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_exit_info()
{
	BDT_13_NERVER = 0;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_13_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_13_chef_condition;
	information = dia_addon_bl_bdt_13_chef_info;
	permanent = TRUE;
	description = "Who's in charge here?";
};


func int dia_addon_bl_bdt_13_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Chef_15_00");	//Who's in charge here?
	if(RAVENISDEAD == TRUE)
	{
		if(!Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_01");	//(jubilant) Our glorious leader Thorus. He'll make us all rich!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_02");	//Our glorious leader... uh... no idea...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Chef_13_03");	//(jubilant) Our glorious leader Raven. He'll make us all rich!
	};
};


instance DIA_ADDON_BL_BDT_13_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_13_lager_condition;
	information = dia_addon_bl_bdt_13_lager_info;
	permanent = TRUE;
	description = "What do you know about the camp?";
};


func int dia_addon_bl_bdt_13_lager_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Lager_15_00");	//What do you know about the camp?
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_01");	//Talk to Snaf if it's information you're after. That fat cook knows a bunch.
	AI_Output(self,other,"DIA_Addon_BL_BDT_13_Lager_13_02");	//If you want to buy something, go to Fisk. He gets hold of all kinds of things...
};


instance DIA_ADDON_BL_BDT_13_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_13_news_condition;
	information = dia_addon_bl_bdt_13_news_info;
	permanent = TRUE;
	description = "Anything new?";
};


func int dia_addon_bl_bdt_13_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_13_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_News_15_00");	//Anything new?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_01");	//Raven is dead. Now we'll NEVER get off this island.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_02");	//The pirates have set sail and taken off.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_03");	//Now there's only a couple of idiots sitting on the beach, and they don't have a decent ship.
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_News_13_04");	//Not even Beliar knows how we'll get off this island.
	};
};


instance DIA_ADDON_BL_BDT_13_GOLD(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_13_gold_condition;
	information = dia_addon_bl_bdt_13_gold_info;
	permanent = TRUE;
	description = "How can I get a lot of gold quickly?";
};


func int dia_addon_bl_bdt_13_gold_condition()
{
	if((MIS_SEND_BUDDLER != LOG_RUNNING) && (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_13_gold_info()
{
	BDT_13_NERVER = BDT_13_NERVER + 1;
	AI_Output(other,self,"DIA_Addon_BL_BDT_13_Gold_15_00");	//How can I get a lot of gold quickly?
	if(BDT_13_NERVER <= 2)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_01");	//Good question. Isn't that why we're all here?
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_02");	//Just see to it that you get a red stone from Thorus, then you can go into the mine.
	}
	else if(BDT_13_KILL == FALSE)
	{
		BDT_13_NERVER = 0;
		BDT_13_KILL = TRUE;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_03");	//Say, are you jerking me around? Piss off!
		AI_StopProcessInfos(self);
	}
	else
	{
		BDT_13_NERVER = 0;
		AI_Output(self,other,"DIA_Addon_BL_BDT_13_Gold_13_04");	//No more fun and games!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void b_assignambientinfos_addon_bl_bdt_13(var C_NPC slf)
{
	dia_addon_bl_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_13_gold.npc = Hlp_GetInstanceID(slf);
};

