
instance DIA_GAROND_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_exit_condition;
	information = dia_garond_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


var int garond_lastpetzcounter;
var int garond_lastpetzcrime;

instance DIA_GAROND_PMSCHULDEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_pmschulden_condition;
	information = dia_garond_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GAROND_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= GAROND_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_garond_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//We're not going to discuss anything before you have paid your penalty.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//And that has gone up following the most recent accusations.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//You seem to have gotten into even more trouble.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//But I hope you're going to pay for everything now! All in all, this comes to...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//I am very disappointed in you. Your penalty amounts to...
		};
		diff = b_gettotalpetzcounter(self) - GAROND_LASTPETZCOUNTER;
		if(diff > 0)
		{
			GAROND_SCHULDEN = GAROND_SCHULDEN + (diff * 50);
		};
		if(GAROND_SCHULDEN > 1000)
		{
			GAROND_SCHULDEN = 1000;
		};
		b_say_gold(self,other,GAROND_SCHULDEN);
	}
	else if(b_getgreatestpetzcrime(self) < GAROND_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//A few new things have come up.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//Suddenly, you are no longer accused of murder.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//No one remembers watching you commit a theft.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//There are no longer any witnesses claiming you have been involved in a brawl or two.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//It looks like all charges against you have been dropped.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//I have no idea what went on there, but I'm warning you: don't go too far!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//I have decided to waive your debts.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//And don't get into trouble in the castle ever again!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//I want one thing to be clear: you're going to have to pay the full amount of your penalty anyway.
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//So, what about it?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"I haven't got enough gold!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"How much was that again?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"I want to pay the penalty!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//How much was that again?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"I haven't got enough gold!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"How much was that again?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"I want to pay the penalty!",dia_garond_petzmaster_paynow);
	};
};


instance DIA_GAROND_PETZMASTER(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_petzmaster_condition;
	information = dia_garond_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > GAROND_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_info()
{
	GAROND_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//So you're the one who made trouble here in the castle.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//I've been asking myself how long it would take until you came to me.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//Murder is just about the last thing I need here.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//I need every single one of my people - and now I'm left with one less again!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//To say nothing of the other messes you've gotten yourself into.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//Let me explain something to you. We're all together in the same trap here.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//And I desperately need every single one of my men. Including you.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//If you feel like killing somebody, all you need to do is leave the castle. There's plenty of orcs out there.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//I'm going to impose a penalty on you - although I really resent having to deal with crap like this.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//Rumor has it that you've been filching stuff around here.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//Not to mention all those other things I was told.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//You're not going to get away with that. You don't seem to grasp the seriousness of the situation.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//You shall be made to pay a penalty to compensate for your crimes!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//I don't like to see brawls among my men.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//And that sheep thing wasn't really necessary either.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//So you are going to pay your penalty for that!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//You're running around killing our sheep? They belong to us all.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//You shall pay me for the meat.
		GAROND_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//How much?
	if(GAROND_SCHULDEN > 1000)
	{
		GAROND_SCHULDEN = 1000;
	};
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_petzmaster,"I haven't got enough gold!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"I want to pay the penalty!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//I want to pay the penalty!
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//All right, I'll tell the lads to calm down then. But don't let me catch you at this sort of crap ever again!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//I don't have enough gold!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//Then you should come up with the gold as soon as you can.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//And I'm warning you: cause any more trouble in the future, and the price will go up!
	GAROND_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	GAROND_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_HELLO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_hello_condition;
	information = dia_garond_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_garond_hello_condition()
{
	if((KAPITEL == 2) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_garond_hello_info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//Where do you come from? You aren't one of the scrapers, and you aren't one of my people. Well?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//I've come across the pass.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//Over the pass...? You actually got through - by Innos!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//Why have you taken this path upon yourself, magician?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//What are your orders, soldier?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//I have to ask myself why a mercenary would take all that on himself. What are you doing here?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "I come from Lord Hagen.";
};


func int dia_garond_needproof_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_hello) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_needproof_info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//I come from Lord Hagen. He wants me to bring him proof of the presence of the dragons.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//And you've come here just to fetch it and then disappear again?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//That's what I had in mind.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//So he wants proof? He can have it. But I can't send you back to Lord Hagen without giving him information about the ore.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//Listen - Lord Hagen absolutely must learn what the situation is here and how much ore we've mined up to now.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//All right, what do you want me to do for you?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//I've got three troops of scrapers out there, but they haven't sent me a single nugget.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//Visit the mining sites and report back to me how much ore they have stored.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//Then I'll write you a letter that you are going to take back to Lord Hagen.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//Of well - I guess I have no choice.
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"Before Commander Garond sends me back, he wants me to seek out the three scraper troops and tell him how much ore they have stacked away.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"Commander Garond has given me an assignment. He's sent three troops of scrapers out to look for magic ore. They haven't brought any back so far.");
	b_logentry(TOPIC_SCOUTMINE,"I've got to find the three scraper troops and find out how much ore they've got stacked away.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "But why me, of all people?";
};


func int dia_garond_why_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_why_info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//But why me, of all people?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//Because you know a way to get through the lines of orcs. My boys would be hopelessly lost out there.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//You, on the other hand, have managed to get through once already - that makes you the best man for this job.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "I need some equipment.";
};


func int dia_garond_equipment_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void dia_garond_equipment_info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//I need some equipment.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//Talk to the magician Milten here in the castle. He knows about the things you'll need.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//Talk to Tandor about that. He'll get you everything you need.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"Tandor trades in weapons at the castle.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "How much will you pay me for the job?";
};


