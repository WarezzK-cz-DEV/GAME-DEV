
instance DIA_GORAX_KAP1_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap1_exit_condition;
	information = dia_gorax_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_gorax_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_PICKPOCKET(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 888;
	condition = dia_gorax_pickpocket_condition;
	information = dia_gorax_pickpocket_info;
	permanent = TRUE;
	description = "(It would be difficult to steal his key)";
};


func int dia_gorax_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_gorax_pickpocket_info()
{
	Info_ClearChoices(dia_gorax_pickpocket);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_BACK,dia_gorax_pickpocket_back);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_PICKPOCKET,dia_gorax_pickpocket_doit);
};

func void dia_gorax_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itke_klosterschatz,1);
		b_giveinvitems(self,other,itke_klosterschatz,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gorax_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gorax_pickpocket_back()
{
	Info_ClearChoices(dia_gorax_pickpocket);
};


instance DIA_GORAX_HELP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_help_condition;
	information = dia_gorax_help_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_help_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gorax_help_info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//Can I be of assistance to you?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "I've brought a heap of gold.";
};


var int dia_gorax_gold_perm;

func int dia_gorax_gold_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_gold_info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//I've brought a heap of gold.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(with anticipation) Ah - you're bringing your offering for Innos. That's good of you, my son.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//I shall use your offering for the best of the monastery as it pleases Innos.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//What have you done with that gold? Did you spend it? Go get it and then come back!
	};
};


instance DIA_ADDON_GORAX_DARONSSTATUE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_addon_gorax_daronsstatue_condition;
	information = dia_addon_gorax_daronsstatue_info;
	permanent = TRUE;
	description = "Here, I've got the statuette that Daron was supposed to take to the monastery.";
};


func int dia_addon_gorax_daronsstatue_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE) && (PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gorax_daronsstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Gorax_DaronsStatue_15_00");	//Here, I've got the statuette that Daron was supposed to bring to the monastery.
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron))
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_01");	//(sighs) It is truly embarrassing that such a valuable piece is brought to us by an aspiring novice.
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_02");	//Nevertheless, this confirms your commitment to serve Innos.
		if(b_giveinvitems(other,self,itmi_lostinnosstatue_daron,1))
		{
			Npc_RemoveInvItems(self,itmi_lostinnosstatue_daron,1);
		};
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_03");	//I am very obliged to you, young novice.
		MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_RETURNEDLOSTINNOSSTATUE_DARON);
		DIA_GORAX_GOLD_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gorax_DaronsStatue_14_04");	//Statuette? I see no statuette. Bring it to me, and I might believe your little story.
	};
};


instance DIA_GORAX_SLEEP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 4;
	condition = dia_gorax_sleep_condition;
	information = dia_gorax_sleep_info;
	description = "I'm looking for a place to sleep.";
};


func int dia_gorax_sleep_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_gorax_sleep_info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//I'm looking for a place to sleep.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//There's an empty bed right next door. The first on the right, next to the entrance. You can sleep there.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//You can store your belongings in one of the unused chests.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//And remember - you have no business entering the sleeping chambers of the magicians. You are also not allowed to enter the library unless you have been given permission.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "Do you have an assignment for me?";
};


func int dia_gorax_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//Do you have an assignment for me?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//You novices have worked hard lately. And those who work a lot shall eat a lot, too.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//I'm giving you the key to the larder. You'll find some mutton sausages there. Distribute them among the novices - but fairly!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//Once you have done that, you can come see me again.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"Master Gorax wants me to share the mutton sausages from the larder out equally among the novices. Apart from me, there are thirteen more novices in the monastery.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "I have distributed the sausages (complete task).";
};


func int dia_gorax_wurst_condition()
{
	if((MIS_GORAXESSEN == LOG_RUNNING) && (Mob_HasItems("WURSTTRUHE",itfo_schafswurst) == 0))
	{
		return TRUE;
	};
};

func void dia_gorax_wurst_info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//I have distributed the sausages.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//And you have done so fairly. Take these spell scrolls of healing - and go back to your work.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//Really? Then you cannot have put much effort into fulfilling your task.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//So, either you ate those sausages yourself, or you gave someone more than his share.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//Listen, since you're new - and for that reason only - I shall let you get away with it. Keep that in mind, novice!
		MIS_GORAXESSEN = LOG_FAILED;
	};
};


instance DIA_GORAX_AUFGABE2(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe2_condition;
	information = dia_gorax_aufgabe2_info;
	permanent = FALSE;
	description = "Do you have another assignment for me?";
};


