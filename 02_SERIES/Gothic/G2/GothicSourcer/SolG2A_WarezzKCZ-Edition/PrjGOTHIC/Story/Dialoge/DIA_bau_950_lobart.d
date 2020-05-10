
instance DIA_LOBART_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_exit_condition;
	information = dia_lobart_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lobart_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_STOLENCLOTHS(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_stolencloths_condition;
	information = dia_lobart_stolencloths_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_stolencloths_condition()
{
	if((Mob_HasItems("CHEST_LOBART",itar_bau_l) == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_stolencloths_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_bau_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//I don't believe it! The bastard is running around in MY clothes!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//Hey, you!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//Since you were here the last time, some of my stuff has been missing from my chest!
	};
	if(Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//You should be making yourself useful around here, not sniffing around in my house, you lazy bum!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//You give me back my clothes right now!
	Info_ClearChoices(dia_lobart_stolencloths);
	Info_AddChoice(dia_lobart_stolencloths,"Forget it!",dia_lobart_stolencloths_forgetit);
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_lobart_stolencloths,"Here, take them back.",dia_lobart_stolencloths_hereyougo);
	}
	else
	{
		Info_AddChoice(dia_lobart_stolencloths,"I don't have them anymore.",dia_lobart_stolencloths_donthaveit);
	};
};

func void dia_lobart_stolencloths_hereyougo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//Here, take them back.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//If you want them, you can PAY for them!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//(curt) Now go make yourself useful!
	b_giveinvitems(other,self,itar_bau_l,1);
	Info_ClearChoices(dia_lobart_stolencloths);
};

func void dia_lobart_stolencloths_donthaveit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//I don't have them any more.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//You already sold them, huh? (ranting) I'll teach you, laddie!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};

func void dia_lobart_stolencloths_forgetit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//Forget it!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//(ranting) I'll teach you, laddie!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};


instance DIA_LOBART_HALLO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_hallo_condition;
	information = dia_lobart_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//Why are you hanging around on my land?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//(appraising) Whose side are you on? The rebelling farmers or the King?
		Info_ClearChoices(dia_lobart_hallo);
		Info_AddChoice(dia_lobart_hallo,"I don't understand...",dia_lobart_hallo_what);
		Info_AddChoice(dia_lobart_hallo,"I'm for the King!",dia_lobart_hallo_fortheking);
		Info_AddChoice(dia_lobart_hallo,"I'm for the peasants!",dia_lobart_hallo_forthepeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//What can I do for you?
	};
};

func void dia_lobart_hallo_forthepeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//I'm for the peasants!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//Ha! That damned warmonger Onar will drag us all into the grave!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//What do you think, how long will the paladins just stand by?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//After what Onar has done, the whole city is in an uproar.
	LOBART_AGAINSTKING = TRUE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_fortheking()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//I'm for the King!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(contemptuous) 'For the King!' That's what the city guard said when they took half my sheep.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//But where are those bastards when we have to keep the bandits off our backs? Where will they be when the orcs invade us?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//I'll tell you: in the city, behind thick walls.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//So, leave me alone with the King.
	LOBART_AGAINSTKING = FALSE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_what()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//I don't understand...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//What?! Don't mess with me, boy! I want to know where you stand! So, who are you for?!
};


instance DIA_LOBART_KLEIDUNG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_kleidung_condition;
	information = dia_lobart_kleidung_info;
	permanent = FALSE;
	description = "I need some sensible clothes!";
};


func int dia_lobart_kleidung_condition()
{
	if(!Npc_KnowsInfo(other,dia_lobart_stolencloths) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_kleidung_info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//I need some sensible clothes!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//I can give you clean farmer's work clothes.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//Can you pay for them, then?
	Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
	b_logentry(TOPIC_KLEIDUNG,"Farmer Lobart is prepared to sell me work clothes.");
	if(!Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//You could work off a part of the price... if you're someone who is LOOKING for work.
		b_logentry(TOPIC_KLEIDUNG,"I can pay part of the price by working on his farm. The more work I do, the cheaper the clothes get.");
	};
};


instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_buyclothes_condition;
	information = dia_lobart_buyclothes_info;
	permanent = TRUE;
	description = "How much for the work clothes?";
};


