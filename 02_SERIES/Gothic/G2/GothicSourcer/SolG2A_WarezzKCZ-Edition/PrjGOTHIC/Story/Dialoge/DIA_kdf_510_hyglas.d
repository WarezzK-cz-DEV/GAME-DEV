
instance DIA_HYGLAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap1_exit_condition;
	information = dia_hyglas_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_FEUER(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_feuer_condition;
	information = dia_hyglas_feuer_info;
	permanent = FALSE;
	description = "I demand the Test of Fire.";
};


func int dia_hyglas_feuer_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_feuer_info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//I demand the Test of Fire.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//The Test of Fire is from the olden days and has not been held for a long time.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//What you are demanding is far too dangerous. So just don't think about it any more.
};


instance DIA_HYGLAS_HALLO(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_hallo_condition;
	information = dia_hyglas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hyglas_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hyglas_hallo_info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//I am Master Hyglas, Guardian of the Fire and Keeper of Knowledge.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//So Master Parlan has given you permission to study the scriptures.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//Then it's up to you now to do exactly that. Study, so that you may find enlightenment in the scriptures.
	};
};


instance DIA_HYGLAS_JOB(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_job_condition;
	information = dia_hyglas_job_info;
	permanent = FALSE;
	description = "What are you studying, Master?";
};


func int dia_hyglas_job_condition()
{
	return TRUE;
};

func void dia_hyglas_job_info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//What are you studying, Master?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//My research focuses on fire - the power of Innos.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//It is his gift and, at the same time, a mighty weapon - and I create runes which contain this power.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//Very enlightening. Can you teach me that?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//It is Innos who grants the magic. Only to his servants, the Magicians of Fire, is it given to learn how to wield this power.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "I have demanded the Test of Fire.";
};


func int dia_hyglas_contest_condition()
{
	if(MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hyglas_contest_info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//I have demanded the Test of Fire. Ulthar gave me the task to create a fire arrow rune.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//And now you want me to teach you the formula?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//I don't know how else I could do it.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//Hmm...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//All right, I shall teach you the formula. But first you need to find all the necessary ingredients.
	b_logentry(TOPIC_RUNE,"Hyglas is willing to teach me the formula for the Fire Arrow rune once I've got all the ingredients.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "What ingredients do I need for a fire arrow rune?";
};


func int dia_hyglas_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (MIS_RUNE == LOG_RUNNING) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//What ingredients do I need for a fire arrow rune?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//Read up on it - it's right there in the books.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "Teach me to create the FIRE ARROW rune.";
};


func int dia_hyglas_talent_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE) && (Npc_HasItems(other,itmi_runeblank) >= 1) && (Npc_HasItems(other,itsc_firebolt) >= 1) && (Npc_HasItems(other,itmi_sulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_talent_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//Teach me to create the FIRE ARROW rune.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//In order to create a fire arrow rune, you need to join the sulphur with the runestone at the rune table.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//The power of the fire arrow spell scroll will flow into the rune, and you will possess a tool of Innos.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//So, once you have all the raw materials, walk over to the rune table and create your rune.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "Where can I find a runestone?";
};


func int dia_hyglas_blank_rune_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_firebolt) && (MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(other,itmi_runeblank) < 1) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_blank_rune_info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//Where can I find a runestone?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//Hey, it's you who demanded the test of the Fire - not I. Finding that out is part of the test.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "I've created the rune.";
};


func int dia_hyglas_gotrune_condition()
{
	if((Npc_KnowsInfo(hero,dia_ulthar_success) == FALSE) && (Npc_HasItems(hero,itru_firebolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_hyglas_gotrune_info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//I've created the rune.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//Well, well. You seem to have passed this test. That wasn't so hard, after all.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//Then go to Ulthar now and show him your work.
	b_logentry(TOPIC_RUNE,"I have created a Fire Arrow rune.");
};


instance DIA_HYGLAS_TEACH(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 15;
	condition = dia_hyglas_teach_condition;
	information = dia_hyglas_teach_info;
	permanent = TRUE;
	description = "Teach me.";
};


func int dia_hyglas_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_hyglas_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//Teach me.
	Info_ClearChoices(dia_hyglas_teach);
	Info_AddChoice(dia_hyglas_teach,DIALOG_BACK,dia_hyglas_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_hyglas_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRESTORM)),dia_hyglas_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEFIREBALL)),dia_hyglas_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_PYROKINESIS)),dia_hyglas_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_hyglas_teach_firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		b_say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(dia_hyglas_teach);
	};
};

