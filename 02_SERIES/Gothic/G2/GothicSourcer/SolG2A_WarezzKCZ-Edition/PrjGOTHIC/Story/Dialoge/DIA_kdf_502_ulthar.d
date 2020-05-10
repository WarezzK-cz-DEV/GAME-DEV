
instance DIA_ULTHAR_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_exit_condition;
	information = dia_ulthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_GREET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_greet_condition;
	information = dia_ulthar_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulthar_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulthar_greet_info()
{
	AI_Output(self,other,"DIA_Ulthar_GREET_05_00");	//Look, the new novice appears before the High Council. Innos be with you, son.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_01");	//What exactly is the task of the High Council?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_02");	//It is our duty to proclaim the will of Innos. Thus, we name the chosen novices who will be put to the Test of Magic.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_03");	//Even though we lead a retired life, we turn our gaze upon the events of the world, for the church of Innos represents the highest earthly law.
	AI_Output(other,self,"DIA_Ulthar_GREET_15_04");	//Ah, so you're interested in what's going on in the world...
	AI_Output(other,self,"DIA_Ulthar_GREET_15_05");	//So what do you think of those dragons squatting in the Valley of Mines, with their army growing every day?
	AI_Output(self,other,"DIA_Ulthar_GREET_05_06");	//I understand that you are angry, but we must first weigh your words before we take any steps.
	AI_Output(self,other,"DIA_Ulthar_GREET_05_07");	//If we allow ourselves to be carried away and act rashly now, we will achieve nothing. Therefore, fulfill your tasks - and we shall discuss what is to be done.
};


instance DIA_ULTHAR_MAGETEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_magetest_condition;
	information = dia_ulthar_magetest_info;
	description = "Tell me about the Test of Magic.";
};


func int dia_ulthar_magetest_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_greet))
	{
		return TRUE;
	};
};

func void dia_ulthar_magetest_info()
{
	AI_Output(other,self,"DIA_Ulthar_MAGETEST_15_00");	//Tell me about the Test of Magic.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_01");	//It is the chance for the chosen novices to enter the guild of magicians. But only one can pass the test.
	AI_Output(self,other,"DIA_Ulthar_MAGETEST_05_02");	//And Innos alone chooses the novices for it.
};


instance DIA_ULTHAR_WHEN(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 3;
	condition = dia_ulthar_when_condition;
	information = dia_ulthar_when_info;
	permanent = TRUE;
	description = "When's the test going to take place?";
};


func int dia_ulthar_when_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_magetest) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulthar_when_info()
{
	AI_Output(other,self,"DIA_Ulthar_WHEN_15_00");	//When's the test going to take place?
	AI_Output(self,other,"DIA_Ulthar_WHEN_05_01");	//As soon as we have heard the will of Innos. We inform the chosen novices, and put them to the test.
};


instance DIA_ULTHAR_TEST(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_test_condition;
	information = dia_ulthar_test_info;
	permanent = FALSE;
	description = "I am ready to face your test, Master.";
};


func int dia_ulthar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire))
	{
		return TRUE;
	};
};

func void dia_ulthar_test_info()
{
	AI_Output(other,self,"DIA_Ulthar_TEST_15_00");	//I am ready to face your test, Master.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_01");	//I am not surprised that you know the old law.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_02");	//But I suspect that you do not realize what risk you are taking. Bear in mind that an impatient spirit will not withstand the Test of Fire.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_03");	//It has been a long time since anyone took this test. And there is only one man who ever survived it, and passed.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_04");	//A young ambitious novice then, he has long since found his place in the High Council - I speak of Serpentes.
	AI_Output(other,self,"DIA_Ulthar_TEST_15_05");	//He won't be the only one who ever passed that test for much longer.
	AI_Output(self,other,"DIA_Ulthar_TEST_05_06");	//Then I shall not keep you waiting any longer. Hear my test for you:
	AI_Output(self,other,"DIA_Ulthar_TEST_05_07");	//Create a fire arrow rune. That is all - may Innos help you.
	MIS_RUNE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RUNE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUNE,LOG_RUNNING);
	b_logentry(TOPIC_RUNE,"Ulthar has given me his test. I'm to create a Fire Arrow rune.");
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_RUNNING(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 10;
	condition = dia_ulthar_running_condition;
	information = dia_ulthar_running_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_ulthar_running_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (Npc_HasItems(other,itru_firebolt) == 0))
	{
		return TRUE;
	};
};

func void dia_ulthar_running_info()
{
	AI_Output(self,other,"DIA_Ulthar_RUNNING_05_00");	//You know your task. Attend to it.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SUCCESS(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 2;
	condition = dia_ulthar_success_condition;
	information = dia_ulthar_success_info;
	permanent = FALSE;
	description = "I have created the rune!";
};


