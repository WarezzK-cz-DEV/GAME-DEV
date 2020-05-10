
instance DIA_LEE_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_exit_condition;
	information = dia_lee_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lee_teleport;

func void b_lee_teleport()
{
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//Ah. It's good that you've come.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//What's up?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//I found this in the old chapel.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//It's a magic rune. I think it will teleport you straight back here to the farm.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//I thought you might be able to use it.
	LEE_TELEPORT = TRUE;
};


var int lee_lastpetzcounter;
var int lee_lastpetzcrime;

instance DIA_LEE_PMSCHULDEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_pmschulden_condition;
	information = dia_lee_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (LEE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= LEE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_lee_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//Are you here to bring the money for Onar?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//I already told you not to do anything stupid here.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//Onar has heard that you've earned yourself quite a record in the meanwhile .
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//Accordingly, he wants more money now.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//How much?
			diff = b_gettotalpetzcounter(self) - LEE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				LEE_SCHULDEN = LEE_SCHULDEN + (diff * 50);
			};
			if(LEE_SCHULDEN > 1000)
			{
				LEE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,LEE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//I thought you were smarter than that.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//Then I have good news for you.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//Suddenly, there is no one left who saw you commit murder.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//None of the people will now testify that they saw you stealing.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//There is no one left who SAW how you beat up one of the farmers.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//Apparently, all the charges against you have dissolved into thin air.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//That's one way of getting around problems like that.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//In any case, you no longer have to pay.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//But mind your step in future.
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//One thing is clear: You must, nevertheless, pay your fines in full.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//So, what about it?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"I haven't got enough gold!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"How much was that again?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"I want to pay the penalty!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//How much was that again?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"I haven't got enough gold!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"How much was that again?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"I want to pay the penalty!",dia_lee_petzmaster_paynow);
	};
};


instance DIA_LEE_PETZMASTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_petzmaster_condition;
	information = dia_lee_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > LEE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_info()
{
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	LEE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//Who the devil let YOU in here - (surprised) - YOU are the new fellow who has been causing trouble?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//I had heard from Gorn that you were still alive, but that you would come here... anyway...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//It is good that you have come to me before everything becomes even worse for you.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//The mercenaries are tough lads and the farmers here aren't exactly squeamish, but you can't just go around killing people.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//To say nothing of the other mischief you've done here.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//I can help you get out of this mess with a clean slate.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//It's gonna cost you, though. Onar is a greedy man, and only if HE turns a blind eye will the matter be forgotten.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//It's a good thing you've come. I have heard that you stole something here.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//And knocked the farmers around.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//AND killed a few sheep.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//You just can't pull that kind of thing around here. In such cases, Onar insists that I bring the culprit to account.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//That means: you pay, and he pockets the cash - but then at least the matter is forgotten.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//If you get involved in a duel with the mercenaries, that's one thing...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//But if you beat up a farmer, they run straight to Onar. And he expects me to do something.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//Not to mention that he isn't exactly thrilled when someone kills his sheep.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//You'll have to pay a penalty. Onar pockets the money himself as a rule - but it's the only way to settle the matter.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//Onar expects me to protect his farm. And that includes his sheep.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//You will have to pay him compensation!
		LEE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//How much?
	if(LEE_SCHULDEN > 1000)
	{
		LEE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_petzmaster,"I haven't got enough gold!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"I want to pay the penalty!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//I want to pay the penalty!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//Good! I'll see to it that Onar gets the money. You can consider the matter forgotten.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//I don't have enough gold!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//Then go get it as soon as possible.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//But just don't think you can steal it here on the farm. If you get caught, things will be even worse for you.
	LEE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	LEE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LEE_HALLO(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_hallo_condition;
	information = dia_lee_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_hallo_info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//Who the devil let YOU in here - (surprised) - What are you doing here? I thought you were dead!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//What makes you think that?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//Gorn told me that it was you who brought down the Barrier.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//Yes, that was me all right.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//I never would have thought that a man could survive something like that. What brings you here? You aren't here without a reason...
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "I absolutely must talk to the paladins in town...";
};


func int dia_lee_paladine_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_paladine_info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//I absolutely must talk to the paladins in town. Can you help me get to them?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(distrustful) What's your business with the paladins?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//That's a long story...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//I've got time.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(sighs) Xardas sent me on a mission. He wants me to obtain a powerful amulet, the Eye of Innos.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//So you're still allied with that necromancer. I see. And the paladins have this amulet?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//As far as I know - yes.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//I can help you get to the paladins. But first you need to become one of us.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "How can you help me get to the paladins?";
};


func int dia_lee_paladinehow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_paladine))
	{
		return TRUE;
	};
};

