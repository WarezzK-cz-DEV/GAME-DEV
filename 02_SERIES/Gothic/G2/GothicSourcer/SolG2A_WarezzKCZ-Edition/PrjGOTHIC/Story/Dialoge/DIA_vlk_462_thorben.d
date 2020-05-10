
instance DIA_THORBEN_EXIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 999;
	condition = dia_thorben_exit_condition;
	information = dia_thorben_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thorben_exit_condition()
{
	return TRUE;
};

func void dia_thorben_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_PICKPOCKET(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 900;
	condition = dia_thorben_pickpocket_condition;
	information = dia_thorben_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_thorben_pickpocket_condition()
{
	return c_beklauen(30,28);
};

func void dia_thorben_pickpocket_info()
{
	Info_ClearChoices(dia_thorben_pickpocket);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_BACK,dia_thorben_pickpocket_back);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_PICKPOCKET,dia_thorben_pickpocket_doit);
};

func void dia_thorben_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thorben_pickpocket);
};

func void dia_thorben_pickpocket_back()
{
	Info_ClearChoices(dia_thorben_pickpocket);
};


instance DIA_THORBEN_ANGEPISST(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_angepisst_condition;
	information = dia_thorben_angepisst_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_angepisst_condition()
{
	if(Npc_IsDead(gritta) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_thorben_angepisst_info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//You have murdered my Gritta. I shall never forgive you. Out of my sight, you murderer!
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_HALLO(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_hallo_condition;
	information = dia_thorben_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_hallo_info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Ah! A fresh face. You're not from Khorinis, are you?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//This is not a good time for travelers. Bandits everywhere, no work, and now the farmers have risen up, too.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//What winds have blown you here?
};


instance DIA_THORBEN_ARBEIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_arbeit_condition;
	information = dia_thorben_arbeit_info;
	permanent = FALSE;
	description = "I'm looking for work.";
};


func int dia_thorben_arbeit_condition()
{
	return TRUE;
};

func void dia_thorben_arbeit_info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//I'm looking for work.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Do you know anything about carpentry?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//The only thing I can make out of wood is a fire.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//And what about locks?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Weeell...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//I'm sorry, but I can't use you if you know nothing about my trade.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//And I have no money to pay for an apprentice.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Thorben won't have me as his apprentice.");
};


instance DIA_THORBEN_OTHERMASTERS(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_othermasters_condition;
	information = dia_thorben_othermasters_info;
	permanent = FALSE;
	description = "What if I want to start an apprenticeship with one of the other masters here?";
};


func int dia_thorben_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_othermasters_info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//What if I want to start an apprenticeship with one of the other masters here?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//All right, I shall give you my approval.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//But you had better get yourself the blessing of the gods first.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Say, are you a man of faith?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"Well, if you mean, do I say my prayers regularly...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"Yes. A most humble servant, Master Thorben.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Then go to Vatras, the priest of Adanos, and have him give you his blessing.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//He will tell you where you can find a priest of Innos. You should get his blessing, too.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//Once you have received the blessing of the gods, I shall vote for you.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"Thorben will give his approval, if a priest of Adanos and a priest of Innos give me their blessing.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Yes. A most humble servant, Master Thorben.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//Well, if you mean, do I say my prayers regularly...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//I see!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//A man who does not ply his trade with the blessing of the gods will never receive my approval.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Ask the gods for forgiveness for your transgressions.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};


instance DIA_THORBEN_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_zustimmung_condition;
	information = dia_thorben_zustimmung_info;
	permanent = TRUE;
	description = "How about your approval, Master?";
};


func int dia_thorben_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (MIS_THORBEN_GETBLESSINGS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thorben_zustimmung_info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//How about your approval, Master?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Has Vatras given you his blessing?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Yes.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//And did you also get the blessing of a priest of Innos?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Yes, I did.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//Then you shall have my blessing as well. No matter what path you decide to take - take pride in doing a good job, my boy!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"Thorben will give his approval if I want to start work as an apprentice.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//No. Not yet...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//You know my terms. You should only ply your trade with the blessing of the gods.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Not yet...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//Then I don't know why you're asking me again. You know my terms.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "So you know a lot about locks?";
};


func int dia_thorben_locksmith_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_locksmith_info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//So you know a lot about locks?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//What good is a fine chest without a fine lock?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//I make my own locks. That way, I can at least be sure that I haven't built my chests that sturdy for nothing.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//A poorly made lock is easy to break. And there are plenty of thieves about in Khorinis. Especially lately!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "I've got Lehmar's ledger right here...";
};


