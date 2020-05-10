
func int c_bragobanditsdead()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		return TRUE;
	};
};


instance DIA_ADDON_CAVALORN_EXIT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 999;
	condition = dia_addon_cavalorn_exit_condition;
	information = dia_addon_cavalorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cavalorn_exit_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_PICKPOCKET(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 900;
	condition = dia_addon_cavalorn_pickpocket_condition;
	information = dia_addon_cavalorn_pickpocket_info;
	permanent = TRUE;
	description = "(It would be easy to steal his quiver of arrows)";
};


func int dia_addon_cavalorn_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (25 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_BACK,dia_addon_cavalorn_pickpocket_back);
	Info_AddChoice(dia_addon_cavalorn_pickpocket,DIALOG_PICKPOCKET,dia_addon_cavalorn_pickpocket_doit);
};

func void dia_addon_cavalorn_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 25)
	{
		b_giveinvitems(self,other,itrw_arrow,44);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_addon_cavalorn_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_addon_cavalorn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_cavalorn_pickpocket);
};


instance DIA_ADDON_CAVALORN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 1;
	condition = dia_addon_cavalorn_meetingisrunning_condition;
	information = dia_addon_cavalorn_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_cavalorn_meetingisrunning_onetime;

func int dia_addon_cavalorn_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_meetingisrunning_info()
{
	if(DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_MeetingIsRunning_08_00");	//Welcome to the 'Ring', my friend.
		DIA_ADDON_CAVALORN_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_08_01");	//Vatras will give you your next assignment.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CAVALORN_HALLO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_hallo_condition;
	information = dia_addon_cavalorn_hallo_info;
	description = "Are you in trouble?";
};


func int dia_addon_cavalorn_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cavalorn_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_15_00");	//Trouble?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_01");	//(annoyed) Damn. I don't know where they're all hiding. You kill one, and shortly afterwards they're all back again.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_08_02");	//(slyly) Wait a moment. I know you. You're the fellow who was constantly begging arrows from me in the Valley of Mines.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Your name is Cavalorn, right?",dia_addon_cavalorn_hallo_ja);
	Info_AddChoice(dia_addon_cavalorn_hallo,"I can barely remember...",dia_addon_cavalorn_hallo_weissnicht);
};

func void dia_addon_cavalorn_hallo_weissnicht()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_weissNicht_15_00");	//I can barely remember...?
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_weissNicht_08_01");	//Oh, come on. Back then in my hut outside the Old Camp, I taught you how to shoot a bow and how to sneak. Ring a bell?
};

func void dia_addon_cavalorn_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Ja_15_00");	//Your name is Cavalorn, right?
	b_giveplayerxp(50);
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_01");	//Ah. I see you haven't forgotten me after all we went through in the cursed colony.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Ja_08_02");	//Where are you heading?
	Info_ClearChoices(dia_addon_cavalorn_hallo);
	Info_AddChoice(dia_addon_cavalorn_hallo,"I don't have a specific goal.",dia_addon_cavalorn_hallo_keinziel);
	Info_AddChoice(dia_addon_cavalorn_hallo,"Back to the Valley of Mines.",dia_addon_cavalorn_hallo_bauern);
	if(mil_310_stadtwache.aivar[AIV_PASSGATE] == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_hallo,"To the city.",dia_addon_cavalorn_hallo_stadt);
	};
};

func void dia_addon_cavalorn_hallo_stadt()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Stadt_15_00");	//To the city.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_01");	//(laughs) Well, well. To the city, eh.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_02");	//You may run into problems with the guards.They aren't letting just anyone in any more, since the area here is swarming with bandits.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_03");	//In the past few days, one of those former psionics from the Valley of Mines came by here. He said he constantly goes in and out of Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_04");	//He went into the valley below the big tower. There must be a way in there somewhere near the waterfall.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Stadt_08_05");	//Maybe you should talk to the fellow.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_bauern()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_Bauern_15_00");	//Back to the Valley of Mines.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_01");	//(amazed) Really? Mmh. I wish I could follow you, but I have to finish my duties here first.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_Bauern_08_02");	//When you're in the Valley of Mines, could you please look around and see if my old hut is still standing? I'd like to return there one day.
	MIS_ADDON_CAVALORN_THEHUT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CAVALORNTHEHUT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CAVALORNTHEHUT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CAVALORNTHEHUT,"Cavalorn wants me to look and see if his old hut in the Valley of Mines is still standing. As far as I can remember, his hut is located in the hilly country west of the former Old Camp. I suspect he left something there.");
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};

