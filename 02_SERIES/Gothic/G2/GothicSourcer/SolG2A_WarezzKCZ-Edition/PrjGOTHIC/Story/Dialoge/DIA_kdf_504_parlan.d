
instance DIA_PARLAN_KAP1_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap1_exit_condition;
	information = dia_parlan_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_parlan_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


var int parlan_hammer;

func void b_parlan_hammer()
{
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_00");	//(severely) Wait a moment, my son.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_01");	//Rumor has it that a valuable artifact has 'disappeared' from the sanctuary.
	AI_Output(self,other,"DIA_Parlan_HAMMER_05_02");	//I do not even want to know more about it - I expect that it will return to its place.
	PARLAN_HAMMER = TRUE;
};


var int parlan_lastpetzcounter;
var int parlan_lastpetzcrime;

instance DIA_PARLAN_PMSCHULDEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_pmschulden_condition;
	information = dia_parlan_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PARLAN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= PARLAN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_parlan_pmschulden_info()
{
	var int diff;
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	AI_Output(self,other,"DIA_Parlan_PMSchulden_05_00");	//You have violated the rules of our community.
	if(b_gettotalpetzcounter(self) > PARLAN_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_01");	//And although you were already accused, you have laden more guilt upon yourself.
		if(PARLAN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_02");	//Your guilt can only be purged by a larger donation to the monastery.
			AI_Output(other,self,"DIA_Parlan_PMAdd_15_00");	//How much?
			diff = b_gettotalpetzcounter(self) - PARLAN_LASTPETZCOUNTER;
			if(diff > 0)
			{
				PARLAN_SCHULDEN = PARLAN_SCHULDEN + (diff * 50);
			};
			if(PARLAN_SCHULDEN > 1000)
			{
				PARLAN_SCHULDEN = 1000;
			};
			b_say_gold(self,other,PARLAN_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_03");	//Who do you think you are? Pray to Innos for forgiveness for your deeds!
		};
	}
	else if(b_getgreatestpetzcrime(self) < PARLAN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_04");	//Your situation has changed.
		if(PARLAN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_05");	//There are no more witnesses for your murder!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_THEFT) || ((PARLAN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_06");	//No one will testify now that you have stolen!
		};
		if((PARLAN_LASTPETZCRIME == CRIME_ATTACK) || ((PARLAN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_07");	//There are no more accusers who will testify to your brawling!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_08");	//All of the accusations against you have been dropped!
		};
		AI_Output(self,other,"DIA_Parlan_PMSchulden_05_09");	//Perhaps you can fool me - but Innos knows your deeds!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_10");	//Your sins are now forgiven.
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_11");	//Take care that it stays that way!
			PARLAN_SCHULDEN = 0;
			PARLAN_LASTPETZCOUNTER = 0;
			PARLAN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_12");	//You will pay your penalty - as is the will of Innos!
			b_say_gold(self,other,PARLAN_SCHULDEN);
			AI_Output(self,other,"DIA_Parlan_PMSchulden_05_13");	//Free yourself of your guilt!
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_parlan_pmschulden);
		Info_ClearChoices(dia_parlan_petzmaster);
		Info_AddChoice(dia_parlan_pmschulden,"I haven't got enough gold!",dia_parlan_petzmaster_paylater);
		Info_AddChoice(dia_parlan_pmschulden,"How much was that again?",dia_parlan_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
		{
			Info_AddChoice(dia_parlan_pmschulden,"I want to pay the penalty!",dia_parlan_petzmaster_paynow);
		};
	};
};

func void dia_parlan_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Parlan_PMSchulden_HowMuchAgain_15_00");	//How much was that again?
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_pmschulden,"I haven't got enough gold!",dia_parlan_petzmaster_paylater);
	Info_AddChoice(dia_parlan_pmschulden,"How much was that again?",dia_parlan_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_pmschulden,"I want to pay the penalty!",dia_parlan_petzmaster_paynow);
	};
};


