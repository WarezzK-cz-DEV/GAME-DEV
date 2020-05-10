
var int vatras_schickeleuteweg;
var int vatras_laresexit;
var int vatras_more;

instance DIA_ADDON_VATRAS_KILLERWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_killerwarning_condition;
	information = dia_addon_vatras_killerwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_killerwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 3) && (MADKILLERCOUNT < 7) && (VATRASPISSEDOFFFOREVER == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_killerwarning_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_00");	//There are many rumors about you in Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_01");	//They say you were involved in the murder of innocent people.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_02");	//If that's truly the case, I can only warn you, son.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_03");	//Do not leave the path of balance and preservation of this world, or you will have to bear the consequences.
	AI_Output(self,other,"DIA_Addon_Vatras_KillerWarning_ADD_05_04");	//Tell me. What can I do to help you?
};


instance DIA_ADDON_VATRAS_LASTWARNING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_lastwarning_condition;
	information = dia_addon_vatras_lastwarning_info;
	important = TRUE;
};


func int dia_addon_vatras_lastwarning_condition()
{
	if((KAPITEL >= 5) && (MADKILLERCOUNT >= 7) && (VATRASPISSEDOFFFOREVER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_lastwarning_info()
{
	b_lastwarningvatras();
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_ADD_05_06");	//What have you got to say for yourself?
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	Info_AddChoice(dia_addon_vatras_lastwarning,"Kiss my ass.",dia_addon_vatras_lastwarning_arsch);
	Info_AddChoice(dia_addon_vatras_lastwarning,"I'm sorry. I didn't know what I was doing.",dia_addon_vatras_lastwarning_reue);
};

func void dia_addon_vatras_lastwarning_arsch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_15_00");	//Get stuffed.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_00");	//There isn't a trace of remorse in your words.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Arsch_ADD_05_01");	//You leave me no choice.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	b_vatraspissedoff();
};

func void dia_addon_vatras_lastwarning_reue()
{
	AI_Output(other,self,"DIA_Addon_Vatras_LastWarning_Reue_ADD_15_00");	//I'm sorry. I didn't know what I was doing.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_00");	//I shall pray for you and hope that you will come to your senses again.
	AI_Output(self,other,"DIA_Addon_Vatras_LastWarning_Reue_ADD_05_01");	//Woe betide you if I hear of another murder that you've had a hand in.
	Info_ClearChoices(dia_addon_vatras_lastwarning);
	VATRASMADKILLERCOUNT = MADKILLERCOUNT;
};


instance DIA_ADDON_VATRAS_PISSEDOFF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_pissedoff_condition;
	information = dia_addon_vatras_pissedoff_info;
	important = TRUE;
};


func int dia_addon_vatras_pissedoff_condition()
{
	if((MADKILLERCOUNT > VATRASMADKILLERCOUNT) && Npc_KnowsInfo(other,dia_addon_vatras_lastwarning) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissedoff_info()
{
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_00");	//Your words are as false as your deeds.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_01");	//You just won't cease your pointless killing.
	AI_Output(self,other,"DIA_Addon_Vatras_PissedOff_ADD_05_02");	//You leave me no choice.
	b_vatraspissedoff();
};


instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (VATRAS_LARESEXIT == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_00");	//Wait!
		if(VATRAS_GEHZULARES == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_01");	//If you see Lares...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_02");	//I'd like you to do me a little favor.
			AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_03");	//Go down to the harbor. You'll find a man there named Lares.
			VATRAS_GEHZULARES = TRUE;
		};
		AI_Output(self,other,"DIA_Addon_Vatras_LaresExit_05_04");	//Give him this ornament and tell him that it needs to be returned. He'll know what to do with it.
		CreateInvItems(self,itmi_ornament_addon_vatras,1);
		b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
		VATRAS_LARESEXIT = TRUE;
	};
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Adanos be with you.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Who are you?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//I am Vatras, a servant of Adanos, the guardian of the divine and earthly equilibrium.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//What can I do for you?
};


instance DIA_ADDON_VATRAS_CAVALORN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_cavalorn_condition;
	information = dia_addon_vatras_cavalorn_info;
	description = "Here, I've got a letter for you.";
};


func int dia_addon_vatras_cavalorn_condition()
{
	if(((Npc_HasItems(other,itwr_saturasfirstmessage_addon_sealed) >= 1) && (MIS_ADDON_CAVALORN_LETTER2VATRAS == LOG_RUNNING)) || (Npc_HasItems(other,itwr_saturasfirstmessage_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalorn_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_15_00");	//Here, I've got a letter for you.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_01");	//For me?
	if(SATURASFIRSTMESSAGEOPENED == FALSE)
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon_sealed,1);
	}
	else
	{
		b_giveplayerxp(XP_ADDON_CAVALORN_LETTER2VATRAS_OPENED);
		b_giveinvitems(other,self,itwr_saturasfirstmessage_addon,1);
		AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_02");	//Yes, but... it's been opened. I hope it didn't fall into the wrong hands.
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_03");	//Indeed. This is an important message you're bringing me.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_05_04");	//I wonder how you got hold of this letter.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
	Info_AddChoice(dia_addon_vatras_cavalorn,"I took it from some bandits.",dia_addon_vatras_cavalorn_bandit);
	if(MIS_ADDON_CAVALORN_KILLBRAGO == LOG_SUCCESS)
	{
		Info_AddChoice(dia_addon_vatras_cavalorn,"From Cavalorn the hunter.",dia_addon_vatras_cavalorn_cavalorn);
	};
	MIS_ADDON_CAVALORN_LETTER2VATRAS = LOG_SUCCESS;
};

func void dia_addon_vatras_cavalorn_bandit()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Bandit_15_00");	//I took it from some bandits.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_01");	//(worried) By Adanos. That's not good. That's not good at all.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_02");	//If what you say is true, we've got a huge problem.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Bandit_05_03");	//I shall have to take care of it as soon as possible.
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};

func void dia_addon_vatras_cavalorn_cavalorn()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_00");	//I got it from Cavalorn, the hunter.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_01");	//(surprised) Cavalorn? Where is he?
	AI_Output(other,self,"DIA_Addon_Vatras_Cavalorn_Cavalorn_15_02");	//He told me to tell you he couldn't make it and is headed for the meeting point. Whatever he means by that.
	AI_Output(self,other,"DIA_Addon_Vatras_Cavalorn_Cavalorn_05_03");	//I see that you've gained Cavalorn's trust. That speaks in your favor.
	b_giveplayerxp(XP_ADDON_CAVALORNTRUST);
	Info_ClearChoices(dia_addon_vatras_cavalorn);
};


var int vatras_why;

instance DIA_ADDON_VATRAS_CAVALORNSENTME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_cavalornsentme_condition;
	information = dia_addon_vatras_cavalornsentme_info;
	permanent = FALSE;
	description = "Cavalorn sent me to you!";
};