func void dia_lee_paladinehow_info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//How can you help me get to the paladins?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//Trust me. I've got a plan. I think you're the right man for it...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//I'll take you to the paladins and you'll do me a favor. But first, join us!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "What exactly are you doing here?";
};


func int dia_lee_leesplan_condition()
{
	if(LEE_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_leesplan_info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//What exactly are you doing here?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//Quite simple: I'm gonna see to it that we all get off this island.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//Onar hired us to defend his farm, and that's exactly what we're gonna do.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//But our reward is more than just our pay. By helping the farmers, we cut the city off from its provisions.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//And the less the paladins have to eat, the sooner they'll listen when I finally make them an offer of peace.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//Too bad that you had to join up with them of all people.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//What is your offer going to look like?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//Essentially, it will be about our pardons and free passage to the mainland. You'll learn more when the time comes.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "I want to join you!";
};


func int dia_lee_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//I want to join you!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//I'd hoped you'd say that! I can use every able man here.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//The last mercenaries I accepted have done nothing but stir up trouble!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//In principle, you can start right away. Well, first there's one or two things that we need to get straight, but it's no big deal...
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "What do I have to 'get straight' before I can join you?";
};


func int dia_lee_clearwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_clearwhat_info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//What do I have to 'get straight' before I can join you?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//Onar, the landowner, is the one who employs us. You can only stay on the farm with his approval.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//And then there's the boys. I can only accept you if a majority of the mercenaries agree that you join us.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//But don't go to Onar before everything is straightened out. He's a very impatient fellow...
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"To be accepted as a mercenary, I have to get Onar's approval once I've persuaded the mercenaries.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "How can I convince the mercenaries to vote me in?";
};


func int dia_lee_othersld_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_othersld_info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//How can I convince the mercenaries to vote me in?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//By doing what is expected of you as a mercenary, I should say.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//Talk to Torlof. He's usually outside in front of the house. He'll put you to the test.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//If you can pass that, you should have earned a large part of the necessary respect.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//He'll tell you everything else you need to know.
	b_logentry(TOPIC_BECOMESLD,"To be accepted as a mercenary, I have to let Torlof put me to the test and earn the respect of the other mercenaries.");
};


instance DIA_ADDON_LEE_RANGER(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_addon_lee_ranger_condition;
	information = dia_addon_lee_ranger_info;
	description = "What do you know about the 'Ring of Water'?";
};


func int dia_addon_lee_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_othersld) && (SC_KNOWSRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lee_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_00");	//What do you know about the 'Ring of Water'?
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_01");	//(laughs) I might have known. You just have to mingle in everything, don't you?
	AI_Output(other,self,"DIA_Addon_Lee_Ranger_15_02");	//Come on, tell me.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_03");	//I'm only marginally involved in this. I know that this secret guild exists here and that the Water Mages are behind it.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_04");	//Since the fall of the Barrier, I am no longer bound to the agreement that I came to with the Water Mages back then.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_05");	//Of course, I still help when I can. But most of the time, I have my own problems and barely any time for other things.
	AI_Output(self,other,"DIA_Addon_Lee_Ranger_04_06");	//If you want to know more about it, you should probably talk to Cord. He's one of them, as far as I know.
	RANGERHELP_GILDESLD = TRUE;
	SC_KNOWSCORDASRANGERFROMLEE = TRUE;
};


var int lee_probeok;
var int lee_stimmenok;
var int lee_onarok;

instance DIA_LEE_JOINNOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 8;
	condition = dia_lee_joinnow_condition;
	information = dia_lee_joinnow_info;
	permanent = TRUE;
	description = "I'm ready to join you!";
};


