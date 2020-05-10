
instance DIA_GAAN_EXIT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 999;
	condition = dia_gaan_exit_condition;
	information = dia_gaan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int dia_gaan_exit_onetime;

func int dia_gaan_exit_condition()
{
	return TRUE;
};

func void dia_gaan_exit_info()
{
	AI_StopProcessInfos(self);
	if(DIA_GAAN_EXIT_ONETIME == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_GAAN_EXIT_ONETIME = TRUE;
	};
};


instance DIA_ADDON_GAAN_MEETINGISRUNNING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 1;
	condition = dia_addon_gaan_meetingisrunning_condition;
	information = dia_addon_gaan_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_gaan_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_gaan_meetingisrunning_one_time;

func void dia_addon_gaan_meetingisrunning_info()
{
	if(DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_00");	//A fresh face in our midst. Welcome to the 'Ring of Water'.
		DIA_ADDON_GAAN_MEETINGISRUNNING_ONE_TIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Gaan_MeetingIsRunning_03_01");	//Vatras wants to see you. You had better go to him now.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_HALLO(C_INFO)
{
	npc = bau_961_gaan;
	nr = 3;
	condition = dia_gaan_hallo_condition;
	information = dia_gaan_hallo_info;
	description = "You've got a lot of space up here.";
};


func int dia_gaan_hallo_condition()
{
	return TRUE;
};

func void dia_gaan_hallo_info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//You've got a lot of space up here.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//It's nice enough. But if you go through the pass back there, you won't think so much longer.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//If this little tract of land has impressed you, then wait till you see the Valley of Mines back there.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "Who are you?";
};


func int dia_gaan_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gaan_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//My name is Gaan. I'm a hunter and work for Bengar, the farmer here on the high pastures.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//I spend most of my time here outside, basking in the sun.
};


instance DIA_ADDON_GAAN_RANGER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_ranger_condition;
	information = dia_addon_gaan_ranger_info;
	description = "Why are you looking so solemn?";
};


func int dia_addon_gaan_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo) && (SCISWEARINGRANGERRING == TRUE) && (RANGERMEETINGRUNNING == 0))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_00");	//Why are you looking so solemn?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_01");	//You're wearing our aquamarine ring.
	AI_Output(other,self,"DIA_Addon_Gaan_Ranger_15_02");	//You belong to the 'Ring of Water'?
	AI_Output(self,other,"DIA_Addon_Gaan_Ranger_03_03");	//I certainly do. Good to see a new face in our ranks.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GAAN_AUFGABEBEIMRING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_aufgabebeimring_condition;
	information = dia_addon_gaan_aufgabebeimring_info;
	description = "What's your task within the 'Ring of Water'?";
};


func int dia_addon_gaan_aufgabebeimring_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_gaan_ranger) || (RANGERMEETINGRUNNING != 0)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_aufgabebeimring_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_AufgabeBeimRing_15_00");	//What's your task within the 'Ring of Water'?
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_01");	//I keep an eye on the entrance to the pass, to see who goes in and out.
	AI_Output(self,other,"DIA_Addon_Gaan_AufgabeBeimRing_03_02");	//Since the paladins have closed the gate to the pass, however, there hasn't been much coming and going.
};


instance DIA_ADDON_GAAN_MISSINGPEOPLE(C_INFO)
{
	npc = bau_961_gaan;
	nr = 2;
	condition = dia_addon_gaan_missingpeople_condition;
	information = dia_addon_gaan_missingpeople_info;
	description = "Have you heard of those missing people?";
};


func int dia_addon_gaan_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_gaan_aufgabebeimring) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_gaan_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Gaan_MissingPeople_15_00");	//Have you heard of those missing people?
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_01");	//Of course I have. That's why we're supposed to keep our eyes open.
	AI_Output(self,other,"DIA_Addon_Gaan_MissingPeople_03_02");	//But I haven't seen much that would give you a clue, to tell you the truth.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "What do I need to know about the Valley of Mines?";
};


func int dia_gaan_wald_condition()
{
	return TRUE;
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//What do I need to know about the Valley of Mines?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//No idea. I've only taken a fleeting glance at the valley. Looked pretty dangerous.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//The best thing to do if you go there through the pass is to stay close to the beaten track.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//Either you take the way through the big gorge, or the road over the stone bridge. That one is shorter and safer.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//Now that the orcs are roaming all over the place, you have to be a bit careful.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//I don't want to have to drag you to the herb witch.
};


instance DIA_GAAN_SAGITTA(C_INFO)
{
	npc = bau_961_gaan;
	nr = 7;
	condition = dia_gaan_sagitta_condition;
	information = dia_gaan_sagitta_info;
	description = "Herb witch?";
};


func int dia_gaan_sagitta_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wald))
	{
		return TRUE;
	};
};

func void dia_gaan_sagitta_info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//Herb witch?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//Her name is Sagitta. She is the healer for the farmers and the other people who live outside the harbor city.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//A truly curious female.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//No one really likes going to her and everybody enjoys gossiping about her.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//But if you're sick, you won't find better help than Sagitta and her kitchen full of healing herbs.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//You'll find her in the strip of woods behind Sekob's farm.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "What does this dangerous beast look like?";
};


func int dia_gaan_monster_condition()
{
	if((MIS_GAAN_SNAPPER == LOG_RUNNING) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_monster_info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//What does this dangerous beast look like?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//I don't know exactly. Up to now, I've mostly heard grunting and scratching. But I've seen what it can do.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//Even wolves aren't safe from it. The beast even bit the head off of one.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "How much would you pay me if I killed that beast for you?";
};


func int dia_gaan_waszahlstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_waszahlstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//How much would you pay me if I killed that beast for you?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//I'd give the person who killed it everything I could spare.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "Where does this scummy beast come from?";
};


