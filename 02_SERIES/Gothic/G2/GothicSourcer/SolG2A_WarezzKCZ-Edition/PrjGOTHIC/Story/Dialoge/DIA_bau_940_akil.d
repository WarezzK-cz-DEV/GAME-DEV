
instance DIA_AKIL_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_exit_condition;
	information = dia_akil_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V1;
};


func int dia_akil_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_akil_exit_info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//I've got to go.
	if(AKIL_SAUER == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//Don't let me stop you.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//So long. I really wish I could have done more for you.
	};
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_HALLO(C_INFO)
{
	npc = bau_940_akil;
	nr = 4;
	condition = dia_akil_hallo_condition;
	information = dia_akil_hallo_info;
	permanent = FALSE;
	description = "Is there a problem?";
};


func int dia_akil_hallo_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_hallo_info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//Is there a problem?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(sweating)... Eh... no, no... everything's fine. (nervous) It... would be better if you left now.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//Are you sure?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//eh... yeah, yeah... everything's fine. You... eh... I... I can't talk to you now.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akil's farm is threatened by mercenaries.");
	AKILS_SLDSTILLTHERE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NICHTJETZT(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_nichtjetzt_condition;
	information = dia_akil_nichtjetzt_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_akil_nichtjetzt_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_KnowsInfo(other,dia_akil_hallo))
	{
		return TRUE;
	};
};

func void dia_akil_nichtjetzt_info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//Eh... not now, I can't talk to you now.
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NACHKAMPF(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_akil_nachkampf_condition;
	information = dia_akil_nachkampf_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_akil_nachkampf_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_nachkampf_info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//Thank Innos. I thought my time had run out.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//My name is Akil. I farm this humble piece of land.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//Who were those people?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//You ought to recognize them. Those were mercenaries from Onar's farm. Like you.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//Those were mercenaries from Onar's farm. Those bastards don't know anything but plunder and murder.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//I'd been fearing the worst...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(deep breath)... well, thank Innos it didn't come to that. Tell me what I can do for you.
	Info_ClearChoices(dia_akil_nachkampf);
	Info_AddChoice(dia_akil_nachkampf,"Nothing. Just as long as you got through this all right.",dia_akil_nachkampf_ehre);
	Info_AddChoice(dia_akil_nachkampf,"What about a few gold pieces?",dia_akil_nachkampf_gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(kati) && !Npc_IsDead(kati))
	{
		Npc_ExchangeRoutine(kati,"Start");
		AI_ContinueRoutine(kati);
		kati.flags = 0;
	};
	if(Hlp_IsValidNpc(randolph) && !Npc_IsDead(randolph))
	{
		Npc_ExchangeRoutine(randolph,"Start");
		AI_ContinueRoutine(randolph);
		randolph.flags = 0;
	};
	TOPIC_END_AKILSSLDSTILLTHERE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_akil_nachkampf_ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//Nothing. Just as long as you got through this all right.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//You're an exceptional fellow. May Innos guard you on your way.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
	Info_ClearChoices(dia_akil_nachkampf);
};

func void dia_akil_nachkampf_gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//What about a few gold pieces?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//I'm afraid I have to disappoint you - we're poor farmers. It's just enough to live on.
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//All I can offer you is a meal. Go to Kati and let her take care of you.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOF);
	Info_ClearChoices(dia_akil_nachkampf);
	KATI_MAHLZEIT = TRUE;
};


instance DIA_AKIL_SOELDNER(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_soeldner_condition;
	information = dia_akil_soeldner_info;
	permanent = FALSE;
	description = "What did the mercenaries want from you?";
};


func int dia_akil_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf))
	{
		return TRUE;
	};
};

func void dia_akil_soeldner_info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//What did the mercenaries want from you?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//You're pulling my leg. The mercenaries wanted to collect the rent.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//You don't know that? Onar, the landowner, hired them. They guard his farm and collect the rent for him.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//That means they go from farm to farm and take whatever they want. And whoever can't pay gets a taste of their steel.
	};
};


instance DIA_ADDON_AKIL_MISSINGPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_missingpeople_condition;
	information = dia_addon_akil_missingpeople_info;
	description = "Have you heard anything about missing citizens?";
};


