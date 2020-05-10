
instance DIA_CONSTANTINO_EXIT(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 999;
	condition = dia_constantino_exit_condition;
	information = dia_constantino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_constantino_exit_condition()
{
	return TRUE;
};

func void dia_constantino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 900;
	condition = dia_constantino_pickpocket_condition;
	information = dia_constantino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_constantino_pickpocket_condition()
{
	return c_beklauen(59,90);
};

func void dia_constantino_pickpocket_info()
{
	Info_ClearChoices(dia_constantino_pickpocket);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_BACK,dia_constantino_pickpocket_back);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_PICKPOCKET,dia_constantino_pickpocket_doit);
};

func void dia_constantino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_constantino_pickpocket);
};

func void dia_constantino_pickpocket_back()
{
	Info_ClearChoices(dia_constantino_pickpocket);
};


instance DIA_CONSTANTINO_HALLO(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_hallo_condition;
	information = dia_constantino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_constantino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Constantino_Hallo_10_00");	//What do you want? I'm not giving anything away.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "I'm looking to become an apprentice.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//I'm looking to become an apprentice.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Really? And with whom are you going to sign up?
};


instance DIA_ADDON_CONSTANTINO_LESTERSKRAEUTER(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_addon_constantino_lesterskraeuter_condition;
	information = dia_addon_constantino_lesterskraeuter_info;
	description = "Can I sell you some herbs?";
};


func int dia_addon_constantino_lesterskraeuter_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == 0) && (MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0))
	{
		return TRUE;
	};
};

func void dia_addon_constantino_lesterskraeuter_info()
{
	AI_Output(other,self,"DIA_Addon_Constantino_LestersKraeuter_15_00");	//Can I sell you some herbs?
	AI_Output(self,other,"DIA_Addon_Constantino_LestersKraeuter_10_01");	//If you have any to offer...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	if(CONSTANTINO_FLAG == 1)
	{
		b_clearalchemyinv(self);
		if(CONSTANTINO_FLASKS > 0)
		{
			CreateInvItems(self,itmi_flask,CONSTANTINO_FLASKS);
		};
		CONSTANTINO_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
	if(CONSTANTINO_LOGPATCH1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Constantino sells alchemist supplies.");
		CONSTANTINO_LOGPATCH1 = TRUE;
	};
};


instance DIA_CONSTANTINO_BEIDIR(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_beidir_condition;
	information = dia_constantino_beidir_info;
	permanent = FALSE;
	description = "I want to sign up with you as an apprentice.";
};


func int dia_constantino_beidir_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_beidir_info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//I want to sign up with you as an apprentice.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//With ME? No! I have already had the dubious pleasure once of grappling with an apprentice. That's quite enough for me.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//I invested several years in his education, and in the end the poor fool up and poisoned himself.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Go sign up with one of the other masters!
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "I want to sign up with one of the other masters.";
};


func int dia_constantino_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_zustimmung_info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//I want to sign up with one of the other masters.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//You have come to ask my approval?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Hm - as far as I am concerned, you can sign up with whomever you like.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//Well, you're not going to get it! The things I've heard about you do not speak for you.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//I shall not vote for a criminal such as yourself to attain an honorable position in our town.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Until you have settled this matter with the commander of the city guard, my answer shall be no!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"Constantino will give his approval to my becoming an apprentice as long as I'm not accused of any crime in town.");
		CONSTANTINO_LOGPATCH2 = TRUE;
	};
};


instance DIA_CONSTANTINO_BRINGHERBS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_bringherbs_condition;
	information = dia_constantino_bringherbs_info;
	permanent = FALSE;
	description = "What will I have to do to become YOUR apprentice?";
};


func int dia_constantino_bringherbs_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_beidir) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_bringherbs_info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//What will I have to do to become YOUR apprentice?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(sighs) I couldn't bear yet ANOTHER dilettante on my conscience.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//There is a multitude of herbs out there. Used in different variations, they develop the most diverse effects.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//You probably don't even know half of them.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(sighs) Here - this is a list of the most important plants.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Bring me a plant of each kind, and I might reconsider taking you in as an apprentice.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"Constantino wants one plant of each type, otherwise he won't accept me as his apprentice.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "About the plants...";
};


