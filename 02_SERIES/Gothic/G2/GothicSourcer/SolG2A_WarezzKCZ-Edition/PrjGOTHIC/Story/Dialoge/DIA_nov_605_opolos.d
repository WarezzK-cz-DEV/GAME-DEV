
instance DIA_OPOLOS_KAP1_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap1_exit_condition;
	information = dia_opolos_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_opolos_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLO(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_hello_condition;
	information = dia_opolos_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_hello_info()
{
	AI_Output(self,other,"DIA_Opolos_Hello_12_00");	//Hello, you must be the new fellow.
	AI_Output(self,other,"DIA_Opolos_Hello_12_01");	//I'm Opolos. I take care of the sheep around here.
};


instance DIA_OPOLOS_WURST(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_wurst_condition;
	information = dia_opolos_wurst_info;
	permanent = FALSE;
	description = "I've got this mutton sausage here...";
};


func int dia_opolos_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_opolos_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Opolos_Wurst_15_00");	//I've got this mutton sausage here...
	AI_Output(self,other,"DIA_Opolos_Wurst_12_01");	//Oh, man, fantastic! Finally another delicious mutton sausage.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_OPOLOS_HOWLONG(C_INFO)
{
	npc = nov_605_opolos;
	nr = 1;
	condition = dia_opolos_howlong_condition;
	information = dia_opolos_howlong_info;
	permanent = FALSE;
	description = "How long have you been in the monastery?";
};


func int dia_opolos_howlong_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello))
	{
		return TRUE;
	};
};

func void dia_opolos_howlong_info()
{
	AI_Output(other,self,"DIA_Opolos_HowLong_15_00");	//How long have you been in the monastery?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_01");	//I've been here three years. But so far I haven't studied, although I'd like to.
	AI_Output(other,self,"DIA_Opolos_HowLong_15_02");	//Why not?
	AI_Output(self,other,"DIA_Opolos_HowLong_12_03");	//My job is looking after the sheep - not studying the scriptures.
	AI_Output(self,other,"DIA_Opolos_HowLong_12_04");	//And as long as Master Parlan doesn't release me from this duty, I'm not allowed to study in the library.
	MIS_HELPOPOLOS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_OPOLOSSTUDY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSSTUDY,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSSTUDY,"Opolos guards the sheep. He'd like to study the writings in the library.");
};


instance DIA_OPOLOS_MONASTERY(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_monastery_condition;
	information = dia_opolos_monastery_info;
	permanent = FALSE;
	description = "How shall I act here in the monastery?";
};


func int dia_opolos_monastery_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_monastery_info()
{
	AI_Output(other,self,"DIA_Opolos_Monastery_15_00");	//How shall I act here in the monastery?
	AI_Output(self,other,"DIA_Opolos_Monastery_12_01");	//Never lie to a magician. Don't transgress against a brother of the community.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_02");	//Respect the property of the community. If you violate these rules, you have to pay a penalty to Master Parlan.
	AI_Output(self,other,"DIA_Opolos_Monastery_12_03");	//Apart from that, I can only advise you to be careful around Agon. If you don't watch out, you'll end up like Babo.
};


instance DIA_OPOLOS_BEIBRINGEN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_beibringen_condition;
	information = dia_opolos_beibringen_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_opolos_beibringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_hello) && ((other.guild == GIL_NOV) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_opolos_beibringen_info()
{
	AI_Output(other,self,"DIA_Opolos_beibringen_15_00");	//Is there anything you can teach me?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_01");	//Sure, I used to beat up people. I can show you how to strengthen your arms.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_02");	//But I'd like to learn something about potions, especially about magic potions.
	AI_Output(other,self,"DIA_Opolos_beibringen_15_03");	//How can I help you with that?
	AI_Output(self,other,"DIA_Opolos_beibringen_12_04");	//Well, if you work for Neoras you'll certainly have an opportunity to 'borrow' one of his recipes for a short time.
	AI_Output(self,other,"DIA_Opolos_beibringen_12_05");	//If you bring it to me so that I can take a look at it, I'll train you.
	Log_CreateTopic(TOPIC_OPOLOSREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OPOLOSREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_OPOLOSREZEPT,"Opolos wants to take a quick look at a recipe for brewing mana potions. Working for Neoras, I might be able to borrow it.");
};


instance DIA_OPOLOS_REZEPT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_rezept_condition;
	information = dia_opolos_rezept_info;
	permanent = TRUE;
	description = "About the recipe...";
};