func int dia_addon_vatras_cavalornsentme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE) && Npc_KnowsInfo(other,dia_addon_cavalorn_ring) && (VATRAS_WHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_cavalornsentme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_00");	//Cavalorn sent me to you!
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_01");	//(cunningly) And what did he tell you?
	AI_Output(other,self,"DIA_Addon_Vatras_Add_15_02");	//He said you're in dire need of more good people.
	AI_Output(self,other,"DIA_Addon_Vatras_Add_05_03");	//(smiles) Aha... So you want to JOIN us, son?
};


instance DIA_ADDON_VATRAS_TELLME(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_tellme_condition;
	information = dia_addon_vatras_tellme_info;
	permanent = TRUE;
	description = "Tell me about the Ring of Water.";
};


func int dia_addon_vatras_tellme_condition()
{
	if((SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_tellme_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_15_00");	//Tell me about the Ring of Water.
	if(!Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_01");	//(expectantly) And why would I do that?
		VATRAS_WHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_02");	//Since you are not yet a member of our community, I cannot tell you EVERYTHING, of course.
		AI_Output(self,other,"DIA_Addon_Vatras_TellMe_05_03");	//But I shall tell you what I may.
		Info_ClearChoices(dia_addon_vatras_tellme);
		Info_AddChoice(dia_addon_vatras_tellme,DIALOG_BACK,dia_addon_vatras_tellme_back);
		Info_AddChoice(dia_addon_vatras_tellme,"What exactly is it that you do?",dia_addon_vatras_tellme_philo);
		Info_AddChoice(dia_addon_vatras_tellme,"Where are the other Water Mages?",dia_addon_vatras_tellme_otherkdw);
		Info_AddChoice(dia_addon_vatras_tellme,"Who are the members of the Ring of Water, then?",dia_addon_vatras_tellme_wernoch);
	};
};

func void dia_addon_vatras_tellme_back()
{
	Info_ClearChoices(dia_addon_vatras_tellme);
};

func void dia_addon_vatras_tellme_philo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Philo_15_00");	//What exactly is it that you do?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_01");	//We stand between the order of Innos and the chaos of Beliar.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_02");	//If one of the two sides should gain the upper hand, it will mean either total loss of freedom, or deadly chaos.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Philo_05_03");	//Therefore, we guard the balance between the two. That's what makes life in this world possible at all.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == 0)
	{
		Info_AddChoice(dia_addon_vatras_tellme,"And what does that mean in concrete terms?",dia_addon_vatras_tellme_konkret);
	};
};

func void dia_addon_vatras_tellme_konkret()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Konkret_15_00");	//(frowning) And what does that mean in concrete terms?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_01");	//The fall of the barrier has evoked numerous threats.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_02");	//The bandits are probably the most obvious one.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_03");	//Not only has it become all but impossible to travel the island without being attacked...
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_04");	//... there's somebody in town, too, who supports the bandits!
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Add_05_00");	//We have found out that the bandits receive regular deliveries from a weapons merchant in Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_05");	//We try to find such people and keep them from endangering the city.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Konkret_05_06");	//If you can find out anything about this, let me know.
	MIS_VATRAS_FINDTHEBANDITTRADER = LOG_RUNNING;
	VATRAS_TOMARTIN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_BANDITTRADER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITTRADER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITTRADER,"There is a weapons dealer in Khorinis who is supporting the bandits. Vatras wants me to investigate the matter.");
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Martin, the paladins' provision master, is looking into the business with the weapons dealer. I can find him down by the harbor where the paladins store their supplies.");
	b_logentry(TOPIC_ADDON_RINGOFWATER,"The 'Ring of Water' is taking care of the bandit problem in Khorinis.");
};

func void dia_addon_vatras_tellme_otherkdw()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_OtherKdW_15_00");	//Where are the other Water Mages?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_01");	//They are exploring the ruins of an old culture north-east of Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_OtherKdW_05_02");	//We suspect that those ruins might contain a passage to a part of the island which is as yet uncharted.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"The other Water Mages are exploring the ruins of an old culture north-east of Khorinis. There might be an entry to an uncharted part of Khorinis.");
	Info_AddChoice(dia_addon_vatras_tellme,"Tell me more about that uncharted area.",dia_addon_vatras_tellme_unexplored);
};

func void dia_addon_vatras_tellme_unexplored()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_00");	//Tell me more about that uncharted area.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_01");	//If you're interested in joining the expedition, I could send you to Saturas with a letter.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_Unexplored_05_02");	//You can only participate, of course, as long as you're one of us.
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_Unexplored_15_03");	//Of course.
	b_logentry(TOPIC_ADDON_KDW,"Vatras wants me to become a member of the 'Ring of Water' before I can join the Water Mages' expedition.");
};

func void dia_addon_vatras_tellme_wernoch()
{
	AI_Output(other,self,"DIA_Addon_Vatras_TellMe_WerNoch_15_00");	//Who are the members of the Ring of Water, then?
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_01");	//I cannot tell you that until you join the Ring.
	AI_Output(self,other,"DIA_Addon_Vatras_TellMe_WerNoch_05_02");	//But you will certainly already have met some of them by that time.
};


instance DIA_ADDON_VATRAS_WANNABERANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_wannaberanger_condition;
	information = dia_addon_vatras_wannaberanger_info;
	description = "I want to join the 'Ring of Water'!";
};


func int dia_addon_vatras_wannaberanger_condition()
{
	if(SC_KNOWSRANGER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_00");	//I want to join the 'Ring of Water'!
	if(Npc_KnowsInfo(other,dia_addon_cavalorn_ring))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_01");	//You do? That means you have already fulfilled the first requirement.
		AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_15_02");	//What do you mean by that?
		AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_03");	//I mean that there must be someone among us who trusts you. Otherwise, you wouldn't even know about it.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_05_04");	//But I know nothing about you at all...
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//What do you want to know?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Well, you could tell me where you come from and why you have come to the city.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//I carry an important message for the leader of the paladins.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//What is this message?
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Dragons have come...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Terrible things are bound to happen soon.",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//A large army is gathering as we talk, led by dragons and determined to conquer the country.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//If that is indeed true, the balance of the earth will be disturbed. Who told you this?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(considering) Dragons? You speak of beings which, until now, have only been mentioned in legends. How do you know this?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Oh, I heard rumors somewhere...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Xardas the magician told me...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Terrible things are bound to happen soon.
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(angry) Aha. And who has told you this?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Terrible things, hm... how do you know this?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Oh, I heard rumors somewhere...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"Xardas the magician told me...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Xardas the magician told me. He sent me to warn the paladins.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//I know this man as a wise and mighty master of magic. And where do you come from?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//The necromancer... So he lives...(considers) and he sent you? Who are you really?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"I'm just an adventurer from down south...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"I'm a former convict...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Oh, I heard rumors somewhere...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(annoyed) Do you at least remember where you come from?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Aha. And that is why you have made this journey. Who are you really?
	};
	Info_ClearChoices(dia_addon_vatras_wannaberanger);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"I'm an adventurer from down south...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_addon_vatras_wannaberanger,"I'm a former convict...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void b_vatras_influence_repeat()
{
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Well, let's summarize:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//You are a former prisoner,...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//You are an adventurer from down south...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//... who has been told by Xardas the necromancer...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//... who heard rumors...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//... that dragons have come to conquer the country.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//... that terrible things are going to happen.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//And you have come to report this to the paladins...
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//That all sounds rather fantastic, but I cannot perceive that you are lying to me.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Therefore I must assume that your motives are honorable.
		AI_Output(self,other,"DIA_ADDON_Vatras_INFLUENCE_REPEAT_05_11");	//I want to give you a chance to join the Ring of Water.
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//I think there's something you're not telling me.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//If you're worried I might pass on what you tell me, then let me reassure you.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//I have sworn to keep all secrets I am entrusted with to myself.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//And what about all the people here?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//They only understand half of what I PREACH to them. So don't fret.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Let's start over at the beginning. What's that message?
		Info_ClearChoices(dia_addon_vatras_wannaberanger);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Dragons have come...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_addon_vatras_wannaberanger,"Terrible things are bound to happen soon.",dia_vatras_influence_first_lie);
	};
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//I'm a former convict from the penal colony of Khorinis.
	VATRAS_THIRD = TRUE;
	b_vatras_influence_repeat();
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//I'm an adventurer from down south...
	VATRAS_THIRD = FALSE;
	b_vatras_influence_repeat();
};


