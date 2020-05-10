
instance DIA_IGNAZ_EXIT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 999;
	condition = dia_ignaz_exit_condition;
	information = dia_ignaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ignaz_exit_condition()
{
	return TRUE;
};

func void dia_ignaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_PICKPOCKET(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 900;
	condition = dia_ignaz_pickpocket_condition;
	information = dia_ignaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ignaz_pickpocket_condition()
{
	return c_beklauen(38,50);
};

func void dia_ignaz_pickpocket_info()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_BACK,dia_ignaz_pickpocket_back);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_PICKPOCKET,dia_ignaz_pickpocket_doit);
};

func void dia_ignaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ignaz_pickpocket);
};

func void dia_ignaz_pickpocket_back()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
};


instance DIA_IGNAZ_HALLO(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_hallo_condition;
	information = dia_ignaz_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ignaz_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_hallo_info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Ah - you've come just in time. I'm in need of an assistant for a magic experiment.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//I'm sure you're eager to do me a favor for science's sake.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Easy, my friend. First tell me what this is all about.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//I have developed a new spell. A Spell of Oblivion.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//I've already successfully carried out a few practical applications, but I don't have the time to conduct one final test.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "What's in it for me if I help you?";
};


func int dia_ignaz_traenke_condition()
{
	if(MIS_IGNAZ_CHARM != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ignaz_traenke_info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//What's in it for me if I help you?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//I could teach you how to brew potions.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//I know the recipes for healing and mana essences and for speed potions.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "Tell me more about the experiment and the spell.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Tell me more about the experiment and the spell.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//The spell serves to make somebody disremember various events.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//So far, I have only found it to work when the person in question is angry - for instance, if he has just been knocked down, or robbed.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//Even if he has only witnessed such a deed, he will scratch it from his memory.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//So I'm supposed to knock somebody down and then put a spell on him?
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Yes, I think you get the point. But to make somebody angry, it is enough to attack him - you don't have to knock him down.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//So you should pick somebody who's by himself - if there are other people around, you'll just get into trouble with Lord Andre.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Also, it makes no sense to cast the spell on someone who's busy attacking you. Wait for the right moment.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "All right, I'll try out that spell.";
};


func int dia_ignaz_teilnehmen_condition()
{
	if(Npc_KnowsInfo(other,dia_ignaz_experiment))
	{
		return TRUE;
	};
};

func void dia_ignaz_teilnehmen_info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//All right, I'll try out that spell.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Then take this spell scroll and find yourself a suitable guinea pig.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//Once you're done, come back and tell me how it went.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"I'm to test a new spell for Ignaz. It's an Oblivion spell. When anyone gets angry about a fight or for some other reason, he won't want to speak to me any more. This would be an ideal point to cast this spell.");
	b_logentry(TOPIC_IGNAZ,"This is the ideal opportunity for testing that spell. Then he'll forget he reported the matter too. I don't think anyone in the harbor district will get cross if I knock him down.");
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_RUNNING(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_running_condition;
	information = dia_ignaz_running_info;
	permanent = FALSE;
	description = "About the experiment...";
};


func int dia_ignaz_running_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_RUNNING) && (CHARM_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_running_info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//About the experiment...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//Have you been successful, then? Or have you just wasted the spell scroll? Huh?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//If you need more spell scrolls, you can buy them from me.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "I used the spell scroll.";
};


func int dia_ignaz_danach_condition()
{
	if((CHARM_TEST == TRUE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_ignaz_danach_info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//I used the spell scroll.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Fine, fine. And were you successful?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Yes, it worked.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Excellent. One small success for science, but a big one for me!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Now I can use my time to instruct you in the arts of alchemy.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//I could also give you some useful things if you want.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ignaz can show me some recipes for brewing potions. He lives in the harbor district.");
	MIS_IGNAZ_CHARM = LOG_SUCCESS;
	b_giveplayerxp(XP_MIS_IGNAZ_CHARM);
	CreateInvItems(self,itsc_charm,3);
};


instance DIA_IGNAZ_TRADE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_trade_condition;
	information = dia_ignaz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_ignaz_trade_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_SUCCESS) || Npc_KnowsInfo(other,dia_ignaz_running))
	{
		return TRUE;
	};
};

func void dia_ignaz_trade_info()
{
	if(IGNAZ_FLAG == 1)
	{
		b_clearalchemyinv(self);
		if(IGNAZ_FLASKS > 0)
		{
			CreateInvItems(self,itmi_flask,IGNAZ_FLASKS);
		};
		IGNAZ_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
};


instance DIA_IGNAZ_TEACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_teach_condition;
	information = dia_ignaz_teach_info;
	permanent = TRUE;
	description = "Instruct me in the art of alchemy.";
};


var int dia_ignaz_teach_permanent;

func int dia_ignaz_teach_condition()
{
	if((DIA_IGNAZ_TEACH_PERMANENT == FALSE) && (IGNAZ_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Instruct me in the art of alchemy.
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE))
	{
		Info_ClearChoices(dia_ignaz_teach);
		Info_AddChoice(dia_ignaz_teach,DIALOG_BACK,dia_ignaz_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Speed Potion",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_ignaz_teach_speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Mana Essence",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_ignaz_teach_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Essence of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_ignaz_teach_health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//To prepare a potion at the alchemist's bench, you need a laboratory flask.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//And you're going to need different plants or other ingredients for each potion.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//What do you want to know?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//You have learned all that I can teach you.
		DIA_IGNAZ_TEACH_PERMANENT = TRUE;
	};
};

func void dia_ignaz_teach_health()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_back()
{
	Info_ClearChoices(dia_ignaz_teach);
};

