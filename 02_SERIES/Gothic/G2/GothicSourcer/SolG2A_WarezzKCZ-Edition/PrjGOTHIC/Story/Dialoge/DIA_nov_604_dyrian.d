
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(sadly) What do you want?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "I'm busy distributing sausages.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//I'm busy distributing sausages.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Thanks. Hopefully, that won't be the last sausage I get around here.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//I have transgressed against the precepts of the community.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Now I'm waiting for the decision of the High Council whether I may remain in the monastery.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "Tell me what happened.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Tell me what happened.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//I took a book from the rooms of the magicians while I was sweeping, so I could read it later.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Master Hyglas noticed it immediately, of course, and asked me about the book.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Out of fear of being punished, I lied about it - but he caught me later when I was in my chamber with the book.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//He was really angry and informed the High Council. Now they are discussing whether I can stay.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "Is there any way I can help you?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Is there any way I can help you?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//No, I've been delivered up to the mercy of Innos and the magicians.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Hey, have you really demanded the test of fire?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Yes. And I intend to pass it.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Good - maybe I can help you with it. I can give you a very useful spell scroll. A SLEEP spell. Interested?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"No, I don't need your help.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"What do you want for it?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"What can I do with it?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//What can I do with it?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//With this spell you can put people into a magic sleep for a short time. But only if their will is weaker than yours.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//That could be very useful if someone is standing in your way...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//And how do I know whether the other person has a weaker will?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//You needn't bother trying it with the magicians. But you could put most of the novices to sleep.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//No, I don't need your help.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//You can come to me any time if you change your mind.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//What do you want for it?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//Every magician who is accepted gets one wish.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//And if you really pass the test of Fire, then you could fix it so that I can stay in the monastery.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"No, I don't need your help.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"All right, give me the spell scroll.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//All right, give me the spell scroll.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Good luck in your test. May Innos help you.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"Dyrian gave me a Sleep spell scroll. In return, he wants me to see to it that he's allowed to stay in the monastery, if I become a magician.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "I changed my mind. Give me the sleep spell.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//I changed my mind. Give me the sleep spell.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Good, if you pass the test, you'll see to it that I can stay in the monastery.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(joyful) Thanks, you saved me!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(frightened) Oh - forgive me Master - I didn't mean to impose.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(respectfully) I thank you for being allowed to stay in the monastery. My life will be different from now on...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//How's it going?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Good. I really enjoy the work, Master.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//I thank Innos that I can be here in the monastery.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//You're asking me that? I put all my hopes on you and you left me in the lurch.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Now I've got nothing left but alcohol. And it's all your fault!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"Here, 5 gold for you.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"I can explain everything.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"Watch what you're saying there.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Here, 5 gold pieces for you.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(nervously) 5 gold? You're giving me 5 gold to make up for destroying my life?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//I'll take all your gold!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//I can explain everything.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Save your cheap excuses.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//You lie every time you open your mouth. Now leave me alone.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Watch what you're saying there.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Yeah, go ahead and threaten me. It won't do you any good.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//I'll tell the whole world what a hypocritical bastard you are! As soon as I've finished this bottle...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//Now get out of my sight, you disgust me!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//What's up?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Aah, just leave me alone! I don't want anything more to do with you!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

