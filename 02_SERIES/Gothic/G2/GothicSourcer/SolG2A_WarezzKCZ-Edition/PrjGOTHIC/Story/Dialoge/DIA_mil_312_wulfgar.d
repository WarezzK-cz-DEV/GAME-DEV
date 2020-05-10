
instance DIA_WULFGAR_EXIT(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 999;
	condition = dia_wulfgar_exit_condition;
	information = dia_wulfgar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wulfgar_exit_condition()
{
	return TRUE;
};

func void dia_wulfgar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WULFGAR_HALLO(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_hallo_condition;
	information = dia_wulfgar_hallo_info;
	permanent = FALSE;
	description = "How's your duty?";
};


func int dia_wulfgar_hallo_condition()
{
	return TRUE;
};

func void dia_wulfgar_hallo_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Hallo_15_00");	//How's your duty?
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_01");	//(scornful) These boys swing their swords like farmers.
	AI_Output(self,other,"DIA_Wulfgar_Hallo_04_02");	//(convinced) But when I'm done with them, every single one of them will be a tough, hard bastard.
};


instance DIA_WULFGAR_WANNAJOIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_wannajoin_condition;
	information = dia_wulfgar_wannajoin_info;
	permanent = FALSE;
	description = "I want to join the militia!";
};


func int dia_wulfgar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_00");	//I want to join the militia!
	AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_01");	//So? Are you a citizen of the town?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_02");	//No.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_03");	//Then Lord Andre won't take you.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_04");	//Sure, you can talk to him - but I don't think he'll make an exception for you.
	}
	else
	{
		AI_Output(other,self,"DIA_Wulfgar_WannaJoin_15_05");	//Yes.
		AI_Output(self,other,"DIA_Wulfgar_WannaJoin_04_06");	//Then talk to Lord Andre. He decides who gets accepted here.
	};
};


instance DIA_WULFGAR_ABOUTMILIZ(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 3;
	condition = dia_wulfgar_aboutmiliz_condition;
	information = dia_wulfgar_aboutmiliz_info;
	permanent = FALSE;
	description = "What's it like with the militia?";
};


func int dia_wulfgar_aboutmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Wulfgar_AboutMiliz_15_00");	//What's it like with the militia?
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_01");	//Lord Andre is our commander now.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_02");	//The militia used to report to the governor. (laughs) He had no idea what we do here.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_03");	//But Lord Andre knows what he's doing. He takes good care of the men.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_04");	//Everyone who starts here gets some decent armor and a good weapon.
	AI_Output(self,other,"DIA_Wulfgar_AboutMiliz_04_05");	//And there are bonuses if you've done a good job. He pays a bounty for every criminal captured.
};


instance DIA_WULFGAR_CANYOUTRAIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 4;
	condition = dia_wulfgar_canyoutrain_condition;
	information = dia_wulfgar_canyoutrain_info;
	permanent = FALSE;
	description = "Can you also train me in sword fighting?";
};


func int dia_wulfgar_canyoutrain_condition()
{
	if(Npc_KnowsInfo(other,dia_wulfgar_hallo) && (other.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_canyoutrain_info()
{
	AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_00");	//Can you also train me in sword fighting?
	AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_01");	//Lord Andre has ordered that we train everyone who is in a position to defend the city.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_02");	//However, that isn't true for mercenaries. Beat it.
	}
	else
	{
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_03");	//But that's only true for combat training. All other kinds of training are reserved for the militia.
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_04");	//Can you at least halfway handle a weapon?
		AI_Output(other,self,"DIA_Wulfgar_CanYouTrain_15_05");	//I think so...
		AI_Output(self,other,"DIA_Wulfgar_CanYouTrain_04_06");	//(sighs) All right - you can start when you're ready.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Wulfgar, the city guardsman, can teach me one-handed and two-handed fighting.");
		WULFGAR_TEACH1H = TRUE;
	};
};


instance DIA_WULFGAR_ADVANTAGE(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 5;
	condition = dia_wulfgar_advantage_condition;
	information = dia_wulfgar_advantage_info;
	permanent = FALSE;
	description = "What are the advantages of one or two-handed weapons?";
};


func int dia_wulfgar_advantage_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_advantage_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Advantage_15_00");	//What are the advantages of one or two-handed weapons?
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_01");	//Quite simple. With a one-handed weapon, you're faster. That can be a considerable advantage in battle.
	AI_Output(self,other,"DIA_Wulfgar_Advantage_04_02");	//Two-handed weapons are more ponderous. You have to fight with foresight - but you do a lot more damage when you hit.
};