func void dia_hyglas_teach_back()
{
	Info_ClearChoices(dia_hyglas_teach);
};

func void dia_hyglas_teach_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_hyglas_teach_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_hyglas_teach_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_hyglas_teach_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_hyglas_teach_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};


instance DIA_HYGLAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap2_exit_condition;
	information = dia_hyglas_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap3_exit_condition;
	information = dia_hyglas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_BRINGBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_bringbook_condition;
	information = dia_hyglas_bringbook_info;
	permanent = FALSE;
	description = "Any news?";
};


func int dia_hyglas_bringbook_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_hyglas_bringbook_info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//Any news?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//Hm, yes. Well, you have probably noticed those black-robed figures.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//I've met them.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//This brings us to the core of the matter. At the moment, we are observing a very rare constellation of stars.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//To be more exact, the sign of the Ox currently stands in direct correlation with the sign of the Warrior. I suppose that you know what that means.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//Hmm. Well, to be honest...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//Yes, right, I see. Well, I cannot explain the entire background to you now, but it definitely signifies great changes. And I do not like changes.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//Therefore, I want you to get me a book from town. It is called 'The divine power of the stars'. You may have to rummage around for it a bit, but I'm sure that you can find it.
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"Get the book yourself.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"What's in it for me?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"I'll see whether I can find it.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//Get the book yourself.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//You dare speak to me in such a tone? Your behavior does not show the respect that is due to me.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//Get out of my sight and think about your behavior.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//What's in it for me?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//What do you mean?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//I'd like to know what you'll give me if I bring you the book.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//Nothing. What were you expecting to get? If you have time to run an errand in town for me, it is even your duty to help me.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//I'll see whether I can find it.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//That's good - it frees up my time so I can follow some other trails as well.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//But don't take too much time. Time, I'm afraid, is what we have the least of.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"Hyglas wants me to get him the book 'The Divine Power of the Stars'. I'm to look for it among the merchants in town.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "I've got the book for you.";
};


func int dia_hyglas_havebook_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook) && (Npc_HasItems(other,itwr_astronomy_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_havebook_info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//I've got the book for you.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//Very good, give here.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//So you changed your mind after all. Very good. So where do you have the book?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//You may withdraw now. I shall retire and study.
};


instance DIA_HYGLAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap4_exit_condition;
	information = dia_hyglas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP4_PERM(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 49;
	condition = dia_hyglas_kap4_perm_condition;
	information = dia_hyglas_kap4_perm_info;
	permanent = TRUE;
	description = "Found anything out yet?";
};


func int dia_hyglas_kap4_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook))
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//Found anything out yet?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//Well, I cannot be completely sure, but the current constellation of the stars seems to indicate many dangers.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//What kind of dangers?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//Well, the structure between the worlds seems to be very weak. It only takes a small portion of the power that would be necessary otherwise to tear a hole into this structure.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//Demons could use those portals to enter our world without encountering resistance.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//No, I am still waiting for that book.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//I told you that I am still doing some research, but of course that will take longer if I do not have the necessary materials.
	};
};


instance DIA_HYGLAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap5_exit_condition;
	information = dia_hyglas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_PICKPOCKET(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 900;
	condition = dia_hyglas_pickpocket_condition;
	information = dia_hyglas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hyglas_pickpocket_condition()
{
	return c_beklauen(73,200);
};

func void dia_hyglas_pickpocket_info()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_BACK,dia_hyglas_pickpocket_back);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_PICKPOCKET,dia_hyglas_pickpocket_doit);
};

func void dia_hyglas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hyglas_pickpocket);
};

func void dia_hyglas_pickpocket_back()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
};