func int dia_constantino_herbsrunning_condition()
{
	if(MIS_CONSTANTINO_BRINGHERBS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_herbsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//About the plants...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//If you cannot handle that by yourself, you won't be any good as an alchemist either!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"I see.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"I've got all the plants I was supposed to bring you!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//I've got all the plants I was supposed to bring you!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//What? You're pulling my leg, right?
	if(Npc_HasItems(hero,itwr_kraeuterliste) >= 1)
	{
		b_giveinvitems(other,self,itwr_kraeuterliste,1);
		Npc_RemoveInvItems(self,itwr_kraeuterliste,1);
	};
	AI_PrintScreen("11 Items given (Plants)",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itpl_mana_herb_01,1);
	Npc_RemoveInvItems(other,itpl_mana_herb_02,1);
	Npc_RemoveInvItems(other,itpl_mana_herb_03,1);
	Npc_RemoveInvItems(other,itpl_health_herb_01,1);
	Npc_RemoveInvItems(other,itpl_health_herb_02,1);
	Npc_RemoveInvItems(other,itpl_health_herb_03,1);
	Npc_RemoveInvItems(other,itpl_dex_herb_01,1);
	Npc_RemoveInvItems(other,itpl_strength_herb_01,1);
	Npc_RemoveInvItems(other,itpl_speed_herb_01,1);
	Npc_RemoveInvItems(other,itpl_temp_herb,1);
	Npc_RemoveInvItems(other,itpl_perm_herb,1);
	CreateInvItems(self,itpl_mana_herb_01,1);
	CreateInvItems(self,itpl_mana_herb_02,1);
	CreateInvItems(self,itpl_mana_herb_03,1);
	CreateInvItems(self,itpl_health_herb_01,1);
	CreateInvItems(self,itpl_health_herb_02,1);
	CreateInvItems(self,itpl_health_herb_03,1);
	CreateInvItems(self,itpl_dex_herb_01,1);
	CreateInvItems(self,itpl_strength_herb_01,1);
	CreateInvItems(self,itpl_speed_herb_01,1);
	CreateInvItems(self,itpl_temp_herb,1);
	CreateInvItems(self,itpl_perm_herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//By Adanos! It's all there all right.
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Who knows, maybe some day you could make a decent alchemist after all.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Constantino will accept me as his apprentice, as long as the other masters approve.");
	Info_ClearChoices(dia_constantino_herbsrunning);
};

func void dia_constantino_herbsrunning_running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//I see.
	Info_ClearChoices(dia_constantino_herbsrunning);
};


var int constantino_startguild;

instance DIA_CONSTANTINO_LEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_lehrling_condition;
	information = dia_constantino_lehrling_info;
	permanent = TRUE;
	description = "Can I become your apprentice now?";
};


func int dia_constantino_lehrling_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Can I become your apprentice now?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//As far as I am concerned, yes.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//All that matters to Harad is that you will be able to defend the city if it is attacked by orcs.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//And it looks like you've got him convinced of that.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//But he thinks you are a coward.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//But Harad claims he has never seen you before.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Bosper has been quite reluctant to comment on your qualities.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//I suppose he would like to take you on as an apprentice himself.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//But he still agreed in the end.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//To withhold one's approval for this reason is certainly not an honorable thing to do!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//But if all other masters approve, you won't need his vote.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//And Bosper doesn't know you yet.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Thorben is a very religious man.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//He has given you his blessing. That is a good sign.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//He will only give you his approval with the blessing of the gods.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Thorben does not know who you are.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//As for Matteo - he's singing your praises high and low.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Matteo says there's still something you owe him. If you want his vote you had better take care of that little matter.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Matteo says he has not yet talked to you about this.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Matteo says he has never seen you in his shop before.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//This means you have the approval of all masters!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//You now have the approval of four masters. That will suffice for you to be accepted as an apprentice.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Are you ready to begin your apprenticeship with me?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"I need to sleep on it first.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"Yes, Master.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//You need the approval of at least four masters in order to be able to start an apprenticeship in the lower part of town.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//This means that you should talk to all those who do not quite approve of you yet.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(irritated) No way! I have heard rumors that you stand accused as a criminal here in Khorinis!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//I shall not take you on as an apprentice until you have settled this matter with the commander of the city guard.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Yes, Master.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(sighs) All right then! I hope I'm not going to regret this decision.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//From this moment, you may consider yourself my apprentice.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	Npc_ExchangeRoutine(lothar,"START");
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Constantino has accepted me as his apprentice. I now have access to the upper quarter.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//I need to sleep on it first.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//All right! If you cannot really put your heart into this, you should choose a different calling.
	Info_ClearChoices(dia_constantino_lehrling);
};