func int dia_lee_joinnow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_othersld) && (LEE_ONAROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_joinnow_info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//I'm ready to join you!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//Not before you have passed Torlof's test.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//Then you've passed Torlof's test?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//Yes.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//That's good.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//What do the other mercenaries say?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//I'm not quite sure whether enough of them are on my side.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//Then talk to Torlof, he knows just about everything that's being said here on the farm.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//Most of them are on my side.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//Good, then go see Onar now. I've already talked with him.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//But you'll have to negotiate your pay yourself.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"All I need now is Onar's approval.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//Have you seen Onar?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//He agrees.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//Welcome aboard, lad!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//Here, take some decent armor first!
			Npc_SetTrueGuild(other,GIL_SLD);
			other.guild = GIL_SLD;
			Npc_ExchangeRoutine(lothar,"START");
			CreateInvItems(other,itar_sld_l,1);
			AI_EquipArmor(other,itar_sld_l);
			Mdl_ApplyOverlayMds(other,"Humans_Relaxed.mds");
			Snd_Play("LEVELUP");
			KDF_AUFNAHME = LOG_OBSOLETE;
			SLD_AUFNAHME = LOG_SUCCESS;
			MIL_AUFNAHME = LOG_OBSOLETE;
			b_giveplayerxp(XP_BECOMEMERCENARY);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//I'm glad to have you with us.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//I already have your first assignment.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//It has to do with the paladins. It's time you went to see them.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//You wanted to go there anyway.
		};
	};
};


instance DIA_LEE_KEINSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_keinsld_condition;
	information = dia_lee_keinsld_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_keinsld_condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (LEE_ISONBOARD == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lee_keinsld_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//I see you've placed yourself in the service of the paladins.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//You entered the monastery? (laughs) I'd have expected anything but that.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//Well, you can't become a mercenary any more now.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//But who knows, maybe you can do one or two things for me - or me for you.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//We'll see. In any case, I wish you all the best.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//But don't even think of pulling the wool over my eyes, got it?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "And how can I get to the paladins now?";
};


func int dia_lee_tohagen_condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_lee_tohagen_info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//And how can I get to the paladins now?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//Very simple. You'll take our peace offering to them.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//I know Lord Hagen, the commander of the paladins, from my time in the royal army.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//I know how he thinks - he doesn't have enough men. He'll accept the offer. At least he'll listen to you.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//I've written a letter - here.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//In any case, that should get you admitted to see the leader of the paladins.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"Lee's sending me to take an offer of peace to Lord Hagen. That way I can get to the paladins.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "I brought Lord Hagen your peace offering.";
};


func int dia_lee_angebotsuccess_condition()
{
	if(HAGEN_FRIEDENABGELEHNT == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_angebotsuccess_info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//I brought Lord Hagen your peace offering.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//What did he say?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//He said we would grant absolution to you, but not to your people.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//That stubborn fool. Most of the men in the KING's army are bigger cut-throats than my men.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//What are you going to do now?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//I'll have to find another way to get us out of here. If need be, we'll capture the ship. I'll have to think about it.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//Pulling my own head out of the noose and abandoning my men is out of the question.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "Why do you want to go to the mainland so badly?";
};


func int dia_lee_background_condition()
{
	if(MIS_LEE_FRIEDENSANGEBOT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_background_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//Why do you want to go to the mainland so badly?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//As you know, I served the King as a general.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//But his sycophants betrayed me, because I knew something I shouldn't have known.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//They tossed me into the mining colony, and the King allowed it.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//I've had a lot of time to think about it.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//I shall avenge myself.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(astonished) On the King?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(determined) On the King! And on all his sycophants. They will all bitterly regret what they did to me...
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "I'm going to head for the Valley of Mines.";
};


func int dia_lee_rescuegorn_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_rescuegorn_info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//I'm going to head for the Valley of Mines.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//I didn't think you would stay on the farms for long.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//If you go back to the colony, keep an eye out for Gorn. The paladins are holding him prisoner there.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//Gorn is a good man and I could really use him here, so if you get a chance to free him, take it.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "I have freed Gorn.";
};


func int dia_lee_success_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_success_info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//I have freed Gorn.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//Yes, he already told me. Good work.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//He's worth more than Sylvio and his boys put together.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "Gorn told you about me?? What happened to him?";
};


