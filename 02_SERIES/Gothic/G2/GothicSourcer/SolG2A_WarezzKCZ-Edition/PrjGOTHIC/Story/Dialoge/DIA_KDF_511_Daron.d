
func void b_daronsegen()
{
	var string concattext;
	var int bonus_1;
	var int bonus_2;
	var int bonus_3;
	DARON_SEGEN = TRUE;
	if(DARON_SPENDE < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
	}
	else if((DARON_SPENDE < 250) && (bonus_1 == FALSE))
	{
		b_raiseattribute(other,ATR_MANA_MAX,2);
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		bonus_1 = TRUE;
	}
	else if((DARON_SPENDE < 500) && (bonus_2 == FALSE))
	{
		b_giveplayerxp(110);
		bonus_2 = TRUE;
	}
	else if((DARON_SPENDE >= 750) && (DARON_SPENDE < 1000) && (bonus_3 == FALSE))
	{
		other.lp = other.lp + 3;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(3));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		bonus_3 = TRUE;
	}
	else
	{
		other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + 2;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(2));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
};


instance DIA_DARON_EXIT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 999;
	condition = dia_daron_exit_condition;
	information = dia_daron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_daron_exit_condition()
{
	return TRUE;
};

func void dia_daron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARON_HALLO(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_hallo_condition;
	information = dia_daron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_daron_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_hallo_info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//What can I do for you? Are you seeking spiritual comfort?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//Do you want to direct a prayer to our Lord Innos, or donate some gold for his church?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "I need to talk to the paladins...";
};


func int dia_daron_paladine_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_daron_paladine_info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//I need to talk to the paladins. Can you help me get to them?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//Well, you need access to the upper end of town. However, this is allowed only to citizens and the city watch.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//And, of course, to us Magicians of Fire.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//How can I become a Fire Magician?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//You must join our order as a novice. When you have served for a time, perhaps you will be accepted into the ranks of the magicians.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//However, the path to acceptance is long and full of work and study.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "I've come to get your blessing!";
};


func int dia_daron_aboutsegen_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_aboutsegen_info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//I've come to get your blessing!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//That's good, that's good - then you will probably want to donate gold to the holy church of Innos, won't you?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//Actually, I wanted your blessing so I can sign on as an apprentice in the lower part of town...
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//But I have already given you my blessing, my son.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//Go with Innos, my son!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//But, my son! Without a modest donation to the church, it is impossible for me to bless you.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//How else can I be certain of your good intentions towards the holy church of Innos?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "So how much does a donation usually run to here?";
};


func int dia_daron_spenden_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_daron_spenden_info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//So how much does a donation usually run to here?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//Well, that depends on what percentage you want to give. Let me see how much you brought.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(looking in money pouch) Mmmmh hmmm...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//Hm, you're a poor soul, aren't you? Keep the little you have.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron the Fire Magician hasn't blessed me. I guess that means I have to get some gold and donate it to him to get him to bless me after all.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//Well, you don't have much, but neither are you poor. 10 gold pieces for Innos - we live modestly.
			b_giveinvitems(other,self,itmi_gold,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//You have more than 50 gold coins. Donate 25 to Innos and receive his blessing.
			b_giveinvitems(other,self,itmi_gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//You have more than a hundred gold pieces - the Lord says, give if you have.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//The church accepts your generous donation.
			b_giveinvitems(other,self,itmi_gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//I bless you in the name of Innos. For he is light and righteousness.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron the Fire Magician has given me his blessing.");
		};
	};
};


instance DIA_DARON_WOHER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_woher_condition;
	information = dia_daron_woher_info;
	permanent = FALSE;
	description = "Where do you come from?";
};


func int dia_daron_woher_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_daron_woher_info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//Where do you come from?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//I come from the monastery of the Magicians, which lies in the mountains.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//We accept everyone there who is pure of heart and feels the desire to serve our almighty Lord Innos.
	};
};


instance DIA_DARON_INNOS(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_innos_condition;
	information = dia_daron_innos_info;
	permanent = FALSE;
	description = "Tell me about Innos.";
};


func int dia_daron_innos_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_daron_innos_info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//Tell me about Innos.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//Innos, our almighty lord, is the light and the fire.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//He chose humans to be his tool, giving them magic and laws.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//We act in his name. We administer justice according to his will and preach his word.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "Tell me more about the monastery.";
};


