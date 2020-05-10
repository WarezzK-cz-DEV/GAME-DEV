
instance DIA_ADDON_SATURAS_EXIT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 999;
	condition = dia_addon_saturas_exit_condition;
	information = dia_addon_saturas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_saturas_exit_condition()
{
	return TRUE;
};

func void dia_addon_saturas_exit_info()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_01");	//Since there's no way of stopping you from keeping the other Mages from doing their work, you might as well take a message from me to one of them.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_02");	//Tell Riordian that I wish to see him here.
		AI_Output(self,other,"DIA_Addon_Saturas_auftrag_14_03");	//He is in the rear part of the vault. You will find him there.
		MIS_ADDON_SATURAS_BRINGRIORDIAN2ME = LOG_RUNNING;
		Log_CreateTopic(TOPIC_ADDON_HOLRIORDIAN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_HOLRIORDIAN,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_HOLRIORDIAN,"Saturas wants me to send the Water Mage Riordian to him. He should be in the rear area of the vaults at the excavation site.");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_NEFARIUS(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 2;
	condition = dia_addon_saturas_nefarius_condition;
	information = dia_addon_saturas_nefarius_info;
	description = "I am supposed to find the lost parts of the ornament for Nefarius.";
};


func int dia_addon_saturas_nefarius_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_nefarius_info()
{
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_00");	//I am supposed to find the lost parts of the ornament for Nefarius.
	AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_01");	//What? That is unbelievable! You are involved again?
	AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_02");	//Don't worry, I'll bring the things here.
	if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_HasItems(other,itwr_map_newworld_ornaments_addon))
	{
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_03");	//(sighs) Do you at least know what you are looking for?
		AI_Output(other,self,"DIA_ADDON_Saturas_Nefarius_15_04");	//Nefarius gave me this map...
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_05");	//Show me!
		b_usefakescroll();
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_06");	//Hmmm. It is very dangerous in the big forest. You should not go alone.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_07");	//Look for someone to accompany you in Khorinis.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_08");	//I do not want you eaten by monsters - and the ornament with you.
		AI_Output(self,other,"DIA_ADDON_Saturas_Nefarius_14_09");	//Here is your map back...
		Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas says I shouldn't go alone when I search for one of the ornament fragments in the big woods. I should go to Khorinis and look for someone to accompany me.");
	};
};


instance DIA_ADDON_SATURAS_HALLO(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 2;
	condition = dia_addon_saturas_hallo_condition;
	information = dia_addon_saturas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_hallo_condition()
{
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,gobbo_skeleton,zs_mm_attack,-1) == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_hallo_weiﬂtdu()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiﬂtdu_14_00");	//Do you have the slightest idea what you have done?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiﬂtdu_14_01");	//You have confused the structure of magic so much that it could be heard back in Khorinis.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiﬂtdu_14_02");	//Count yourself lucky that the Barrier simply collapsed one day.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_weiﬂtdu_15_03");	//What are you complaining about? It all worked out all right.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiﬂtdu_14_04");	//(ranting) Mind your tongue!
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_weiﬂtdu_14_05");	//(boiling) What the blazes do you want here anyway?
	Info_ClearChoices(dia_addon_saturas_hallo);
};

func void dia_addon_saturas_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_00");	//Are you mad? Get out of here.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_01");	//It is too dangerous in these vaults for a would-be adventurer.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_02");	//(annoyed) But say, don't I know you? Of course. You bastard...
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_14_03");	//(annoyed) Don't think that I have forgotten how you betrayed us in the New Camp.
	Info_ClearChoices(dia_addon_saturas_hallo);
	Info_AddChoice(dia_addon_saturas_hallo,"(embarrassed) I...",dia_addon_saturas_hallo_video);
};

func void dia_addon_saturas_hallo_video()
{
	PlayVideo("oreheap.bik");
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_00");	//(annoyed) You drained our mound of ore of all magic power and then simply disappeared!
	AI_Output(self,other,"DIA_Addon_Saturas_Video_14_01");	//(annoyed) What exactly did you think you were doing?
	Info_ClearChoices(dia_addon_saturas_hallo);
	Info_AddChoice(dia_addon_saturas_hallo,"I'm sorry. I didn't know what I was doing.",dia_addon_saturas_hallo_sorry);
	Info_AddChoice(dia_addon_saturas_hallo,"Your plan wouldn't have worked anyway.",dia_addon_saturas_hallo_spott);
	Info_AddChoice(dia_addon_saturas_hallo,"It was necessary.",dia_addon_saturas_hallo_notwendig);
};

