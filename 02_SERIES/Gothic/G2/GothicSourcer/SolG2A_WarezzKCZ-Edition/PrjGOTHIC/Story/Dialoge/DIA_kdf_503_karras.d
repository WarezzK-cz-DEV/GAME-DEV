
instance DIA_KARRAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap1_exit_condition;
	information = dia_karras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_karras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_HELLO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_hello_condition;
	information = dia_karras_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_hello_info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//What can I do for you, novice?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//What can I do for you, Brother?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//The honorable warriors of Innos rarely stray into these rooms.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//What can I do for you?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(mistrustful) What are you doing here?
	};
};


instance DIA_KARRAS_MISSION(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_mission_condition;
	information = dia_karras_mission_info;
	permanent = FALSE;
	description = "I have come to read the scriptures.";
};


func int dia_karras_mission_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_mission_info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//I have come to read the scriptures.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//I understand. If you can ever make some time between your tedious studies, come to me.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//There is yet another matter for which I could use a discreet novice.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "You have an assignment for me?";
};


func int dia_karras_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_mission))
	{
		return TRUE;
	};
};

func void dia_karras_aufgabe_info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//You have an assignment for me?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//Yes. It's about this crazy Ignaz. He lives in Khorinis and experiments with various potions and healing draughts. But also magic spells.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//And that's exactly what worries me. I ask myself if his magic is pleasing to Innos.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//In order to test this, I need some of his spell scrolls.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//I want you to go into the city and obtain three of his spell scrolls for me.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//But not a word to anyone - is that clear?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//Sure.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//Here are 150 gold pieces. That should cover your expenses.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"Master Karras has sent me to the city. He wants me to get him three of the spell scrolls Ignaz makes and sells.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "Here are the spell scrolls you wanted.";
};


func int dia_karras_success_condition()
{
	if((MIS_KARRASVERGESSEN == LOG_RUNNING) && (Npc_HasItems(other,itsc_charm) >= 3))
	{
		return TRUE;
	};
};

func void dia_karras_success_info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//Here are the spell scrolls you wanted.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//Well done, my young friend.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//But now it is time that you devote yourself to your studies.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//And take this spell scroll as a reward.
	MIS_KARRASVERGESSEN = LOG_SUCCESS;
	b_giveplayerxp(XP_KARRASCHARM);
	b_giveinvitems(other,self,itsc_charm,3);
	b_giveinvitems(self,other,itsc_sumwolf,1);
};


instance DIA_KARRAS_TRADE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_trade_condition;
	information = dia_karras_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_karras_trade_condition()
{
	if(hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_trade_info()
{
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "What exactly is your job?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//What exactly is your job?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//It is my responsibility to train mages in the art of spherical manifestation.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//What does that mean?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//Well, I teach them how to summon creatures or beings from other states or spheres.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//This is usually called summoning, although this expression alone is insufficient for the art of calling a servant.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//Furthermore, I own some interesting spell scrolls which Gorax does not have.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//But I only make them available to members of the Order.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Master Karras can supply me with spell scrolls at the monastery. But for that I need to be a Magician of Fire.");
};


instance DIA_KARRAS_TEACH(C_INFO)
{
	npc = kdf_503_karras;
	nr = 10;
	condition = dia_karras_teach_condition;
	information = dia_karras_teach_info;
	permanent = TRUE;
	description = "Teach me (create runes).";
};


func int dia_karras_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_karras_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//Teach me.
	Info_ClearChoices(dia_karras_teach);
	Info_AddChoice(dia_karras_teach,DIALOG_BACK,dia_karras_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOBLINSKELETON)),dia_karras_teach_sumgobl);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONWOLF)),dia_karras_teachsummonwolf);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONSKELETON)),dia_karras_teach_summonskeleton);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_karras_teach_summongolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_karras_teach_summondemon);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_karras_teach_armyofdarkness);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//For the moment, there is nothing you can learn from me.
		Info_ClearChoices(dia_karras_teach);
	};
};

func void dia_karras_teach_back()
{
	Info_ClearChoices(dia_karras_teach);
};

func void dia_karras_teach_sumgobl()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_karras_teachsummonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_karras_teach_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_karras_teach_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_karras_teach_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_karras_teach_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};


instance DIA_KARRAS_CIRCLE4(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle4_condition;
	information = dia_karras_circle4_info;
	permanent = TRUE;
	description = b_buildlearnstring("I want to learn the fourth Circle of Magic.",b_getlearncosttalent(other,NPC_TALENT_MAGE,4));
};


func int dia_karras_circle4_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void dia_karras_circle4_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//I want to learn the fourth Circle of Magic.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//Good. All the signs are fulfilled. Enter now the fourth circle, so that the power of the new magic will be within you.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//You have come a long way, and Innos will continue to light your path.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//It is still not finished.
	};
};


instance DIA_KARRAS_CIRCLE5(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle5_condition;
	information = dia_karras_circle5_info;
	permanent = TRUE;
	description = b_buildlearnstring("I want to learn the fifth Circle of Magic.",b_getlearncosttalent(other,NPC_TALENT_MAGE,5));
};