instance DIA_PARLAN_PETZMASTER(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_petzmaster_condition;
	information = dia_parlan_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > PARLAN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_parlan_petzmaster_info()
{
	if((PARLAN_HAMMER == FALSE) && (HAMMER_TAKEN == TRUE) && (other.guild == GIL_NOV) && (Npc_IsDead(garwig) == FALSE))
	{
		b_parlan_hammer();
	};
	PARLAN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_00");	//We have not yet spoken with one another, and already you have incurred a burden of guilt!
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_01");	//You are guilty of the worst of all crimes! Murder!
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		PARLAN_SCHULDEN = PARLAN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_02");	//And you have burdened yourself with even more guilt!
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_03");	//If it were up to me, you would be condemned on the spot, you murderer!
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_04");	//If you pay the penalty for your crime, however, I will absolve you of your guilt.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_05");	//Theft is a violation of the rules of the monastery!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_06");	//Apart from that, you have also broken other rules.
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_07");	//These transgressions must be punished. Thus is the law of Innos.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_08");	//You will pay an appropriate penalty to the monastery.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_09");	//We do not tolerate brawling in the monastery. Such behavior violates our rules.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_10");	//And why are you killing our sheep?
		};
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_11");	//We live here according to rules. And they also apply to you.
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_12");	//For your crime, you will make a donation to the monastery.
		PARLAN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Parlan_PETZMASTER_05_13");	//You have killed our sheep. You will pay compensation for that!
		PARLAN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_15_14");	//How much?
	if(PARLAN_SCHULDEN > 1000)
	{
		PARLAN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,PARLAN_SCHULDEN);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	Info_AddChoice(dia_parlan_petzmaster,"I haven't got enough gold!",dia_parlan_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= PARLAN_SCHULDEN)
	{
		Info_AddChoice(dia_parlan_petzmaster,"I want to pay the penalty!",dia_parlan_petzmaster_paynow);
	};
};

func void dia_parlan_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayNow_15_00");	//I want to pay the penalty!
	b_giveinvitems(other,self,itmi_gold,PARLAN_SCHULDEN);
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayNow_05_01");	//I accept your donation. Your transgressions are forgiven. May Innos give you the wisdom not to make the same mistakes again.
	b_grantabsolution(LOC_MONASTERY);
	PARLAN_SCHULDEN = 0;
	PARLAN_LASTPETZCOUNTER = 0;
	PARLAN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
};

func void dia_parlan_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Parlan_PETZMASTER_PayLater_15_00");	//I haven't got enough gold!
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_01");	//You could have thought of that before you committed those transgressions.
	AI_Output(self,other,"DIA_Parlan_PETZMASTER_PayLater_05_02");	//Perhaps you have learned from this. Cause no more trouble, then you will not have to pay.
	PARLAN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	PARLAN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	Info_ClearChoices(dia_parlan_pmschulden);
	Info_ClearChoices(dia_parlan_petzmaster);
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_WELCOME(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 1;
	condition = dia_parlan_welcome_condition;
	information = dia_parlan_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_welcome_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void b_dia_parlan_welcome_gofortribute()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//When you have done that, we shall speak about your work here in the monastery.
};

func void b_dia_parlan_welcome_bringtribute2gorax()
{
	AI_Output(self,other,"DIA_Addon_Parlan_WELCOME_05_00");	//Take your tribute to Gorax at the monastery at once. He will handle it further.
};

func void dia_parlan_welcome_info()
{
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_00");	//Welcome, new novice, I am Parlan.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_01");	//I am...
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_02");	//(interrupts)... a NOVICE. It is not important who you were before. Now you are a servant of Innos. That is all that matters.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_03");	//And with the acceptance into the Brotherhood of Fire, all of your previous transgressions will be forgiven.
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_04");	//May Innos bless this man, who places his life in his service, and wash away his sins.
	AI_Output(other,self,"DIA_Parlan_WELCOME_15_05");	//And now?
	AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//First you will fulfill the duties of a novice. You will work and serve the Brotherhood.
	b_grantabsolution(LOC_ALL);
	Snd_Play("LEVELUP");
	Log_CreateTopic(TOPIC_GEMEINSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEMEINSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_GEMEINSCHAFT,"It is my duty as a novice to perform tasks to serve the community.");
	if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == FALSE)
	{
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//But take your sheep to Opolos first, he will take care of it.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//You can give your gold to Gorax, our steward. You will find him in the winery.
			b_dia_parlan_welcome_gofortribute();
		};
	}
	else if(DIA_GORAX_GOLD_PERM == FALSE)
	{
		b_dia_parlan_welcome_bringtribute2gorax();
		b_dia_parlan_welcome_gofortribute();
	};
};