var int dia_opolos_rezept_permanent;

func int dia_opolos_rezept_condition()
{
	if(Npc_KnowsInfo(hero,dia_opolos_beibringen) && (other.guild == GIL_NOV) && (DIA_OPOLOS_REZEPT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_rezept_info()
{
	if(Npc_HasItems(other,itwr_manarezept) >= 1)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_00");	//I've got the recipe you wanted.
		AI_Output(self,other,"DIA_Opolos_rezept_12_01");	//Good, then let me read it.
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_02");	//Aha... hm... yes... I see... well, well...
		b_usefakescroll();
		AI_Output(self,other,"DIA_Opolos_rezept_12_03");	//Good, thanks a lot. If you want, you can train with me.
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		OPOLOS_REZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"Opolos can help me to become stronger.");
	}
	else if(MIS_NEORASREZEPT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_04");	//I already brought the recipe back to Neoras.
		AI_Output(self,other,"DIA_Opolos_rezept_12_05");	//Oh shit - I'll probably never get to study here. So what. I'll train you anyway.
		OPOLOS_REZEPT = LOG_FAILED;
		DIA_OPOLOS_REZEPT_PERMANENT = TRUE;
		OPOLOS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_KLOSTERTEACHER,"Opolos can help me to become stronger.");
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_rezept_15_06");	//I'll get back to that later.
	};
};


instance DIA_OPOLOS_TEACH_STR(C_INFO)
{
	npc = nov_605_opolos;
	nr = 99;
	condition = dia_opolos_teach_str_condition;
	information = dia_opolos_teach_str_info;
	permanent = TRUE;
	description = "I want to get stronger.";
};


func int dia_opolos_teach_str_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV)) && (OPOLOS_TEACHSTR == TRUE))
	{
		return TRUE;
	};
};

func void dia_opolos_teach_str_info()
{
	AI_Output(other,self,"DIA_Opolos_TEACH_STR_15_00");	//I want to become stronger.
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MED)
	{
		AI_Output(self,other,"DIA_Opolos_TEACH_STR_12_00");	//You're pretty strong now. I can't teach you any more.
	};
	Info_ClearChoices(dia_opolos_teach_str);
};

func void dia_opolos_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_opolos_teach_str_5);
};

func void dia_opolos_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_opolos_teach_str);
	Info_AddChoice(dia_opolos_teach_str,DIALOG_BACK,dia_opolos_teach_str_back);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_opolos_teach_str_1);
	Info_AddChoice(dia_opolos_teach_str,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_opolos_teach_str_5);
};


instance DIA_OPOLOS_AGON(C_INFO)
{
	npc = nov_605_opolos;
	nr = 4;
	condition = dia_opolos_agon_condition;
	information = dia_opolos_agon_info;
	permanent = FALSE;
	description = "Who are Agon and Babo?";
};


func int dia_opolos_agon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_opolos_agon_info()
{
	AI_Output(other,self,"DIA_Opolos_Agon_15_00");	//Who are Agon and Babo?
	AI_Output(self,other,"DIA_Opolos_Agon_12_01");	//Agon takes care of the herb garden. He's also a novice, but he acts like he was the Chosen One himself.
	AI_Output(self,other,"DIA_Opolos_Agon_12_02");	//Babo came to the monastery shortly before you. At first he helped Agon in the herb garden.
	AI_Output(self,other,"DIA_Opolos_Agon_12_03");	//But they must have had a fight, and Babo has been sweeping the courtyard ever since.
	AI_Output(other,self,"DIA_Opolos_Agon_15_04");	//Do you know what happened?
	AI_Output(self,other,"DIA_Opolos_Agon_12_05");	//Not exactly. You'll have to ask them. But Agon's word has more weight than that of the other novices because he's the governor's nephew.
};