instance DIA_ADDON_VATRAS_HOWTOJOIN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_howtojoin_condition;
	information = dia_addon_vatras_howtojoin_info;
	description = "What must I do in order to join the Ring?";
};


func int dia_addon_vatras_howtojoin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_howtojoin_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_00");	//What must I do in order to join the Ring?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_01");	//Know that you take on great responsibility by joining the ring.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_02");	//I do not let just anyone join who comes to us and asks.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_03");	//If you want to join the Ring, you will have to prove that you act like one of us.
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_15_04");	//And that means?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_05");	//Before we let a young man join our ranks, he must have done a great deed for the Ring.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_05_06");	//Only then can I begin to consider letting you help preserve the balance of forces on this island.
	Info_ClearChoices(dia_addon_vatras_howtojoin);
	Info_AddChoice(dia_addon_vatras_howtojoin,"So what would be an appropriate deed that might convince you?",dia_addon_vatras_howtojoin_whatsgreat);
	Info_AddChoice(dia_addon_vatras_howtojoin,"I have freed many people. The barrier is gone.",dia_addon_vatras_howtojoin_freedmen);
	Info_AddChoice(dia_addon_vatras_howtojoin,"I have vanquished the Sleeper. Isn't that a great enough deed?",dia_addon_vatras_howtojoin_sleeper);
};

func void dia_addon_vatras_howtojoin_sleeper()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_Sleeper_15_00");	//I have vanquished the Sleeper. Isn't that a great enough deed?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_01");	//My ears hear many a tale these days.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_02");	//Including the story about the banning of the beast called Sleeper.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_03");	//I have not heard that this was achieved by a single man, although your eyes tell me that you are convinced you did this.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_Sleeper_05_04");	//That confuses me slightly, but I cannot be sure that my senses might not deceive me sometimes.
};

func void dia_addon_vatras_howtojoin_freedmen()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_15_00");	//I have freed many people. The barrier is gone.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_01");	//Even if you can REALLY claim responsibility for that...
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_02");	//The great event in the Valley of Mines has not only set free the Water Mages and other upright citizens.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_03");	//All the criminals of the entire country are roaming Khorinis these days, harassing the population.
	AI_Output(self,other,"DIA_Addon_Vatras_WannaBeRanger_FreedMen_05_04");	//The bandits have already taken over large areas of land outside of the city. It has become all but impossible to leave the town and return unharmed.
};

func void dia_addon_vatras_howtojoin_whatsgreat()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_00");	//So what would be an appropriate deed that might convince you?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_01");	//Khorinis is facing a great enigma these days.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_02");	//The number of people missing from the town seems to increase almost daily.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_03");	//If you can explain to me what happened to them, you shall have your place within the 'Ring of Water'.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras is only going to let me join the 'Ring of Water' if I find out first where the missing people are.");
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
	};
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_RUNNING;
	SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_04");	//However...
	AI_Output(other,self,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_15_05");	//Yes?
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_06");	//... you should take your message to the paladins first.
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_07");	//I consider it a matter of utmost importance!
	AI_Output(self,other,"DIA_Addon_Vatras_HowToJoin_WhatsGreat_05_08");	//Talk to Lord Hagen.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Vatras wants me to take an important message to Lord Hagen.");
	Info_ClearChoices(dia_addon_vatras_howtojoin);
};


instance DIA_ADDON_VATRAS_GUILDBYPASS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_guildbypass_condition;
	information = dia_addon_vatras_guildbypass_info;
	description = "But Lord Hagen is not going to receive me!";
};


func int dia_addon_vatras_guildbypass_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildbypass_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_15_00");	//But Lord Hagen is not going to receive me!
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_01");	//Yes, he will, no doubt about it. PROVIDED you become a member of a powerful community first.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_02");	//The Ring has far-reaching connections.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_03");	//We shall assist you in conveying your message as soon as possible.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_05_04");	//You should talk about this to Lares, whom I trust. He will help you.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"In order to get through to see Lord Hagen, I must join one of the powerful communities in Khorinis.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"I shall do that.",dia_addon_vatras_guildbypass_back);
	Info_AddChoice(dia_addon_vatras_guildbypass,"What community should I join?",dia_addon_vatras_guildbypass_whichguild);
};

func void dia_addon_vatras_guildbypass_back()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_BACK_15_00");	//I shall do that.
	VATRAS_GEHZULARES = TRUE;
	Info_ClearChoices(dia_addon_vatras_guildbypass);
};

func void dia_addon_vatras_guildbypass_whichguild()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildBypass_WhichGuild_15_00");	//What community should I join?
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_01");	//There are only three communities that have enough influence.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_02");	//These are: the city militia, the monastery of the Fire Magicians, and the troop of mercenaries on the landowner's farm.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_03");	//The choice is yours, son.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildBypass_WhichGuild_05_04");	//Lares can certainly assist you with this difficult decision. Talk to him about it.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Powerful communities include the FIRE MAGICIANS, the MILITIA and the MERCENARIES on the landowner's farm.");
	Info_ClearChoices(dia_addon_vatras_guildbypass);
	Info_AddChoice(dia_addon_vatras_guildbypass,"I shall do that.",dia_addon_vatras_guildbypass_back);
};


instance DIA_ADDON_VATRAS_NOWRANGER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_nowranger_condition;
	information = dia_addon_vatras_nowranger_info;
	permanent = TRUE;
	description = "I am ready to join the Ring of Water!";
};


