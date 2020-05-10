
instance DIA_ADDON_PAUL_EXIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 999;
	condition = dia_addon_paul_exit_condition;
	information = dia_addon_paul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_paul_exit_condition()
{
	return TRUE;
};

func void dia_addon_paul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_PICKPOCKET(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 900;
	condition = dia_addon_paul_pickpocket_condition;
	information = dia_addon_paul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_paul_pickpocket_condition()
{
	return c_beklauen(22,19);
};

func void dia_addon_paul_pickpocket_info()
{
	Info_ClearChoices(dia_addon_paul_pickpocket);
	Info_AddChoice(dia_addon_paul_pickpocket,DIALOG_BACK,dia_addon_paul_pickpocket_back);
	Info_AddChoice(dia_addon_paul_pickpocket,DIALOG_PICKPOCKET,dia_addon_paul_pickpocket_doit);
};

func void dia_addon_paul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_paul_pickpocket);
};

func void dia_addon_paul_pickpocket_back()
{
	Info_ClearChoices(dia_addon_paul_pickpocket);
};


instance DIA_ADDON_PAUL_HI(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 1;
	condition = dia_addon_paul_hi_condition;
	information = dia_addon_paul_hi_info;
	permanent = FALSE;
	description = "Do you deal in smithy equipment?";
};


func int dia_addon_paul_hi_condition()
{
	return TRUE;
};

func void dia_addon_paul_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Hi_15_00");	//Do you deal in smithy equipment?
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_01");	//Huno has steel. I only have a few lumps of ore.
	AI_Output(self,other,"DIA_Addon_Paul_Hi_03_02");	//But I won't give that up. It's the only thing I have of value.
};


instance DIA_ADDON_PAUL_HUNO(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_huno_condition;
	information = dia_addon_paul_huno_info;
	permanent = FALSE;
	description = "Do you work for Huno?";
};


func int dia_addon_paul_huno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_hi))
	{
		return TRUE;
	};
};

func void dia_addon_paul_huno_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_Huno_15_00");	//Do you work for Huno?
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_01");	//I wanted to make a bit of gold and took up with Huno. But since then, Esteban hasn't given me anything at all.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_02");	//He said he can't use me any more.
	AI_Output(self,other,"DIA_Addon_Paul_Huno_03_03");	//What else can I do but continue to slave away for Huno?
};


instance DIA_ADDON_PAUL_ATTENTAT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 3;
	condition = dia_addon_paul_attentat_condition;
	information = dia_addon_paul_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_paul_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_paul_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Paul_Attentat_03_00");	//Nothing, man! I didn't have anything to do with it! What do you want from me?
};


instance DIA_ADDON_PAUL_HUNOVERDACHT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 4;
	condition = dia_addon_paul_hunoverdacht_condition;
	information = dia_addon_paul_hunoverdacht_info;
	permanent = FALSE;
	description = "Huno is suspected of having something to do with the attack...";
};


func int dia_addon_paul_hunoverdacht_condition()
{
	if(((FINN_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_hunoverdacht_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoVerdacht_15_00");	//Huno is suspected of having something to do with the attack...
	AI_Output(self,other,"DIA_Addon_Paul_HunoVerdacht_03_01");	//I don't know anything about it!
};


instance DIA_ADDON_PAUL_HUNOARBEIT(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_hunoarbeit_condition;
	information = dia_addon_paul_hunoarbeit_info;
	permanent = FALSE;
	description = "But you work for Huno! So you do know something!";
};


func int dia_addon_paul_hunoarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_huno) && Npc_KnowsInfo(other,dia_addon_paul_hunoverdacht) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_hunoarbeit_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_HunoArbeit_15_00");	//But you work for Huno! So you do know something!
	AI_Output(self,other,"DIA_Addon_Paul_HunoArbeit_03_01");	//(despairingly) I know nothing - honest! I have to go now!
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_FEARESTEBAN(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_fearesteban_condition;
	information = dia_addon_paul_fearesteban_info;
	permanent = FALSE;
	description = "Do you know what Esteban will do to you when he finds out you're covering for Huno?";
};


func int dia_addon_paul_fearesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_hunoarbeit) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_fearesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_FearEsteban_15_00");	//Do you know what Esteban will do to you when he finds out you're covering for Huno?
	AI_Output(self,other,"DIA_Addon_Paul_FearEsteban_03_01");	//Man! Leave me alone. I don't have anything to do with that business.
	Npc_ExchangeRoutine(self,"PRESTART");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PAUL_MAULPAUL(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 5;
	condition = dia_addon_paul_maulpaul_condition;
	information = dia_addon_paul_maulpaul_info;
	permanent = FALSE;
	description = "Tell me what you know, right now!";
};


func int dia_addon_paul_maulpaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_fearesteban) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_paul_maulpaul_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_00");	//(friendly) Tell me what you know now or I'll slam you into the wall, Paul!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_01");	//You can't rough me up just because you work for the boss.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_02");	//(nicely) I can!
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_03");	//Cut the crap!
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_04");	//(impatient) Paul...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_05");	//(hectically) All I know is that Huno has a bone to pick with Esteban.
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_06");	//(hectically) He's constantly going on at me about that Esteban. That he screwed up business for him and so on...
	AI_Output(self,other,"DIA_Addon_Paul_MaulPaul_03_07");	//I only listened and never said anything.
	AI_Output(other,self,"DIA_Addon_Paul_MaulPaul_15_08");	//Exactly! You see. That wasn't so bad.
	Npc_ExchangeRoutine(self,"START");
	PAUL_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Paul says that Huno hates Esteban because he is ruining his business.");
};


instance DIA_ADDON_BDT_1070_PAUL_MINE(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 2;
	condition = dia_addon_paul_mine_condition;
	information = dia_addon_paul_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_paul_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_paul_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1070_Paul_Mine_03_00");	//Finally! Here, I want you to have my ore for that.
	b_giveinvitems(self,other,itmi_nugget,2);
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_PAUL_PERM(C_INFO)
{
	npc = bdt_1070_addon_paul;
	nr = 99;
	condition = dia_addon_paul_perm_condition;
	information = dia_addon_paul_perm_info;
	permanent = TRUE;
	description = "Everything else all right with you?";
};


func int dia_addon_paul_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_paul_huno))
	{
		return TRUE;
	};
};

func void dia_addon_paul_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Paul_PERM_15_00");	//Everything else all right with you?
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_01");	//Yes, I'll get a heap of gold out of this rock!
	}
	else if((PAUL_TELLALL == TRUE) && (HUNO_ZUSNAF == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_02");	//I told you everything I know!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Paul_PERM_03_03");	//I just want to do my job, man!
	};
};