func int dia_thorben_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_thorben_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//I've got Lehmar's ledger right here...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(suspiciously) Where did you get that?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//That shouldn't interest you so much as the fact that your name is in it.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Give it to me!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//What will you give me, then?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//I have no money to spare and can give you nothing but my heartfelt gratitude.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "Can you teach me how to pick locks?";
};


func int dia_thorben_pleaseteach_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith) && (THORBEN_TEACHPLAYER == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_pleaseteach_info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Can you teach me how to pick locks?
	if(Npc_KnowsInfo(other,dia_thorben_schuldenbuch))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//If it weren't for you, I'd be paying Lehmar for the rest of my life.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//I shall teach you what you want to know.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//You have brought me the 100 gold pieces. That was very decent of you.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//I am almost embarrassed, but I must ask even more of you.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//If I cannot pay back my debt to Lehmar soon, he's going to send his thugs after me.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Give me another 100 gold pieces, and I shall instruct you.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Maybe later...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Fine. Here are 100 gold pieces.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//You have paid Gritta's debt with Matteo. You seem to be a decent fellow. I shall teach you what you want to know.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//However, I cannot do it for free. I still have a mountain of debts, and I need the money.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//How much do you charge?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 gold pieces.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Maybe later...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Fine. Here are 200 gold pieces.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Hmm... I don't know whether you can be trusted or not.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//For all I know, you might be one of those layabouts who only come to town to empty the chests of honest people.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//I'm not going to teach you anything before I'm convinced that you are an honest fellow.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Fine. Here are 200 gold pieces.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//This money will really help me. We can start as soon as you're ready.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//You're still a few coins short of 200. I need that money.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Fine. Here are 100 gold pieces.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//In that case, we can start whenever you're ready.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Hey, you're still a few coins short of 100.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Maybe later...
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me how to pick a lock!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1));
};


func int dia_thorben_teach_condition()
{
	if((THORBEN_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_teach_info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Teach me how to pick a lock!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//All you need is a lock pick. If you move it carefully left and right in the lock, you can unbolt the mechanism.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//But if you move it too much or too fast in the wrong direction, it will snap right off.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//The more adept you become, the fewer lock picks you are going to need. That's all there is to it, really.
	};
};


var int thorben_tradelog;

instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "Can you sell me some lock picks?";
	trade = TRUE;
};


func int dia_thorben_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith))
	{
		return TRUE;
	};
};

func void dia_thorben_trade_info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Can you sell me some lock picks?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//If I have any left...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//Well, all right. But they won't be of any use to you as long as you don't know how they work.
	};
	if((Npc_HasItems(self,itke_lockpick) == 0) && (KAPITEL > DIETRICHGEBEN))
	{
		CreateInvItems(self,itke_lockpick,5);
		DIETRICHGEBEN = DIETRICHGEBEN + 1;
	};
	if(THORBEN_TRADELOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"The carpenter Thorben sells lockpicks.");
		THORBEN_TRADELOG = TRUE;
	};
};


instance DIA_ADDON_THORBEN_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_addon_thorben_missingpeople_condition;
	information = dia_addon_thorben_missingpeople_info;
	description = "Have you had an apprentice before?";
};


func int dia_addon_thorben_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ELVRICH_GOESBACK2THORBEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_00");	//Have you had an apprentice before?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_01");	//Yes, and not too long ago.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_15_02");	//And? What happened?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_03");	//His name is Elvrich. He's my nephew.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_06_04");	//I was quite pleased with him, actually, but one day he simply didn't show up for work.
	MIS_THORBEN_BRINGELVRICHBACK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Elvrich, the apprentice to Thorben the carpenter, has vanished.");
	Info_ClearChoices(dia_addon_thorben_missingpeople);
	Info_AddChoice(dia_addon_thorben_missingpeople,DIALOG_BACK,dia_addon_thorben_missingpeople_back);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Have you reported that to the militia?",dia_addon_thorben_missingpeople_mil);
	Info_AddChoice(dia_addon_thorben_missingpeople,"How long has it been since you saw him?",dia_addon_thorben_missingpeople_wann);
	Info_AddChoice(dia_addon_thorben_missingpeople,"Where is Elvrich now?",dia_addon_thorben_missingpeople_where);
};

func void dia_addon_thorben_missingpeople_back()
{
	Info_ClearChoices(dia_addon_thorben_missingpeople);
};

func void dia_addon_thorben_missingpeople_wann()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_wann_15_00");	//How long has it been since you saw him?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_wann_06_01");	//I guess it must be about 2 weeks.
};

func void dia_addon_thorben_missingpeople_where()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_where_15_00");	//Where is Elvrich now?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_01");	//How would I know? He kept hanging around that filthy brothel by the harbor.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_where_06_02");	//I wouldn't be surprised if he's still warming the bed of some whore down there.
};

