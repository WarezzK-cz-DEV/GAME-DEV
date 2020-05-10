
instance DIA_ADDON_HUNO_EXIT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 999;
	condition = dia_addon_huno_exit_condition;
	information = dia_addon_huno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_huno_exit_condition()
{
	return TRUE;
};

func void dia_addon_huno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 900;
	condition = dia_addon_huno_pickpocket_condition;
	information = dia_addon_huno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_huno_pickpocket_condition()
{
	return c_beklauen(85,102);
};

func void dia_addon_huno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_BACK,dia_addon_huno_pickpocket_back);
	Info_AddChoice(dia_addon_huno_pickpocket,DIALOG_PICKPOCKET,dia_addon_huno_pickpocket_doit);
};

func void dia_addon_huno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_huno_pickpocket);
};

func void dia_addon_huno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_huno_pickpocket);
};


instance DIA_ADDON_HUNO_ABWIMMELN(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_abwimmeln_condition;
	information = dia_addon_huno_abwimmeln_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_huno_abwimmeln_condition()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		return TRUE;
	};
	if((HUNO_ZUSNAF == TRUE) && !Npc_KnowsInfo(other,dia_addon_fisk_meeting) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_huno_abwimmeln_info()
{
	if(HUNO_MEGA_ANGEPISST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_00");	//What do you want now? Piss off!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Abwimmeln_06_01");	//What are you waiting for? Go to the bar!
	};
	AI_StopProcessInfos(self);
};


var int knows_flucht;
var int huno_angepisst;

instance DIA_ADDON_HUNO_HI(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_hi_condition;
	information = dia_addon_huno_hi_info;
	permanent = FALSE;
	description = "It looks like you're a master of your craft.";
};


func int dia_addon_huno_hi_condition()
{
	return TRUE;
};

func void dia_addon_huno_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_00");	//It looks like you're a master of your craft.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_01");	//I've heard that before... Did you bring the steel?
	AI_Output(other,self,"DIA_Addon_Huno_Hi_15_02");	//Steel? No, I think you're confusing me with...
	AI_Output(self,other,"DIA_Addon_Huno_Hi_06_03");	//Hm... somehow you seem familiar. Do we know each other from somewhere?
	Info_ClearChoices(dia_addon_huno_hi);
	Info_AddChoice(dia_addon_huno_hi,"Sure, from the Old Camp.",dia_addon_huno_hi_ja);
	Info_AddChoice(dia_addon_huno_hi,"I wouldn't know where from.",dia_addon_huno_hi_no);
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Huno deals in smithy equipment.");
};

func void dia_addon_huno_hi_ja()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_00");	//Sure, from the Old Camp.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_01");	//The Old Camp... right... you're that curious guy... I thought you were dead.
	AI_Output(other,self,"DIA_Addon_Huno_Hi_JA_15_02");	//Yes, everybody thinks that. Who else survived?
	AI_Output(self,other,"DIA_Addon_Huno_Hi_JA_06_03");	//A few. Some fled with Raven like I did. For a lot of others, the Old Camp became a grave.
	Info_ClearChoices(dia_addon_huno_hi);
	KNOWS_FLUCHT = TRUE;
};

func void dia_addon_huno_hi_no()
{
	AI_Output(other,self,"DIA_Addon_Huno_Hi_NO_15_00");	//I wouldn't know where from.
	AI_Output(self,other,"DIA_Addon_Huno_Hi_NO_06_01");	//Hm... my brain is like a sieve... whatever...
	Info_ClearChoices(dia_addon_huno_hi);
};


instance DIA_ADDON_HUNO_BLITZ(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 2;
	condition = dia_addon_huno_blitz_condition;
	information = dia_addon_huno_blitz_info;
	permanent = FALSE;
	description = "Tell me about your escape.";
};


func int dia_addon_huno_blitz_condition()
{
	if((KNOWS_FLUCHT == TRUE) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_blitz_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_00");	//Tell me about your escape.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_01");	//Chaos broke out the day the Barrier fell.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_02");	//Some hid - others fled, and there was plundering everywhere.
	AI_Output(other,self,"DIA_Addon_Huno_Blitz_15_03");	//What did you do?
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_04");	//I was about to to leave the camp when it turned bright very suddenly and a scorching pain ate through my skin.
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_05");	//I'd been struck by damn lightning! It feels like I can still hear it...
	AI_Output(self,other,"DIA_Addon_Huno_Blitz_06_06");	//Later someone told me that Thorus found me and took me with him.
};


var int huno_bldarmor;

