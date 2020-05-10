
instance DIA_ANDRE_EXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_exit_condition;
	information = dia_andre_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_andre_exit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FIRSTEXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_firstexit_condition;
	information = dia_andre_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_andre_firstexit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_andre_firstexit_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(wulfgar,"START");
};


var int andre_steckbrief;

func void b_andre_steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//One of my men told that the bandits are circulating wanted posters with your face on them.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//He also says you denied that at first.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//So what is it all about?
	AI_Output(other,self,"DIA_Andre_Add_15_03");	//I don't know why those guys are looking for me...
	AI_Output(self,other,"DIA_Andre_Add_08_04");	//I hope for your sake that you're telling the truth.
	AI_Output(self,other,"DIA_Andre_Add_08_05");	//I cannot use anyone in the militia who doesn't have a clean record.
	AI_Output(self,other,"DIA_Andre_Add_08_06");	//Most of these bandits are former prisoners from the mining colony.
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//I should hope that you didn't get involved in any way with those cutthroats!
	ANDRE_STECKBRIEF = TRUE;
};


var int andre_cantharfalle;

func void b_andre_cantharfalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//The merchant Canthar was here. He said that you are an escaped convict from the mining colony.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//I don't know whether that's the truth and I prefer not to ask you, but you should clear that matter up.
	b_removenpc(sarah);
	b_startotherroutine(canthar,"MARKTSTAND");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	if((CANTHAR_SPERRE == FALSE) && (CANTHAR_PAY == FALSE))
	{
		CANTHAR_SPERRE = TRUE;
	};
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	ANDRE_CANTHARFALLE = TRUE;
};


instance DIA_ANDRE_CANTHARFALLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_cantharfalle_condition;
	information = dia_andre_cantharfalle_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_cantharfalle_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		return TRUE;
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_cantharfalle_info()
{
	if(ANDRE_STECKBRIEF == FALSE)
	{
		b_andre_steckbrief();
	};
	if((ANDRE_CANTHARFALLE == FALSE) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)))
	{
		b_andre_cantharfalle();
	};
};


var int andre_lastpetzcounter;
var int andre_lastpetzcrime;

instance DIA_ANDRE_PMSCHULDEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_pmschulden_condition;
	information = dia_andre_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (ANDRE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= ANDRE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_andre_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//Have you come to pay your penalty?
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_gettotalpetzcounter(self) > ANDRE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//I had already asked myself if you would even dare to come here!
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//Apparently, the charges against you have multiplied!
		if(ANDRE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//I warned you! The penalty you have to pay now is higher!
			AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//How much?
			diff = b_gettotalpetzcounter(self) - ANDRE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				ANDRE_SCHULDEN = ANDRE_SCHULDEN + (diff * 50);
			};
			if(ANDRE_SCHULDEN > 1000)
			{
				ANDRE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,ANDRE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//You have severely disappointed me!
		};
	}
	else if(b_getgreatestpetzcrime(self) < ANDRE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//Some new things have come up.
		if(ANDRE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//Suddenly there is no one left who accuses you of murder.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_THEFT) || ((ANDRE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//No one any longer remembers having seen you steal.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_ATTACK) || ((ANDRE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//There are no longer any witnesses that you were ever involved in a brawl.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//Apparently all the accusations against you have been cleared up.
		};
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//I don't know how that happened, but I'm warning you: don't play any games with me.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//In any case, I have decided to waive your debts.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//See to it that you don't get into any more trouble.
			ANDRE_SCHULDEN = 0;
			ANDRE_LASTPETZCOUNTER = 0;
			ANDRE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//I want one thing to be clear: you're going to have to pay the full amount of your penalty anyway.
			b_say_gold(self,other,ANDRE_SCHULDEN);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//So, what is it?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_andre_pmschulden);
		Info_ClearChoices(dia_andre_petzmaster);
		Info_AddChoice(dia_andre_pmschulden,"I haven't got enough gold!",dia_andre_petzmaster_paylater);
		Info_AddChoice(dia_andre_pmschulden,"How much was that again?",dia_andre_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
		{
			Info_AddChoice(dia_andre_pmschulden,"I want to pay the penalty!",dia_andre_petzmaster_paynow);
		};
	};
};

func void dia_andre_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//How much was that again?
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_pmschulden,"I haven't got enough gold!",dia_andre_petzmaster_paylater);
	Info_AddChoice(dia_andre_pmschulden,"How much was that again?",dia_andre_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_pmschulden,"I want to pay the penalty!",dia_andre_petzmaster_paynow);
	};
};


