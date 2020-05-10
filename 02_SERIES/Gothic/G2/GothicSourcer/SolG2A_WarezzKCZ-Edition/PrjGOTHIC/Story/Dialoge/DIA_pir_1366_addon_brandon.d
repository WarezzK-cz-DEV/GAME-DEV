
instance DIA_ADDON_BRANDON_EXIT(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 999;
	condition = dia_addon_brandon_exit_condition;
	information = dia_addon_brandon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_brandon_exit_condition()
{
	return TRUE;
};

func void dia_addon_brandon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BRANDON_HELLO(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 1;
	condition = dia_addon_brandon_hello_condition;
	information = dia_addon_brandon_hello_info;
	important = TRUE;
};


func int dia_addon_brandon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_00");	//Looky there. A newbie.
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_01");	//And a landlubber at that!
	AI_Output(self,other,"DIA_Addon_Brandon_Hello_04_02");	//You're a bit scrawny for a pirate.
};


instance DIA_ADDON_BRANDON_ANYNEWS(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 99;
	condition = dia_addon_brandon_anynews_condition;
	information = dia_addon_brandon_anynews_info;
	permanent = TRUE;
	description = "Anything new?";
};


func int dia_addon_brandon_anynews_condition()
{
	return TRUE;
};

func void dia_addon_brandon_anynews_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_AnyNews_15_00");	//Anything new?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_01");	//You can say that. I'm injured. Have you got a healing potion to spare?
		}
		else if(c_allcanyonrazordead() == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_02");	//What now? Are we going to clobber those beasts, or not?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Brandon_Alright_04_03");	//The questions you ask! I don't think there's a single razor left in the whole damn canyon.
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg) && (MIS_ADDON_GREG_CLEARCANYON != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_04");	//No, but now that Greg is back, I hope that is bound to change soon.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_06");	//(conspiratorial) Wait a moment.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Addon_Brandon_AnyNews_04_07");	//(laughs) Not as far as I can see. Same old, same old!
	};
};


instance DIA_ADDON_BRANDON_WANNALEARN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_wannalearn_condition;
	information = dia_addon_brandon_wannalearn_info;
	description = "Can you teach me something?";
};


func int dia_addon_brandon_wannalearn_condition()
{
	return TRUE;
};

func void dia_addon_brandon_wannalearn_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_WannaLearn_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_01");	//Teach you? You bet! I could teach you to become stronger and improve your dexterity.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_02");	//But why would I want to do that?
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_OfferDrink_15_00");	//Because I'll buy you a drink?
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_03");	//(grinning) Not bad, kiddo! Got it - first try.
	AI_Output(self,other,"DIA_Addon_Brandon_WannaLearn_04_04");	//But don't even bother to bring me some cheap rotgut.
	MIS_BRANDON_BRINGHERING = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_BRANDONTEACH);
	Log_CreateTopic(TOPIC_ADDON_BRANDONBOOZE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRANDONBOOZE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_BRANDONBOOZE,"I am to buy Brandon a drink. Then he will be ready to teach me.");
};


instance DIA_ADDON_BRANDON_HOLEGROG(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_holegrog_condition;
	information = dia_addon_brandon_holegrog_info;
	description = "I'll get you some grog.";
};


func int dia_addon_brandon_holegrog_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_holegrog_info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_BringGrog_15_00");	//I'll get you some grog.
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_01");	//Are you trying to poison me???
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_02");	//I'm NOT touching that muck! Do you have any idea what's IN there?
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_03");	//Old Samuel has some GOOD stuff as well! Go get me some of THAT!
	if(PLAYER_KNOWSSCHNELLERHERING == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_05");	//You're talking about his 'Hasty Herring'?
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_04");	//Aye, that's what I mean.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_05");	//Have you ever tried Samuel's special recipe?
		AI_Output(other,self,"DIA_Addon_Brandon_Hello_15_07");	//No, not yet.
		AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_06");	//Then have a go at it. It's a MUST-try!
	};
	AI_Output(self,other,"DIA_Addon_Brandon_HoleGrog_04_08");	//How I LOVE this concoction!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"Grog isn't enough for Brandon. He wants a 'Hasty Herring'. Only Samuel has the stuff.");
};


instance DIA_ADDON_BRANDON_SCHNELLERHERING(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_schnellerhering_condition;
	information = dia_addon_brandon_schnellerhering_info;
	description = "Take this Hasty Herring!";
};


