
instance DIA_ADDON_SKIP_NW_EXIT(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 999;
	condition = dia_addon_skip_nw_exit_condition;
	information = dia_addon_skip_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOSKIPNW = TRUE;
};


instance DIA_ADDON_SKIP_NW_HALLO(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 1;
	condition = dia_addon_skip_nw_hallo_condition;
	information = dia_addon_skip_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_skip_nw_hallo_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_00");	//(annoyed) There you are at last. I've been waiting here for hours.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_01");	//(confused) Just a moment. You're not a merchant from town, are you?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Hallo_08_02");	//(angrily) Where is Baltram?
};


instance DIA_ADDON_SKIP_NW_WERBISTDU(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_werbistdu_condition;
	information = dia_addon_skip_nw_werbistdu_info;
	description = "Who are you?";
};


func int dia_addon_skip_nw_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_skip_nw_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_01");	//I don't see how that's any of your business. But if you must know, my name is Skip. Does that ring a bell?
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_15_02");	//(pretending he didn't understand) Who?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_03");	//Are you telling me you've never heard of Skip? Holy shit, where do you live?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_04");	//I'm one of Khorinis' most wanted criminals. Me and my boys have been the scourge of the waters around this crummy island for years.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_08_05");	//(indignantly) Come on, you must have heard of me.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"You're a pirate.",dia_addon_skip_nw_werbistdu_pirat);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"Should I know you?",dia_addon_skip_nw_werbistdu_keineahnung);
	Info_AddChoice(dia_addon_skip_nw_werbistdu,"But of course. It's all coming back to me now.",dia_addon_skip_nw_werbistdu_ja);
};

func void dia_addon_skip_nw_werbistdu_ja()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_00");	//But of course. It's all coming back to me now.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_01");	//(perplexed) Honestly? You've really heard of me before?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_02");	//Oh shit! And I had been thinking of strolling into town.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_03");	//Good thing I didn't.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_04");	//The militia would have put me in the slammer right away.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_05");	//You haven't come to put me away, have you?
		AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_ja_15_06");	//Weeell...
		AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_ja_08_07");	//Good for you. Pick a fight with old Skip, and you're history.
	};
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_keineahnung()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00");	//Should I know you?
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01");	//Mind that mouth of yours, lad, or old Skip will give you what for.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};

func void dia_addon_skip_nw_werbistdu_pirat()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_WerBistDu_pirat_15_00");	//You're a pirate.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_01");	//(irritated) Yes, damnit. That's plain to see. And a cross one at that.
	AI_Output(self,other,"DIA_Addon_Skip_NW_WerBistDu_pirat_08_02");	//I'm so bored I could chew up the planks of my cog.
	Info_ClearChoices(dia_addon_skip_nw_werbistdu);
};


instance DIA_ADDON_SKIP_NW_BALTRAM(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_baltram_condition;
	information = dia_addon_skip_nw_baltram_info;
	description = "Baltram? You're waiting for a merchant?";
};


func int dia_addon_skip_nw_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_baltram_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Baltram_15_00");	//Baltram? You're waiting for a merchant?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_01");	//Smart kid, are you?
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_02");	//That's what I just said, isn't it?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_03");	//That good-for-nothing junk merchant seems to have forgotten me.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Baltram_08_04");	//If only I could get my hands on him...
	Log_CreateTopic(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BALTRAMSKIPTRADE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"The pirate Skip told me that the city trader Baltram has done business with the pirates.");
	SCKNOWSBALTRAMASPIRATETRADER = TRUE;
};


instance DIA_ADDON_SKIP_BALTRAMPAKET(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_baltrampaket_condition;
	information = dia_addon_skip_baltrampaket_info;
	description = "I've got a package for you - from Baltram.";
};


func int dia_addon_skip_baltrampaket_condition()
{
	if((MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skip_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_00");	//I've got a package for you - from Baltram.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_01");	//What? He's sending me an errand boy?
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_02");	//Scared shitless, is he? Oh well. What can you expect from such a puny penny-pincher.
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(other,self,"DIA_Addon_Skip_BaltramPaket_15_03");	//He says he wants 3 bottles of your rum in return.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_04");	//(laughs) Wouldn't he like that. First he makes me wait forever, doesn't even show up in person, and then he has the nerve to make demands.
	AI_Output(self,other,"DIA_Addon_Skip_BaltramPaket_08_05");	//Here, give him 2 bottles. That's enough for him.
	CreateInvItems(self,itfo_addon_rum,2);
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_NW_WOHER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_woher_condition;
	information = dia_addon_skip_nw_woher_info;
	description = "Where do you come from?";
};


func int dia_addon_skip_nw_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_woher_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Woher_15_00");	//Where do you come from?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_01");	//You want to know where our hideout is?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_02");	//That's the last thing I would tell a member of the militia.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_03");	//If I tell you that, I might as well invite the militia to arrest me.
	};
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_04");	//And, in case you would like to pay us a visit, it wouldn't help you in the least.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_05");	//The island of Khorinis is large, and no-one ever gets to where we are anyway. Unless they have a cog or some other ship.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_06");	//And then you'd have to find your way through the cliffs as well. Nobody gets through there, unless they know the secret path.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Woher_08_07");	//There are only two people who know the path, and you're not one of them.
};


instance DIA_ADDON_SKIP_SCSAWGREG(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_scsawgreg_condition;
	information = dia_addon_skip_scsawgreg_info;
	description = "Do you know anyone with an eyepatch?";
};