instance DIA_ANDRE_PETZMASTER(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_petzmaster_condition;
	information = dia_andre_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > ANDRE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_info()
{
	ANDRE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//You must be the new fellow who has caused trouble here in the city.
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//It is good that you have come to me before everything becomes even worse for you.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//Murder is a serious crime!
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		ANDRE_SCHULDEN = ANDRE_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//To say nothing of the other things you have done.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//The watch have orders to execute every murderer on the spot.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//And most of the citizens will not tolerate a murderer in the city!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//I'm not interested in hanging you. We are at war and we need every man.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//But it will not be easy to make people feel better about you again.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//You could show your remorse by paying a penalty - naturally, it would have to be reasonably high.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//It is good that you have come! You are accused of theft! There are witnesses!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//I will not mention the other things I have heard.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//I will not tolerate such conduct in the city!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//You must pay a penalty in order to atone for your crime.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//It is one thing if you brawl with the rabble in the harbor...
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//But when you attack citizens, or the king's soldiers, I must bring you to justice.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//And that sheep thing wasn't really necessary either.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//If I let you get away with it, soon everyone here will do whatever he wishes.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//So, you will pay an appropriate penalty - and the matter will be forgotten.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//I have heard that you were after our sheep.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//You realize that I cannot let that go.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//You will have to pay compensation!
		ANDRE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//How much?
	if(ANDRE_SCHULDEN > 1000)
	{
		ANDRE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_petzmaster,"I haven't got enough gold!",dia_andre_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_petzmaster,"I want to pay the penalty!",dia_andre_petzmaster_paynow);
	};
};

func void dia_andre_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//I want to pay the penalty!
	b_giveinvitems(other,self,itmi_gold,ANDRE_SCHULDEN);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//Good! I shall see to it that everyone in the city learns of it - that will restore your reputation to some degree.
	b_grantabsolution(LOC_CITY);
	ANDRE_SCHULDEN = 0;
	ANDRE_LASTPETZCOUNTER = 0;
	ANDRE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_andre_petzmaster);
	Info_ClearChoices(dia_andre_pmschulden);
};

func void dia_andre_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//I don't have enough gold.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//Then see to it that you acquire the gold as quickly as possible.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//And I'm warning you: if you add to your guilt, things will get worse for you.
	ANDRE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	ANDRE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HALLO(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_hallo_condition;
	information = dia_andre_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hallo_info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//Innos be with you, stranger! What brings you to me?
};


instance DIA_ANDRE_MESSAGE(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_message_condition;
	information = dia_andre_message_info;
	permanent = FALSE;
	description = "I carry an important message for Lord Hagen.";
};


func int dia_andre_message_condition()
{
	if((KAPITEL < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_andre_message_info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//I've got an important message for Lord Hagen.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//Well, you stand before one of his men. What is this about?
	Info_ClearChoices(dia_andre_message);
	Info_AddChoice(dia_andre_message,"That I must tell Lord Hagen myself.",dia_andre_message_personal);
	Info_AddChoice(dia_andre_message,"The hosts of orcs are led by DRAGONS!",dia_andre_message_dragons);
	Info_AddChoice(dia_andre_message,"It's about a sacred artifact - the Eye of Innos.",dia_andre_message_eyeinnos);
};

func void b_andre_lordhagennichtzusprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//Lord Hagen receives only paladins or those who are in service to the paladins.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//It is beneath his dignity to waste his time with members of the common folk.
};

func void dia_andre_message_eyeinnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//It's about a sacred artifact - the Eye of Innos.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//The Eye of Innos - I have never heard of it. But that doesn't necessarily mean anything.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//If there truly is an artifact of this name, only the highest members of our order would know anything about it, in any case.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//That's why I have to talk to Lord Hagen himself.
	ANDRE_EYEINNOS = TRUE;
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};

func void dia_andre_message_dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//The hosts of orcs are led by DRA-
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(interrupting) I KNOW that the armies of the orcs are growing ever stronger.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//You don't mean to tell me that THAT is what you wish to report to Lord Hagen.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//He would tear your head from your shoulders if you wasted his time with such stories.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//And I am sure that you are clever enough to know that for yourself.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//So, what is this really about?
};

func void dia_andre_message_personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//That I must tell Lord Hagen myself.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//Suit yourself. But you should know one thing:
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};


instance DIA_ANDRE_PALADINE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladine_condition;
	information = dia_andre_paladine_info;
	permanent = FALSE;
	description = "Why are you paladins in town?";
};


