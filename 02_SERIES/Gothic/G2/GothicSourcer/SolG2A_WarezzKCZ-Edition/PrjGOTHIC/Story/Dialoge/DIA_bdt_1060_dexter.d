
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Look who's here. The great emancipator. Well, hero - what are you doing here?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//I'm looking for a few answers.
	if(RANGER_SCKNOWSDEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_00");	//I never thought you'd come here voluntarily.
		AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_01");	//What do you mean by that?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_02");	//I mean that I've been looking for you. Haven't you seen any of my wanted posters?
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_03");	//They all bear YOUR mug. Oh yes... you're very much wanted. Didn't you know that?
	}
	else
	{
		AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//SOMEONE is passing around pieces of paper with my face on them. SOMEONE told me that it's you.
		AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Somebody talks too much.
		AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_04");	//But you're right. I distributed those wanted posters. And, lo and behold - here you are.
		MIS_STECKBRIEFE = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	};
	AI_Output(other,self,"DIA_Addon_Dexter_Hallo_15_05");	//So what do you want from me?
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_06");	//Me? Nothing whatsoever. But my boss is hell-bent on seeing you dead.
	AI_Output(self,other,"DIA_Addon_Dexter_Hallo_09_07");	//So he wants me to find you and bring him your head.
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "I don't believe a word you're saying.";
};


func int dia_dexter_glaube_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//I don't believe a word you're saying.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Hey, it's true. I swear on my mother's grave!
};


instance DIA_ADDON_DEXTER_PATRICK(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_patrick_condition;
	information = dia_addon_dexter_patrick_info;
	description = "A mercenary named Patrick's been seen here.";
};


func int dia_addon_dexter_patrick_condition()
{
	if((MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_patrick_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Patrick_15_00");	//A mercenary named Patrick's been seen here.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_01");	//Patrick, huh? No idea what you're talking about.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_02");	//I do recall some loud-mouthed mercenary who hung out with the boys out there sometimes.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_03");	//(obviously lying) But I haven't seen him in ages.
	AI_Output(self,other,"DIA_Addon_Dexter_Patrick_09_04");	//(acting innocent) Maybe he got himself hanged at last. I wouldn't know.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Dexter claims not to know the mercenary Patrick.");
	DEXTER_KNOWSPATRICK = TRUE;
	b_giveplayerxp(XP_ADDON_DEXTER_KNOWSPATRICK);
};


instance DIA_ADDON_DEXTER_GREG(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_addon_dexter_greg_condition;
	information = dia_addon_dexter_greg_info;
	description = "There's this fellow with an eyepatch. He's looking for YOU!";
};


func int dia_addon_dexter_greg_condition()
{
	if((SC_KNOWSGREGSSEARCHSDEXTER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Greg_15_00");	//There's this fellow with an eyepatch. He's looking for YOU!
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_01");	//Everybody's looking for me. I couldn't care less.
	AI_Output(self,other,"DIA_Addon_Dexter_Greg_09_02");	//If that guy has some business with me, let him come here.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_DEXTER_MISSINGPEOPLE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_addon_dexter_missingpeople_condition;
	information = dia_addon_dexter_missingpeople_info;
	description = "They say that you're kidnapping people from Khorinis.";
};


func int dia_addon_dexter_missingpeople_condition()
{
	if((SC_KNOWSDEXTERASKIDNAPPER == TRUE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_15_00");	//They say that you're kidnapping people from Khorinis.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_01");	//So you found that out, too. Good work, buster.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_09_02");	//And here I was thinking I had covered my tracks.
	Info_ClearChoices(dia_addon_dexter_missingpeople);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Who gave you this order?",dia_addon_dexter_missingpeople_wer);
	Info_AddChoice(dia_addon_dexter_missingpeople,"Where did those people disappear to? Maybe down the mines, somewhere here?",dia_addon_dexter_missingpeople_wo);
};

func void dia_addon_dexter_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Wo_15_00");	//Where did those people disappear to? Maybe down the mines, somewhere here?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_01");	//(laughs) They're far away in the north-east by now where you can't get to them.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Wo_09_02");	//I could show you where exactly, but I don't know why I would want to do that.
};

func void dia_addon_dexter_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_wer_15_00");	//Who gave you this order?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_01");	//My boss. He's a dangerous man. You know him: Raven, one of the former ore barons from the old camp in the Valley of Mines.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_wer_09_02");	//He needs those people to fulfill his plans. And that's all you need to know.
	Info_AddChoice(dia_addon_dexter_missingpeople,"Raven, dangerous? Oh well...",dia_addon_dexter_missingpeople_raven);
	Info_AddChoice(dia_addon_dexter_missingpeople,"An ore baron here, in Khorinis?",dia_addon_dexter_missingpeople_raventot);
};

