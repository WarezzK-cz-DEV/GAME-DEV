
instance DIA_ADDON_GREG_EXIT(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 999;
	condition = dia_addon_greg_exit_condition;
	information = dia_addon_greg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_PICKPOCKET(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 900;
	condition = dia_addon_greg_pickpocket_condition;
	information = dia_addon_greg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_greg_pickpocket_condition()
{
	return c_beklauen(111,666);
};

func void dia_addon_greg_pickpocket_info()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_BACK,dia_addon_greg_pickpocket_back);
	Info_AddChoice(dia_addon_greg_pickpocket,DIALOG_PICKPOCKET,dia_addon_greg_pickpocket_doit);
};

func void dia_addon_greg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_greg_pickpocket);
};

func void dia_addon_greg_pickpocket_back()
{
	Info_ClearChoices(dia_addon_greg_pickpocket);
};


instance DIA_ADDON_GREG_IMNEW(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 1;
	condition = dia_addon_greg_imnew_condition;
	information = dia_addon_greg_imnew_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_greg_imnew_condition()
{
	return TRUE;
};

func void dia_addon_greg_imnew_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_00");	//(threatening) Hey, you. What are you doing in my hut?
	AI_Output(other,self,"DIA_Addon_Greg_Hello_15_01");	//I...
	AI_Output(self,other,"DIA_Addon_Greg_Hello_01_02");	//(furious) I've just been gone for a couple of days, and everyone thinks they can do what they damn well please.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_03");	//What the hell is going on here?
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_04");	//The palisade still isn't finished? The canyon is overrun with beasts, and everybody is just hanging around, enjoying themselves.
	GREGISBACK = TRUE;
	if(MIS_KROKOJAGD == LOG_RUNNING)
	{
		MIS_KROKOJAGD = LOG_FAILED;
	};
	if(!Npc_IsDead(francis))
	{
		AI_TurnToNPC(self,francis);
		AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_05");	//(loudly) So this is all you've accomplished, Francis?
		if(c_bodystatecontains(francis,BS_SIT))
		{
			AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_06");	//(loudly) Get off of my bench at once!
		};
	};
	Npc_ExchangeRoutine(self,"HOME");
	AI_TurnToNPC(self,other);
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_01_07");	//And YOU? What have YOU done?
	Info_ClearChoices(dia_addon_greg_imnew);
	Info_AddChoice(dia_addon_greg_imnew,"Not much so far.",dia_addon_greg_imnew_nich);
	if((Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0)) || (c_towerbanditsdead() == TRUE))
	{
		Info_AddChoice(dia_addon_greg_imnew,"I've been working.",dia_addon_greg_imnew_turm);
	};
};

func void b_userakebilanz()
{
	if(((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE)) || (MIS_ADDON_GREG_RAKECAVE == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_00");	//And don't think I've forgotten that you still owe me a thing or two.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_01");	//That is, things worth several hundred gold coins that I buried all over Khorinis.
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_02");	//You just pocketed them all, didn't you?
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_03");	//I'll have you work off every last bit of it.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_UseRakeBilanz_01_04");	//I'll teach you the true meaning of work.
	};
	if(!Npc_IsDead(francis))
	{
		Npc_ExchangeRoutine(francis,"GREGISBACK");
		AI_StartState(francis,zs_saw,1,"ADW_PIRATECAMP_BEACH_19");
		FRANCIS_AUSGESCHISSEN = TRUE;
	};
	Info_ClearChoices(dia_addon_greg_imnew);
};

func void dia_addon_greg_imnew_nich()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_nich_15_00");	//Not much so far.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_nich_01_01");	//Never mind. I'll find you something suitable, my friend.
	b_userakebilanz();
};

func void dia_addon_greg_imnew_turm()
{
	AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_00");	//I've been working.
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_01");	//Have you? And what?
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_02");	//I've done away with the bandits in the tower.
	};
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1) && (MIS_ADDON_MORGANLURKER != 0))
	{
		AI_Output(other,self,"DIA_Addon_Greg_ImNew_turm_15_03");	//There are no more beasts on the beach to the north.
	};
	AI_Output(self,other,"DIA_Addon_Greg_ImNew_turm_01_04");	//Well. It's a beginning, I guess.
	b_userakebilanz();
};


instance DIA_ADDON_GREG_JOINPIRATES(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_joinpirates_condition;
	information = dia_addon_greg_joinpirates_info;
	permanent = FALSE;
	description = "What is there to do?";
};