func void dia_addon_cavalorn_hallo_keinziel()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HALLO_keinZiel_15_00");	//I don't have a specific goal.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HALLO_keinZiel_08_01");	//You don't want to tell me, huh? All right.
	Info_ClearChoices(dia_addon_cavalorn_hallo);
};


instance DIA_ADDON_CAVALORN_BEUTEL(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_beutel_condition;
	information = dia_addon_cavalorn_beutel_info;
	description = "I was at your hut in the Valley of Mines.";
};


func int dia_addon_cavalorn_beutel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || (SC_OPENEDCAVALORNSBEUTEL == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_beutel_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_00");	//I was at your hut in the Valley of Mines.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_01");	//So it's still standing.
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_02");	//Yes. And I also know what you wanted there.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_03");	//Did you find it?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_04");	//If you mean your pouch with the lumps of ore... yes, I have it.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_05");	//You're a fox, you know that?
	if(MIS_ADDON_CAVALORN_THEHUT == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_15_06");	//What else could you have wanted in that old shack? There isn't anything else.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_08_07");	//Do you have it with you? I'll give you 100 gold coins for it.
	TOPIC_END_CAVALORNTHEHUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	if(Npc_HasItems(other,itse_addon_cavalornsbeutel))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"Sure.",dia_addon_cavalorn_beutel_ja);
	}
	else if(Npc_HasItems(other,itmi_nugget))
	{
		Info_AddChoice(dia_addon_cavalorn_beutel,"No, but I have a lump of ore here.",dia_addon_cavalorn_beutel_jaerz);
	};
	Info_AddChoice(dia_addon_cavalorn_beutel,"No.",dia_addon_cavalorn_beutel_no);
};

func void dia_addon_cavalorn_beutel_back()
{
	Info_ClearChoices(dia_addon_cavalorn_beutel);
	AI_Output(self,other,"DIA_Addon_Cavalorn_back_08_00");	//I hope that I'll get it back soon.
};

func void dia_addon_cavalorn_beutel_jaerz()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_jaerz_15_00");	//No, but I have a lump of ore here.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_jaerz_08_01");	//Also good.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Why did you leave it there in the first place?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//I had no idea that ore was so valuable here in Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//For one measly piece of ore, you couldn't get so much as a place to sleep back in the penal colony.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//In the harbor city, they'll practically bash your skull in if they find out you have ore on you.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
};

func void dia_addon_cavalorn_beutel_ja()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_ja_15_00");	//Sure.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Why did you leave it there in the first place?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//I had no idea that ore was so valuable here in Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//For one measly piece of ore, you couldn't get so much as a place to sleep back in the penal colony.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//In the harbor city, they'll practically bash your skull in if they find out you have ore on you.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
};

func void dia_addon_cavalorn_beutel_no()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_00");	//No.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_ja_08_01");	//Terrific.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_no_08_01");	//Then get it BACK for me. After all, I would even have gone back into that cursed Valley of Mines.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_no_15_02");	//I'm getting all misty-eyed.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Beutel_why_15_00");	//Why did you leave it there in the first place?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_01");	//I had no idea that ore was so valuable here in Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_02");	//For one measly piece of ore, you couldn't get so much as a place to sleep back in the penal colony.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Beutel_why_08_03");	//In the harbor city, they'll practically bash your skull in if they find out you have ore on you.
	Info_ClearChoices(dia_addon_cavalorn_beutel);
};


instance DIA_ADDON_CAVALORN_ERZGEBEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_erzgeben_condition;
	information = dia_addon_cavalorn_erzgeben_info;
	description = "Give me 100 gold coins and I'll give you your ore back.";
};


func int dia_addon_cavalorn_erzgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_beutel) && (Npc_HasItems(other,itse_addon_cavalornsbeutel) || Npc_HasItems(other,itmi_nugget)))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_erzgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ErzGeben_15_00");	//Give me 100 gold coins and I'll give you your ore back.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_01");	//Deal. Here you go.
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	if(Npc_HasItems(other,itse_addon_cavalornsbeutel))
	{
		b_giveinvitems(other,self,itse_addon_cavalornsbeutel,1);
	}
	else
	{
		b_giveinvitems(other,self,itmi_nugget,1);
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_ErzGeben_08_02");	//You're a real friend. Thanks a lot.
	MIS_ADDON_CAVALORN_THEHUT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_CAVALORNSBEUTEL);
};