func void dia_addon_dexter_missingpeople_raven()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_Raven_15_00");	//Raven, dangerous? Oh well...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_01");	//(irritated) What do YOU know? You don't know him like I do.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_02");	//(unsure) He was a miserable swine even back then, but these days...
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_03");	//He has changed since the fall of the Barrier. There's a black shadow across his face.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_04");	//(intimidated) His fierce glance will pierce you like the claws of a raptor if you look into his eyes for too long.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_05");	//My only advice to you is: Leave Khorinis as fast as you can, before it's too late.
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_Raven_09_06");	//(somberly) There's nothing here for you. Except for certain death.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Dexter has a client. His name is Raven. Raven is a former ore baron. It seems that this Raven is ultimately behind the whole kidnapping business. Now I just need proof of it.");
	Info_ClearChoices(dia_addon_dexter_missingpeople);
};

func void dia_addon_dexter_missingpeople_raventot()
{
	AI_Output(other,self,"DIA_Addon_Dexter_missingPeople_RavenTot_15_00");	//An ore baron here, in Khorinis?
	AI_Output(self,other,"DIA_Addon_Dexter_missingPeople_RavenTot_09_01");	//He's no longer an ore baron. He's got plans of his own, and Khorinis will feel that before long.
};


instance DIA_ADDON_DEXTER_BOSS(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_addon_dexter_boss_condition;
	information = dia_addon_dexter_boss_info;
	description = "Your boss? Who's that supposed to be?";
};


func int dia_addon_dexter_boss_condition()
{
	if((KNOWS_DEXTER == TRUE) && (SC_KNOWSDEXTERASKIDNAPPER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_dexter_boss_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Boss_15_00");	//Your boss? Who's that supposed to be?
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_01");	//(laughs) Wouldn't you just love to know that? Yes, I can imagine.
	AI_Output(self,other,"DIA_Addon_Dexter_Boss_09_02");	//(serious) I don't see any reason why I should tell you.
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "And what do you intend to do now? Kill me?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_dexter_missingpeople))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//And what do you intend to do now? Kill me?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Yeah. But you set us all free. That's why I'm giving you another chance. Beat it - disappear, make yourself invisible. Go and don't cross my path again.
	AI_Output(other,self,"DIA_Addon_Dexter_Vor_15_00");	//I need to know where you brought those people.
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_01");	//(laughs) Well. You could try beating it out of me...
	AI_Output(self,other,"DIA_Addon_Dexter_Vor_09_02");	//(menacing) It's better for you if you leave now.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//If I see you around here again, I won't hesitate to kill you.
	DEXTER_NOMORESMALLTALK = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((DEXTER_NOMORESMALLTALK == TRUE) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Dexter_Add_09_02");	//(attacking) You asked for this...
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Oh man, you'd have done better not to show up here. You're the wrong man in the wrong place.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	b_greg_comestodexter();
	Info_ClearChoices(dia_dexter_kill);
	Info_AddChoice(dia_dexter_kill,DIALOG_ENDE,dia_dexter_kill_ende);
};

func void dia_dexter_kill_ende()
{
	var C_ITEM itm;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	itm = Npc_GetEquippedArmor(greg_nw);
	if(Hlp_IsItem(itm,itar_pir_h_addon) == FALSE)
	{
		AI_EquipArmor(greg_nw,itar_pir_h_addon);
	};
};


instance DIA_DEXTER_KOPF(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 5;
	condition = dia_dexter_kopf_condition;
	information = dia_dexter_kopf_info;
	permanent = FALSE;
	description = "You want my head? Come and get it, then!";
};


func int dia_dexter_kopf_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_hallo))
	{
		return TRUE;
	};
};

func void dia_dexter_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_Dexter_Add_15_00");	//You want my head? Come and get it, then!
	AI_Output(self,other,"DIA_Addon_Dexter_Add_09_01");	//(attacking) If that's what you want...
	dia_dexter_kill_ende();
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