func int dia_addon_greg_joinpirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_imnew) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_joinpirates_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_15_00");	//What is there to do?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_01");	//First of all we'll make things hum around here.
	if(Npc_IsDead(morgan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_02");	//Morgan, that lazy pig, gets to saw planks.
	};
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_01_03");	//YOU will take over Morgan's job and clear those beasts out of the damn canyon.
	MIS_ADDON_GREG_CLEARCANYON = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_CLEARCANYON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_CLEARCANYON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg would like me to take over Morgan's job and clear the canyon of beasts.");
	Info_ClearChoices(dia_addon_greg_joinpirates);
	Info_AddChoice(dia_addon_greg_joinpirates,"I guess I'll get going then.",dia_addon_greg_joinpirates_leave);
	if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
	{
		Info_AddChoice(dia_addon_greg_joinpirates,"Am I supposed to do that all by myself?",dia_addon_greg_joinpirates_compadres);
	};
	Info_AddChoice(dia_addon_greg_joinpirates,"What beasts?",dia_addon_greg_joinpirates_clearcanyon);
};

func void dia_addon_greg_joinpirates_leave()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Leave_15_00");	//I guess I'll get going then.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_01");	//One more thing. You're one of us now.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_02");	//So get yourself a decent hunting outfit first.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_03");	//Here's some of our armor for you. I hope it fits.
	CreateInvItems(self,itar_pir_m_addon,1);
	b_giveinvitems(self,other,itar_pir_m_addon,1);
	AI_EquipArmor(hero,itar_pir_m_addon);
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Leave_01_04");	//And don't dawdle - get right to it!
	Info_ClearChoices(dia_addon_greg_joinpirates);
};

func void dia_addon_greg_joinpirates_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_Compadres_15_00");	//Am I supposed to do that all by myself?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_01");	//Just go ahead and grab some of the boys.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_Compadres_01_02");	//Let them earn their pay instead of just gabbing all day.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg says I can take a couple of the boys with me.");
};

func void dia_addon_greg_joinpirates_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Greg_JoinPirates_ClearCanyon_15_00");	//What beasts?
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_01");	//The razors in the canyon are coming closer and closer to our camp.
	AI_Output(self,other,"DIA_Addon_Greg_JoinPirates_ClearCanyon_01_02");	//I won't wait until they eat one of my men who's had a few too many.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"It seems to be all about razors.");
};


instance DIA_ADDON_GREG_ABOUTCANYON(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_aboutcanyon_condition;
	information = dia_addon_greg_aboutcanyon_info;
	permanent = TRUE;
	description = "About that canyon...";
};


func int dia_addon_greg_aboutcanyon_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_greg_aboutcanyon_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_15_00");	//About that canyon...
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_01_01");	//Yeah, what about it?
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
	if(c_allcanyonrazordead() == FALSE)
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,DIALOG_BACK,dia_addon_greg_aboutcanyon_back);
		if((Npc_IsDead(brandon) == FALSE) || (Npc_IsDead(matt) == FALSE))
		{
			Info_AddChoice(dia_addon_greg_aboutcanyon,"Who can help me with that?",dia_addon_greg_aboutcanyon_compadres);
		};
		Info_AddChoice(dia_addon_greg_aboutcanyon,"What beasts am I supposed to kill?",dia_addon_greg_aboutcanyon_job);
	}
	else
	{
		Info_AddChoice(dia_addon_greg_aboutcanyon,"I killed all the razors.",dia_addon_greg_aboutcanyon_razorsdead);
	};
};

func void dia_addon_greg_aboutcanyon_back()
{
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_compadres()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Compadres_15_00");	//Who can help me with that?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_01");	//Take a few of the boys along.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Compadres_01_02");	//They do nothing but loiter about anyway.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_job()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_Job_15_00");	//What beasts am I supposed to kill?
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_Job_01_01");	//Get rid of the razors! The other creatures are harmless.
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};

func void dia_addon_greg_aboutcanyon_razorsdead()
{
	AI_Output(other,self,"DIA_Addon_Greg_AboutCanyon_RazorsDead_15_00");	//I killed all the razors.
	AI_Output(self,other,"DIA_Addon_Greg_AboutCanyon_RazorsDead_01_01");	//Good. You seem to be a useful fellow.
	b_logentry(TOPIC_ADDON_CLEARCANYON,"Greg even seemed to be a bit impressed that I killed all the razors in the canyon.");
	MIS_ADDON_GREG_CLEARCANYON = LOG_SUCCESS;
	b_addon_piratesgohome();
	b_giveplayerxp(XP_ADDON_CLEARCANYON);
	Info_ClearChoices(dia_addon_greg_aboutcanyon);
};


instance DIA_ADDON_GREG_BANDITARMOR(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditarmor_condition;
	information = dia_addon_greg_banditarmor_info;
	permanent = TRUE;
	description = "I need that bandits' armor.";
};


