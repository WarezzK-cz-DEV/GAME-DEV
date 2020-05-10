
instance DIA_SAGITTA_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_exit_condition;
	information = dia_sagitta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HALLO(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 4;
	condition = dia_sagitta_hallo_condition;
	information = dia_sagitta_hallo_info;
	description = "All by yourself out here?";
};


func int dia_sagitta_hallo_condition()
{
	return TRUE;
};

func void dia_sagitta_hallo_info()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_15_00");	//All by yourself out here?
	AI_Output(self,other,"DIA_Sagitta_HALLO_17_01");	//Tell me what you want of me, and then go away. I'm busy.
	Info_ClearChoices(dia_sagitta_hallo);
	Info_AddChoice(dia_sagitta_hallo,DIALOG_BACK,dia_sagitta_hallo_ende);
	Info_AddChoice(dia_sagitta_hallo,"Can you heal me?",dia_sagitta_hallo_heil);
	Info_AddChoice(dia_sagitta_hallo,"What are you doing out here?",dia_sagitta_hallo_was);
	Info_AddChoice(dia_sagitta_hallo,"Who are you?",dia_sagitta_hallo_wer);
};

func void dia_sagitta_hallo_wer()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_wer_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_01");	//You haven't heard of me, then?
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_02");	//Herb witch, they say. Quack, they call me.
	AI_Output(self,other,"DIA_Sagitta_HALLO_wer_17_03");	//But when they're in a bad way, they all suddenly remember good old Sagitta and her healing herbs.
};

func void dia_sagitta_hallo_was()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_was_15_00");	//What are you doing out here?
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_01");	//I've been living here for as long as I can think, attending to my herbs.
	AI_Output(self,other,"DIA_Sagitta_HALLO_was_17_02");	//The forest is my friend. It offers me all that I need.
};

func void dia_sagitta_hallo_heil()
{
	AI_Output(other,self,"DIA_Sagitta_HALLO_Heil_15_00");	//Can you heal me?
	AI_Output(self,other,"DIA_Sagitta_HALLO_Heil_17_01");	//That's what you came for, isn't it? Just let me know when there's something wrong with you.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Sagitta sells goods behind Sekob's farm.");
};

func void dia_sagitta_hallo_ende()
{
	Info_ClearChoices(dia_sagitta_hallo);
};


instance DIA_SAGITTA_TEACHALCHEMYREQUEST(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 6;
	condition = dia_sagitta_teachalchemyrequest_condition;
	information = dia_sagitta_teachalchemyrequest_info;
	permanent = TRUE;
	description = "Can you teach me your herbal lore?";
};


func int dia_sagitta_teachalchemyrequest_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo) && (MIS_SAGITTA_HERB == FALSE))
	{
		return TRUE;
	};
};


var int dia_sagitta_teachalchemyrequest_onetime;

func void dia_sagitta_teachalchemyrequest_info()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_15_00");	//Can you teach me your herbal lore?
	if(DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_01");	//How interesting. I don't get asked that very often.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_02");	//So you want to be my student? Then you'll first have to prove that you're request is serious.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_03");	//At the moment, I'm working on a very rare potion made from exquisite herbs and juices.
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_04");	//If you can get me one ingredient - a very rare herb which I don't have here - I shall train you.
		DIA_SAGITTA_TEACHALCHEMYREQUEST_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_17_05");	//I already told you: yes, after you get me that rare ingredient.
	};
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Sorry, not interested.",dia_sagitta_teachalchemyrequest_nein);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Where can I find this ingredient?",dia_sagitta_teachalchemyrequest_wo);
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"What ingredient is that?",dia_sagitta_teachalchemyrequest_was);
};

func void dia_sagitta_teachalchemyrequest_was()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_was_15_00");	//What ingredient is that?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_was_17_01");	//It's an extremely rare plant - an herb called sun aloe. You can recognize it by its intensive almond scent.
};

func void dia_sagitta_teachalchemyrequest_wo()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_15_00");	//Where can I find this ingredient?
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_01");	//The herb I require only grows in places where it can get all the nutrients it needs.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_02");	//These are found in the excrements of a black troll.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_17_03");	//That's why it's so difficult for me to get the herb, you see?
	Info_AddChoice(dia_sagitta_teachalchemyrequest,"Let's see if I can get hold of it somewhere.",dia_sagitta_teachalchemyrequest_wo_ja);
};

func void dia_sagitta_teachalchemyrequest_wo_ja()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_15_00");	//Let's see if I can get hold of it somewhere.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_wo_ja_17_01");	//Well, then, good luck with your search.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
	MIS_SAGITTA_HERB = LOG_RUNNING;
	Log_CreateTopic(TOPIC_SAGITTAHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SAGITTAHERB,LOG_RUNNING);
	b_logentry(TOPIC_SAGITTAHERB,"Sagitta needs a weird kind of herb. It's sun aloe, and it only grows on the excrements of a black troll.");
};

