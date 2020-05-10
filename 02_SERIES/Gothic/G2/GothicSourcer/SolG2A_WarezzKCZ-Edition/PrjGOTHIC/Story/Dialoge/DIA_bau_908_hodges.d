
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Hello, I'm new here.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Don't take this the wrong way, but I'm really not in the mood for conversation - I'm totally wrecked.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//You're awfully busy, huh?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//You can say that again. Bennet makes so many weapons that I can hardly keep up with the polishing.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "What can you tell me about the farm?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//What can you tell me about the farm?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//This is Onar's farm.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//That big building is his house. He vacated a wing for the mercenaries.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//We farmers have had to bunk in the barn ever since.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(hastily) But it's all right with me, it's good that we have people who guard the farm.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//The building here is the kitchen.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//The kitchen is in the building with the smithy in front.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Maybe you'll be lucky and Thekla will have something for you to eat.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "What about the mercenaries?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//What about the mercenaries?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Onar hired them to keep the city militia off our backs.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//But they also guard the farm, the sheep and us farmers.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//So don't even think about stealing anything or rummaging around in somebody's chest.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//They're just waiting for a chance to knock you down.
};


instance DIA_HODGES_TEACH_ORE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 3;
	condition = dia_hodges_teach_ore_condition;
	information = dia_hodges_teach_ore_info;
	permanent = TRUE;
	description = "Can you teach me anything?";
};


func int dia_hodges_teach_ore_condition()
{
	if(PLAYER_TALENT_OREMASTER[1] == FALSE)
	{
		return TRUE;
	};
};

func void dia_hodges_teach_ore_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	if((PLAYER_TALENT_OREMASTER[0] == FALSE) || (PLAYER_TALENT_OREMASTER[1] == FALSE))
	{
		Info_ClearChoices(dia_hodges_teach_ore);
		Info_AddChoice(dia_hodges_teach_ore,DIALOG_BACK,dia_hodges_teach_ore_back);
	};
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		Info_AddChoice(dia_hodges_teach_ore,b_buildlearnstring("Learn ore extraction - Miner",b_getlearncosttalent(other,NPC_TALENT_OREMASTER,ORMASTERY_1)),dia_hodges_teach_ore_ormastery_1);
	}
	else if((PLAYER_TALENT_OREMASTER[1] == FALSE) && (PLAYER_TALENT_OREMASTER[0] == TRUE))
	{
		Info_AddChoice(dia_hodges_teach_ore,b_buildlearnstring("Learn ore extraction - Master",b_getlearncosttalent(other,NPC_TALENT_OREMASTER,ORMASTERY_2)),dia_hodges_teach_ore_ormastery_2);
	};
};

func void dia_hodges_teach_ore_back()
{
	Info_ClearChoices(dia_hodges_teach_ore);
};

func void dia_hodges_teach_ore_ormastery_1()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_1);
	Info_ClearChoices(dia_hodges_teach_ore);
};

func void dia_hodges_teach_ore_ormastery_2()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_2);
	Info_ClearChoices(dia_hodges_teach_ore);
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "Can I buy weapons from you?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Can I buy weapons from you?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//I don't have much. We take almost all the swords and axes into Onar's house.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "Why aren't you working?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Why aren't you working?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Haven't you heard yet? The paladins have arrested Bennet.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Bennet the smith has been arrested by the paladins in the city.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "What happened?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//What happened?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//Well, we were in the city to shop, when all of a sudden we heard a scream. Someone yelled: There they are, get them!
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//Boy, was I scared! I took to my heels and ran like the demons were after me.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Bennet was right behind me. I don't know what happened, but when I got outside the city, he had disappeared.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//I must have lost him in the city.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "So why was Bennet arrested?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//So why was Bennet arrested?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Murder! Bennet is supposed to have murdered a paladin. What nonsense. I was with him the whole time.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//So why don't you go to town and explain the whole thing?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//They'd stick me in the slammer as his accomplice. Naah, certainly not in the current situation.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Situation?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//You know, Onar and the city, that's bound to come to a bad end.
	b_logentry(TOPIC_RESCUEBENNET,"They say Bennet murdered a paladin. His apprentice Hodges says he's innocent, but he daren't enter the city.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "How did the mercenaries here on the farm react?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//How did the mercenaries here on the farm react?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Naturally, I don't know exactly what they're planning, but some of them are really pissed off.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//I can understand that.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//If it were up to them, they'd rather attack the city today than tomorrow to get Bennet out.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Talk to Lee, maybe there's something you can do.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

