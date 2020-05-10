
instance DIA_ADDON_LOGAN_EXIT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 999;
	condition = dia_addon_logan_exit_condition;
	information = dia_addon_logan_exit_info;
	permanent = TRUE;
	description = "I'll come back later...";
};


func int dia_addon_logan_exit_condition()
{
	return TRUE;
};

func void dia_addon_logan_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_EXIT_15_00");	//I'll come back later...
	if(((!MIS_HLPLOGAN == LOG_RUNNING) || (!MIS_HLPLOGAN == LOG_SUCCESS)) && (LOGAN_INSIDE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Logan_EXIT_10_01");	//(growls) Yeeaah, you just run away. I'll stay here and stop everything that gets too close.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LOGAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 900;
	condition = dia_addon_logan_pickpocket_condition;
	information = dia_addon_logan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_logan_pickpocket_condition()
{
	return c_beklauen(59,50);
};

func void dia_addon_logan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_BACK,dia_addon_logan_pickpocket_back);
	Info_AddChoice(dia_addon_logan_pickpocket,DIALOG_PICKPOCKET,dia_addon_logan_pickpocket_doit);
};

func void dia_addon_logan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_logan_pickpocket);
};

func void dia_addon_logan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_logan_pickpocket);
};


instance DIA_ADDON_BDT_1072_LOGAN_MINE(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_mine_condition;
	information = dia_addon_logan_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_logan_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_1072_Logan_Mine_10_00");	//So you did it, hm? Okay, good thing you didn't leave me hanging.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LOGAN_HOW2(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_how2_condition;
	information = dia_addon_logan_how2_info;
	permanent = FALSE;
	description = "How's it going with you?";
};


func int dia_addon_logan_how2_condition()
{
	if((LOGAN_INSIDE == TRUE) && (Npc_GetDistToWP(self,"BL_INN_CORNER_02") <= 1000))
	{
		return TRUE;
	};
};

func void dia_addon_logan_how2_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_00");	//How's it going with you?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_01");	//Well, at least I'm in now. Lucia brews some wicked liquor.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_02");	//But Esteban won't let me into the mine. At any rate, not yet. He's given me another job.
	AI_Output(other,self,"DIA_Addon_Logan_How2_15_03");	//And? What does he want from you?
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_04");	//There was an attempt on Esteban's life. He wants to know who's behind it.
	AI_Output(self,other,"DIA_Addon_Logan_How2_10_05");	//(quietly) Esteban thinks that Snaf is involved. I'm supposed to keep an eye on him...
};


instance DIA_ADDON_LOGAN_ATTENTAT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_attentat_condition;
	information = dia_addon_logan_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_logan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && (LOGAN_INSIDE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_00");	//You're looking for the guy who's behind it, huh?
	AI_Output(self,other,"DIA_Addon_Logan_Attentat_10_01");	//But I don't know anything about it. How could I? I was still in the swamp then...
};


instance DIA_ADDON_LOGAN_HI(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_hi_condition;
	information = dia_addon_logan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_hi_condition()
{
	if((LOGAN_INSIDE == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_logan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_00");	//Look, a new face.
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_01");	//Are you just going to stand around here, or have you come to help me?
	if(Npc_KnowsInfo(other,dia_addon_franco_hi))
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_02");	//Franco sent me. He says you could use some help. So, what's up?
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Logan_HI_15_03");	//It depends - what do you need help with?
	};
	AI_Output(self,other,"DIA_Addon_Logan_HI_10_04");	//The swampsharks are coming a little too close for me - high time to finish off a few of them.
	Log_CreateTopic(TOPIC_ADDON_LOGAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LOGAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LOGAN,"Logan wants me to hunt swamp sharks with him.");
};


instance DIA_ADDON_LOGAN_WHY(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_why_condition;
	information = dia_addon_logan_why_info;
	permanent = FALSE;
	description = "What do I get for my help?";
};


func int dia_addon_logan_why_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_why_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Why_15_00");	//What do I get for my help?
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_01");	//(growls) Franco will let you rot here if you don't do it.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_02");	//If you want to get into the camp, you'll have to lend a hand. You won't get any farther here with just words.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_03");	//Besides, I can show you how to gut the beasts.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_04");	//But don't think Franco will send you straight into the camp just because we've had a little fun with the swampsharks here.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_05");	//There are people out here who have been waiting a long time to get in.
	AI_Output(self,other,"DIA_Addon_Logan_Why_10_06");	//And the next one who gets in is me...(growls)... it had better be...
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Logan can teach me to get pelts, claws and teeth.");
};


instance DIA_ADDON_LOGAN_LAGER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_lager_condition;
	information = dia_addon_logan_lager_info;
	permanent = FALSE;
	description = "What's in the camp, then?";
};


