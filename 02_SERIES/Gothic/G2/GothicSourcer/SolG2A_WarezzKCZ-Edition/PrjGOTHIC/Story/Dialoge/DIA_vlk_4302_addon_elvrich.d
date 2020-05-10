
instance DIA_ADDON_ELVRICH_EXIT(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 999;
	condition = dia_addon_elvrich_exit_condition;
	information = dia_addon_elvrich_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_elvrich_exit_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ELVRICH_PICKPOCKET(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 900;
	condition = dia_addon_elvrich_pickpocket_condition;
	information = dia_addon_elvrich_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_elvrich_pickpocket_condition()
{
	return c_beklauen(62,110);
};

func void dia_addon_elvrich_pickpocket_info()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_BACK,dia_addon_elvrich_pickpocket_back);
	Info_AddChoice(dia_addon_elvrich_pickpocket,DIALOG_PICKPOCKET,dia_addon_elvrich_pickpocket_doit);
};

func void dia_addon_elvrich_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};

func void dia_addon_elvrich_pickpocket_back()
{
	Info_ClearChoices(dia_addon_elvrich_pickpocket);
};


instance DIA_ADDON_ELVRICH_BANDITSTHERE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_banditsthere_condition;
	information = dia_addon_elvrich_banditsthere_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_elvrich_banditsthere_noperm;

func int dia_addon_elvrich_banditsthere_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_banditsthere_info()
{
	if(Npc_IsDead(bdt_10307_addon_rangerbandit_m) && Npc_IsDead(bdt_10308_addon_rangerbandit_l) && Npc_IsDead(bdt_10309_addon_rangerbandit_l) && Npc_IsDead(bdt_10310_addon_rangerbandit_m))
	{
		AI_Output(self,other,"DIA_Addon_Elvrich_BanditsThere_04_00");	//Thank goodness. The bandits are done for. You have saved my life.
		DIA_ADDON_ELVRICH_BANDITSTHERE_NOPERM = TRUE;
		self.aivar[AIV_NOFIGHTPARKER] = FALSE;
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ELVRICH_WER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wer_condition;
	information = dia_addon_elvrich_wer_info;
	description = "Who are you?";
};


func int dia_addon_elvrich_wer_condition()
{
	return TRUE;
};

func void dia_addon_elvrich_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_01");	//My name is Elvrich. I come from town.
	if(MIS_THORBEN_BRINGELVRICHBACK == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Elvrich_Wer_15_02");	//Master Thorben told me that you had disappeared.
	};
	AI_Output(self,other,"DIA_Addon_Elvrich_Wer_04_03");	//Those lowly scum dragged me off here and were keeping me prisoner.
};


instance DIA_ADDON_ELVRICH_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_missingpeople_condition;
	information = dia_addon_elvrich_missingpeople_info;
	description = "Lots of people are missing in town.";
};


func int dia_addon_elvrich_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_MissingPeople_15_00");	//Lots of people are missing in town.
	AI_Output(self,other,"DIA_Addon_Elvrich_MissingPeople_04_01");	//I don't know anything about missing people. I can only tell you what happened to ME.
};


instance DIA_ADDON_ELVRICH_WHATEXACTLY(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whatexactly_condition;
	information = dia_addon_elvrich_whatexactly_info;
	description = "What exactly happened to you?";
};


func int dia_addon_elvrich_whatexactly_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_wer))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whatexactly_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_15_00");	//What exactly happened to you?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_01");	//I was on my way to the rendezvous I had set up with my girl.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_02");	//Her name is Lucia. We had been planning to get away to the mountains. Away from the town and all those who live there.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_03");	//I had just arrived at the meeting point when suddenly some of these bandits sprang out from the underbrush and captured us both.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_04_04");	//I put up a fight, of course, but to no avail. There were just too many of them. You didn't happen to see them?
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"What did the bandits want with you?",dia_addon_elvrich_whatexactly_want);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Tell me about Lucia.",dia_addon_elvrich_whatexactly_lucia);
};