func int dia_garond_zahlen_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_zahlen_info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//How much will you pay me for the job?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//(irritated) I am not used to haggling with mercenaries.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//Oh well, I guess I have no choice. I'll pay you 500 gold pieces if you take care of this mission for me.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "Where can I find the mining sites?";
};


func int dia_garond_wo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_wo_info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//Where can I find the mining sites?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//Here, take this map. It shows the two areas where the mining sites are located.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//If you have any more questions, ask Parcival. He can tell you all you need to know about the scrapers.
	b_logentry(TOPIC_SCOUTMINE,"The paladin Parcival can give me information about the scrapers.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//Damn! What's going on out there? Has Beliar himself come to wipe us out?
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//My men are almost all dead and with the bit of ore we have, we CAN'T EVEN STOP ONE ORC LET ALONE AN ARMY!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//This expedition is doomed to failure.
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "I talked to Fajeth.";
};


func int dia_garond_fajeth_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (FAJETH_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_fajeth_info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//I talked to Fajeth.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//What has he got to tell me?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//His people have mined two chests of ore.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//Hmm... two chests? I don't need two chests - I need TWO HUNDRED.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//He wants me to tell you that he needs more men.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//What? I'm supposed to send even more men to certain death? He can forget it.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_FAJETH_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SILVESTRO(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_silvestro_condition;
	information = dia_garond_silvestro_info;
	permanent = FALSE;
	description = "About Silvestro's mining site...";
};


func int dia_garond_silvestro_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((SILVESTRO_ORE == TRUE) || (Npc_IsDead(pc_thiefow) == TRUE)))
	{
		return TRUE;
	};
};

func void dia_garond_silvestro_info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//About Silvestro's mining site...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//Did you go see him? Did you talk to him?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//Everyone's dead there. They were surprised by minecrawlers.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//What about the ore? Do you know how much they have mined?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//They managed to secure a few chests first. They're in a cave - along the path from the castle to the mining site.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//Damn! Those were a lot of good men - may Innos have mercy on their souls.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_SILVESTRO_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_MARCOS(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_marcos_condition;
	information = dia_garond_marcos_info;
	permanent = FALSE;
	description = "I have met Marcos.";
};