instance DIA_WULFGAR_HOWTOBEGIN(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 6;
	condition = dia_wulfgar_howtobegin_condition;
	information = dia_wulfgar_howtobegin_info;
	permanent = FALSE;
	description = "Where should I start? With one-handed or two-handed weapons?";
};


func int dia_wulfgar_howtobegin_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wulfgar_howtobegin_info()
{
	AI_Output(other,self,"DIA_Wulfgar_HowToBegin_15_00");	//Where should I start? With one-handed or two-handed weapons?
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_01");	//That's entirely up to you.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_02");	//If you specialize in only one type of weapon, you automatically learn the other at the same time.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_03");	//If, for instance, you are good at fighting with one-handed swords, but still a beginner with two-handed weapons...
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_04");	//... your two-handed skills will go up as well whenever you train with a one-hander.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_05");	//In that case, the training is more exhausting than if you train with both types of weapons.
	AI_Output(self,other,"DIA_Wulfgar_HowToBegin_04_06");	//Just start and you'll soon see what I'm talking about.
};


instance DIA_WULFGAR_TEACH(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 7;
	condition = dia_wulfgar_teach_condition;
	information = dia_wulfgar_teach_info;
	permanent = TRUE;
	description = "Let's begin with the training.";
};


func int dia_wulfgar_teach_condition()
{
	if((WULFGAR_TEACH1H == TRUE) || (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_wulfgar_teach_info()
{
	AI_Output(other,self,"DIA_Wulfgar_Teach_15_00");	//Let's begin with the training.
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wulfgar_Add_04_00");	//I don't train mercenaries!
	}
	else
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Wulfgar_Add_04_01");	//Of course, reverend.
		};
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_back()
{
	Info_ClearChoices(dia_wulfgar_teach);
};

func void dia_wulfgar_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};

func void dia_wulfgar_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75))
	{
		Info_ClearChoices(dia_wulfgar_teach);
		Info_AddChoice(dia_wulfgar_teach,DIALOG_BACK,dia_wulfgar_teach_back);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_wulfgar_teach_2h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_wulfgar_teach_2h_5);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_wulfgar_teach_1h_1);
		Info_AddChoice(dia_wulfgar_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_wulfgar_teach_1h_5);
	};
};


instance DIA_WULFGAR_ALSMIL(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 1;
	condition = dia_wulfgar_alsmil_condition;
	information = dia_wulfgar_alsmil_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_alsmil_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_wulfgar_alsmil_info()
{
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_00");	//So Lord Andre accepted you!
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_01");	//I expect you to come here and train regularly.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_02");	//Ruga will train you in the art of the crossbow and Mortis will help you to increase your strength.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_03");	//But the most important thing is for you to learn to handle your sword properly.
	AI_Output(self,other,"DIA_Wulfgar_AlsMil_04_04");	//I'll make a good fighter of you yet!
};


instance DIA_WULFGAR_BONUS(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 2;
	condition = dia_wulfgar_bonus_condition;
	information = dia_wulfgar_bonus_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wulfgar_bonus_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,2,6,54))
	{
		return TRUE;
	};
};

func void dia_wulfgar_bonus_info()
{
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_00");	//Out and about so early? I'm usually alone at this time of day. But since you're already here, you might as well learn something.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_01");	//So pay attention. You can deceive some opponents if you dodge their blows and attack at the right moment.
	AI_Output(self,other,"DIA_Wulfgar_Bonus_04_02");	//Remember that in your next fight!
	b_raisefighttalent(other,NPC_TALENT_1H,2);
	PrintScreen(PRINT_LEARN1H,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_WULFGAR_PICKPOCKET(C_INFO)
{
	npc = mil_312_wulfgar;
	nr = 900;
	condition = dia_wulfgar_pickpocket_condition;
	information = dia_wulfgar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wulfgar_pickpocket_condition()
{
	return c_beklauen(58,80);
};

func void dia_wulfgar_pickpocket_info()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_BACK,dia_wulfgar_pickpocket_back);
	Info_AddChoice(dia_wulfgar_pickpocket,DIALOG_PICKPOCKET,dia_wulfgar_pickpocket_doit);
};

func void dia_wulfgar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

func void dia_wulfgar_pickpocket_back()
{
	Info_ClearChoices(dia_wulfgar_pickpocket);
};

