
instance DIA_RAMIREZ_EXIT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 999;
	condition = dia_ramirez_exit_condition;
	information = dia_ramirez_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ramirez_exit_condition()
{
	return TRUE;
};

func void dia_ramirez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAMIREZ_PICKPOCKET(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 900;
	condition = dia_ramirez_pickpocket_condition;
	information = dia_ramirez_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_ramirez_pickpocket_condition()
{
	return c_beklauen(90,300);
};

func void dia_ramirez_pickpocket_info()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_BACK,dia_ramirez_pickpocket_back);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_PICKPOCKET,dia_ramirez_pickpocket_doit);
};

func void dia_ramirez_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ramirez_pickpocket);
};

func void dia_ramirez_pickpocket_back()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
};


instance DIA_RAMIREZ_ZEICHEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_zeichen_condition;
	information = dia_ramirez_zeichen_info;
	permanent = FALSE;
	description = "(Show thieves' signal)";
};


func int dia_ramirez_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//Well, well, you know the sign. (yawns) I'm impressed.
};


instance DIA_RAMIREZ_HALLO(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_hallo_condition;
	information = dia_ramirez_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ramirez_hallo_permanent;

func int dia_ramirez_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_RAMIREZ_HALLO_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_hallo_info()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (JOIN_THIEFS == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//Have you lost your way? I don't think this is the right place for you.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//If anything happens to you here, no one's going to help you. So be careful. (broad grin)
	};
	if(JOIN_THIEFS == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//So you're in. Well, I wish you success then - and be careful, whatever you do.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//Oh, and one more thing - I don't care who you are up there, and with whom you work.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//Here below, you're only one of us. A thief. No more and no less.
		DIA_RAMIREZ_HALLO_PERMANENT = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_RAMIREZ_BEUTE(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 3;
	condition = dia_ramirez_beute_condition;
	information = dia_ramirez_beute_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ramirez_beute_condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",itmi_gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",itmi_gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",itmi_silvercup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",itmi_gold) < 75))
	{
		return TRUE;
	};
};

func void dia_ramirez_beute_info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//Listen, you can't be serious, can you? You're bagging our gold... you're trying to steal from us?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//Don't get all worked up over a couple of coins.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//I mean, this bit of stuff here - is that ALL of your booty? That's all the thieves' guild of Khorinis has to offer?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//Who says our booty is stored down here?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//I couldn't quite believe that, either. So where did you hide your treasures?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//In a very safe place.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//I see.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//All right, you can keep the gold. But I'll keep an eye on you. So don't overdo it.
};


instance DIA_RAMIREZ_BEZAHLEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 9;
	condition = dia_ramirez_bezahlen_condition;
	information = dia_ramirez_bezahlen_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


var int dia_ramirez_bezahlen_permanent;

func int dia_ramirez_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (DIA_RAMIREZ_BEZAHLEN_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen))
	{
		return TRUE;
	};
};

func void dia_ramirez_bezahlen_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		RAMIREZ_COST = 150;
	}
	else
	{
		RAMIREZ_COST = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//Can you teach me something?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//I can't teach you anything. You already know everything about picking locks.
		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//Now you only need to improve your dexterity...
		};
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//I can show you how to pick a lock. That'll cost you a mere...
		b_say_gold(self,other,RAMIREZ_COST);
		Info_ClearChoices(dia_ramirez_bezahlen);
		Info_AddChoice(dia_ramirez_bezahlen,"Maybe later...(BACK)",dia_ramirez_bezahlen_spaeter);
		Info_AddChoice(dia_ramirez_bezahlen,"OK, I'll pay...",dia_ramirez_bezahlen_okay);
	};
};

func void dia_ramirez_bezahlen_spaeter()
{
	Info_ClearChoices(dia_ramirez_bezahlen);
};

func void dia_ramirez_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//OK, I'll pay...
	if(b_giveinvitems(other,self,itmi_gold,RAMIREZ_COST))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//... here's the gold.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//Great. I'm at your service.
		RAMIREZ_TEACHPLAYER = TRUE;
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//Get the gold, then, and come back.
		Info_ClearChoices(dia_ramirez_bezahlen);
	};
};


instance DIA_RAMIREZ_TEACH(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 99;
	condition = dia_ramirez_teach_condition;
	information = dia_ramirez_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me how to pick a lock!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1));
};


func int dia_ramirez_teach_condition()
{
	if((RAMIREZ_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_teach_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//Show me how to pick a lock!
	if(RAMIREZ_ZWEIMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//Lock picking is the high art of thieves.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//You need a lot of feeling and intuition. And a couple of good lock picks.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//Some chests, however, are fitted with special locks which can only be opened with the corresponding key.
		RAMIREZ_ZWEIMAL = TRUE;
	};
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//So, kneeling in front of the lock, turn your lock pick to the left and right.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//If you twist it too fast or too hard, it will break.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//But the more adept you become, the easier you'll find it to handle the tool.
	};
};


instance DIA_RAMIREZ_VIERTEL(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 8;
	condition = dia_ramirez_viertel_condition;
	information = dia_ramirez_viertel_info;
	permanent = FALSE;
	description = "Where is it worth the trouble to break in?";
};


func int dia_ramirez_viertel_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_viertel_info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//Where is it worth the trouble to break in?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//In the upper quarter of town, of course.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//But if you want to break in somewhere up there, wait until night - everyone's asleep then - except for the city guards.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//They patrol at night. I know one of them - Wambo. He's the only one interested in gold.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//He's expensive, but once you've paid him you don't have to worry any more.
};


instance DIA_RAMIREZ_SEXTANT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_sextant_condition;
	information = dia_ramirez_sextant_info;
	permanent = FALSE;
	description = "Have you got a job for me?";
};


func int dia_ramirez_sextant_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_ramirez_sextant_info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//Have you got a job for me?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//Hmm... there is a thing that I'd like to have. But I haven't found one so far.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//What can I get you?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//A sextant. Bring me a sextant - I'll pay you a good price for it.
	Log_CreateTopic(TOPIC_RAMIREZSEXTANT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAMIREZSEXTANT,LOG_RUNNING);
	b_logentry(TOPIC_RAMIREZSEXTANT,"Ramirez wants me to bring him a sextant.");
	MIS_RAMIREZSEXTANT = LOG_RUNNING;
};


instance DIA_RAMIREZ_SUCCESS(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_success_condition;
	information = dia_ramirez_success_info;
	permanent = FALSE;
	description = "I've got a sextant for you.";
};


func int dia_ramirez_success_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_sextant) && (Npc_HasItems(other,itmi_sextant) > 0))
	{
		return TRUE;
	};
};

func void dia_ramirez_success_info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//I've got a sextant for you.
	b_giveinvitems(other,self,itmi_sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//Incredible. You actually managed to find one.
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//Here, you have really earned your pay.
	b_giveinvitems(self,other,itmi_gold,VALUE_SEXTANT / 2);
	RAMIREZ_SEXTANT = TRUE;
	MIS_RAMIREZSEXTANT = LOG_SUCCESS;
	b_giveplayerxp(XP_RAMIREZSEXTANT);
};