instance DIA_PARLAN_AUGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_auge_condition;
	information = dia_parlan_auge_info;
	permanent = FALSE;
	description = "I'm looking for the Eye of Innos.";
};


func int dia_parlan_auge_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_parlan_auge_info()
{
	AI_Output(other,self,"DIA_Parlan_Auge_15_00");	//I'm looking for the Eye of Innos.
	AI_Output(self,other,"DIA_Parlan_Auge_05_01");	//I don't know who told you about that - but the divine artifact is not accessible to anyone.
	AI_Output(other,self,"DIA_Parlan_Auge_15_02");	//Where is the Eye of Innos kept?
	AI_Output(self,other,"DIA_Parlan_Auge_05_03");	//The fewer people know this secret, the better it is protected. Seek for it - and you will not find it.
};


instance DIA_PARLAN_AMULETT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_amulett_condition;
	information = dia_parlan_amulett_info;
	permanent = FALSE;
	description = "Tell me about the Eye of Innos.";
};


func int dia_parlan_amulett_condition()
{
	if((KAPITEL <= 2) && Npc_KnowsInfo(other,dia_parlan_auge))
	{
		return TRUE;
	};
};

func void dia_parlan_amulett_info()
{
	AI_Output(other,self,"DIA_Parlan_Amulett_15_00");	//Tell me about the Eye of Innos.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_01");	//All right. The Eye of Innos contains a part of the divine power of Innos. Only ONE chosen servant of Innos is permitted to bear the amulet.
	AI_Output(self,other,"DIA_Parlan_Amulett_05_02");	//It was created to protect us from the powers of Evil when the time has come.
};


instance DIA_PARLAN_HAGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_hagen_condition;
	information = dia_parlan_hagen_info;
	permanent = FALSE;
	description = "I need to talk to the leader of the paladins!";
};


