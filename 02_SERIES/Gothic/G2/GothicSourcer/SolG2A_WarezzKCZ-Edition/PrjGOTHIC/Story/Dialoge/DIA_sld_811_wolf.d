
instance DIA_WOLF_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_exit_condition;
	information = dia_wolf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_wolf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_HALLO(C_INFO)
{
	npc = sld_811_wolf;
	nr = 4;
	condition = dia_wolf_hallo_condition;
	information = dia_wolf_hallo_info;
	permanent = FALSE;
	description = "Everything all right?";
};


func int dia_wolf_hallo_condition()
{
	return TRUE;
};

func void dia_wolf_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_Hallo_15_00");	//Doing all right?
	AI_Output(self,other,"DIA_Wolf_Hallo_08_01");	//Hey! I know you! From the colony.
	AI_Output(self,other,"DIA_Wolf_Hallo_08_02");	//What do you want here?
};


instance DIA_WOLF_WANNAJOIN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 5;
	condition = dia_wolf_wannajoin_condition;
	information = dia_wolf_wannajoin_info;
	permanent = FALSE;
	description = "I've come to join you.";
};


func int dia_wolf_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_wolf_wannajoin_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_00");	//I've come to join you.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_01");	//Why not. I've got nothing against it. Anyway, you freed our mine from the guards back then.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_02");	//But don't count on getting along with the others here so easily.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_03");	//A lot of newbies have come along since then. And some of the old mercenaries won't remember you.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_04");	//I almost didn't recognize you, you look rather haggard.
	AI_Output(other,self,"DIA_Wolf_WannaJoin_15_05");	//When the Barrier fell, I barely got away with my life.
	AI_Output(self,other,"DIA_Wolf_WannaJoin_08_06");	//Looks like you got lucky, then.
	b_logentry(TOPIC_SLDRESPEKT,"Wolf doesn't mind my joining the mercenaries.");
};


instance DIA_WOLF_WANNABUY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 6;
	condition = dia_wolf_wannabuy_condition;
	information = dia_wolf_wannabuy_info;
	permanent = FALSE;
	description = "Do you have anything to sell?";
};


func int dia_wolf_wannabuy_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_wannabuy_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaBuy_15_00");	//Do you have anything to sell?
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_01");	//Oh, don't ask.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_02");	//Bennet, one of the new guys, takes care of the weapons and armor now.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_03");	//In the colony I was responsible for Lee's entire weapons store, and then along comes a trained smith and 'pow', I'm out of a job.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_04");	//I desperately need a new job, even if I all I do is guard the farms out there.
	AI_Output(self,other,"DIA_Wolf_WannaBuy_08_05");	//I don't care, just as long as I'm not twiddling my thumbs here any more.
};


instance DIA_WOLF_WANNALEARN(C_INFO)
{
	npc = sld_811_wolf;
	nr = 7;
	condition = dia_wolf_wannalearn_condition;
	information = dia_wolf_wannalearn_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_wolf_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_wannalearn_info()
{
	AI_Output(other,self,"DIA_Wolf_WannaLearn_15_00");	//Can you teach me anything?
	AI_Output(self,other,"DIA_Wolf_WannaLearn_08_01");	//I can teach you a few tricks in handling a bow, if you want. I don't have anything better to do right now anyway.
	WOLF_TEACHBOW = TRUE;
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Wolf can teach me to handle bows.");
};


var int wolf_merke_bow;

instance DIA_WOLF_TEACH(C_INFO)
{
	npc = sld_811_wolf;
	nr = 8;
	condition = dia_wolf_teach_condition;
	information = dia_wolf_teach_info;
	permanent = TRUE;
	description = "I want to learn more about archery.";
};


func int dia_wolf_teach_condition()
{
	if(WOLF_TEACHBOW == TRUE)
	{
		return TRUE;
	};
};

func void dia_wolf_teach_info()
{
	AI_Output(other,self,"DIA_Wolf_TEACH_15_00");	//I want to learn more about archery.
	AI_Output(self,other,"DIA_Wolf_TEACH_08_01");	//What should I teach you?
	WOLF_MERKE_BOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};

func void dia_wolf_teach_back()
{
	if(WOLF_MERKE_BOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Wolf_Teach_BACK_08_00");	//There you go. Your aim is more accurate already.
	};
	Info_ClearChoices(dia_wolf_teach);
};

func void dia_wolf_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,90);
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};