func int dia_andre_paladine_condition()
{
	if((other.guild != GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladine_info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//Why are you paladins in town?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//The goals of our mission are secret.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//I can only tell you that there is no danger for the citizens of the town.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//You need not worry.
};


instance DIA_ANDRE_PALADINEAGAIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladineagain_condition;
	information = dia_andre_paladineagain_info;
	permanent = FALSE;
	description = "Why are you paladins in town?";
};


func int dia_andre_paladineagain_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladineagain_info()
{
	if(Npc_KnowsInfo(other,dia_andre_paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//Will you tell me now why you paladins have come to Khorinis?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//Why are you paladins in town?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//Now you belong to the city guard, therefore you are also subordinate to the paladins.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//Now I can take you into confidence.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//We have come on a mission from King Rhobar. With the collapse of the Barrier, the deliveries of ore have failed.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//Therefore, we are getting the ore and bringing it to the mainland. With the ore, we shall forge new weapons and drive the orcs back.
	KNOWSPALADINS_ORE = TRUE;
};


instance DIA_ANDRE_ASKTOJOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_asktojoin_condition;
	information = dia_andre_asktojoin_info;
	permanent = FALSE;
	description = "I want to take up service with the paladins!";
};


func int dia_andre_asktojoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_asktojoin_info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//I want to take up service with the paladins!
	if(Npc_KnowsInfo(other,dia_andre_message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//Good. I can well use every able man here. No matter what his reasons for joining us.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//If you place yourself in the service of the paladins, I shall help you get an audience with Lord Hagen.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//An honorable request.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//However, I have my orders only to accept citizens of the town in the militia.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//My commander is afraid that spies or saboteurs could sneak in.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//He wants to limit the risk this way.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//Therefore, you must first be a citizen of the town - whether this rule makes sense or not is disputable, but orders are orders.
	Log_CreateTopic(TOPIC_BECOMEMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEMIL,LOG_RUNNING);
	b_logentry(TOPIC_BECOMEMIL,"Before I can become a member of the city guard, I must be a citizen of the town.");
};


instance DIA_ANDRE_ABOUTMILIZ(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_andre_aboutmiliz_condition;
	information = dia_andre_aboutmiliz_info;
	permanent = FALSE;
	description = "What should I expect with the militia?";
};


func int dia_andre_aboutmiliz_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//What should I expect with the militia?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//Let me make one thing clear. To be a soldier of the militia means much more than strolling through the city in a uniform.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//It is a dirty and even a bloody job. Once you are one of us, a great deal of work will be waiting for you.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//But it is worth it. Besides the pay, you might someday have the chance of becoming a holy warrior of Innos.
};


instance DIA_ADDON_ANDRE_MARTINEMPFEHLUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_addon_andre_martinempfehlung_condition;
	information = dia_addon_andre_martinempfehlung_info;
	description = "Look, I've got this letter of recommendation from your provisions master.";
};


func int dia_addon_andre_martinempfehlung_condition()
{
	if(Npc_HasItems(other,itwr_martin_milizempfehlung_addon) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_addon_andre_martinempfehlung_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MartinEmpfehlung_15_00");	//Look, I've got this letter of recommendation from your provisions master.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_01");	//(disbelieving) What? Show me.
	b_giveinvitems(other,self,itwr_martin_milizempfehlung_addon,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_02");	//(impressed) Well, I'll be...! This must have cost you quite an effort. It's no easy feat to get something like this out of Martin.
	AI_Output(self,other,"DIA_Addon_Andre_MartinEmpfehlung_08_03");	//All right. I'm convinced. If Martin vouches for you, I shall let you join. Let me know when you're ready.
	ANDRE_KNOWS_MARTINEMPFEHLUNG = TRUE;
};


instance DIA_ANDRE_ALTERNATIVE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_alternative_condition;
	information = dia_andre_alternative_info;
	permanent = FALSE;
	description = "Isn't there a faster way to join you?";
};


func int dia_andre_alternative_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_asktojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_andre_alternative_info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//Isn't there a faster way to join you?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//Mmh (stops short) - you're really serious about this, aren't you?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//Good, listen. I have a problem. If you solve it for me, I shall see to it that you are accepted into the militia.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//But the most important thing is: you must not breathe a word of it to anyone!
};


instance DIA_ANDRE_GUILDOFTHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_guildofthieves_condition;
	information = dia_andre_guildofthieves_info;
	permanent = FALSE;
	description = "What's your problem?";
};


func int dia_andre_guildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_alternative))
	{
		return TRUE;
	};
};

func void dia_andre_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//What's your problem?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//Recently there have been a number of thefts in the city. Thus far, we have not been able to capture anyone, the thieves are simply too skillful.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//The scum know their business. I am sure that we're dealing with an organized gang.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//It would not amaze me if there were a thieves' guild in Khorinis. Find the leaders of the gang and hunt them down.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//Then I shall see to it that you are accepted into the militia - regardless of whether or not you are a citizen.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//But you must say nothing about our agreement!
	};
	MIS_ANDRE_GUILDOFTHIEVES = LOG_RUNNING;
	b_logentry(TOPIC_BECOMEMIL,"There is another way to be accepted into the city guard, and that is to find and eliminate the thieves' guild in Khorinis.");
};


instance DIA_ANDRE_WHERETHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_wherethieves_condition;
	information = dia_andre_wherethieves_info;
	permanent = FALSE;
	description = "Where should I start looking for the thieves?";
};


func int dia_andre_wherethieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_wherethieves_info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//Where should I start looking for the thieves?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//If I knew that, I would go there myself!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//I can only tell you this much: We recently turned the entire harbor district upside-down and found nothing, absolutely nothing.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//The people there are not very talkative, particularly if you wear the armor of a paladin.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//But you are an outsider, they will not distrust you so quickly.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//You could ask around the harbor first. But be careful. If the people there realize that you are working for the paladins, you will learn NOTHING!
	b_logentry(TOPIC_BECOMEMIL,"If I'm going to find the thieves' guild, I'd better start listening around in the harbor district.");
};


instance DIA_ANDRE_WHATTODO(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_whattodo_condition;
	information = dia_andre_whattodo_info;
	permanent = FALSE;
	description = "What should I do once I've found one of the thieves?";
};


func int dia_andre_whattodo_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_whattodo_info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//What should I do once I've found one of the thieves?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//If it is a matter of a lackey, a henchman or some small fry, it would be best if you avoid a fight.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//Come rather to me and report. I shall then see to it that the fellow winds up behind bars.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//The city guard could intervene in an open battle and you would not have the opportunity of explaining to them what is going on.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//Furthermore, there is a bounty for every rotten apple you put behind bars.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//However, if you locate the leaders' hideout - well - then you probably won't be able to avoid a fight.
	b_logentry(TOPIC_BECOMEMIL,"If I catch a henchman of the thieves' guild, I should take him straight to Lord Andre. To eliminate the thieves' guild, I must find their hideout.");
};


