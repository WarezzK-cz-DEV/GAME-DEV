
instance DIA_BENGAR_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_exit_condition;
	information = dia_bengar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_HALLO(C_INFO)
{
	npc = bau_960_bengar;
	nr = 3;
	condition = dia_bengar_hallo_condition;
	information = dia_bengar_hallo_info;
	description = "You're the farmer here?";
};


func int dia_bengar_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_hallo_info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//You're the farmer here?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//You could say so, but I'm really just a tenant.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//All the land here is owned by one big farmer.
};


instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_bengar_wovonlebtihr_condition;
	information = dia_bengar_wovonlebtihr_info;
	description = "How do you make a living?";
};


func int dia_bengar_wovonlebtihr_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_wovonlebtihr_info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//How do you make a living?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//Mostly hunting and the wood we cut. Of course, we also raise sheep and work the land.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//Onar saddles me with all these laborers, and I have to keep them busy somehow. Only a few of them are good hunters, you see?
};


instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 6;
	condition = dia_bengar_tageloehner_condition;
	information = dia_bengar_tageloehner_info;
	description = "You're employing day laborers?";
};


func int dia_bengar_tageloehner_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_tageloehner_info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//You're employing day laborers?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//Onar sends away the workers he can't use on his farm.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//Then he sends them to me. I feed them and they work here for me.
};


instance DIA_ADDON_BENGAR_MISSINGPEOPLE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_missingpeople_condition;
	information = dia_addon_bengar_missingpeople_info;
	description = "Has anything strange happened around here lately?";
};


func int dia_addon_bengar_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_15_00");	//Has anything strange happened around here lately?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_01");	//Many strange things are happening these days.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_02");	//But none as strange as the mysterious disappearance of Pardos.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_10_03");	//He's one of my field workers, and certainly not the kind who would drop everything overnight and slink off just like that, you see.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"The farmer Bengar is missing his field hand, Pardos.");
	MIS_BENGAR_BRINGMISSPEOPLEBACK = LOG_RUNNING;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_bengar_missingpeople);
	Info_AddChoice(dia_addon_bengar_missingpeople,DIALOG_BACK,dia_addon_bengar_missingpeople_back);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Any clues at all?",dia_addon_bengar_missingpeople_hint);
	Info_AddChoice(dia_addon_bengar_missingpeople,"Maybe he was simply fed up.",dia_addon_bengar_missingpeople_voll);
	Info_AddChoice(dia_addon_bengar_missingpeople,"What exactly is so strange about his disappearance?",dia_addon_bengar_missingpeople_was);
};

func void dia_addon_bengar_missingpeople_was()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_00");	//What exactly is so strange about his disappearance?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_01");	//Pardos is such a timid sort - the furthest he's ever been from the farm is to the end of my fields.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_02");	//He would run away at the mere sight of a meatbug.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_03");	//Those things may not be pretty to look at, but you really couldn't call them dangerous.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_was_10_04");	//(disgusted) They say there's people who eat them. Gross.
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_was_15_05");	//You get used to it.
};

func void dia_addon_bengar_missingpeople_voll()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_voll_15_00");	//Maybe he was simply fed up.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_01");	//Working in the fields was his life. I cannot imagine him having gone to work for another farmer.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_voll_10_02");	//With me, he could do whatever he wanted.
};

func void dia_addon_bengar_missingpeople_hint()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Hint_15_00");	//Any clues at all?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_01");	//I think those bandits must have dragged him off. They've been roaming around this area for days now.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_02");	//I once saw them drag a citizen of the town off to their camp.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Hint_10_03");	//It looked like they were going to make him a slave.
	Info_AddChoice(dia_addon_bengar_missingpeople,"Where is this bandit camp?",dia_addon_bengar_missingpeople_lager);
};


var int bengar_toldaboutrangerbandits;