func void dia_wolf_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,90);
	Info_ClearChoices(dia_wolf_teach);
	Info_AddChoice(dia_wolf_teach,DIALOG_BACK,dia_wolf_teach_back);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_wolf_teach_bow_1);
	Info_AddChoice(dia_wolf_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_wolf_teach_bow_5);
};


instance DIA_WOLF_PERM(C_INFO)
{
	npc = sld_811_wolf;
	nr = 9;
	condition = dia_wolf_perm_condition;
	information = dia_wolf_perm_info;
	permanent = TRUE;
	description = "And? Found a new task yet?";
};


func int dia_wolf_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_wannabuy) && (MIS_BENGARSHELPINGSLD == 0) && (WOLF_ISONBOARD != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_wolf_perm_info()
{
	AI_Output(other,self,"DIA_Wolf_PERM_15_00");	//And? Found a new task yet?
	AI_Output(self,other,"DIA_Wolf_PERM_08_01");	//Not so far. Let me know if you have a job for me.
};


instance DIA_WOLF_STADT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 10;
	condition = dia_wolf_stadt_condition;
	information = dia_wolf_stadt_info;
	permanent = FALSE;
	description = "Have you tried finding a job in town?";
};


func int dia_wolf_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_wannabuy) && (MIS_BENGARSHELPINGSLD == 0) && (WOLF_ISONBOARD != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_wolf_stadt_info()
{
	AI_Output(other,self,"DIA_Wolf_Stadt_15_00");	//Have you tried finding a job in town?
	AI_Output(self,other,"DIA_Wolf_Stadt_08_01");	//In the city? (laughs) Wild horses couldn't drag me there.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_02");	//Or do you think I would want to work there as a militia soldier? I can just imagine myself in that courtier's uniform.
	AI_Output(self,other,"DIA_Wolf_Stadt_08_03");	//And then that obsession with obedience. Nah, forget it - there may not be anything to do here on the farm, but at least I can do what I want.
};


var int mis_wolf_bringcrawlerplates;
var int wolf_makearmor;
var int player_gotcrawlerarmor;

instance DIA_WOLF_ABOUTCRAWLER(C_INFO)
{
	npc = sld_811_wolf;
	nr = 1;
	condition = dia_wolf_aboutcrawler_condition;
	information = dia_wolf_aboutcrawler_info;
	permanent = FALSE;
	description = "I heard you know how to make armor from crawler plates?";
};


func int dia_wolf_aboutcrawler_condition()
{
	if((KAPITEL >= 2) && (WOLF_PRODUCECRAWLERARMOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_wolf_aboutcrawler_info()
{
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_00");	//I heard you know how to make armor from crawler plates?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_01");	//That's right. Who did you hear that from?
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_02");	//A hunter by the name of Gestath told me.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_03");	//Could you make me armor like that?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_04");	//Sure. Bring me 10 crawler plates and I'll make you one.
	AI_Output(other,self,"DIA_Wolf_AboutCrawler_15_05");	//How much do you want for it?
	AI_Output(self,other,"DIA_Wolf_AboutCrawler_08_06");	//Forget it. I'll do it for nothing. For old times' sake.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLF_BRINGCRAWLERPLATES,LOG_RUNNING);
	b_logentry(TOPIC_WOLF_BRINGCRAWLERPLATES,"Wolf can make me an armor out of 10 crawler plates.");
};


instance DIA_WOLF_TEACHCRAWLERPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_teachcrawlerplates_condition;
	information = dia_wolf_teachcrawlerplates_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me how to take the plates off crawlers!",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE));
};


func int dia_wolf_teachcrawlerplates_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_aboutcrawler) && (PLAYER_TALENT_TAKEANIMALTROPHY[10] == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_teachcrawlerplates_info()
{
	AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_00");	//Teach me how to take the plates off of crawlers!
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_01");	//It's easy. The back plates are only attached to the body along the edges. Just take a sharp blade and cut them out.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_02");	//Got it?
		AI_Output(other,self,"DIA_Wolf_TeachCrawlerPlates_15_03");	//Sounds easy.
		AI_Output(self,other,"DIA_Wolf_TeachCrawlerPlates_08_04");	//That's what I'm saying.
	};
};