var int constantino_milkommentar;
var int constantino_innoskommentar;

instance DIA_CONSTANTINO_ALSLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_alslehrling_condition;
	information = dia_constantino_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_constantino_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_CONSTANTINO) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_constantino_alslehrling_info()
{
	if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(irritated) I refuse to instruct you any further as long as you are accused of a crime in town.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Go to Lord Andre and set matters right again.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//So you have joined the militia? I've already heard about that.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Get yourself apprenticed in a hurry, and then up and join the militia? I'm not going to make it that easy for you.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//I expect you to stick to our agreement and bring me plants and mushrooms on a regular basis.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//If it's too much for you to work two jobs at once, you'll just have to sleep less!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//I see you have entered the service of Innos. I guess that means that, from now on, you cannot spare a lot of time just to fetch herbs for an old man.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Still, I consider it a great honor to have supported you on your way.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//If, in spite of your new duties, you should find the time to occupy yourself with alchemy, you can always be sure of a warm welcome here.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//What have you been up to?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//I expect more of my apprentice than just dropping in at my place once in a blue moon!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Did you at least bring me some mushrooms?
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//There you are again...
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_CONSTANTINO_AUFGABEN(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_aufgaben_condition;
	information = dia_constantino_aufgaben_info;
	permanent = FALSE;
	description = "What are my tasks?";
};


func int dia_constantino_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_aufgaben_info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//What are my tasks?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//I realize that I cannot expect a young man to spend all day indoors with me.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//From time to time, you shall bring me the plants I need. In return, I shall instruct you in the art of alchemy.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//You can buy the bottles from me. Most of the ingredients, however, you will have to get for yourself.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//And I expect you to behave properly as a citizen of this town.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "What plants am I supposed to bring?";
};


func int dia_constantino_mushrooms_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aufgaben))
	{
		return TRUE;
	};
};

func void dia_constantino_mushrooms_info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//What plants am I supposed to bring?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//I shall buy everything you bring me - and I'll pay the usual price.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//For mushrooms, however, I shall pay you a special price.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"I can sell mushrooms to Constantino for an especially good price.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "You wanted mushrooms...";
};


func int dia_constantino_mushroomsrunning_condition()
{
	if(MIS_CONSTANTINO_MUSHROOMS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_mushroomsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//You wanted mushrooms...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"I'm going to bring you some...",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Why are those things so important?",dia_constantino_mushroomsrunning_why);
	};
	if((Npc_HasItems(other,itpl_mushroom_01) > 0) || (Npc_HasItems(other,itpl_mushroom_02) > 0))
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"I've got a few...",dia_constantino_mushroomsrunning_sell);
	};
};

func void dia_constantino_mushroomsrunning_sell()
{
	var int dunkelpilz_dabei;
	dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,itpl_mushroom_01) > 0)
	{
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//I've got a few murky mushrooms here...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Ah! Those are the best! Well done! Here's your gold!
		dunkelpilz_dabei = TRUE;
		CONSTANTINO_DUNKELPILZCOUNTER = CONSTANTINO_DUNKELPILZCOUNTER + Npc_HasItems(other,itpl_mushroom_01);
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_01) * VALUE_MUSHROOM_01);
		b_giveinvitems(other,self,itpl_mushroom_01,Npc_HasItems(other,itpl_mushroom_01));
	};
	if(Npc_HasItems(other,itpl_mushroom_02) > 0)
	{
		if(dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//And here are some of the others...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//I've got a few mushrooms here!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//These are not quite as good as murky mushrooms, but I'll take them anyway.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itpl_mushroom_02) * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Npc_HasItems(other,itpl_mushroom_02));
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Why are those things so important?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//Even though you are my apprentice, I won't tell you everything.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//All right - I shall tell you, then. But you must keep it to yourself.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Murky mushrooms are full of magic energy. And every time you eat one, a little bit of this energy will accumulate in your body.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//Once you have eaten a sufficient amount of these mushrooms, your magic energy will increase...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//If I had told you that earlier, you would have gobbled up all the mushrooms yourself, wouldn't you?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//(sighs) Oh, man!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//You have already asked me that. (mischievously) Who knows, maybe some day I'll actually tell you...
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//I'm going to bring you some...
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Great! Bring me as many as you can find...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};


instance DIA_CONSTANTINO_ALCHEMY(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_alchemy_condition;
	information = dia_constantino_alchemy_info;
	permanent = FALSE;
	description = "Instruct me in the art of alchemy!";
};


func int dia_constantino_alchemy_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_alchemy_info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Instruct me in the art of alchemy!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//All right. Basics first.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Each potion is made of plants - they possess all kinds of powers.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//They do nothing but put all their power into growth - and modifying this power is what the art of alchemy is about.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//To prepare a potion at the alchemist's bench, you need a laboratory flask.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//You need to know the correct formulation and have the appropriate ingredients.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//There are quite a few formulations I could teach you.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Potions which restore your lost strength, and even potions which affect your strength permanently.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//You cannot learn everything at once.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino can teach me the art of alchemy.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "I'm looking for new recipes for potions.";
};


