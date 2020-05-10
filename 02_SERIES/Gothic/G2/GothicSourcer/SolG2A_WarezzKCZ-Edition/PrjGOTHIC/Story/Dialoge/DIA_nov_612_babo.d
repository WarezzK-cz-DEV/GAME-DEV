
instance DIA_BABO_KAP1_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap1_exit_condition;
	information = dia_babo_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_babo_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_hello_condition;
	information = dia_babo_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_babo_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_hello_info()
{
	AI_Output(self,other,"DIA_Babo_Hello_03_00");	//(shyly) Hello, you're also new here, aren't you?
	AI_Output(other,self,"DIA_Babo_Hello_15_01");	//Yes. How long have you been here?
	AI_Output(self,other,"DIA_Babo_Hello_03_02");	//I've been here for four weeks. Have you already been given a fighting staff?
	AI_Output(other,self,"DIA_Babo_Hello_15_03");	//Not so far.
	AI_Output(self,other,"DIA_Babo_Hello_03_04");	//Then take this one. We novices all carry a staff as a sign of our ability to defend ourselves. Can you fight?
	AI_Output(other,self,"DIA_Babo_Hello_15_05");	//Well, I've wielded a weapon or two...
	AI_Output(self,other,"DIA_Babo_Hello_03_06");	//If you want, I can teach you something. However, I have a request...
	b_giveinvitems(self,other,itmw_1h_nov_mace,1);
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_BABO_ANLIEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_anliegen_condition;
	information = dia_babo_anliegen_info;
	permanent = FALSE;
	description = "What request would that be?";
};


func int dia_babo_anliegen_condition()
{
	if((other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_hello))
	{
		return TRUE;
	};
};

func void dia_babo_anliegen_info()
{
	AI_Output(other,self,"DIA_Babo_Anliegen_15_00");	//What request would that be?
	AI_Output(self,other,"DIA_Babo_Anliegen_03_01");	//Well, one of the paladins, Sergio, is in the monastery at the moment.
	AI_Output(self,other,"DIA_Babo_Anliegen_03_02");	//If you can persuade him to go through a few exercises with me, then I'll train you.
	AI_Output(other,self,"DIA_Babo_Anliegen_15_03");	//I shall see what can be done.
	Log_CreateTopic(TOPIC_BABOTRAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOTRAIN,LOG_RUNNING);
	b_logentry(TOPIC_BABOTRAIN,"If I can persuade the paladin Sergio to practice a bit of fighting with Babo, he'll train me to fight with two-handed weapons.");
};


instance DIA_BABO_SERGIO(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_sergio_condition;
	information = dia_babo_sergio_info;
	permanent = FALSE;
	description = "I talked to Sergio.";
};