func int dia_garond_marcos_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (MARCOS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_marcos_info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//I have met Marcos.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//And? What does he have to report? How much ore does he have for us?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//Four chests. He has left the mining site to take the ore to safety.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//Now he is guarding the chests in a small valley behind the lines of orcs. He's asking for reinforcements, however.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//What? Only four chests - and he left his mining site? Damn, that isn't good.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//And now he wants more men...? Well, fine, I'll send him two people.
	marcos_guard1.flags = 0;
	marcos_guard2.flags = 0;
	b_startotherroutine(marcos_guard1,"MARCOS");
	b_startotherroutine(marcos_guard2,"MARCOS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	ORE_COUNTER = ORE_COUNTER + 1;
	MIS_MARCOS_JUNGS = LOG_SUCCESS;
	b_giveplayerxp(XP_MARCOS_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SUCCESS(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_success_condition;
	information = dia_garond_success_info;
	permanent = FALSE;
	description = "What about the letter for Lord Hagen?";
};


func int dia_garond_success_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER >= 3))
	{
		return TRUE;
	};
};

func void dia_garond_success_info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//What about the letter for Lord Hagen?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//We have ten crates of ore on the whole - and we've lost twice as many good men.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//You shall have your letter. Lord Hagen MUST hear of this. This valley is cursed - evil abides here.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"Commander Garond has given me a letter. That should be evidence enough. I can take it back to Lord Hagen.");
	MIS_SCOUTMINE = LOG_SUCCESS;
	b_giveplayerxp(XP_SCOUTMINE);
	Wld_InsertNpc(gobbo_black,"OW_PATH_1_17_2");
	Wld_InsertNpc(gobbo_black,"OW_PATH_1_17_2");
	Wld_InsertNpc(gobbo_warrior,"OW_VM_ENTRANCE");
	Wld_InsertNpc(bloodfly,"OW_PATH_1_5_7");
	Wld_InsertNpc(bloodfly,"MOVEMENT_OW_BLOODFLY_E_3");
	Wld_InsertNpc(orcwarrior_scout,"OW_PATH_1_5_12_2");
	Wld_InsertNpc(waran,"OW_PATH_1_5_A");
	Wld_InsertNpc(waran,"OW_PATH_1_5_B");
	Wld_InsertNpc(lurker,"SPAWN_OW_LURKER_RIVER2");
	Wld_InsertNpc(lurker,"OW_PATH_BLOODFLY01_SPAWN01");
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
};


instance DIA_GAROND_SLD(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_sld_condition;
	information = dia_garond_sld_info;
	permanent = FALSE;
	description = "What about my pay?";
};


func int dia_garond_sld_condition()
{
	if((MIS_SCOUTMINE == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_sld_info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//What about my pay?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//Oh yes, right. I still owe you some gold. Here's your reward.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "How's the situation?";
};


func int dia_garond_running_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER < 3))
	{
		return TRUE;
	};
};

func void dia_garond_running_info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//How's the situation?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//Now I'm only waiting for news about the last mining site - and I hope it's good news.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//I need the reports about the other two mining sites. Then we shall see.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//You should set out to find the mining sites. I'm desperate for news about the status of the ore production.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "I want you to let Gorn go.";
};


func int dia_garond_gorn_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_gorn) && (KAPITEL == 2) && Npc_KnowsInfo(other,dia_garond_needproof))
	{
		return TRUE;
	};
};

func void dia_garond_gorn_info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//I want you to let Gorn go.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//I can't let him go. He has committed many crimes and they must be atoned for.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//Can I pay his penalty?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//That might be a possibility - but certainly not a cheap one. I want 1000 gold pieces for Gorn.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//That's a lot of gold.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//Gorn also has much to answer for. Bring me the gold and I'll set Gorn free.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"Garond demands a thousand pieces of gold to set Gorn free.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "I want to buy Gorn's freedom. (Pay 1000 gold)";
};


func int dia_garond_pay_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_pay_info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//I want to buy Gorn free.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//Agreed. You can go to Gerold and tell him to release Gorn on my orders.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"I've paid Garond. Now I can get Gorn out of the slammer. The guard Gerold will let him go.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//Then bring me the 1000 gold pieces.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "What are you planning to do now?";
};


func int dia_garond_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_success) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_perm2_info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//What are you planning to do now?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//I've tried everything. You're my only hope now - and that Lord Hagen will send me reinforcements.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//We'll continue to stand firm and pray to Innos that he won't leave us despondent in this dark hour.
};