instance DIA_ANDRE_AUSLIEFERUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 200;
	condition = dia_andre_auslieferung_condition;
	information = dia_andre_auslieferung_info;
	permanent = TRUE;
	description = "I've come to collect the bounty for a criminal.";
};


func int dia_andre_auslieferung_condition()
{
	if((RENGARU_AUSGELIEFERT == FALSE) || (HALVOR_AUSGELIEFERT == FALSE) || (NAGUR_AUSGELIEFERT == FALSE) || (MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_auslieferung_info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//I've come to collect the bounty for a criminal.
	Info_ClearChoices(dia_andre_auslieferung);
	Info_AddChoice(dia_andre_auslieferung,"I'll come back later (BACK)",dia_andre_auslieferung_back);
	if((RENGARU_INKNAST == TRUE) && (RENGARU_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Rengaru stole from the merchant Jora.",dia_andre_auslieferung_rengaru);
	};
	if((BETRAYAL_HALVOR == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Halvor sells stolen goods.",dia_andre_auslieferung_halvor);
	};
	if(((MIS_NAGUR_BOTE == LOG_RUNNING) || (MIS_NAGUR_BOTE == LOG_FAILED)) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"Nagur has killed Baltram's messenger.",dia_andre_auslieferung_nagur);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Canthar is trying to get rid of Sarah!",dia_andre_auslieferung_canthar);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (Npc_HasItems(sarah,itwr_canthars_komprobrief_mis) >= 1) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"Sarah is selling weapons to Onar.",dia_andre_auslieferung_sarah);
	};
};

func void dia_andre_auslieferung_back()
{
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_rengaru()
{
	AI_Teleport(rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//Rengaru stole from the merchant Jora. He tried to skedaddle, but I caught him.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//Good, my men have already picked him up. He won't be stealing from anyone else in the near future.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//Here is your money.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	RENGARU_AUSGELIEFERT = TRUE;
	MIS_THIEFGUILD_SUCKED = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
	b_startotherroutine(rengaru,"PRISON");
};

func void dia_andre_auslieferung_halvor()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//Halvor is a fence. He sells the goods that the bandits steal from the merchants.
	if(Npc_HasItems(hero,itwr_halvormessage) >= 1)
	{
		AI_PrintScreen("Stinking note given",-1,26,FONT_SCREENBRIGHTLARGE,2);
		Npc_RemoveInvItems(hero,itwr_halvormessage,1);
		b_usefakescroll();
	};
	AI_Teleport(halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//So he's behind it. My men will lock him up at once.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//I don't think he'll create any difficulties. I shall give you your bounty now.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(halvor,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	HALVOR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_nagur()
{
	AI_Teleport(nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//Nagur has killed Baltram's messenger. He tried to use me as his new messenger in order to intercept Akil's shipment.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//That fellow will get his just punishment. I shall have him locked up immediately.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//Here, take the bounty that you are entitled to.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(nagur,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	NAGUR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_canthar()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//Canthar the merchant is trying to get rid of Sarah!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//Sarah? The weapons merchant in the marketplace?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//I was supposed to foist a letter on Sarah which claimed that she's supplying weapons to Onar.
	if(Npc_HasItems(hero,itwr_canthars_komprobrief_mis) >= 1)
	{
		AI_PrintScreen("Canthar's fake letter given",-1,26,FONT_SCREENBRIGHTLARGE,2);
		Npc_RemoveInvItems(hero,itwr_canthars_komprobrief_mis,1);
		b_usefakescroll();
	};
	AI_Teleport(canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//I see. I shall gladly pay the bounty for that bastard. He is already as good as behind bars.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(canthar,"KNAST");
	MIS_CANTHARS_KOMPROBRIEF = LOG_FAILED;
	b_checklog();
	CANTHAR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_sarah()
{
	AI_Teleport(sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//Sarah is selling weapons to Onar.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//Sarah? The weapons merchant in the marketplace? Do you have proof of that?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//She has a letter in her pocket which details the delivery of arms to him.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//She won't get away with that. I shall have her arrested.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(sarah,"KNAST");
	b_startotherroutine(canthar,"MARKTSTAND");
	SARAH_AUSGELIEFERT = TRUE;
	MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};


instance DIA_ANDRE_DGRUNNING(C_INFO)
{
	npc = mil_311_andre;
	nr = 4;
	condition = dia_andre_dgrunning_condition;
	information = dia_andre_dgrunning_info;
	permanent = TRUE;
	description = "About the thieves' guild...";
};


func int dia_andre_dgrunning_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_dgrunning_info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//About the thieves' guild...
	if(ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//You can forget the business. I have sent a few men down into the sewers.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//The thieves' guild is now merely a sad chapter in the history of this city.
		MIS_ANDRE_GUILDOFTHIEVES = LOG_OBSOLETE;
		if(MIS_CASSIARING == LOG_RUNNING)
		{
			MIS_CASSIARING = LOG_OBSOLETE;
		};
		if(MIS_CASSIAKELCHE == LOG_RUNNING)
		{
			MIS_CASSIAKELCHE = LOG_OBSOLETE;
		};
		if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
		{
			MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//Yes?
	Info_ClearChoices(dia_andre_dgrunning);
	Info_AddChoice(dia_andre_dgrunning,"I'm working on it...",dia_andre_dgrunning_back);
	if(Npc_IsDead(cassia) && Npc_IsDead(jesper) && Npc_IsDead(ramirez))
	{
		Info_AddChoice(dia_andre_dgrunning,"I hunted them all down!",dia_andre_dgrunning_success);
	};
	if(((cassia.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (jesper.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (ramirez.aivar[AIV_TALKEDTOPLAYER] == TRUE)) && (DIEBESGILDE_VERRATEN == FALSE))
	{
		Info_AddChoice(dia_andre_dgrunning,"I found the hideout of the thieves' guild!",dia_andre_dgrunning_verrat);
	};
};

func void dia_andre_dgrunning_back()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//I'm working on it...
	if(DIEBESGILDE_VERRATEN == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//All right. I shall give you a bit more time to fulfill your mission.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//Good! Keep me informed.
	};
	Info_ClearChoices(dia_andre_dgrunning);
};

func void dia_andre_dgrunning_verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//I found the hideout of the thieves' guild!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//Where?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//In the sewers below the city.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//What? We have sealed off the sewers...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//It looks like that didn't keep them from spreading out down there.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//Have you hunted down the criminals?
	DIEBESGILDE_VERRATEN = TRUE;
	DG_GEFUNDEN = TRUE;
};

func void dia_andre_dgrunning_success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//I hunted them all down!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//You have done the city a great service.
	DG_GEFUNDEN = TRUE;
	MIS_ANDRE_GUILDOFTHIEVES = LOG_SUCCESS;
	b_giveplayerxp(XP_GUILDOFTHIEVESPLATT);
	if(MIS_CASSIARING == LOG_RUNNING)
	{
		MIS_CASSIARING = LOG_OBSOLETE;
	};
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		MIS_CASSIAKELCHE = LOG_OBSOLETE;
	};
	if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
	{
		MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//If you are still interested in a position with the militia, let me know.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//You have fulfilled your duty, as is proper for a servant of Innos and a soldier of the king.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//You are entitled to the bounty for the bandits. Here, take it.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD * 3);
	Info_ClearChoices(dia_andre_dgrunning);
};


instance DIA_ANDRE_JOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_join_condition;
	information = dia_andre_join_info;
	permanent = TRUE;
	description = "I'm ready to join the militia!";
};


func int dia_andre_join_condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_join_info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//I'm ready to join the militia!
	if(ANDRE_KNOWS_MARTINEMPFEHLUNG == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Andre_JOIN_08_00");	//Martin, the provisions master, vouches for you and has even recommended you. That alone is enough for me.
	}
	else if((MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//I shall keep my part of the agreement and accept you into the militia, even though you are not a citizen of the town.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//But don't tell the whole world about it! The fewer people who learn about this exception, the less I shall have to justify myself afterwards.
	}
	else if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//Then you are a citizen of Khorinis?
		if(PLAYER_ISAPPRENTICE == APP_HARAD)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//The blacksmith has taken me on as an apprentice.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//Harad? I know him. He works for us. He is a good man.
		};
		if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//I am the alchemist's apprentice!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//We don't exactly have a lot of scholars in the militia. Perhaps your abilities could be of great use to us.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//I don't know much about the alchemist. But people say he is an honorable man.
		};
		if(PLAYER_ISAPPRENTICE == APP_BOSPER)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//Bosper the bowmaker has taken me on as his apprentice.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//Then you also know something about living in the wild? That is good, because the militia has assignments not just within the city walls.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//We can certainly use people who know their way around in the wilderness.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//And the bowmaker is an important man in the city.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//If he vouches for you, there is nothing standing in the way of your acceptance into the militia.
		if(MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//Furthermore, you have managed to rid us of the thieves' guild. I would have accepted you for that alone.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//That may be - but you are still not a citizen of this town and I have my orders.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//You can join us if you wish. But your decision will be final.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//Once you wear the armor of the militia, you cannot simply take it off and no longer belong to us.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//Are you prepared to fight together with us for Innos and the king?
	Info_ClearChoices(dia_andre_join);
	Info_AddChoice(dia_andre_join,"I'm not quite sure yet...",dia_andre_join_no);
	Info_AddChoice(dia_andre_join,"I'm ready!",dia_andre_join_yes);
};

func void dia_andre_join_yes()
{
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//I'm ready!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//Then so shall it be. Welcome to the militia.
	Npc_SetTrueGuild(other,GIL_MIL);
	other.guild = GIL_MIL;
	Mdl_ApplyOverlayMds(other,"Humans_Militia.mds");
	Snd_Play("LEVELUP");
	Npc_ExchangeRoutine(lothar,"START");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//Here is your armor.
	b_giveinvitems(self,other,itar_mil_l,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//Wear it with pride and dignity.
	SLD_AUFNAHME = LOG_OBSOLETE;
	KDF_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_SUCCESS;
	b_giveplayerxp(XP_BECOMEMILIZ);
	Info_ClearChoices(dia_andre_join);
};

func void dia_andre_join_no()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//I'm not quite sure yet...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//As long as you still have doubts about your decision, I cannot accept you into the militia.
	Info_ClearChoices(dia_andre_join);
};


instance DIA_ANDRE_LORDHAGEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_lordhagen_condition;
	information = dia_andre_lordhagen_info;
	permanent = FALSE;
	description = "Can I finally see Lord Hagen now?";
};


func int dia_andre_lordhagen_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_lordhagen_info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//Can I finally see Lord Hagen now?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//You are now in the service of the paladins. They will let you in. But you had better have something important to say.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//Don't worry, I do...
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//Remember that you are meeting the chief paladin. Behave yourself accordingly. You represent not only yourself now, but the entire militia.
};


instance DIA_ANDRE_WAFFE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_waffe_condition;
	information = dia_andre_waffe_info;
	permanent = FALSE;
	description = "Will I get a weapon, too?";
};


func int dia_andre_waffe_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_waffe_info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//Will I get a weapon, too?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//Of course. Peck usually takes care of that. But it occurs to me that I haven't seen him for quite a while.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//Find out where he's hiding and bring him here. Then he will give you a weapon.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//And if you want to sleep, you can lie down in one of the beds in the bunkhouse.
	MIS_ANDRE_PECK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PECK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PECK,LOG_RUNNING);
	b_logentry(TOPIC_PECK,"Peck's somewhere in town. If I take him back to the barracks, I can get a weapon from him.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FOUND_PECK(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_peck_condition;
	information = dia_andre_found_peck_info;
	permanent = FALSE;
	description = "I've managed to track down Peck.";
};


func int dia_andre_found_peck_condition()
{
	if(Npc_KnowsInfo(hero,dia_peck_found_peck) && (MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_IsDead(peck) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_found_peck_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//I've managed to track down Peck.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//Yes, he is already back at his post and going about his duty. Where did you find him?
	Info_ClearChoices(dia_andre_found_peck);
	Info_AddChoice(dia_andre_found_peck,"He crossed my path...",dia_andre_found_peck_somewhere);
	Info_AddChoice(dia_andre_found_peck,"In the 'Red Lantern'...",dia_andre_found_peck_redlight);
};

func void dia_andre_found_peck_somewhere()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//He crossed my path in town.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//All right, then go to him and get yourself a weapon.
	MIS_ANDRE_PECK = LOG_OBSOLETE;
	b_giveplayerxp(XP_FOUNDPECK);
	Info_ClearChoices(dia_andre_found_peck);
};

func void dia_andre_found_peck_redlight()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//He was in the 'Red Lantern'.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//So, he's hanging around with the girls instead of doing his duty.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//I believe I shall have a few words with him.
	b_giveplayerxp(XP_FOUNDPECK * 2);
	MIS_ANDRE_PECK = LOG_SUCCESS;
	Info_ClearChoices(dia_andre_found_peck);
};

func void b_andresold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//Here is your pay.
	b_giveinvitems(self,other,itmi_gold,ANDRE_SOLD);
};


instance DIA_ANDRE_FIRSTMISSION(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_firstmission_condition;
	information = dia_andre_firstmission_info;
	permanent = FALSE;
	description = "Do you have an assignment for me?";
};


func int dia_andre_firstmission_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_andre_firstmission_info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//Have you got an assignment for me?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//Lately there has been an increase in the sale of swampweed in the city.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//We cannot allow this stuff to catch on.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//Otherwise, everyone here will start smoking and no longer be able to work, let alone wield a weapon.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//Particularly now that there is the danger of a possible attack by orcs or mercenaries.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//I suspect that the mercenaries are behind it. I bet they are bringing the stuff into the city.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//What is there to do?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//Mortis, one of our men, heard in the harbor pub that a package of swampweed has arrived somewhere in the harbor district.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//Look around down there and bring me the package.
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAREHOUSE,LOG_RUNNING);
	b_logentry(TOPIC_WAREHOUSE,"A package of swampweed has arrived at the harbor. Mortis got wind of it in the pub there. I've got to find that package and take it to Lord Andre.");
};


instance DIA_ANDRE_FOUND_STUFF(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_stuff_condition;
	information = dia_andre_found_stuff_info;
	permanent = TRUE;
	description = "About the package...";
};


func int dia_andre_found_stuff_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_found_stuff_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//About the package...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//Have you found it?
	if((Npc_HasItems(other,itmi_herbpaket) > 0) || (MIS_CIPHER_PAKET == LOG_SUCCESS))
	{
		Info_ClearChoices(dia_andre_found_stuff);
		if(Npc_HasItems(other,itmi_herbpaket) > 0)
		{
			Info_AddChoice(dia_andre_found_stuff,"Yes, here it is.",dia_andre_found_stuff_ja);
		};
		Info_AddChoice(dia_andre_found_stuff,"I threw it into the harbor basin.",dia_andre_found_stuff_becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//Not so far.
	};
};

func void dia_andre_found_stuff_ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//Yes, here it is.
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//Good work. We shall guard the weed securely.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_CIPHER_PAKET = LOG_FAILED;
	b_giveplayerxp(XP_WAREHOUSE_SUPER * 2);
	Info_ClearChoices(dia_andre_found_stuff);
};