func int dia_babo_sergio_condition()
{
	if(Npc_KnowsInfo(other,dia_sergio_babo) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_sergio_info()
{
	AI_Output(other,self,"DIA_Babo_Sergio_15_00");	//I talked to Sergio. He's going to train with you every morning for two hours, starting at five o'clock.
	AI_Output(self,other,"DIA_Babo_Sergio_03_01");	//Thanks! What an honor for me!
	AI_Output(self,other,"DIA_Babo_Sergio_03_02");	//If you want, I'll also show you the secrets of combat.
	BABO_TEACHPLAYER = TRUE;
	BABO_TRAINING = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Babo can train me in two-handed combat.");
};


instance DIA_BABO_TEACH(C_INFO)
{
	npc = nov_612_babo;
	nr = 100;
	condition = dia_babo_teach_condition;
	information = dia_babo_teach_info;
	permanent = TRUE;
	description = "I'm ready for training.";
};


var int dia_babo_teach_permanent;
var int babo_labercount;

func int dia_babo_teach_condition()
{
	if(((BABO_TEACHPLAYER == TRUE) && (DIA_BABO_TEACH_PERMANENT == FALSE)) || (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int babo_merk2h;

func void dia_babo_teach_info()
{
	BABO_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Babo_Teach_15_00");	//I'm ready for training.
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 75)
	{
		AI_Output(self,other,"DIA_DIA_Babo_Teach_Back_03_00");	//You've learned everything about two-handed combat that I can teach you.
		DIA_BABO_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_babo_teach);
};

func void dia_babo_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_00");	//Fight for Innos. Innos is our life - and your faith gives you strength.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_01");	//A servant of Innos never provokes an opponent - he surprises him!
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_02");	//No matter where you go - always take your staff along.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_03_03");	//A servant of Innos is always prepared to fight. If you don't have any magic, your staff is your most important defense.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};

func void dia_babo_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,75);
	if(other.hitchance[NPC_TALENT_2H] > BABO_MERK2H)
	{
		if(BABO_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_00");	//A servant of Innos fights not only with his staff, but also with his heart.
		};
		if(BABO_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_01");	//You have to know the point up to which you can retreat.
		};
		if(BABO_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_02");	//Remember, you fight well if you control your opponent and don't give him a chance to be in control himself.
		};
		if(BABO_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Babo_Teach_2H_5_03_03");	//You have only lost when you have given up.
		};
		BABO_LABERCOUNT = BABO_LABERCOUNT + 1;
		if(BABO_LABERCOUNT >= 3)
		{
			BABO_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_babo_teach);
	Info_AddChoice(dia_babo_teach,DIALOG_BACK,dia_babo_teach_back);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_babo_teach_2h_1);
	Info_AddChoice(dia_babo_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_babo_teach_2h_5);
};


instance DIA_BABO_WURST(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_wurst_condition;
	information = dia_babo_wurst_info;
	permanent = FALSE;
	description = "Here, have a sausage.";
};


func int dia_babo_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_babo_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Babo_Wurst_15_00");	//Here, have a sausage.
	AI_Output(self,other,"DIA_Babo_Wurst_03_01");	//Oh, mutton sausages, great! They taste the best - come on, give me another sausage!
	AI_Output(other,self,"DIA_Babo_Wurst_15_02");	//Then I won't have enough left for the others.
	AI_Output(self,other,"DIA_Babo_Wurst_03_03");	//You have one sausage too many anyway. Namely, the one for you. And what's a sausage among friends?
	AI_Output(self,other,"DIA_Babo_Wurst_03_04");	//Come on, I'll give you a 'Fire Arrow' spell scroll for it.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_babo_wurst);
	Info_AddChoice(dia_babo_wurst,"All right, here, take another.",dia_babo_wurst_ja);
	Info_AddChoice(dia_babo_wurst,"No, I won't do that.",dia_babo_wurst_nein);
};

func void dia_babo_wurst_ja()
{
	AI_Output(other,self,"DIA_Babo_Wurst_JA_15_00");	//All right, here, take another.
	AI_Output(self,other,"DIA_Babo_Wurst_JA_03_01");	//All right. Here's your spell scroll.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	b_giveinvitems(self,other,itsc_firebolt,1);
	Info_ClearChoices(dia_babo_wurst);
};

func void dia_babo_wurst_nein()
{
	AI_Output(other,self,"DIA_Babo_Wurst_NEIN_15_00");	//No, I won't do that.
	AI_Output(self,other,"DIA_Babo_Wurst_NEIN_03_01");	//Man, you're one of those people who are very particular about everything, huh?
	Info_ClearChoices(dia_babo_wurst);
};


instance DIA_BABO_YOUANDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_youandagon_condition;
	information = dia_babo_youandagon_info;
	permanent = FALSE;
	description = "What happened between you and Agon?";
};


func int dia_babo_youandagon_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_youandagon_info()
{
	AI_Output(other,self,"DIA_Babo_YouAndAgon_15_00");	//What happened between you and Agon?
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_01");	//Oh, we had a disagreement about how to take care of fire nettles.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_02");	//Agon had watered them so much that the plants almost had root rot already.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_03");	//Once the roots were completely rotten, he blamed me for it.
	AI_Output(self,other,"DIA_Babo_YouAndAgon_03_04");	//They've made me sweep the courtyard all day ever since.
};