instance DIA_WOLF_BRINGPLATES(C_INFO)
{
	npc = sld_811_wolf;
	nr = 3;
	condition = dia_wolf_bringplates_condition;
	information = dia_wolf_bringplates_info;
	permanent = TRUE;
	description = "I've got the crawler plates for the armor.";
};


func int dia_wolf_bringplates_condition()
{
	if((MIS_WOLF_BRINGCRAWLERPLATES == LOG_RUNNING) && (Npc_HasItems(other,itat_crawlerplate) >= 10))
	{
		return TRUE;
	};
};

func void dia_wolf_bringplates_info()
{
	AI_Output(other,self,"DIA_Wolf_BringPlates_15_00");	//I've got the crawler plates for the armor.
	b_giveinvitems(other,self,itat_crawlerplate,10);
	AI_Output(self,other,"DIA_Wolf_BringPlates_08_01");	//Good! Give them here.
	MIS_WOLF_BRINGCRAWLERPLATES = LOG_SUCCESS;
};


var int wolf_armor_day;

instance DIA_WOLF_ARMORREADY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 4;
	condition = dia_wolf_armorready_condition;
	information = dia_wolf_armorready_info;
	permanent = TRUE;
	description = "OK, where's the armor?";
};


func int dia_wolf_armorready_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_aboutcrawler) && (PLAYER_GOTCRAWLERARMOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_armorready_info()
{
	AI_Output(other,self,"DIA_Wolf_ArmorReady_15_00");	//OK, where's the armor?
	if(Npc_HasItems(self,itat_crawlerplate) >= 10)
	{
		if(WOLF_MAKEARMOR == FALSE)
		{
			WOLF_ARMOR_DAY = Wld_GetDay() + 1;
			WOLF_MAKEARMOR = TRUE;
		};
		if((WOLF_MAKEARMOR == TRUE) && (WOLF_ARMOR_DAY > Wld_GetDay()))
		{
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_01");	//I'll put it together for you. Come back tomorrow.
		}
		else
		{
			CreateInvItems(self,itar_djg_crawler,1);
			Npc_RemoveInvItems(self,itat_crawlerplate,10);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_02");	//I finished it. Here it is.
			b_giveinvitems(self,other,itar_djg_crawler,1);
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_03");	//Turned out really well, I think...
			AI_Output(other,self,"DIA_Wolf_ArmorReady_15_04");	//Thank you!
			AI_Output(self,other,"DIA_Wolf_ArmorReady_08_05");	//Don't mention it.
			PLAYER_GOTCRAWLERARMOR = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_ArmorReady_08_06");	//You joker. I need the crawler plates first...
		WOLF_MAKEARMOR = FALSE;
		MIS_WOLF_BRINGCRAWLERPLATES = LOG_RUNNING;
	};
};


instance DIA_WOLF_KAP3_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap3_exit_condition;
	information = dia_wolf_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_wolf_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_BENGAR(C_INFO)
{
	npc = sld_811_wolf;
	nr = 31;
	condition = dia_wolf_bengar_condition;
	information = dia_wolf_bengar_info;
	permanent = TRUE;
	description = "I may have found a job for you on Bengar's farm.";
};


func int dia_wolf_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_hallo) && (MIS_BENGARSHELPINGSLD == LOG_RUNNING) && (KAPITEL >= 3) && (WOLF_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_wolf_bengar_onetime;
var int wolf_bengar_geld;

func void dia_wolf_bengar_info()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_15_00");	//I may have found a job for you on Bengar's farm.
	if(DIA_WOLF_BENGAR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_01");	//Let's hear it.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_02");	//The pass to the Valley of Mines comes out directly at Bengar's farm. He's got problems with all the beasts who squeeze themselves through the pass.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_03");	//Someone needs to defend Bengar's farm.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_04");	//That would be something. Then at least I'd be away from the farm here and wouldn't have to stare at the smithy.
		DIA_WOLF_BENGAR_ONETIME = TRUE;
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_05");	//Agreed. And since you're one of us, I'll make you a fair price. Give me 300 gold coins and I'm on my way.
		WOLF_BENGAR_GELD = 300;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_06");	//Good. That comes to 800 gold coins.
		AI_Output(other,self,"DIA_Wolf_BENGAR_15_07");	//A hefty price.
		AI_Output(self,other,"DIA_Wolf_BENGAR_08_08");	//Well. For one of us, I'd do it for almost nothing. But for you...
		WOLF_BENGAR_GELD = 800;
	};
	Info_ClearChoices(dia_wolf_bengar);
	Info_AddChoice(dia_wolf_bengar,"I'll think about it.",dia_wolf_bengar_nochnicht);
	Info_AddChoice(dia_wolf_bengar,"Here's your gold.",dia_wolf_bengar_geld);
};

