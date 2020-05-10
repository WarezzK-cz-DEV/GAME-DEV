
instance DIA_BRIAN_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_exit_condition;
	information = dia_brian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_PICKPOCKET(C_INFO)
{
	npc = vlk_457_brian;
	nr = 900;
	condition = dia_brian_pickpocket_condition;
	information = dia_brian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_brian_pickpocket_condition()
{
	return c_beklauen(55,100);
};

func void dia_brian_pickpocket_info()
{
	Info_ClearChoices(dia_brian_pickpocket);
	Info_AddChoice(dia_brian_pickpocket,DIALOG_BACK,dia_brian_pickpocket_back);
	Info_AddChoice(dia_brian_pickpocket,DIALOG_PICKPOCKET,dia_brian_pickpocket_doit);
};

func void dia_brian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brian_pickpocket);
};

func void dia_brian_pickpocket_back()
{
	Info_ClearChoices(dia_brian_pickpocket);
};


instance DIA_BRIAN_HALLO(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_hallo_condition;
	information = dia_brian_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_brian_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_brian_hallo_info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//New in the city, huh? I'm Brian! I'm Master Harad's apprentice.
};


instance DIA_BRIAN_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_aboutlehrling_condition;
	information = dia_brian_aboutlehrling_info;
	permanent = FALSE;
	description = "What's it like to be the smith's apprentice?";
};


func int dia_brian_aboutlehrling_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_brian_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//What's it like to be the smith's apprentice?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Why do you ask? Do you want to be my successor?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Maybe.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Why not... I'm almost done with my apprenticeship, and then I'm going to leave the city.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//But not because of Harad. He is a good master - I have learned a lot from him.
};


instance DIA_BRIAN_WHYLEAVE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_whyleave_condition;
	information = dia_brian_whyleave_info;
	permanent = FALSE;
	description = "Why do you want to leave the town?";
};


func int dia_brian_whyleave_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_aboutlehrling))
	{
		return TRUE;
	};
};

func void dia_brian_whyleave_info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Why do you want to leave the town?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Because the people here are getting on my nerves! Above all the other masters.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//I still remember what a fuss it was getting accepted as an apprentice with Harad.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Really, every one of those jokers had something to say about it.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//I want to decide for myself who I can or can't take as an apprentice.
};


instance DIA_BRIAN_OTHERMASTERS(C_INFO)
{
	npc = vlk_457_brian;
	nr = 1;
	condition = dia_brian_othermasters_condition;
	information = dia_brian_othermasters_info;
	permanent = FALSE;
	description = "Who are the other masters?";
};


func int dia_brian_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_whyleave) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_brian_othermasters_info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//Who are the other masters?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//Well, there's Thorben the carpenter, Bosper the bowmaker, Constantino the alchemist and Matteo.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//He sells armor, but first of all he's a merchant.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//All the masters have their houses here on the street.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//And Constantino's shop is in the underpass to the temple.
};


instance DIA_BRIAN_ABOUTHARAD(C_INFO)
{
	npc = vlk_457_brian;
	nr = 2;
	condition = dia_brian_aboutharad_condition;
	information = dia_brian_aboutharad_info;
	permanent = FALSE;
	description = "Tell me more about Master Harad.";
};


func int dia_brian_aboutharad_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_aboutlehrling))
	{
		return TRUE;
	};
};

func void dia_brian_aboutharad_info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Tell me more about Master Harad.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//He's not in a very good mood right now.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//A few days ago, the paladins came and ordered him to forge some swords for them.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//They've even forbidden him to sell swords to anyone else.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Now he slaves day and night to finish the job as quickly as possible.
};


instance DIA_BRIAN_NEEDWEAPONS(C_INFO)
{
	npc = vlk_457_brian;
	nr = 4;
	condition = dia_brian_needweapons_condition;
	information = dia_brian_needweapons_info;
	permanent = FALSE;
	description = "Can I buy weapons from you?";
};


func int dia_brian_needweapons_condition()
{
	return TRUE;
};

func void dia_brian_needweapons_info()
{
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Can I buy weapons from you?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Not really. I'm merely an assistant.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//The weapons that are made in this smithy are collected by the militia and taken to the towers, where they are stored.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//But if it has anything to do with forging, maybe I can help you.
};


var int brian_trade_einmal;