instance DIA_ADDON_HUNO_BLDARMOR(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 1;
	condition = dia_addon_huno_bldarmor_condition;
	information = dia_addon_huno_bldarmor_info;
	permanent = FALSE;
	description = "Bloodwyn is dead.";
};


func int dia_addon_huno_bldarmor_condition()
{
	if(Npc_IsDead(bloodwyn) && (HUNO_BLDARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_bldarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn is dead.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//You're all right. To be honest, I hadn't expected this from you.
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//About Raven...
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//I've got to kill him.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//And why are you coming to me about that?
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//I need better armor.
	AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//No gold, no armor.
	HUNO_BLDARMOR = TRUE;
};


var int huno_armorperm;
var int huno_armorperm_old1;
var int huno_armorperm_old2;
var int huno_armorperm_old3;

instance DIA_ADDON_HUNO_ARMOR(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_armor_condition;
	information = dia_addon_huno_armor_info;
	permanent = TRUE;
	description = "I need better armor.";
};


func int dia_addon_huno_armor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_hi) && ((HUNO_ARMORPERM == FALSE) || (HUNO_ARMORPERM_OLD1 == FALSE) || (HUNO_ARMORPERM_OLD2 == FALSE) || (HUNO_ARMORPERM_OLD3 == FALSE)) && (HUNO_ANGEPISST == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_huno_armor_info()
{
	Info_ClearChoices(dia_addon_huno_armor);
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//I need better armor.
	if(HUNO_ARMORCHEAP == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_01");	//So - you can have this. It's Esteban's fault it's so expensive.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_02");	//That damned dog pockets his share of every piece of armor I sell.
		BDT_ARMOR_H_VALUE = 2100;
		BDT_ARMOR_OLDL_VALUE = 2700;
		BDT_ARMOR_OLDM_VALUE = 3200;
		BDT_ARMOR_OLDH_VALUE = 4100;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		if(HUNO_ARMORPERM == FALSE)
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy heavy bandit's armor. Protection B.+40/B.+40/P.+30 (2100 gold)",dia_addon_huno_armor_buy);
		};
		if(HUNO_ARMORPERM_OLD1 == FALSE)
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy light armor of the guard of the Old Camp. Protection: B.+45/B.+45/P.+45 (2700 gold)",dia_addon_huno_armor_buy_old_1);
		};
		if(HUNO_ARMORPERM_OLD2 == FALSE)
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy medium armor of the guard of the Old Camp. Protection: B.+55/B.+55/P.+55 (3200 gold)",dia_addon_huno_armor_buy_old_2);
		};
		if((HUNO_ARMORPERM_OLD3 == FALSE) && (HUNO_BLDARMOR == TRUE))
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy heavy armor of the guard of the Old Camp. Protection: B.+65/B.+65/P.+65 (4100 gold)",dia_addon_huno_armor_buy_old_3);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_15_03");	//Okay, I'll take the armor.
		AI_Output(self,other,"DIA_Addon_Huno_Armor_06_04");	//Fisk, you say? Hm, well, I still owe him a favor.
		BDT_ARMOR_H_VALUE = 1400;
		BDT_ARMOR_OLDL_VALUE = 1900;
		BDT_ARMOR_OLDM_VALUE = 2400;
		BDT_ARMOR_OLDH_VALUE = 3300;
		Info_AddChoice(dia_addon_huno_armor,DIALOG_BACK,dia_addon_huno_armor_back);
		if(HUNO_ARMORPERM == FALSE)
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy heavy bandit's armor. Protection B.+40/B.+40/P.+30 (1400 gold)",dia_addon_huno_armor_buy);
		};
		if(HUNO_ARMORPERM_OLD1 == FALSE)
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy light armor of the guard of the Old Camp. Protection: B.+45/B.+45/P.+45 (1900 gold)",dia_addon_huno_armor_buy_old_1);
		};
		if(HUNO_ARMORPERM_OLD2 == FALSE)
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy medium armor of the guard of the Old Camp. Protection: B.+55/B.+55/P.+55 (2400 gold)",dia_addon_huno_armor_buy_old_2);
		};
		if((HUNO_ARMORPERM_OLD3 == FALSE) && (HUNO_BLDARMOR == TRUE))
		{
			Info_AddChoice(dia_addon_huno_armor,"Buy heavy armor of the guard of the Old Camp. Protection: B.+65/B.+65/P.+65 (3300 gold)",dia_addon_huno_armor_buy_old_3);
		};
	};
};