func int dia_parlan_hagen_condition()
{
	if((KAPITEL <= 2) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_hagen_info()
{
	AI_Output(other,self,"DIA_Parlan_Hagen_15_00");	//I need to talk to the leader of the paladins!
	AI_Output(self,other,"DIA_Parlan_Hagen_05_01");	//Lord Hagen does not receive novices - only we magicians are permitted to see him.
};


instance DIA_PARLAN_WORK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_work_condition;
	information = dia_parlan_work_info;
	permanent = TRUE;
	description = "How can I serve the community?";
};


var int dia_parlan_work_perm;

func int dia_parlan_work_condition()
{
	if((KAPITEL == 1) && (Npc_KnowsInfo(other,dia_parlan_knowsjudge) == FALSE) && Npc_KnowsInfo(other,dia_parlan_welcome) && (DIA_PARLAN_WORK_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_work_info()
{
	AI_Output(other,self,"DIA_Parlan_WORK_15_00");	//How can I serve the community?
	if((LIESEL_GIVEAWAY == FALSE) || (DIA_GORAX_GOLD_PERM == FALSE))
	{
		AI_Output(self,other,"DIA_Parlan_WELCOME_05_06");	//First you will fulfill the duties of a novice. You will work and serve the Brotherhood.
		if(LIESEL_GIVEAWAY == FALSE)
		{
			AI_Output(self,other,"DIA_Parlan_WELCOME_05_07");	//But take your sheep to Opolos first, he will take care of it.
		};
		if(DIA_GORAX_GOLD_PERM == FALSE)
		{
			if(PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON == TRUE)
			{
				b_dia_parlan_welcome_bringtribute2gorax();
				b_dia_parlan_welcome_gofortribute();
			}
			else
			{
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_08");	//You can give your gold to Gorax, our steward. You will find him in the winery.
				AI_Output(self,other,"DIA_Parlan_WELCOME_05_09");	//When you have done that, we shall speak about your work here in the monastery.
			};
		};
		AI_StopProcessInfos(self);
	}
	else if(Wld_IsTime(22,0,7,30))
	{
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_01");	//It is the time of peace. The work of the novices begins in the morning and continues until darkness.
		AI_Output(self,other,"DIA_Parlan_WORK_NIGHT_05_02");	//You should sleep, too. Come again when the time of work begins.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_WORK_05_03");	//Speak to the other magicians. They will give you tasks.
		AI_Output(self,other,"DIA_Parlan_WORK_05_04");	//I will oversee your work, and when you have fulfilled your duties adequately, you will receive permission to enter the library to study the word of Innos.
		DIA_PARLAN_WORK_PERM = TRUE;
		MIS_KLOSTERARBEIT = LOG_RUNNING;
		b_logentry(TOPIC_GEMEINSCHAFT,"If I complete the tasks for the mages, I will be granted permission to study in the library.");
	};
};


instance DIA_PARLAN_STAND(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_stand_condition;
	information = dia_parlan_stand_info;
	permanent = TRUE;
	description = "Can I have access to the library?";
};


func int dia_parlan_stand_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_stand_info()
{
	KLOSTER_PUNKTE = 0;
	AI_Output(other,self,"DIA_Parlan_Stand_15_00");	//Can I have access to the library?
	if(MIS_NEORASPFLANZEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_01");	//You have obtained fire nettles for Brother Neoras.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_02");	//You have found Brother Neoras' recipe.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 2;
	};
	if(MIS_ISGAROTHWOLF == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_03");	//You have vanquished the black wolf which threatened the shrine.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	};
	if(MIS_PARLANFEGEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_04");	//You have succeeded in finding four novices and thus cleaned the chambers.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 3;
	};
	if(MIS_GORAXESSEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_05");	//You have distributed the food to the novices fairly, as Brother Gorax instructed you.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXESSEN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_06");	//Gorax was not satisfied with you, because you did not hand out the food fairly.
	};
	if(MIS_GORAXWEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_07");	//You have sold the wine to Gorax's satisfaction.
		KLOSTER_PUNKTE = KLOSTER_PUNKTE + 1;
	}
	else if(MIS_GORAXWEIN == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_08");	//The less said about the matter with the wine, the better...
	};
	if(KLOSTER_PUNKTE >= 8)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_09");	//Yes, you have worked enough. Now it is time for you to study the teachings of Innos. Speak to Master Hyglas in the library.
		AI_Output(self,other,"DIA_Parlan_Stand_05_10");	//I hereby give you the key.
		PARLAN_ERLAUBNIS = TRUE;
		MIS_KLOSTERARBEIT = LOG_SUCCESS;
		Wld_AssignRoomToGuild("Kloster02",GIL_PUBLIC);
		b_giveinvitems(self,other,itke_klosterbibliothek,1);
		if(MIS_NEORASPFLANZEN == LOG_RUNNING)
		{
			MIS_NEORASPFLANZEN = LOG_OBSOLETE;
		};
		if(MIS_NEORASREZEPT == LOG_RUNNING)
		{
			MIS_NEORASREZEPT = LOG_OBSOLETE;
		};
		if(MIS_ISGAROTHWOLF == LOG_RUNNING)
		{
			MIS_ISGAROTHWOLF = LOG_OBSOLETE;
		};
		if(MIS_PARLANFEGEN == LOG_RUNNING)
		{
			MIS_PARLANFEGEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXESSEN == LOG_RUNNING)
		{
			MIS_GORAXESSEN = LOG_OBSOLETE;
		};
		if(MIS_GORAXWEIN == LOG_RUNNING)
		{
			MIS_GORAXWEIN = LOG_OBSOLETE;
		};
		if(MIS_MARDUKBETEN == LOG_RUNNING)
		{
			MIS_MARDUKBETEN = LOG_OBSOLETE;
		};
		b_checklog();
	}
	else if(KLOSTER_PUNKTE >= 1)
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_11");	//You have certainly worked, but it is your duty to continue serving the community.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Stand_05_12");	//First fulfill your duties in service to the community. When you're done working, we shall speak about this again.
	};
};


