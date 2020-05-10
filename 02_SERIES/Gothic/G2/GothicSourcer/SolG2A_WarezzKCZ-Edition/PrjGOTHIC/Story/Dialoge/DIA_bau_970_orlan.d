
instance DIA_ORLAN_EXIT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 999;
	condition = dia_orlan_exit_condition;
	information = dia_orlan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orlan_exit_condition()
{
	return TRUE;
};

func void dia_orlan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORLAN_WEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_wein_condition;
	information = dia_orlan_wein_info;
	permanent = FALSE;
	description = "I'm bringing the wine from the monastery.";
};


func int dia_orlan_wein_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) >= 12))
	{
		return TRUE;
	};
};

func void dia_orlan_wein_info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//I'm bringing the wine from the monastery.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//Excellent. That's what I've been waiting for.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//I have already agreed on the price with Master Gorax. I'll give you the 100 gold coins straightaway.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"All right, give me the gold, then.",dia_orlan_wein_ja);
	Info_AddChoice(dia_orlan_wein,"Are you trying to pull a fast one? The price is 240 gold coins.",dia_orlan_wein_nein);
};

func void dia_orlan_wein_ja()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//All right, give me the gold, then.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//Here you go. It was a pleasure doing business with you.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_nein()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//Are you trying to pull a fast one? The price is 240 gold coins.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//So, Gorax warned you, did he? All right, maybe the two of us can do a bit of business. Look - I'll give you 100 gold pieces for the wine.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//You tell Gorax that I pulled the wool over your eyes and you'll get FOUR spell scrolls from me.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"Hey, just give me the 240 gold coins.",dia_orlan_wein_nie);
	Info_AddChoice(dia_orlan_wein,"All right, sounds fair enough. Give me those spell scrolls.",dia_orlan_wein_okay);
	Info_AddChoice(dia_orlan_wein,"What kind of spell scrolls are they?",dia_orlan_wein_was);
};

func void dia_orlan_wein_nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//Hey, just give me the 240 gold coins.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//You don't want to do business, eh? -sigh- All right, here's the gold.
	b_giveinvitems(self,other,itmi_gold,240);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ITEMSERHALTEN);
	PrintScreen(text,-1,-1,FONT_SCREENSMALL,2);
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//All right, sounds fair enough. Give me those spell scrolls.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//Here are the spell scrolls and the gold.
	b_giveinvitems(other,self,itfo_wine,12);
	CreateInvItems(hero,itsc_light,2);
	CreateInvItems(hero,itsc_lightheal,1);
	CreateInvItems(hero,itsc_sumgobskel,1);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//What kind of spell scrolls are they?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//No idea - I don't know anything about that. They're from a guest who... eh... forgot them here, yeah.
};


instance DIA_ORLAN_WERBISTDU(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_orlan_werbistdu_condition;
	information = dia_orlan_werbistdu_info;
	description = "Who are you?";
};


func int dia_orlan_werbistdu_condition()
{
	return TRUE;
};

func void dia_orlan_werbistdu_info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//I'm Orlan, the keeper of this modest tavern.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//What are you looking for, stranger? Maybe a decent sword, or a good piece of armor?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//A good swig from the country stills, or just some information?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//I can give you all that and more, if your coins ring.
};


instance DIA_ADDON_ORLAN_GREG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_greg_condition;
	information = dia_addon_orlan_greg_info;
	description = "Do you know that fellow with the eyepatch?";
};


func int dia_addon_orlan_greg_condition()
{
	if((SC_SAWGREGINTAVERNE == TRUE) && (KAPITEL <= 3) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Greg_15_00");	//Do you know that fellow with the eyepatch?
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_01");	//I've seen him here before. A nasty piece of work.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_02");	//Back then, he moved into one of my upstairs rooms, along with a huge crate.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_03");	//He had to be constantly nagged about paying the rent for his room. And even then, he took his own sweet time about it.
	AI_Output(self,other,"DIA_Addon_Orlan_Greg_05_04");	//Then, one day, he vanished just like that - along with the crate. I don't want anything to do with the likes of him.
};


instance DIA_ADDON_ORLAN_RANGER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_ranger_condition;
	information = dia_addon_orlan_ranger_info;
	description = "Am I being paranoid, or are you staring at my ring?";
};


func int dia_addon_orlan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (SCISWEARINGRANGERRING == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_15_00");	//Am I being paranoid, or are you staring at my ring?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_05_01");	//I'm not quite sure what to make of that.
	ORLAN_KNOWSSCASRANGER = TRUE;
	Info_ClearChoices(dia_addon_orlan_ranger);
	Info_AddChoice(dia_addon_orlan_ranger,"Man! I belong to the 'Ring of Water'!",dia_addon_orlan_ranger_idiot);
	Info_AddChoice(dia_addon_orlan_ranger,"It's an aquamarine. Ever seen one before?",dia_addon_orlan_ranger_aqua);
};