func int dia_gaan_wohermonster_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_wohermonster_info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//Where does this scummy beast come from?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//Somewhere from outside the woods. Maybe from the Valley of Mines. But I don't know for sure.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//I've never been to the Valley of Mines.
};


instance DIA_GAAN_MONSTERTOT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_monstertot_condition;
	information = dia_gaan_monstertot_info;
	important = TRUE;
};


func int dia_gaan_monstertot_condition()
{
	if((Npc_IsDead(gaans_snapper) == TRUE) && (RANGERMEETINGRUNNING != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_gaan_monstertot_info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//That horrible animal is dead, I assume.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//Then I can finally hunt freely again.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//Here's the money I promised you.
		CreateInvItems(self,itmi_gold,30);
		b_giveinvitems(self,other,itmi_gold,30);
	};
	MIS_GAAN_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_GAAN_WALDSNAPPER);
	Npc_ExchangeRoutine(self,"RANGERADD");
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_ASKTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_askteacher_condition;
	information = dia_gaan_askteacher_info;
	description = "Can you teach me about hunting?";
};


func int dia_gaan_askteacher_condition()
{
	return TRUE;
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//Can you teach me about hunting?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//No problem. For 100 gold coins I can show you how to gut the animals you bring down.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//Pelts and other trophies bring a lot of money in the market.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Gaan can teach me to take animal trophies.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "Here. 100 gold coins for your expertise on gutting animals.";
};


var int dia_gaan_payteacher_noperm;

func int dia_gaan_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_askteacher) && (DIA_GAAN_PAYTEACHER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_payteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//Here. 100 gold coins for your expertise on gutting animals.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//Thanks. Now you're talking.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//Ask me later, when you have some money.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "What can you teach me?";
};


func int dia_gaan_teachhunting_condition()
{
	if(GAAN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//What can you teach me?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[11] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//That depends on what you want to know.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Remove teeth",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Remove claws",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Skin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Bloodfly's stinger",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Bloodfly's wings",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[11] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("Dragon snapper horn",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//At the moment, I can't teach you anything you don't already know. Sorry.
	};
};

func void dia_gaan_teachhunting_back()
{
	Info_ClearChoices(dia_gaan_teachhunting);
};

func void dia_gaan_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//Animals don't like to give up their claws. You have to place your knife very precisely.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//Your hands should be slightly crossed. Then you separate the claw with a powerful tug.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//Merchants are always eager to be paid in claws.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//The easiest thing to take from an animal are the teeth. You move your knife around the teeth in its mouth.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//Then you separate them from the skull with a skillful tug.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//The best way to remove the pelt is by making a deep cut along the hind legs.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//After that, it should be a cinch to pull off the skin from the front to the back.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//These flies have a soft spot on their backs.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//If you press there, the stinger will be squeezed out very far, and you can detach it with your knife.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//The best way to remove the wings of a bloodfly is with a blow from a sharp knife, very close to the fly's body.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//You have to watch out that you don't damage the delicate tissue of the wings. They're worthless if you don't do it carefully.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//Now that this slightly oversized snapper is dead, I can show you how to remove its horn.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//You push your knife deep into the animal's forehead and carefully lever the thing upwards.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//If it won't come loose from the skull, you work on it with a second knife from the other side.
		CreateInvItems(gaans_snapper,itat_drgsnapperhorn,1);
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};


instance DIA_GAAN_JAGD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 80;
	condition = dia_gaan_jagd_condition;
	information = dia_gaan_jagd_info;
	permanent = TRUE;
	description = "How's the hunting?";
};


func int dia_gaan_jagd_condition()
{
	return TRUE;
};

func void b_wasmachtjagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//How's the hunting?
};

func void dia_gaan_jagd_info()
{
	b_wasmachtjagd();
	if((Npc_IsDead(gaans_snapper) == FALSE) && (KAPITEL < 3))
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//The last animal I could bring down was a large rat. Not very encouraging, and bad for business.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//For several days now, some kind of snorting beast has been roaming the area.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//It not only kills everything that moves, it also interferes with my work.
		if((MIS_GAAN_SNAPPER != LOG_RUNNING) && (MIS_GAAN_SNAPPER != LOG_SUCCESS))
		{
			Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
			b_logentry(TOPIC_GAANSCHNAUBI,"That snorting creature's causing trouble for the hunter Gaan. Unless I defeat the beast, he can't go hunting anymore.");
			MIS_GAAN_SNAPPER = LOG_RUNNING;
		};
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//It's getting crazier out here. Meanwhile, dozens of these snorting animals have come out of the pass.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//Under these circumstances, hunting is getting harder and harder up here.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//I can't complain.
	};
};


instance DIA_GAAN_PICKPOCKET(C_INFO)
{
	npc = bau_961_gaan;
	nr = 900;
	condition = dia_gaan_pickpocket_condition;
	information = dia_gaan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaan_pickpocket_condition()
{
	return c_beklauen(23,35);
};

func void dia_gaan_pickpocket_info()
{
	Info_ClearChoices(dia_gaan_pickpocket);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_BACK,dia_gaan_pickpocket_back);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_PICKPOCKET,dia_gaan_pickpocket_doit);
};

func void dia_gaan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaan_pickpocket);
};

func void dia_gaan_pickpocket_back()
{
	Info_ClearChoices(dia_gaan_pickpocket);
};