func void dia_wolf_bengar_geld()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_geld_15_00");	//Here's your gold.
	if(b_giveinvitems(other,self,itmi_gold,WOLF_BENGAR_GELD))
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_01");	//Good. I'm off, then, to see to those beasts. Let's see who else on this farm I can enlist.
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_02");	//See you later.
		MIS_BENGARSHELPINGSLD = LOG_SUCCESS;
		b_giveplayerxp(XP_BENGARSHELPINGSLD);
		AI_StopProcessInfos(self);
		AI_UseMob(self,"BENCH",-1);
		Npc_ExchangeRoutine(self,"BengarsFarm");
		b_startotherroutine(sld_815_soeldner,"BengarsFarm");
		b_startotherroutine(sld_817_soeldner,"BengarsFarm");
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_BENGAR_geld_08_03");	//Well, if you had the money, I'd be on my way already.
	};
	Info_ClearChoices(dia_wolf_bengar);
};

func void dia_wolf_bengar_nochnicht()
{
	AI_Output(other,self,"DIA_Wolf_BENGAR_nochnicht_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Wolf_BENGAR_nochnicht_08_01");	//Okay, but don't let me down.
	Info_ClearChoices(dia_wolf_bengar);
};


instance DIA_WOLF_PERMKAP3(C_INFO)
{
	npc = sld_811_wolf;
	nr = 80;
	condition = dia_wolf_permkap3_condition;
	information = dia_wolf_permkap3_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_wolf_permkap3_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToWP(self,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (WOLF_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_wolf_permkap3_onetime;

func void dia_wolf_permkap3_info()
{
	AI_Output(other,self,"DIA_Wolf_PERMKAP3_15_00");	//Everything going well?
	if(Npc_IsDead(bengar) && (DIA_WOLF_PERMKAP3_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_01");	//My employer is dead. Oh well. I always wanted to have my own farm.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"BengarDead");
		DIA_WOLF_PERMKAP3_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_PERMKAP3_08_02");	//Sure! Everything's quiet.
	};
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_KAP4_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap4_exit_condition;
	information = dia_wolf_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_wolf_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_KAP5_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap5_exit_condition;
	information = dia_wolf_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_wolf_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


var int wolf_saidno;

instance DIA_WOLF_SHIP(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_ship_condition;
	information = dia_wolf_ship_info;
	description = "Would you like to get out of here on a ship?";
};


func int dia_wolf_ship_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_wolf_hallo))
	{
		return TRUE;
	};
};

func void dia_wolf_ship_info()
{
	AI_Output(other,self,"DIA_Wolf_SHIP_15_00");	//Would you fancy getting out of here on a ship?
	if((MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && !Npc_IsDead(bengar))
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_01");	//No. Not any more. I've found my task. Maybe another time.
		WOLF_SAIDNO = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Wolf_SHIP_08_02");	//Yeah, sure. Let's get out of here. I could be a big help to you defending your ship. Where are we going?
		MIS_BENGARSHELPINGSLD = LOG_OBSOLETE;
		Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
		b_logentry(TOPIC_CREW,"Wolf's had enough of this island and he's willing to do anything to get out. He's a good fighter.");
	};
};


instance DIA_WOLF_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_811_wolf;
	nr = 2;
	condition = dia_wolf_knowwhereenemy_condition;
	information = dia_wolf_knowwhereenemy_info;
	permanent = TRUE;
	description = "I'm headed for an island not far from this one.";
};


func int dia_wolf_knowwhereenemy_condition()
{
	if(Npc_KnowsInfo(other,dia_wolf_ship) && (WOLF_SAIDNO == FALSE) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (WOLF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_00");	//I'm headed for an island not far from this one.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_01");	//Yeah, what are we waiting for? I could teach you archery and crossbow shooting while we're at sea.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_15_02");	//I just remembered that I've actually got enough people already.
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_03");	//(angry) So THAT'S the way it is. First you wave a red flag at me and then nothing comes of it, eh?
		AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_08_04");	//Screw you. I hope your tub sinks.
		AI_StopProcessInfos(self);
	}
	else
	{
		Info_ClearChoices(dia_wolf_knowwhereenemy);
		Info_AddChoice(dia_wolf_knowwhereenemy,"I'm going to think about it a little longer.",dia_wolf_knowwhereenemy_no);
		Info_AddChoice(dia_wolf_knowwhereenemy,"Welcome aboard!",dia_wolf_knowwhereenemy_yes);
	};
};

func void dia_wolf_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_00");	//Welcome aboard!
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_Yes_15_01");	//Come down to the harbor. We're leaving soon.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_Yes_08_02");	//I'm on my way.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	WOLF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