func int dia_addon_vatras_nowranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_howtojoin) && (SC_ISRANGER == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_nowranger_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_00");	//I am ready to join the Ring of Water!
	AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_01");	//So you delivered your message to Lord Hagen?
	if(KAPITEL >= 2)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_02");	//Yes.
		if(MIS_OLDWORLD != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_03");	//But he sent me to the Valley of Mines so I could get him proof for my words!
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_04");	//YOU must decide what you want to do next.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_05");	//To me, it was important that he should get the message. Now it's up to him to act, or to wait for your proof.
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_06");	//As far as you are concerned...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_07");	//Good.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_08");	//You have proven that you are indispensable to us. You shall be one of our children and go forth into the world in our name to do the bidding of Adanos.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_09");	//I consign to you this Ring of Water. May it help you find your allies and, together with them, preserve the balance of this world.
		CreateInvItems(self,itri_ranger_addon,1);
		b_giveinvitems(self,other,itri_ranger_addon,1);
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_10");	//You are the first Fire Magician among our children. I am especially happy about that.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_11");	//May Adanos protect you. And now go and meet your brothers.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_12");	//They will await you in the tavern 'The Dead Harpy' and accept you into our community.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_13");	//You probably know the tavern. It lies on the way to Onar's farm.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_14");	//Do not forget to wear your ring, so your brothers will recognize you as one of their own.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"I now belong to the 'Ring of Water', and I am to meet my brothers in the 'Dead Harpy' tavern.");
		SC_ISRANGER = TRUE;
		LARES_CANBRINGSCTOPLACES = TRUE;
		MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
		b_giveplayerxp(XP_ADDON_SC_ISRANGER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_NowRanger_15_15");	//No. Not yet.
		AI_Output(self,other,"DIA_Addon_Vatras_NowRanger_05_16");	//Make haste, then. Go to him. I think your message is very important!
	};
};


instance DIA_ADDON_VATRAS_CLOSEMEETING(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_closemeeting_condition;
	information = dia_addon_vatras_closemeeting_info;
	description = "The brothers of the 'Ring' have sent me to you.";
};


func int dia_addon_vatras_closemeeting_condition()
{
	if(LARES_TAKEFIRSTMISSIONFROMVATRAS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_closemeeting_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_CloseMeeting_15_00");	//The brothers of the 'Ring' have sent me to you.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_01");	//Good! I've been awaiting you!
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_02");	//I shall send you through the portal together with the other Water Mages.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_03");	//You are to track down the former ore baron Raven and find out why he has taken the citizens of Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_04");	//We here shall continue to try and deal with the threat posed by the bandits.
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_05");	//Bring this letter to Saturas. He will set your tasks from now on.
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_08");	//Lares will take you to him if he hasn't already delivered the ornament.
	};
	CreateInvItems(self,itwr_vatras2saturas_findraven,1);
	b_giveinvitems(self,other,itwr_vatras2saturas_findraven,1);
	AI_Output(self,other,"DIA_Addon_Vatras_CloseMeeting_05_06");	//May Adanos guide you.
	b_logentry(TOPIC_ADDON_KDW,"Vatras gave me a letter to take to Saturas. I am supposed to go through the portal with the other Water Mages and follow the trail of the former ore baron Raven.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKLAVEN,"I am to find out why Raven captured the citizens of Khorinis.");
	RANGERMEETINGRUNNING = LOG_SUCCESS;
	b_schlussmitrangermeeting();
	b_giveplayerxp(XP_AMBIENT);
};



var int missingpeopleinfo[20];

instance DIA_ADDON_VATRAS_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_missingpeople_condition;
	information = dia_addon_vatras_missingpeople_info;
	permanent = TRUE;
	description = "About the missing people...";
};


func int dia_addon_vatras_missingpeople_condition()
{
	if(MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int dia_addon_vatras_missingpeople_wo_noperm;

func void dia_addon_vatras_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_15_00");	//About those missing people...
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_05_01");	//Yes?
	Info_ClearChoices(dia_addon_vatras_missingpeople);
	Info_AddChoice(dia_addon_vatras_missingpeople,DIALOG_BACK,dia_addon_vatras_missingpeople_back);
	if(SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"I know where they are!",dia_addon_vatras_missingpeople_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Let me tell you what I know...",dia_addon_vatras_missingpeople_report);
	};
	if(DIA_ADDON_VATRAS_MISSINGPEOPLE_WO_NOPERM == FALSE)
	{
		Info_AddChoice(dia_addon_vatras_missingpeople,"Where should I start looking for them?",dia_addon_vatras_missingpeople_wo);
	};
};

func void dia_addon_vatras_missingpeople_back()
{
	Info_ClearChoices(dia_addon_vatras_missingpeople);
};

func void dia_addon_vatras_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Vatras_HintMissingPeople_Wo_15_00");	//Where should I start looking for them?
	AI_Output(self,other,"DIA_Addon_Vatras_HintMissingPeople_Wo_05_01");	//Most of those people disappeared down by the harbor. That's probably where you should start your search.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Most people went missing by the harbor in Khorinis. That's where I am to start my search.");
	dia_addon_vatras_missingpeople_wo_noperm = TRUE;
};

