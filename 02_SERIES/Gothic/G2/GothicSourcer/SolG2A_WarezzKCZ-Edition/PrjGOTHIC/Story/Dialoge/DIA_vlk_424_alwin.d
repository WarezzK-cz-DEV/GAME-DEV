
instance DIA_ALWIN_EXIT(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 999;
	condition = dia_alwin_exit_condition;
	information = dia_alwin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alwin_exit_condition()
{
	return TRUE;
};

func void dia_alwin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALWIN_PICKPOCKET(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 900;
	condition = dia_alwin_pickpocket_condition;
	information = dia_alwin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alwin_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_alwin_pickpocket_info()
{
	Info_ClearChoices(dia_alwin_pickpocket);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_BACK,dia_alwin_pickpocket_back);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_PICKPOCKET,dia_alwin_pickpocket_doit);
};

func void dia_alwin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alwin_pickpocket);
};

func void dia_alwin_pickpocket_back()
{
	Info_ClearChoices(dia_alwin_pickpocket);
};


instance DIA_ALWIN_SHEEP(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 3;
	condition = dia_alwin_sheep_condition;
	information = dia_alwin_sheep_info;
	permanent = FALSE;
	description = "Are those your sheep?";
};


func int dia_alwin_sheep_condition()
{
	return TRUE;
};

func void dia_alwin_sheep_info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Are those your sheep?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//The only one that belongs to me is the one that answers to the name of Lucy. (laughs) That's my wife - Lucy.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//The sheep belong to the militia. All the sheep they collect from the farmers they bring to me.
};


instance DIA_ALWIN_FELLAN(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellan_condition;
	information = dia_alwin_fellan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alwin_fellan_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellan_info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Boy, that lunatic's hammering is wearing me down.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//Who are you talking about?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Can't you hear that hammering? Who do you think hammers all day long in the harbor district?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//I mean that lunatic Fellan. He takes the hammer to his hut every day.
};


instance DIA_ALWIN_FELLANRUNNING(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellanrunning_condition;
	information = dia_alwin_fellanrunning_info;
	permanent = FALSE;
	description = "I could take care of Fellan...";
};


func int dia_alwin_fellanrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellanrunning_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//I could take care of Fellan...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//You want to help me? What's in it for you?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//You tell me.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Oh, that's how it is! All right - if you can get him to stop hammering, I'll pay you 25 gold pieces.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//But I'll tell you one thing right now - you can't talk to the guy. He's nuts. The only thing that will help is a few decent punches!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"Alwin wants me to get Fellan to stop hammering. It doesn't seem appropriate to kill him.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"I'll see what I can do...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"If I beat him up, I'll just get into trouble with the militia...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//I'll see what I can do...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//You can think about it. Remember, I'll pay you 25 gold coins.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//If I beat him up, I'll just get into trouble with the militia...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Down here at the harbor, no one pays much attention to brawls...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//But if you steal around here, or mess with the sheep, you'll be in trouble.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "Fellan will hammer no longer.";
};


func int dia_alwin_fellansuccess_condition()
{
	if((MIS_ATTACKFELLAN == LOG_RUNNING) && ((FELLANGESCHLAGEN == TRUE) || Npc_IsDead(fellan)))
	{
		return TRUE;
	};
};

func void dia_alwin_fellansuccess_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Fellan will hammer no longer.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Hear that? No more hammering. At last. I thought the fellow would never quit.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//You've done me a huge favor. You know what, I'll give you 30 gold pieces.
		b_giveinvitems(self,other,itmi_gold,30);
		MIS_ATTACKFELLAN = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		MIS_ATTACKFELLAN = LOG_FAILED;
	};
};


instance DIA_ALWIN_ENDLOS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 8;
	condition = dia_alwin_endlos_condition;
	information = dia_alwin_endlos_info;
	permanent = TRUE;
	description = "And, how are the sheep?";
};


func int dia_alwin_endlos_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_sheep))
	{
		return TRUE;
	};
};

func void dia_alwin_endlos_info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//And, how are the sheep?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Fellan's hammering is going to drive them crazy. One of these days they'll go completely to pieces.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//The sheep eat and get fatter and fatter. Just like my wife. HAHAHA (laughs loudly)
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//I'll probably have to slaughter one of them. For the last meal!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//For what?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//For the mercenary who murdered the paladin. Of course he'll be executed.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//I just have to decide which of the creatures will go to the slaughtering-block.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Lucy is really lucky to be alive.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//I thought you said Lucy was your wife.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Right, but I also called the sheep Lucy. I mean the sheep that was meant for the last meal for that Bennet.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//But that all worked out. Lucy will be glad.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//As time goes by, watching the sheep eat gets to be pretty boring.
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//I'm saying goodbye to them. Lord Hagen has ordered that all the sheep are to serve as provisions for his army.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Well, then at least I'll have more time for my wife.
	};
};