instance DIA_ADDON_CAVALORN_WASMACHSTDU(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_wasmachstdu_condition;
	information = dia_addon_cavalorn_wasmachstdu_info;
	description = "What are you doing here?";
};


func int dia_addon_cavalorn_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WASMACHSTDU_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WASMACHSTDU_08_01");	//I'm sitting tight. If it hadn't been for these damned bandits, I wouldn't be here.
};


instance DIA_ADDON_CAVALORN_BANDITEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 10;
	condition = dia_addon_cavalorn_banditen_condition;
	information = dia_addon_cavalorn_banditen_info;
	description = "What was that about bandits?";
};


func int dia_addon_cavalorn_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_wasmachstdu) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_banditen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_00");	//What was that about bandits?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_01");	//Have you slept through the last few weeks?
	AI_Output(other,self,"DIA_Addon_Cavalorn_Banditen_15_02");	//Eh...
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_03");	//I'm talking about all the riff-raff from the penal colony that are making themselves at home here in the area. Plundering and murdering for all they're worth.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_04");	//(sighs) I guess I'm lucky they didn't kill me. I let down my guard for one moment, and they clubbed me from behind.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Banditen_08_05");	//No idea how I'll get all my stuff back now.
	};
};


instance DIA_ADDON_CAVALORN_ARTEFAKT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_artefakt_condition;
	information = dia_addon_cavalorn_artefakt_info;
	description = "You were robbed by the bandits?";
};


func int dia_addon_cavalorn_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (MIS_ADDON_CAVALORN_KILLBRAGO != LOG_SUCCESS) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_artefakt_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_ARTEFAKT_15_00");	//You were robbed by the bandits?
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_01");	//(furious) Yes. They beat me down and tossed me to the goblins for lunch.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_02");	//It was damned important stuff. A letter and all my money. I absolutely have to get it back.
	AI_Output(self,other,"DIA_Addon_Cavalorn_ARTEFAKT_08_03");	//But without someone to watch my back, I'm not going back there. That cowardly rabble...
};


instance DIA_ADDON_CAVALORN_HELFEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_helfen_condition;
	information = dia_addon_cavalorn_helfen_info;
	description = "Can I help you with the bandits?";
};


func int dia_addon_cavalorn_helfen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_artefakt) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_helfen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_HELFEN_15_00");	//Can I help you with the bandits?
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_01");	//(slyly) Maybe. But as scrawny as you look, you surely haven't held a proper sword in your hands for weeks.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_02");	//Well. I don't have any choice but to take your offer. My time is running out.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_03");	//So, pay attention. Down this path here, you'll find one of those filthy holes in the ground that bandits like to hide in.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_04");	//The fellows there are the same ones who stole my stuff.
	AI_Output(self,other,"DIA_Addon_Cavalorn_HELFEN_08_05");	//Let me know when you're ready and we'll nab the rabble.
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLBRAGO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLBRAGO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLBRAGO,"The bandits near Cavalorn stole something valuable from him. He wants us to tangle with the bandits together.");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_CAVALORN_AUSRUESTUNG(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ausruestung_condition;
	information = dia_addon_cavalorn_ausruestung_info;
	description = "I need better equipment.";
};


func int dia_addon_cavalorn_ausruestung_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO != 0) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ausruestung_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_00");	//I need better equipment.
	if(c_bragobanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_01");	//Those swine haven't left me much.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_02");	//I can give you a wolf knife. Will that do for now?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_03");	//You call that a knife?
	CreateInvItems(self,itmw_1h_sword_l_03,1);
	b_giveinvitems(self,other,itmw_1h_sword_l_03,1);
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_04");	//But what about healing?
	AI_Output(self,other,"DIA_Addon_Cavalorn_AUSRUESTUNG_08_05");	//I still have 2 healing potions here. Interested?
	AI_Output(other,self,"DIA_Addon_Cavalorn_AUSRUESTUNG_15_06");	//Sure. Give 'em here.
	CreateInvItems(self,itpo_health_01,2);
	b_giveinvitems(self,other,itpo_health_01,2);
};


instance DIA_ADDON_CAVALORN_LETSKILLBANDITS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_letskillbandits_condition;
	information = dia_addon_cavalorn_letskillbandits_info;
	description = "Let's mix it up with those guys.";
};


