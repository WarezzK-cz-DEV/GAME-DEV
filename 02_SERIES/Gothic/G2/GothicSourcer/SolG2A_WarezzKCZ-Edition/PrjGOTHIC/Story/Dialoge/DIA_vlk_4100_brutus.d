
instance DIA_BRUTUS_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_exit_condition;
	information = dia_brutus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brutus_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_AFTER_FIGHT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 1;
	condition = dia_brutus_after_fight_condition;
	information = dia_brutus_after_fight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_brutus_after_fight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && Npc_IsInState(self,zs_talk) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_after_fight_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//So, still got all your teeth?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//Man, you're a tough one! I wouldn't want to face you in battle.
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//I think you broke every single one of my ribs.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//And I didn't even hit you all that hard. Oh well, never mind, I like a guy who can take a few blows in stride.
		if(BRUTUS_EINMALIG == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//This here potion will help you get back on your feet. It also works wonders for your bowels!
			CreateInvItems(self,itpo_health_01,1);
			b_giveinvitems(self,hero,itpo_health_01,1);
			BRUTUS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//I have nothing against a good fight. But when I start a fight, I end it, too.
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_BRUTUS_PRISONER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_prisoner_condition;
	information = dia_brutus_prisoner_info;
	description = "What's your job here?";
};


func int dia_brutus_prisoner_condition()
{
	if((KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_prisoner_info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//What's your task here?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//My job? I'm training the lads. I teach them how to get muscles of steel.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//I also take care of the prisoners. I'm like a damn father to those bastards.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//But my real art is to get them to talk. And believe me - I have ways to make anyone talk.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//Sounds awfully nice...
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//But those flea-infested blockheads we have currently locked up don't have much to say anyway.
	if(MIS_RESCUEGORN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//And they won't let me deal with that Gorn.
		KNOWSABOUTGORN = TRUE;
	};
};


instance DIA_BRUTUS_PERM(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 90;
	condition = dia_brutus_perm_condition;
	information = dia_brutus_perm_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_brutus_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm_info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//Anything new?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//Everything seems quiet. No new prisoners - nobody who needs help finding the right words - too bad.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KASSE(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_kasse_condition;
	information = dia_brutus_kasse_info;
	permanent = FALSE;
	description = "Could you train me?";
};


func int dia_brutus_kasse_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_kasse_info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//Could you train me?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//Sure I can help you become stronger, but I don't give away anything for free.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//How much do you want?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//Hmm... you run around outside of the castle, don't you? Here's what I suggest.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//My assistant, Den, made himself scarce during the last attack. What a quitter.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//But he didn't run for it empty-handed. He took the contents of our cash-box with him.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//What cash-box?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//We have this chest where we keep the stuff that we have... er... collected over the course of time.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//And that was a tidy sum. The chest contained 200 gold pieces, along with some precious jewelry.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//If you bring me back the gold, you can keep the jewels, and I'll train you.
	Log_CreateTopic(TOPICBRUTUSKASSE,LOG_MISSION);
	Log_SetTopicStatus(TOPICBRUTUSKASSE,LOG_RUNNING);
	b_logentry(TOPICBRUTUSKASSE,"Brutus' partner Den made off with 200 in gold and some jewelry. If I bring him 200 pieces of gold, he'll help me become stronger.");
};


instance DIA_BRUTUS_DEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_den_condition;
	information = dia_brutus_den_info;
	permanent = FALSE;
	description = "Do you know where Den was headed?";
};


func int dia_brutus_den_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_den_info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//Do you know where Den was headed?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//As far away from here as possible. I guess he may have tried to get through to the pass.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//Thanks, that's very helpful.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//Well, what can I say? I have no idea where he went.
	b_logentry(TOPICBRUTUSKASSE,"Den wanted to try and cross the pass.");
};


instance DIA_BRUTUS_GOLD(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_gold_condition;
	information = dia_brutus_gold_info;
	permanent = TRUE;
	description = "I've got something for you (give 200 gold).";
};


func int dia_brutus_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (BRUTUS_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_gold_info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//I've got something for you.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//Excellent. I can train you if you like.
		BRUTUS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"Brutus can help me to become stronger.");
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//Listen, just bring me 200 gold pieces. I don't care where you get them - just as long as it's gold.
	};
};


instance DIA_BRUTUS_TEACH(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 7;
	condition = dia_brutus_teach_condition;
	information = dia_brutus_teach_info;
	permanent = TRUE;
	description = "I want to become stronger.";
};