func void dia_addon_huno_armor_back()
{
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Okay, I'll take the armor.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_H_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Sure thing.
		b_giveinvitems(self,other,itar_bdt_h,1);
		HUNO_ARMORPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//No gold, no armor.
	};
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy_old_1()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Okay, I'll take the armor.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_OLDL_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Sure thing.
		b_giveinvitems(self,other,itar_oldcamp_guard_l,1);
		HUNO_ARMORPERM_OLD1 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//No gold, no armor.
	};
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy_old_2()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Okay, I'll take the armor.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_OLDM_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Sure thing.
		b_giveinvitems(self,other,itar_oldcamp_guard_m,1);
		HUNO_ARMORPERM_OLD2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//No gold, no armor.
	};
	Info_ClearChoices(dia_addon_huno_armor);
};

func void dia_addon_huno_armor_buy_old_3()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Okay, I'll take the armor.
	if(b_giveinvitems(other,self,itmi_gold,BDT_ARMOR_OLDH_VALUE))
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_01");	//Sure thing.
		b_giveinvitems(self,other,itar_oldcamp_guard_h,1);
		HUNO_ARMORPERM_OLD3 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_Armor_Buy_06_02");	//No gold, no armor.
	};
	Info_ClearChoices(dia_addon_huno_armor);
};


instance DIA_ADDON_HUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_attentat_condition;
	information = dia_addon_huno_attentat_info;
	permanent = FALSE;
	description = "About the attempted murder of Esteban...";
};


func int dia_addon_huno_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_huno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_00");	//(dangerously) What do you want from me?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_01");	//I'm looking for the person behind the attack...
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_02");	//And why are you coming to me about that?
	AI_Output(other,self,"DIA_Addon_Huno_Attentat_15_03");	//I thought you might know something about the business.
	AI_Output(self,other,"DIA_Addon_Huno_Attentat_06_04");	//I don't know ANYTHING!
};


var int huno_nochmal;
var int huno_somethings_perm;
var int huno_counter;

func void b_addon_huno_stress()
{
	AI_Output(self,other,"DIA_Addon_Huno_Stress_06_00");	//(sighs) Now, listen! You move your ass out of here, before I forget myself!
	HUNO_ANGEPISST = TRUE;
};


instance DIA_ADDON_HUNO_SOMETHINGS(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 4;
	condition = dia_addon_huno_somethings_condition;
	information = dia_addon_huno_somethings_info;
	permanent = TRUE;
	description = "I've heard a few things about you...";
};


func int dia_addon_huno_somethings_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_huno_attentat) && (HUNO_SOMETHINGS_PERM == FALSE) && ((FINN_TELLALL == TRUE) || (PAUL_TELLALL == TRUE) || (EMILIO_TELLALL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_huno_somethings_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_00");	//I've heard a few things about you...
	if(HUNO_NOCHMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_01");	//So?
		HUNO_NOCHMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_02");	//Again? (threatening) It had better be something important this time...
	};
	HUNO_COUNTER = 0;
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_03");	//I heard that you weren't in your place when the attack occurred!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_04");	//(dangerously) What else?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(PAUL_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_05");	//Paul said you hate Esteban.
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_06");	//(dangerously) So? Did he? What else?
		HUNO_COUNTER = HUNO_COUNTER + 1;
	};
	if(EMILIO_TELLALL == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_07");	//Emilio spat out your name! You definitely know something about the attack!
		AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_08");	//(calmly) You've been having a chat with old Emilio, eh?
		if(HUNO_COUNTER > 0)
		{
			AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_09");	//And he isn't the only one who suspects you!
			AI_PlayAni(self,"T_SEARCH");
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_10");	//What's that supposed to mean, hm?
			HUNO_SOMETHINGS_PERM = TRUE;
			Info_ClearChoices(dia_addon_huno_somethings);
			Info_AddChoice(dia_addon_huno_somethings,"I want to join forces with the assassin!",dia_addon_huno_somethings_contra);
			Info_AddChoice(dia_addon_huno_somethings,"If you were behind the attack, you'll pay for it!",dia_addon_huno_somethings_pro);
			b_logentry(TOPIC_ADDON_ESTEBAN,"It looks like I have Huno by the balls.");
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Huno_SomeThings_06_11");	//(threatening) Maybe I should also have a word with him. I'm sure that AFTERWARDS he'll say the exact opposite!
			b_addon_huno_stress();
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_SomeThings_15_12");	//Nothing else...
		b_addon_huno_stress();
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_huno_somethings_pro()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Pro_15_00");	//If you were behind the attack, you'll pay for it!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_01");	//(annoyed) You are such an idiot! Do you really think you can toady up to Esteban?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Pro_06_02");	//Get out of here!
	HUNO_MEGA_ANGEPISST = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_contra()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_00");	//I want to join forces with the assassin!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_01");	//Against Esteban? Really? Then prove it!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_02");	//I've been waiting for too long for a delivery of steel from the pirates.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_03");	//I suspect that Esteban captured it in order to sell it to me later at a higher price.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_04");	//Of course, he won't do that himself. A couple of bandits in the swamp are on his payroll.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_05");	//How do you know that?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_06");	//Drunken bandits talk too much...
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Contra_15_07");	//Does this talkative bandit have a name?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_08");	//His name is none of your business. But the guy you're LOOKING for is called Juan. Anyway, I haven't seen him in the camp for a long time.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Contra_06_09");	//You'll have to look for him in the swamp.
	MIS_HUNO_STAHL = LOG_RUNNING;
	HUNO_ANGEPISST = FALSE;
	Log_CreateTopic(TOPIC_ADDON_HUNO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HUNO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HUNO,"Huno is waiting for a delivery of steel from the pirates. He thinks that a guy named Juan stole it for Esteban. He is hiding somewhere in the swamp.");
	Info_ClearChoices(dia_addon_huno_somethings);
	Info_AddChoice(dia_addon_huno_somethings,"First tell me who is behind the attack!",dia_addon_huno_somethings_tellmenow);
	Info_AddChoice(dia_addon_huno_somethings,"Okay, I'll do it for you!",dia_addon_huno_somethings_mission);
};