func int dia_addon_skip_scsawgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (SC_KNOWSCONNECTIONSKIPGREG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_scsawgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_00");	//Do you know anyone with an eyepatch?
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_01");	//I know plenty of men with eyepatches.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_02");	//There's someone roaming the land of Khorinis who seems to know you rather well.
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_03");	//Can't imagine who. I have no dealings with landlubbers.
	AI_Output(other,self,"DIA_Addon_Skip_SCSawGreg_15_04");	//But...
	AI_Output(self,other,"DIA_Addon_Skip_SCSawGreg_08_05");	//Leave it be, I'm really not interested.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SKIP_NW_MISSINGPEOPLE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_missingpeople_condition;
	information = dia_addon_skip_nw_missingpeople_info;
	description = "Lots of citizens are missing.";
};


func int dia_addon_skip_nw_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_MissingPeople_15_00");	//A lot of citizens are missing. And everything seems to indicate that you're not quite innocent in the matter.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_01");	//(feels caught) Er... damnit, it's not what you think it is.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_02");	//Do I look like a slave trader to you? No, I only transport goods. What they are and where they come from is no concern of mine.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_03");	//We have shipped all kinds of things for those swine.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_04");	//First it was just regular stuff. Well, sometimes it may have been contraband.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_05");	//But then they started to kidnap the inhabitants of the city. No idea what they're planning to do with them.
	AI_Output(self,other,"DIA_Addon_Skip_NW_MissingPeople_08_06");	//All we did was ferry them across.
};


instance DIA_ADDON_SKIP_NW_DEXTER(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_dexter_condition;
	information = dia_addon_skip_nw_dexter_info;
	description = "Who are you talking about?";
};


func int dia_addon_skip_nw_dexter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_dexter_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Dexter_15_00");	//Who are you talking about?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_01");	//The bandits, of course. Who else? The filthy scum who are making themselves at home all over the island.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Dexter_08_02");	//And not just here, around Khorinis.
};

func void b_skip_saysdextersname()
{
	AI_Output(self,other,"DIA_Addon_Skip_SaysDextersName_08_00");	//I remember his name now. Dexter. Yes, I think they called him Dexter.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"The bandit captain Dexter has had the people dragged off from Khorinis. Dexter is said to be somewhere south of Onar's farm.");
	SC_KNOWSDEXTERASKIDNAPPER = TRUE;
	RANGER_SCKNOWSDEXTER = TRUE;
};


instance DIA_ADDON_SKIP_NW_NAME(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 2;
	condition = dia_addon_skip_nw_name_condition;
	information = dia_addon_skip_nw_name_info;
	description = "Just 'bandits' isn't good enough for me. I want a name...";
};


func int dia_addon_skip_nw_name_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_dexter) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_name_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_00");	//Just 'bandits' isn't good enough for me. I want a name...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_01");	//A name? You want to know who's leading the bandits? Damnit, what was that bastard's name again...
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_02");	//Mmh. I just can't recall his name. Even if it wasn't all that complicated.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_03");	//But I can show you where to find the boss of the gang in this part of Khorinis.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_04");	//Have you got a decent map?
	if(Npc_HasItems(other,itwr_map_newworld) == FALSE)
	{
		if((Npc_HasItems(other,itwr_map_newworld_ornaments_addon) == TRUE) || (Npc_HasItems(other,itwr_map_shrine_mis) == TRUE) || (Npc_HasItems(other,itwr_map_caves_mis) == TRUE))
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_05");	//I've got a map right here.
			AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_06");	//But someone's scribbled all over it already. So where's the fun in messing it up for you?
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Skip_NW_Name_15_07");	//No.
		};
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_08");	//Then I guess I'll have to give you a description.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_09");	//There's a very big farm far to the east. The farmer's name is Onar, I think.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_10");	//He's got some fairly large fields. To the south of those fields, there's a small fortress on a high cliff.
		AI_Output(self,other,"DIA_Addon_Skip_NW_Name_08_11");	//That's where you'll find your man.
		b_skip_saysdextersname();
	};
};


instance DIA_ADDON_SKIP_NW_LANDKARTE(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 5;
	condition = dia_addon_skip_nw_landkarte_condition;
	information = dia_addon_skip_nw_landkarte_info;
	description = "Here. I've got a map of Khorinis.";
};


func int dia_addon_skip_nw_landkarte_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_name) && Npc_HasItems(other,itwr_map_newworld) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_landkarte_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Landkarte_15_00");	//Here. I've got a map of Khorinis.
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_01");	//That's good. Let me draw in the hideout of this fellow.
	b_giveinvitems(other,self,itwr_map_newworld,1);
	b_skip_saysdextersname();
	AI_Output(self,other,"DIA_Addon_Skip_NW_Landkarte_08_02");	//Here's your map.
	Npc_RemoveInvItems(self,itwr_map_newworld,1);
	CreateInvItems(self,itwr_map_newworld_dexter,1);
	b_giveinvitems(self,other,itwr_map_newworld_dexter,1);
};


instance DIA_ADDON_SKIP_NW_WOHIN(C_INFO)
{
	npc = pir_1301_addon_skip_nw;
	nr = 99;
	condition = dia_addon_skip_nw_wohin_condition;
	information = dia_addon_skip_nw_wohin_info;
	permanent = TRUE;
	description = "Where did you take those people?";
};


func int dia_addon_skip_nw_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_nw_woher) && Npc_KnowsInfo(other,dia_addon_skip_nw_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_skip_nw_wohin_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_NW_Wohin_15_00");	//Where did you take those people?
	AI_Output(self,other,"DIA_Addon_Skip_NW_Wohin_08_01");	//I already told you - I'm not going to tell you where our bay is.
};