func void dia_addon_orlan_ranger_aqua()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Aqua_15_00");	//It's an aquamarine. Ever seen one before?
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_01");	//Yes, I have. Welcome to headquarters, Brother of the Ring.
	if(Npc_KnowsInfo(other,dia_addon_orlan_nomeeting))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_02");	//... even if you appear to be a few candles short of an altar.
	};
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Aqua_05_03");	//What can I do for you?
	Info_ClearChoices(dia_addon_orlan_ranger);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_orlan_ranger_idiot()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Ranger_Lares_15_00");	//Man! I belong to the 'Ring of Water'!
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_01");	//Do you now? Hard to believe they would pick such a moron.
	AI_Output(self,other,"DIA_Addon_Orlan_Ranger_Lares_05_02");	//What do you want?
	Info_ClearChoices(dia_addon_orlan_ranger);
};


instance DIA_ADDON_ORLAN_TELEPORTSTEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_teleportstein_condition;
	information = dia_addon_orlan_teleportstein_info;
	description = "Have you ever used a teleporter stone?";
};


func int dia_addon_orlan_teleportstein_condition()
{
	if((ORLAN_KNOWSSCASRANGER == TRUE) && (SCUSED_TELEPORTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_teleportstein_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_15_00");	//Have you ever used a teleporter stone?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_01");	//Are you out of your mind? As long as none of the Water Mages swears to me that there's no danger, I'm not going anywhere near those things.
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_05_02");	//They ordered me to hide one of those teleporter stones, and apart from that I'm staying well away from them.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_orlan_teleportstein);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Can I have a look at this teleporter stone?",dia_addon_orlan_teleportstein_sehen);
	Info_AddChoice(dia_addon_orlan_teleportstein,"Where is this teleporter stone?",dia_addon_orlan_teleportstein_wo);
};

func void dia_addon_orlan_teleportstein_sehen()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_sehen_15_00");	//Can I have a look at this teleporter stone?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_sehen_05_01");	//I don't care. Here's the key. I've blocked the entrance.
	CreateInvItems(self,itke_orlan_teleportstation,1);
	b_giveinvitems(self,other,itke_orlan_teleportstation,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Orlan has locked up a teleporter stone in a cave southwest of his tavern.");
};

func void dia_addon_orlan_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Orlan_Teleportstein_wo_15_00");	//Where is this teleporter stone?
	AI_Output(self,other,"DIA_Addon_Orlan_Teleportstein_wo_05_01");	//There's a cave to the south, not far from my tavern. That's where the Water Mages found one of those things.
};


instance DIA_ADDON_ORLAN_NOMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_addon_orlan_nomeeting_condition;
	information = dia_addon_orlan_nomeeting_info;
	description = "I'm here to join the Ring of Water!";
};


func int dia_addon_orlan_nomeeting_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && !Npc_KnowsInfo(other,dia_addon_orlan_ranger) && (SCISWEARINGRANGERRING == FALSE) && (MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_nomeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_NoMeeting_15_00");	//I'm here to join the Ring of Water!
	AI_Output(self,other,"DIA_Addon_Orlan_NoMeeting_05_01");	//(curtly) I see no ring here. Can I get you a drink?
};


instance DIA_ADDON_ORLAN_WHENRANGERMEETING(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_addon_orlan_whenrangermeeting_condition;
	information = dia_addon_orlan_whenrangermeeting_info;
	description = "I heard that the 'Ring' is going to meet in your tavern.";
};


func int dia_addon_orlan_whenrangermeeting_condition()
{
	if((MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_orlan_ranger))
	{
		return TRUE;
	};
};

func void dia_addon_orlan_whenrangermeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_15_00");	//I heard that the 'Ring' is going to meet in your tavern.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_01");	//That's right. They should be starting just about now.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_05_02");	//I wonder what's taking them so long?
	b_giveplayerxp(XP_AMBIENT);
	b_addon_orlan_rangersreadyforcoming();
	self.flags = 0;
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"They should be here before long.",dia_addon_orlan_whenrangermeeting_theycome);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"The meeting is today?",dia_addon_orlan_whenrangermeeting_today);
};