instance DIA_OPOLOS_LIESEL(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_liesel_condition;
	information = dia_opolos_liesel_info;
	permanent = TRUE;
	description = "Look here, I brought Betsy.";
};


func int dia_opolos_liesel_condition()
{
	if((other.guild == GIL_NOV) && (LIESEL_GIVEAWAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_opolos_liesel_info()
{
	AI_Output(other,self,"DIA_Opolos_LIESEL_15_00");	//Look here, I brought Betsy. Can I leave her with you?
	Npc_PerceiveAll(self);
	if(Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 800))
	{
		other.aivar[AIV_PARTYMEMBER] = FALSE;
		other.aivar[AIV_TAPOSITION] = TRUE;
		other.wp = "FP_ROAM_MONASTERY_04";
		other.start_aistate = zs_mm_allscheduler;
		LIESEL_GIVEAWAY = TRUE;
		AI_Output(self,hero,"DIA_Opolos_LIESEL_12_01");	//Yes, of course. Good-looking animal. I'll take good care of her.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Opolos_Add_15_00");	//Hm... somehow I seem to have misplaced it. I'll come back later.
	};
};


instance DIA_OPOLOS_BIBLOTHEK(C_INFO)
{
	npc = nov_605_opolos;
	nr = 98;
	condition = dia_opolos_biblothek_condition;
	information = dia_opolos_biblothek_info;
	permanent = TRUE;
	description = "About the library...";
};


func int dia_opolos_biblothek_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_opolos_howlong))
	{
		return TRUE;
	};
};

func void dia_opolos_biblothek_info()
{
	AI_Output(other,self,"DIA_Opolos_Biblothek_15_00");	//About the library...
	if(PARLAN_ERLAUBNIS == FALSE)
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_01");	//That's the locked room to the left, next to the gate.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_02");	//But you'll only get the key when Master Parlan decides that you may study the teachings.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_03");	//You lucky duck! You got the key to the library, even though you've only been here for a short while.
		AI_Output(self,other,"DIA_Opolos_Biblothek_12_04");	//Use your chance and study the old scriptures!
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HELLOAGAIN(C_INFO)
{
	npc = nov_605_opolos;
	nr = 2;
	condition = dia_opolos_helloagain_condition;
	information = dia_opolos_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_opolos_helloagain_condition()
{
	if((other.guild == GIL_KDF) && (MIS_HELPOPOLOS == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_opolos_helloagain_info()
{
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_00");	//Hello. Thank you for helping me. I shall make the most of this chance and learn a lot.
	AI_Output(self,other,"DIA_Opolos_HelloAgain_12_01");	//But you certainly don't have time now to talk to a simple novice, Master.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_HOWISIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 3;
	condition = dia_opolos_howisit_condition;
	information = dia_opolos_howisit_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_opolos_howisit_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_opolos_howisit_info()
{
	AI_Output(other,self,"DIA_Opolos_HowIsIt_15_00");	//How's it going?
	if(MIS_HELPOPOLOS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_01");	//Great. Since I've been allowed to study, everything is wonderful.
	}
	else
	{
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_02");	//I loyally fulfill all of the tasks given me, Master.
		AI_Output(self,other,"DIA_Opolos_HowIsIt_12_03");	//Every day, Innos sets new challenges before me. I'll continue to work on improving myself.
	};
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP2_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap2_exit_condition;
	information = dia_opolos_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_opolos_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap3_exit_condition;
	information = dia_opolos_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP3_PERM(C_INFO)
{
	npc = nov_605_opolos;
	nr = 39;
	condition = dia_opolos_kap3_perm_condition;
	information = dia_opolos_kap3_perm_info;
	permanent = TRUE;
	description = "How are the sheep?";
};


func int dia_opolos_kap3_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_opolos_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_15_00");	//How are the sheep?
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_01");	//How do you think they are? They stand around and munch grass.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_12_02");	//I'd rather know what's happening outside. The magicians seem to be very nervous.
	Info_ClearChoices(dia_opolos_kap3_perm);
	Info_AddChoice(dia_opolos_kap3_perm,DIALOG_BACK,dia_opolos_kap3_perm_back);
	Info_AddChoice(dia_opolos_kap3_perm,"There are dragons in the Valley of Mines.",dia_opolos_kap3_perm_dragons);
	Info_AddChoice(dia_opolos_kap3_perm,"Strangers in black robes roam the countryside.",dia_opolos_kap3_perm_dmt);
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_opolos_kap3_perm,"Pedro betrayed us.",dia_opolos_kap3_perm_pedro);
	};
};

func void dia_opolos_kap3_perm_back()
{
	Info_ClearChoices(dia_opolos_kap3_perm);
};


var int opolos_dragons;

func void dia_opolos_kap3_perm_dragons()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_00");	//There are dragons in the Valley of Mines. They are besieging the royal troops together with the army of orcs.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_01");	//Dragons - I always thought they only existed in horror stories.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_02");	//They are there, believe me.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DRAGONS_12_03");	//But the king's paladins will deal with them, won't they?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DRAGONS_15_04");	//We'll see.
	if(OPOLOS_DRAGONS == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DRAGONS = TRUE;
	};
};