func int dia_addon_akil_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_akil_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_MissingPeople_15_00");	//Have you heard anything about missing citizens?
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_01");	//Don't make me laugh. Heard of them? Some of my own people are missing.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_02");	//Tonak and Telbor used to work on my fields, until 3 days ago.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_03");	//And I know exactly that they wouldn't up and leave the farm just like that.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_04");	//And yet, they've simply vanished and no-one can tell me where they went.
	AI_Output(self,other,"DIA_Addon_Akil_MissingPeople_13_05");	//If you happen to find out what's become of them, be sure to let me know, will you?
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"The farmer Akil is missing his two field hands Tonak and Telbor");
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_RUNNING;
};


instance DIA_ADDON_AKIL_RETURNPEOPLE(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_addon_akil_returnpeople_condition;
	information = dia_addon_akil_returnpeople_info;
	permanent = FALSE;
	description = "About your farmhands...";
};


func int dia_addon_akil_returnpeople_condition()
{
	if((MIS_AKIL_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (MISSINGPEOPLERETURNEDHOME == TRUE) && ((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) || (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_akil_returnpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Akil_ReturnPeople_15_00");	//About your farmhands...
	if((Npc_GetDistToWP(tonak_nw,"NW_FARM2_FIELD_TANOK") <= 1000) && (Npc_GetDistToWP(telbor_nw,"NW_FARM2_FIELD_TELBOR") <= 1000))
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_01");	//You brought them back - you're one brave man.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_02");	//At least one of them has survived.
	};
	AI_Output(self,other,"DIA_Addon_Akil_ReturnPeople_13_03");	//Take this gold as a token of my gratitude.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveplayerxp(XP_AMBIENT);
	MIS_AKIL_BRINGMISSPEOPLEBACK = LOG_SUCCESS;
};


instance DIA_AKIL_LIEFERUNG(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_lieferung_condition;
	information = dia_akil_lieferung_info;
	permanent = FALSE;
	description = "Baltram sent me...";
};


func int dia_akil_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_akil_lieferung_info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//Baltram sent me. I'm supposed to pick up a shipment for him here.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//So you're his new messenger. Okay, I've already made up the package.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
	b_logentry(TOPIC_BALTRAM,"I've got the shipment. I could take it to Baltram now...");
	b_logentry(TOPIC_NAGUR,"I've got the shipment. I could take it to Nagur now...");
};


instance DIA_AKIL_GEGEND(C_INFO)
{
	npc = bau_940_akil;
	nr = 90;
	condition = dia_akil_gegend_condition;
	information = dia_akil_gegend_info;
	permanent = FALSE;
	description = "You know your way around this area?";
};


func int dia_akil_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int knows_taverne;

func void dia_akil_gegend_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//You know your way around this area...
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//Sure, what do you want to know?
};


instance DIA_AKIL_HOF(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_hof_condition;
	information = dia_akil_hof_info;
	permanent = FALSE;
	description = "Where can I find Onar's farm?";
};


func int dia_akil_hof_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_hof_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//Where can I find Onar's farm?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//Just go back down the stone steps and follow the road to the east.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//At some point you come to a tavern. From there you go farther east until you come to the big fields. That's where the mercenaries hang out.
	KNOWS_TAVERNE = TRUE;
};


instance DIA_AKIL_TAVERNE(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_taverne_condition;
	information = dia_akil_taverne_info;
	permanent = FALSE;
	description = "What is that tavern to the east of here?";
};


func int dia_akil_taverne_condition()
{
	if(KNOWS_TAVERNE == TRUE)
	{
		return TRUE;
	};
};

func void dia_akil_taverne_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//What is that tavern to the east of here?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//Ask Randolph. He knows more about it than I do. He's been there a few times.
};


instance DIA_AKIL_WALD(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_wald_condition;
	information = dia_akil_wald_info;
	permanent = FALSE;
	description = "What is there in the woods behind your farm?";
};


func int dia_akil_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_wald_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//What is there in the woods behind your farm?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//There's just a whole bunch of monsters back there - and the wolves are the least dangerous.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//A few bandits are also said to have their caves there. Well - they've left my farm alone so far.
};


instance DIA_AKIL_PERM(C_INFO)
{
	npc = bau_940_akil;
	nr = 32;
	condition = dia_akil_perm_condition;
	information = dia_akil_perm_info;
	permanent = TRUE;
	description = "Did anything else happen?";
};


func int dia_akil_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_akil_perm_info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//Did anything else happen?
	if(KAPITEL == 3)
	{
		if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//No. I hope the sheep stay where they are right now.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//My sheep keep disappearing. Soon I won't be able to feed us anymore.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//The orcs have shown up everywhere. Someone even mentioned their headquarters. Ask the farmer Lobart about that.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//They've also spotted plenty of lizard people in this area. I wouldn't go into the caves if I were you.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//The black hoods are looking for you.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//Now there's a novel concept.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//All right. I just thought I'd mention it.
		};
	};
};


