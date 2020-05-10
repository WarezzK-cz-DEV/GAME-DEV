
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//Hey, I haven't got time to chat with you. Talk to Kardif if you want information.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//Man, just leave me alone, okay?
		AI_StopProcessInfos(self);
	};
};


var int nagurhack;

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//And don't think I don't recognize you just because you're wearing different togs!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(conspiratorially) You're about to stick your nose into things that are none of your business!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//Get lost!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	NAGURHACK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "Kardif says you may have a job for me.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//Kardif says you may have a job for me.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//There ARE no jobs for monastery folk down here at the harbor! (laughs)
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//There ARE no jobs for the King's soldiers down here at the harbor.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(appraising) Well, well, so you're looking for a special job. Okay, but we play by my rules, understood?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//What does that mean?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//That means you do what I say and you get a third of the profits.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//If you don't like it, then there's no job.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"We're business partners, so it's fifty-fifty. ",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"All right, you're the boss.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//All right, you're the boss.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//Good, then let me know when you're ready to rake in a heap of gold.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//We're business partners, so it's fifty-fifty.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//Okay, I thought I'd give it a shot. Of course we'll split our profits fairly.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "All right, what's your plan?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job) && (MIS_NAGUR_BOTE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//All right, what's your plan?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//You know the merchant Baltram, don't you? If not, it's time you talked to him.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//This Baltram has a messenger who supplies him with goods from Akil's farm.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//That is, he HAD a messenger, until I cut his throat. And now Baltram has to get a new one. And that will be you.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//Your job is to get hired by Baltram and fetch the delivery from Akil.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//You bring it to me and then I'll sell it to an interested customer. He'll fork over a tidy little sum for it.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//And just don't try selling the stuff yourself. Have you got all that?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"Well then, I'm all set (END)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"Where can I find Baltram?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"When should I talk to Baltram?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"Where is Akil's farm?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"How much will the profit be?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//Where is Akil's farm?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//Leave the city by the east gate, that's directly on the marketplace.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//If you follow the road to the right, you'll soon come to a few steps cut into the rock.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//Go up there and you'll come to Akil's farm.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//How high will the profit be?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//I can't say exactly. But I estimate about 400 gold pieces.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//Where can I find Baltram?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//He has his stand in the marketplace.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//When should I talk to Baltram?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//You can go right away. He should know by now that his messenger won't show up any more. (dirty laugh)
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//Well then, I'm all set.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//Good, then get on your way - but if you try to cheat me, you'll soon be every bit as dead as the messenger! Don't forget it!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"I must get Baltram to take me on as his new errand-boy. Then I must collect the delivery from farmer Akil and bring it to Nagur.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "I brought the package.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//I brought the package.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//Well done. I'll see to it that I sell it. Come back tomorrow.
	b_logentry(TOPIC_NAGUR,"Nagur has got the delivery. He'll pay me my gold tomorrow.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "Did you sell the wares, then?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//Did you sell the wares, then?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//Yeah, but for less than I thought. I only got 300 gold pieces.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//Part of that goes to my employers...
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//And Kardif gets his usual percentage - plus the gold for your commission.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//Which leaves a total of 240 gold pieces. We'll split those as agreed. Here's your part.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//You did good work. I've passed that on to my employers.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//What comes of that is out of my hands.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//No, not yet. These things take their time. I want to get a good price, after all.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "Who are your employers?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//Who are your employers?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//You don't really think I'd tell you that, do you?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE) && (NAGURHACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//The job went well, but I don't talk about my employers. So stay cool.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//You betrayed me! That was a big mistake - now piss off!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(Show thieves' signal)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//So you did it. Now you know who my employers are.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//Stick to what Cassia tells you - we don't care who you are otherwise - you're one of us, and that's all that counts.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//Look for someone else, there's enough people running around. I don't have anything else for you.
	AI_StopProcessInfos(self);
};