var int opolos_dmt;

func void dia_opolos_kap3_perm_dmt()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_00");	//Strangers in black robes roam the countryside.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_01");	//What do you mean? What sort of strangers?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_02");	//Nobody knows where they've come from. They wear long, black robes, and they cover their faces.
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_DMT_15_03");	//They seem to be some kind of magician. At least they are capable of magic.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_DMT_12_04");	//That sounds very disturbing, but I'm sure that the High Council will solve this problem.
	if(OPOLOS_DMT == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_DMT = TRUE;
	};
};


var int opolos_pedro;

func void dia_opolos_kap3_perm_pedro()
{
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_00");	//Pedro betrayed us.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_01");	//I'd heard that, but I didn't know that you were aware of that, too. That's why I didn't say anything.
	AI_Output(self,other,"DIA_Opolos_Kap3_PERM_PEDRO_12_02");	//Is the enemy stronger than us - I mean, can we defeat him?
	AI_Output(other,self,"DIA_Opolos_Kap3_PERM_PEDRO_15_03");	//We're not dead yet.
	if(OPOLOS_PEDRO == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		OPOLOS_PEDRO = TRUE;
	};
};


instance DIA_OPOLOS_KAP4_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap4_exit_condition;
	information = dia_opolos_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_opolos_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_KAP5_EXIT(C_INFO)
{
	npc = nov_605_opolos;
	nr = 999;
	condition = dia_opolos_kap5_exit_condition;
	information = dia_opolos_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_opolos_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_opolos_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OPOLOS_PICKPOCKET(C_INFO)
{
	npc = nov_605_opolos;
	nr = 900;
	condition = dia_opolos_pickpocket_condition;
	information = dia_opolos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_opolos_pickpocket_condition()
{
	return c_beklauen(54,70);
};

func void dia_opolos_pickpocket_info()
{
	Info_ClearChoices(dia_opolos_pickpocket);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_BACK,dia_opolos_pickpocket_back);
	Info_AddChoice(dia_opolos_pickpocket,DIALOG_PICKPOCKET,dia_opolos_pickpocket_doit);
};

func void dia_opolos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_opolos_pickpocket);
};

func void dia_opolos_pickpocket_back()
{
	Info_ClearChoices(dia_opolos_pickpocket);
};