func int dia_lee_aboutgorn_condition()
{
	if((KAPITEL < 3) && (Npc_KnowsInfo(other,dia_lee_rescuegorn) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_aboutgorn_info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//Gorn told you about me?? What happened to him?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//You remember him, don't you?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"Let me think...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"Sure.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//Sure.
	b_giveplayerxp(50);
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//He got caught by the paladins and was sent back to the Valley of Mines with a penal convoy.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//If the road to the Valley of Mines weren't plastered with paladins and orcs, I'd have sent a couple of the boys already to free him.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//But the way things are, there's no point. Poor devil.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//Let me think...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//Big, dark, bad, with a big axe - he reconquered our ore mine with you back in the colony.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "Onar now has a few sheep less thanks to Bullco...";
};


func int dia_lee_wegenbullco_condition()
{
	if((KAPITEL < 4) && (MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_wegenbullco_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//Onar now has a few sheep less thanks to Bullco...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//Oh, leave me alone with that shit! I have enough trouble as it is.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//Me too. Bullco seems to have a problem with me. He wants me to leave the farm...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//Yes, and? Assert yourself.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//You can tell him he should restrain himself, otherwise I'll deduct the lost sheep from his pay...
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "I've come from the Valley of Mines...";
};


func int dia_lee_report_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_lee_report_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//I've come from the Valley of Mines. The castle there was attacked by dragons!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//So it's true! Lares said that rumors about dragons are circulating through the city... I didn't believe it...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//What about the paladins?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//They've been thoroughly decimated.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//Good! Maybe now Lord Hagen will think again about my offer...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//And if not...(hard) Then we'll find another way to get out of here...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//Good! Maybe that will make Lord Hagen move to the Valley of Mines with his men...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//The fewer paladins stay here, the better.
	};
};


var int lee_give_sld_m;

instance DIA_LEE_ARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorm_condition;
	information = dia_lee_armorm_info;
	permanent = TRUE;
	description = "What about some better armor?";
};


func int dia_lee_armorm_condition()
{
	if((KAPITEL == 2) && (other.guild == GIL_SLD) && (LEE_GIVE_SLD_M == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_armorm_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//What about some better armor?
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//You fulfilled your assignment.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//I have some better armor for you here. That is, if you have the wherewithal.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//Torlof has an assignment from Onar that should have been taken care of some time ago.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//Take care of that first - then we'll talk about better armor!
	};
};


var int lee_sldmgiven;

instance DIA_LEE_BUYARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorm_condition;
	information = dia_lee_buyarmorm_info;
	permanent = TRUE;
	description = "Buy medium mercenary armor. Protection: B.+45/ B.+30/ P.+30 (750 gold)";
};


func int dia_lee_buyarmorm_condition()
{
	if((LEE_GIVE_SLD_M == TRUE) && (LEE_SLDMGIVEN == FALSE) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorm_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//Give me the armor.
	if(b_giveinvitems(other,self,itmi_gold,750))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//Here you go. Some good armor.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//But it isn't a gift! First I want to see some gold!
	};
};


instance DIA_LEE_KAP3_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap3_exit_condition;
	information = dia_lee_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lee_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_TELEPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_teleport_condition;
	information = dia_lee_teleport_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_teleport_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && (LEE_TELEPORT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_teleport_info()
{
	b_lee_teleport();
};


instance DIA_LEE_ARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorh_condition;
	information = dia_lee_armorh_info;
	permanent = FALSE;
	description = "Do you have better armor for me?";
};


func int dia_lee_armorh_condition()
{
	if((KAPITEL == 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_armorh_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//Do you have better armor for me?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//I sure do.
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "Buy heavy mercenary armor. Protection: B.+75/B.+50/P.+50/Df.+15 (2200 gold)";
};


func int dia_lee_buyarmorh_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_armorh) && (LEE_SLDHGIVEN == FALSE) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorh_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//Give me the heavy armor.
	if(b_giveinvitems(other,self,itmi_gold,2200))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//Here. Very good armor. It's the same that I wear.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//You know how it works. First the gold!
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "Don't you have anything else for me to do?";
};


func int dia_lee_richter_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(richter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_richter_info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//Don't you have anything else for me to do?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//You can't get enough, eh? You're in plenty of trouble as it is. What else do you want, then?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//Another assignment. I'm a mercenary, remember?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//All right. I've got something. It's just the thing for you.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//I have a debt to settle with the judge in town. I'd actually prefer to do it myself.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//But the paladins wouldn't let me within a stone's throw of his house.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//The thing has to be handled with a bit of consideration. So pay attention. You'll go to the judge and offer him your services.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//You'll try to win his trust and carry out some dirty work for him, until you find something to incriminate him.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//The swine has done so many dirty jobs that it stinks to high heaven.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//Bring me something I can use to blacken his name with the militia, so that he spends the rest of his life molding in the slammer.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//But I don't want you to kill him. That would be too quick. I want him to suffer, understand?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//Do you think you can do that?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"Lee wants me to find some incriminating evidence against the judge of Khorinis. For that I have to offer my services to the judge and keep my eyes peeled.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"I'm not going to do that.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"No problem. How much?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//No problem. How much?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//Your reward depends on what you bring me. So make an effort.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//I'm not going to do that. I won't play doormat for that swine.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//Don't make such a fuss. Anyway, he's the one who busted you and had you tossed through the Barrier. Or have you forgotten that?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//Do what you want, but I think you'll make the right decision.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "I found something to incriminate the judge.";
};


func int dia_lee_richterbeweise_condition()
{
	if((KAPITEL >= 3) && (MIS_LEE_JUDGERICHTER == LOG_RUNNING) && Npc_HasItems(other,itwr_richterkomprobrief_mis) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_richterbeweise_info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//I found something to incriminate the judge.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//Really? What is it?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//He hired a few thugs to mug the governor of Khorinis.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//Shortly afterwards, he had them arrested and pocketed all the gold.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//I brought you the written order the judge gave those thugs as evidence.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//Show me.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//At last. That should be enough to make him bleed. I'm impressed.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//I'm willing to shell out quite a bit for that. Here's your reward.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//And not a word about this to anyone, got it?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//That's terrific. But the matter has resolved itself. The judge is dead.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//Some idiot blew him away. Oh, well. That's fine with me, too.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//Here's a few coins. That's all this note is worth to me now.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		MIS_LEE_JUDGERICHTER = LOG_FAILED;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_LEE_TALKABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_talkaboutbennet_condition;
	information = dia_lee_talkaboutbennet_info;
	permanent = FALSE;
	description = "What about Bennet?";
};


func int dia_lee_talkaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lee_talkaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//What about Bennet?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//So you heard about that. The bastards have locked him up, just like that.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//As if I didn't have enough problems with my own people - now I have to take care of the paladins, too.
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "What will you do about Bennet?";
};


func int dia_lee_doaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_talkaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_doaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//What will you do about Bennet?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//I don't know yet. A few of the boys would like to run to the city and knock Lord Hagen's teeth down his throat.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//Luckily, we don't have enough people for an operation like that, and besides it's not my style.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//Are you going to stay here and see what happens, then?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//Certainly not.
	b_logentry(TOPIC_RESCUEBENNET,"If can't prove Bennet's innocence quickly enough, Lee can't be held responsible for anything that happens. His people won't hesitate to attack the town at any moment and get Bennet out by force.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//Lares is still in the city and trying to find out how we can get Bennet out of there.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//Until that happens, I'm trying to calm my people. I only hope that Lares doesn't take too long.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//Oh, yes. Before I forget... Buster wants to talk to you. He wouldn't tell me what it was about. Maybe you should go see him!
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "Can I help you in this matter with Bennet?";
};


func int dia_lee_canhelpyou_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_doaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_canhelpyou_info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//Can I help you in this matter with Bennet?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//Sure, a bit of intelligence and sanity certainly wouldn't hurt in this matter.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//Innos knows, there are enough idiots running around here.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//Go to the city and see if you can find a way to get Bennet out of there.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//But don't be too long about it, I don't know how much longer I can keep the men under control.
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "Any news about Bennet?";
};