func int dia_addon_cavalorn_letskillbandits_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS) && (c_bragobanditsdead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_letskillbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_LETSKILLBANDITS_15_00");	//Let's mix it up with those guys.
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_01");	//Sure thing. Just keep my back clear, ok?
	AI_Output(self,other,"DIA_Addon_Cavalorn_LETSKILLBANDITS_08_02");	//Now they're in for a nasty surprise.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KillBandits");
	if(BDT_1013_AWAY == FALSE)
	{
		ambusher_1013.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	ambusher_1014.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	ambusher_1015.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void b_addon_cavalorn_vatrasbrief()
{
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_00");	//Then I can finally fulfill my mission. I've lost too much time already.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_01");	//What sort of mission...?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_02");	//(to himself) Ah. Yeah. First I have to get into the city and then later...
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_03");	//(sighs) I don't know how I'm going to get all that done in time.
		AI_Output(other,self,"DIA_Addon_Cavalorn_VatrasBrief_15_04");	//(drily) What about me?
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_05");	//(appraisingly) Mmh. Why not. You could take the letter into the city.
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_06");	//Then I'll have a bit more time to take care of my equipment.
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_07");	//One of the bandits must have the letter in his pocket.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_08");	//Take it to Vatras, the Water Mage in the city. You'll find him in the Tempel of Adanos. He preaches there all day.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_09");	//Tell him that I wasn't able to get it done.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_10");	//And if he asks where I am, just tell him I'm already on my way to the meeting point, ok?
		b_logentry(TOPIC_ADDON_KDW,"Vatras the Water Mage is in the seaport Khorinis. He preaches in the Adanos temple there.");
	};
	if((Npc_HasEquippedArmor(other) == FALSE) && (hero.guild == GIL_NONE) && (MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_11");	//Oh, yeah, one more thing. First buy some decent clothes from the farmers.
		AI_Output(self,other,"DIA_Addon_Cavalorn_VatrasBrief_08_12");	//Otherwise you may be taken for a bandit. Here's a couple of coins.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
	};
	MIS_ADDON_CAVALORN_KILLBRAGO = LOG_SUCCESS;
	if(MIS_ADDON_CAVALORN_LETTER2VATRAS == 0)
	{
		MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_RUNNING;
	};
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_ADDON_CAVALORN_KILLBRAGO);
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_ADDON_CAVALORN_BRAGOKILLED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_bragokilled_condition;
	information = dia_addon_cavalorn_bragokilled_info;
	important = TRUE;
};


func int dia_addon_cavalorn_bragokilled_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_LEFT") < 500) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_bragokilled_info()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_BragoKilled_08_00");	//So, that's done. Hah. They shouldn't have messed with me.
	b_addon_cavalorn_vatrasbrief();
	Wld_InsertNpc(gobbo_green,"NW_XARDAS_BANDITS_01");
};


instance DIA_ADDON_CAVALORN_PCKILLEDBRAGO(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_pckilledbrago_condition;
	information = dia_addon_cavalorn_pckilledbrago_info;
	description = "The bandits are finished.";
};


func int dia_addon_cavalorn_pckilledbrago_condition()
{
	if((MIS_ADDON_CAVALORN_KILLBRAGO == 0) && Npc_KnowsInfo(other,dia_addon_cavalorn_banditen) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_pckilledbrago_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_PCKilledBrago_15_00");	//The bandits are finished.
	b_addon_cavalorn_vatrasbrief();
};


instance DIA_ADDON_CAVALORN_JUNGS(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_jungs_condition;
	information = dia_addon_cavalorn_jungs_info;
	description = "That's some interesting armor you're wearing.";
};


func int dia_addon_cavalorn_jungs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_jungs_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_JUNGS_15_00");	//Interesting armor you're wearing. Don't you belong to the Shadows any more?
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_01");	//Shadows? They haven't existed since the fall of the Barrier.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_02");	//The moment we could finally leave the Valley of Mines there was no reason for me to stick with them.
	AI_Output(self,other,"DIA_Addon_Cavalorn_JUNGS_08_03");	//Now I work for the Water Mages. I belong to the 'Ring of Water'.
	SC_KNOWSRANGER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Cavalorn told me that he belongs to a community that calls itself the 'Ring of Water'.");
	CAVALORN_RANGERHINT = TRUE;
};


instance DIA_ADDON_CAVALORN_RING(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_ring_condition;
	information = dia_addon_cavalorn_ring_info;
	permanent = FALSE;
	description = "Tell me more about the 'Ring of Water'!";
};


func int dia_addon_cavalorn_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ring_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ring_15_00");	//Tell me more about the 'Ring of Water'!
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_01");	//I'm not really allowed to talk about it.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_02");	//All I can do is send you to Vatras. He is the representative of the Water Mages in Khorinis.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_03");	//The best thing would be to talk to him. Tell him you come from me.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ring_08_04");	//Maybe he'll take you on as one of us. We urgently need more good people...
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras the Water Mage can tell me more about the 'Ring of Water'.");
};