func void dia_sagitta_teachalchemyrequest_nein()
{
	AI_Output(other,self,"DIA_Sagitta_TeachAlchemyRequest_nein_15_00");	//Sorry, not interested.
	AI_Output(self,other,"DIA_Sagitta_TeachAlchemyRequest_nein_17_01");	//Then stop wasting my time with your nonsense.
	Info_ClearChoices(dia_sagitta_teachalchemyrequest);
};


instance DIA_SAGITTA_SAGITTA_HERB(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_sagitta_herb_condition;
	information = dia_sagitta_sagitta_herb_info;
	description = "I found the sun aloe.";
};


func int dia_sagitta_sagitta_herb_condition()
{
	if(Npc_HasItems(other,itpl_sagitta_herb_mis) && (MIS_SAGITTA_HERB == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_sagitta_herb_info()
{
	AI_Output(other,self,"DIA_Sagitta_Sagitta_Herb_15_00");	//I found the sun aloe.
	AI_Output(self,other,"DIA_Sagitta_Sagitta_Herb_17_01");	//Thank you. And now ask me whatever you want to know about brewing potions.
	b_giveinvitems(other,self,itpl_sagitta_herb_mis,1);
	SAGITTA_TEACHALCHEMY = TRUE;
	MIS_SAGITTA_HERB = LOG_SUCCESS;
	b_giveplayerxp(XP_SAGITTA_SONNENALOE);
};


instance DIA_SAGITTA_TEACH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 2;
	condition = dia_sagitta_teach_condition;
	information = dia_sagitta_teach_info;
	permanent = TRUE;
	description = "What potions can you teach me to brew?";
};


var int dia_sagitta_teach_permanent;

func int dia_sagitta_teach_condition()
{
	if((DIA_SAGITTA_TEACH_PERMANENT == FALSE) && (SAGITTA_TEACHALCHEMY == TRUE) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Sagitta_Teach_15_00");	//What potions can you teach me to brew?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE))
	{
		Info_ClearChoices(dia_sagitta_teach);
		Info_AddChoice(dia_sagitta_teach,DIALOG_BACK,dia_sagitta_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Essence of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_sagitta_teach_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Extract of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_sagitta_teach_health_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elixir of Healing.",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_sagitta_teach_health_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elixir of Life",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_sagitta_teach_perm_health);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE)))
	{
		Info_AddChoice(dia_sagitta_teach,b_buildlearnstring("Elixir of Dexterity",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_sagitta_teach_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_01");	//Before I teach you my art of alchemy, I'm first going to tell you what all you need to brew potions.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_02");	//The alchemist's bench serves as the kitchen for brewing potions. You will need an empty laboratory flask in which to store the brewed potion.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Then you add the required ingredients, and there's your potion.
			AI_Output(self,other,"DIA_Sagitta_Teach_17_04");	//You can learn this knowledge from me, of course.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Sagitta_Teach_17_05");	//So which potion shall it be?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_Teach_17_06");	//You already know everything I could teach you.
		DIA_SAGITTA_TEACH_PERMANENT = TRUE;
	};
};

func void dia_sagitta_teach_back()
{
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Then you add the required ingredients, and there's your potion.
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Then you add the required ingredients, and there's your potion.
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
	AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Then you add the required ingredients, and there's your potion.
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
	AI_Output(self,other,"DIA_Sagitta_Teach_17_03");	//Then you add the required ingredients, and there's your potion.
	Info_ClearChoices(dia_sagitta_teach);
};

func void dia_sagitta_teach_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_sagitta_teach);
};


instance DIA_SAGITTA_HEAL(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 99;
	condition = dia_sagitta_heal_condition;
	information = dia_sagitta_heal_info;
	permanent = TRUE;
	description = "Heal me.";
};


func int dia_sagitta_heal_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_heal_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEAL_15_00");	//Heal me.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_01");	//Let me see. Mmh. My ointment will take care of the worst of your wounds.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEAL_17_02");	//You don't need healing at the moment.
	};
};


instance DIA_SAGITTA_TRADE(C_INFO)
{
	npc = bau_980_sagitta;
	condition = dia_sagitta_trade_condition;
	information = dia_sagitta_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "What wares do you have to offer?";
};


func int dia_sagitta_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_trade_info()
{
	if(SAGITTA_FLAG == 1)
	{
		b_clearalchemyinv(self);
		if(SAGITTA_FLASKS > 0)
		{
			CreateInvItems(self,itmi_flask,SAGITTA_FLASKS);
		};
		SAGITTA_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Sagitta_TRADE_15_00");	//What wares do you have to offer?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Sagitta_TRADE_17_01");	//Tell me what you want.
};


instance DIA_SAGITTA_KAP3_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap3_exit_condition;
	information = dia_sagitta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_OBSESSION(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_obsession_condition;
	information = dia_sagitta_obsession_info;
	description = "I've got this feeling of trepidation. I need help.";
};


