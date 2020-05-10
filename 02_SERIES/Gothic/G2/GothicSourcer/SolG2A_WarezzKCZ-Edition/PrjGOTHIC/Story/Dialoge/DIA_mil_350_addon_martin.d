
instance DIA_ADDON_MARTIN_EXIT(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 999;
	condition = dia_addon_martin_exit_condition;
	information = dia_addon_martin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_martin_exit_condition()
{
	return TRUE;
};

func void dia_addon_martin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MARTIN_PICKPOCKET(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 900;
	condition = dia_addon_martin_pickpocket_condition;
	information = dia_addon_martin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_martin_pickpocket_condition()
{
	return c_beklauen(65,77);
};

func void dia_addon_martin_pickpocket_info()
{
	Info_ClearChoices(dia_addon_martin_pickpocket);
	Info_AddChoice(dia_addon_martin_pickpocket,DIALOG_BACK,dia_addon_martin_pickpocket_back);
	Info_AddChoice(dia_addon_martin_pickpocket,DIALOG_PICKPOCKET,dia_addon_martin_pickpocket_doit);
};

func void dia_addon_martin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_martin_pickpocket);
};

func void dia_addon_martin_pickpocket_back()
{
	Info_ClearChoices(dia_addon_martin_pickpocket);
};


instance DIA_ADDON_MARTIN_MEETINGISRUNNING(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 1;
	condition = dia_addon_martin_meetingisrunning_condition;
	information = dia_addon_martin_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_martin_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_martin_meetingisrunning_onetime;

func void dia_addon_martin_meetingisrunning_info()
{
	if(DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_00");	//So you're the new fellow, mh? Welcome among us, brother of the Ring.
		DIA_ADDON_MARTIN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_07_01");	//Go to Vatras first, perhaps then I will have time for you.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MARTIN_HALLO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_hallo_condition;
	information = dia_addon_martin_hallo_info;
	important = TRUE;
};


func int dia_addon_martin_hallo_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS) && (SC_ISRANGER == FALSE) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_addon_martin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Martin_Hallo_07_00");	//Hey, you. You have no business up here. Only paladins and those of us in the militia have access here.
};


instance DIA_ADDON_MARTIN_WASMACHSTDU(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_wasmachstdu_condition;
	information = dia_addon_martin_wasmachstdu_info;
	description = "What's up here then?";
};


func int dia_addon_martin_wasmachstdu_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 1000)
	{
		return TRUE;
	};
};

func void dia_addon_martin_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_WasMachstDu_15_00");	//What's up here then?
	AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_01");	//This is the provisions store of the royal guard of the paladins.
	if((other.guild == GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_02");	//I am the provisions master here, and I am responsible for seeing to it that none of the paladins' stuff goes astray, and you are not wanted here.
		AI_Output(self,other,"DIA_Addon_Martin_WasMachstDu_07_03");	//So keep your hands to yourself or I'll chop them off.
	};
};


instance DIA_ADDON_MARTIN_PRETRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_pretrade_condition;
	information = dia_addon_martin_pretrade_info;
	description = "Can you sell me any of the paladins' stuff?";
};


func int dia_addon_martin_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_martin_pretrade_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_00");	//Can you sell me any of the paladins' stuff?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_01");	//You want to buy? Mh. Let's say that if you could compensate me for the trouble that will arise from the paladins' things wandering off, then we might be able to do business.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_02");	//Does that happen often, things going astray?
	AI_Output(self,other,"DIA_Addon_Martin_PreTrade_07_03");	//As long as the provisions master says that everything is right, no.
	AI_Output(other,self,"DIA_Addon_Martin_PreTrade_15_04");	//I see.
};


instance DIA_ADDON_MARTIN_FARIM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_farim_condition;
	information = dia_addon_martin_farim_info;
	description = "Farim the fisherman has problems with the militia.";
};


func int dia_addon_martin_farim_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_martin_pretrade))
	{
		return TRUE;
	};
};

func void dia_addon_martin_farim_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_00");	//Farim the fisherman has problems with the militia. The boys are constantly stealing from him.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_01");	//And what do I have to do with it?
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_02");	//You have a certain amount of influence up here with the paladins.
	AI_Output(other,self,"DIA_Addon_Martin_Farim_15_03");	//Farim needs your protection. He's willing to give you a part of his catch for it.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_04");	//I see what you mean.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_05");	//(disparagingly) Fish! As if I didn't have enough crap to deal with.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_06");	//Tell your pal he should come to me and tell me exactly what is up with the militia.
	AI_Output(self,other,"DIA_Addon_Martin_Farim_07_07");	//I'll take care of it.
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Martin the provisions master will take care of the matter.");
	MARTIN_KNOWSFARIM = TRUE;
	b_giveplayerxp(XP_ADDON_FARIMSCHUTZ);
};