func int dia_karras_circle5_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void dia_karras_circle5_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//I want to learn the fifth Circle of Magic.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//Then enter now into the fifth circle of magic. You will command mightier magic than ever before.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//Use its power wisely, Brother - for the darkness is still strong and so are your enemies.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//I cannot accompany you into the sixth and highest Circle of magic. Pyrokar himself will ordain you when the time comes.
			b_logentry(TOPIC_KLOSTERTEACHER,"Master Pyrokar will ordain me to the 6th Circle of Magic.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//The time is not yet ripe.
	};
};


instance DIA_KARRAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap2_exit_condition;
	information = dia_karras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_karras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap3_exit_condition;
	information = dia_karras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_karras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_CHASEPEDRO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_chasepedro_condition;
	information = dia_karras_chasepedro_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_chasepedro_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_chasepedro_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//Brother, you cannot lose any time. You must hunt down Pedro and return the Eye of Innos to the monastery.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//If the Eye is not retrieved, we shall all be lost.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//What are you doing here? Shouldn't you be on your way and looking for the underhanded traitor Pedro?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"Later. There's something I have to take care of first.",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"He's not going to get very far.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//Later. There's something I have to take care of first.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//Do you have any idea what this loss means for the monastery? The Eye of Innos is a powerful weapon.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//No one can foresee what the enemy intends to do with the amulet, but he is planning something and we must prevent it.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//So get moving immediately and track down the thief!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//He's not going to get very far.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//I hope so for your sake. If he should escape because you've been lollygagging here, I will personally drag you before the tribunal.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//What would you accuse me of?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//Conspiracy with the enemy. It takes little imagination to picture the punishment for such an offense.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//And now see to it that you lose no more time, otherwise the next time we meet, it will be at the stake.
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_NEEDINFO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_needinfo_condition;
	information = dia_karras_needinfo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_karras_needinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_chasepedro) && (KAPITEL == 3) && (hero.guild != GIL_KDF) && (MIS_NOVIZENCHASE == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_karras_needinfo_info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//You know everything you need to know. Now be on your way!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "I have brought back the Eye of Innos.";
};


func int dia_karras_innoseyeretrieved_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_karras_innoseyeretrieved_info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//I have brought back the Eye of Innos.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//I am relieved that you were able to snatch the Eye away from the enemy.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//But the danger has not been averted. Evil is making further plans and is proceeding with unusual aggression.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//I've already figured that out for myself.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//Do not mock me. The situation is serious, very serious, and we don't know whom we can trust.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//The enemy has already succeeded in leading the novice Pedro into temptation, and he may have success with many others.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_KARRAS_KAP3_PERM(C_INFO)
{
	npc = kdf_503_karras;
	nr = 5;
	condition = dia_karras_kap3_perm_condition;
	information = dia_karras_kap3_perm_info;
	permanent = TRUE;
	description = "How are your studies coming along?";
};