instance DIA_PARLAN_AUFGABE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_aufgabe_condition;
	information = dia_parlan_aufgabe_info;
	permanent = FALSE;
	description = "Do you have an assignment for me?";
};


func int dia_parlan_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parlan_aufgabe_info()
{
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_00");	//Do you have an assignment for me?
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_01");	//Hmm... Yes, there is indeed something you can do for the community.
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_02");	//The novices' chambers could do with a good sweeping. Take care of that.
	AI_Output(other,self,"DIA_Parlan_Aufgabe_15_03");	//But that will take forever...
	AI_Output(self,other,"DIA_Parlan_Aufgabe_05_04");	//Then you had better start right away, hadn't you?
	MIS_PARLANFEGEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PARLANFEGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PARLANFEGEN,LOG_RUNNING);
	b_logentry(TOPIC_PARLANFEGEN,"Master Parlan wants me to sweep the four novices' chambers. That'll take ages.");
};


instance DIA_PARLAN_FEGEN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_fegen_condition;
	information = dia_parlan_fegen_info;
	permanent = TRUE;
	description = "About the novices' chambers...";
};


var int dia_parlan_fegen_permanent;

func int dia_parlan_fegen_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && (DIA_PARLAN_FEGEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_fegen_info()
{
	AI_Output(other,self,"DIA_Parlan_Fegen_15_00");	//About the novices' chambers...
	if(NOV_HELFER >= 4)
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_01");	//You actually managed to find four novices to help you. I think they can now return to their daily work.
		AI_Output(self,other,"DIA_Parlan_Fegen_05_02");	//Well done, novice. You have accomplished the task I set you.
		MIS_PARLANFEGEN = LOG_SUCCESS;
		b_giveplayerxp(XP_PARLANFEGEN);
		DIA_PARLAN_FEGEN_PERMANENT = TRUE;
		b_startotherroutine(feger1,"START");
		b_startotherroutine(feger2,"START");
		b_startotherroutine(feger3,"START");
		b_startotherroutine(babo,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_Fegen_05_03");	//Indisputably - it is not a simple task. But with the help of Innos you will manage.
	};
};


instance DIA_PARLAN_LEARN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_learn_condition;
	information = dia_parlan_learn_info;
	permanent = FALSE;
	description = "How can I learn the art of magic?";
};


func int dia_parlan_learn_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_hagen) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_parlan_learn_info()
{
	AI_Output(other,self,"DIA_Parlan_LEARN_15_00");	//How can I learn the art of magic?
	AI_Output(self,other,"DIA_Parlan_LEARN_05_01");	//You are not here to receive the gift of magic - you are here to serve Innos.
	AI_Output(self,other,"DIA_Parlan_LEARN_05_02");	//But I can show you how to increase your magic power.
	b_logentry(TOPIC_KLOSTERTEACHER,"Master Parlan can help me to improve my magic powers.");
};


instance DIA_PARLAN_KNOWSJUDGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 23;
	condition = dia_parlan_knowsjudge_condition;
	information = dia_parlan_knowsjudge_info;
	permanent = FALSE;
	description = "I want to undergo the Test of Fire.";
};


func int dia_parlan_knowsjudge_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(hero,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_knowsjudge_info()
{
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_00");	//I want to undergo the Test of Fire.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_01");	//What...? Hm...(insistently) Are you really serious?
	AI_Output(other,self,"DIA_Parlan_KNOWSJUDGE_15_02");	//I insist.
	AI_Output(self,other,"DIA_Parlan_KNOWSJUDGE_05_03");	//You are an exceptional novice. All right, if you are serious, then speak to Master Pyrokar.
	b_logentry(TOPIC_FIRECONTEST,"If I want to demand the Test of Fire, I should speak to Master Pyrokar.");
};


instance DIA_PARLAN_TEACH_MANA(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 10;
	condition = dia_parlan_teach_mana_condition;
	information = dia_parlan_teach_mana_info;
	permanent = TRUE;
	description = "I want to increase my magic powers.";
};