func int dia_lee_anynews_condition()
{
	if((MIS_RESCUEBENNET != FALSE) && Npc_KnowsInfo(other,dia_lee_doaboutbennet) && (DIA_LEE_ANYNEWS_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_anynews_info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//Any news about Bennet?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//At least he doesn't seem to have suffered any lasting damage in jail.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//Good work.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//No, we still don't know enough.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "What has happened in the meantime?";
};


func int dia_lee_sylvio_condition()
{
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_sylvio_info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//What has happened in the meantime?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//Sylvio, the bastard, has heard about the dragons in the Valley of Mines and has made everyone here on the farm totally crazy about it.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//He's tried to convince the boys to follow him to the Valley of Mines. He's promised them fame, honor, gold and all sorts of things.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//A lot of them have no interest in getting killed for Sylvio, but there were quite a few idiots who fell for his drivel.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//The end of the story is that they got outfitted by Bennet and then set off.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(dismissively) Ah. Basically, I'm glad that Sylvio is finally gone from the farm.
};


instance DIA_LEE_KAP4_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap4_exit_condition;
	information = dia_lee_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_CANTEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_canteach_condition;
	information = dia_lee_canteach_info;
	permanent = TRUE;
	description = "Could you train me?";
};


func int dia_lee_canteach_condition()
{
	if((KAPITEL >= 4) && (LEE_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_canteach_info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//Can you train me?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//I can show you how to fight with a two-hander.
	if(other.hitchance[NPC_TALENT_2H] < 75)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//But I don't have the time to teach you the basics as well.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//As soon as you have reached a certain level of skill, I'll take you in hand. Until then, you'll have to find another teacher.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//I've heard you're pretty good. But I bet I can still teach you a thing or two.
		if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			LEE_TEACHPLAYER = TRUE;
			Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
			b_logentry(TOPIC_SOLDIERTEACHER,"Lee will teach me to wield two-handed weapons.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//So, if you want, I can teach you something. That'll cost you a bit, though.
			AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//How much?
			AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 gold pieces and we're in business.
			Info_ClearChoices(dia_lee_canteach);
			Info_AddChoice(dia_lee_canteach,"That's too expensive for me.",dia_lee_canteach_no);
			if(Npc_HasItems(other,itmi_gold) >= 1000)
			{
				Info_AddChoice(dia_lee_canteach,"Deal. Here's the gold.",dia_lee_canteach_yes);
			};
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//That's too expensive for me.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//Think about it. Teachers of my caliber are hard to find.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//Deal. Here's the gold.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//All right, I promise you: I'm worth the price.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Lee will teach me to wield two-handed weapons.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "Let's start with the training.";
};


func int dia_lee_teach_condition()
{
	if(LEE_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_teach_info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//Let's start with the training.
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_back()
{
	Info_ClearChoices(dia_lee_teach);
};

func void dia_lee_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//Now you are a real master in two-handed combat.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//You no longer need a teacher.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};

func void dia_lee_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//Now you are a real master in two-handed combat.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//You no longer need a teacher.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_lee_teach_2h_5);
};


instance DIA_LEE_DRACHENEI(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_drachenei_condition;
	information = dia_lee_drachenei_info;
	description = "The lizard people are distributing dragon eggs all over the country.";
};


func int dia_lee_drachenei_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_lee_drachenei_info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//The lizard people are distributing dragon eggs all over the country.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//I might have known. It's time we got out of here.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//So what am I supposed to do with them?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//Smash them. What else?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//Maybe the shells can be used for making armor or something like that.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//They look pretty stable. Talk to Bennet about it.
		b_logentry(TOPIC_DRACHENEIER,"There wasn't much Lee could do with the dragon egg. He sent me to Bennet the smith.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "How's it going on the farm?";
};


func int dia_lee_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//How's it going on the farm?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//Well, since Sylvio left, we've finally had some peace around here.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//That doesn't sound too bad.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//Unfortunately, we don't have less work. The men are becoming more and more discontent, because they now have to do the work of Sylvio's men on top of their own.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//But let me worry about that. I can handle it.
};


instance DIA_LEE_KAP5_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap5_exit_condition;
	information = dia_lee_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lee_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_GETSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_getship_condition;
	information = dia_lee_getship_info;
	description = "Do you have an idea how I could take over the paladins' ship?";
};


func int dia_lee_getship_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_getship_info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//Do you have an idea how I could take over the paladins' ship?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//Do you think I'd still be here if I did? That thing is better guarded than the ore transports were in the Old Camp.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//There must be a way to get on the ship.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//Sure. Getting on board is easy.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//After all, we have the judge in our power. You should go to him and squeeze a letter of authorization for the ship out of him.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"Lee reckons the best way to get aboard the paladins' ship is to obtain a letter of authorization from the judge. But he's not likely to give me one of his own free will.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//I have a forged letter of authorization here. With that the ship's guards will let you pass.
		b_logentry(TOPIC_SHIP,"Good old Lee. He's got a forged letter that will enable me to board the paladins' ship.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//But that isn't everything. To navigate the ship, you need a captain, a crew and so on.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//There's a whole string of requirements involved.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"Who should I hire as a crew?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"Do you know anyone who could navigate the ship?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//Do you know anyone who could navigate the ship?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//As far as I know, Torlof used to go to sea. He knows what's what.
	b_logentry(TOPIC_CAPTAIN,"Torlof is an old sailor, maybe he wants to be my captain.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//Who should I hire as a crew?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//You'll have to decide that for yourself. But I would only take people that I trust. Do you have enough people you can trust?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//If you need a smith in your crew, you should ask Bennet. He is certainly the best you'll find.
	b_logentry(TOPIC_CREW,"As for my crew, there wasn't much Lee could do for me there. But he did say I should only take people I can trust. Also, I'm to ask Bennet, he might be interested.");
};

func void dia_lee_getship_back()
{
	Info_ClearChoices(dia_lee_getship);
};


instance DIA_LEE_GOTRICHTERSPERMISSIONFORSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_gotrichterspermissionforship_condition;
	information = dia_lee_gotrichterspermissionforship_info;
	description = "The written authorization did the trick.";
};


func int dia_lee_gotrichterspermissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_gotrichterspermissionforship_info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//The written authorization did the trick. The ship's mine now. The judge was very cooperative.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//Well. Your long period of humiliation with the bastard has finally paid off.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "I want to steal the ship.";
};


func int dia_lee_stealship_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_getship) && (hero.guild == GIL_DJG) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_lee_stealship_info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//I want to steal the ship.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//And how is that supposed to happen?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//Piece of cake - I go there, show them your papers, and take the ship.
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//If you say so. Here, I hope you know what you're doing.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
};