func void dia_addon_bengar_missingpeople_lager()
{
	AI_Output(other,self,"DIA_Addon_Bengar_MissingPeople_Lager_15_00");	//Where is this bandit camp?
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_01");	//At the far end of my fields, some stairs lead down to a small hollow. That's where they have made themselves at home.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_02");	//I'd like to go look for Pardos there, but there's no way I'm going up against those guys.
	AI_Output(self,other,"DIA_Addon_Bengar_MissingPeople_Lager_10_03");	//And you had better give them a wide berth, too. They're not known for their sense of humor.
	BENGAR_TOLDABOUTRANGERBANDITS = TRUE;
};

func void dia_addon_bengar_missingpeople_back()
{
	Info_ClearChoices(dia_addon_bengar_missingpeople);
};


instance DIA_ADDON_BENGAR_RETURNPARDOS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_returnpardos_condition;
	information = dia_addon_bengar_returnpardos_info;
	description = "Has Pardos come back?";
};


func int dia_addon_bengar_returnpardos_condition()
{
	if((MIS_BENGAR_BRINGMISSPEOPLEBACK == LOG_RUNNING) && (Npc_GetDistToWP(pardos_nw,"NW_FARM3_HOUSE_IN_NAVI_2") <= 1100) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_returnpardos_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_00");	//Has Pardos come back?
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_01");	//Yes, he's inside, resting. Thanks for everything you...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_02");	//Never mind.
	AI_Output(self,other,"DIA_Addon_Bengar_ReturnPardos_10_03");	//Wait, I'd love to give you a reward, but I haven't got...
	AI_Output(other,self,"DIA_Addon_Bengar_ReturnPardos_15_04");	//Forget it.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BENGAR_FERNANDOSWEAPONS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_addon_bengar_fernandosweapons_condition;
	information = dia_addon_bengar_fernandosweapons_info;
	description = "Were the bandits carrying weapons when they passed by here?";
};


func int dia_addon_bengar_fernandosweapons_condition()
{
	if((BENGAR_TOLDABOUTRANGERBANDITS == TRUE) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_bengar_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_00");	//Were the bandits carrying weapons when they passed by here?
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_01");	//What kind of a stupid question is that? How would they be bandits if they weren't armed?
	AI_Output(other,self,"DIA_Addon_Bengar_FernandosWeapons_15_02");	//I mean a whole LOAD of weapons. A big delivery.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_03");	//I see. Yes, now that you mention it, they were carrying lots and lots.
	AI_Output(self,other,"DIA_Addon_Bengar_FernandosWeapons_10_04");	//Some in barrels, some in bags, and some on the cart they brought.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 8;
	condition = dia_bengar_rebellieren_condition;
	information = dia_bengar_rebellieren_info;
	description = "What do you think of Onar?";
};


func int dia_bengar_rebellieren_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_rebellieren_info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//What do you think of Onar?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//He's a greedy bastard who will get us all hanged in the end.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//One of these days, the paladins will come out of the city and make us small farmers bleed for what he's doing here.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//But I haven't got a choice. The militiamen only come here to collect and not to defend the farm.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//If I held myself loyal to the city, I'd be very much on my own.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//At least Onar sends some mercenaries now and then to see how we're faring.
};


instance DIA_BENGAR_PALADINE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 9;
	condition = dia_bengar_paladine_condition;
	information = dia_bengar_paladine_info;
	description = "What have you got against the royal troops?";
};


func int dia_bengar_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_bengar_paladine_info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//What have you got against the royal troops?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//It's obvious. There hasn't been any improvement now that the paladins are in the city. Just the opposite.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//Now these cursed militiamen come onto our land even more often and steal everything they can, and the paladins don't do anything about it.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//The only paladins that I've ever seen are the two guards at the pass.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//They wouldn't budge an inch, even if the militia slaughtered us all.
};


instance DIA_BENGAR_PASS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 10;
	condition = dia_bengar_pass_condition;
	information = dia_bengar_pass_info;
	description = "The pass?";
};


func int dia_bengar_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_paladine))
	{
		return TRUE;
	};
};