func int dia_parlan_teach_mana_condition()
{
	if(((other.guild == GIL_KDF) || (other.guild == GIL_PAL) || ((other.guild == GIL_NOV) && Npc_KnowsInfo(hero,dia_parlan_learn))) && (PARLAN_SENDS == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlan_teach_mana_info()
{
	AI_Output(other,self,"DIA_Parlan_TEACH_MANA_15_00");	//I want to increase my magic powers.
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_00");	//Your magic power has grown. I cannot help you to increase it more.
		AI_Output(self,other,"DIA_Parlan_TEACH_MANA_05_01");	//If you want to learn more, ask Pyrokar.
		PARLAN_SENDS = TRUE;
	};
	Info_ClearChoices(dia_parlan_teach_mana);
};

func void dia_parlan_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_parlan_teach_mana_5);
};

func void dia_parlan_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_parlan_teach_mana);
	Info_AddChoice(dia_parlan_teach_mana,DIALOG_BACK,dia_parlan_teach_mana_back);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_parlan_teach_mana_1);
	Info_AddChoice(dia_parlan_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_parlan_teach_mana_5);
};


instance DIA_PARLAN_MAGE(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 2;
	condition = dia_parlan_mage_condition;
	information = dia_parlan_mage_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_mage_condition()
{
	if((other.guild == GIL_KDF) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_parlan_mage_info()
{
	AI_Output(self,other,"DIA_Parlan_MAGE_05_00");	//You have sworn your oath, Brother. Welcome to our ranks.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_01");	//I will instruct you in the Circles of Magic when you have enough experience.
	AI_Output(self,other,"DIA_Parlan_MAGE_05_02");	//Take this runestone as a token that the power now lies in your hands.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_PARLAN_CIRCLE1(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle1_condition;
	information = dia_parlan_circle1_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me the first Circle of Magic.",b_getlearncosttalent(other,NPC_TALENT_MAGE,1));
};


func int dia_parlan_circle1_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 0))
	{
		return TRUE;
	};
};

func void dia_parlan_circle1_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE1_15_00");	//Teach me the first Circle of Magic.
	if(b_teachmagiccircle(self,other,1))
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_01");	//The first Circle of Magic allows you to use the runes which you have created.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_02");	//You can now learn the formulas of the spells to create your own runes.
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE1_05_03");	//Each of us specializes in an area of magic. So consider well what sort of magic yours shall be.
	};
};


instance DIA_PARLAN_CIRCLE2(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle2_condition;
	information = dia_parlan_circle2_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me the second Circle of Magic.",b_getlearncosttalent(other,NPC_TALENT_MAGE,2));
};


func int dia_parlan_circle2_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1))
	{
		return TRUE;
	};
};

func void dia_parlan_circle2_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE2_15_00");	//Teach me the second Circle of Magic.
	if(KAPITEL >= 2)
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_01");	//Enter now the second Circle and learn to work even more powerful magic.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_02");	//But also remember that you bear a responsibility. Not to me and not to Pyrokar - but to Innos.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_03");	//He shows you the direction - but your deeds form the path.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE2_05_04");	//The time has not yet come.
	};
};


instance DIA_PARLAN_CIRCLE3(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 99;
	condition = dia_parlan_circle3_condition;
	information = dia_parlan_circle3_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me the third Circle of Magic.",b_getlearncosttalent(other,NPC_TALENT_MAGE,3));
};


func int dia_parlan_circle3_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlan_mage) && (other.guild == GIL_KDF) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2))
	{
		return TRUE;
	};
};

func void dia_parlan_circle3_info()
{
	AI_Output(other,self,"DIA_Parlan_TECH_CIRCLE3_15_00");	//Teach me the third Circle of Magic.
	if(KAPITEL >= 3)
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_01");	//Yes, the time has come. Enter now the third Circle of Magic. New spells await you.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_02");	//You will need them, for Evil draws nigh and it can be thwarted only with the power of Innos.
			AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_03");	//I have now taught you all of the Circles that I can pass on. Karas will instruct you in the higher Circles.
			b_logentry(TOPIC_KLOSTERTEACHER,"Brother Parlan has taught me the first three Circles. Brother Karras will help me into the next Circles.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_TECH_CIRCLE3_05_04");	//It is not yet time for you to learn the third Circle.
	};
};