func int dia_addon_brandon_schnellerhering_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn) && (Npc_HasItems(other,itfo_addon_schnellerhering) > 0))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_schnellerhering_info()
{
	AI_Output(other,self,"DIA_Addon_Pir_7_HenrysCrew_GiveGrog_15_00");	//Here you go.
	b_giveinvitems(other,self,itfo_addon_schnellerhering,1);
	b_useitem(self,itfo_addon_schnellerhering);
	AI_Output(self,other,"DIA_Addon_Brandon_GiveGrog_04_01");	//Ahh! Down the hatch like liquid fire!
	b_logentry(TOPIC_ADDON_BRANDONBOOZE,"I have given Brandon that awful rotgut. Now he is ready to train me.");
	MIS_BRANDON_BRINGHERING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


var int brandon_merke_str;
var int brandon_merke_dex;

instance DIA_ADDON_BRANDON_TEACHPLAYER(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 777;
	condition = dia_addon_brandon_teachplayer_condition;
	information = dia_addon_brandon_teachplayer_info;
	permanent = TRUE;
	description = "Teach me something!";
};


func int dia_addon_brandon_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_brandon_wannalearn))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_TeachPlayer_15_00");	//Teach me something!
	BRANDON_MERKE_STR = other.attribute[ATR_STRENGTH];
	BRANDON_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	if(MIS_BRANDON_BRINGHERING == LOG_SUCCESS)
	{
		Info_ClearChoices(dia_addon_brandon_teachplayer);
		Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_brandon_teachplayer_dex_1);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_brandon_teachplayer_dex_5);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_brandon_teachplayer_str_1);
		Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_brandon_teachplayer_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_04_01");	//You were going to get me something decent to drink, boy!
	};
};

func void dia_addon_brandon_teachplayer_back()
{
	if(other.attribute[ATR_STRENGTH] > BRANDON_MERKE_STR)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_00");	//All right, lad! You've gotten quite a bit stronger already.
	};
	if(other.attribute[ATR_DEXTERITY] > BRANDON_MERKE_DEX)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TeachPlayer_Back_04_01");	//The more dexterous you are, the better you'll hit your target.
	};
	Info_ClearChoices(dia_addon_brandon_teachplayer);
};

func void dia_addon_brandon_teachplayer_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_brandon_teachplayer_str_5);
};

func void dia_addon_brandon_teachplayer_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_addon_brandon_teachplayer);
	Info_AddChoice(dia_addon_brandon_teachplayer,DIALOG_BACK,dia_addon_brandon_teachplayer_back);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_brandon_teachplayer_dex_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_brandon_teachplayer_dex_5);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_brandon_teachplayer_str_1);
	Info_AddChoice(dia_addon_brandon_teachplayer,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_brandon_teachplayer_str_5);
};


instance DIA_ADDON_BRANDON_ANHEUERN(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 11;
	condition = dia_addon_brandon_anheuern_condition;
	information = dia_addon_brandon_anheuern_info;
	permanent = FALSE;
	description = "You're supposed to help me.";
};


func int dia_addon_brandon_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_brandon_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_00");	//You're supposed to help me.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_01");	//That's news to me. Says who?
	AI_Output(other,self,"DIA_Addon_Brandon_FollowMe_15_02");	//Says Greg. We're off to hunt razors in the canyon.
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_03");	//(grinning) Finally, something's happening around here!
	AI_Output(self,other,"DIA_Addon_Brandon_Anheuern_04_04");	//Then let's go right away, the sooner we do in those beasts, the sooner we get to be back here.
};


instance DIA_ADDON_BRANDON_COMEON(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 12;
	condition = dia_addon_brandon_comeon_condition;
	information = dia_addon_brandon_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_brandon_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_brandon_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Weiter_15_00");	//Come with me.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_02");	//Let's go back a little first.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_ComeOn_04_01");	//I'm right here!
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_BRANDON_GOHOME(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 13;
	condition = dia_addon_brandon_gohome_condition;
	information = dia_addon_brandon_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_brandon_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_brandon_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_DontNeedYou_15_00");	//I no longer need you.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_01");	//All right, no problem.
	AI_Output(self,other,"DIA_Addon_Brandon_GoHome_04_02");	//Maybe we can have a drink together some time.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BRANDON_TOOFAR(C_INFO)
{
	npc = pir_1366_addon_brandon;
	nr = 14;
	condition = dia_addon_brandon_toofar_condition;
	information = dia_addon_brandon_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_brandon_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_brandon_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_00");	//Enough already! Are you trying to depopulate the whole island?
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_01");	//We're headed back to the camp.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Brandon_TooFar_04_02");	//I'm headed back to the camp.
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

