
instance DIA_ADDON_JUAN_EXIT(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 999;
	condition = dia_addon_juan_exit_condition;
	information = dia_addon_juan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_juan_exit_condition()
{
	return TRUE;
};

func void dia_addon_juan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_JUAN_PICKPOCKET(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 900;
	condition = dia_addon_juan_pickpocket_condition;
	information = dia_addon_juan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_juan_pickpocket_condition()
{
	return c_beklauen(65,73);
};

func void dia_addon_juan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_juan_pickpocket);
	Info_AddChoice(dia_addon_juan_pickpocket,DIALOG_BACK,dia_addon_juan_pickpocket_back);
	Info_AddChoice(dia_addon_juan_pickpocket,DIALOG_PICKPOCKET,dia_addon_juan_pickpocket_doit);
};

func void dia_addon_juan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_juan_pickpocket);
};

func void dia_addon_juan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_juan_pickpocket);
};


instance DIA_ADDON_JUAN_HI(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_hi_condition;
	information = dia_addon_juan_hi_info;
	permanent = FALSE;
	description = "How's it going?";
};


func int dia_addon_juan_hi_condition()
{
	return TRUE;
};

func void dia_addon_juan_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_HI_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Juan_HI_13_01");	//What do you want? Have you got anything to say to me? If not, you can just go away.
	if(!Npc_IsDead(freund))
	{
		AI_Output(self,other,"DIA_Addon_Juan_HI_13_02");	//Otherwise my friend will make mincemeat of you. So what is it?
		b_startotherroutine(freund,"STAND");
	};
};


instance DIA_ADDON_JUAN_LOSUNG(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_losung_condition;
	information = dia_addon_juan_losung_info;
	permanent = FALSE;
	description = "They say you have some interesting wares to offer...";
};


func int dia_addon_juan_losung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_hi) && ((TOM_TELLS == TRUE) || (MIS_HUNO_STAHL == LOG_RUNNING)))
	{
		return TRUE;
	};
};

func void dia_addon_juan_losung_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_00");	//They say you have some interesting wares to offer...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_01");	//So what. Esteban wants to jerk me around, eh? I do all the work and hide away here for days in this miserable hole...
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_02");	//... and he just sends someone to fetch the stuff? I'm not a warehouse!
	AI_Output(other,self,"DIA_Addon_Juan_Losung_15_03");	//Yeah, and? That isn't my problem.
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_04");	//But I'm MAKING it your problem. You want the delivery - fine, you can pay for it!
	AI_Output(self,other,"DIA_Addon_Juan_Losung_13_05");	//Get the gold from Esteban or Raven or I don't know where. I don't care. Whoever wants these goods will pay for them!
};


instance DIA_ADDON_JUAN_AUFSMAUL(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 2;
	condition = dia_addon_juan_aufsmaul_condition;
	information = dia_addon_juan_aufsmaul_info;
	permanent = FALSE;
	description = "I don't come from Esteban!";
};


func int dia_addon_juan_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_losung))
	{
		return TRUE;
	};
};

func void dia_addon_juan_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Juan_AufsMaul_15_00");	//I don't come from Esteban!
	AI_Output(self,other,"DIA_Addon_Juan_AufsMaul_13_01");	//Oh? Well then... eh... Just a moment! Hold still for a bit, you have a critter on your shoulder.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_JUAN_TRADE(C_INFO)
{
	npc = bdt_10017_addon_juan;
	nr = 99;
	condition = dia_addon_juan_trade_condition;
	information = dia_addon_juan_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V3;
};


func int dia_addon_juan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_juan_losung))
	{
		return TRUE;
	};
};

func void dia_addon_juan_trade_info()
{
	b_say(other,self,"$TRADE_3");
	b_clearsmithinv(self);
	b_givetradeinv(self);
};

