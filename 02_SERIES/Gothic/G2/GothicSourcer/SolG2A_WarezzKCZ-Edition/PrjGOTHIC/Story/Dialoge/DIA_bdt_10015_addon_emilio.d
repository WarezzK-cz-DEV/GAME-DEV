
instance DIA_ADDON_EMILIO_EXIT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 999;
	condition = dia_addon_emilio_exit_condition;
	information = dia_addon_emilio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_emilio_exit_condition()
{
	return TRUE;
};

func void dia_addon_emilio_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EMILIO_PICKPOCKET(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 900;
	condition = dia_addon_emilio_pickpocket_condition;
	information = dia_addon_emilio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_emilio_pickpocket_condition()
{
	return c_beklauen(76,112);
};

func void dia_addon_emilio_pickpocket_info()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_BACK,dia_addon_emilio_pickpocket_back);
	Info_AddChoice(dia_addon_emilio_pickpocket,DIALOG_PICKPOCKET,dia_addon_emilio_pickpocket_doit);
};

func void dia_addon_emilio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};

func void dia_addon_emilio_pickpocket_back()
{
	Info_ClearChoices(dia_addon_emilio_pickpocket);
};


instance DIA_ADDON_BDT_10015_EMILIO_HI(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_hi_condition;
	information = dia_addon_emilio_hi_info;
	permanent = FALSE;
	description = "You look like a digger.";
};


func int dia_addon_emilio_hi_condition()
{
	return TRUE;
};

func void dia_addon_emilio_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Hi_15_00");	//You look like a digger.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Hi_10_01");	//I AM a digger. The last time I was in the mine, I worked my ass off.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_BDT_10015_EMILIO_GOLD(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 2;
	condition = dia_addon_emilio_gold_condition;
	information = dia_addon_emilio_gold_info;
	permanent = FALSE;
	description = "What happens to the gold from the mine?";
};


func int dia_addon_emilio_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gold_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Gold_15_00");	//What happens to the gold from the mine?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_01");	//Thorus collects it and then distributes it. No one is allowed to keep what he mines.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_02");	//Everybody gets only a part of the gold - that way even the hunters and guards get their share.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Gold_10_03");	//I think that's okay. Since we've had that rule, there have been fewer deaths, and the miners still get more than the guys who hang around outside.
};


instance DIA_ADDON_BDT_10015_EMILIO_STEIN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 3;
	condition = dia_addon_emilio_stein_condition;
	information = dia_addon_emilio_stein_info;
	permanent = FALSE;
	description = "What's the deal with these red stones?";
};


func int dia_addon_emilio_stein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Stein_15_00");	//What's the deal with these red stones?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_01");	//That's something Thorus and Esteban thought up.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_02");	//Thorus takes care of the gold distribution and Esteban organizes the workers for the mine.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_03");	//Of course, he doesn't want to run to Thorus every time he sends someone to the mine.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Stein_10_04");	//That's why he gives us one of these red stone tablets and Thorus lets us in then. It's like a pass.
};


var int emilio_switch;

instance DIA_ADDON_EMILIO_ATTENTAT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 4;
	condition = dia_addon_emilio_attentat_condition;
	information = dia_addon_emilio_attentat_info;
	permanent = TRUE;
	description = "What do you know about the attack?";
};


func int dia_addon_emilio_attentat_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return FALSE;
	}
	else if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func void dia_addon_emilio_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Attentat_15_00");	//What do you know about the attack?
	if(EMILIO_SWITCH == 0)
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_01");	//(scared) Hey, man, I didn't have anything to do with it!
		EMILIO_SWITCH = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Emilio_Attentat_10_02");	//(scared) NOTHING AT ALL!
		EMILIO_SWITCH = 0;
	};
};