func void dia_andre_found_stuff_becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//I threw it into the harbor basin.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//So? Well, the main thing is that it can no longer fall into the wrong hands.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	b_giveplayerxp(XP_WAREHOUSE_SUPER);
	Info_ClearChoices(dia_andre_found_stuff);
};


instance DIA_ANDRE_FIND_DEALER(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_find_dealer_condition;
	information = dia_andre_find_dealer_info;
	permanent = FALSE;
	description = "Have you got another job for me?";
};


func int dia_andre_find_dealer_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(borka) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_find_dealer_info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//Have you got another job for me?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//You have taken the package of swampweed out of circulation - good.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//But I would like to know who is distributing the stuff among the people.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//It must be someone in the harbor district.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//If someone regularly came from outside the city, he would have been caught some time ago.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//What exactly am I to do?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//Find the dealer and get him to sell you some weed. That will not be easy, but we cannot arrest him otherwise.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//Talk to Mortis, he knows the harbor district. Perhaps he can help you.
	MIS_ANDRE_REDLIGHT = LOG_RUNNING;
	b_startotherroutine(nadja,"SMOKE");
	Log_CreateTopic(TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDLIGHT,LOG_RUNNING);
	b_logentry(TOPIC_REDLIGHT,"I've got to find the guy who's selling swampweed in the harbor district. I've got to get him to sell me some weed. Mortis can help me with that.");
};