instance DIA_BABO_WHYDIDAGON(C_INFO)
{
	npc = nov_612_babo;
	nr = 4;
	condition = dia_babo_whydidagon_condition;
	information = dia_babo_whydidagon_info;
	permanent = FALSE;
	description = "Why did Agon do that?";
};


func int dia_babo_whydidagon_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_whydidagon_info()
{
	AI_Output(other,self,"DIA_Babo_WhyDidAgon_15_00");	//Why did Agon do that?
	AI_Output(self,other,"DIA_Babo_WhyDidAgon_03_01");	//You'll have to ask him that. I think he just can't stand it when someone is better than he is.
};


instance DIA_BABO_PLANTLORE(C_INFO)
{
	npc = nov_612_babo;
	nr = 5;
	condition = dia_babo_plantlore_condition;
	information = dia_babo_plantlore_info;
	permanent = FALSE;
	description = "You seem to know a thing or two about plants?";
};


func int dia_babo_plantlore_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_youandagon) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_babo_plantlore_info()
{
	AI_Output(other,self,"DIA_Babo_PlantLore_15_00");	//You seem to know a thing or two about plants?
	AI_Output(self,other,"DIA_Babo_PlantLore_03_01");	//We had an herb garden where I learned a few tricks from my grandpa.
	AI_Output(self,other,"DIA_Babo_PlantLore_03_02");	//I'd really prefer to work in the garden again.
	MIS_HELPBABO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOGAERTNER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOGAERTNER,LOG_RUNNING);
	b_logentry(TOPIC_BABOGAERTNER,"Babo would rather work in the herb garden than sweep the yard.");
};


instance DIA_BABO_FEGEN(C_INFO)
{
	npc = nov_612_babo;
	nr = 2;
	condition = dia_babo_fegen_condition;
	information = dia_babo_fegen_info;
	permanent = FALSE;
	description = "I'm supposed to sweep the novices' chambers.";
};


