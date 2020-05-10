
instance DIA_MIKA_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_exit_condition;
	information = dia_mika_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_mika_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_REFUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 1;
	condition = dia_mika_refuse_condition;
	information = dia_mika_refuse_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_refuse_condition()
{
	if(Npc_IsInState(self,zs_talk) && (lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_mika_refuse_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WOHIN(C_INFO)
{
	npc = mil_337_mika;
	nr = 4;
	condition = dia_mika_wohin_condition;
	information = dia_mika_wohin_info;
	important = TRUE;
};


func int dia_mika_wohin_condition()
{
	if(lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mika_wohin_info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Hey, hey. Not so fast. Strolling about alone out here is dangerous. Where do you come from?
	Info_ClearChoices(dia_mika_wohin);
	Info_AddChoice(dia_mika_wohin,"That's none of your business.",dia_mika_wohin_weg);
	Info_AddChoice(dia_mika_wohin,"From one of the farms.",dia_mika_wohin_bauern);
	Info_AddChoice(dia_mika_wohin,"From the city!",dia_mika_wohin_stadt);
};

func void dia_mika_wohin_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//From the city!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Well, well. Then what are you doing wandering around out here, so far from the protective walls of the city?
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//From one of the farms.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//A farmer, eh? Hmm. Then you shouldn't be walking along these dangerous paths all by yourself. Who knows who might be lying in wait for you.
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//That's none of your business.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//If you say so. But don't go whining about it afterwards if somebody skins you. Have a nice day.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WASGEFAEHRLICH(C_INFO)
{
	npc = mil_337_mika;
	nr = 5;
	condition = dia_mika_wasgefaehrlich_condition;
	information = dia_mika_wasgefaehrlich_info;
	description = "What's so dangerous out here?";
};


func int dia_mika_wasgefaehrlich_condition()
{
	return TRUE;
};

func void dia_mika_wasgefaehrlich_info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//What's so dangerous out here?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Many things.
	if(other.protection[PROT_EDGE] < itar_leather_l.protection[PROT_EDGE])
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//For one thing, there's the bandits. They'd polish off a little wimp like you for breakfast.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//If the bandits don't catch you, then the wild animals in the forest or the mercenaries roaming around will take care of you.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//So, first get yourself some decent armor before you go out.
	};
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//I bet you'll be yelling for my help after the next bend in the road.
};


instance DIA_MIKA_WASKOSTETHILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 6;
	condition = dia_mika_waskostethilfe_condition;
	information = dia_mika_waskostethilfe_info;
	description = "Just assuming I would fall back on your help.";
};


func int dia_mika_waskostethilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_wasgefaehrlich))
	{
		return TRUE;
	};
};

func void dia_mika_waskostethilfe_info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Just assuming I would fall back on your help. How much would that cost me?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//I am merely a humble servant of the king and would not enjoy fleecing a helpless little citizen of the realm.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//But you know, if you put it like that, I wouldn't object to a little financial backing to promote our future business relationship.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//10 gold coins should do for starters. What do you think?
	Info_ClearChoices(dia_mika_waskostethilfe);
	Info_AddChoice(dia_mika_waskostethilfe,"I'll think about it.",dia_mika_waskostethilfe_nochnicht);
	Info_AddChoice(dia_mika_waskostethilfe,"Why not? Here's your 10 coins.",dia_mika_waskostethilfe_ja);
};

func void dia_mika_waskostethilfe_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Why not? Here's your 10 coins.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//Terrific. If you need my help, you know where to find me.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//But please do me a favor, don't come to me with any trifles. I can't stand that, you hear??
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//You haven't got the money. Maybe you should think again whether you really want my help.
	};
	AI_StopProcessInfos(self);
};

func void dia_mika_waskostethilfe_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Suit yourself. Have a nice death.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_UEBERLEGT(C_INFO)
{
	npc = mil_337_mika;
	nr = 7;
	condition = dia_mika_ueberlegt_condition;
	information = dia_mika_ueberlegt_info;
	permanent = TRUE;
	description = "I changed my mind. I'll pay you the 10 gold coins.";
};


func int dia_mika_ueberlegt_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_waskostethilfe) && (MIKA_HELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_ueberlegt_info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//I changed my mind. I'll pay you the 10 gold coins.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Wonderful. Better late than never. And now?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(angry) Come back when you have the money.
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_HILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_hilfe_condition;
	information = dia_mika_hilfe_info;
	permanent = TRUE;
	description = "I need your help.";
};


func int dia_mika_hilfe_condition()
{
	if((MIKA_HELPS == TRUE) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_hilfe_info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//I need your help.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//If it's absolutely necessary... What's wrong?
	Info_ClearChoices(dia_mika_hilfe);
	Info_AddChoice(dia_mika_hilfe,"I'm being chased by bandits.",dia_mika_hilfe_schongut);
	Info_AddChoice(dia_mika_hilfe,"I'm being attacked by monsters.",dia_mika_hilfe_monster);
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && ((AKILS_SLDSTILLTHERE == TRUE) || Npc_KnowsInfo(other,dia_sarah_bauern)))
	{
		Info_AddChoice(dia_mika_hilfe,"The farmer Akil is under attack by mercenaries.",dia_mika_hilfe_akil);
	};
};

func void dia_mika_hilfe_akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//The farmer Akil is under attack by mercenaries.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//(agitated) What? Those riff-raff are hanging around on Akil's farm? Then let's not waste any time. Follow me.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Mika wants to help me solve the mercenary problem on Akil's farm.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void dia_mika_hilfe_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//I'm being attacked by monsters.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//But I don't see any monsters right now. I'm sure you're just making that up.
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//I'm being chased by bandits.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//Really? Where are they then? If you were being chased, I should be able to see at least one of them, right?
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_ZACK(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_zack_condition;
	information = dia_mika_zack_info;
	important = TRUE;
};


func int dia_mika_zack_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && (!Npc_IsDead(alvares) || !Npc_IsDead(engardo)))
	{
		return TRUE;
	};
};

func void dia_mika_zack_info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//Now watch how this works.
	Info_AddChoice(dia_mika_zack,DIALOG_ENDE,dia_mika_zack_los);
};

func void dia_mika_zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(alvares))
	{
		alvares.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(!Npc_IsDead(engardo))
	{
		engardo.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_MIKA_WIEDERNACHHAUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 9;
	condition = dia_mika_wiedernachhause_condition;
	information = dia_mika_wiedernachhause_info;
	important = TRUE;
};


func int dia_mika_wiedernachhause_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_wiedernachhause_info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//All right. That's that. I'll be off then.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MIKA_KAP3_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_kap3_exit_condition;
	information = dia_mika_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_mika_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_KAP3U4U5_PERM(C_INFO)
{
	npc = mil_337_mika;
	nr = 39;
	condition = dia_mika_kap3u4u5_perm_condition;
	information = dia_mika_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "All quiet?";
};


func int dia_mika_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_mika_wohin) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//All quiet?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//You're still alive. I'm impressed.
};


instance DIA_MIKA_PICKPOCKET(C_INFO)
{
	npc = mil_337_mika;
	nr = 900;
	condition = dia_mika_pickpocket_condition;
	information = dia_mika_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mika_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_mika_pickpocket_info()
{
	Info_ClearChoices(dia_mika_pickpocket);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_BACK,dia_mika_pickpocket_back);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_PICKPOCKET,dia_mika_pickpocket_doit);
};

func void dia_mika_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mika_pickpocket);
};

func void dia_mika_pickpocket_back()
{
	Info_ClearChoices(dia_mika_pickpocket);
};