func void dia_addon_vatras_missingpeople_report()
{
	var int vatras_missingpeoplereports;
	var int xp_vatras_missingpeoplereports;
	vatras_missingpeoplereports = 0;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_00");	//Let me tell you what I know...
	if(((MIS_AKIL_BRINGMISSPEOPLEBACK != 0) || (MIS_BENGAR_BRINGMISSPEOPLEBACK != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_01");	//The farmers have lost some people as well.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((ELVRICH_GOESBACK2THORBEN == TRUE) || (ELVRICH_SCKNOWSPIRATS == TRUE) || (SC_KNOWSDEXTERASKIDNAPPER == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_02");	//I have found out that the bandits are responsible for the disappearances here.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_03");	//Elvrich, Master Thorben's apprentice, told me that the bandits take the kidnapped people out of Khorinis by sea.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_04");	//Some pirates are involved in this somehow. I haven't quite figured out their role yet.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_05");	//I rescued Elvrich from the bandits.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_06");	//The bandits dragged off a girl named Lucia.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,itwr_luciasloveletter_addon) || (MIS_LUCIASLETTER == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_07");	//Lucia, the girl that was kidnapped by the bandits, has decided to join them.
		if(MIS_LUCIASLETTER == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_08");	//It certainly looks like she did this out of her own free will.
		};
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_09");	//The leader of the bandits is named Dexter. He is responsible for the kidnappings.
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_10");	//I knew Dexter back in the penal colony. He was working for the ore baron Gomez then.
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_11");	//He will certainly remember you. You should be careful.
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	if(vatras_missingpeoplereports != 0)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_12");	//I think you're on the right track. Carry on.
		xp_vatras_missingpeoplereports = XP_ADDON_VATRAS_MISSINGPEOPLEREPORT * vatras_missingpeoplereports;
		b_giveplayerxp(xp_vatras_missingpeoplereports);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Report_05_13");	//What have you found out?
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Report_15_14");	//Nothing important so far.
	};
};

func void dia_addon_vatras_missingpeople_success()
{
	var int vatras_missingpeoplereports;
	var int xp_vatras_missingpeoplereports;
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_00");	//I know where the missing people are.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_01");	//What have you found out?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_02");	//A man named Raven dragged them off to a remote part of Khorinis.
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_03");	//What makes you so sure?
	AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_04");	//I read his orders. He's got the local bandits working for him.
	if(Npc_HasItems(other,itwr_ravenskidnappermission_addon))
	{
		AI_Output(other,self,"DIA_Addon_Vatras_MissingPeople_Success_15_05");	//Here.
		AI_PrintScreen("Raven's orders given",-1,26,FONT_SCREENBRIGHTLARGE,2);
		Npc_RemoveInvItems(hero,itwr_ravenskidnappermission_addon,1);
		b_usefakescroll();
	};
	AI_Output(self,other,"DIA_Addon_Vatras_MissingPeople_Success_05_06");	//Good. You did a great job. I had feared that we might have to resign ourselves to never knowing.
	MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE = LOG_SUCCESS;
	if(MIS_STECKBRIEFE == LOG_RUNNING)
	{
		MIS_STECKBRIEFE = LOG_SUCCESS;
	};
	vatras_missingpeoplereports = 0;
	if(((MIS_AKIL_BRINGMISSPEOPLEBACK != 0) || (MIS_BENGAR_BRINGMISSPEOPLEBACK != 0)) && (MISSINGPEOPLEINFO[1] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[1] = TRUE;
	};
	if(((ELVRICH_GOESBACK2THORBEN == TRUE) || (ELVRICH_SCKNOWSPIRATS == TRUE) || (SC_KNOWSDEXTERASKIDNAPPER == TRUE)) && (MISSINGPEOPLEINFO[2] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[2] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[3] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[3] = TRUE;
	};
	if((ELVRICH_SCKNOWSPIRATS == TRUE) && (MISSINGPEOPLEINFO[4] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[4] = TRUE;
	};
	if((ELVRICH_GOESBACK2THORBEN == TRUE) && (MISSINGPEOPLEINFO[5] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[5] = TRUE;
	};
	if((SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE) && (MISSINGPEOPLEINFO[6] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[6] = TRUE;
	};
	if((Npc_HasItems(other,itwr_luciasloveletter_addon) || (MIS_LUCIASLETTER == LOG_SUCCESS)) && (MISSINGPEOPLEINFO[7] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[7] = TRUE;
	};
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (MISSINGPEOPLEINFO[8] == FALSE))
	{
		vatras_missingpeoplereports += 1;
		MISSINGPEOPLEINFO[8] = TRUE;
	};
	xp_vatras_missingpeoplereports = XP_ADDON_VATRAS_MISSINGPEOPLEREPORT * vatras_missingpeoplereports;
	xp_vatras_missingpeoplereports += XP_ADDON_VATRAS_WHEREAREMISSINGPEOPLE;
	b_giveplayerxp(xp_vatras_missingpeoplereports);
};


instance DIA_ADDON_VATRAS_FREE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_free_condition;
	information = dia_addon_vatras_free_info;
	permanent = FALSE;
	description = "The missing people are back!";
};


func int dia_addon_vatras_free_condition()
{
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_free_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Free_15_00");	//The missing people have come back.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_01");	//Yes, you did it. Their journey has come to a good end.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_02");	//But your own journey must go on. So go with the blessing of Adanos.
	AI_Output(self,other,"DIA_Addon_Vatras_Free_05_03");	//(praying) Adanos, bless this man. Light his path and grant him the strength to withstand all dangers.
	b_raiseattribute(other,ATR_MANA_MAX,3);
	other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
	other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
	Snd_Play("Levelup");
};


instance DIA_ADDON_VATRAS_WAFFEN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_waffen_condition;
	information = dia_addon_vatras_waffen_info;
	permanent = TRUE;
	description = "About this weapons dealer...";
};


func int dia_addon_vatras_waffen_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_waffen_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_15_00");	//About this weapons dealer...
	Info_ClearChoices(dia_addon_vatras_waffen);
	Info_AddChoice(dia_addon_vatras_waffen,DIALOG_BACK,dia_addon_vatras_waffen_back);
	if((FERNANDO_IMKNAST == TRUE) || (FERNANDO_HATSZUGEGEBEN == TRUE))
	{
		Info_AddChoice(dia_addon_vatras_waffen,"I know the dealer who's been selling weapons to the bandits!",dia_addon_vatras_waffen_success);
	}
	else
	{
		Info_AddChoice(dia_addon_vatras_waffen,"What do you know about the weapons dealer so far?",dia_addon_vatras_waffen_tomartin);
	};
};

func void dia_addon_vatras_waffen_back()
{
	Info_ClearChoices(dia_addon_vatras_waffen);
};

func void dia_addon_vatras_waffen_tomartin()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_ToMartin_15_00");	//How much do you know about the weapons dealer?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_01");	//Ask Martin, the provisions master of the paladins, about this. He should be able to tell you more.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_02");	//He has been tasked with unmasking the weapons dealer.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_ToMartin_05_03");	//You can find Martin in the harbor district. If you see a heap of crates, provisions and paladins, Martin won't be far.
	VATRAS_TOMARTIN = TRUE;
};

func void dia_addon_vatras_waffen_success()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_00");	//I know the dealer who's been selling weapons to the bandits!
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_01");	//His name is Fernando.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_02");	//Very good. Has Martin taken the necessary steps to stop him from delivering any more?
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_03");	//Yes. Martin will see to it that he won't be leaving the dungeon any time soon.
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_04");	//Well done, son.
		if(Npc_KnowsInfo(other,dia_addon_vatras_wannaberanger) && (SC_ISRANGER == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Success_15_05");	//(cheekily) Does that mean that you're going to let me join the 'Ring of Water' now?
			AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_06");	//(smiles) THAT was not what we agreed upon - and you know it.
		};
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//May Adanos light your path.
		MIS_VATRAS_FINDTHEBANDITTRADER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_VATRAS_FINDTHEBANDITTRADER);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_CaughtFernando_15_09");	//Not yet.
		AI_Output(self,other,"DIA_Addon_Vatras_CaughtFernando_05_10");	//Then make haste and report to him at once. It must be stopped right now.
	};
};


instance DIA_ADDON_VATRAS_WISP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_wisp_condition;
	information = dia_addon_vatras_wisp_info;
	description = "Is there anything that could help me with my search?";
};