func int dia_gorax_aufgabe2_condition()
{
	if(((MIS_GORAXESSEN == LOG_SUCCESS) || (MIS_GORAXESSEN == LOG_FAILED)) && (Npc_IsDead(orlan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe2_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//Do you have another assignment for me?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//Yes. As you know, we make an excellent wine here and we sell it, too.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//Orlan, the landlord of the inn 'The Dead Harpy' has ordered a shipment. We've agreed on 240 gold pieces for the bottles.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//Bring him these bottles - but don't let him shortchange you.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"Master Gorax wants me to take Orlan, the barkeeper of the inn, twelve bottles of wine. The price is 240 pieces of gold.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "I went to see Orlan.";
};


var int dia_gorax_orlan_permanent;

func int dia_gorax_orlan_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_wein) && (DIA_GORAX_ORLAN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_orlan_info()
{
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//I went to see Orlan.
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//And, did you get the 240 gold coins?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"He put one over on me! (Give 100 gold)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"I've got the gold. (Give 240 gold)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//What have you done with that gold? Did you spend it? Go get it and then come back!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//He put one over on me!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//You sold it to him cheaper? Oh no, why did I have to send YOU of all people?
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//You really are utterly and completely useless. Now get out of my sight.
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//I've got the gold.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//Excellent. You're really useful. Take this spell scroll of healing as a reward. And now go and find yourself something else to do.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//But you've already spent part of the money, haven't you? You're good for nothing - begone!
		MIS_GORAXWEIN = LOG_FAILED;
		b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	};
	Info_ClearChoices(dia_gorax_orlan);
};


instance DIA_GORAX_JOB(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 35;
	condition = dia_gorax_job_condition;
	information = dia_gorax_job_info;
	permanent = FALSE;
	description = "What's your job here?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//What's your task here?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//My tasks are many and varied. Not only am I the steward, but I am also the treasurer.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//Moreover, I supervise the wine cellar, and I'm in control of the monastery's food supplies.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//So, if there's anything you need, you can always come to me and get it - for a modest contribution, that is.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Master Gorax can supply me with everything I need at the monastery.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "I need a few things...";
};


func int dia_gorax_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorax_job))
	{
		return TRUE;
	};
};

func void dia_gorax_trade_info()
{
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//I need a few things...
	b_givetradeinv(self);
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "I need a new place to sleep.";
};


func int dia_gorax_kdf_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_gorax_kdf_info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//I need a new place to sleep.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//There's a free chamber on the right here. Take the key. You'll find everything you need there.
	b_giveinvitems(self,other,itke_kdfplayer,1);
	Wld_InsertItem(itpo_perm_mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_GORAX_KAP2_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap2_exit_condition;
	information = dia_gorax_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gorax_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP3_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap3_exit_condition;
	information = dia_gorax_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_gorax_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KILLPEDRO(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_killpedro_condition;
	information = dia_gorax_killpedro_info;
	important = TRUE;
};


func int dia_gorax_killpedro_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_gorax_killpedro_info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//Wait, mercenary. I need to talk to you.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//What do you want?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//The monastery is facing a very delicate situation.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//At the moment, everyone seems to mistrust everybody else. And then, this thing with Pedro, that's extremely...(gulps)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//I have an assignment for you from the highest authorities. You are not a member of the Brotherhood of the Fire, and therefore the only one here who can settle this matter for us.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//But I must warn you. If I give you this assignment, you'll be bound to fulfill it, too. Once you know what it's about, you'll have no choice. Do you understand?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"Forget it. That's too risky for me.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"Tell me what you want.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//Forget it. That's too risky for me.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//All right. In that case, forget I said anything.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//Tell me what you want.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//All right. Then listen well, for I'm only going to say this once.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//Serpentes wants you to kill Pedro for his treason as soon as you lay your hands on him.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//You will be paid as soon as this task is fulfilled.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//I never said that. And you haven't heard anything either, understand?
	b_logentry(TOPIC_TRAITORPEDRO,"Gorax told me that Serpentes wants me to kill the traitor Pedro if I come across him.");
	b_giveplayerxp(XP_GORAX_KILLPEDRO_GOTMISSION);
	MIS_GORAX_KILLPEDRO = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP4_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap4_exit_condition;
	information = dia_gorax_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gorax_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP5_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap5_exit_condition;
	information = dia_gorax_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gorax_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};