func void dia_addon_huno_somethings_mission()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_Mission_15_00");	//Okay, I'll do it for you!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_Mission_06_01");	//Good. We'll see if you can be trusted.
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
};

func void dia_addon_huno_somethings_tellmenow()
{
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_00");	//First tell me who is behind the attack!
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_01");	//No. I don't trust you.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_02");	//Look. The next conversation I have is either going to be with the person behind the attack or with Esteban.
	AI_Output(other,self,"DIA_Addon_Huno_SomeThings_TellMeNow_15_03");	//Who I talk to is your choice.
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_04");	//(sighs) All right. I'll get you together with the perpetrator. But it happens the way I say, got it?
	AI_Output(self,other,"DIA_Addon_Huno_SomeThings_TellMeNow_06_05");	//Go to the bar and talk to the barkeeper. You'll learn everything else from him.
	HUNO_ZUSNAF = TRUE;
	Info_ClearChoices(dia_addon_huno_somethings);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno told me I should talk to Snaf.");
};


instance DIA_ADDON_HUNO_PAKET(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 3;
	condition = dia_addon_huno_paket_condition;
	information = dia_addon_huno_paket_info;
	permanent = FALSE;
	description = "I have the steel.";
};


func int dia_addon_huno_paket_condition()
{
	if((MIS_HUNO_STAHL == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_steel_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_huno_paket_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_00");	//I have the steel.
	b_giveinvitems(other,self,itmi_addon_steel_paket,1);
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_01");	//And? Was Juan there, too?
	AI_Output(other,self,"DIA_Addon_Huno_Paket_15_02");	//He was.
	AI_Output(self,other,"DIA_Addon_Huno_Paket_06_03");	//I knew it. That rat Esteban was behind it.
	if(HUNO_ZUSNAF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_04");	//You're all right. To be honest, I hadn't expected this from you.
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_05");	//Here, take this as a reward.
		b_giveinvitems(self,other,itmi_gold,200);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Huno_Paket_15_06");	//Now, what about our agreement?
		AI_Output(self,other,"DIA_Addon_Huno_Paket_06_07");	//The man you want to talk to is waiting for you in the bar. Talk to the barkeeper.
		HUNO_ZUSNAF = TRUE;
	};
	b_logentry(TOPIC_ADDON_ESTEBAN,"Huno told me I should talk to Snaf.");
	MIS_HUNO_STAHL = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HUNOSTAHL);
};


instance DIA_ADDON_HUNO_TRADE(C_INFO)
{
	npc = bdt_1099_addon_huno;
	nr = 888;
	condition = dia_addon_huno_trade_condition;
	information = dia_addon_huno_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V3;
};


func int dia_addon_huno_trade_condition()
{
	if(HUNO_ANGEPISST == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_huno_trade_info()
{
	if(HUNO_FLAG == 1)
	{
		b_clearsmithinv(self);
		if(HUNO_SWORDRAWS > 0)
		{
			CreateInvItems(self,itmiswordraw,HUNO_SWORDRAWS);
		};
		HUNO_FLAG = 0;
	};
	b_say(other,self,"$TRADE_3");
	b_clearsmithinv(self);
	b_givetradeinv(self);
};

