
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//I see you've become a fighter for law and order.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//It doesn't matter that you're in the service of Innos. You're one of us. And I hope that's the way you see it, too.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//So now you belong to the church of Innos. Fine, but you're still one of us - I hope you won't forget that.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//Your deadline has passed. You shouldn't have come back.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//I see you received our gift. I am Cassia.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//All right, Cassia, so tell me why I'm here.
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//You caught our attention by winning the trust of some of our friends.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//And we want to offer you a chance. You can join us.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//Just look who found his way here. Attila underestimated you. I'm not going to make the same mistake.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//What's being played here?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//We wanted you to die for blowing the whistle on a friend. That's why we sent Attila.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//Your presence here, however, opens up a new option...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... what do you want to offer me?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//You can join us.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "Tell me more about your organization.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//Tell me more about your organization.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//People in town are pretty nervous about us. But nobody knows our hideout.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//The handful of people who even know that the sewers exist believe that they are locked and not accessible to anyone.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//And as long as they don't find us, we can work in peace.
};


instance DIA_CASSIA_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_missingpeople_condition;
	information = dia_cassia_missingpeople_info;
	permanent = FALSE;
	description = "What do you know about the missing people?";
};


func int dia_cassia_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_00");	//What do you know about the missing people?
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_01");	//Why would that interest you?
	AI_Output(other,self,"DIA_Addon_Cassia_Add_15_02");	//I want to find out what happened to them.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_03");	//When you emerge from the sewers, swim down along the coast to the right for a while.
	AI_Output(self,other,"DIA_Addon_Cassia_Add_16_04");	//You're bound to find your answers there...
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "What's in it for me if I join you?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//What's in it for me if I join you?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//You can learn special abilities from us - abilities that will allow you to live in luxury.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//But I wouldn't have to hide out down here, would I?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(laughs quietly) No. You only have to stick to our rules. That's all.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "What can I learn from you?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//What can I learn from you?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//Jesper is the master of stealth. He will show you how to move without making a sound.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//Ramirez is an exceptionally gifted burglar. No lock can withstand his picks.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//And I can teach you how to be a pickpocket.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//I'm also going to help you become more dexterous. For dexterity is the key to your abilities.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Cassia can teach me pickpocketing and help me to become more dexterous.");
	b_logentry(TOPIC_CITYTEACHER,"Ramirez can teach me to pick locks.");
	b_logentry(TOPIC_CITYTEACHER,"Jesper can teach me to sneak.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "What are your rules?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//What are your rules?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//The first rule is: You don't breathe a word about us. To anyone. Ever.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Second: Don't get caught.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Third: If you draw your weapon down here to attack someone, we'll kill you.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//And the fourth, and last rule is: those who want to join us have to prove themselves.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "What happens if I get caught?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//What happens if I get caught?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//Just don't get caught, OK?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "How am I supposed to prove myself?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//How am I supposed to prove myself?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//Now will you join us or not?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//That stubborn old alchemist - Constantino - has a beautiful ring.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//But he doesn't really need it. I want to see it adorn my hand.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"Cassia wants me to bring her Constantino's ring.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "OK, I'm in.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//OK, I'm in.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//Great. You'll be given an opportunity to prove yourself. And if you want to learn from us, you're welcome.
	JOIN_THIEFS = TRUE;
	CASSIA_FRIST = FALSE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "And what if I don't want to join you...?";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//And what if I don't want to join you...?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//You're missing a one-time chance, but you can go.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(serious) And don't even think about betraying us. You would bitterly regret that.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"OK, I'm in.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"I need to think about this.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//In that case, I shall kill you.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"OK, I'm in.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"Try to kill me, then.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//OK, I'm in.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(smiles) You've made a wise decision. If you succeed in proving yourself, you may join our ranks.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//If you would like to learn the thieves' abilities first, feel free - you're going to need them.
	JOIN_THIEFS = TRUE;
	CASSIA_FRIST = FALSE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//Try to kill me, then.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//Too bad. I thought you were smarter than that.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//I need to think about this.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//Do that. I'll give you two days to come to a decision. After that, you will no longer be welcome here.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "Can you teach me?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//Can you teach me?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//Sure, no problem. Just let me know when you're ready.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//Sure. Pickpocketing and dexterity will cost you 100 gold pieces each.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"Maybe later...(BACK)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"I want to learn about picking pockets (pay 100 gold).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"I want to become more dexterous (pay 100 gold).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//I want to become more dexterous. Here's the gold.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//We can start whenever you're ready.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//Come back when you've got the gold.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//I want to learn about picking pockets. Here's the gold.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//We can start whenever you're ready.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//Come back when you've got the gold.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "I want to become more dexterous.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//I want to become more dexterous.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "Show me how to pick pockets. (5 LP)";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//Show me how to pick pockets.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//If you want to empty somebody's pockets, distract him. Just start talking to him, have a chat.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//While you're talking to him, size him up. Look out for bulging pockets, jewelry, or leather straps around the neck. And, most of all, note how keen the fellow seems.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//Robbing a drunk day-laborer is not the same as stealing from a watchful merchant, mind you.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//If you're too clumsy, of course, he'll smell a rat. So, above all: keep your cool.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "I've got Constantino's ring.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//I've got Constantino's ring.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//Congratulations. You passed your initiation test. Now you're truly one of us.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//Take this key. It opens the door to the hotel. (smiles) Then you won't have to swim every time.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//Furthermore, you should know that we have a secret sign. A particular nod.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//Exactly. When you talk to the right people and make this sign, they'll know you are one of us.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"I have been accepted into the thieves' guild.");
	b_logentry(TOPIC_DIEBESGILDE,"I know the thieves' sign. If I demonstrate it to the right people, they'll know I'm one of them.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "So where are you hiding your loot?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//So where are you hiding your loot?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//Come on, you didn't really think I would tell you that?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//You'll have enough opportunity to get your hands on some loot of your own. Remember - those who are too greedy end up with nothing.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "Have you got a job for me?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//Have you got a job for me?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//Not as long as you're wanted in town as a thief.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//Clear that up - pay your penalty or get rid of the witnesses, I don't care, just as long as you clear it up.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//Yes. There is a matching set of chalices. Six of them.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//King Rhobar once captured them during a campaign - but he sacrificed many men so he could get them. That's why they're called the Blood Chalices.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//Each of the chalices by itself is not all that valuable - but the six of them all together are worth a tidy sum.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//Where are these chalices?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//They're here, in town - they belong to the rich merchants in the upper quarter.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//Bring them to me. In the meantime, I'll try to find a buyer for them.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//What's in it for me?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//Either half of the profit, or you get to pick a special item from my booty.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"Cassia wants me to bring her the six Blood Chalices. Apparently, they're all in the city.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "About the Blood Chalices...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//About the Blood Chalices...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//I've got all six chalices now.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//Good work. I've found a buyer in the meantime.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//You can have your reward now. Thanks for doing that for me.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//There's nothing else I have to do for you - but you can learn from me at any time. Moreover, there's enough on this island just waiting for a taker. (smiles)
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//I can only sell these chalices as a set. Bring me all six.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "I've come to pick up my reward.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//I've come to pick up my reward.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//What's your choice?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"Master's armor",dia_cassia_belohnung_armor);
	Info_AddChoice(dia_cassia_belohnung,"400 pieces of gold.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 elixirs of healing",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,NAME_ADDON_CASSIASBELOHNUNGSRING,dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_armor()
{
	AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Give me the armor.
	CreateInvItems(hero,itar_wma_base,1);
	AI_EquipArmor(hero,itar_wma_base);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//Give me the gold.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//Give me the potions.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//Give me the ring.
	b_giveinvitems(self,other,itri_hp_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