func int dia_babo_fegen_condition()
{
	if(MIS_PARLANFEGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_babo_fegen_info()
{
	AI_Output(other,self,"DIA_Babo_Fegen_15_00");	//I'm supposed to sweep the novices' chambers.
	AI_Output(self,other,"DIA_Babo_Fegen_03_01");	//You've saddled yourself with a lot of work there. You know what - I'll help you. You'll never finish that alone.
	AI_Output(self,other,"DIA_Babo_Fegen_03_02");	//But I really need a 'Fist of Wind' spell scroll - you know, I got lucky and was allowed to read a book about it.
	AI_Output(self,other,"DIA_Babo_Fegen_03_03");	//And now, naturally, I want to try the spell. So, get me the spell scroll and I'll help you.
	b_logentry(TOPIC_PARLANFEGEN,"Babo will help me sweep the novices' chambers if I bring him a Fist of Wind spell scroll.");
};


instance DIA_BABO_WINDFAUST(C_INFO)
{
	npc = nov_612_babo;
	nr = 3;
	condition = dia_babo_windfaust_condition;
	information = dia_babo_windfaust_info;
	permanent = TRUE;
	description = "About the spell scroll...(GIVE FIST OF WIND)";
};


var int dia_babo_windfaust_permanent;

func int dia_babo_windfaust_condition()
{
	if((MIS_PARLANFEGEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_babo_fegen) && (DIA_BABO_WINDFAUST_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_babo_windfaust_info()
{
	AI_Output(other,self,"DIA_Babo_Windfaust_15_00");	//About the spell scroll...
	AI_Output(self,other,"DIA_Babo_Windfaust_03_01");	//Do you have a Fist of Wind spell for me?
	if(b_giveinvitems(other,self,itsc_windfist,1))
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_02");	//Here's the spell scroll you wanted.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_03");	//That's good. Then I'll help you clean the chambers.
		NOV_HELFER = NOV_HELFER + 1;
		DIA_BABO_WINDFAUST_PERMANENT = TRUE;
		b_giveplayerxp(XP_FEGER);
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FEGEN");
		b_logentry(TOPIC_PARLANFEGEN,"Babo will help me sweep the novices' chambers now.");
	}
	else
	{
		AI_Output(other,self,"DIA_Babo_Windfaust_15_04");	//No, not so far.
		AI_Output(self,other,"DIA_Babo_Windfaust_03_05");	//Then I'll wait until you do.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_LIFE(C_INFO)
{
	npc = nov_612_babo;
	nr = 10;
	condition = dia_babo_life_condition;
	information = dia_babo_life_info;
	permanent = TRUE;
	description = "How's life here in the monastery?";
};


func int dia_babo_life_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_babo_life_info()
{
	AI_Output(other,self,"DIA_Babo_Life_15_00");	//How's life here in the monastery?
	AI_Output(self,other,"DIA_Babo_Life_03_01");	//I don't mean to complain, but I never thought that it would be so strict here. If you don't stick to the rules, they punish you.
	AI_Output(self,other,"DIA_Babo_Life_03_02");	//Of course, a lot of novices want to study the teachings of Innos in the library, so they can be prepared if they're chosen.
	AI_Output(self,other,"DIA_Babo_Life_03_03");	//But I think the best preparation for the test of magic is fulfilling our own tasks.
	if(Npc_KnowsInfo(other,dia_igaranz_choosen) == FALSE)
	{
		AI_Output(other,self,"DIA_Babo_Life_15_04");	//What's the deal with the Chosen and that test?
		AI_Output(self,other,"DIA_Babo_Life_03_05");	//Talk to Brother Igaraz. He knows a lot about that.
	};
};


instance DIA_BABO_HOWISIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 1;
	condition = dia_babo_howisit_condition;
	information = dia_babo_howisit_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_babo_howisit_condition()
{
	if((hero.guild == GIL_KDF) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int babo_xpgiven;

func void dia_babo_howisit_info()
{
	AI_Output(other,self,"DIA_Babo_HowIsIt_15_00");	//How are you?
	if(MIS_HELPBABO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_01");	//(humbly) I thank the magicians for my task.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_02");	//I enjoy working in the garden and hope that the magicians are satisfied with me, Master.
		if(BABO_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			BABO_XPGIVEN = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_03");	//(startled) F.. f.. fine, Master.
		AI_Output(self,other,"DIA_Babo_HowIsIt_03_04");	//I, I work hard and try not to disappoint the magicians.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP2_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap2_exit_condition;
	information = dia_babo_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_babo_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap3_exit_condition;
	information = dia_babo_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP3_HELLO(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_hello_condition;
	information = dia_babo_kap3_hello_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_babo_kap3_hello_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_babo_kap3_hello_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Hello_15_00");	//What are you doing here?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_01");	//(sheepish) I try to accomplish the tasks given to me to the satisfaction of the monastery.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Hello_03_02");	//I must not speak with you. It is not looked on with favor if we talk to strangers.
	};
};


instance DIA_BABO_KAP3_KEEPTHEFAITH(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_keepthefaith_condition;
	information = dia_babo_kap3_keepthefaith_info;
	permanent = FALSE;
	description = "You must never lose faith.";
};


func int dia_babo_kap3_keepthefaith_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_babo_kap3_hello) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_keepthefaith_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_00");	//You must never lose faith.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_01");	//(caught in the act) No,... I mean, I would never do such a thing. Honest!
	AI_Output(other,self,"DIA_Babo_Kap3_KeepTheFaith_15_02");	//We all are often put through severe tests.
	AI_Output(self,other,"DIA_Babo_Kap3_KeepTheFaith_03_03");	//Yes, Master. I will always remember that. Thank you.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BABO_KAP3_UNHAPPY(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_unhappy_condition;
	information = dia_babo_kap3_unhappy_info;
	permanent = FALSE;
	description = "That doesn't sound terribly happy.";
};


func int dia_babo_kap3_unhappy_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_KDF) && Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_unhappy_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_15_00");	//That doesn't sound terribly happy.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_01");	//(caught in the act) Well... I mean, everything is just fine, really.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_03_02");	//Only... Oh, I don't want to complain.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"Stop whining then.",dia_babo_kap3_unhappy_lament);
	Info_AddChoice(dia_babo_kap3_unhappy,"Aw, come on, you can tell me.",dia_babo_kap3_unhappy_tellme);
};

func void dia_babo_kap3_unhappy_lament()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_00");	//Stop whining then.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_01");	//(afraid) I... I... please don't tell the magicians.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Lament_03_02");	//I don't want to be punished again.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Lament_15_03");	//I'll think about it.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_tellme()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_00");	//Aw, come on, you can tell me.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_01");	//And you really won't tell the magicians?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_02");	//Do I look like I would?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_03");	//All right. I have a problem with one of the novices. He's got a hold over me.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_TellMe_15_04");	//Come on, spit it out, then.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_05");	//Igaraz, that's the novice, found some of my private papers.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_TellMe_03_06");	//He threatened to give them to the magicians if I don't do what he says.
	MIS_BABOSDOCS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BABOSDOCS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BABOSDOCS,LOG_RUNNING);
	b_logentry(TOPIC_BABOSDOCS,"Igaraz is blackmailing the novice Babo about some documents.");
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"I think that's a little too personal for me.",dia_babo_kap3_unhappy_privat);
	Info_AddChoice(dia_babo_kap3_unhappy,"What are you supposed to do for him?",dia_babo_kap3_unhappy_shoulddo);
	Info_AddChoice(dia_babo_kap3_unhappy,"What kind of documents are those?",dia_babo_kap3_unhappy_documents);
	Info_AddChoice(dia_babo_kap3_unhappy,"Maybe I can help you.",dia_babo_kap3_unhappy_canhelpyou);
};