func void dia_wolf_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Wolf_KnowWhereEnemy_No_15_00");	//I'm going to think about it a little longer.
	AI_Output(self,other,"DIA_Wolf_KnowWhereEnemy_No_08_01");	//Oh, you know what, I think you're just a braggart. I don't believe a word of it. Take a hike.
	WOLF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_wolf_knowwhereenemy);
};


instance DIA_WOLF_LEAVEMYSHIP(C_INFO)
{
	npc = sld_811_wolf;
	nr = 55;
	condition = dia_wolf_leavemyship_condition;
	information = dia_wolf_leavemyship_info;
	permanent = TRUE;
	description = "I can't use you after all.";
};


func int dia_wolf_leavemyship_condition()
{
	if((WOLF_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_wolf_leavemyship_info()
{
	AI_Output(other,self,"DIA_Wolf_LeaveMyShip_15_00");	//I can't use you after all.
	AI_Output(self,other,"DIA_Wolf_LeaveMyShip_08_01");	//First you give me hope and then a rejection like that. You bastard, I'll pay you back for that.
	WOLF_ISONBOARD = LOG_FAILED;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_WOLF_SHIPOFF(C_INFO)
{
	npc = sld_811_wolf;
	nr = 56;
	condition = dia_wolf_shipoff_condition;
	information = dia_wolf_shipoff_info;
	permanent = TRUE;
	description = "Listen.";
};


func int dia_wolf_shipoff_condition()
{
	if(WOLF_ISONBOARD == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_wolf_shipoff_info()
{
	AI_Output(other,self,"DIA_Wolf_SHIPOFF_15_00");	//Listen.
	AI_Output(self,other,"DIA_Wolf_SHIPOFF_08_01");	//Piss off, you bastard.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_WOLF_KAP6_EXIT(C_INFO)
{
	npc = sld_811_wolf;
	nr = 999;
	condition = dia_wolf_kap6_exit_condition;
	information = dia_wolf_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_wolf_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_PICKPOCKET(C_INFO)
{
	npc = sld_811_wolf;
	nr = 900;
	condition = dia_wolf_pickpocket_condition;
	information = dia_wolf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_wolf_pickpocket_condition()
{
	return c_beklauen(32,35);
};

func void dia_wolf_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_pickpocket);
	Info_AddChoice(dia_wolf_pickpocket,DIALOG_BACK,dia_wolf_pickpocket_back);
	Info_AddChoice(dia_wolf_pickpocket,DIALOG_PICKPOCKET,dia_wolf_pickpocket_doit);
};

func void dia_wolf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wolf_pickpocket);
};

func void dia_wolf_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_pickpocket);
};