func int dia_constantino_newrecipes_condition()
{
	if((PLAYER_ISAPPRENTICE != APP_CONSTANTINO) && (PLAYER_ISAPPRENTICE > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void dia_constantino_newrecipes_info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//I'm looking for new recipes for potions.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//Do you have any previous experience with alchemy?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Yes, I do.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//Yet you are still alive... those aren't bad qualifications.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//I think I can tell you a few formulations. It depends, of course, on what you want to know.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Constantino can teach me the art of alchemy.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "What recipes can you teach me?";
};


func int dia_constantino_teach_condition()
{
	if(CONSTANTINO_TEACHALCHEMY == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_teach_info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//What recipes can you teach me?
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE) && (PLAYER_TALENT_ALCHEMY[15] == TRUE) && (PLAYER_TALENT_ALCHEMY[16] == TRUE))
		{
			AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//I'm sorry. There is nothing else I could teach you.
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//I know a few - make your own choice.
			Info_ClearChoices(dia_constantino_teach);
			Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
		};
	}
	else if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//I'm sorry. There is nothing else I could teach you.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//I know a few - make your own choice.
		Info_ClearChoices(dia_constantino_teach);
		Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Essence of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_constantino_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Extract of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_constantino_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixir of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_constantino_teach_health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixir of Life",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_constantino_teach_permhealth);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[15] == FALSE) && (PLAYER_ISAPPRENTICE == APP_CONSTANTINO))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Expert of Healing potions",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_CONST_HEAL)),dia_constantino_teach_potion_const_heal);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Essence of Mana",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_constantino_teach_mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Extract of Mana",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_constantino_teach_mana02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixir of Mana",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_constantino_teach_mana03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[16] == FALSE) && (PLAYER_ISAPPRENTICE == APP_CONSTANTINO))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Expert of Mana potions",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_CONST_MANA)),dia_constantino_teach_potion_const_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE)))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Elixir of Strength",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_constantino_teach_permstr);
	};
};

func void dia_constantino_teach_back()
{
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//The ingredients for an essence of healing are healing plants and meadow knotweed.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//To prepare a healing extract, you need healing herbs and meadow knotweed.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//Be sure to heat that extract very carefully.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//Creating an elixir of healing takes quite a bit of experience.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//You need healing roots and meadow knotweed. Take special care when heating it this time.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//The elixir of life! A rare brew. Not so much because of the effort - the potion actually isn't all that hard to make.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//But the ingredients are very rare. You need healing roots and king's sorrel.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//The essence of magic is the simplest of magic potions.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Take fire nettles and meadow knotweed and heat them slowly.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Since you can already prepare an essence of magic, with a little effort you should be able to produce an extract as well.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//You need to put the right kind of feeling into decocting that brew. Use fireweed and meadow knotweed for this potion.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//The elixir of strength! An excellent potion. You need the rare dragonroot and king's sorrel.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//When boiling the brew, don't let the bubbles get too big or you'll be in for a nasty surprise!
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_potion_const_heal()
{
	b_teachplayertalentalchemy(self,other,POTION_CONST_HEAL);
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_potion_const_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_CONST_MANA);
	Info_ClearChoices(dia_constantino_teach);
};