func int dia_lobart_buyclothes_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_kleidung) && (LOBART_KLEIDUNG_VERKAUFT == FALSE)) || (Npc_KnowsInfo(other,dia_lobart_stolencloths) && (LOBART_KLEIDUNG_GESTOHLEN == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void dia_lobart_buyclothes_info()
{
	WERT_LOBARTSRUESTUNG = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//How much for the work clothes?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//Well, we'll see...
	if(LOBART_AGAINSTKING == TRUE)
	{
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//You've worked the field for me.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//You helped my wife.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_VINO_WEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//Vino says you were a real help to him. And that's saying something - he doesn't usually hold with day laborers.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_MALETH_BANDITS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//Maleth says you chased the bandits off. The bastards have caused us a lot of trouble. Thanks to you we're rid of them!
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
	if(WERT_LOBARTSRUESTUNG == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//It's not going to get any cheaper.
		b_logentry(TOPIC_KLEIDUNG,"But he won't sell them to me for less than 30 gold pieces.");
	};
	Info_ClearChoices(dia_lobart_buyclothes);
	Info_AddChoice(dia_lobart_buyclothes,"That's still too expensive.",dia_lobart_buyclothes_notyet);
	Info_AddChoice(dia_lobart_buyclothes,"Give me the farmer's clothing. Protection: B.+10/B.+10",dia_lobart_buyclothes_buy);
};

func void dia_lobart_buyclothes_buy()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//Give me the work clothes, then.
	if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
	{
		if(Npc_HasItems(self,itar_bau_l) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//Well, my boy. Honesty is the best policy. Here you go!
			b_giveinvitems(self,other,itar_bau_l,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//There is a chest in my house where you will find clean things.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//But don't even think about taking anything else without asking!
		};
		LOBART_KLEIDUNG_VERKAUFT = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		b_checklog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//You don't have enough gold!
	};
	Info_ClearChoices(dia_lobart_buyclothes);
};

func void dia_lobart_buyclothes_notyet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//That's still too expensive.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//Suit yourself...
	Info_ClearChoices(dia_lobart_buyclothes);
};


instance DIA_LOBART_AUFSTANDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_aufstandinfo_condition;
	information = dia_lobart_aufstandinfo_info;
	permanent = FALSE;
	description = "What's going on here, anyway?";
};


func int dia_lobart_aufstandinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_aufstandinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//What's going on here, anyway?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//Don't you know what's going on? Boy, where are you FROM? We're on the edge of a civil war!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//Up till now all the farmers looked at the tribute to the city as fair taxation.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//But since the paladins have come to Khorinis, the city guards visit us more and more often - and little by little, they're taking everything.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//If it goes on like this, soon we won't have anything left for ourselves.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//Some farmers are starting to rebel! Onar was the first of them!
};


instance DIA_LOBART_ONARSTORY(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_onarstory_condition;
	information = dia_lobart_onarstory_info;
	permanent = FALSE;
	description = "Tell me more about this Onar...";
};


func int dia_lobart_onarstory_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_onarstory_info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//Tell me more about this Onar...
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//You're a mercenary, aren't you? So what else could I tell you about your boss?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//Onar is the biggest farmer here in the area. He has broken with the city.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//They say he's hired mercenaries to keep the city guard off his back!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//Can't blame him.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//In any case, no royal soldier dares to set foot on his farm any more.
	};
};


instance DIA_LOBART_SLDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_sldinfo_condition;
	information = dia_lobart_sldinfo_info;
	permanent = FALSE;
	description = "Who are those mercenaries that Onar hired?";
};


func int dia_lobart_sldinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_onarstory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_sldinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//Who are those mercenaries that Onar hired?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//I don't know much about the guys. Supposedly, a lot of them are former prisoners from the mining colony.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(scornful) Everybody knows what you can expect from them...
};


instance DIA_LOBART_WHICHSIDE(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_whichside_condition;
	information = dia_lobart_whichside_info;
	permanent = FALSE;
	description = "Whose side are you on? Peasants or King?";
};


func int dia_lobart_whichside_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_whichside_info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//What about you? Whose side are you on? Peasants or King?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//I'm too close to the city to really have a choice.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//But I'm glad about that. I wouldn't know how to decide.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//The King is bleeding us dry, and Onar sets his mercenaries on anyone who won't join him.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//That's why most of the other farmers are still undecided, but sooner or later they'll HAVE to choose one side or the other.
	};
};


instance DIA_LOBART_WORKNOW(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_worknow_condition;
	information = dia_lobart_worknow_info;
	permanent = FALSE;
	description = "I'm looking for work.";
};


func int dia_lobart_worknow_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) || Npc_KnowsInfo(other,dia_lobart_stolencloths) || Npc_KnowsInfo(other,dia_lobart_kleidung))
	{
		if(KAPITEL < 3)
		{
			return TRUE;
		};
	};
};