func int dia_addon_greg_banditarmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_00");	//I need that bandits' armor.
	if(MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_01");	//Prove yourself useful first. Then we can talk.
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_02");	//First, kill all the razors in the canyon!
		};
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Greg wants me to help him put some life back into the camp. Afterwards, I can talk to him about the armor.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_03");	//Hey, you're quite something!
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_04");	//Bones was supposed to wear that armor and spy on the bandits.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_05");	//But maybe YOU'RE the better man for the job.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_06");	//Perhaps you even stand a chance of coming out of there alive.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_07");	//Talk to Bones and let him give you the armor. Then put it on and go to the bandits' camp.
		AI_Output(self,other,"DIA_Addon_Greg_BanditArmor_01_08");	//I need to know why those scumbags came to our valley in the first place.
		AI_Output(other,self,"DIA_Addon_Greg_BanditArmor_15_09");	//Aye aye, Captain!
		b_logentry(TOPIC_ADDON_BDTRUESTUNG,"After I finish off the Razors in the camp for Greg, I can get the armor from Bones.");
		Log_CreateTopic(TOPIC_ADDON_SCOUTBANDITS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_SCOUTBANDITS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,"I'm supposed to find out for Greg why the bandits came to this valley in the first place.");
		MIS_GREG_SCOUTBANDITS = LOG_RUNNING;
	};
};


instance DIA_ADDON_GREG_AUFTRAEGE2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_auftraege2_condition;
	information = dia_addon_greg_auftraege2_info;
	description = "Have you got anything else for me to do?";
};


func int dia_addon_greg_auftraege2_condition()
{
	if((MIS_GREG_SCOUTBANDITS != 0) && ((c_towerbanditsdead() == FALSE) || ((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))))
	{
		return TRUE;
	};
};

func void dia_addon_greg_auftraege2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Auftraege2_15_00");	//Have you got anything else for me to do?
	if((Npc_IsDead(beachlurker1) == FALSE) && (Npc_IsDead(beachlurker2) == FALSE) && (Npc_IsDead(beachlurker3) == FALSE) && (Npc_IsDead(beachwaran1) == FALSE) && (Npc_IsDead(beachwaran2) == FALSE) && (Npc_IsDead(beachshadowbeast1) == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_01");	//The beach to the north is still teeming with beasts.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_02");	//Looks like Morgan hasn't done a thing.
		Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Greg wants me to take care of the beach. It is full of beasts and needs to be cleaned up.");
		MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	};
	if(c_towerbanditsdead() == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_03");	//There are still bandits in the southern tower on the cliff.
		AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_04");	//Francis should have dealt with them.
		Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"Greg wants me to drive the bandits out of the tower south of the camp.");
		MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
	};
	AI_Output(self,other,"DIA_Addon_Greg_Auftraege2_01_05");	//You can handle that as well if you like.
};


instance DIA_ADDON_GREG_SAUBER2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_sauber2_condition;
	information = dia_addon_greg_sauber2_info;
	description = "The northern beach is cleared.";
};


func int dia_addon_greg_sauber2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && Npc_IsDead(beachshadowbeast1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_sauber2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Sauber2_15_00");	//The northern beach is cleared.
	AI_Output(self,other,"DIA_Addon_Greg_Sauber2_01_01");	//Great. Here's your reward.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"I have reported to Greg that the beach in the north is clean.");
	MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
};


instance DIA_ADDON_GREG_BANDITPLATT2(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditplatt2_condition;
	information = dia_addon_greg_banditplatt2_info;
	description = "The bandits in the tower have been dealt with.";
};


func int dia_addon_greg_banditplatt2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_auftraege2) && (c_towerbanditsdead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditplatt2_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditPlatt2_15_00");	//The bandits in the tower have been dealt with.
	AI_Output(self,other,"DIA_Addon_Greg_BanditPlatt2_01_01");	//Excellent. Good work. Here's your reward.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"The bandits in the tower are dead. Greg was very pleased with me.");
	MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
};


instance DIA_ADDON_GREG_BANDITGOLDMINE(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_banditgoldmine_condition;
	information = dia_addon_greg_banditgoldmine_info;
	permanent = TRUE;
	description = "The bandits have found a gold mine.";
};


func int dia_addon_greg_banditgoldmine_condition()
{
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (MIS_GREG_SCOUTBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_greg_banditgoldmine_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_BanditGoldmine_15_00");	//The bandits have found a gold mine.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_01");	//I knew it! THAT'S why they came here.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_02");	//Nobody would volunteer to live in this monster-ridden bog.
	AI_Output(self,other,"DIA_Addon_Greg_BanditGoldmine_01_03");	//Good work. Here, I've got something for you.
	b_giveinvitems(self,other,itri_addon_str_01,1);
	b_logentry(TOPIC_ADDON_SCOUTBANDITS,"I have informed Greg about the gold mine.");
	MIS_GREG_SCOUTBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_GREG_SCOUTBANDITS);
};