func int dia_brutus_teach_condition()
{
	if((BRUTUS_TEACHSTR == TRUE) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_teach_info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//I want to become stronger.
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_back()
{
	Info_ClearChoices(dia_brutus_teach);
};

func void dia_brutus_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_brutus_teach_str_5);
};


instance DIA_BRUTUS_KAP3_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap3_exit_condition;
	information = dia_brutus_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brutus_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_DUSCHONWIEDER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 30;
	condition = dia_brutus_duschonwieder_condition;
	information = dia_brutus_duschonwieder_info;
	permanent = TRUE;
	description = "Tortured anyone today?";
};


func int dia_brutus_duschonwieder_condition()
{
	if((KAPITEL == 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_duschonwieder_info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//Tortured anyone today?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//Can't you see I'm busy? Come back later.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KAP4_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap4_exit_condition;
	information = dia_brutus_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brutus_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_WARUMNICHTARBBEIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 40;
	condition = dia_brutus_warumnichtarbbeit_condition;
	information = dia_brutus_warumnichtarbbeit_info;
	description = "Why aren't you at work?";
};


func int dia_brutus_warumnichtarbbeit_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_warumnichtarbbeit_info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//Why aren't you at work?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(distraught) But that's disgusting!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//Have you had a look in my chamber? Those filthy meatbugs are everywhere.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//I have no idea who set up quarters in there before, but I'm certainly not going back into that filthy sty.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//I hate those beasts. And stop grinning like an idiot.
	Log_CreateTopic(TOPIC_BRUTUSMEATBUGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRUTUSMEATBUGS,LOG_RUNNING);
	b_logentry(TOPIC_BRUTUSMEATBUGS,"Brutus, the torturer in the castle, says the harmless meatbugs in his torture chamber give him the creeps. He's a real tough guy.");
};


instance DIA_BRUTUS_MEATBUGSWEG(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 31;
	condition = dia_brutus_meatbugsweg_condition;
	information = dia_brutus_meatbugsweg_info;
	description = "The meatbugs are gone.";
};


func int dia_brutus_meatbugsweg_condition()
{
	if(Npc_KnowsInfo(other,dia_brutus_warumnichtarbbeit) && Npc_IsDead(meatbug_brutus1) && Npc_IsDead(meatbug_brutus2) && Npc_IsDead(meatbug_brutus3) && Npc_IsDead(meatbug_brutus4) && (KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_meatbugsweg_info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//The meatbugs are gone. You can go back to polishing your thumbscrews, or whatever.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//Are you really sure that not one of those monsters is left?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//Pretty sure.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//All right, then. Here, take this gold as a token of my gratitude.
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//Aw, don't make me cry.
	TOPIC_END_BRUTUSMEATBUGS = TRUE;
	b_giveplayerxp(XP_BRUTUSMEATBUGS);
	b_npcclearobsessionbydmt(self);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRUTUS_PERM4(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 32;
	condition = dia_brutus_perm4_condition;
	information = dia_brutus_perm4_info;
	permanent = TRUE;
	description = "Are you crazy?";
};


func int dia_brutus_perm4_condition()
{
	if((Npc_KnowsInfo(other,dia_brutus_meatbugsweg) || (MIS_OCGATEOPEN == TRUE)) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm4_info()
{
	if((MIS_OCGATEOPEN == TRUE) || ((hero.guild == GIL_KDF) && (KAPITEL >= 5)))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//Are you all right?
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(apprehensively) And you are sure that those meatbugs are gone?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//Ahem... look, there's one right behind you.
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(bellows) What?
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_BESSEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 55;
	condition = dia_brutus_bessen_condition;
	information = dia_brutus_bessen_info;
	permanent = TRUE;
	description = "You're possessed!";
};


func int dia_brutus_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_BRUTUS == TRUE) && (NPCOBSESSEDBYDMT == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_bessen_info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//You're possessed!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//Go to the monastery and have them heal you.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//I'm beyond help. Go away!
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//Somebody needs to cut those demons out of your head.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(screams) NO!
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_KAP5_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap5_exit_condition;
	information = dia_brutus_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap5_exit_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_brutus_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_PICKPOCKET(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 900;
	condition = dia_brutus_pickpocket_condition;
	information = dia_brutus_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brutus_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_brutus_pickpocket_info()
{
	Info_ClearChoices(dia_brutus_pickpocket);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_BACK,dia_brutus_pickpocket_back);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_PICKPOCKET,dia_brutus_pickpocket_doit);
};

func void dia_brutus_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brutus_pickpocket);
};

func void dia_brutus_pickpocket_back()
{
	Info_ClearChoices(dia_brutus_pickpocket);
};