instance DIA_ADDON_CAVALORN_FEINDE(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_feinde_condition;
	information = dia_addon_cavalorn_feinde_info;
	permanent = FALSE;
	description = "Weren't you and your people enemies of the Water Mages back then?";
};


func int dia_addon_cavalorn_feinde_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_feinde_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Feinde_15_00");	//Weren't you and your people enemies of the Water Mages back then?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_01");	//Those crazy old days are over. There isn't any more 'New Camp' or 'Old Camp'.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_02");	//Now that the penal colony no longer exists, everyone is on his own.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_03");	//Most of us former prisoners are still being hunted.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Feinde_08_04");	//The Water Mages were able to get my sentence commuted and now I can move around freely.
};


instance DIA_ADDON_CAVALORN_KDWTASK(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 6;
	condition = dia_addon_cavalorn_kdwtask_condition;
	information = dia_addon_cavalorn_kdwtask_info;
	permanent = FALSE;
	description = "What are the Water Mages doing now?";
};


func int dia_addon_cavalorn_kdwtask_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_jungs) && (MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_kdwtask_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_00");	//What are the Water Mages doing now?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_01");	//They're up to something big. It has to do with an unknown region of the island.
	AI_Output(other,self,"DIA_Addon_Cavalorn_KdWTask_15_02");	//An unknown region? Where is it supposed to be?
	AI_Output(self,other,"DIA_Addon_Cavalorn_KdWTask_08_03");	//I can't tell you more. Talk to Vatras in Khorinis.
};


instance DIA_ADDON_CAVALORN_BROUGHTLETTER(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_broughtletter_condition;
	information = dia_addon_cavalorn_broughtletter_info;
	description = "I gave Vatras your letter.";
};


func int dia_addon_cavalorn_broughtletter_condition()
{
	if((MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_cavalorn_jungs))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_broughtletter_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_BroughtLetter_15_00");	//I gave Vatras your letter.
	AI_Output(self,other,"DIA_Addon_Cavalorn_BroughtLetter_08_01");	//I didn't expect anything else. Thanks.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_CAVALORN_ORNAMENT(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 2;
	condition = dia_addon_cavalorn_ornament_condition;
	information = dia_addon_cavalorn_ornament_info;
	description = "Are you looking for something?";
};


func int dia_addon_cavalorn_ornament_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_00");	//Are you looking for something?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_01");	//Is it that obvious? Yes, I have an assignment from the Water Mages to look for some lost ornament.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_02");	//That's convenient. I have the same assignement from Nefarius.
	if(SC_KNOWSRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_03");	//So you belong to the 'Ring of Water'?
		if(SC_ISRANGER == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_04");	//Yes.
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_05");	//Not yet, but I'm working on it.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_06");	//I'm glad. Then I don't have to do this alone.
	AI_Output(other,self,"DIA_Addon_Cavalorn_Ornament_15_07");	//Have you already found an ornament?
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_08");	//I found the place where we should find one.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_09");	//This stone circle could be one of those structures that Nefarius described.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Ornament_08_10");	//Now we just have to find the mechanism we're supposed to look for.
};


instance DIA_ADDON_CAVALORN_TRIGGERED(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_triggered_condition;
	information = dia_addon_cavalorn_triggered_info;
	description = "I operated the mechanism.";
};


func int dia_addon_cavalorn_triggered_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_cavalorn_ornament) && (ORNAMENT_SWITCHED_FARM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_triggered_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_15_00");	//I tried the mechanism. It doesn't do anything at all.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_01");	//Then Lobart's farmers were right.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_02");	//They said that one of them had already played around with the stones here.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_03");	//A stone sentinel appeared out of nowhere and attacked them.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_04");	//The farmers called the militia, the militiamen called the paladins who came and destroyed the monster.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_08_05");	//I've already searched the whole area. If there was an ornament here, the paladins have it now.
	Info_ClearChoices(dia_addon_cavalorn_triggered);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Then one of us has to get into the upper quarter of the city.",dia_addon_cavalorn_triggered_pal);
	Info_AddChoice(dia_addon_cavalorn_triggered,"Then I'll go to them and demand the ornament back.",dia_addon_cavalorn_triggered_oback);
};