func void dia_addon_orlan_whenrangermeeting_today()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_Today_15_00");	//The meeting is today?
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_01");	//Yes, at least that's what I seem to recall.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_Today_05_02");	//I hope it won't get so late again.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(more)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_theycome()
{
	AI_Output(other,self,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_15_00");	//They should be here before long.
	AI_Output(self,other,"DIA_Addon_Orlan_WhenRangerMeeting_theyCome_05_01");	//We'll see.
	b_makerangerreadyformeetingall();
	Info_ClearChoices(dia_addon_orlan_whenrangermeeting);
	Info_AddChoice(dia_addon_orlan_whenrangermeeting,"(more)",dia_addon_orlan_whenrangermeeting_los);
};

func void dia_addon_orlan_whenrangermeeting_los()
{
	AI_StopProcessInfos(self);
	b_addon_orlan_comingranger();
};


instance DIA_ORLAN_RUESTUNG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_orlan_ruestung_condition;
	information = dia_orlan_ruestung_info;
	permanent = TRUE;
	description = "What kind of armor can you offer me?";
};


var int dia_orlan_ruestung_noperm;

func int dia_orlan_ruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (DIA_ORLAN_RUESTUNG_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_ruestung_info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//What kind of armor can you offer me?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//I have here a very nice piece that is sure to please you.
	Info_ClearChoices(dia_orlan_ruestung);
	Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
	Info_AddChoice(dia_orlan_ruestung,"Buy hunter's armor. Protection: B.+35/B.+20/P.+10/Df.+10/M.+20 (510 gold)",dia_orlan_ruestung_buy);
};

func void dia_orlan_ruestung_buy()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//All right, give me the armor.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_ITAR_GERALT_ADDON))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//A wise decision.
		CreateInvItems(self,itar_geralt_addon,1);
		b_giveinvitems(self,other,itar_geralt_addon,1);
		AI_EquipBestArmor(other);
		DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//Sorry. Once you have the wherewithal, we can do business.
	};
	Info_ClearChoices(dia_orlan_ruestung);
};

func void dia_orlan_ruestung_back()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//As you like. But don't wait too long.
	Info_ClearChoices(dia_orlan_ruestung);
};


instance DIA_ORLAN_TRADE(C_INFO)
{
	npc = bau_970_orlan;
	nr = 70;
	condition = dia_orlan_trade_condition;
	information = dia_orlan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Show me your wares.";
};


func int dia_orlan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_trade_info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//Show me your wares.
	b_givetradeinv(self);
	if((SC_ISRANGER == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Orlan_TRADE_05_00");	//Certainly, Brother of the Ring.
		ORLAN_KNOWSSCASRANGER = TRUE;
	}
	else if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//Of course. It is an honor for me to receive such an important guest.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//Of course, sir.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//If you can pay.
	};
};


instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 6;
	condition = dia_orlan_hotelzimmer_condition;
	information = dia_orlan_hotelzimmer_info;
	permanent = TRUE;
	description = "How much do you charge for a room?";
};


var int orlan_scgothotelzimmer;
var int orlan_scgothotelzimmerday;

func int dia_orlan_hotelzimmer_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (ORLAN_SCGOTHOTELZIMMER == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_hotelzimmer_info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//How much do you charge for a room?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
	{
		if((SC_ISRANGER == TRUE) || (SCISWEARINGRANGERRING == TRUE) || (ORLAN_KNOWSSCASRANGER == TRUE))
		{
			AI_Output(self,other,"DIA_Addon_Orlan_HotelZimmer_05_00");	//For a brother of the 'Ring'? Nothing.
			ORLAN_RANGERHELPZIMMER = TRUE;
			ORLAN_KNOWSSCASRANGER = TRUE;
		}
		else if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//For a knight of the King, I always have a room available. Free of charge, of course.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//I would never dare to take money from one of Innos' earthly representatives for my services .
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//Here's the key to the upper rooms. Pick one for yourself.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMER = TRUE;
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//Give me 50 gold coins for a week, and you can choose a room.
		Info_ClearChoices(dia_orlan_hotelzimmer);
		Info_AddChoice(dia_orlan_hotelzimmer,"Damn expensive.",dia_orlan_hotelzimmer_nein);
		Info_AddChoice(dia_orlan_hotelzimmer,"All right. Here's the dough.",dia_orlan_hotelzimmer_ja);
	};
};

func void dia_orlan_hotelzimmer_ja()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//All right. Here's the dough.
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//Here's the key. The rooms are upstairs. But don't get everything dirty and pay your rent on time, understand?
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		ORLAN_SCGOTHOTELZIMMER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//You don't have 50. Money first, then pleasure.
	};
	Info_ClearChoices(dia_orlan_hotelzimmer);
};

func void dia_orlan_hotelzimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//Damn expensive.
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//Then you'll have to look elsewhere, my friend.
	Info_ClearChoices(dia_orlan_hotelzimmer);
};


var int orlan_angriffwegenmiete;

instance DIA_ORLAN_MIETEFAELLIG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 10;
	condition = dia_orlan_mietefaellig_condition;
	information = dia_orlan_mietefaellig_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_orlan_mietefaellig_nomore;

