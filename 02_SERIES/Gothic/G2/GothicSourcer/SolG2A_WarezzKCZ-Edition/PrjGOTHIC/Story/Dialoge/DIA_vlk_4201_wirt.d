
instance DIA_WIRT_EXIT(C_INFO)
{
	npc = vlk_4201_wirt;
	nr = 999;
	condition = dia_wirt_exit_condition;
	information = dia_wirt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wirt_exit_condition()
{
	return TRUE;
};

func void dia_wirt_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WIRT_PICKPOCKET(C_INFO)
{
	npc = vlk_4201_wirt;
	nr = 900;
	condition = dia_wirt_pickpocket_condition;
	information = dia_wirt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wirt_pickpocket_condition()
{
	return c_beklauen(60,65);
};

func void dia_wirt_pickpocket_info()
{
	Info_ClearChoices(dia_wirt_pickpocket);
	Info_AddChoice(dia_wirt_pickpocket,DIALOG_BACK,dia_wirt_pickpocket_back);
	Info_AddChoice(dia_wirt_pickpocket,DIALOG_PICKPOCKET,dia_wirt_pickpocket_doit);
};

func void dia_wirt_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wirt_pickpocket);
};

func void dia_wirt_pickpocket_back()
{
	Info_ClearChoices(dia_wirt_pickpocket);
};

func void b_givebeer(var int dailyquantity)
{
	var int wirt_givebeer_day;
	var int beer_count;
	if(Wld_GetDay() != 0)
	{
		if((beer_count < dailyquantity) && (wirt_givebeer_day != Wld_GetDay()))
		{
			b_giveinvitems(self,other,itfo_beer,1);
			beer_count += 1;
		};
		if(beer_count >= dailyquantity)
		{
			wirt_givebeer_day = Wld_GetDay();
			beer_count = 0;
		};
	}
	else
	{
		if((beer_count < dailyquantity) && (wirt_givebeer_day != 999))
		{
			b_giveinvitems(self,other,itfo_beer,1);
			beer_count += 1;
		};
		if(beer_count >= dailyquantity)
		{
			wirt_givebeer_day = 999;
			beer_count = 0;
		};
	};
};


instance DIA_WIRT_HALLO(C_INFO)
{
	npc = vlk_4201_wirt;
	nr = 2;
	condition = dia_wirt_hallo_condition;
	information = dia_wirt_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_wirt_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_wirt_hallo_info()
{
	var int randy;
	randy = Hlp_Random(3);
	AI_Output(self,other,"DIA_Wirt_Hallo_14_00");	//Hey, come closer. Take a break and have a sip of cool beer.
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_01");	//Lord Andre is springing for a few barrels of free beer.
		AI_StopProcessInfos(self);
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_02");	//Nothing hits the spot like a cool pint after work.
		AI_StopProcessInfos(self);
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_03");	//The paladins will set everything right. So take another draught and have a good time.
		b_givebeer(5);
		AI_StopProcessInfos(self);
	}
	else if(randy == 2)
	{
		AI_Output(self,other,"DIA_Wirt_Hallo_14_04");	//You can say what you want about Khorinis, but our 'Dark Paladine' is simply the best in all of Myrtana.
		AI_StopProcessInfos(self);
	};
};