func int dia_ulthar_success_condition()
{
	if((MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(hero,itru_firebolt) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulthar_success_info()
{
	AI_Output(other,self,"DIA_Ulthar_SUCCESS_15_00");	//I have created the rune!
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_01");	//Well done, novice. You shall keep this, your first rune.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_02");	//Once you have reached the first Circle of Fire, you will be able to use it.
	AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_03");	//You have fulfilled this test to my satisfaction.
	if((MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		AI_Output(self,other,"DIA_Ulthar_SUCCESS_05_04");	//But the dangerous task which Serpentes has assigned you still lies before you!
	};
	MIS_RUNE = LOG_SUCCESS;
	b_giveplayerxp(XP_RUNE);
};


instance DIA_ULTHAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap3_exit_condition;
	information = dia_ulthar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PERMABKAP3(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 99;
	condition = dia_ulthar_permabkap3_condition;
	information = dia_ulthar_permabkap3_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_ulthar_permabkap3_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_ulthar_success))
	{
		return TRUE;
	};
};

func void dia_ulthar_permabkap3_info()
{
	AI_Output(other,self,"DIA_Ulthar_PermAbKap3_15_00");	//Any news?
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_01");	//Not at the moment. Go and complete your tasks. You still have much to do.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_PermAbKap3_05_02");	//No. Nothing which you do not already know, Brother.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEVERGIFTET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinevergiftet_condition;
	information = dia_ulthar_schreinevergiftet_info;
	important = TRUE;
};


func int dia_ulthar_schreinevergiftet_condition()
{
	if(PEDRO_TRAITOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinevergiftet_info()
{
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_00");	//One more thing. Some of the roadside shrines dedicated to Innos have been desecrated by the enemy. They have lost their magical consecration.
		AI_Output(other,self,"DIA_Ulthar_SCHREINEVERGIFTET_15_01");	//I see. And now?
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_02");	//It is up to you to purify these shrines, so that the situation does not escalate.
		CreateInvItems(self,itmi_ultharsholywater_mis,1);
		b_giveinvitems(self,other,itmi_ultharsholywater_mis,1);
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_03");	//Take this holy water and trickle it on the base of the shrine.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_04");	//With the holy words of purification, the shrine will regain its old power.
		if(Npc_HasItems(other,itwr_map_shrine_mis) == FALSE)
		{
			if(Npc_IsDead(gorax) == FALSE)
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_05");	//Gorax can sell you a map on which our shrines are marked.
			}
			else
			{
				AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_06");	//Here's a map for you. The shrines which we have set up are marked on it.
				CreateInvItems(self,itwr_map_shrine_mis,1);
				b_giveinvitems(self,other,itwr_map_shrine_mis,1);
			};
		};
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_07");	//Now go and perform your tasks.
		MIS_ULTHAR_HEILESCHREINE_PAL = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ULTHAR_HEILESCHREINE_PAL,LOG_RUNNING);
		b_logentry(TOPIC_ULTHAR_HEILESCHREINE_PAL,"Ulthar has given me the task to purify all the shrines the enemy has desecrated with his holy water.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_08");	//One more little thing. Stay away from the roadside shrines. We have heard that some of them have been desecrated.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_09");	//No one can say what effect they now have.
		AI_Output(self,other,"DIA_Ulthar_SCHREINEVERGIFTET_05_10");	//It is not your task to solve this problem. The paladins will take care of this matter.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ULTHAR_SCHREINEGEHEILT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheilt_condition;
	information = dia_ulthar_schreinegeheilt_info;
	description = "I have purified all the shrines.";
};


func int dia_ulthar_schreinegeheilt_condition()
{
	if(MIS_ULTHAR_HEILESCHREINE_PAL == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheilt_info()
{
	AI_Output(other,self,"DIA_Ulthar_SchreineGeheilt_15_00");	//I have purified all the shrines.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_01");	//Excellently done, my son. I am proud of you. May Innos watch over you.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheilt_05_02");	//Take this Amulet of Strength, that it may be of use to you in battle against the enemy.
	CreateInvItems(self,itam_dex_strg_01,1);
	b_giveinvitems(self,other,itam_dex_strg_01,1);
	b_giveplayerxp(XP_ULTHAR_SCHREINEGEREINIGT);
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap4_exit_condition;
	information = dia_ulthar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_SCHREINEGEHEILTNOPAL(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 30;
	condition = dia_ulthar_schreinegeheiltnopal_condition;
	information = dia_ulthar_schreinegeheiltnopal_info;
	important = TRUE;
};


func int dia_ulthar_schreinegeheiltnopal_condition()
{
	if(((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_ulthar_schreinegeheiltnopal_info()
{
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_00");	//Good news. The roadside shrines have been purified. The strength of Innos has helped the paladins to remove this problem from the world.
	AI_Output(self,other,"DIA_Ulthar_SchreineGeheiltNoPAL_05_01");	//You may once again make your donations to Innos without reservation or regret.
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap5_exit_condition;
	information = dia_ulthar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 999;
	condition = dia_ulthar_kap6_exit_condition;
	information = dia_ulthar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulthar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ulthar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULTHAR_PICKPOCKET(C_INFO)
{
	npc = kdf_502_ulthar;
	nr = 900;
	condition = dia_ulthar_pickpocket_condition;
	information = dia_ulthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ulthar_pickpocket_condition()
{
	return c_beklauen(74,320);
};

func void dia_ulthar_pickpocket_info()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_BACK,dia_ulthar_pickpocket_back);
	Info_AddChoice(dia_ulthar_pickpocket,DIALOG_PICKPOCKET,dia_ulthar_pickpocket_doit);
};

func void dia_ulthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulthar_pickpocket);
};

func void dia_ulthar_pickpocket_back()
{
	Info_ClearChoices(dia_ulthar_pickpocket);
};