func int dia_orlan_mietefaellig_condition()
{
	if((SC_ISRANGER == TRUE) || (ORLAN_RANGERHELPZIMMER == TRUE))
	{
		return FALSE;
	};
	if((ORLAN_ANGRIFFWEGENMIETE == TRUE) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
			ORLAN_ANGRIFFWEGENMIETE = FALSE;
			return FALSE;
		};
	};
	if((ORLAN_SCGOTHOTELZIMMER == TRUE) && (ORLAN_SCGOTHOTELZIMMERDAY <= (Wld_GetDay() - 7)) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_mietefaellig_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(slimily) I am delighted with your distinguished visit. Stay as long as you like. It is an honor.
		DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//When will I finally get my rent?
		Info_ClearChoices(dia_orlan_mietefaellig);
		Info_AddChoice(dia_orlan_mietefaellig,"Forget it. I'm not paying anymore.",dia_orlan_mietefaellig_nein);
		Info_AddChoice(dia_orlan_mietefaellig,"Here's your 50 gold coins.",dia_orlan_mietefaellig_ja);
	};
};


var int dia_orlan_mietefaellig_onetime;

func void dia_orlan_mietefaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//Here's your 50 gold coins.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//Well, it's about time.
		if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//Where are you hanging around all day?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//You don't want to know.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//Mmh. Well, it's none of my business anyway.
			DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
		};
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		Info_ClearChoices(dia_orlan_mietefaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//Say, are you trying to trick me? You don't even have enough money to pay for that meal. I'll teach you, you...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_orlan_mietefaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//Forget it. I'm not paying any more.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//Well, I'll teach you, you miserable cheat.
	ORLAN_ANGRIFFWEGENMIETE = TRUE;
	Info_ClearChoices(dia_orlan_mietefaellig);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ORLAN_WETTKAMPFLAEUFT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 7;
	condition = dia_orlan_wettkampflaeuft_condition;
	information = dia_orlan_wettkampflaeuft_info;
	important = TRUE;
};


func int dia_orlan_wettkampflaeuft_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF_DAY <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void dia_orlan_wettkampflaeuft_info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//There you are, finally. I've been waiting for you.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//What happened?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//The drinking contest is finally over.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//Who won?
	if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//This time Randolph has won. Rukhar must have been having a bad day.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//Once again, Rukhar has gotten Randolph pickled. It was only to be expected.
		RUKHAR_WON_WETTKAMPF = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//So, well, I hope that was the last time. I don't want that kind of to-do in my house ever again, remember that.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(randolph,"Start");
	if(Hlp_IsValidNpc(rukhar))
	{
		if(RUKHAR_WON_WETTKAMPF == TRUE)
		{
			b_startotherroutine(rukhar,"WettkampfRukharWon");
		}
		else
		{
			b_startotherroutine(rukhar,"WettkampfRukharLost");
		};
	};
	MIS_RUKHAR_WETTKAMPF = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_EINGEBROCKT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 8;
	condition = dia_orlan_eingebrockt_condition;
	information = dia_orlan_eingebrockt_info;
	important = TRUE;
};


func int dia_orlan_eingebrockt_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_orlan_eingebrockt_info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//That was a fine mess you got me into. Now I can play lookout for Rukhar again.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//Why?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//As long as he's holding his little contests in there, it's better if no outsider learns about it. It's not good for business, you see?
};


instance DIA_ORLAN_PERM(C_INFO)
{
	npc = bau_970_orlan;
	nr = 99;
	condition = dia_orlan_perm_condition;
	information = dia_orlan_perm_info;
	permanent = TRUE;
	description = "How's it going with your tavern?";
};


func int dia_orlan_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_perm_info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//How's it going with your tavern?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//Times have been better, you know?
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//People's purses aren't as open as they used to be.
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//Hopefully these black magicians will move on soon, otherwise I can close the tavern.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//Almost nobody dares to come here anymore.
	};
};


instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_minenanteil_condition;
	information = dia_orlan_minenanteil_info;
	description = "You're selling mine shares?";
};


func int dia_orlan_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_minenanteil_info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//You're selling mine shares?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//Sure. You can get anything from me, if the price is right.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_PICKPOCKET(C_INFO)
{
	npc = bau_970_orlan;
	nr = 900;
	condition = dia_orlan_pickpocket_condition;
	information = dia_orlan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_orlan_pickpocket_condition()
{
	return c_beklauen(89,260);
};

func void dia_orlan_pickpocket_info()
{
	Info_ClearChoices(dia_orlan_pickpocket);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_BACK,dia_orlan_pickpocket_back);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_PICKPOCKET,dia_orlan_pickpocket_doit);
};

func void dia_orlan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_orlan_pickpocket);
};

func void dia_orlan_pickpocket_back()
{
	Info_ClearChoices(dia_orlan_pickpocket);
};