instance DIA_PARLAN_TEACH(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 3;
	condition = dia_parlan_teach_condition;
	information = dia_parlan_teach_info;
	permanent = TRUE;
	description = "Teach me (create runes).";
};


func int dia_parlan_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_parlan_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Parlan_TEACH_15_00");	//Teach me!
	Info_ClearChoices(dia_parlan_teach);
	Info_AddChoice(dia_parlan_teach,DIALOG_BACK,dia_parlan_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTHEAL)),dia_parlan_teach_light_heal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_LIGHT] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_LIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHT)),dia_parlan_teach_light);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_parlan_teach_windfist);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SLEEP] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_SLEEP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SLEEP)),dia_parlan_teach_sleep);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_MEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MEDIUMHEAL)),dia_parlan_teach_mediumheal);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FEAR] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FEAR,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FEAR)),dia_parlan_teach_fear);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_DESTROYUNDEAD)),dia_parlan_teach_destroyundead);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE))
	{
		Info_AddChoice(dia_parlan_teach,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FULLHEAL)),dia_parlan_teach_fullheal);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Parlan_TEACH_05_01");	//I cannot teach you more formulas at the moment.
	};
};

func void dia_parlan_teach_back()
{
	Info_ClearChoices(dia_parlan_teach);
};

func void dia_parlan_teach_light_heal()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTHEAL);
};

func void dia_parlan_teach_light()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHT);
};

func void dia_parlan_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_parlan_teach_sleep()
{
	b_teachplayertalentrunes(self,other,SPL_SLEEP);
};

func void dia_parlan_teach_mediumheal()
{
	b_teachplayertalentrunes(self,other,SPL_MEDIUMHEAL);
};

func void dia_parlan_teach_fear()
{
	b_teachplayertalentrunes(self,other,SPL_FEAR);
};

func void dia_parlan_teach_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_parlan_teach_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};


instance DIA_PARLAN_KAP2_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap2_exit_condition;
	information = dia_parlan_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_parlan_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_parlan_exit()
{
	AI_Output(self,other,"DIA_Parlan_EXIT_05_00");	//May Innos protect you.
};


instance DIA_PARLAN_KAP3_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap3_exit_condition;
	information = dia_parlan_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parlan_kap3_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_IAMPARLAN(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_iamparlan_condition;
	information = dia_parlan_iamparlan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_parlan_iamparlan_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && ((other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_iamparlan_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_00");	//I see that you have decided to fight on our side. I am glad.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_01");	//We can use every man. You should go speak directly to Marduk, he is responsible for you paladins.
	}
	else
	{
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_02");	//I do not know why you were allowed to enter the monastery. I am Parlan, and I am responsible for our novices.
		AI_Output(self,other,"DIA_Parlan_IAmParlan_05_03");	//I do not want you to keep them from their work with stupid questions. Is that clear?
		PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
		Info_ClearChoices(dia_parlan_iamparlan);
		Info_AddChoice(dia_parlan_iamparlan,"I shall do what I please.",dia_parlan_iamparlan_mychoice);
		Info_AddChoice(dia_parlan_iamparlan,"Sure.",dia_parlan_iamparlan_ok);
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		Wld_InsertItem(itke_klosterbibliothek,"NW_MONASTERY_CORRIDOR_02");
	};
};

func void dia_parlan_iamparlan_mychoice()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_MyChoice_15_00");	//I shall do what I please.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_01");	//There must be reasons why you are tolerated here, but there is a limit to everything.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_MyChoice_05_02");	//If you cause trouble, you'll pay for it. So stay away from the novices.
	Info_ClearChoices(dia_parlan_iamparlan);
};

func void dia_parlan_iamparlan_ok()
{
	AI_Output(other,self,"DIA_Parlan_IAmParlan_OK_15_00");	//Sure.
	AI_Output(self,other,"DIA_Parlan_IAmParlan_OK_05_01");	//I certainly hope so.
	Info_ClearChoices(dia_parlan_iamparlan);
};


instance DIA_PARLAN_BIBLIOTHEK(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 40;
	condition = dia_parlan_bibliothek_condition;
	information = dia_parlan_bibliothek_info;
	permanent = FALSE;
	description = "Have you got anything else for me?";
};


