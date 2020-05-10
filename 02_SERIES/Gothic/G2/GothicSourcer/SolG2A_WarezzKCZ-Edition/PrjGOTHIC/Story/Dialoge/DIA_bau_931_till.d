
instance DIA_TILL_EXIT(C_INFO)
{
	npc = bau_931_till;
	nr = 999;
	condition = dia_till_exit_condition;
	information = dia_till_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_till_exit_condition()
{
	return TRUE;
};

func void dia_till_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TILL_HALLO(C_INFO)
{
	npc = bau_931_till;
	nr = 3;
	condition = dia_till_hallo_condition;
	information = dia_till_hallo_info;
	description = "Well, kiddo?";
};


func int dia_till_hallo_condition()
{
	if(KAPITEL < 5)
	{
		return TRUE;
	};
};

func void dia_till_hallo_info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Well, kiddo?
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//That's no way for a farmhand to talk to me - just how often do I have to remind you?
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"I'm not a field hand.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"Are you in charge here?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Are you in charge here?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//(intimidated) Eh. No, I'm only Sekob's son. But once my old man is no longer with us, then all the land you can see here will belong to me.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Amazing!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//I'm not a field hand.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//And what do you want here? We have nothing. So you can just leave right now.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "Is that how you always treat your field workers?";
};


func int dia_till_feldarbeiter_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_feldarbeiter_info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Is that how you always treat your field workers?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Of course - they need that. Whoever doesn't toe the line here gets thrashed, that's the way it goes.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "I need to talk to your father.";
};


func int dia_till_sekob_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && (Npc_KnowsInfo(other,dia_sekob_hallo) == FALSE) && (KAPITEL < 3) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_till_sekob_info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//I need to talk to your father.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//He hasn't got time. But I'm his deputy. What can I help you with?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//By introducing me to your father.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//You're a real tough guy and a good fighter, huh?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//The best.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//I think maybe I'd better get him then.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Never mind, boy. I'll find him, I'm sure.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//If you say so.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "So what do you do?";
};


func int dia_till_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//So what do you do when you're not busy playing ruler of the farm?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Stand guard.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//The filthy militiamen from the city are coming onto our land more and more often and stealing everything they can get their hands on.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Only last week the bastards were here, and they just took some of our sheep.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//If I could get my hands on one of them, I'd make short work of him.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//But of course!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "Why don't the mercenaries help you against the militia?";
};


func int dia_till_warumnichtsld_condition()
{
	if(Npc_KnowsInfo(other,dia_till_wasmachstdu) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_warumnichtsld_info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//Why don't the mercenaries help you against the militia?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Before they even get warmed up, I've long since driven them off.
};


instance DIA_TILL_BRONKO(C_INFO)
{
	npc = bau_931_till;
	nr = 5;
	condition = dia_till_bronko_condition;
	information = dia_till_bronko_info;
	description = "(ask about Bronko)";
};


func int dia_till_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && Npc_KnowsInfo(other,dia_bronko_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronko_info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//There's this guy who demands a toll from every passer-by, claiming HE's the farmer.
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(sheepish) Eh. Yes. I know. That's Bronko. He does whatever he wants.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Not that I haven't pounded it into him a thousand times that he should finally get back to work.
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//But?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//He just doesn't do it.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//My father is quite annoyed with me that I still haven't managed to persuade him to go back to work.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "Maybe I can help you.";
};


var int dia_till_bronkozurarbeit_noperm;

func int dia_till_bronkozurarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_till_bronko) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == FALSE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkozurarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Maybe I can help you.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Do you mean that? Okay, listen, if you get Bronko to go back to work, I'll pay you, shall we say 10 gold pieces. What do you say?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"No problem. But I want more money.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"All right. I'll see what I can do.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"I'll think about it.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Suit yourself.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//All right. I'll see what I can do.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//But hurry up about it.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"Till can't get Bronko to work. Till wants me to give it a try.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//I want more.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//No problem. But I want more money.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//All right. 20 gold pieces, then.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"I want more.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"All right. I'll see what I can do.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"I want more.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"All right. I'll see what I can do.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Maybe...50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"I want more.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"All right. I'll see what I can do.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//All right. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"I want more.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"All right. I'll see what I can do.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Okay, okay! I'll give you 100 gold coins. But that's all I have.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"All right. I'll see what I can do.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "Bronko is back at work.";
};


func int dia_till_bronkowiederanarbeit_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == TRUE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkowiederanarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Bronko is back at work.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Really? That's terrific.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Yes. And now I want my cash.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(hesitantly) Mmh. Well. Business is business, right?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//Unfortunately, I don't have that much money. But I'm very grateful for your help.
		TILL_HATSEINGELDBEHALTEN = TRUE;
	};
	b_giveplayerxp(XP_BRONKOGEHTANDIEARBEIT);
	AI_StopProcessInfos(self);
};


instance DIA_TILL_PERMKAP1(C_INFO)
{
	npc = bau_931_till;
	nr = 99;
	condition = dia_till_permkap1_condition;
	information = dia_till_permkap1_info;
	permanent = TRUE;
	description = "(annoy Till)";
};


func int dia_till_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) || (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_till_permkap1_info()
{
	if(KAPITEL == 5)
	{
		if((MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//Far away from home, are you? Daddy won't be able to help you here.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//One of these days I'm going to shut your big mouth.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//You loser, count yourself lucky if I let you keep your life.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//Then just leave me alone.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Maybe you should eat more so you'll grow big and strong.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//One day I'll show you.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//You miserable little...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Just go away.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Has anyone blown your nose for you today?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Leave me alone, you idiot.
	};
};


instance DIA_TILL_PICKPOCKET(C_INFO)
{
	npc = bau_931_till;
	nr = 900;
	condition = dia_till_pickpocket_condition;
	information = dia_till_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_till_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_till_pickpocket_info()
{
	Info_ClearChoices(dia_till_pickpocket);
	Info_AddChoice(dia_till_pickpocket,DIALOG_BACK,dia_till_pickpocket_back);
	Info_AddChoice(dia_till_pickpocket,DIALOG_PICKPOCKET,dia_till_pickpocket_doit);
};

func void dia_till_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_till_pickpocket);
};

func void dia_till_pickpocket_back()
{
	Info_ClearChoices(dia_till_pickpocket);
};