func void b_cavalorn_triggered_wohin()
{
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Wohin_08_00");	//I'm going to the city now. We'll meet again at Vatras'.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Stadt");
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"One of the missing ornament fragments is with the paladins in the upper quarter.");
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_RUNNING;
	self.flags = 0;
};

func void dia_addon_cavalorn_triggered_oback()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_OBack_15_00");	//Then I'll go to them and demand the ornament back.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_OBack_08_01");	//All right.
	b_cavalorn_triggered_wohin();
};

func void dia_addon_cavalorn_triggered_pal()
{
	AI_UnequipArmor(self);
	CreateInvItems(self,itar_bau_l,1);
	Npc_RemoveInvItems(self,itar_ranger_addon,Npc_HasItems(self,itar_ranger_addon));
	Npc_RemoveInvItems(self,itar_fake_ranger,Npc_HasItems(self,itar_fake_ranger));
	AI_EquipBestArmor(self);
	AI_Output(other,self,"DIA_Addon_Cavalorn_Triggered_Pal_15_00");	//Then one of us has to get into the upper quarter of the city.
	AI_Output(self,other,"DIA_Addon_Cavalorn_Triggered_Pal_08_01");	//I don't have any time for that. You'll have to do it.
	b_cavalorn_triggered_wohin();
};


instance DIA_ADDON_CAVALORN_GOTORNAFROMHAGEN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 5;
	condition = dia_addon_cavalorn_gotornafromhagen_condition;
	information = dia_addon_cavalorn_gotornafromhagen_info;
	description = "I got the missing ornament from Lord Hagen.";
};


func int dia_addon_cavalorn_gotornafromhagen_condition()
{
	if(LORD_HAGEN_GOTORNAMENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_gotornafromhagen_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_GotOrnaFromHagen_15_00");	//I got the missing ornament from Lord Hagen.
	AI_Output(self,other,"DIA_Addon_Cavalorn_GotOrnaFromHagen_08_01");	//You see? I thought the paladins had it.
	b_giveplayerxp(XP_AMBIENT);
	MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL = LOG_SUCCESS;
};


instance DIA_ADDON_CAVALORN_WANNALEARN(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 7;
	condition = dia_addon_cavalorn_wannalearn_condition;
	information = dia_addon_cavalorn_wannalearn_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_addon_cavalorn_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_hallo) && (c_bragobanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_WannaLearn_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_01");	//Sure. You know that. Man, they really took a lot out of you.
	AI_Output(self,other,"DIA_Addon_Cavalorn_WannaLearn_08_02");	//You can't remember anything at all, can you?
	CAVALORN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_CAVALORN_TEACH);
};


var int addon_cavalorn_merke_bow;
var int addon_cavalorn_merke_1h;

instance DIA_ADDON_CAVALORN_TEACH(C_INFO)
{
	npc = bau_4300_addon_cavalorn;
	nr = 8;
	condition = dia_addon_cavalorn_teach_condition;
	information = dia_addon_cavalorn_teach_info;
	permanent = TRUE;
	description = "I want to learn your abilities.";
};


func int dia_addon_cavalorn_teach_condition()
{
	if(CAVALORN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_cavalorn_teach_choices()
{
	Info_ClearChoices(dia_addon_cavalorn_teach);
	Info_AddChoice(dia_addon_cavalorn_teach,DIALOG_BACK,dia_addon_cavalorn_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
	{
		Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring("Sneak",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_addon_cavalorn_teach_sneak);
	};
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_cavalorn_teach_bow_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_addon_cavalorn_teach_bow_5);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_cavalorn_teach_1h_1);
	Info_AddChoice(dia_addon_cavalorn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_addon_cavalorn_teach_1h_5);
};

func void dia_addon_cavalorn_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	AI_Output(self,other,"DIA_Addon_Cavalorn_TEACH_08_01");	//Sure. What do you want to know?
	ADDON_CAVALORN_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	ADDON_CAVALORN_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_Sneak_08_00");	//With soft soles, you have a better chance of getting close to your opponents without them noticing.
	};
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	dia_addon_cavalorn_teach_choices();
};

func void dia_addon_cavalorn_teach_back()
{
	if((ADDON_CAVALORN_MERKE_BOW < other.hitchance[NPC_TALENT_BOW]) || (ADDON_CAVALORN_MERKE_1H < other.hitchance[NPC_TALENT_1H]))
	{
		AI_Output(self,other,"DIA_Addon_Cavalorn_Teach_BACK_08_00");	//That's better. You've forgotten a lot since then, but we'll get it back.
	};
	Info_ClearChoices(dia_addon_cavalorn_teach);
};