func void dia_lobart_worknow_info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//I'm looking for work.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//I can't use another farmhand. But I could offer some work to a day laborer.
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//What I mean is, you can lend a hand in the field. And there are certainly a few other things to do around here.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//I could pay you with gold. Or give you a few decent things to wear.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//The things are worth a fair bit. I can't give them to you for nothing, but I can sell them to you cheap, if you work for me.
		Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
		b_logentry(TOPIC_KLEIDUNG,"Farmer Lobart is prepared to sell me work clothes. I can pay part of the price by working on his farm. The more work I do, the cheaper the clothes get.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//By the looks of you, I should say: take the clothes.
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//But you already have clothes, so you probably want the gold.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//Anyway - the small turnip field next to the barn needs to be harvested.
	Info_ClearChoices(dia_lobart_worknow);
	Info_AddChoice(dia_lobart_worknow,"I'm supposed to pull turnips? You've got to be kidding!",dia_lobart_worknow_wannafoolme);
	Info_AddChoice(dia_lobart_worknow,"All right...",dia_lobart_worknow_ok);
};

func void dia_lobart_worknow_ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//All right...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//Then hurry it up a bit, before I change my mind.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Farmer Lobart wants me to harvest the turnip field. In return, he'll give me gold or drop the price of the clothes.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};

func void dia_lobart_worknow_wannafoolme()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//I'm supposed to pull turnips? You've got to be kidding!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//Real man's work isn't for such a 'fine gentleman', eh?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//Get out into the field or get off of my farm!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//I don't have anything else for you to do at the moment.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"Farmer Lobart wants me to harvest the turnip field. In return, he'll give me gold or drop the price of the clothes.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};


instance DIA_LOBART_RUEBENRUNNING(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_ruebenrunning_condition;
	information = dia_lobart_ruebenrunning_info;
	permanent = TRUE;
	description = "Here are your turnips!";
};


func int dia_lobart_ruebenrunning_condition()
{
	if((MIS_LOBART_RUEBEN == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_ruebenrunning_info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//Here are your turnips!
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//Hey, you're not all that worthless after all.
		};
		if(Npc_IsDead(hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//Take them to my wife in the house and tell her to cook them.
			MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
			Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
			b_logentry(TOPIC_RUEBENBRINGEN,"I'm to bring the harvested turnips to Lobart's wife in the house. She can cook them there.");
		};
		MIS_LOBART_RUEBEN = LOG_SUCCESS;
		b_giveplayerxp(XP_LOBARTHOLRUEBEN);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//What about my pay?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//I can give you 5 gold pieces.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//... or sell you the clothes cheaper, what's it to be?
		};
		Info_ClearChoices(dia_lobart_ruebenrunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(dia_lobart_ruebenrunning,"Make me a better price for the togs!",dia_lobart_ruebenrunning_billiger);
		};
		Info_AddChoice(dia_lobart_ruebenrunning,"Give me 5 gold pieces!",dia_lobart_ruebenrunning_gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//But that's not even 20 of them!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//Did you eat the rest?! I hope not, my boy, otherwise you can forget your pay!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//Get out there, and get more! Go back to work or I'll make you!
		};
		AI_StopProcessInfos(self);
	};
};

func void dia_lobart_ruebenrunning_gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//Give me 5 gold pieces!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//Here.
	b_giveinvitems(self,other,itmi_gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//And don't drink it all at once.
	};
	Info_ClearChoices(dia_lobart_ruebenrunning);
};

func void dia_lobart_ruebenrunning_billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//Make me a better price for the togs!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//Good! I'll give them to you for 10 gold pieces less.
	Info_ClearChoices(dia_lobart_ruebenrunning);
};


instance DIA_LOBART_MOREWORK(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_morework_condition;
	information = dia_lobart_morework_info;
	permanent = TRUE;
	description = "Have you got anything else for me to do?";
};