instance DIA_BRIAN_WASKAUFEN(C_INFO)
{
	npc = vlk_457_brian;
	nr = 4;
	condition = dia_brian_waskaufen_condition;
	information = dia_brian_waskaufen_info;
	permanent = TRUE;
	description = "What can I get from you?";
	trade = TRUE;
};


func int dia_brian_waskaufen_condition()
{
	if(Npc_KnowsInfo(other,dia_brian_needweapons))
	{
		return TRUE;
	};
};

func void dia_brian_waskaufen_info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//What can I get from you?
	b_clearsmithinv(self);
	b_givetradeinv(self);
	if(Npc_IsDead(harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//If I still have a couple of steel billets, you're welcome to them. That's all, I'm afraid.
		if(MIS_JACK_NEWLIGHTHOUSEOFFICER == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//Since Harad isn't here any more, the militia is keeping an eye on me.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//I'm not allowed to continue running the smithy. They're afraid I'll just sell the whole thing and skedaddle.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_05");	//I can sell you some steel billets.
	};
	if(BRIAN_TRADE_EINMAL == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Brian, Harad's assistant, sells steel billets.");
		BRIAN_TRADE_EINMAL = TRUE;
	};
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_BRIAN_TEACH_ORE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 5;
	condition = dia_brian_teach_ore_condition;
	information = dia_brian_teach_ore_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_brian_teach_ore_condition()
{
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		return TRUE;
	};
};

func void dia_brian_teach_ore_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		Info_ClearChoices(dia_brian_teach_ore);
		Info_AddChoice(dia_brian_teach_ore,DIALOG_BACK,dia_brian_teach_ore_back);
	};
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		Info_AddChoice(dia_brian_teach_ore,b_buildlearnstring("Ore extraction - Miner",b_getlearncosttalent(other,NPC_TALENT_OREMASTER,ORMASTERY_1)),dia_brian_teach_ore_ormastery_1);
	};
};

func void dia_brian_teach_ore_back()
{
	Info_ClearChoices(dia_brian_teach_ore);
};

func void dia_brian_teach_ore_ormastery_1()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_1);
	Info_ClearChoices(dia_brian_teach_ore);
};


instance DIA_BRIAN_KAP3_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap3_exit_condition;
	information = dia_brian_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brian_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 8;
	condition = dia_brian_repairnecklace_condition;
	information = dia_brian_repairnecklace_info;
	permanent = FALSE;
	description = "Can you repair jewelry?";
};


func int dia_brian_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_brian_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Can you repair jewelry?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//I'm just an assistant, I'm glad if I'm even allowed to make a dagger.
	if(Npc_IsDead(harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Jewelry? You'll have to ask the master.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BRIAN_KAP4_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap4_exit_condition;
	information = dia_brian_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brian_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_KAP5_EXIT(C_INFO)
{
	npc = vlk_457_brian;
	nr = 999;
	condition = dia_brian_kap5_exit_condition;
	information = dia_brian_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brian_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_brian_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRIAN_NEWLIGHTHOUSEOFFICER(C_INFO)
{
	npc = vlk_457_brian;
	nr = 51;
	condition = dia_brian_newlighthouseofficer_condition;
	information = dia_brian_newlighthouseofficer_info;
	description = "I heard that you are interested in Jack's old lighthouse.";
};


func int dia_brian_newlighthouseofficer_condition()
{
	if((KAPITEL == 5) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_brian_needweapons))
	{
		return TRUE;
	};
};

func void dia_brian_newlighthouseofficer_info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//I heard that you are interested in Jack's old lighthouse.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Jack is considering going back to sea. But his lighthouse would be unguarded then.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//But it should be clear to Jack that I'll make a smithy out of his lighthouse when he isn't there.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Is that a problem?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//(laughs) Not to me. I won't get Harad's smithy anyway. I've put that thought right out of my head.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Agreed. We'll meet at Jack's.
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_BRIAN_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_457_brian;
	nr = 8;
	condition = dia_brian_lighthousefree_condition;
	information = dia_brian_lighthousefree_info;
	permanent = TRUE;
	description = "So, what do you say?";
};


func int dia_brian_lighthousefree_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_brian_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//And, what do you say?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//Lawdy, what a mess. Jack won't recognize the place when I'm done with it.
};