instance DIA_GAROND_KAP3_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap3_exit_condition;
	information = dia_garond_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_WASGIBTSNEUES(C_INFO)
{
	npc = pal_250_garond;
	nr = 30;
	condition = dia_garond_wasgibtsneues_condition;
	information = dia_garond_wasgibtsneues_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_garond_wasgibtsneues_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_wasgibtsneues_info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//What's new?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//Damnit. What are you mucking about here for? I need those bloody reinforcements!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//Even Milten has left the castle. But I don't need fewer people - I need more!
};


instance DIA_GAROND_KAP4_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap4_exit_condition;
	information = dia_garond_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_BACKINKAP4(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_backinkap4_condition;
	information = dia_garond_backinkap4_info;
	permanent = FALSE;
	description = "I'm back.";
};


func int dia_garond_backinkap4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_backinkap4_info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//I'm back.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//I can see that for myself. Where are the reinforcements?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//Lord Hagen will come as soon as he has settled everything. Much has happened.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//I don't care. I need troops. There are more and more orcs and we can't hold out much longer.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//My men are tired, and we're running out of provisions.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//Some volunteers have arrived.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//You mean yourself and your fellow Dragon hunters, huh? You can help us, but there just aren't enough of you.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//You mean the Dragon hunters outside in the yard? They may help us, but there just aren't enough of them.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//If Hagen doesn't send some men soon, I can't make any guarantees.
	b_initnpcglobals();
	AI_Teleport(djg_angar,"OW_DJG_WATCH_STONEHENGE_01");
	b_startotherroutine(djg_angar,"Start");
	DJG_ANGAR_SENTTOSTONES = TRUE;
	b_startotherroutine(kjorn,"START");
	b_startotherroutine(godar,"START");
	b_startotherroutine(hokurn,"START");
	b_startotherroutine(pc_fighter_djg,"START");
	b_startotherroutine(kurgan,"START");
	if(DJG_BIFFPARTY == FALSE)
	{
		b_startotherroutine(biff,"START");
	};
};


instance DIA_GAROND_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_250_garond;
	nr = 11;
	condition = dia_garond_dragonplettbericht_condition;
	information = dia_garond_dragonplettbericht_info;
	permanent = TRUE;
	description = "About the dragons...";
};


var int dia_garond_dragonplettbericht_noperm;

func int dia_garond_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_garond_backinkap4) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int garond_dragoncounter;
var int garond_swampdragonkilled_onetime;
var int garond_rockdragonkilled_onetime;
var int garond_firedragonkilled_onetime;
var int garond_icedragonkilled_onetime;
var int garond_oricexperte_onetime;

