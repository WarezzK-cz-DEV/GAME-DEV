
instance DIA_PARCIVAL_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_exit_condition;
	information = dia_parcival_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_SCHURFER(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_schurfer_condition;
	information = dia_parcival_schurfer_info;
	permanent = FALSE;
	description = "What can you tell me about the scrapers?";
};


func int dia_parcival_schurfer_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_schurfer_info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//What can you tell me about the scrapers?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//I assembled the three groups.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Marcos, Fajeth and Silvestro are the paladins who each lead a group.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Marcos' group set out in the direction of an old mine - led by an old digger named Grimes.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//The other two groups set out together.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Jergan, one of our scouts, has reported that they set up camp near a large tower.
	b_logentry(TOPIC_SCOUTMINE,"The scraper troops are each led by a paladin. Marcos, Fajeth and Silvestro.");
	b_logentry(TOPIC_SCOUTMINE,"Marcos' group went towards what used to be the old mine. Their scout is the digger Grimes.");
	b_logentry(TOPIC_SCOUTMINE,"The other two groups set out together. They've set up camp near a large tower.");
};


instance DIA_PARCIVAL_DIEGO(C_INFO)
{
	npc = pal_252_parcival;
	nr = 9;
	condition = dia_parcival_diego_condition;
	information = dia_parcival_diego_info;
	permanent = FALSE;
	description = "Which group of scrapers did Diego go with?";
};


func int dia_parcival_diego_condition()
{
	if((SEARCHFORDIEGO == LOG_RUNNING) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_diego_info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//Which group of scrapers did Diego go with?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//This convict - Diego? He's with paladin Silvestro's group.
	b_logentry(TOPIC_SCOUTMINE,"Diego's with the scrapers who are being led by the paladin Silvestro.");
};


instance DIA_PARCIVAL_WEG(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_weg_condition;
	information = dia_parcival_weg_info;
	permanent = FALSE;
	description = "Do you know how to get to the mining sites?";
};


func int dia_parcival_weg_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_weg_info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Do you know how to get to the mining sites?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//There's no safe way into that valley. But it seems to make sense to me not to take the direct route.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Keep away from the orcs and the woods - and may Innos protect you.
	b_logentry(TOPIC_SCOUTMINE,"It would seem wiser not to take a direct route to the scrapers. I should avoid woods and orcs in particular.");
};


instance DIA_PARCIVAL_DRAGON(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragon_condition;
	information = dia_parcival_dragon_info;
	description = "How are things?";
};


func int dia_parcival_dragon_condition()
{
	return TRUE;
};

func void dia_parcival_dragon_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//How's the situation?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//The camp is surrounded by orcs. They've really dug themselves in.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//But even more alarming are the attacks by the dragons. They have destroyed the entire outer ring by now.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Another dragon attack and we'll take heavy losses.
};


instance DIA_PARCIVAL_DRAGONS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragons_condition;
	information = dia_parcival_dragons_info;
	description = "How many dragons are there?";
};


func int dia_parcival_dragons_condition()
{
	if(Npc_KnowsInfo(hero,dia_parcival_dragon) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_dragons_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//How many dragons are there?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//We don't know how many there are all in all, but it's more than one.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//But that isn't all. The whole Valley of Mines is full of evil creatures that support the dragons.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Let's not kid ourselves - without reinforcements from outside, our chances of getting out of here alive are slim.
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_BRAVE(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_brave_condition;
	information = dia_parcival_brave_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_brave_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_parcival_dragons) && (KAPITEL < 3) && (PARCIVAL_BRAVE_LABERCOUNT <= 6))
	{
		return TRUE;
	};
};


var int parcival_brave_labercount;

func void dia_parcival_brave_info()
{
	var int randy;
	if(PARCIVAL_BRAVE_LABERCOUNT < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Everything is still quiet. But that can change quickly.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//We'll stand firm for as long as we can.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Innos will aid us. His light illuminates our hearts!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Hey! Don't you have anything better to do than constantly chatter at me? Beat it!
		b_giveplayerxp(XP_AMBIENT);
	};
	PARCIVAL_BRAVE_LABERCOUNT = PARCIVAL_BRAVE_LABERCOUNT + 1;
};


instance DIA_PARCIVAL_KAP3_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap3_exit_condition;
	information = dia_parcival_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parcival_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ALLESKLAR(C_INFO)
{
	npc = pal_252_parcival;
	nr = 31;
	condition = dia_parcival_allesklar_condition;
	information = dia_parcival_allesklar_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_parcival_allesklar_condition()
{
	if((KAPITEL == 3) && (DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER < 3) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};


var int dia_parcival_allesklar_nervcounter;

func void dia_parcival_allesklar_info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Everything all right?
	if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Up to now!
	}
	else if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Yeah, damnit.
	}
	else if(PARCIVAL_BRAVE_LABERCOUNT > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(laughs) Ah. Now I understand what you've got in mind. No, my friend. Not this time.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Don't bug me.
	};
	DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER = DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER + 1;
};