func int dia_addon_vatras_wisp_condition()
{
	if(MIS_VATRAS_FINDTHEBANDITTRADER != 0)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_wisp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_WISP_15_00");	//Is there anything that could help me with my search?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_01");	//You are very persistent, young man. But I actually can think of something that could make your tasks easier for you.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_02");	//I shall give you this ore amulet. You'll certainly be able to use it.
	CreateInvItems(self,itam_addon_wispdetector,1);
	b_giveinvitems(self,other,itam_addon_wispdetector,1);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_03");	//It is an amulet of the searching will-o'-the-wisps.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_04");	//There are only very few of them. The will-o'-the-wisp that inhabits this amulet has very special properties.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_05");	//It can help you find things that normally elude the naked eye.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_06");	//You summon it by simply wearing the amulet.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_07");	//If it loses its power or you cannot find it, simply put on the amulet again, and it will reappear.
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Vatras gave me an 'amulet of the searching will-o'-the-wisp' to help me in my search for the weapons dealer.");
	Log_CreateTopic(TOPIC_WISPDETECTOR,LOG_NOTE);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED);
	b_logentry(TOPIC_WISPDETECTOR,LOGTEXT_ADDON_WISPLEARNED_NF);
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_08");	//The will-o'-the-wisp can detect weapons.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_09");	//It could be very helpful to you in investigating the weapons deliveries to the bandits.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_WISP_05_10");	//Treat it well, and it will never fail you.
	Info_ClearChoices(dia_addon_vatras_wisp);
	Info_AddChoice(dia_addon_vatras_wisp,"Thank you! I shall take good care of it.",dia_addon_vatras_wisp_thanks);
	Info_AddChoice(dia_addon_vatras_wisp,"Can the will-o'-the-wisp do more than that?",dia_addon_vatras_wisp_morewisp);
	Info_AddChoice(dia_addon_vatras_wisp,"A will-o'-the-wisp in an amulet?",dia_addon_vatras_wisp_amulett);
	SC_GOTWISP = TRUE;
};

func void dia_addon_vatras_wisp_thanks()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_Thanks_15_00");	//Thank you! I shall take good care of it.
	Info_ClearChoices(dia_addon_vatras_wisp);
};

func void dia_addon_vatras_wisp_morewisp()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Waffen_MoreWISP_15_00");	//Can the will-o'-the-wisp do more than that?
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_01");	//More than look for close-combat weapons? Not unless you teach it.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_02");	//I think Riordian knows how to teach these beings. He is one of us, currently traveling with Saturas.
	AI_Output(self,other,"DIA_Addon_Vatras_Waffen_MoreWISP_05_03");	//Perhaps he can tell you more.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"My searching will-o'-the-wisp can do more than just find close-combat weapons. Riordian the Water Mage can teach it to look for other things as well.");
	};
};

func void dia_addon_vatras_wisp_amulett()
{
	AI_Output(other,self,"DIA_Addon_Vatras_WISPDETECTOR_was_15_00");	//A will-o'-the-wisp in an amulet?
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_01");	//Will-o'-the-wisps are admirable creatures. They consist of pure magical energy.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_02");	//They are bound to the magical ore in this world. It is their origin. It gives them their strength.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_03");	//I am not surprised that you have never heard of them. They only appear to the person who bears the ore to which they belong.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_04");	//Will-o'-the-wisps living in the wild have been forcefully removed from their sources. They will attack anyone who approaches them.
	AI_Output(self,other,"DIA_Addon_Vatras_WISPDETECTOR_was_05_05");	//There is no way to help those pitiful creatures. You had better stay away from them.
};


instance DIA_ADDON_VATRAS_STONEPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_stoneplate_condition;
	information = dia_addon_vatras_stoneplate_info;
	description = "I've got this stone tablet...";
};


func int dia_addon_vatras_stoneplate_condition()
{
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_stoneplate_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_Stoneplate_15_00");	//I've got this stone tablet. Can you tell me more about it?
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_01");	//Those are artifacts from the old culture which we have been investigating for some time.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_02");	//There are several kinds of them. Some contain information about the history of the ancient people.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_03");	//And that is the kind I am interested in. Bring me all of those that you can find.
	AI_Output(self,other,"DIA_Addon_Vatras_Stoneplate_05_04");	//I shall give you an appropriate reward.
	Log_CreateTopic(TOPIC_ADDON_STONEPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATES,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATES,LOGTEXT_ADDON_VATRASTRADE);
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,LOGTEXT_ADDON_VATRASTRADE);
};


instance DIA_ADDON_VATRAS_SELLSTONPLATE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_sellstonplate_condition;
	information = dia_addon_vatras_sellstonplate_info;
	permanent = TRUE;
	description = "I've got more stone tablets for you...";
};


func int dia_addon_vatras_sellstonplate_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_vatras_stoneplate) && (Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_sellstonplate_info()
{
	var int n_tablets;
	var int tot_tablets;
	var int flag;
	n_tablets = Npc_HasItems(other,itwr_stoneplatecommon_addon);
	tot_tablets += n_tablets;
	if(n_tablets >= 1)
	{
		CreateInvItems(self,itmi_gold,100 * n_tablets);
		b_giveinvitems(self,other,itmi_gold,100 * n_tablets);
		Npc_RemoveInvItems(hero,itwr_stoneplatecommon_addon,n_tablets);
		b_giveplayerxp(XP_ADDON_VATRASSTONPLATE * n_tablets);
		AI_Output(self,other,"DIA_Addon_Vatras_Waffen_Success_05_07");	//May Adanos light your path.
	};
	if((flag != TRUE) && (tot_tablets > 25) && (MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING))
	{
		MIS_ADDON_EROL_BANDITSTUFF = LOG_FAILED;
		b_checklog();
		flag = TRUE;
	};
};


var int vatras_senttodaron;

instance DIA_ADDON_VATRAS_GUILDHELP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_addon_vatras_guildhelp_condition;
	information = dia_addon_vatras_guildhelp_info;
	description = "Lares says that you can help me get into the monastery of the Fire Magicians.";
};


func int dia_addon_vatras_guildhelp_condition()
{
	if(RANGERHELP_GILDEKDF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_guildhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_00");	//Lares said that you could help me get into the monastery of the Fire Magicians.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_01");	//Is that your choice? The Way of the Fire?
	AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_02");	//Yes. I want to become a Fire Magician.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_03");	//As far as I know, they gladly accept novices in their monastery. So why would you need my help?
	if(SC_KNOWSKLOSTERTRIBUT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_04");	//The novice in front of the monastery wants me to pay a tribute to enter. A sheep and a load of gold.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Vatras_GuildHelp_15_05");	//Lares mentioned that they demand a tribute before they let anyone into the monastery.
	};
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_06");	//I cannot grant you entry into the monastery myself. I am a Water Mage, as you know. But I am very well acquainted with Daron the Fire Magician.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_07");	//He spends most of his time in the marketplace, collecting alms for his church.
	VATRAS_SENTTODARON = TRUE;
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_08");	//But I have heard that he is not only in town to raise some funds.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_09");	//He told me about a statuette that was stolen from him.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_10");	//It was very important to him. He will surely allow you to enter the monastery if you can get it back for him.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_11");	//Of course, if you should decide to join the Circle of Fire, you can still become a member of the Ring.
	AI_Output(self,other,"DIA_Addon_Vatras_GuildHelp_05_12");	//If you prove yourself worthy, that is.
	MIS_ADDON_VATRAS_GO2DARON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Daron, the Fire Magician in the marketplace, will help me get into the monastery if I find his stolen statuette for him.");
};