instance DIA_LEE_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_knowwhereenemy_condition;
	information = dia_lee_knowwhereenemy_info;
	permanent = TRUE;
	description = "Would you accompany me on the ship?";
};


func int dia_lee_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LEE_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_lee_getship))
	{
		return TRUE;
	};
};

func void dia_lee_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//Would you accompany me on the ship?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//Are you kidding? Of course I'm in. I have a few old scores to settle on the mainland.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//Besides, I can teach you one and two-handed combat. I could be very useful to you.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Lee's eager to see the mainland again. He's offered to support me. I'd be hard put to find as good a combat trainer as he is anywhere else.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//The ship is full now, but I'll be back if there is an opening.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"I'll let you know if I can use you.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"Go pack your things, then!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//Go pack your things, then!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//What? Right now?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//Yes, I'm planning to get out of here, and if you want to join me, come down to the harbor. We'll meet at the ship.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//I've waited a long time for this moment. I'll be there.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LEE_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lee_knowwhereenemy);
};

func void dia_lee_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//I'll let you know if I can use you.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//You must know what you want. But you can never have enough good fighters around.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(grins) Unless they're utter morons like Sylvio.
	LEE_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lee_knowwhereenemy);
};


instance DIA_LEE_LEAVEMYSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leavemyship_condition;
	information = dia_lee_leavemyship_info;
	permanent = TRUE;
	description = "I can't use you after all!";
};


func int dia_lee_leavemyship_condition()
{
	if((LEE_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//I can't use you after all!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//Suit yourself, you know where to find me!
	LEE_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LEE_STILLNEEDYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stillneedyou_condition;
	information = dia_lee_stillneedyou_info;
	permanent = TRUE;
	description = "I can use you after all!";
};


func int dia_lee_stillneedyou_condition()
{
	if(((LEE_ISONBOARD == LOG_OBSOLETE) || (LEE_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lee_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//I can use you after all!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//I knew you needed me! I'll see you on the ship.
		LEE_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//You know what, screw you. First you say I should come, then you send me away again.
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//Find yourself another idiot!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_KAP6_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap6_exit_condition;
	information = dia_lee_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lee_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

