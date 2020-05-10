
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Beat it, convict! Canthar told me what a nasty bastard you are!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//I am Hakon, the weapons dealer.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//Every man should carry a weapon these days. Especially when venturing outside of the city walls.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Hakon sells weapons at the marketplace.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Show me your wares.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Show me your wares.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//It is an honor to me that a representative of our holy church should show an interest in my wares.
	};
};


instance DIA_ADDON_HAKON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_addon_hakon_missingpeople_condition;
	information = dia_addon_hakon_missingpeople_info;
	description = "What do you know about the disappearances of the citizens of Khorinis?";
};


func int dia_addon_hakon_missingpeople_condition()
{
	if(SC_HEAREDABOUTMISSINGPEOPLE == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hakon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Hakon_MissingPeople_15_00");	//What do you know about the disappearances of the citizens of Khorinis?
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_01");	//I have seen many pass through the eastern city gate.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_02");	//Some of those who came I had never seen before in my life, and many of those who went out never came back.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_03");	//But what happened the other day was really quite strange.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_04");	//There was this fellow who came here - I think his name is Joe. He bragged that he would soon come into some serious money.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_05");	//He claimed that he knew how to get into one of the city towers where the militia keep their arms.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_06");	//I haven't seen him since, even though I used to bump into him around the same time every day.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_07");	//I reported this to the militia. I thought that maybe he'd been caught and throughn into the dungeon.
	AI_Output(self,other,"DIA_Addon_Hakon_MissingPeople_12_08");	//But Lord Andre had no idea what I was talking about. He didn't even know the fellow.
	Log_CreateTopic(TOPIC_ADDON_JOE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_JOE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_JOE,"Halon, a trader from Khorinis, says that a man named Joe has simply vanished without a trace. He claims that Joe knows how to get into one of the city towers where the militia keep their arms.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "Tell me more about the area around the city.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Tell me more about the area around the city.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//It's gotten bloody dangerous out there.
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Because of the bandits, for one thing, and also on account of wild beasts.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Even the animals don't seem to get enough to eat in these crappy times.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//They're venturing closer to the city all the time.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "Do you know anything about the paladins?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Do you know anything about the paladins?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Yes! Those guys are ruining my business!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//All you can buy in this entire town is a short sword, at most.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//They've helped themselves to anything that's longer than a foot and a half.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(sarcastically) In return, I now get to live in the hotel free of charge - ha!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "Where do you get your weapons from?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Where do you get your weapons from?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Nowhere! Harad has been my supplier up to now.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Harad the smith has been my supplier up to now.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//Now all he does is make stuff for the paladins.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//He works for those guys day and night like a madman, without pay. He thinks it's his duty.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//All I can offer you now is my remaining stock...
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "Harad told me about the attack by bandits...";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Harad told me about the attack by bandits...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Oh? And?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//He'll give me his approval to be accepted as an apprentice if I hunt down the bandits.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(laughs) Good old Harad. That must be his way of saying he's sorry that he can't produce any weapons for me at the moment.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "What do you know about the bandits?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//What do you know about the bandits?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//What do I know about them? They robbed me on my way to the city!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//And I'm not the only one. They've been up to their tricks for quite a while.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//The militia tried to track them down, but without any success.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"Hakon the weapons dealer was robbed by bandits outside the city.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "I'll deal with it...";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//I'll deal with it...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//What, YOU want to take on the bandits? By yourself? You're quite a good fighter, huh?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//How much is the matter worth to you?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(slyly) You want to get in Harad's good books, don't you?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//I don't think I should have to pay you for this...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//That's a dangerous business.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//Well, it's all right with me. I'll pay you 100 gold pieces if you defeat the bandits.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "Do you know who in the militia took part in the search?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Do you know who of the militia took part in the search?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//The fellow's name is Pablo. He and a few others went looking for the bandits. But they didn't find them.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//Do you know where I can find Pablo?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//He patrols around the city. You'll find him either at the temple square or in the lower part of town.
	b_logentry(TOPIC_HAKONBANDITEN,"Pablo, the city guardsman, was involved in the fruitless search for the bandits.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "Where did they hold you up?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Where did they hold you up?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//Near Akil's farm. Just go out the city gate from here and follow the road to the right.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//After a while, you'll get to a few steps. The bastards came from there. I bet they have their hideout back there in the woods.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "I took care of the bandits.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//I took care of the bandits.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Really? Anyone could say that. Do you have proof?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(sighs) Should I go back and cut off their heads?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(hastily) No - I don't think that will be necessary. I believe you.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//You have done the merchants and the city a great service.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Harad will be content - I think.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//Here is the money you were promised.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "Where did you get those mining shares you're selling?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Where did you get those mining shares you're selling?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Sorry, but I can't tell you. It's too dangerous for me.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//There you are again!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Harad has finally finished that damn assignment for the paladins.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//That means that I can now offer you some new weapons. Are you interested?
};