func int dia_parlan_bibliothek_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL >= 3) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_parlan_bibliothek_info()
{
	AI_Output(other,self,"DIA_Parlan_Bibliothek_15_00");	//Have you got anything else for me?
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_01");	//Yes. As a member of the library, you are given the key to the library. There you will find Brothers Karas and Hyglas.
	AI_Output(self,other,"DIA_Parlan_Bibliothek_05_02");	//If you like, you can speak with them there.
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Parlan_DontDisturb_05_03");	//But leave my novices alone!
	};
	b_giveinvitems(self,other,itke_klosterbibliothek,1);
};


instance DIA_PARLAN_DONTDISTURB(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_dontdisturb_condition;
	information = dia_parlan_dontdisturb_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_parlan_dontdisturb_condition()
{
	if((PARLAN_DONTTALKTONOVICE == LOG_SUCCESS) && (b_getgreatestpetzcrime(self) == CRIME_NONE) && ((other.guild != GIL_PAL) || (other.guild != GIL_NOV) || (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_parlan_dontdisturb_info()
{
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_00");	//(threatening) I do not like to repeat my self. Leave the novices alone.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_01");	//They are supposed to purify their spirits with physical labor and prepare themselves for life in the monastery.
	AI_Output(self,other,"DIA_Parlan_DontDisturb_05_02");	//(energetic) I will not tolerate further distractions!
	PARLAN_DONTTALKTONOVICE = LOG_RUNNING;
};


instance DIA_PARLAN_KAP3U4U5_PERM(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 39;
	condition = dia_parlan_kap3u4u5_perm_condition;
	information = dia_parlan_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Where can I find...";
};


func int dia_parlan_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_parlan_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Parlan_Kap3_PERM_15_00");	//Where can I find...
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,DIALOG_BACK,dia_parlan_kap3u4u5_perm_back);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... the church?",dia_parlan_kap3u4u5_perm_church);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... the library?",dia_parlan_kap3u4u5_perm_library);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... the chapel?",dia_parlan_kap3u4u5_perm_chapel);
	Info_AddChoice(dia_parlan_kap3u4u5_perm,"... the cellars?",dia_parlan_kap3u4u5_perm_cellar);
};

func void dia_parlan_kap3u4u5_perm_back()
{
	Info_ClearChoices(dia_parlan_kap3u4u5_perm);
};

func void dia_parlan_kap3u4u5_perm_church()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Church_15_00");	//... the church?
	AI_Output(self,other,"DIA_Parlan_Add_05_00");	//Lord Almighty! Has Innos stricken you blind?
	AI_Output(self,other,"DIA_Parlan_Add_05_01");	//(cynically) Where is the church? Oh my, where could it possibly be?
};

func void dia_parlan_kap3u4u5_perm_library()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Library_15_00");	//... the library?
	AI_Output(self,other,"DIA_Parlan_Add_05_02");	//The library is at the end of the colonnade to the left, directly across from the church.
};

func void dia_parlan_kap3u4u5_perm_chapel()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Chapel_15_00");	//... the chapel?
	AI_Output(self,other,"DIA_Parlan_Add_05_03");	//The chapel is the room halfway along the left colonnade. That's where the paladins pray to Innos.
};

func void dia_parlan_kap3u4u5_perm_cellar()
{
	AI_Output(other,self,"DIA_Parlan_Kap3U4U5_PERM_Cellar_15_00");	//... the cellars?
	AI_Output(self,other,"DIA_Parlan_Add_05_04");	//The entrance to the cellars lies halfway along the colonnade on the right.
};


instance DIA_PARLAN_KAP4_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap4_exit_condition;
	information = dia_parlan_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parlan_kap4_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};


instance DIA_PARLAN_KAP5_EXIT(C_INFO)
{
	npc = kdf_504_parlan;
	nr = 999;
	condition = dia_parlan_kap5_exit_condition;
	information = dia_parlan_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlan_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parlan_kap5_exit_info()
{
	if((other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		b_parlan_exit();
	};
	AI_StopProcessInfos(self);
};