instance DIA_ADDON_MARTIN_TRADE(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 80;
	condition = dia_addon_martin_trade_condition;
	information = dia_addon_martin_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "What do you have to offer?";
};


func int dia_addon_martin_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_pretrade))
	{
		return TRUE;
	};
};


var int dia_addon_martin_trade_onetime;

func void dia_addon_martin_trade_info()
{
	if(DIA_ADDON_MARTIN_TRADE_ONETIME == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_MARTINTRADE);
		DIA_ADDON_MARTIN_TRADE_ONETIME = TRUE;
	};
	AI_Output(other,self,"DIA_Addon_Martin_Trade_15_00");	//What do you have to offer?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Addon_Martin_Trade_07_01");	//Then pay attention.
};


instance DIA_ADDON_MARTIN_RANGERHELP(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_rangerhelp_condition;
	information = dia_addon_martin_rangerhelp_info;
	description = "Lares sent me.";
};


func int dia_addon_martin_rangerhelp_condition()
{
	if((RANGERHELP_GILDEMIL == TRUE) && Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_martin_rangerhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_00");	//Lares sent me. He said you could help me.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_01");	//So? He did? Then fire away. What do you want from me?
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_02");	//I want to join the militia.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_03");	//(laughs) You'd like that, wouldn't you? We don't just take on ragbags like you for no good reason.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_04");	//You'd probably have to...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_05");	//Spare me the drivel. Tell me what I have to do to join you.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_06");	//(surprised) Okay. Then pay attention.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_07");	//The job of the provisions master is hell, let me tell you. Managing all the crates and sacks in this place is bad enough.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_08");	//But every time I spend an evening in Kardif's tavern, someone busies himself with the crates here and when I come back the next morning, something is missing.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_09");	//(angry) Strangely enough, the paladins never see anything.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_10");	//(annoyed) I'm going crazy. I can't spend the entire night standing around here like an idiot.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_11");	//You, on the other hand...
	AI_Output(other,self,"DIA_Addon_Martin_Rangerhelp_15_12");	//I get it. I'm supposed to keep watch here while you hang around in the tavern.
	AI_Output(self,other,"DIA_Addon_Martin_Rangerhelp_07_13");	//Take it or leave it.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"I am supposed to keep an eye on the crates of Martin the provisions master. If I catch the fellow who is messing about with his crates, Martin will help me join the militia.");
};


instance DIA_ADDON_MARTIN_AUFTRAG(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_auftrag_condition;
	information = dia_addon_martin_auftrag_info;
	description = "I'll watch over your provisions crates tonight.";
};


func int dia_addon_martin_auftrag_condition()
{
	if((RANGERHELP_GILDEMIL == TRUE) && Npc_KnowsInfo(other,dia_addon_martin_rangerhelp) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};


var int mis_addon_martin_getrangar_day;

func void dia_addon_martin_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Auftrag_15_00");	//I'll watch over your provisions crates tonight.
	AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_01");	//(satisfied) Sweet.
	if(Wld_IsTime(23,0,4,0))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_02");	//Then I'll take off for Kardif's pub. And woe betide you if anything is missing when I get back.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Auftrag_07_03");	//Good, then come back tonight and keep an eye on the stuff here. In the meantime, I'll be in Kardif's tavern.
	};
	b_startotherroutine(mil_321_rangar,"PrePalCampKlau");
	Info_ClearChoices(dia_addon_martin_auftrag);
	Info_AddChoice(dia_addon_martin_auftrag,"(more)",dia_addon_martin_auftrag_weiter);
};

func void dia_addon_martin_auftrag_weiter()
{
	MIS_ADDON_MARTIN_GETRANGAR = LOG_RUNNING;
	MIS_ADDON_MARTIN_GETRANGAR_DAY = Wld_GetDay();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(mil_321_rangar,"PalCampKlau");
};


instance DIA_ADDON_MARTIN_FROMVATRAS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fromvatras_condition;
	information = dia_addon_martin_fromvatras_info;
	description = "You're looking for the man who is selling weapons to the bandits?";
};