instance DIA_ADDON_BDT_10015_EMILIO_SENYAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 1;
	condition = dia_addon_emilio_senyan_condition;
	information = dia_addon_emilio_senyan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_emilio_senyan_condition()
{
	if(Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_senyan_info()
{
	if(SENYAN_CALLED == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_00");	//(searchingly) Tell me, WHY did Senyan yell, 'Look who we have here'?
		AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_01");	//(drily) Unpaid debts.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_02");	//You killed Senyan!
	};
	AI_Output(other,self,"DIA_Addon_BDT_10015_Emilio_Senyan_15_03");	//Do you have a problem with that?
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_04");	//(hastily) No, man, I don't have a problem with it.
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Senyan_10_05");	//Quite the opposite. (snidely) The bastard worked for Esteban.
	SENYAN_CONTRA = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio is not on Esteban's side.");
};


instance DIA_ADDON_EMILIO_JETZT(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 5;
	condition = dia_addon_emilio_jetzt_condition;
	information = dia_addon_emilio_jetzt_info;
	permanent = FALSE;
	description = "Why aren't you in the mine now?";
};


func int dia_addon_emilio_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_hi))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_Jetzt_15_00");	//Why aren't you in the mine now?
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_01");	//(somewhat unsure) I was in the mine long enough and slaved away until I was about to fall over. Now I need a few days' rest.
	AI_Output(self,other,"DIA_Addon_Emilio_Jetzt_10_02");	//(sighs, somewhat unsure) Before I get my next red stone.
};


instance DIA_ADDON_EMILIO_VONEMILIO(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 6;
	condition = dia_addon_emilio_vonemilio_condition;
	information = dia_addon_emilio_vonemilio_info;
	permanent = FALSE;
	description = "Lennar told me a bit about you...";
};


func int dia_addon_emilio_vonemilio_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_jetzt) && Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_vonemilio_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_00");	//Lennar told me a bit about you...
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_01");	//Lennar? That guy's an idiot. You must have noticed.
	AI_Output(other,self,"DIA_Addon_Emilio_VonEmilio_15_02");	//He said you haven't been in the mine since the attack happened.
	AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_03");	//(intimidated) I... don't know anything!
	if(!Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_04");	//You are working together with that Senyan!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_05");	//You're both in cahoots with Esteban! I heard exactly what you were blabbing about!
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_06");	//Up to now Esteban hasn't given a damn about us. Why should I trust his people.
		AI_Output(self,other,"DIA_Addon_Emilio_VonEmilio_10_07");	//Leave me alone!
		AI_StopProcessInfos(self);
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio thinks that Lennar is an idiot.");
};


instance DIA_ADDON_EMILIO_HILFMIR(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 7;
	condition = dia_addon_emilio_hilfmir_condition;
	information = dia_addon_emilio_hilfmir_info;
	permanent = FALSE;
	description = "Help me find out who was behind the attack!";
};


func int dia_addon_emilio_hilfmir_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_emilio_vonemilio) && Npc_IsDead(senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hilfmir_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_00");	//Help me find out who was behind the attack!
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_01");	//No! I don't want anything to do with it!
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_02");	//If an idiot like Lennar notices that you're behaving oddly, it won't take long before Esteban finds out, too.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_03");	//(squirming) I... shit! I'll tell you one name. Nothing more.
	AI_Output(other,self,"DIA_Addon_Emilio_HilfMir_15_04");	//I'm listening.
	AI_Output(self,other,"DIA_Addon_Emilio_HilfMir_10_05");	//Huno... go to Huno. He must know something about this business.
	EMILIO_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Emilio has finally coughed up a name: Huno.");
};


instance DIA_ADDON_EMILIO_GEGENESTEBAN(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 8;
	condition = dia_addon_emilio_gegenesteban_condition;
	information = dia_addon_emilio_gegenesteban_info;
	permanent = FALSE;
	description = "What do you have against Esteban?";
};


func int dia_addon_emilio_gegenesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10015_emilio_senyan))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_gegenesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Emilio_GegenEsteban_15_00");	//What do you have against Esteban?
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_01");	//All that swine thinks about is money.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_02");	//Every few days one of us gets eaten by a crawler.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_03");	//But Esteban just won't send any fighters into the mine.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_04");	//And why? Those guys belong to 'Raven's bodyguards' and Esteban is scared shitless to tell them.
	AI_Output(self,other,"DIA_Addon_Emilio_GegenEsteban_10_05");	//He'd rather let us get killed!
};


instance DIA_ADDON_BDT_10015_EMILIO_MINE(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_mine_condition;
	information = dia_addon_emilio_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_emilio_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_emilio_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10015_Emilio_Mine_10_00");	//So now you're the boss here. Okay, then I'll get going.
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_EMILIO_HACKER(C_INFO)
{
	npc = bdt_10015_addon_emilio;
	nr = 9;
	condition = dia_addon_emilio_hacker_condition;
	information = dia_addon_emilio_hacker_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_addon_emilio_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_emilio_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Emilio_Hacker_15_00");	//What's up?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Emilio_Hacker_10_01");	//I'm really slaving away. Well, the main thing is, I won't get eaten by a crawler.
};