func int dia_lobart_morework_condition()
{
	if(((MIS_LOBART_RUEBEN == LOG_RUNNING) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_morework_info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//Have you got anything else for me to do?
	if(MIS_LOBART_RUEBEN == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//First get the turnips in from the field. Then we'll see.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//I don't, but you can ask my wife or the boys in the fields. Maybe they need some help.
	};
};


instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_andrehelplobart_condition;
	information = dia_lobart_andrehelplobart_info;
	description = "Andre sent me to you.";
};


func int dia_lobart_andrehelplobart_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lobart_andrehelplobart_info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//Andre sent me to you. Is there anything I can do for you?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//Yeah, sure. Those damned field raiders are making me sick.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//Do them all in. I don't care how!
	Log_AddEntry(TOPIC_BECOMEMIL,"Lobart's fields are plagued by field raiders. He wants me to drive them all away.");
	MIS_LOBARTKILLBUGS = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_BUGDEAD(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_bugdead_condition;
	information = dia_lobart_bugdead_info;
	permanent = TRUE;
	description = "I've done away with the things!";
};


var int dia_lobart_bugdead_noperm;

func int dia_lobart_bugdead_condition()
{
	if((MIS_LOBARTKILLBUGS == LOG_RUNNING) && (DIA_LOBART_BUGDEAD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_bugdead_info()
{
	if(Npc_IsDead(lobarts_giant_bug1) && Npc_IsDead(lobarts_giant_bug2) && Npc_IsDead(lobarts_giant_bug3) && Npc_IsDead(lobarts_giant_bug4) && Npc_IsDead(lobarts_giant_bug5) && Npc_IsDead(lobarts_giant_bug6) && Npc_IsDead(lobarts_giant_bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//I've done away with the things!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//Well done. You're not a bad exterminator. I'll recommend you around. Here, take this as payment.
		b_startotherroutine(vino,"Start");
		b_startotherroutine(lobartsbauer1,"Start");
		b_startotherroutine(lobartsbauer2,"Start");
		CreateInvItems(self,itmi_gold,20);
		b_giveinvitems(self,other,itmi_gold,20);
		MIS_LOBARTKILLBUGS = LOG_SUCCESS;
		MIS_ANDREHELPLOBART = LOG_SUCCESS;
		Log_AddEntry(TOPIC_BECOMEMIL,"Lobart's rid of the field raiders. I've removed them all.");
		DIA_LOBART_BUGDEAD_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//I think I've done away with the things!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//Don't try to fool me. I can still see them. Either you kill the critters, or we can forget the whole thing.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LOBART_KAP3_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap3_exit_condition;
	information = dia_lobart_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lobart_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_DMT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 30;
	condition = dia_lobart_dmt_condition;
	information = dia_lobart_dmt_info;
	description = "How's your farm?";
};


func int dia_lobart_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_lobart_dmt_info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//How's your farm?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//I can't stand it any more.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//All of a sudden these fellows in black hoods showed up and posted themselves on the road, and on my farm.
	Info_ClearChoices(dia_lobart_dmt);
	Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
	if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//They spent a long time talking to Vino and then they disappeared with him.
		if(NPCOBSESSEDBYDMT_VINO == FALSE)
		{
			Info_AddChoice(dia_lobart_dmt,"Where did they drag Vino off to?",dia_lobart_dmt_vinowohin);
		};
		Info_AddChoice(dia_lobart_dmt,"What was their business with Vino?",dia_lobart_dmt_vinowas);
	};
	if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//A short time later, my wife took deathly ill again. She spends most of the time just lying in bed. That happens to her frequently.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//I'm falling apart here!
	if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		Info_AddChoice(dia_lobart_dmt,"Why don't you take your wife to the healer?",dia_lobart_dmt_frauheilen);
	};
	Info_AddChoice(dia_lobart_dmt,"Why don't you do anything about those black robes?",dia_lobart_dmt_hof);
	Info_AddChoice(dia_lobart_dmt,"Have you talked to the men in black?",dia_lobart_dmt_spoketothem);
};

func void dia_lobart_dmt_frauheilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//Why don't you take your wife to the healer?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//We ought to go to the city to see Vatras about it, but I won't budge an inch from my farm as long as things are so chaotic here.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"Lobart's wife Hilda is sick, but Vatras has something that can cure her.");
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_lobart_dmt_back()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void dia_lobart_dmt_spoketothem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//Have you talked to the men in black?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//Sure. There was no way to prevent it.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//I think they're looking for someone.
};

func void dia_lobart_dmt_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//Why don't you do anything about those black robes?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//I'd surely love to. But I saw how they burned one of the townspeople alive. Just like that.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//Why should I risk my life?
};

func void dia_lobart_dmt_vinowas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//What was their business with Vino?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//They didn't say. They just took him with them.
};

func void dia_lobart_dmt_vinowohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//Where did they drag Vino off to?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//They went up that hill with him.
};


instance DIA_LOBART_VINOTOT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 32;
	condition = dia_lobart_vinotot_condition;
	information = dia_lobart_vinotot_info;
	description = "Vino isn't going to come back.";
};


