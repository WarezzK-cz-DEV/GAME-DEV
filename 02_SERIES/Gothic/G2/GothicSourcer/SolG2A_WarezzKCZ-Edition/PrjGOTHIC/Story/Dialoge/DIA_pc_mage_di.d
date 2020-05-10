
instance DIA_MILTEN_DI_EXIT(C_INFO)
{
	npc = pc_mage_di;
	nr = 999;
	condition = dia_milten_di_exit_condition;
	information = dia_milten_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_milten_di_exit_condition()
{
	return TRUE;
};

func void dia_milten_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTEN_DI_HELLO(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_hello_condition;
	information = dia_milten_di_hello_info;
	description = "Just like in the old days.";
};


func int dia_milten_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_milten_di_hello_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//Just like in the old days.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//You said it. I'm curious to see whether you'll pull it off this time.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//What?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//To save your butt before all hell breaks loose around you again.
};


instance DIA_MILTEN_DI_TRADE(C_INFO)
{
	npc = pc_mage_di;
	nr = 12;
	condition = dia_milten_di_trade_condition;
	information = dia_milten_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Got a few potions to spare?";
};


func int dia_milten_di_trade_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};

func void dia_milten_di_trade_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//Got a few potions to spare?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itpo_health_02,Npc_HasItems(self,itpo_health_02));
	CreateInvItems(self,itpo_health_02,15);
	Npc_RemoveInvItems(self,itpo_mana_02,Npc_HasItems(self,itpo_mana_02));
	CreateInvItems(self,itpo_mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//While supplies last.
};


instance DIA_MILTEN_DI_RAT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_rat_condition;
	information = dia_milten_di_rat_info;
	description = "What advice can you give me?";
};


func int dia_milten_di_rat_condition()
{
	if(Npc_KnowsInfo(other,dia_milten_di_hello) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_milten_di_rat_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//What advice can you give me?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//Mmh. It is a great honor that you should ask me, of all people, for advice. Only one thing has been on my mind the whole time.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//Did you bring the Eye of Innos?
	Info_ClearChoices(dia_milten_di_rat);
	if(SC_INNOSEYEVERGESSEN_DI == TRUE)
	{
		Info_AddChoice(dia_milten_di_rat,"No.",dia_milten_di_rat_nein);
	}
	else
	{
		Info_AddChoice(dia_milten_di_rat,"Of course.",dia_milten_di_rat_ja);
	};
};

func void dia_milten_di_rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//No.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(indignant) You are so... What will you do then if you encounter dragons here on the island?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//Haven't you gotten any wiser by now? We even have an alchemist's bench here, so we can reload the stupid thing.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//And what are you doing? I can only hope your sloppiness doesn't cost us our heads.
	Info_ClearChoices(dia_milten_di_rat);
};

func void dia_milten_di_rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//Of course.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//Sorry, I'm asking such stupid questions. I'm a bit nervous.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_milten_di_rat);
};


instance DIA_MILTEN_DI_PEDROTOT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_pedrotot_condition;
	information = dia_milten_di_pedrotot_info;
	description = "I found Pedro.";
};


func int dia_milten_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};

func void dia_milten_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//I found Pedro.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(surprised) What? Where? Here on the island? Damn, but he is absolutely unbelievable.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//I really had no idea he was such a tough bastard.
	b_giveplayerxp(XP_AMBIENT);
	if(Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//He's dead.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//So? All right. Peace on his soul. Although I can't say that I'm especially sorry, I would have liked to have a word with him nevertheless.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//I've got a bone to pick with him, before too long.
	};
};


instance DIA_MILTEN_DI_TEACHMAGIC(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_teachmagic_condition;
	information = dia_milten_di_teachmagic_info;
	permanent = TRUE;
	description = "I want to improve my magic abilities.";
};


func int dia_milten_di_teachmagic_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};


var int dia_milten_di_teachmagic_onetime;