func void dia_addon_saturas_hallo_notwendig()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_notwendig_15_00");	//It was necessary. Without the power of the ore, I could never have defeated the Sleeper.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_notwendig_14_01");	//(angry) What sort of drivel is that? Sleeper? Defeated?
	dia_addon_saturas_hallo_weiﬂtdu();
};

func void dia_addon_saturas_hallo_spott()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_00");	//Your plan wouldn't have worked anyway. Blowing up the Barrier with the ore mound is the biggest nonsense I ever heard.
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_Spott_15_01");	//Ultimately, you would have blown yourselves sky high.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_02");	//(angry) That is the limit! Who gave you the right to judge us and our intentions?
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_Spott_14_03");	//If I were not such a peaceful man, I would bring down the wrath of Adanos on you, my boy.
	dia_addon_saturas_hallo_weiﬂtdu();
};

func void dia_addon_saturas_hallo_sorry()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Hallo_sorry_15_00");	//I'm sorry. I didn't know what I was doing.
	AI_Output(self,other,"DIA_Addon_Saturas_Hallo_sorry_14_01");	//Oh? And you think that settles it?
	dia_addon_saturas_hallo_weiﬂtdu();
};


instance DIA_ADDON_SATURAS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_keineahnung_condition;
	information = dia_addon_saturas_keineahnung_info;
	description = "I haven't a clue.";
};


func int dia_addon_saturas_keineahnung_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == 0)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_keineahnung_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_keineAhnung_15_00");	//I have no idea. I thought I'd just drop in.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_01");	//You are wasting my time. Begone from here.
	AI_Output(self,other,"DIA_Addon_Saturas_keineAhnung_14_02");	//(to himself) I shall deal with you later.
	Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KDW,"I have found the Water Mages at their excavation site. First I have to find out what the boys are actually doing here. Saturas was not prepared to tell me. He is still really uptight about the old stories from the penal colony.");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_RAUS(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_raus_condition;
	information = dia_addon_saturas_raus_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_saturas_raus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_keineahnung) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == 0) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_raus_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_raus_14_00");	//Begone from here before something happens to you.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_LARES(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_lares_condition;
	information = dia_addon_saturas_lares_info;
	description = "I came here with Lares.";
};


func int dia_addon_saturas_lares_condition()
{
	if(LARES_ANGEKOMMEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lares_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_00");	//I came here with Lares.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_01");	//(concerned) Lares? Really? Where is he?
	AI_Output(other,self,"DIA_Addon_Saturas_Lares_15_02");	//I am alone. Lares went back to the city.
	AI_Output(self,other,"DIA_Addon_Saturas_Lares_14_03");	//What? And he sent you to us alone? What was he thinking?
};


instance DIA_ADDON_SATURAS_ORNAMENT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_ornament_condition;
	information = dia_addon_saturas_ornament_info;
	description = "I brought your ornament.";
};