func int dia_addon_martin_fromvatras_condition()
{
	if(VATRAS_TOMARTIN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_martin_fromvatras_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_00");	//You're looking for the man who is selling weapons to the bandits?
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_01");	//Says who?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_02");	//Says Vatras.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_03");	//Oh. What do you know about it?
	AI_Output(other,self,"DIA_Addon_Martin_FromVatras_15_04");	//Not much, but I could find out more.
	AI_Output(self,other,"DIA_Addon_Martin_FromVatras_07_05");	//(catching on) Ah, is that so...
};


instance DIA_ADDON_MARTIN_TELLALL(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_tellall_condition;
	information = dia_addon_martin_tellall_info;
	description = "Tell me, what do you know about the weapons dealer?";
};


func int dia_addon_martin_tellall_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_fromvatras))
	{
		return TRUE;
	};
};

func void dia_addon_martin_tellall_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_TellAll_15_00");	//Tell me, what do you know about the weapons dealer?
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_01");	//Listen. We know that an influential citizen in the upper quarter must be behind it.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_02");	//And some of the weapons are even supposed to have come from the militia's supplies.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_03");	//But we still don't know exactly who is behind it.
	AI_Output(self,other,"DIA_Addon_Martin_TellAll_07_04");	//If you have enough guts to take on a group of at least five bandits, maybe you can find out...
	b_logentry(TOPIC_ADDON_BANDITTRADER,"According to Martin, the weapons dealer is an influential citizen of the upper quarter.");
};


instance DIA_ADDON_MARTIN_ABOUTBANDITS(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_aboutbandits_condition;
	information = dia_addon_martin_aboutbandits_info;
	description = "What ABOUT the bandits?";
};


func int dia_addon_martin_aboutbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_tellall))
	{
		return TRUE;
	};
};

func void dia_addon_martin_aboutbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_AboutBandits_15_00");	//What ABOUT the bandits?
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_01");	//We know that the bandits are currently blockading the roads that connect the farmers to the city.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_02");	//Besides that, I know that there must have been a weapons delivery in the last few days.
	AI_Output(self,other,"DIA_Addon_Martin_AboutBandits_07_03");	//Maybe some clues to uncover the weapons dealer can be found with the bandits.
	MIS_MARTIN_FINDTHEBANDITTRADER = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_BANDITTRADER,"The bandits are blockading the roads between the seaport and the farms. Maybe there I can find a clue that will expose the weapons dealer.");
};


instance DIA_ADDON_MARTIN_FERNANDO(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 5;
	condition = dia_addon_martin_fernando_condition;
	information = dia_addon_martin_fernando_info;
	permanent = TRUE;
	description = "About the weapons dealer...";
};


func int dia_addon_martin_fernando_condition()
{
	if(MIS_MARTIN_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int martin_irrlichthint;

func void dia_addon_martin_fernando_info()
{
	var int fernandohints;
	AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_00");	//Eh, about the weapons dealer...
	if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_01");	//Show me what you have.
		fernandohints = 0;
		if(Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE)))
		{
			if(Npc_HasItems(other,itmw_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_02");	//I found this rapier with the bandits. The letter 'F' is carved on the pommel.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itri_addon_bandittrader))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_03");	//The bandits had this ring. It points to an overseas trader.
				fernandohints = fernandohints + 1;
			};
			if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_04");	//This list of deliveries of weapons and other things to the bandits here is signed by a certain Fernando.
				fernandohints = fernandohints + 3;
			};
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_05");	//Besides that, Fernando, the old trader from the upper quarter, has admitted having done business with the bandits.
				fernandohints = fernandohints + 1;
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_06");	//Fernando has admitted providing the bandits with weapons.
		};
		if(fernandohints >= 3)
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_07");	//I think that's enough. Fernando, then. Well, he'll get what's coming to him.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_08");	//And he always acts like butter wouldn't melt in his mouth.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_09");	//I'll see to it that he's put away until he rots.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_10");	//Sound work, I must say.
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_11");	//Vatras will be glad of this good news.
			b_startotherroutine(fernando,"Prison");
			b_startotherroutine(gerbrandt,"FerJail");
			FERNANDO_IMKNAST = TRUE;
			MIS_MARTIN_FINDTHEBANDITTRADER = LOG_SUCCESS;
			b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin will see to it that Fernando serves his punishment. I should tell Vatras about it.");
			b_giveplayerxp(XP_ADDON_FERNANDOMARTIN);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_12");	//And? What else?
			AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_13");	//That's all.
			if(FERNANDO_HATSZUGEGEBEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_14");	//It's nice that he admits it, but unfortunately without solid evidence, I can't do any more.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_15");	//I don't want to look ridiculous in front of Lord Hagen. You'll have to get me more.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_16");	//That isn't enough. That could be almost anyone in the upper quarter.
				AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_17");	//It looks as though you'll have to follow the trail of the bandits and the weapons delivery farther until we find out who is behind it.
				if(MARTIN_IRRLICHTHINT == FALSE)
				{
					AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_18");	//Maybe you should talk to Vatras agian...
					MARTIN_IRRLICHTHINT = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Martin_Fernando_15_19");	//What was that again?
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_20");	//Listen. You are supposed to find out who is behind the weapons deliveries to the bandits and bring me proof.
		AI_Output(self,other,"DIA_Addon_Martin_Fernando_07_21");	//But it has to be really incriminating evidence. Otherwise I can't arrest the guy.
	};
};