instance DIA_ANDRE_REDLIGHT_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_redlight_success_condition;
	information = dia_andre_redlight_success_info;
	permanent = TRUE;
	description = "About that weed...";
};


func int dia_andre_redlight_success_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_redlight_success_info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//About that weed...
	if((Npc_IsDead(borka) == TRUE) || (UNDERCOVER_FAILED == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//I do not believe that we will learn anything in the harbor district now.
		if(Npc_IsDead(borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//Not since that bouncer is dead.
		};
		if(NADJA_VICTIM == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//This girl from the Red Lantern, Nadja, is dead. Must have been some freak accident.
			b_removenpc(nadja);
		};
		if(UNDERCOVER_FAILED == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//You were not discreet enough.
		};
		MIS_ANDRE_REDLIGHT = LOG_FAILED;
		b_checklog();
	}
	else if(BORKA_DEAL == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//I know who's selling the weed in town. It's Borka, the doorman at the Red Lantern.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//Indeed? Do we have proof?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//He sold me some swampweed.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//Fine, that's enough for us. I shall have him arrested at once.
		b_startotherroutine(borka,"PRISON");
		MIS_ANDRE_REDLIGHT = LOG_SUCCESS;
		b_giveplayerxp(XP_REDLIGHT);
		b_andresold();
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//... I'm still working on it.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//Good, remember that you must get the fellow to do business with you.
	};
};


instance DIA_ANDRE_HILFBAUERLOBART(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_hilfbauerlobart_condition;
	information = dia_andre_hilfbauerlobart_info;
	description = "Have you got another assignment for me?";
};


func int dia_andre_hilfbauerlobart_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_hilfbauerlobart_info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//Have you got another assignment for me?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//Lobart the turnip farmer has problems in his fields.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//If we help him, it will solidify his relationship with the city. So go to him and see what is wrong.
	Log_CreateTopic(TOPIC_FELDRAEUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FELDRAEUBER,LOG_RUNNING);
	b_logentry(TOPIC_FELDRAEUBER,"Andre's sent me to Lobart's farm. I've got to help Lobart get his farm sorted out again.");
	MIS_ANDREHELPLOBART = LOG_RUNNING;
	Wld_InsertNpc(lobarts_giant_bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug7,"NW_FARM1_FIELD_03");
	b_startotherroutine(vino,"BUGSTHERE");
	b_startotherroutine(lobartsbauer1,"BUGSTHERE");
	b_startotherroutine(lobartsbauer2,"BUGSTHERE");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_LOBART_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_lobart_success_condition;
	information = dia_andre_lobart_success_info;
	description = "I've helped Lobart.";
};