func void dia_addon_thorben_missingpeople_mil()
{
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_00");	//Have you reported that to the militia?
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_01");	//Of course I have. They were supposed to catch him and see to it that the lazy-bones does his work. But I already regret that.
	AI_Output(self,other,"DIA_Addon_Thorben_MissingPeople_Mil_06_02");	//He can do whatever he wants. Sooner or later he'll realize that he'll get nowhere in Khorinis without a decent job.
	AI_Output(other,self,"DIA_Addon_Thorben_MissingPeople_Mil_15_03");	//(cynically) Is that so?
};


instance DIA_ADDON_THORBEN_ELVRICHISBACK(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_addon_thorben_elvrichisback_condition;
	information = dia_addon_thorben_elvrichisback_info;
	description = "Elvrich will work for you again from now on.";
};


func int dia_addon_thorben_elvrichisback_condition()
{
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (Npc_IsDead(elvrich) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorben_elvrichisback_info()
{
	AI_Output(other,self,"DIA_Addon_Thorben_ElvrichIsBack_15_00");	//Elvrich will work for you again from now on.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_01");	//I can only hope that he won't disappear again when the next little tart waves her skirts at him.
	AI_Output(self,other,"DIA_Addon_Thorben_ElvrichIsBack_06_02");	//Take this gold as a reward for bringing back my apprentice.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	MIS_THORBEN_BRINGELVRICHBACK = LOG_SUCCESS;
	vlk_4302_addon_elvrich.flags = 0;
};


instance DIA_THORBEN_PALADINE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_paladine_condition;
	information = dia_thorben_paladine_info;
	permanent = FALSE;
	description = "What do you know about the paladins?";
};


func int dia_thorben_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_thorben_paladine_info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//What do you know about the paladins?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Not much. They arrived by ship two weeks ago from the mainland.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//Since then, they have withdrawn to the upper end of town.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Nobody here really knows exactly why they have come.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Many are afraid of an attack by the orcs.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//I suppose, however, that they are here to quell the farmers' rebellion.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "Do you know anything about the peasants' rebellion?";
};


func int dia_thorben_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_thorben_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Do you know anything about the peasants' rebellion?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Rumor has it that Onar the landowner has hired mercenaries to keep the King's troops from breathing down his neck.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//He was probably tired of having to throw his harvest along with his livestock at paladins and militia.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//All we notice of this in town is that the food prices keep rising.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Onar's farm lies far to the east of here. We wouldn't know if there's any fighting going on there.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//If you want to know more, ask the merchants in the marketplace. They get around the island more than I do.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "I've come about Gritta...";
};


func int dia_thorben_gritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_gritta_info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//I've come about Gritta...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//My niece? What's your business with her? This isn't about money, is it?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//She owes 100 gold pieces to the merchant Matteo.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Tell me this isn't true. Ever since that little piece of work moved in with me, I've had nothing but trouble!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//She's in debt with practically every single merchant in town.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//I had to borrow 200 gold pieces from Lehmar the moneylender just to settle her debts! And now this!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Gritta should be in the house.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Go ahead, ask her. But I can tell you this: she doesn't have a SINGLE gold piece.
	if(Npc_HasItems(gritta,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//We shall see...
	};
};


instance DIA_THORBEN_GRITTAHATTEGOLD(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_grittahattegold_condition;
	information = dia_thorben_grittahattegold_info;
	permanent = FALSE;
	description = "Your niece had 100 gold pieces.";
};


func int dia_thorben_grittahattegold_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_gritta) && (Npc_HasItems(gritta,itmi_gold) < 80) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_grittahattegold_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//Your niece had 100 gold pieces.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//WHAT? The brazen little serpent - that was MY gold! She took it from my chest.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Give it back to me! I have to pay off Lehmar first. Matteo can get his money later!
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"I've already given Matteo his gold!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"No. Matteo will get his money back from me.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Here's your gold.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//From what I know of this little viper, I'm sure she'll run straight to the city guard and accuse you, too!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//I shall see to it that the matter is settled.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//I've already given Matteo his gold!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Damn! Oh well - a debt is a debt. At least you didn't keep the money. I guess I should thank you for that.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//No. Matteo will get his money back from me.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//You're getting me into a right old mess that way. Lehmar is not terribly generous when it comes to debts.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//But at least you are planning to pay my niece's debts. I guess I ought to thank you for that.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Here's your gold.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Thanks! Now I have at least part of the money I owe Lehmar.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//I can't believe she had the audacity to take my gold!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