instance DIA_ADDON_GREG_WHOAREYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_whoareyou_condition;
	information = dia_addon_greg_whoareyou_info;
	permanent = FALSE;
	description = "Who are you?";
};


func int dia_addon_greg_whoareyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == FALSE) && (SC_MEETSGREGTIME == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_whoareyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_WhoAreYou_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_01");	//I'm Greg, the leader of this lazy bunch.
	AI_Output(self,other,"DIA_Addon_Greg_WhoAreYou_01_02");	//Is that enough for you?
};


instance DIA_ADDON_GREG_NICETOSEEYOU(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 5;
	condition = dia_addon_greg_nicetoseeyou_condition;
	information = dia_addon_greg_nicetoseeyou_info;
	permanent = FALSE;
	description = "So how did you get here?";
};


func int dia_addon_greg_nicetoseeyou_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nicetoseeyou_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NiceToSeeYou_15_00");	//So how did you get here?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_01");	//You weren't expecting me, huh?
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_02");	//Just so we set this straight. I'm Greg, and this here is my camp.
	AI_Output(self,other,"DIA_Addon_Greg_NiceToSeeYou_01_03");	//That enough for you?
};


instance DIA_ADDON_GREG_STORY(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 99;
	condition = dia_addon_greg_story_condition;
	information = dia_addon_greg_story_info;
	permanent = TRUE;
	description = "There's one more thing I'd like to know.";
};


func int dia_addon_greg_story_condition()
{
	if(((Npc_KnowsInfo(other,dia_addon_greg_whoareyou) == TRUE) || (Npc_KnowsInfo(other,dia_addon_greg_nicetoseeyou) == TRUE)) && (MIS_GREG_SCOUTBANDITS != 0))
	{
		return TRUE;
	};
};

func void dia_addon_greg_story_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_15_00");	//There's one more thing I'd like to know.
	AI_Output(self,other,"DIA_Addon_Greg_Story_01_01");	//And that is?
	Info_ClearChoices(dia_addon_greg_story);
	Info_AddChoice(dia_addon_greg_story,DIALOG_BACK,dia_addon_greg_story_back);
	Info_AddChoice(dia_addon_greg_story,"How did you get here?",dia_addon_greg_story_way);
	Info_AddChoice(dia_addon_greg_story,"Where's your ship?",dia_addon_greg_story_ship);
	if(RAVENISDEAD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_story,"What do you know about Raven?",dia_addon_greg_story_raven);
	};
};

func void dia_addon_greg_story_back()
{
	Info_ClearChoices(dia_addon_greg_story);
};

func void dia_addon_greg_story_way()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Way_15_00");	//How did you get here?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_01");	//I found a tunnel near the old pyramid, guarded by a few mages.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_02");	//I simply sneaked past those blindworms.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_03");	//First I took it for an ancient burial chamber and decided to check out what I could find there.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_04");	//Imagine my surprise when I suddenly found myself in my beloved valley.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Way_01_05");	//Just when I thought I would have to spend the rest of my life running away from the militia.
};

func void dia_addon_greg_story_ship()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_00");	//Where's your ship?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_01");	//This is just my luck. For months, no ships have sailed between here and the mainland.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_02");	//For months! And the first ship I run into happens to be a fully manned warship, belonging to the King.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_03");	//Full of paladins, from her keel to the top of her mast.
	AI_Output(other,self,"DIA_Addon_Greg_Story_Ship_15_04");	//That's what I call bad luck.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Ship_01_05");	//You can say that again. They sank us right away. I'm the only one who made it to shore.
};

func void dia_addon_greg_story_raven()
{
	AI_Output(other,self,"DIA_Addon_Greg_Story_Raven_15_00");	//What do you know about Raven?
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_01");	//He used to be an ore baron as far as I know. Quite a big shot in the colony.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_02");	//I haven't a clue why he's here now and why people are following him.
	AI_Output(self,other,"DIA_Addon_Greg_Story_Raven_01_03");	//But he's certainly up to something. He's not the kind who would hide out in a swamp.
};


instance DIA_ADDON_GREG_RAVENDEAD(C_INFO)
{
	npc = pir_1320_addon_greg;
	nr = 2;
	condition = dia_addon_greg_ravendead_condition;
	information = dia_addon_greg_ravendead_info;
	description = "So much for Raven.";
};


func int dia_addon_greg_ravendead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_ravendead_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_RavenDead_15_00");	//So much for Raven.
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_01");	//Well, I'll be... That's unexpected. Caught him with his pants down, did you?
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_02");	//That's certainly worth 500 gold pieces to me.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Greg_RavenDead_01_03");	//You're quite the daredevil. Carry on like that.
	b_giveplayerxp(XP_ADDON_GREGRAVENLOHN);
};