func int dia_addon_saturas_ornament_condition()
{
	if((Npc_HasItems(other,itmi_ornament_addon_vatras) && (LARES_ANGEKOMMEN == FALSE)) || ((LARES_ANGEKOMMEN == TRUE) && Npc_KnowsInfo(other,dia_addon_saturas_lares) && Npc_HasItems(other,itmi_ornament_addon_vatras)))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_00");	//I brought your ornament.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_ADD_14_00");	//What in all the world is that supposed to mean?
	if(LARES_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_01");	//Who gave you that? Don't tell me that Lares simply handed it over to you.
	};
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_02");	//Come off it now. I brought it to you. You do want it, don't you?
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_03");	//Certainly. But it disturbs me that YOU have your hand in the game once again.
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_04");	//Why are you making such a big deal about that old business with the ore mound?
	AI_Output(other,self,"DIA_Addon_Saturas_Ornament_15_05");	//After all, I already worked for you back then. And you can't say that I was unreliable.
	AI_Output(self,other,"DIA_Addon_Saturas_Ornament_14_06");	//(sighs) And what did it ultimately get me? Mpfh, just don't think that I trust you...
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_SUCCESS;
	Wld_InsertNpc(bloodfly,"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc(giant_bug,"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc(lurker,"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_TROLLAREA_MONSTER_01_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(scavenger,"NW_TAVERNE_BIGFARM_MONSTER_01");
	Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(scavenger,"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc(gobbo_green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(gobbo_green,"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc(gobbo_green,"NW_CITY_TO_FARM2_02");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc(giant_rat,"NW_TROLLAREA_RATS_01");
};


instance DIA_ADDON_SATURAS_GEHEIMBUND(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_geheimbund_condition;
	information = dia_addon_saturas_geheimbund_info;
	description = "I want to join the 'Ring of Water'.";
};


func int dia_addon_saturas_geheimbund_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SC_KNOWSRANGER == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_geheimbund_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_00");	//I want to join the 'Ring of Water'.
	if(LARES_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_01");	//(furious) WHAT? How do you know about that? Who...? LARES... I will kill him!
		AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_02");	//He has broken our first rule. Speak to no one about the 'Ring of Water'.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_03");	//(completely done in) I don't know what I should say. I only trust you where I can keep an eye on you.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_04");	//It was Vatras who told me about the Ring.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_05");	//(resigned) What? Vatras? (sarcastically) Wonderful! Of all the Water Mages on the island, you run into the who DOESN'T know you.
	AI_Output(self,other,"DIA_Addon_Saturas_geheimbund_14_06");	//I'm warning you, don't do anything stupid this time.
	AI_Output(other,self,"DIA_Addon_Saturas_geheimbund_15_07");	//(drily) I'll make an effort...
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Saturas is not prepared to let me into the 'Ring of Water'. He will leave the decision to Vatras.");
};


instance DIA_ADDON_SATURAS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_wasmachstdu_condition;
	information = dia_addon_saturas_wasmachstdu_info;
	description = "What are you doing down here?";
};


func int dia_addon_saturas_wasmachstdu_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_wasmachstdu_15_00");	//What are you doing down here?
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_01");	//(reverently) These halls conceal ancient secrets. Mysterious secrets.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_02");	//The inscriptions and murals indicate a very ancient culture.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_03");	//Everything you can see here is written in a language completely unknown to us.
	AI_Output(self,other,"DIA_Addon_Saturas_wasmachstdu_14_04");	//We are only just beginning to learn it and grasp its meaning.
};


instance DIA_ADDON_SATURAS_ERDBEBEN(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 6;
	condition = dia_addon_saturas_erdbeben_condition;
	information = dia_addon_saturas_erdbeben_info;
	description = "What sort of strange earthquakes are those?";
};


func int dia_addon_saturas_erdbeben_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_saturas_wasmachstdu) && Npc_KnowsInfo(other,dia_addon_merdarion_bedrohung))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_erdbeben_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Erdbeben_15_00");	//What sort of strange earthquakes are those?
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_01");	//That is one of the puzzles I am trying to solve.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_02");	//The structure of magic is being disturbed somewhere behind these mountains.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_03");	//Quite obviously, someone is trying with all his might to break a powerful magic.
	AI_Output(self,other,"DIA_Addon_Saturas_Erdbeben_14_04");	//I fear it will not be long before the entire island is plagued by these tremors.
};


instance DIA_ADDON_SATURAS_WHATSORNAMENT(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_whatsornament_condition;
	information = dia_addon_saturas_whatsornament_info;
	description = "Why is this ornament so important to you?";
};


func int dia_addon_saturas_whatsornament_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SC_KNOWSORNAMENT == FALSE) && (RITUALRINGRUNS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_whatsornament_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatsOrnament_15_00");	//Why is this ornament so important to you?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_01");	//(annoyed) It is the key to a portal.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatsOrnament_14_02");	//I shall not tell you more.
};


instance DIA_ADDON_SATURAS_SCRANGER(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_scranger_condition;
	information = dia_addon_saturas_scranger_info;
	permanent = TRUE;
	description = "I belong to the 'Ring of Water' now.";
};