func int dia_lobart_vinotot_condition()
{
	if((Npc_IsDead(vino) || (NPCOBSESSEDBYDMT_VINO == TRUE)) && Npc_KnowsInfo(other,dia_lobart_dmt) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lobart_vinotot_info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//Vino isn't going to come back.
	if(Npc_IsDead(vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//He is dead.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//They drove him insane.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//By Innos. Hopefully, this nightmare will be over soon.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LOBART_PERM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 80;
	condition = dia_lobart_perm_condition;
	information = dia_lobart_perm_info;
	permanent = TRUE;
	description = "Watch out for your farm!";
};


func int dia_lobart_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_dmt) && (KAPITEL >= 3) && (Npc_IsDead(orcwarrior_lobart1) && Npc_IsDead(orcwarrior_lobart2) && Npc_IsDead(orcwarrior_lobart3) && Npc_IsDead(orcwarrior_lobart4) && Npc_IsDead(orcwarrior_lobart5) && Npc_IsDead(orcwarrior_lobart6)))
	{
		return TRUE;
	};
};

func void dia_lobart_perm_info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//Watch out for your farm!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//I'll try.
};


instance DIA_LOBART_KAP4_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap4_exit_condition;
	information = dia_lobart_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lobart_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKPROBLEM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 41;
	condition = dia_lobart_orkproblem_condition;
	information = dia_lobart_orkproblem_info;
	description = "You've got an orc problem.";
};


func int dia_lobart_orkproblem_condition()
{
	if(((Npc_IsDead(orcwarrior_lobart1) == FALSE) || (Npc_IsDead(orcwarrior_lobart2) == FALSE) || (Npc_IsDead(orcwarrior_lobart3) == FALSE) || (Npc_IsDead(orcwarrior_lobart4) == FALSE) || (Npc_IsDead(orcwarrior_lobart5) == FALSE) || (Npc_IsDead(orcwarrior_lobart6) == FALSE)) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,dia_lobart_dmt))
	{
		return TRUE;
	};
};

func void dia_lobart_orkproblem_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//You've got an orc problem.
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(ranting) Damnit. Doesn't the stress ever end?
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//If this goes on, my farm won't be worth 3 gold coins.
	Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
	b_logentry(TOPIC_LOBARTSORKPROBLEM,"The orcs have settled down on Lobart's farm. He wants me to get rid of them.");
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKSWEG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 42;
	condition = dia_lobart_orksweg_condition;
	information = dia_lobart_orksweg_info;
	description = "I got rid of the orcs on your land.";
};


func int dia_lobart_orksweg_condition()
{
	if((Npc_IsDead(orcwarrior_lobart1) == TRUE) && (Npc_IsDead(orcwarrior_lobart2) == TRUE) && (Npc_IsDead(orcwarrior_lobart3) == TRUE) && (Npc_IsDead(orcwarrior_lobart4) == TRUE) && (Npc_IsDead(orcwarrior_lobart5) == TRUE) && (Npc_IsDead(orcwarrior_lobart6) == TRUE) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lobart_orksweg_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//I got rid of the orcs on your land.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//Don't let anyone say that the paladins don't do anything for us small farmers.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//Thank Innos. I can't give you much, but I hope you'll appreciate my gesture of gratitude.
	b_startotherroutine(vino,"Start");
	b_startotherroutine(lobartsbauer1,"Start");
	b_startotherroutine(lobartsbauer2,"Start");
	TOPIC_END_LOBARTSORKPROBLEM = TRUE;
	b_giveplayerxp(XP_KILLEDLOBARTORKS);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_LOBART_KAP5_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap5_exit_condition;
	information = dia_lobart_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lobart_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_KAP6_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap6_exit_condition;
	information = dia_lobart_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lobart_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_PICKPOCKET(C_INFO)
{
	npc = bau_950_lobart;
	nr = 900;
	condition = dia_lobart_pickpocket_condition;
	information = dia_lobart_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_lobart_pickpocket_condition()
{
	return c_beklauen(65,80);
};

func void dia_lobart_pickpocket_info()
{
	Info_ClearChoices(dia_lobart_pickpocket);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_BACK,dia_lobart_pickpocket_back);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_PICKPOCKET,dia_lobart_pickpocket_doit);
};

func void dia_lobart_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lobart_pickpocket);
};

func void dia_lobart_pickpocket_back()
{
	Info_ClearChoices(dia_lobart_pickpocket);
};