func void dia_babo_kap3_unhappy_privat()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_00");	//I think that's a little too personal for me.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Privat_03_01");	//I understand, you don't want any trouble. Then I'll just have to deal with it myself.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Privat_15_02");	//You'll manage somehow.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_shoulddo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_ShouldDo_15_00");	//What are you supposed to do for him?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_01");	//I don't like to talk about it. In any case, it isn't pleasing to Innos.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_ShouldDo_03_02");	//I don't want to think what would happen if it came out.
};

func void dia_babo_kap3_unhappy_documents()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_00");	//What kind of documents are those?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_01");	//(unsure) That's nobody's business. It's entirely my affair.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_02");	//Come on, tell me.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Documents_03_03");	//They are, eh... entirely normal documents. Nothing special.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Documents_15_04");	//I won't ask any further.
};

func void dia_babo_kap3_unhappy_canhelpyou()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_00");	//Maybe I can help you?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_01");	//You would do that?
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_02");	//That depends, of course.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_03");	//(hastily) Naturally, I'd pay you for that.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_CanHelpYou_15_04");	//How much?
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_CanHelpYou_03_05");	//Of course, I don't have much money, but I could give you a spell scroll. I have a healing spell.
	Info_ClearChoices(dia_babo_kap3_unhappy);
	Info_AddChoice(dia_babo_kap3_unhappy,"I'd rather stay away from that.",dia_babo_kap3_unhappy_no);
	Info_AddChoice(dia_babo_kap3_unhappy,"I'll see what I can do.",dia_babo_kap3_unhappy_yes);
};

func void dia_babo_kap3_unhappy_no()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_No_15_00");	//I'd rather stay away from that.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_No_03_01");	//Then I don't have a choice, I have to play along.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};

func void dia_babo_kap3_unhappy_yes()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_00");	//I'll see what I can do.
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_01");	//(happily) Honestly, it just has to work. It has to!
	AI_Output(self,other,"DIA_Babo_Kap3_Unhappy_Yes_03_02");	//So, you only need to find out where Igaraz keeps the stuff. Then you swipe it from him and everything will be just fine.
	AI_Output(other,self,"DIA_Babo_Kap3_Unhappy_Yes_15_03");	//Relax. You just continue for now. I'll see to the rest.
	Info_ClearChoices(dia_babo_kap3_unhappy);
};