instance DIA_VATRAS_MORE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 998;
	condition = dia_vatras_more_condition;
	information = dia_vatras_more_info;
	permanent = TRUE;
	description = "(More)";
};


func int dia_vatras_more_condition()
{
	if(VATRAS_MORE == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_more_info()
{
	VATRAS_MORE = TRUE;
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 92;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "I am asking your blessing.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//I am asking your blessing.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Why should I give you my blessing, stranger?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//I want to start an apprenticeship with one of the masters in the lower part of town.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Go with the blessing of Adanos, my son!
	Snd_Play("LevelUp");
	b_giveplayerxp(XP_VATRASTRUTH);
	VATRAS_SEGEN = TRUE;
	b_logentry(TOPIC_THORBEN,"Vatras the Water Mage has blessed me.");
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 93;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Where can I find a priest of Innos?";
};


func int dia_vatras_wokdf_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (VATRAS_SEGEN == TRUE) && (VATRAS_SENTTODARON == FALSE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Where can I find a priest of Innos?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//The best thing would be to look around the marketplace. You will find an emissary of the monastery there.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 94;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "I want to make a donation to Adanos!";
};


func int dia_vatras_spende_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//I want to make a donation to Adanos!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//A donation to the church of Adanos would alleviate a part of the sins which you may have committed, my son.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//How much can you give?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"I haven't got anything to spare right now...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"I've got 50 gold pieces...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"I've got 100 gold pieces...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//I haven't got anything to spare right now...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//That is not a problem, you can act upon your good intentions later, my son.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//I've got 50 gold pieces...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//I thank you in the name of Adanos, my son. Your gold will be distributed among the needy.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//I've got 100 gold pieces...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//I bless you in the name of Adanos for this generous act!
	Snd_Play("LevelUp");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//May the path you follow be blessed by Adanos!
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Vatras the Water Mage has blessed me.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 95;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Can you teach me something about magic?";
};


func int dia_vatras_canteach_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Can you teach me something about magic?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Only the Chosen of Innos and the Chosen of Adanos are permitted to work rune magic.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//But common mortals can also work magic with the help of spell scrolls.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//I can show you how you can channel and expand your magic powers.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Vatras the Water Mage can help me increase my magic powers.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "I want to increase my magic powers.";
};