func int dia_andre_lobart_success_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_lobart_success_info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//I've helped Lobart.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//Excellent. If Lobart is happy, then he will continue to sell his turnips to the city.
	b_giveplayerxp(XP_LOBARTBUGS);
	b_andresold();
};


instance DIA_ADDON_ANDRE_MISSINGPEOPLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_missingpeople_condition;
	information = dia_addon_andre_missingpeople_info;
	description = "What about the missing people?";
};


func int dia_addon_andre_missingpeople_condition()
{
	if((MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING) && (other.guild == GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_addon_andre_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_00");	//What about the missing people?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_01");	//What about them?
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople_15_02");	//Shouldn't we try to find them?
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_03");	//Lord Hagen gave me orders to protect the town and the surrounding farms.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_04");	//That means that we're taking care of the people who are still HERE.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_05");	//The militia patrols the streets at night. That's all I can do.
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople_08_06");	//And YOU will take care of the tasks I give you, understood?
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_RUNNING;
};


instance DIA_ADDON_ANDRE_MISSINGPEOPLE2(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_missingpeople2_condition;
	information = dia_addon_andre_missingpeople2_info;
	description = "About the missing people...";
};


func int dia_addon_andre_missingpeople2_condition()
{
	if((MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING) && (other.guild != GIL_MIL) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_andre_missingpeople2_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_MissingPeople2_15_00");	//About those missing people...
	AI_Output(self,other,"DIA_Addon_Andre_MissingPeople2_08_01");	//Just leave me alone with THAT. I've got other problems.
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_RUNNING;
};


instance DIA_ADDON_ANDRE_RETURNEDMISSINGPEOPLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_addon_andre_returnedmissingpeople_condition;
	information = dia_addon_andre_returnedmissingpeople_info;
	description = "I've been able to rescue some of the missing people.";
};