func int dia_addon_logan_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why) && (LOGAN_INSIDE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lager_15_00");	//What's in the camp, then?
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_01");	//(growls) The question is what ISN'T in the camp. There are no swampsharks, no swamp holes... no SWAMP at all.
	AI_Output(self,other,"DIA_Addon_Logan_Lager_10_02");	//Instead, they have booze and gold. As far as I know, they even have a woman. Got it?
};


instance DIA_ADDON_LOGAN_MIS(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 99;
	condition = dia_addon_logan_mis_condition;
	information = dia_addon_logan_mis_info;
	permanent = FALSE;
	description = "Let's attack the swampsharks.";
};


func int dia_addon_logan_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_logan_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_00");	//Let's attack the swampsharks.
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_01");	//(growls) You've figured out how to get ahead here. I'm pleased. Psst... do you hear that? Yeeaah, I hear them.
	AI_Output(other,self,"DIA_Addon_Logan_MIS_15_02");	//I see - and what do we do now?
	AI_Output(self,other,"DIA_Addon_Logan_MIS_10_03");	//They're coming. They've got an appetite for a bite of human flesh. Well, we'll see WHO gets eaten here... Let's go.
	Snd_Play("SWA_Warn");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"JAGD");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HLPLOGAN = LOG_RUNNING;
	Wld_InsertNpc(mis_addon_swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc(mis_addon_swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc(mis_addon_swampshark_03,"ADW_BANDIT_VP3_06");
};


instance DIA_ADDON_LOGAN_TOT(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 2;
	condition = dia_addon_logan_tot_condition;
	information = dia_addon_logan_tot_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_logan_tot_condition()
{
	if(Npc_IsDead(mis_addon_swampshark_01) && Npc_IsDead(mis_addon_swampshark_02) && Npc_IsDead(mis_addon_swampshark_03) && Npc_KnowsInfo(other,dia_addon_logan_mis))
	{
		return TRUE;
	};
};

func void dia_addon_logan_tot_info()
{
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_00");	//The only good swampshark is a dead swampshark. That will be a warning to their brothers!
	AI_Output(other,self,"DIA_Addon_Logan_tot_15_01");	//All right, is there anything else to do? Otherwise, I'll take off...
	AI_Output(self,other,"DIA_Addon_Logan_tot_10_02");	//Do that. If you want to learn anything else - you know where to find me.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HLPLOGAN = LOG_SUCCESS;
	b_checklog();
	b_logentry(TOPIC_ADDON_FRANCO,"I have helped Logan. We'll see what Franco says about that.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_LOGAN_LERN(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 100;
	condition = dia_addon_logan_lern_condition;
	information = dia_addon_logan_lern_info;
	permanent = FALSE;
	description = "Show me how to gut animals...";
};


func int dia_addon_logan_lern_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_why))
	{
		return TRUE;
	};
};

func void dia_addon_logan_lern_info()
{
	AI_Output(other,self,"DIA_Addon_Logan_Lern_15_00");	//Show me how to gut animals...
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_01");	//If you want to learn something about bloodflies, go to Edgor. He knows all about them.
	AI_Output(self,other,"DIA_Addon_Logan_Lern_10_02");	//And if you want to gut swampsharks or lizards, you have to know how to remove skins and teeth. I can show you that.
};


instance DIA_ADDON_LOGAN_ALLG(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 3;
	condition = dia_addon_logan_allg_condition;
	information = dia_addon_logan_allg_info;
	permanent = TRUE;
	description = "I want to learn...";
};


func int dia_addon_logan_allg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_logan_lern) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_logan_allg_info()
{
	Info_ClearChoices(dia_addon_logan_allg);
	Info_AddChoice(dia_addon_logan_allg,DIALOG_BACK,dia_addon_logan_allg_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Remove teeth",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_logan_allg_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Remove claws",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_addon_logan_allg_claws);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
	{
		Info_AddChoice(dia_addon_logan_allg,b_buildlearnstring("Skin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_addon_logan_allg_fur);
	};
};

func void dia_addon_logan_allg_back()
{
	Info_ClearChoices(dia_addon_logan_allg);
};

func void dia_addon_logan_allg_teeth()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
};

func void dia_addon_logan_allg_claws()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS);
};

func void dia_addon_logan_allg_fur()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR);
};


var int logan_lohn;

instance DIA_ADDON_LOGAN_HACKER(C_INFO)
{
	npc = bdt_1072_addon_logan;
	nr = 9;
	condition = dia_addon_logan_hacker_condition;
	information = dia_addon_logan_hacker_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_logan_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_logan_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Logan_Hacker_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_01");	//Hey, thanks to you, I did it. I'm in the mine!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_02");	//I may not know much about digging for gold, but that will come.
	if(LOGAN_LOHN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10004_Logan_Hacker_10_03");	//I've learned the most important thing. Legs firmly on the ground and always strike solidly!
		b_upgrade_hero_hackchance(10);
		LOGAN_LOHN = TRUE;
	};
};