func void dia_addon_elvrich_whatexactly_want()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Want_15_00");	//What did the bandits want with you?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Want_04_01");	//Sometimes I could overhear them at night. I didn't get everything, but I think they wanted to make us slaves.
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Where were they going to take you?",dia_addon_elvrich_whatexactly_pirates);
};

func void dia_addon_elvrich_whatexactly_pirates()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Pirates_15_00");	//Where were they going to take you?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_01");	//To a place somewhere here, on the island of Khorinis. But I think one can't get there without a ship.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_02");	//They brought me to a mooring place on the coast. Some pirates were camped out there.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_03");	//One of the bandits approached the pirates to negotiate. They were having a fierce argument.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_04");	//I think that the bandit wanted the pirates to ferry him somewhere, along with me.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_05");	//But the pirates wouldn't have it. So the bandits withdrew, and we've been sitting around here ever since.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Pirates_04_06");	//They seemed to be rather at a loss. And then you came.
	ELVRICH_SCKNOWSPIRATS = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Elvrich, the apprentice of Thorben the carpenter from Khorinis, was kidnapped by bandits. The pirates seem to be in cahoots with the bandits.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Pirates in Khorinis?",dia_addon_elvrich_whatexactly_here);
	Info_AddChoice(dia_addon_elvrich_whatexactly,"Where's the pirates' mooring place?",dia_addon_elvrich_whatexactly_pirat);
};

func void dia_addon_elvrich_whatexactly_here()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_Here_15_00");	//Pirates in Khorinis?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_01");	//I don't know very much about them. I first clapped eyes on one of them at the mooring place.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_02");	//They always stay in the background. Every single one of them is a wanted criminal in Khorinis.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_Here_04_03");	//They're afraid of the gallows. That's why you're never going to meet one of them in town.
};

func void dia_addon_elvrich_whatexactly_lucia()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_lucia_15_00");	//Tell me about Lucia.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_lucia_04_01");	//A girl from the harbor district. She used to work for that horrible Bromor. She's very pretty.
};

func void dia_addon_elvrich_whatexactly_pirat()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhatExactly_pirat_15_00");	//Where's the pirates' mooring place?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_01");	//Not far from the harbor of Khorinis.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_02");	//When you stand on the quay and look out to sea, all you need to do is get a boat and go to the right, along the coast.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhatExactly_pirat_04_03");	//The first small bay you come across is the mooring place I was talking about.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"To get to the pirates' mooring one has to go to the harbor of Khorinis. If you stand on the quay wall and look towards the sea, you have to swim to the right along the coast.");
	Info_AddChoice(dia_addon_elvrich_whatexactly,DIALOG_BACK,dia_addon_elvrich_whatexactly_back);
};

func void dia_addon_elvrich_whatexactly_back()
{
	Info_ClearChoices(dia_addon_elvrich_whatexactly);
};


instance DIA_ADDON_ELVRICH_BROMOR(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_bromor_condition;
	information = dia_addon_elvrich_bromor_info;
	description = "Bromor says Lucia walked off with a golden dish...";
};


func int dia_addon_elvrich_bromor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_bromor_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_Bromor_15_00");	//Bromor says Lucia walked off with a golden dish...
	AI_Output(self,other,"DIA_Addon_Elvrich_Bromor_04_01");	//Well. If Lucia really stole from Bromor, the bandits will certainly have taken the thing from her.
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Bromor's golden bowl is probably now in possession of the bandits in the northern woods behind Sekob's farm.");
};


instance DIA_ADDON_ELVRICH_WHEREISLUCIA(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_whereislucia_condition;
	information = dia_addon_elvrich_whereislucia_info;
	description = "Where's Lucia now?";
};