instance DIA_PARCIVAL_KAP4_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap4_exit_condition;
	information = dia_parcival_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parcival_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ANYNEWS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_anynews_condition;
	information = dia_parcival_anynews_info;
	description = "Did anything important happen?";
};


func int dia_parcival_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_anynews_info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Did anything important happen?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//You belong to those scum who call themselves Dragon hunters?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Really, I had expected that you had more honor in you than to join up with those people.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//I'm worried. Very worried.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//What for?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Recently these men showed up. They call themselves Dragon hunters.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//As far as I'm concerned, they're nothing but idlers and criminals.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//If it were up to me, I'd chase them all out of the castle. Let the orcs take care of them.
	Info_ClearChoices(dia_parcival_anynews);
	Info_AddChoice(dia_parcival_anynews,"Unlike Lord Hagen, they are here.",dia_parcival_anynews_lordhagen);
	Info_AddChoice(dia_parcival_anynews,"You should give them a chance.",dia_parcival_anynews_chance);
	Info_AddChoice(dia_parcival_anynews,"Don't you think you're exaggerating?",dia_parcival_anynews_overact);
};

func void dia_parcival_anynews_lordhagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Unlike Lord Hagen, they are here.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(laughs bitterly) Yes, unfortunately they're all we have.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Innos is putting us through a very hard test indeed.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//You should give them a chance.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//They're getting one. Unfortunately.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Garond is convinced they can be of help to us.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//But I'll keep an eye on them. We have enough problems with the orcs, we really don't need more trouble.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Don't you think you're exaggerating?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//Absolutely not. In our situation we need men who set a shining example.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Warriors to wake the fire of Innos in our fighters' hearts.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//Instead, these scum destroy the morale of my warriors.
};


instance DIA_PARCIVAL_JAN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_jan_condition;
	information = dia_parcival_jan_info;
	permanent = FALSE;
	description = "I need to talk to you about Jan.";
};


func int dia_parcival_jan_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_jan_info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//I need to talk to you about Jan.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Jan? Who's that?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//A Dragon hunter. He's a blacksmith.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//Oh, yes, I remember. What about him?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//He wants to work in the smithy.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Out of the question. He isn't one of us and I don't trust him.
};


instance DIA_PARCIVAL_THINKAGAIN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_thinkagain_condition;
	information = dia_parcival_thinkagain_info;
	permanent = TRUE;
	description = "Can't you reconsider the matter with Jan?";
};


func int dia_parcival_thinkagain_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_parcival_thinkagain_info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Can't you reconsider the matter with Jan?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//No, my decision is firm.
};


instance DIA_PARCIVAL_TALKEDGAROND(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_talkedgarond_condition;
	information = dia_parcival_talkedgarond_info;
	description = "Garond wants Jan to take over the smithy.";
};


func int dia_parcival_talkedgarond_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_talkedgarond_info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Garond wants Jan to take over the smithy.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Mmh. If that's so, then as far as I'm concerned he can have the smithy.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//Even if I do think it's a mistake to trust this Jan.
};


instance DIA_PARCIVAL_PERMKAP4(C_INFO)
{
	npc = pal_252_parcival;
	nr = 43;
	condition = dia_parcival_permkap4_condition;
	information = dia_parcival_permkap4_info;
	permanent = TRUE;
	description = "And apart from that?";
};


func int dia_parcival_permkap4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_anynews))
	{
		return TRUE;
	};
};

func void dia_parcival_permkap4_info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//And apart from that?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Aah, leave me alone!
};


instance DIA_PARCIVAL_KAP5_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap5_exit_condition;
	information = dia_parcival_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parcival_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_VERRAETER(C_INFO)
{
	npc = pal_252_parcival;
	condition = dia_parcival_verraeter_condition;
	information = dia_parcival_verraeter_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_verraeter_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_parcival_verraeter_info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Traitor! I know for certain that it was YOU who opened the gate.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//You'll pay for that.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_PICKPOCKET(C_INFO)
{
	npc = pal_252_parcival;
	nr = 900;
	condition = dia_parcival_pickpocket_condition;
	information = dia_parcival_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_parcival_pickpocket_condition()
{
	return c_beklauen(84,460);
};

func void dia_parcival_pickpocket_info()
{
	Info_ClearChoices(dia_parcival_pickpocket);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_BACK,dia_parcival_pickpocket_back);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_PICKPOCKET,dia_parcival_pickpocket_doit);
};

func void dia_parcival_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parcival_pickpocket);
};

func void dia_parcival_pickpocket_back()
{
	Info_ClearChoices(dia_parcival_pickpocket);
};