func void dia_milten_di_teachmagic_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//I want to improve my magic abilities.
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//I'll do my best.
	}
	else if(DIA_MILTEN_DI_TEACHMAGIC_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//I'll help you, but only on the condition that you make sure the orcs stay where they are.
		DIA_MILTEN_DI_TEACHMAGIC_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//Okay. What do you need?
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_milten_di_teachmagic_mana_5);
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Create Runes",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_1()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//May the hand of Innos guide you.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_milten_di_teachmagic_mana_5);
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Create Runes",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_5()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//May the light of Innos illuminate you.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_milten_di_teachmagic_mana_5);
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Create Runes",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//Oh, no! That's really not my specialty, but we'll manage somehow.
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"Paladin Runes",dia_milten_di_teachmagic_runen_paladin);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4)
	{
		Info_AddChoice(dia_milten_di_teachmagic,NAME_CIRCLE_4,dia_milten_di_teachmagic_runen_circle_4);
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5)
		{
			Info_AddChoice(dia_milten_di_teachmagic,NAME_CIRCLE_5,dia_milten_di_teachmagic_runen_circle_5);
		};
		if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
		{
			Info_AddChoice(dia_milten_di_teachmagic,NAME_CIRCLE_6,dia_milten_di_teachmagic_runen_circle_6);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//Oh. You still aren't quite ready. First learn the higher circles, then I can help you.
	};
};

func void dia_milten_di_teachmagic_runen_paladin()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALLIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHT)),dia_milten_di_teachmagic_runen_paladin_spl_pallight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALLIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHTHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_pallightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALHOLYBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALHOLYBOLT)),dia_milten_di_teachmagic_runen_paladin_spl_palholybolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALMEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALMEDIUMHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALREPELEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALREPELEVIL)),dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALFULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALFULLHEAL)),dia_milten_di_teachmagic_runen_paladin_spl_palfullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALDESTROYEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALDESTROYEVIL)),dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil);
	};
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallight()
{
	b_teachplayerpalrunes(self,other,SPL_PALLIGHT);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallightheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALLIGHTHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palholybolt()
{
	b_teachplayerpalrunes(self,other,SPL_PALHOLYBOLT);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALMEDIUMHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil()
{
	b_teachplayerpalrunes(self,other,SPL_PALREPELEVIL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palfullheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALFULLHEAL);
};

func void dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil()
{
	b_teachplayerpalrunes(self,other,SPL_PALDESTROYEVIL);
};

func void dia_milten_di_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONGOLEM)),dia_milten_di_teachmagic_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball);
	};
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_milten_di_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_milten_di_teachmagic_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SUMMONDEMON)),dia_milten_di_teachmagic_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_milten_di_teachmagic_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_milten_di_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_milten_di_teachmagic_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_milten_di_teachmagic_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ARMYOFDARKNESS)),dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_milten_di_teachmagic_runen_circle_6_spl_shrink);
	};
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

func void dia_milten_di_teachmagic_back()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
};


instance DIA_MILTEN_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dementorobsessionbook_condition;
	information = dia_milten_di_dementorobsessionbook_info;
	description = "Does this book, Almanac of the Possessed, ring a bell?";
};


func int dia_milten_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//Does this book, Almanac of the Possessed, ring a bell?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//Pyrokar is the expert on this type of books.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//Sorry. I know too little to be able to say anything intelligent about that.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_DRAGONEGG(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dragonegg_condition;
	information = dia_milten_di_dragonegg_info;
	description = "Do you have experience with dragon eggs?";
};


func int dia_milten_di_dragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dragonegg_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//Do you have experience with dragon eggs?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//No, not really. I have heard that a clever alchemist once managed to brew a powerful potion from it.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//But please don't ask me for the recipe. I have no idea.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_undeaddragondead_condition;
	information = dia_milten_di_undeaddragondead_info;
	permanent = TRUE;
	description = "All right. That's it!";
};


func int dia_milten_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_milten_di_undeaddragondead_onetime;

func void dia_milten_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//All right. That's it! The temple is now deprived of its power.
	if(DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//How do you always pull it off, hm?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//Damned if I know.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(laughs) Are we ever going to get any peace? We've certainly deserved it.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//What will you do now?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//I'm thinking about founding my own academy and preaching our faith. But it could turn out otherwise.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//I have never regretted becoming a Magician of Fire. How do you feel about it?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//I'm not so sure.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(laughs) Dry, as always. Hey, man. You just saved the world. Isn't that a reason to rejoice?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//Mmh. Maybe.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//Come on, my friend, I think the first thing you need now is forty winks.
		DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//You should go straight to the captain and tell him to weigh anchor.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_MAGE_DI_PICKPOCKET(C_INFO)
{
	npc = pc_mage_di;
	nr = 900;
	condition = dia_mage_di_pickpocket_condition;
	information = dia_mage_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_di_pickpocket_condition()
{
	return c_beklauen(45,120);
};

func void dia_mage_di_pickpocket_info()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_BACK,dia_mage_di_pickpocket_back);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_PICKPOCKET,dia_mage_di_pickpocket_doit);
};

func void dia_mage_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_di_pickpocket);
};

func void dia_mage_di_pickpocket_back()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
};