func int dia_addon_elvrich_whereislucia_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_LUCIASLETTER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_whereislucia_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WhereIsLucia_15_00");	//Where's Lucia now?
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_01");	//We parted ways at the big crossroads in front of Onar's farm.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_02");	//The bandits dragged Lucia off to the woods behind Sekob's farm.
	AI_Output(self,other,"DIA_Addon_Elvrich_WhereIsLucia_04_03");	//May Innos protect her.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia was dragged off by the bandits to the woods behind Sekob's farm somewhere in the north.");
	SC_KNOWSLUCIACAUGHTBYBANDITS = TRUE;
};


instance DIA_ADDON_ELVRICH_FERNANDOSWAFFEN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_fernandoswaffen_condition;
	information = dia_addon_elvrich_fernandoswaffen_info;
	description = "Did the bandits who held you captive receive a shipment of weapons?";
};


func int dia_addon_elvrich_fernandoswaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_fernandoswaffen_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_FernandosWaffen_15_00");	//Did the bandits who held you captive receive a shipment of weapons?
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_01");	//Oh yes. So many that they could barely carry them.
	AI_Output(self,other,"DIA_Addon_Elvrich_FernandosWaffen_04_02");	//They took the whole kaboodle and disappeared towards Sekob's farm.
	b_giveplayerxp(XP_AMBIENT);
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"The trail leads me to the woods behind Sekob's farm somewhere in the north. They say there are bandits there who have received a lot of weapons.");
};


instance DIA_ADDON_ELVRICH_LUCIALETTER(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 4;
	condition = dia_addon_elvrich_lucialetter_condition;
	information = dia_addon_elvrich_lucialetter_info;
	description = "I found a letter from your Lucia.";
};


func int dia_addon_elvrich_lucialetter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly) && Npc_HasItems(other,itwr_luciasloveletter_addon))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_lucialetter_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_LuciaLetter_15_00");	//I found a letter from your Lucia.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_01");	//(excited) What? Give it here!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_02");	//(desperate) NO! I don't believe this. No. I just can't believe it.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_03");	//(desperate) She can't just leave me behind like this.
	AI_Output(self,other,"DIA_Addon_Elvrich_LuciaLetter_04_04");	//(desperate) Take this letter back. I don't want it. I firmly believe that she's going to come back to me some day.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Elvrich doesn't want to believe that Lucia went with the bandits voluntarily. He still hopes for her return, in spite of the farewell letter she wrote him.");
	b_giveplayerxp(XP_ADDON_LUCIASLETTER);
	MIS_LUCIASLETTER = LOG_SUCCESS;
};


instance DIA_ADDON_ELVRICH_WASNUN(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_wasnun_condition;
	information = dia_addon_elvrich_wasnun_info;
	permanent = FALSE;
	description = "You should get yourself back to town in a hurry!";
};


func int dia_addon_elvrich_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_elvrich_whereislucia))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_wasnun_info()
{
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_00");	//You should get yourself back to town in a hurry!
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_01");	//What else would I be doing? I'm going straight back to my Master Thorben.
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_02");	//Will you go look for the bandits?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_03");	//Well, yes, I think so...
	AI_Output(self,other,"DIA_Addon_Elvrich_WasNun_04_04");	//If you find Lucia, get her safely back to town, will you?
	AI_Output(other,self,"DIA_Addon_Elvrich_WasNun_15_05");	//I'll see what I can do.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich has gone back to the master carpenter Thorben.");
	ELVRICH_GOESBACK2THORBEN = TRUE;
	Npc_ExchangeRoutine(self,"BACKINTHECITY");
	EquipItem(self,itmw_1h_bau_mace);
};


instance DIA_ADDON_ELVRICH_PERM(C_INFO)
{
	npc = vlk_4302_addon_elvrich;
	nr = 5;
	condition = dia_addon_elvrich_perm_condition;
	information = dia_addon_elvrich_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_elvrich_perm_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && Npc_IsInState(self,zs_talk) && (MIS_LUCIASLETTER != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_elvrich_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Elvrich_PERM_04_00");	//Thanks for saving me!
};