instance DIA_ADDON_MARTIN_PERM(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 90;
	condition = dia_addon_martin_perm_condition;
	information = dia_addon_martin_perm_info;
	permanent = TRUE;
	description = "All the crates still there?";
};


func int dia_addon_martin_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_martin_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_Perm_15_00");	//All the crates still there?
	if((MIS_ADDON_MARTIN_GETRANGAR_DAY <= (Wld_GetDay() - 2)) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_01");	//(angry) You bastard, you were supposed to guard my crates. Now something else is missing.
		if(Wld_IsTime(24,0,3,0))
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_02");	//(loudly) Go straight to the provisions store at the harbor and grab me the scumbag who stole from me, got it?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Martin_Perm_07_03");	//And pay better attention tonight when I'm gone, understand?
		};
	}
	else if((MIS_ADDON_MARTIN_GETRANGAR != 0) || (hero.guild != GIL_NONE) || (SC_ISRANGER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_04");	//Go ahead and laugh at me. YOU stand on the pier all day and try to watch over all the chaos.
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_05");	//The paladins dragged so much rubbish along that it isn't funny.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Martin_Perm_07_06");	//Don't touch anything or I'll call the watch, got it?
	};
};


instance DIA_ADDON_MARTIN_GOTRANGAR(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_gotrangar_condition;
	information = dia_addon_martin_gotrangar_info;
	description = "I caught the thief.";
};


func int dia_addon_martin_gotrangar_condition()
{
	if((MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING) && (SC_GOTRANGAR == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_martin_gotrangar_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_00");	//I caught the thief.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_01");	//It's Rangar who is poking through your stocks.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_02");	//Well, finally. At least now I know who I have to keep an eye on. The bastard. There'll be one heck of a dust-up if I catch him at it.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_03");	//I've always wondered why none of the paladins saw anything.
	AI_Output(other,self,"DIA_Addon_Martin_GotRangar_15_04");	//And? Why?
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_05");	//It's obvious. The idiots can't tell those of us in the militia apart from one another. To them, we all look alike.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_06");	//That was good work, mate.
	AI_Output(self,other,"DIA_Addon_Martin_GotRangar_07_07");	//If I can do anything for you, just say the word.
	MIS_ADDON_MARTIN_GETRANGAR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR_REPORT);
};


instance DIA_ADDON_MARTIN_GETMILIZ(C_INFO)
{
	npc = mil_350_addon_martin;
	nr = 2;
	condition = dia_addon_martin_getmiliz_condition;
	information = dia_addon_martin_getmiliz_info;
	description = "You know what I want from you.";
};


func int dia_addon_martin_getmiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_martin_gotrangar))
	{
		return TRUE;
	};
};

func void dia_addon_martin_getmiliz_info()
{
	AI_Output(other,self,"DIA_Addon_Martin_GetMiliz_15_00");	//You know what I want from you.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_01");	//Oh, yeah. You want to join the militia, right?
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_02");	//You've already proven your abilities to me.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_03");	//Well. Let me put it this way. I'd rather know you were on our side than on someone else's.
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_04");	//That's why I'll help you. Take this letter of recommendation from me and show it to Andre, our commanding paladin.
	CreateInvItems(self,itwr_martin_milizempfehlung_addon,1);
	b_giveinvitems(self,other,itwr_martin_milizempfehlung_addon,1);
	AI_Output(self,other,"DIA_Addon_Martin_GetMiliz_07_05");	//You'll find him in the barracks. I'm sure he can use you.
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Martin gave me a letter of recommendation for Andre, the commanding paladin. Andre will let me into the militia with it. I can find Andre in the barracks.");
};