func int dia_addon_andre_returnedmissingpeople_condition()
{
	if((MISSINGPEOPLERETURNEDHOME == TRUE) && (MIS_ADDON_ANDRE_MISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_andre_returnedmissingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_00");	//I've been able to rescue some of the missing people.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_01");	//And here I was, wondering where the hell you've been all this time!
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_02");	//You're a member of the militia! You were not given orders for such an action!
		AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_03");	//But...
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_04");	//How many people did you find?
	AI_Output(other,self,"DIA_Addon_Andre_ReturnedMissingPeople_15_05");	//All those who were still alive...
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_06");	//All?! I... Er...
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_07");	//I am so proud of you! And I'm glad that I let you join us.
		b_andresold();
	};
	AI_Output(self,other,"DIA_Addon_Andre_ReturnedMissingPeople_08_08");	//That was a grand deed.
	MIS_ADDON_ANDRE_MISSINGPEOPLE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ANDRE_MISSINGPEOPLE);
};

func void b_andre_gotolordhagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//You had better go directly to him.
};


instance DIA_ANDRE_BERICHTDRACHEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachen_condition;
	information = dia_andre_berichtdrachen_info;
	permanent = FALSE;
	description = "I was in the Valley of Mines and saw the dragons!";
};


func int dia_andre_berichtdrachen_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachen_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//I was in the Valley of Mines and saw the dragons!
	if(Npc_HasItems(hero,itwr_paladinletter_mis) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//I have a letter from Commander Garond that confirms everything I said.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//That'll interest Lord Hagen!
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BENNETINPRISON(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_bennetinprison_condition;
	information = dia_andre_bennetinprison_info;
	permanent = TRUE;
	description = "What about Bennet, the blacksmith?";
};


func int dia_andre_bennetinprison_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_bennetinprison_info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//What about Bennet, the blacksmith?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//You mean the mercenary? He is sitting in jail where he belongs.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//Can I talk to him?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//Certainly, just go in. But if you try to help him escape, you will be in for it.
};


instance DIA_ANDRE_CORNELIUS_LIAR(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_cornelius_liar_condition;
	information = dia_andre_cornelius_liar_info;
	permanent = TRUE;
	description = "I think that Cornelius is lying.";
};


func int dia_andre_cornelius_liar_condition()
{
	if((CORNELIUS_THREATENBYMILSC == TRUE) && (CORNELIUSFLEE != TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_cornelius_liar_info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//I think that Cornelius is lying.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//Are you sure?
	Info_ClearChoices(dia_andre_cornelius_liar);
	Info_AddChoice(dia_andre_cornelius_liar,"No.",dia_andre_cornelius_liar_no);
	Info_AddChoice(dia_andre_cornelius_liar,"Yes.",dia_andre_cornelius_liar_yes);
};

func void dia_andre_cornelius_liar_no()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//No.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//Then you should not announce your suspicion so loudly.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//Cornelius is an influential man. He can make your life hell if he wants to.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//As long as you have no proof, I cannot help you.
	Info_ClearChoices(dia_andre_cornelius_liar);
};

func void dia_andre_cornelius_liar_yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//Yes.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//What proof do you have?
	if(CORNELIUS_ISLIAR == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//I've read his diary! They bribed him. Everything was just a bunch of lies.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//If that is really so, you must go to Lord Hagen immediately.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//Show him the diary. He will take care of the rest.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//Ehhm, well, I think...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//I need proof, not suppositions. Get the proof, then I can do something for you.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//Until then, you should think carefully about what you say.
	};
	Info_ClearChoices(dia_andre_cornelius_liar);
};


instance DIA_ANDRE_PALADIN(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_paladin_condition;
	information = dia_andre_paladin_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_paladin_condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_andre_paladin_info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//So now you are a paladin! Congratulations!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//I thought from the beginning that you wouldn't stay with the militia long.
};


instance DIA_ANDRE_PERM(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_perm_condition;
	information = dia_andre_perm_info;
	permanent = TRUE;
	description = "How's the situation in town?";
};


func int dia_andre_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_perm_info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//How's the situation in town?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//Everything is under control.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//Carry out your assignments.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//From now on you report directly to Lord Hagen. Go speak to him.
	};
};


instance DIA_ANDRE_BERICHTDRACHENTOT(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachentot_condition;
	information = dia_andre_berichtdrachentot_info;
	permanent = FALSE;
	description = "I have killed all the dragons in the Valley of Mines!";
};


func int dia_andre_berichtdrachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachentot_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//I have killed all the dragons in the Valley of Mines!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//If that is true, you must tell Lord Hagen about it.
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BERICHTTORAUF(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichttorauf_condition;
	information = dia_andre_berichttorauf_info;
	permanent = FALSE;
	description = "The castle in the Valley of Mines has been stormed by the orcs!";
};


func int dia_andre_berichttorauf_condition()
{
	if((KAPITEL == 5) && (MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_andre_berichtdrachentot))
	{
		return TRUE;
	};
};

func void dia_andre_berichttorauf_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//The castle in the Valley of Mines has been stormed by the orcs!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//No! Lord Hagen must hear of this.
	b_andre_gotolordhagen();
};

