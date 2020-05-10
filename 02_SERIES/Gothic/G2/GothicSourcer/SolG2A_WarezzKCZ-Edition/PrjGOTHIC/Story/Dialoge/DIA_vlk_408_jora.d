
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V2;
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//I've got to be on my way.
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Hey! What about my money?
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_SPERRE(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_sperre_condition;
	information = dia_jora_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jora_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jora_sperre_info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//You're a convict from the mining colony. I won't sell you anything!
	AI_StopProcessInfos(self);
};


instance DIA_JORA_WAREZ(C_INFO)
{
	npc = vlk_408_jora;
	nr = 700;
	condition = dia_jora_warez_condition;
	information = dia_jora_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Show me your wares.
};


instance DIA_JORA_GREET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_greet_condition;
	information = dia_jora_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jora_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_greet_info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Innos be with you, stranger. If you are looking for a good selection for the traveler, then you're in the right place.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//But I'm warning you: if you're planning on helping yourself without paying, I'll call the city guard!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Just a moment, do I look like a thief?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(scornful) Bah! You wouldn't be the first one to make off with my things today.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Jora trades in weapons of all kinds at the marketplace.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "Somebody stole from you?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//Somebody stole from you?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//I can't prove it. The fellow was damned clever. Introduced himself as Rengaru - if that really is his right name.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//He's been hanging around the marketplace the last few days.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//And every evening he gets plastered at the beer stand down the street. I bet the bastard is drinking MY money!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//I only looked away for a moment and my purse was gone!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//Listen - if you get my gold back for me from that Rengaru fellow, I'll tell you what I know.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "I could get your gold back for you.";
};


func int dia_jora_holdeingold_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_bestohlen))
	{
		return TRUE;
	};
};

func void dia_jora_holdeingold_info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//I could get your gold back for you.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(distrustful) Oh? And why would you do that?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"I want part of the gold as a reward!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"I'm looking for clues to the thieves' guild!",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"That depends - can you help me get into the upper quarter?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//That depends - can you help me get into the upper quarter?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(laughs) You've got the wrong man. I'm from out of town - like most of the merchants in the marketplace.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//If you want to get into the upper quarter, go talk to the resident merchants in the lower part of town.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//I'm looking for clues to the thieves' guild!
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//I might well be able to help you.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"I'll see what I can do.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"How much gold was in that purse?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Why didn't you call the city guard?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//I want part of the gold as a reward!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//First see if you get my purse back. THEN we'll talk about your reward!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"I'll see what I can do.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"How much gold was in that purse?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Why didn't you call the city guard?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Why didn't you call the city guard?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//The guards only respond if a thief is caught in the act.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//And when I noticed my purse was missing, the bastard was already gone!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//How much gold was in that purse?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 gold pieces - that's quite a lot in these crappy times.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//I'll see what I can do.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Be careful! If you just knock the bastard down, the city guard will get involved.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Lately, things have been getting really rough here. Since the paladins came to town, the guards have been cracking down harshly on brawlers.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//So, think of something...
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//I shall.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"A guy by the name of Rengaru robbed the merchant Jora. He spends his days in the marketplace.");
	b_logentry(TOPIC_JORA,"I've got to get Jora's gold back for him.");
	b_logentry(TOPIC_JORADIEB,"Rengaru robbed the merchant Jora. If I catch up with him, there may be a reward to collect.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "About the thief...";
};


func int dia_jora_wegendieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_wegendieb_info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//About the thief...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Yes, how's it going? Have you caught him - and much more importantly - do you have my gold?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"Well, he met with a fatal accident.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"Yes, I caught him all right.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"He got away from me.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"I'm still working on it!",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//I'm still working on it!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Then see to it that you get my gold back!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//He got away from me.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//And what about my gold? Did it get away with him?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Yes, I caught him all right. He's going to cool his heels in jail for a while.
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//What about my gold?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//Well, he met with a fatal accident.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//Then at least he won't steal from anyone else! The justice of Innos has prevailed.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Where is my gold?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};


instance DIA_JORA_BRINGGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_bringgold_condition;
	information = dia_jora_bringgold_info;
	permanent = TRUE;
	description = "Here's the 50 gold pieces he stole from you.";
};


func int dia_jora_bringgold_condition()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jora_bringgold_info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Here's the 50 gold pieces he stole from you.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Innos be praised! There is still justice in the city.
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Hey, this isn't 50 gold pieces! Are you trying to steal from me, too?
	};
};


var int jora_ghdghinweis;

instance DIA_JORA_GHDGINFO(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_ghdginfo_condition;
	information = dia_jora_ghdginfo_info;
	permanent = TRUE;
	description = "What do you know about the thieves' guild?";
};


func int dia_jora_ghdginfo_condition()
{
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jora_bestohlen) && (JORA_GHDGHINWEIS == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_ghdginfo_info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//What do you know about the thieves' guild?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//Right - listen up - you haven't heard anything of what I'm about to tell you from me, capisce?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//There are shady characters who frequent the dockside pub.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//I bet the landlord knows a thing or two...
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//If you're planning to track down the thieves, you should go talk to HIM.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//You could act like you're up to something crooked, for example. Maybe he'll fall for it.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//But be very careful. These people are not to be trifled with.
		JORA_GHDGHINWEIS = TRUE;
	};
};


instance DIA_JORA_BELOHNUNG(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_belohnung_condition;
	information = dia_jora_belohnung_info;
	permanent = FALSE;
	description = "I want part of the gold as a reward!";
};


func int dia_jora_belohnung_condition()
{
	if(JORA_GOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jora_belohnung_info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//I want part of the gold as a reward!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//But I already gave you a valuable hint.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//That should suffice as a reward for you.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//If it's gold you want, then hunt down the thieves and collect the bounty from Lord Andre.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//Now, I must get back to my customers...
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_ALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_alriksschwert_condition;
	information = dia_jora_alriksschwert_info;
	permanent = FALSE;
	description = "Alrik says you've got his sword...";
};


func int dia_jora_alriksschwert_condition()
{
	if(MIS_ALRIK_SWORD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_alriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Alrik says you've got his sword...
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Do you mean that ragged fellow who traded his weapon to me for a few torches and chunks of meat?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//That's him.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//I still have the sword.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//How much do you want for it?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//Well - for you...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//Ah, so what! Here, take it. After all, you did help me get my gold back...
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//Well - for you - 50 gold pieces.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(grumpy) I don't have it any more! The devil only knows where the thing is now.
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "Here's 50 gold pieces. Give me Alrik's sword, then.";
};


func int dia_jora_buyalriksschwert_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_alriksschwert) && (Npc_HasItems(self,itmw_alrikssword_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_jora_buyalriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Here's 50 gold pieces. Give me Alrik's sword, then.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Here you go - (cunning) that was a good deal.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//You don't have enough gold. But don't worry - I'll keep the sword for a while. Come back later, then...
	};
};


instance DIA_JORA_PICKPOCKET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 900;
	condition = dia_jora_pickpocket_condition;
	information = dia_jora_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jora_pickpocket_condition()
{
	return c_beklauen(31,45);
};

func void dia_jora_pickpocket_info()
{
	Info_ClearChoices(dia_jora_pickpocket);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_BACK,dia_jora_pickpocket_back);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_PICKPOCKET,dia_jora_pickpocket_doit);
};

func void dia_jora_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jora_pickpocket);
};

func void dia_jora_pickpocket_back()
{
	Info_ClearChoices(dia_jora_pickpocket);
};

