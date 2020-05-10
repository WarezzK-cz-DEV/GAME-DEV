
instance DIA_ADDON_BL_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_addon_bl_bdt_1_exit_condition;
	information = dia_addon_bl_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bl_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BL_BDT_1_CHEF(C_INFO)
{
	nr = 2;
	condition = dia_addon_bl_bdt_1_chef_condition;
	information = dia_addon_bl_bdt_1_chef_info;
	permanent = TRUE;
	description = "Who's in charge here?";
};


func int dia_addon_bl_bdt_1_chef_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_chef_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Chef_15_00");	//Who's in charge here?
	if(RAVENISDEAD == TRUE)
	{
		if(Npc_IsDead(thorus))
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_01");	//So many leaders come and go... after a while you lose an overview.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_02");	//I think Thorus is our boss now...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_03");	//Raven is our leader. He led us here and built the camp.
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Chef_01_04");	//He controls the mine, otherwise the dogs would have killed each other over the gold a long time ago.
	};
};


instance DIA_ADDON_BL_BDT_1_LAGER(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager_condition;
	information = dia_addon_bl_bdt_1_lager_info;
	permanent = FALSE;
	description = "What do you know about the camp?";
};


func int dia_addon_bl_bdt_1_lager_condition()
{
	if((SKLAVEN_FLUCHT == FALSE) || !Npc_IsDead(raven))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager_15_00");	//What do you know about the camp?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_01");	//After it became known that there was a goldmine here, these bums must have raised quite a ruckus.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_02");	//Raven killed the worst of them and threw the rest out of the mine.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager_01_03");	//Since then, no one is allowed in the upper area any more. He's even had prisoners dragged here to dig in the mine.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BL_BDT_1_LAGER2(C_INFO)
{
	nr = 3;
	condition = dia_addon_bl_bdt_1_lager2_condition;
	information = dia_addon_bl_bdt_1_lager2_info;
	permanent = TRUE;
	description = "What do you know about the camp?";
};


func int dia_addon_bl_bdt_1_lager2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_lager2_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Lager2_15_00");	//What do you know about the camp?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_01");	//If you attack anyone, they'll ALL pounce on you.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Lager2_01_02");	//Unless you have a good reason to tangle with someone. Then no one will get involved.
};


instance DIA_ADDON_BL_BDT_1_NEWS(C_INFO)
{
	nr = 4;
	condition = dia_addon_bl_bdt_1_news_condition;
	information = dia_addon_bl_bdt_1_news_info;
	permanent = TRUE;
	description = "Anything new?";
};


func int dia_addon_bl_bdt_1_news_condition()
{
	return TRUE;
};

func void dia_addon_bl_bdt_1_news_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_News_15_00");	//Anything new?
	if(RAVENISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_01");	//Raven is dead. What are we going to do now?
	};
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_02");	//The pirates won't take us back to the mainland because they haven't been paid for the last few transports.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_News_01_03");	//We ought to skewer one or two of them, then the rest would be guaranteed to take us over.
};


instance DIA_ADDON_BL_BDT_1_SKLAVEN(C_INFO)
{
	nr = 5;
	condition = dia_addon_bl_bdt_1_sklaven_condition;
	information = dia_addon_bl_bdt_1_sklaven_info;
	permanent = TRUE;
	description = "What do you know about the prisoners?";
};


func int dia_addon_bl_bdt_1_sklaven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bl_bdt_1_lager) && ((SKLAVEN_FLUCHT == FALSE) || (RAVENISDEAD == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_bl_bdt_1_sklaven_info()
{
	AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_00");	//What do you know about the prisoners?
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_01");	//Raven wants to dig something up. At first he had the bandits doing it, but too many dropped dead.
	AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_02");	//That's why he brought the prisoners - if they snuff it, it doesn't matter.
	if(BDT_1_AUSBUDDELN == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BL_BDT_1_Sklaven_15_03");	//What does Raven want to dig up?
		AI_Output(self,other,"DIA_Addon_BL_BDT_1_Sklaven_01_04");	//No idea, but it sure has to do with more than gold.
		BDT_1_AUSBUDDELN = TRUE;
	};
};

func void b_assignambientinfos_addon_bl_bdt_1(var C_NPC slf)
{
	dia_addon_bl_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_chef.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_news.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_sklaven.npc = Hlp_GetInstanceID(slf);
	dia_addon_bl_bdt_1_lager2.npc = Hlp_GetInstanceID(slf);
};

