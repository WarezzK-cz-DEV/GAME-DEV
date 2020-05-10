
instance DIA_ALBRECHT_EXIT(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 999;
	condition = dia_albrecht_exit_condition;
	information = dia_albrecht_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_albrecht_exit_condition()
{
	return TRUE;
};

func void dia_albrecht_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALBRECHT_HAGEN(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 1;
	condition = dia_albrecht_hagen_condition;
	information = dia_albrecht_hagen_info;
	permanent = FALSE;
	description = "I need to talk to Lord Hagen!";
};


func int dia_albrecht_hagen_condition()
{
	if(lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_hagen_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hagen_15_00");	//I need to talk to Lord Hagen!
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_01");	//He's in the great hall, straight through there.
	AI_Output(self,other,"DIA_Albrecht_Hagen_03_02");	//Whatever it is you want from him, keep it short - he is a busy man!
};


instance DIA_ALBRECHT_HALLO(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 2;
	condition = dia_albrecht_hallo_condition;
	information = dia_albrecht_hallo_info;
	permanent = FALSE;
	description = "What does it mean to be a paladin?";
};


func int dia_albrecht_hallo_condition()
{
	return TRUE;
};

func void dia_albrecht_hallo_info()
{
	AI_Output(other,self,"DIA_Albrecht_Hallo_15_00");	//What does it mean to be a paladin?
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_01");	//A paladin is a warrior of Innos. He lives in order to serve him, and fights in order to do him honor.
	AI_Output(self,other,"DIA_Albrecht_Hallo_03_02");	//In return, the gift of magic is bestowed upon us. The magic of runes - which we are granted as recognition for our deeds.
};


instance DIA_ALBRECHT_CANTEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 99;
	condition = dia_albrecht_canteach_condition;
	information = dia_albrecht_canteach_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_albrecht_canteach_condition()
{
	if(ALBRECHT_TEACHMANA == FALSE)
	{
		return TRUE;
	};
};

func void dia_albrecht_canteach_info()
{
	AI_Output(other,self,"DIA_Albrecht_CanTeach_15_00");	//Can you teach me something?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_01");	//If you prove yourself worthy, I shall bestow the magic runes of the paladins upon you.
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_02");	//Beyond that, I can teach you to increase your magic power.
		ALBRECHT_TEACHMANA = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"The paladin Albrecht can help me increase my magic powers.");
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_CanTeach_03_03");	//I only instruct paladins.
	};
};


instance DIA_ALBRECHT_TEACHPALRUNES(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 100;
	condition = dia_albrecht_teachpalrunes_condition;
	information = dia_albrecht_teachpalrunes_info;
	permanent = TRUE;
	description = "Am I worthy of receiving a rune?";
};


func int dia_albrecht_teachpalrunes_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teachpalrunes_info()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_15_00");	//Am I worthy of receiving a rune?
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_01");	//As a sign of your rank, I bestow upon you the Rune of Light. It is the symbol of truth and justice.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_02");	//Light the way for all those who walk the path of Innos.
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_03");	//You must earn all other runes. Come again when you think you have proven yourself worthy.
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(self,itru_pallight,1);
		b_giveinvitems(self,other,itru_pallight,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_04");	//Which way have you chosen?
		AI_Output(self,other,"DIA_Albrecht_TEACHPalRunes_03_05");	//The way of healing or the way of battle?
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,"I choose the path of healing.",dia_albrecht_teachpalrunes_heal);
		Info_AddChoice(dia_albrecht_teachpalrunes,"I choose the path of combat.",dia_albrecht_teachpalrunes_combat);
	};
};

func void dia_albrecht_teachpalrunes_back()
{
	Info_ClearChoices(dia_albrecht_teachpalrunes);
};

func void b_albrecht_youarenotworthy()
{
	AI_Output(self,other,"B_Albrecht_YouAreNotWorthy_03_00");	//You are not yet worthy of receiving the next spell for this path.
};

func void dia_albrecht_teachpalrunes_heal()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Heal_15_00");	//I choose the path of healing.
	if((PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring(NAME_SPL_PALLIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALLIGHTHEAL)),dia_albrecht_teachpalrunes_pallightheal);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring(NAME_SPL_PALMEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALMEDIUMHEAL)),dia_albrecht_teachpalrunes_palmediumheal);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func void dia_albrecht_teachpalrunes_combat()
{
	AI_Output(other,self,"DIA_Albrecht_TEACHPalRunes_Combat_15_00");	//I choose the path of combat.
	if((PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring(NAME_SPL_PALHOLYBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALHOLYBOLT)),dia_albrecht_teachpalrunes_palholybolt);
	}
	else if((PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE) && (KAPITEL >= 5))
	{
		Info_ClearChoices(dia_albrecht_teachpalrunes);
		Info_AddChoice(dia_albrecht_teachpalrunes,DIALOG_BACK,dia_albrecht_teachpalrunes_back);
		Info_AddChoice(dia_albrecht_teachpalrunes,b_buildlearnstring(NAME_SPL_PALREPELEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PALREPELEVIL)),dia_albrecht_teachpalrunes_palrepelevil);
	}
	else
	{
		b_albrecht_youarenotworthy();
	};
};

func void dia_albrecht_teachpalrunes_pallightheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALLIGHTHEAL);
};

func void dia_albrecht_teachpalrunes_palmediumheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALMEDIUMHEAL);
};

func void dia_albrecht_teachpalrunes_palholybolt()
{
	b_teachplayerpalrunes(self,other,SPL_PALHOLYBOLT);
};

func void dia_albrecht_teachpalrunes_palrepelevil()
{
	b_teachplayerpalrunes(self,other,SPL_PALREPELEVIL);
};


instance DIA_ALBRECHT_TEACH(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 101;
	condition = dia_albrecht_teach_condition;
	information = dia_albrecht_teach_info;
	permanent = TRUE;
	description = "I want to increase my magic powers.";
};


func int dia_albrecht_teach_condition()
{
	if(ALBRECHT_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_albrecht_teach_info()
{
	AI_Output(other,self,"DIA_Albrecht_Teach_15_00");	//I want to increase my magic power.
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Albrecht_Teach_03_00");	//If you want to increase your magic power even further, you must seek another teacher.
	};
	Info_ClearChoices(dia_albrecht_teach);
};

func void dia_albrecht_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_albrecht_teach_5);
};

func void dia_albrecht_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_albrecht_teach);
	Info_AddChoice(dia_albrecht_teach,DIALOG_BACK,dia_albrecht_teach_back);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_albrecht_teach_1);
	Info_AddChoice(dia_albrecht_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_albrecht_teach_5);
};


instance DIA_ALBRECHT_PICKPOCKET(C_INFO)
{
	npc = pal_202_albrecht;
	nr = 900;
	condition = dia_albrecht_pickpocket_condition;
	information = dia_albrecht_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_albrecht_pickpocket_condition()
{
	return c_beklauen(41,160);
};

func void dia_albrecht_pickpocket_info()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_BACK,dia_albrecht_pickpocket_back);
	Info_AddChoice(dia_albrecht_pickpocket,DIALOG_PICKPOCKET,dia_albrecht_pickpocket_doit);
};

func void dia_albrecht_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_albrecht_pickpocket);
};

func void dia_albrecht_pickpocket_back()
{
	Info_ClearChoices(dia_albrecht_pickpocket);
};