func int dia_vatras_teach_condition()
{
	if((VATRAS_TEACHMANA == TRUE) && (VATRAS_MORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//I want to increase my magic powers.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Your magical power has grown beyond my ability to teach you.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "Tell me about the gods.";
};


func int dia_vatras_gods_condition()
{
	if(VATRAS_MORE == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Tell me about the gods.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//What exactly would you like to know?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Tell me about Innos.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Adanos.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Beliar.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Tell me about Innos.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Very well. (preaches) Innos is the first and highest god. He created the sun and the world.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//He commands light and fire, his gifts to humanity. He is law and justice.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//His priests are the Magicians of Fire, the paladins are his warriors.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Tell me about Innos.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Adanos.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Beliar.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Tell me about Adanos.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Adanos is the god of the center. He is the scales of justice, the guardian of the balance between Innos and Beliar.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//He commands the power of change, his gift is the water in all the oceans, rivers, and lakes.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//His priests are the Water Mages, just as I am a servant and priest of Adanos.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Tell me about Innos.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Adanos.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Beliar.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Tell me about Beliar.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Beliar is the dark god of death, destruction and all things unnatural.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//He is in eternal battle with Innos, but Adanos guards the balance between the two.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Only a few humans follow the call of Beliar - however, he grants great strength to those who do.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Tell me about Innos.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Adanos.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Tell me about Beliar.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//I have a message for Master Isgaroth. He guards the shrine in front of the monastery.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//If you run this errand for me, you get to choose your own reward.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Not now.",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Sure.",dia_vatras_mission_yes);
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Good. So be on your way to Master Isgaroth now.
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//I'll do it.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Good, then take the message and choose one of these spell scrolls.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//When you have delivered the message, I shall reward you accordingly.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Vatras has given me a message for Master Isgaroth. He is at the shrine in front of the monastery.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"I'll take the spell of light.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"I choose the healing spell.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Give me the Ice Arrow.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_ADDON_Vatras_MISSION_NO_15_00");	//Not now!
	AI_Output(self,other,"DIA_ADDON_Vatras_MISSION_NO_05_01");	//No problem. I shall send somebody else.
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//I choose the healing spell.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Give me the Ice Arrow.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//I'll take the spell of light.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_light,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "I have delivered your message.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//I have delivered your message.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Accept my thanks. And now pick your reward.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 king's sorrel",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Ring of Skill",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 ore nugget",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,itpl_perm_herb,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,itri_dex_01,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,itmi_nugget,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Listen people! I am needed elsewhere.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//It won't take long. When I return I shall tell you the rest of the story.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//I do not know whether I shall return. If you want to know the ending, read up on the story in the scriptures.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//May Adanos be with you!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_ADDON_VATRAS_ABLOESEPRE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_abloesepre_condition;
	information = dia_addon_vatras_abloesepre_info;
	description = "I've got this problem with the Eye of Innos.";
};


func int dia_addon_vatras_abloesepre_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_abloesepre_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_00");	//I've got a problem with the Eye of Innos. I could use your help.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_01");	//And will your problem require me to leave town?
	AI_Output(other,self,"DIA_Addon_Vatras_AbloesePre_15_02");	//I don't know. Possibly.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_03");	//I have been waiting to be relieved for days. The other Water Mages should have been back in Khorinis some time ago.
	AI_Output(self,other,"DIA_Addon_Vatras_AbloesePre_05_04");	//If you see to it that at least one of them comes to take over my duties in town, I shall be free to help you solve your problem.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Vatras cannot help me solve my problem with the 'Eye of Innos' as long as there isn't another Water Mage to take over his task in the city.");
};


instance DIA_ADDON_VATRAS_ADDONSOLVED(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_addon_vatras_addonsolved_condition;
	information = dia_addon_vatras_addonsolved_info;
	description = "Someone's here to relieve you.";
};


func int dia_addon_vatras_addonsolved_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_vatras_addonsolved_info()
{
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_00");	//Someone's here to relieve you.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_01");	//Have the matters beyond the north-eastern mountains been settled?
	AI_Output(other,self,"DIA_Addon_Vatras_AddonSolved_15_02");	//Yes, they have. Raven is dead, and the threat has been averted.
	AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_03");	//That is good news indeed. Now let us hope that such things will not happen again.
	if(Npc_KnowsInfo(other,dia_addon_vatras_abloesepre))
	{
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_04");	//NOW I can help you with your little problem.
		AI_Output(self,other,"DIA_Addon_Vatras_AddonSolved_05_05");	//I seem to remember it concerns the Eye of Innos, right?
	};
	VATRASCANLEAVETOWN_KAP3 = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "The Eye of Innos is broken.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3) && (VATRASCANLEAVETOWN_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Pyrokar sent me.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Xardas sent me.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//The Eye of Innos is broken.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//I know. I have already learned of it from some very upset novices.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//The Seekers have used the Fire Magicians' Circle of the Sun to destroy the Eye.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//I would call that an inspired move by the enemy.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"News spreads fast in this city.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Why did Pyrokar send me to you of all people?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"What will become of the Eye now?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//What will become of the Eye now?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//We must join it back together. But that is no easy task, I fear.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//The setting is broken into two pieces. A skilled smith should be able to repair this.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//But that is really not the problem. It's rather the inlaid gem that worries me.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//It is dull and powerless. The enemy seems to have known exactly how to weaken it.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Where can I find a smith capable of repairing the setting?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"How can the gem get its power back?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//How can the gem get its power back?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//I see only one way. A union of the three reigning divinities should achieve the desired effect.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//A well prepared ritual of reversal in the place of its destruction will give the gem back its fire.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//However, the problem is that you must bring an earthly representative of each of the three gods to this place.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Furthermore, a lot of swampweed is required for this ritual. I estimate it should be at least 3 plants.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Who could those three earthly representatives of the gods be?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Where can I find this swampweed?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Where can I find this swampweed?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//I have heard about an old quack in the woods named Sagitta. She supposedly sells such herbs.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//But you could also try your luck down at the harbor.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Who could those three earthly representatives of the gods be?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//I shall represent the god Adanos myself.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Pyrokar, the highest fire magician, would be the right person to represent the god Innos.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//But for Beliar, I cannot think of an appropriate candidate. It must be someone who commands black magic.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Black magic? What about Xardas?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Black magic? What about Xardas?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//That's it. That could work.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//But I ask myself how you will bring all three of us together.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//I can just see Pyrokar's face when he hears that he must cooperate with Xardas.
	Info_AddChoice(dia_vatras_innoseyekaputt,"I've got to go.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Where can I find a smith capable of repairing the setting of the Eye?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Ask around in the area for someone who knows how to repair jewelry.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Why did Pyrokar send me to you of all people?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//I suspected that sooner or later something like this would happen.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Pyrokar always thinks himself so invulnerable and superior that it almost borders on carelessness.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Thus his precautions for protecting the Eye were also careless.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//I simply think that he unconsciously relies on the abilities which Adanos has granted me.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//It doesn't bear thinking about what would happen if I were not available now.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//News spreads fast in this city.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//That's a good thing, too. The enemy won't be sleeping, either.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//I've got to go.
	b_kdw_hood(self);
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//I shall also set out and prepare the ceremony at the Circle of the Sun.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Send Xardas and Pyrokar there. And don't forget to bring the swampweed. I am counting on you.
	b_logentry(TOPIC_INNOSEYE,"Vatras wants to perform a ritual at the Circle of the Sun to heal the Eye. I have to persuade Xardas and Pyrokar to take part in it. Also, I have to find a smith who can repair the amulet's broken setting.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "How are things with the Eye of Innos?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//How are things with the Eye of Innos?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Remember: only a ritual of reversal at the Circle of the Sun together with Xardas and Pyrokar will restore the Eye.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//And don't forget to bring the Eye, with its setting repaired.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "I did everything you told me to do.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//I did everything you told me to do. Here's the repaired Eye.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Indeed, there is nothing missing now for the performance of the ritual.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//What about the swampweed?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ah, yes. Do you have 3 swampweed plants, then?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Ahem. Yes. Here are the 3 plants.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Excellent.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//No. Alas not.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//All right. Then we shall have to make do without.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//You have done well, but now step aside so that we may begin the ceremony. May our spirits unite.
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	b_kdw_hood(self);
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//It is finished. We have succeeded in thwarting the enemy's plan and restoring the Eye.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Let Pyrokar explain to you how to use its power.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//I hope that I shall see you again, once you have accomplished your mission. Farewell.
	b_logentry(TOPIC_INNOSEYE,"The Eye has been healed. Pyrokar will hand it to me, and then it's off dragon hunting.");
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "Thank you for helping to heal the Eye of Innos.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Thank you for helping to heal the Eye of Innos.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Do not be so lavish with your thanks. Your greatest task yet lies before you.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Speak to Pyrokar, he will explain everything else to you.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//I hope to see you again in one piece, my son.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "Lobart's wife Hilda is sick.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Lobart's wife Hilda is sick.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//What? Again? The good woman should take better care of herself.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//One hard winter, and she won't be with us anymore. All right, I will give her a medicine to reduce the fever.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Oh, you know, while you're at it, you might as well drop it off with her.
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,itpo_healhilda_mis,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "I've got this feeling of trepidation.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//I've got this feeling of trepidation.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//You don't look well either. You were subjected to the black look of the Seekers for too long.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//All I can heal is your body, but only the monastery can purify your soul. Speak to Pyrokar. He will help you.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "The dragons will wreak no more havoc.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//The dragons will wreak no more havoc.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//I knew that you would return safe and sound. However, you have yet to take your greatest hurdle.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//I know.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Then equip yourself well and come to me if you need help. Always carry the Eye of Innos with you, do you hear? Adanos bless you.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "I know where our enemy is located.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//I know where our enemy is located.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Then let us waste no time and seek him out before he comes to us.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//You want to accompany me?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//I have thought long about this and have never been so sure of my business, my friend.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Surprisingly, Vatras has offered to accompany me on my journey. A man of his skill and experience could be very valuable to me.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//I've got too many on my list already. I'm afraid there will be no more room for you.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Then make room. You will need me.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"I'm going to think about it some more.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"I consider it an honor to have you by my side.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//I consider it an honor to have you by my side. We'll meet you at the harbor.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Don't take too much time. The enemy does not sleep, my friend.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//I'm going to think about it some more.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Suit yourself. Come back to me if you change your mind.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "You had better stay here. The city needs you.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//You had better stay here. The city needs you.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Perhaps you are right. And yet, I shall accompany you if you wish. You know that.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "Come with me to the enemy's island.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Come with me to the enemy's island.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//A wise decision. I hope you are going to stick with it now.
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_condition;
	information = dia_addon_vatras_pissoffforevver_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_condition()
{
	if((VATRASPISSEDOFFFOREVER == TRUE) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_addon_vatras_pissoffforevver_info()
{
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
	VATRAS_MORE = FALSE;
};