func void dia_bengar_pass_info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//The pass?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//Yeah. The pass to the old Valley of Mines by the waterfalls at the other end of the high pastures.
	AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//Ask Malak about it. He was there a couple of times last week.
};


instance DIA_BENGAR_MILIZ(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_miliz_condition;
	information = dia_bengar_miliz_info;
	permanent = FALSE;
	description = "I'm supposed to deal with your militia problem.";
};


func int dia_bengar_miliz_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_miliz_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//I'm supposed to deal with your militia problem.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//What? I told Onar he should send a couple of his MERCENARIES.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//This is my chance to prove myself.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//Terrific. Do you know what the militia will do to me if you screw it up?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//Here I was thinking no one would come now.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//I already told Onar days ago. What am I paying my rent for?
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//These bastards come by here once a week and collect the taxes for the city.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//It's a good thing you came just now. This is their usual time.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//They should be here any moment.
};


instance DIA_BENGAR_SELBER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_selber_condition;
	information = dia_bengar_selber_info;
	permanent = FALSE;
	description = "Why don't you just go up against the militia yourself?";
};


func int dia_bengar_selber_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_selber_info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//There's so many of you. Why don't you just go up against the militia yourself?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//It's true that there's a lot of us. But we're not trained fighters like the militia.
};


instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizklatschen_condition;
	information = dia_bengar_milizklatschen_info;
	permanent = FALSE;
	description = "Let the militia come, then, I'll deal with them!";
};


func int dia_bengar_milizklatschen_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_milizklatschen_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//Let the militia come, then, I'll deal with them!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//I can't wait. Here they come now. See, I told you so.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//Just don't screw it up!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//Well then, good luck! You show 'em.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"MilComing");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
	{
		Npc_ExchangeRoutine(rumbold,"MilComing");
		AI_ContinueRoutine(rumbold);
	};
};


var int bengar_milsuccess;

instance DIA_BENGAR_MILIZWEG(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizweg_condition;
	information = dia_bengar_milizweg_info;
	permanent = TRUE;
	description = "Your militia problem is a thing of the past.";
};


func int dia_bengar_milizweg_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
	{
		if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bengar_milizweg_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//Your militia problem is a thing of the past.
	if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//Are you crazy? Do you know what those guys will do to me when you're gone?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//They're still standing around over there. Tell them they should disappear COMPLETELY!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//Not bad. Maybe there'll be something left over at the end of the month now for a change. Thanks.
		if(RUMBOLD_BEZAHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//You even wanted to pay for me. That's very decent of you.
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
		}
		else
		{
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
		};
		BENGAR_MILSUCCESS = TRUE;
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_BENGAR_BALTHASAR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 13;
	condition = dia_bengar_balthasar_condition;
	information = dia_bengar_balthasar_info;
	description = "Balthasar the shepherd isn't allowed on your pasture?";
};