func int dia_daron_kloster_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) || (Npc_KnowsInfo(other,dia_daron_paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_daron_kloster_info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//Tell me more about the monastery.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//We instruct our students in all forms of magic. But the arts of the Magicians of Fire consist of more than these alone.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//We are also well versed in the art of alchemy, and in the creation of powerful runes.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//We also make an excellent wine.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = FALSE;
	description = "What are you doing in town?";
};


func int dia_daron_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher))
	{
		return TRUE;
	};
};

func void dia_daron_stadt_info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//What are you doing in town?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//I have discussions with the paladins and support the citizens with my advice and helpful words.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//Particularly in these difficult times, it is our duty to be there for the people and to help the poor.
};


instance DIA_ADDON_DARON_GUILDHELP(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_addon_daron_guildhelp_condition;
	information = dia_addon_daron_guildhelp_info;
	description = "I've heard rumors about a statuette...";
};


func int dia_addon_daron_guildhelp_condition()
{
	if((MIS_ADDON_VATRAS_GO2DARON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_daron_stadt))
	{
		return TRUE;
	};
};

func void dia_addon_daron_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_00");	//I heard rumors about a statuette you have supposedly lost.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_01");	//Have you, now? You can only have heard that from Vatras the Water Mage.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_02");	//What's the problem?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_03");	//A very valuable statuette has been sent to the monastery from the mainland. But it never arrived at the monastery.
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_15_04");	//Has the ship been raided?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_05");	//(ashamed) No. It got to Khorinis safe and sound, and I went to collect it there.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_06");	//Then, when I was on my way to the monastery, a band of goblins got hold of it.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_10_07");	//(angrily) Now don't you look at me that way. We magicians are only human, too, you know.
	MIS_ADDON_VATRAS_GO2DARON = LOG_SUCCESS;
	MIS_ADDON_DARON_GETSTATUE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_daron_guildhelp);
	Info_AddChoice(dia_addon_daron_guildhelp,"You said that the goblins have it now?",dia_addon_daron_guildhelp_gobbos);
	Info_AddChoice(dia_addon_daron_guildhelp,"Where was it that you lost that statuette?",dia_addon_daron_guildhelp_wo);
	Info_AddChoice(dia_addon_daron_guildhelp,"Didn't you try to get that statuette back?",dia_addon_daron_guildhelp_wiederholen);
};

func void dia_addon_daron_guildhelp_wiederholen()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wiederholen_15_00");	//Didn't you try to get that statuette back?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wiederholen_10_01");	//Of course I did! I searched for it high and low. But to no avail.
};

func void dia_addon_daron_guildhelp_gobbos()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_gobbos_15_00");	//You said that the goblins have it now?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_01");	//They stole it and made off into the underbrush with it.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_gobbos_10_02");	//I never saw them again. They're probably holing up in some pit in the ground.
};

func void dia_addon_daron_guildhelp_wo()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_wo_15_00");	//Where was it that you lost that statuette?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_wo_10_01");	//I was on my way to the monastery. Near Orlan's tavern.
	Info_AddChoice(dia_addon_daron_guildhelp,"I've heard enough. I'll find the thing for you.",dia_addon_daron_guildhelp_auftrag);
	Info_AddChoice(dia_addon_daron_guildhelp,"Orlan's tavern? Where would that be?",dia_addon_daron_guildhelp_wotaverne);
};

func void dia_addon_daron_guildhelp_wotaverne()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_woTaverne_15_00");	//Orlan's tavern? Where would that be?
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_01");	//If you leave the city by this gate here and simply follow the path, you'll come to a house that stands by itself.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_woTaverne_10_02");	//That's Orlan's tavern. The 'Dead Harpy'.
};

func void dia_addon_daron_guildhelp_auftrag()
{
	AI_Output(other,self,"DIA_Addon_Daron_GuildHelp_auftrag_15_00");	//I've heard enough. I'll find the thing for you.
	AI_Output(self,other,"DIA_Addon_Daron_GuildHelp_auftrag_10_01");	//May Innos guide you and protect you from the dangers that await you outside the city gates.
	Info_ClearChoices(dia_addon_daron_guildhelp);
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Daron was robbed by some impertinent goblins. Since then he's been missing a valuable statuette that he was supposed to take to the monastery. The goblins are said to be hiding in a hole near the 'Dead Harpy' tavern.");
};