instance DIA_BABO_KAP3_HAVEYOURDOCS(C_INFO)
{
	npc = nov_612_babo;
	nr = 31;
	condition = dia_babo_kap3_haveyourdocs_condition;
	information = dia_babo_kap3_haveyourdocs_info;
	permanent = FALSE;
	description = "I've got your documents.";
};


func int dia_babo_kap3_haveyourdocs_condition()
{
	if(((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_HasItems(other,itwr_babosdocs_mis) >= 1)) || ((Npc_HasItems(other,itwr_babospinup_mis) >= 1) && (Npc_HasItems(other,itwr_babosletter_mis) >= 1)))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_haveyourdocs_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_00");	//I've got your documents.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_01");	//Really? Thanks, you've saved me. I don't know how to thank you.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_15_02");	//Yeah, yeah, just calm down.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_03_03");	//(nervously) Are they really mine? Are you sure? Show me.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"I'm going to keep them a little while longer.",dia_babo_kap3_haveyourdocs_keepthem);
	if(BABOSDOCSOPEN == TRUE)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Based on the bare facts, the price has gone up.",dia_babo_kap3_haveyourdocs_iwantmore);
	};
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Here they are.",dia_babo_kap3_haveyourdocs_heretheyare);
};

func void dia_babo_kap3_haveyourdocs_keepthem()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_15_00");	//I'm going to keep them a little while longer.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_03_01");	//(stunned) What!? What is that supposed to mean? What are you planning?
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Just kidding.",dia_babo_kap3_haveyourdocs_keepthem_justjoke);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"That's my own business.",dia_babo_kap3_haveyourdocs_keepthem_myconcern);
	if(IGARAZ_ISPARTNER == LOG_SUCCESS)
	{
		Info_AddChoice(dia_babo_kap3_haveyourdocs,"Igaraz and I are partners.",dia_babo_kap3_haveyourdocs_keepthem_partner);
	};
};

func void dia_babo_kap3_haveyourdocs_keepthem_justjoke()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_00");	//Just kidding.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_01");	//(tartly) Ha ha, I can't laugh about it. So where are they?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_02");	//Here.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_03_03");	//I didn't mean to insult you, but I'm really nervous about the whole thing.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_JustJoke_15_04");	//It's all right. Have fun with your DOCUMENTS, then.
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_myconcern()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_00");	//That's my own business.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_03_01");	//The documents belong to me. You don't have the right to keep them.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_MyConcern_15_02");	//See you.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_00");	//Igaraz and I are partners now.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_01");	//(stunned) What? You can't do that.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_02");	//Looks like I can. I shall keep those papers, and everything stays the way it is.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_03");	//I shall settle the financial part with Igaraz.
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_15_04");	//Well, then, take good care of the plants.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_03_05");	//You're a swine. A miserable, greedy swine. Innos will punish you.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,DIALOG_ENDE,dia_babo_kap3_haveyourdocs_end);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Mind your language.",dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Haven't you got anything to do?",dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo);
};

func void dia_babo_kap3_haveyourdocs_end()
{
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_keepcalm()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_15_00");	//Mind your language.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_KeepThem_Partner_KeepCalm_03_01");	//I'm being far too nice, like always.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_keepthem_partner_nothingtodo()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_15_00");	//Haven't you got anything to do?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_NothingToDo_03_01");	//I understand all right, but believe me, there will be consequences.
	AI_StopProcessInfos(self);
};