func int dia_sagitta_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_obsession_info()
{
	AI_Output(other,self,"DIA_Sagitta_OBSESSION_15_00");	//I've got this feeling of trepidation. I need help.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_01");	//I can see that sleep will not be enough for you to recuperate. You have been exposed to the black look of the Seekers.
	AI_Output(self,other,"DIA_Sagitta_OBSESSION_17_02");	//Go to Pyrokar, the highest magician of the monastery. My humble remedies are not enough
};


instance DIA_SAGITTA_THEKLA(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 3;
	condition = dia_sagitta_thekla_condition;
	information = dia_sagitta_thekla_info;
	description = "Thekla sent me to pick up a package for her.";
};


func int dia_sagitta_thekla_condition()
{
	if((MIS_THEKLA_PAKET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_thekla_info()
{
	AI_Output(other,self,"DIA_Sagitta_Thekla_15_00");	//Thekla sent me to pick up a package for her.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_01");	//Ah, yes. I had actually expected her days ago.
	AI_Output(self,other,"DIA_Sagitta_Thekla_17_02");	//Here's the package. Take good care of it!
	b_giveplayerxp(XP_AMBIENTKAP3);
	b_giveinvitems(self,other,itmi_theklaspaket,1);
};


instance DIA_SAGITTA_KAP4_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap4_exit_condition;
	information = dia_sagitta_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_HEALRANDOLPH(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 30;
	condition = dia_sagitta_healrandolph_condition;
	information = dia_sagitta_healrandolph_info;
	permanent = TRUE;
	description = "Randolph has withdrawal symptoms.";
};


var int dia_sagitta_healrandolph_gotone;
var int dia_sagitta_healrandolph_knowsprice;

func int dia_sagitta_healrandolph_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && (Npc_HasItems(other,itpo_healrandolph_mis) == 0) && Npc_KnowsInfo(other,dia_sagitta_hallo))
	{
		return TRUE;
	};
};

func void dia_sagitta_healrandolph_info()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_00");	//Randolph has withdrawal symptoms.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_01");	//When is that fellow ever going to learn?
		DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE = TRUE;
	};
	if(DIA_SAGITTA_HEALRANDOLPH_GOTONE == TRUE)
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_02");	//I already gave you a dose for him. Just don't mess around with it.
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_03");	//I'm going to give him a remedy. That will see him through the next couple of days.
	};
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_04");	//That comes to 300 gold coins, then.
	if(DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == FALSE)
	{
		AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_15_05");	//What?
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_17_06");	//The only thing you get for free is death, kid.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
	Info_AddChoice(dia_sagitta_healrandolph,"Nah. Not for nonsense like that.",dia_sagitta_healrandolph_no);
	Info_AddChoice(dia_sagitta_healrandolph,"Here's your money.",dia_sagitta_healrandolph_geld);
};

func void dia_sagitta_healrandolph_geld()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_geld_15_00");	//Here's your money.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_01");	//Very good. You can always get the money back from him.
		CreateInvItems(self,itpo_healrandolph_mis,1);
		b_giveinvitems(self,other,itpo_healrandolph_mis,1);
		DIA_SAGITTA_HEALRANDOLPH_GOTONE = TRUE;
		b_logentry(TOPIC_HEALRANDOLPH,"Sagitta's given me the stuff for Randolph.");
	}
	else
	{
		AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_geld_17_02");	//We can't do business unless you've got the money.
	};
	Info_ClearChoices(dia_sagitta_healrandolph);
};

func void dia_sagitta_healrandolph_no()
{
	AI_Output(other,self,"DIA_Sagitta_HEALRANDOLPH_no_15_00");	//Nah. Not for nonsense like that.
	AI_Output(self,other,"DIA_Sagitta_HEALRANDOLPH_no_17_01");	//(laughs) He didn't give you any money? That's so like him!
	Info_ClearChoices(dia_sagitta_healrandolph);
};


instance DIA_SAGITTA_KAP5_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap5_exit_condition;
	information = dia_sagitta_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_KAP6_EXIT(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 999;
	condition = dia_sagitta_kap6_exit_condition;
	information = dia_sagitta_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sagitta_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sagitta_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SAGITTA_PICKPOCKET(C_INFO)
{
	npc = bau_980_sagitta;
	nr = 900;
	condition = dia_sagitta_pickpocket_condition;
	information = dia_sagitta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120_FEMALE;
};


func int dia_sagitta_pickpocket_condition()
{
	return c_beklauen(103,360);
};

func void dia_sagitta_pickpocket_info()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_BACK,dia_sagitta_pickpocket_back);
	Info_AddChoice(dia_sagitta_pickpocket,DIALOG_PICKPOCKET,dia_sagitta_pickpocket_doit);
};

func void dia_sagitta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sagitta_pickpocket);
};

func void dia_sagitta_pickpocket_back()
{
	Info_ClearChoices(dia_sagitta_pickpocket);
};