instance DIA_ADDON_DARON_FOUNDSTATUE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_addon_daron_foundstatue_condition;
	information = dia_addon_daron_foundstatue_info;
	description = "I found your statuette.";
};


func int dia_addon_daron_foundstatue_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && (DIA_GORAX_GOLD_PERM == FALSE) && (MIS_ADDON_DARON_GETSTATUE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_daron_foundstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_00");	//I found your statuette.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_01");	//Praise be to Innos!
	AI_Output(other,self,"DIA_Addon_Daron_FoundStatue_15_02");	//What will you do with it now?
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_03");	//Nothing at all. It brought me nothing but bad luck.
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_04");	//YOU'll take it back to the monastery for me, son.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_05");	//Naturally, they won't let you in unless you dedicate the rest of your life to serving the monastery.
		AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_06");	//But I'm sure you won't mind doing that if it means you can be of service to ME, right?
	};
	AI_Output(self,other,"DIA_Addon_Daron_FoundStatue_10_07");	//Go with Innos, my son!
};


instance DIA_ADDON_DARON_RETURNEDSTATUE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 5;
	condition = dia_addon_daron_returnedstatue_condition;
	information = dia_addon_daron_returnedstatue_info;
	description = "I took your statuette to the monastery.";
};


func int dia_addon_daron_returnedstatue_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (MIS_ADDON_DARON_GETSTATUE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_daron_returnedstatue_info()
{
	AI_Output(other,self,"DIA_Addon_Daron_ReturnedStatue_15_00");	//I took your statuette to the monastery. So you can relax now.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_01");	//That's good news. May Innos protect you.
	AI_Output(self,other,"DIA_Addon_Daron_ReturnedStatue_10_02");	//Take this as a small token of my gratitude, son.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	TOPIC_END_RANGERHELPKDF = TRUE;
	b_giveplayerxp(XP_ADDON_REPORTLOSTINNOSSTATUE2DARON);
};


instance DIA_DARON_ARM(C_INFO)
{
	npc = kdf_511_daron;
	nr = 10;
	condition = dia_daron_arm_condition;
	information = dia_daron_arm_info;
	permanent = FALSE;
	description = "I am poor!";
};


func int dia_daron_arm_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_stadt) && (Npc_HasItems(other,itmi_gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_daron_arm_info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//I am poor!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//So, you are impoverished. No wonder in these times. Take this gold, it should help you.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//But you should look for work, then you will see how quickly gold comes to you. And then you may give to the church of Innos, as she has given to you.
	b_giveinvitems(self,other,itmi_gold,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 990;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "I want to make a donation...";
};


var int dia_daron_spende_permanent;

func int dia_daron_spende_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_DARON_SPENDE_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_daron_spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_spende_info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//I want to make a donation...
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"But I didn't bring enough gold...(BACK)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50  gold)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 gold)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 gold)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//You have donated more than 1000 gold pieces overall to me.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//The blessing of the Lord Innos is always with you.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//But I didn't bring enough gold...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//That doesn't matter, my son. You can also donate as much as you want later.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//I bless you in the name of Innos. For he is light and righteousness.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron the Fire Magician has given me his blessing.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//You can donate at any time if you have brought enough gold.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//Innos, you are the light which illuminates the path of the just.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//In your name, I bless this man. May your light shine upon him.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron the Fire Magician has given me his blessing.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//The Lord says - if you wish to pray, open your spirit. And if you wish to donate, bring your gift along.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//Innos, bless this man. Let your light shine upon him.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//Give him strength to behave justly.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"Daron the Fire Magician has given me his blessing.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//If you want to donate that much gold, you should actually bring it, too.
	};
	Info_ClearChoices(dia_daron_spende);
};


instance DIA_DARON_PICKPOCKET(C_INFO)
{
	npc = kdf_511_daron;
	nr = 900;
	condition = dia_daron_pickpocket_condition;
	information = dia_daron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_daron_pickpocket_condition()
{
	return c_beklauen(47,80);
};

func void dia_daron_pickpocket_info()
{
	Info_ClearChoices(dia_daron_pickpocket);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_BACK,dia_daron_pickpocket_back);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_PICKPOCKET,dia_daron_pickpocket_doit);
};

func void dia_daron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_daron_pickpocket);
};

func void dia_daron_pickpocket_back()
{
	Info_ClearChoices(dia_daron_pickpocket);
};