func int dia_addon_saturas_scranger_condition()
{
	if((SATURASKNOWS_SC_ISRANGER == FALSE) && (SC_ISRANGER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_scranger_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Saturas_ScRanger_15_00");	//I belong to the 'Ring of Water' now.
	itm = Npc_GetEquippedArmor(other);
	if(((SCISWEARINGRANGERRING == TRUE) && (RANGERRINGISLARESRING == FALSE)) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE))
	{
		if(Hlp_IsItem(itm,itar_ranger_addon) == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_01");	//As I see, you wear the armor of our children.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_02");	//As I see, you bear our secret sign. The aquamarine ring.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_03");	//And I see in your eyes that you speak the truth.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_04");	//(mumbling) Very well. I shall accept your entrance into our ranks.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_05");	//But bear in mind that this comes with a great responsibility.
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_06");	//And I hope for your sake that you will do it justice.
		SATURASKNOWS_SC_ISRANGER = TRUE;
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Saturas has accepted my joining the 'Ring of Water'.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_07");	//And how can I tell that you are one of us now?
		if(RANGERRINGISLARESRING == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_08");	//The aquamarine ring that you carry belongs to Lares. I can see that.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_ScRanger_14_09");	//You are trying to trick me, aren't you? I expected nothing else.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_SATURAS_OPENPORTAL(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 5;
	condition = dia_addon_saturas_openportal_condition;
	information = dia_addon_saturas_openportal_info;
	permanent = TRUE;
	description = "Give me the ring. I shall open the portal.";
};


var int dia_addon_saturas_openportal_noperm;

func int dia_addon_saturas_openportal_condition()
{
	if((RITUALRINGRUNS == LOG_SUCCESS) && (DIA_ADDON_SATURAS_OPENPORTAL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_openportal_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_00");	//Give me the ring. I shall open the portal.
	if(SATURASKNOWS_SC_ISRANGER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_01");	//(slyly) Good! As a new member of our children, you should be granted this honor.
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_02");	//However, I am still waiting for a message from Vatras. Until I receive it, we cannot go.
		if((RANGERMEETINGRUNNING == LOG_SUCCESS) && (Npc_HasItems(other,itwr_vatras2saturas_findraven) || Npc_HasItems(other,itwr_vatras2saturas_findraven_opened)))
		{
			AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_03");	//I HAVE a message from Vatras for you.
			b_giveinvitems(other,self,itwr_vatras2saturas_findraven,Npc_HasItems(other,itwr_vatras2saturas_findraven));
			b_giveinvitems(other,self,itwr_vatras2saturas_findraven_opened,Npc_HasItems(other,itwr_vatras2saturas_findraven_opened));
			b_usefakescroll();
			if(VATRAS2SATURAS_FINDRAVEN_OPEN == TRUE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_04");	//(annoyed) I see. And of course you couldn't restrain yourself and you absolutely had to open it, yes?
				AI_Output(other,self,"DIA_Addon_Saturas_OpenPortal_15_05");	//Well, uhh...
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_06");	//(threatening) I hope for your sake that my still very delicate trust in you will not be shaken.
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_07");	//(amazed) Very interesting. All right.
				b_giveplayerxp(XP_AMBIENT);
			};
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_08");	//Here, take the ring. We shall gather at the portal and wait for you.
			CreateInvItems(self,itmi_portalring_addon,1);
			b_giveinvitems(self,other,itmi_portalring_addon,1);
			AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_09");	//If Nefarius is right, the portal will open as soon as you insert the ring there.
			DIA_ADDON_SATURAS_OPENPORTAL_NOPERM = TRUE;
			b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas gave me the ornamental ring. I'm now supposed to insert it into the mechanism in the portal and go through the portal.");
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"OpenPortal");
			b_startotherroutine(kdw_1401_addon_cronos_nw,"OpenPortal");
			b_startotherroutine(kdw_1402_addon_nefarius_nw,"OpenPortal");
			b_startotherroutine(kdw_1403_addon_myxir_nw,"OpenPortal");
			b_startotherroutine(kdw_1404_addon_riordian_nw,"OpenPortal");
			b_startotherroutine(kdw_1405_addon_merdarion_nw,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_OpenPortal_14_10");	//As long as Vatras has not given me a clear sign that you are to be trusted, I shall keep the ring myself.
		SATURAS_WILLVERTRAUENSBEWEIS = TRUE;
		b_logentry(TOPIC_ADDON_ORNAMENT,"Saturas won't give me the ring as long as he hasn't had a sign from Vatras that I can be trusted.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_SATURAS_PERM(C_INFO)
{
	npc = kdw_1400_addon_saturas_nw;
	nr = 99;
	condition = dia_addon_saturas_perm_condition;
	information = dia_addon_saturas_perm_info;
	permanent = TRUE;
	description = "Can you teach me anything about magic?";
};


func int dia_addon_saturas_perm_condition()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME != 0)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PERM_15_00");	//Can you teach me anything about magic?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_01");	//So that you can once again interfere with the magical structure?
	AI_Output(self,other,"DIA_Addon_Saturas_PERM_14_02");	//No. I have no time for such games.
};