func int dia_karras_kap3_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//How are your studies coming along?
	if((MIS_KARRASRESEARCHDMT == FALSE) && (PYROKARTOLDKARRASTORESEARCHDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//I have been able to find out something about the Seekers.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//And what would that be?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//They are quite obviously of demonic origin. Well, at least they are, or were, under the influence of demons.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//Be careful if you meet them.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//What a novel concept.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//I'm sorry, but I don't have enough material to make a more precise statement.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//But if you could manage to bring me something of theirs to examine...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"Karras needs something that has been in direct contact with the Seekers in order to continue his investigations.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"I shall see what I can do.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"Could the Sleeper be involved in this?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"What kind of material do you need?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//I am still working on the interpretation of the evidence about the Seekers.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//As soon as I know something, I will of course inform you immediately.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//The enemy has many faces. Which of them presents the greatest danger for the monastery is awfully difficult to determine.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//Could the Sleeper be involved in this?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//I have heard the story of the Sleeper. But from a distance I cannot say anything about it.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//There are countless demons, and any of them could be involved.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//Do you want me to bring you a corpse, then?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//No, are you crazy? The dangers posed by a demonic being within the walls of the monastery are much too great.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//It will be enough if you find some objects which are typical for these beings.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//The remains of the demonic aura which clings to them should offer enough clues for an examination.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//What kind of material do you need?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//What do I know - any objects which specially belong to these beings.
	Info_AddChoice(dia_karras_kap3_perm,"Do you want me to bring you a corpse?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//I shall see what I can do.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//It would certainly be very useful. In the meantime, I will carry out my own personal research.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "I've got an almanac of the Possessed here.";
};


func int dia_karras_havebook_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_RUNNING) && (Npc_HasItems(hero,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int karrasgotresearchdmtbook_day;

func void dia_karras_havebook_info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//I've got an almanac of the Possessed here. Maybe you can find some use for it.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//Show me.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//Yes, that may do. I will examine the book.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//But I'm already sure of one thing.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//In my opinion, the Seekers are an utterly perverted life form created by Beliar.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//These beings are of partly demonic and partly human origin.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//However, I am still unable to tell at this point whether we are looking at a type of spiritual possession, or a purely physical mutation.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//Come back later. Then I will certainly know more.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras has been able to use an Almanac of the Possessed for further research. I'm to return to him later.");
	KARRASGOTRESEARCHDMTBOOK_DAY = Wld_GetDay();
	b_giveplayerxp(XP_KARRASRESEARCHDMT);
};


instance DIA_KARRAS_RESEARCHDMTEND(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_researchdmtend_condition;
	information = dia_karras_researchdmtend_info;
	permanent = TRUE;
	description = "Found out anything new about the Seekers yet?";
};


func int dia_karras_researchdmtend_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KNOWSMADPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_researchdmtend_info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//Found out anything new about the Seekers yet?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//Yes. Now I know who or what the Seekers really are.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//Fire away!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//They were once human, like you or I. They made the abominable mistake of devoting themselves to the impure magic of a very powerful archdemon.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//Under the influence of this archdemon as well as very powerful drugs, they existed only to serve him until they were reduced to mere shadows of themselves.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//Today, they are nothing but tools of evil, without a will of their own, and they will never cease to hunt the followers of Innos.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//We must be careful. They still seem to shun these hallowed halls of Innos.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//However, if their power continues to grow, I don't know if we'll still be safe here.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//Thanks. That was very enlightening.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//Indeed? That only raises more questions for me. For example, who were they before, and which archdemon made them what they are now?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//I've got a notion. This all sounds like the Brotherhood of the Sleeper. I know those guys.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//I hope you know what you're getting involved in. Take care of yourself, my Brother.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//But, of course. Here is your almanac. I don't need it any longer.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karras' studies have been successful. There seems to be some sort of link between the Seekers and the Brotherhood of the Sleeper.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//I'm working on it. Come back later.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "Is there a way to protect oneself against the mental attacks of the Seekers?";
};


func int dia_karras_prot_blackeye_condition()
{
	if((hero.guild == GIL_KDF) && (PYROKAR_ASKKARRASABOUTDMTAMULETT == TRUE) && (MIS_KARRAS_FINDBLESSEDSTONE == FALSE) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_prot_blackeye_info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//Is there a way to protect oneself against the mental attacks of the Seekers?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//Indeed. An amulet prepared with stone from blessed soil could have a protective effect.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//Unfortunately, I do not have enough of these stones available.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//Some of our prayer shrines which we have erected are composed of them.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//All right. I shall scare up some of that.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//Yes, do that. But don't even think of damaging the shrines, do you hear me?
		b_logentry(TOPIC_DEMENTOREN,"Karras can get me some protection against the mental attacks of the Seekers. He needs stone from blessed soil. Some shrines are made of such stones.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//No idea. I still know too little to answer that. Ask me about it later.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "I've got some stone here from blessed soil.";
};


func int dia_karras_karrasblessedstone_condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,itmi_karrasblessedstone_mis) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int karrasmakesblessedstone_day;

func void dia_karras_karrasblessedstone_info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//I've got some stone here from blessed soil.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//Good. I hope all the prayer shrines are still in their places.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//All right. I shall make you a protective amulet against the black look of the Seekers.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//Give me some time. I shall get right to work.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"Karras will give me a protective amulet against the mental attacks of the Seekers. That will simplify matters.");
	b_giveplayerxp(XP_KARRAS_FOUNDBLESSEDSTONE);
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_itam_prot_blackeye_mis_condition;
	information = dia_karras_itam_prot_blackeye_mis_info;
	permanent = TRUE;
	description = "So what about the protective amulet you promised me?";
};


var int dia_karras_itam_prot_blackeye_mis_noperm;

func int dia_karras_itam_prot_blackeye_mis_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_SUCCESS) && (DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_itam_prot_blackeye_mis_info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//So what about the protective amulet you promised me?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//I'm finished. Here, take a look. It has turned out beautifully.
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//Carry it with you always and the Seekers will not be able to drag you down into their mental abyss.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Thank you.
		b_logentry(TOPIC_DEMENTOREN,"Karras gave me an amulet for protection against the black look of the Seekers.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//Patience. I'm still working on it.
	};
};


instance DIA_KARRAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap4_exit_condition;
	information = dia_karras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_karras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap5_exit_condition;
	information = dia_karras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_karras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_PICKPOCKET(C_INFO)
{
	npc = kdf_503_karras;
	nr = 900;
	condition = dia_karras_pickpocket_condition;
	information = dia_karras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_karras_pickpocket_condition()
{
	return c_beklauen(49,35);
};

func void dia_karras_pickpocket_info()
{
	Info_ClearChoices(dia_karras_pickpocket);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_BACK,dia_karras_pickpocket_back);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_PICKPOCKET,dia_karras_pickpocket_doit);
};

func void dia_karras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_karras_pickpocket);
};

func void dia_karras_pickpocket_back()
{
	Info_ClearChoices(dia_karras_pickpocket);
};