func void dia_garond_dragonplettbericht_info()
{
	var int currentdragoncount;
	var int drachengeld;
	var int xp_localgarond;
	b_logentry(TOPIC_DRACHENJAGD,"Garond is bound to be interested how matters stand with the dragons, though he creates the impression he doesn't care two hoots.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//I've got news about the dragons.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//Report.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//I killed the dragon in the swamp to the east of here.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//The dragon in the rock fortress to the south is dead.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//The fire dragon on the volcano to the south will wreak no more havoc.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//I went to the western ice region and did away with the dragon there.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//That's good news. Here. I'll give you some money towards your equipment.
		drachengeld = currentdragoncount * GAROND_KILLEDDRAGONGELD;
		xp_localgarond = currentdragoncount * XP_GAROND_KILLEDDRAGON;
		b_giveplayerxp(xp_localgarond);
		CreateInvItems(self,itmi_gold,drachengeld);
		b_giveinvitems(self,other,itmi_gold,drachengeld);
		GAROND_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		if(MIS_ALLDRAGONSDEAD == TRUE)
		{
			DIA_GAROND_DRAGONPLETTBERICHT_NOPERM = TRUE;
		};
	};
	if((GAROND_ORICEXPERTE_ONETIME == FALSE) && (Npc_IsDead(oric) == FALSE) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//Can you give me more information about the dragons?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//I have other things to worry about. My strategic officer Oric can tell you more about that.
		b_logentry(TOPIC_DRACHENJAGD,"Garond's strategic officer Oric may have some useful information for me.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//Have there been any more dragon attacks in the meantime?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//Luckily not. For the moment they're holding off.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "All the dragons are dead.";
};


func int dia_garond_alldragondead_condition()
{
	if((MIS_ALLDRAGONSDEAD == TRUE) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == TRUE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_alldragondead_info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//All the dragons are dead.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(in disbelief) All of them? So evil has been vanquished forever?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//No, alas not. Their leader still remains.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//Weren't the dragons the leaders of the orcs?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//Yes, true, but they also have their own master. We must get rid of him as well.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//I damn well can't go. I have to guard the ore, and the cursed orcs are still about, too.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//You'll have to take care of it yourself. I can't help you.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//May Innos protect you.
	Wld_InsertNpc(wolf,"FP_ROAM_WARG_OC_15");
	Wld_InsertNpc(lurker,"OW_PATH_OW_PATH_WARAN05_SPAWN01");
	Wld_InsertNpc(lurker,"OW_RIVERBED_07");
	Wld_InsertNpc(lurker,"FP_ROAM_OW_LURKER_LH_02");
	Wld_InsertNpc(lurker,"MOVEMENT_OW_BLOODFLY_E_3");
	Wld_InsertNpc(ybloodfly,"OW_PATH_BLOODFLY01_SPAWN01");
	Wld_InsertNpc(ybloodfly,"FP_ROAM_OW_BLOODFLY_01_01");
	Wld_InsertNpc(ybloodfly,"OW_PATH_1_5_A");
	Wld_InsertNpc(ybloodfly,"OW_PATH_1_5_A");
	Wld_InsertNpc(ybloodfly,"OC13");
	Wld_InsertNpc(gobbo_green,"OW_DJG_STARTCAMP_01");
	Wld_InsertNpc(gobbo_black,"OW_DJG_STARTCAMP_01");
	Wld_InsertNpc(gobbo_green,"OW_DJG_STARTCAMP_01");
	Wld_InsertNpc(snapper,"SPAWN_OW_SCA_05_01");
};


instance DIA_GAROND_JANBECOMESMITH(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_janbecomesmith_condition;
	information = dia_garond_janbecomesmith_info;
	permanent = TRUE;
	description = "There is a problem with the smith.";
};


func int dia_garond_janbecomesmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_janbecomesmith_info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//There is a problem with the smith.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//What smith? He's disappeared into the woodwork.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//Is he back? Then you can tell him...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//No, I'm talking about Jan.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//He is a Dragon hunter, just like me, and a good blacksmith.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//One of the Dragon hunters. He's a smith.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//That's good. Our previous smith just slinked off, the coward.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//Jan would be willing to take over the smithy.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//I see. So you think I can trust him.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//Yes.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//If you're so sure, then you can vouch for him.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//If he causes any trouble, you'll answer for it. Agreed?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"I'll think about it.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"I'll vouch for Jan.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//How can I trust him, if even you won't?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//Without someone to stand for him, this Jan can keep his hands off the forge.
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//I'll vouch for Jan.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//All right. He can use the smithy. Of course, he'll also have to provide my men with swords.
	Info_ClearChoices(dia_garond_janbecomesmith);
	MIS_JANBECOMESSMITH = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAROND_KAP5_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap5_exit_condition;
	information = dia_garond_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PERM5(C_INFO)
{
	npc = pal_250_garond;
	nr = 59;
	condition = dia_garond_perm5_condition;
	information = dia_garond_perm5_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_garond_perm5_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_perm5_info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//How's the situation?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//What a damned mess! Some bastard left the main gate open. Now we're nothing more than fodder for the wolves.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//When I get my hands on the traitor...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//We'll all die like flies here if Hagen doesn't come soon.
	};
};


instance DIA_GAROND_KAP6_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap6_exit_condition;
	information = dia_garond_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_garond_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