func void dia_babo_kap3_haveyourdocs_iwantmore()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_00");	//Based on the bare facts, the price has gone up.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_01");	//You're no better than the others. What do you want?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_15_02");	//What have you got?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_03_03");	//I can give you 121 gold coins, that's all I have.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"That won't be enough.",dia_babo_kap3_haveyourdocs_iwantmore_notenough);
	Info_AddChoice(dia_babo_kap3_haveyourdocs,"Agreed.",dia_babo_kap3_haveyourdocs_iwantmore_thatsenough);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_notenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_15_00");	//That won't be enough.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_NotEnough_03_01");	//But I don't have any more money. If I had know that before, I never would have entered the monastery.
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_iwantmore_thatsenough()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_15_00");	//Agreed.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_IWantMore_ThatsEnough_03_01");	//Here is the money and the spell scroll.
	CreateInvItems(self,itsc_mediumheal,1);
	CreateInvItems(self,itmi_gold,121);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	b_giveinvitems(self,other,itmi_gold,121);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};

func void dia_babo_kap3_haveyourdocs_heretheyare()
{
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_00");	//Here they are.
	if(Npc_HasItems(other,itwr_babosdocs_mis) >= 1)
	{
		b_giveinvitems(other,self,itwr_babosdocs_mis,1);
	}
	else
	{
		b_giveinvitems(other,self,itwr_babospinup_mis,1);
		b_giveinvitems(other,self,itwr_babosletter_mis,1);
	};
	b_usefakescroll();
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_01");	//Yeah, they're complete.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_02");	//Did you look at them?
	AI_Output(other,self,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_15_03");	//Does that make a difference?
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_04");	//No, just as long as I have them back.
	AI_Output(self,other,"DIA_Babo_Kap3_HaveYourDocs_HereTheyAre_03_05");	//Now I hope I can rest easy again.
	CreateInvItems(self,itsc_mediumheal,1);
	b_giveinvitems(self,other,itsc_mediumheal,1);
	MIS_BABOSDOCS = LOG_SUCCESS;
	b_giveplayerxp(XP_BABOSDOCS);
	Info_ClearChoices(dia_babo_kap3_haveyourdocs);
};


instance DIA_BABO_KAP3_PERM(C_INFO)
{
	npc = nov_612_babo;
	nr = 39;
	condition = dia_babo_kap3_perm_condition;
	information = dia_babo_kap3_perm_info;
	permanent = TRUE;
	description = "Are you satisfied with your task?";
};


func int dia_babo_kap3_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_babo_kap3_hello))
	{
		return TRUE;
	};
};

func void dia_babo_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_00");	//Are you satisfied with your task?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_01");	//(less than convincing) Yes, of course. My faith in the wisdom and power of Innos gives me strength.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_02");	//(wriggling out) I don't mean to seem disrespectful, but I have a lot to do today.
		AI_Output(other,self,"DIA_Babo_Kap3_Perm_15_03");	//You may carry on.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_04");	//(relieved) Thanks.
	}
	else
	{
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_05");	//It's all right, but I need to get back to work, otherwise I'll never get finished today.
		AI_Output(self,other,"DIA_Babo_Kap3_Perm_03_06");	//I don't want to work half the night again, in order to finish my obligation and stay out of trouble.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP4_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap4_exit_condition;
	information = dia_babo_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_babo_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_KAP5_EXIT(C_INFO)
{
	npc = nov_612_babo;
	nr = 999;
	condition = dia_babo_kap5_exit_condition;
	information = dia_babo_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babo_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_babo_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABO_PICKPOCKET(C_INFO)
{
	npc = nov_612_babo;
	nr = 900;
	condition = dia_babo_pickpocket_condition;
	information = dia_babo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_babo_pickpocket_condition()
{
	return c_beklauen(17,25);
};

func void dia_babo_pickpocket_info()
{
	Info_ClearChoices(dia_babo_pickpocket);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_BACK,dia_babo_pickpocket_back);
	Info_AddChoice(dia_babo_pickpocket,DIALOG_PICKPOCKET,dia_babo_pickpocket_doit);
};

func void dia_babo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babo_pickpocket);
};

func void dia_babo_pickpocket_back()
{
	Info_ClearChoices(dia_babo_pickpocket);
};

