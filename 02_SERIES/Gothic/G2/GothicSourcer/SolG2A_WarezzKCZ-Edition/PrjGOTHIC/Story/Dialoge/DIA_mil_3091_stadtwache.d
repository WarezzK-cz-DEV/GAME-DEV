
instance DIA_MIL_3091_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_3091_stadtwache;
	nr = 999;
	condition = dia_mil_3091_stadtwache_exit_condition;
	information = dia_mil_3091_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_3091_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_3091_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3091_STADTWACHE_HALLO(C_INFO)
{
	npc = mil_3091_stadtwache;
	nr = 2;
	condition = dia_mil_3091_stadtwache_hallo_condition;
	information = dia_mil_3091_stadtwache_hallo_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_mil_3091_stadtwache_hallo_condition()
{
	return TRUE;
};

func void dia_mil_3091_stadtwache_hallo_info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//What's up?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//All is quiet. We shall keep our eyes peeled.
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Now listen. We can't let you into the city.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//But I'll give you a tip, and it's completely free of charge.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Stay well away from this forest in front of us - it's haunted by ferocious monsters.
		MIL_309_NEWS = 1;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Crawl back under your rock, you lowlife!
	};
	if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Listen - you now have access to the city. But that doesn't mean that you can do whatever you want around here.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//If you don't stick to the rules, you'll lose all your rights here!
		MIL_309_NEWS = 2;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//Move on - go ahead!
	};
	AI_StopProcessInfos(self);
};