func int dia_bengar_balthasar_condition()
{
	if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasar_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//Balthasar the shepherd isn't allowed on your pasture?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//Oh, yes. The story. I told him Sekob should pay me money if he wanted to lead the sheep to my pasture.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//To tell the truth, that's only harassment. I just can't stand Balthasar.
	b_logentry(TOPIC_BALTHASARSSCHAFE,"If I want to persuade Bengar to let Balthasar back on his pastures, I'm going to have to do him a favor. I'm sure an opportunity will present itself.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 14;
	condition = dia_bengar_balthasardarfaufweide_condition;
	information = dia_bengar_balthasardarfaufweide_info;
	description = "The militia are gone, and Balthasar can use your land again.";
};


func int dia_bengar_balthasardarfaufweide_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (BENGAR_MILSUCCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasardarfaufweide_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//The militia are gone, and Balthasar can use your land again.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//Why?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(threatening) Because I said so.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//Mmh. All right, whatever you say.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//Let him find a place for his beasts somewhere behind the field.
	MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_PERMKAP1(C_INFO)
{
	npc = bau_960_bengar;
	nr = 15;
	condition = dia_bengar_permkap1_condition;
	information = dia_bengar_permkap1_info;
	permanent = TRUE;
	description = "Take care.";
};


func int dia_bengar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_permkap1_info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//Take care.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//You too.
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap3_exit_condition;
	information = dia_bengar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bengar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_ALLEIN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 30;
	condition = dia_bengar_allein_condition;
	information = dia_bengar_allein_info;
	description = "How are things?";
};


func int dia_bengar_allein_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_bengar_allein_info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//How are things?
	if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//Malak has disappeared and taken everything and everybody who would work for me with him. He said he was headed for the mountains.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//He couldn't stand it here anymore.
		MIS_GETMALAKBACK = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//Times are tough. I don't know how much longer I can hang on.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//The hordes of monsters pouring out of the pass every day to haunt the high pastures are really getting to me.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//If at least I had a few helpers or mercenaries.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//There was even one who was willing to work for me. Changed his mind, though. I think his name was 'Wolf'.
	MIS_BENGARSHELPINGSLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
	b_logentry(TOPIC_BENGARALLEIN,"Bengar's alone on his farm. His pal Malak has gone and taken all the others with him. Bengar thinks he's fled to the mountains.");
	b_logentry(TOPIC_BENGARALLEIN,"His farm is totally unprotected now. He needs help. He said something about a mercenary who goes by the name of Wolf. Don't I know that guy?!");
};


instance DIA_BENGAR_MALAKTOT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_malaktot_condition;
	information = dia_bengar_malaktot_info;
	description = "Malak is dead.";
};


func int dia_bengar_malaktot_condition()
{
	if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_malaktot_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//Malak is dead.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//Then everything will just get even worse.
};


instance DIA_BENGAR_SLDDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_sldda_condition;
	information = dia_bengar_sldda_info;
	description = "I found you the mercenary you wanted.";
};


func int dia_bengar_sldda_condition()
{
	if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_sldda_info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//I found you the mercenary you wanted.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//I've never seen anyone like that on my farm. I can only hope it will work out.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//Here, take this. I think you'll find it useful.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};


instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 35;
	condition = dia_bengar_malakwiederda_condition;
	information = dia_bengar_malakwiederda_info;
	description = "Malak is back.";
};


func int dia_bengar_malakwiederda_condition()
{
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_malakwiederda_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//Malak is back.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//It's about time. I thought I'd never see him again.
	b_giveplayerxp(XP_GETMALAKBACK);
};


instance DIA_BENGAR_PERM(C_INFO)
{
	npc = bau_960_bengar;
	nr = 80;
	condition = dia_bengar_perm_condition;
	information = dia_bengar_perm_info;
	permanent = TRUE;
	description = "It'll be all right.";
};


func int dia_bengar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_bengar_perm_info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//It'll be all right.
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//Malak is here again, but the situation has hardly changed.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//Unless a miracle happens, all of us here will be wiped out.
	}
	else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//Wolf is a strange fellow, but I think it will work somehow.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//Without Malak, nothing gets done around here anymore. If something doesn't happen soon, I'll have to give up my farm.
		if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//Hopefully, he'll come back soon.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
	{
		b_startotherroutine(sld_815_soeldner,"Start");
		b_startotherroutine(sld_817_soeldner,"Start");
	};
};


instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap4_exit_condition;
	information = dia_bengar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bengar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap5_exit_condition;
	information = dia_bengar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bengar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap6_exit_condition;
	information = dia_bengar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_bengar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
	npc = bau_960_bengar;
	nr = 900;
	condition = dia_bengar_pickpocket_condition;
	information = dia_bengar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bengar_pickpocket_condition()
{
	return c_beklauen(28,50);
};

func void dia_bengar_pickpocket_info()
{
	Info_ClearChoices(dia_bengar_pickpocket);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};

func void dia_bengar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bengar_pickpocket);
};

func void dia_bengar_pickpocket_back()
{
	Info_ClearChoices(dia_bengar_pickpocket);
};