instance DIA_AKIL_KAP3_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap3_exit_condition;
	information = dia_akil_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_akil_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_SCHAFDIEB(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdieb_condition;
	information = dia_akil_schafdieb_info;
	description = "Is there any other news?";
};


func int dia_akil_schafdieb_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_akil_schafdieb_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//Is there any other news?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//Someone keeps stealing my sheep lately. I haven't been able to sleep properly for nights.
	Info_ClearChoices(dia_akil_schafdieb);
	Info_AddChoice(dia_akil_schafdieb,"Not my problem.",dia_akil_schafdieb_nein);
	Info_AddChoice(dia_akil_schafdieb,"How many sheep are you missing?",dia_akil_schafdieb_wieviel);
	Info_AddChoice(dia_akil_schafdieb,"Who could have done that?",dia_akil_schafdieb_wer);
	MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSCHAFDIEBE,"Akil's sheep keep getting stolen. He suspects that the bandits in the woodland cave nearby are behind it.");
};

func void dia_akil_schafdieb_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//Who could have done that?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//I've got a hunch about that.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//Some really nasty fellows have settled into the caves over in the forest.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//I find it hard to believe that they're living on berries. I'm almost certain that's where my sheep are disappearing to.
	Info_ClearChoices(dia_akil_schafdieb);
};

func void dia_akil_schafdieb_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//How many sheep are you missing?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//It must be at least three that have disappeared now.
};

func void dia_akil_schafdieb_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//Not my problem.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//I understand. You have other things to worry about.
	Info_ClearChoices(dia_akil_schafdieb);
};


instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdiebeplatt_condition;
	information = dia_akil_schafdiebeplatt_info;
	description = "I found the sheep rustlers.";
};


func int dia_akil_schafdiebeplatt_condition()
{
	if((KAPITEL >= 3) && (MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && Npc_IsDead(bdt_1025_bandit_h) && Npc_IsDead(bdt_1026_bandit_h) && Npc_IsDead(bdt_1027_bandit_h))
	{
		return TRUE;
	};
};

func void dia_akil_schafdiebeplatt_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//I found the sheep rustlers.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//You were right. Those fellows in the forest cave did it. They'll never steal sheep from you again.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//Thank you, noble servant of Innos.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//Thanks. So the militia really does care about us small farmers.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//Thanks. You sure are a strange mercenary. Not at all like the others I know.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//Take this as a small token of thanks for the selfless favor you did for me.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_AKIL_SCHAFDIEBE = LOG_SUCCESS;
	b_giveplayerxp(XP_AKIL_SCHAFDIEBE);
};


instance DIA_AKIL_AKILSSCHAF(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_akilsschaf_condition;
	information = dia_akil_akilsschaf_info;
	description = "(return Akils sheep)";
};


func int dia_akil_akilsschaf_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToNpc(self,follow_sheep_akil) < 1000) && (MIS_AKIL_SCHAFDIEBE != 0))
	{
		return TRUE;
	};
};

func void dia_akil_akilsschaf_info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//Very good. Here's a few gold coins. I hope it's enough.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	follow_sheep_akil.aivar[AIV_PARTYMEMBER] = FALSE;
	follow_sheep_akil.wp = "NW_FARM2_OUT_02";
	follow_sheep_akil.start_aistate = zs_mm_allscheduler;
	b_giveplayerxp(XP_AKILSSCHAF);
};


instance DIA_AKIL_KAP4_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap4_exit_condition;
	information = dia_akil_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_akil_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP5_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap5_exit_condition;
	information = dia_akil_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_akil_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP6_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap6_exit_condition;
	information = dia_akil_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_akil_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_PICKPOCKET(C_INFO)
{
	npc = bau_940_akil;
	nr = 900;
	condition = dia_akil_pickpocket_condition;
	information = dia_akil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_akil_pickpocket_condition()
{
	return c_beklauen(37,30);
};

func void dia_akil_pickpocket_info()
{
	Info_ClearChoices(dia_akil_pickpocket);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_BACK,dia_akil_pickpocket_back);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_PICKPOCKET,dia_akil_pickpocket_doit);
};

func void dia_akil_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_akil_pickpocket);
};

func void dia_akil_pickpocket_back()
{
	Info_ClearChoices(dia_akil_pickpocket);
};

