
instance DIA_ADDON_BDT_10014_THORUS_EXIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 999;
	condition = dia_addon_thorus_exit_condition;
	information = dia_addon_thorus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_thorus_exit_condition()
{
	return TRUE;
};

func void dia_addon_thorus_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10014_THORUS_HI(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 2;
	condition = dia_addon_thorus_hi_condition;
	information = dia_addon_thorus_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_hi_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_00");	//You know the rule. No one goes into the mine without a red stone tablet.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Hi_15_01");	//Forget the mine - I have to see Raven.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_02");	//Even then. We have rules here and they apply to everyone. Even to you.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_03");	//Go back. If you try to enter the upper square without permission, the other guards will kill you. THOSE are the rules.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Hi_12_04");	//If you have a problem with that, go talk to Esteban. He's responsible for the camp.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BDT_10014_THORUS_RAVEN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 3;
	condition = dia_addon_thorus_raven_condition;
	information = dia_addon_thorus_raven_info;
	permanent = FALSE;
	description = "It's important that I get to Raven...";
};


func int dia_addon_thorus_raven_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raven_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raven_15_00");	//It's important that I get to Raven...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_01");	//Oh, yeah? Do you really think you can make it through to him?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_02");	//His guards have orders not to let ANYONE in. You'd be dead before you even saw him.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raven_12_03");	//So knock that idea out of your head.
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven is the leader of the bandits. I will have to get some of them out of the way in order to get to him.");
};


instance DIA_ADDON_BDT_10014_THORUS_ZEIT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_zeit_condition;
	information = dia_addon_thorus_zeit_info;
	permanent = FALSE;
	description = "Don't you remember me? From the Old Camp...";
};


func int dia_addon_thorus_zeit_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_zeit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Zeit_15_00");	//Don't you remember me? From the Old Camp...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_01");	//You were one of the prisoners?! Maybe you were one of my guards. And? Does that make us allies now?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_02");	//No, it doesn't.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_03");	//Maybe you're the guy who brought down the Barrier - maybe you also killed my pals.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_04");	//So what?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_05");	//Those times are over.
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Zeit_12_06");	//You want in? Then get yourself a red stone and don't waste my time.
	};
};


var int thorus_goodoldperm;

instance DIA_ADDON_BDT_10014_THORUS_GOODOLDPERM(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 4;
	condition = dia_addon_thorus_goodoldperm_condition;
	information = dia_addon_thorus_goodoldperm_info;
	permanent = TRUE;
	description = "Come on, let me in. For old times' sake.";
};


func int dia_addon_thorus_goodoldperm_condition()
{
	if((MIS_SEND_BUDDLER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_bdt_10014_thorus_zeit) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_goodoldperm_info()
{
	AI_Output(other,self,"DIA_Addon_Thorus_Add_15_00");	//Come on, let me in. For old times' sake.
	if(THORUS_GOODOLDPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_01");	//Let me explain something to you. Do you know why I'm still alive?
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_02");	//Because I've always been loyal to my people.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_03");	//I don't have to agree with everything Raven does. But I'll stick to the rules.
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_04");	//And so will you!
		THORUS_GOODOLDPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Add_12_05");	//(firmly) No!
	};
};

func int c_playerhaswrongtoken()
{
	if((c_schasmagicstoneplate() == TRUE) || (Npc_HasItems(hero,itwr_stoneplatecommon_addon) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_02) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_03) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_04) >= 1) || (Npc_HasItems(hero,itmi_addon_stone_05) >= 1))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_ADDON_BDT_10014_THORUS_STEIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_stein_condition;
	information = dia_addon_thorus_stein_info;
	permanent = TRUE;
	description = "I have a stone tablet for you here...";
};


func int dia_addon_thorus_stein_condition()
{
	if((c_playerhaswrongtoken() == TRUE) && (RAVENISDEAD == FALSE) && (MIS_SEND_BUDDLER != LOG_RUNNING) && (MIS_SEND_BUDDLER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_stein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Stein_15_00");	//I have a stone tablet for you here...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Stein_12_01");	//You don't have the right stone. Only the red ones are important.
};


instance DIA_ADDON_BDT_10014_THORUS_REIN(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_rein_condition;
	information = dia_addon_thorus_rein_info;
	permanent = FALSE;
	description = "I have a red stone tablet here...";
};


func int dia_addon_thorus_rein_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_01) >= 1) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_rein_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_00");	//I have a red stone tablet here...
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_01");	//Okay.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_02");	//You killed Esteban - so YOU will do his job now.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_03");	//They have a few problems with minecrawlers in the mine.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_04");	//Three diggers have bought it already. It's your job to provide replacements.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Rein_15_05");	//And when can I finally get into the damned mine?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Rein_12_06");	//Do your job - afterwards you can do what you want.
	MIS_SEND_BUDDLER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BUDDLER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BUDDLER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BUDDLER,"Since I have taken over Esteban's job, I'm supposed to send three diggers to the mine.");
};


instance DIA_ADDON_BDT_10014_THORUS_SENT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 9;
	condition = dia_addon_thorus_sent_condition;
	information = dia_addon_thorus_sent_info;
	permanent = FALSE;
	description = "I sent out three guys.";
};


func int dia_addon_thorus_sent_condition()
{
	if((PLAYER_SENTBUDDLER >= 3) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_sent_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Sent_15_00");	//I sent out three guys.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Sent_12_01");	//All right. Then as far as I'm concerned you can go in.
	MIS_SEND_BUDDLER = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_BDT_10014_THORUS_ARMOR(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_armor_condition;
	information = dia_addon_thorus_armor_info;
	permanent = FALSE;
	description = "Hey, what's with your armor? Where can I get armor like that?";
};


func int dia_addon_thorus_armor_condition()
{
	if(RAVENISDEAD == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_armor_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Armor_15_00");	//Hey, what's with your armor? Where can I get armor like that?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_01");	//You can't. This armor is reserved for Raven's guard.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Armor_12_02");	//I hardly think there's an entrance exam for new candidates. But the ultimate decision isn't mine, it's Raven's.
};


instance DIA_ADDON_THORUS_GEFANGENE(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 88;
	condition = dia_addon_thorus_gefangene_condition;
	information = dia_addon_thorus_gefangene_info;
	permanent = FALSE;
	description = "How are the prisoners?";
};


func int dia_addon_thorus_gefangene_condition()
{
	if(!Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_gefangene_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_00");	//How are the prisoners?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_01");	//Mmh, they've done their job. As far as I know, they're supposed to be digging gold now.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_02");	//And if they escape...?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_03");	//... Bloodwyn will send his guards after them. But I hardly think they would be crazy enough to try to escape.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_04");	//Unless...
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Gefangene_15_05");	//Unless, what?
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Gefangene_12_06");	//... someone else put them up to it. But I don't know anyone stupid enough to do that... at least, so long as Bloodwyn is here.
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_THORUS_SPEECH(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_speech_condition;
	information = dia_addon_thorus_speech_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_thorus_speech_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_speech_info()
{
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_00");	//What are you planning?
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_01");	//What??
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_02");	//Now you've cleared Bloodwyn out of the way, too. I'm just asking myself who's next. Raven? Or me?
		AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_03");	//Are you afraid?
		AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_04");	//I'm not afraid of a fight. But I am afraid of the consequences of your actions.
	};
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_05");	//This camp is the only thing we have left.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_06");	//It may not have always run to perfection, but it DOES run.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_07");	//And with every person you kill, another piece of our community breaks up.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_08");	//We are bandits. Outcasts, lawbreakers, desperados.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_09");	//Wherever we go, we're hunted, locked up and killed.
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_10");	//There is no better place for us than this, no better time than now.
	AI_Output(other,self,"DIA_Addon_Thorus_Speech_15_11");	//What are you getting at?
	AI_Output(self,other,"DIA_Addon_Thorus_Speech_12_12");	//These men need someone to lead them. Who should that be? You? You, who is constantly roaming from place to place?
};


instance DIA_ADDON_THORUS_ANSWER(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_answer_condition;
	information = dia_addon_thorus_answer_info;
	permanent = FALSE;
	description = "Then you take over the leadership of the camp.";
};


func int dia_addon_thorus_answer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_thorus_speech))
	{
		return TRUE;
	};
};

func void dia_addon_thorus_answer_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_00");	//Then you take over the leadership of the camp.
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_01");	//Okay, but what about Raven?
		AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_02");	//Raven will soon have other worries. I'll take care of him.
	};
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Answer_15_03");	//Oh, yes, and make sure that the prisoners can leave the camp in peace.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Answer_12_04");	//All right. I shall take care of all the guards out here.
	b_logentry(TOPIC_ADDON_SKLAVEN,"Bloodwyn is dead, and Thorus will make sure that the slaves can leave the camp.");
	if(!Npc_IsDead(prisonguard))
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Now I'll talk to the 'slave guard' again, then Patrick and his boys can take off.");
	}
	else
	{
		b_logentry(TOPIC_ADDON_SKLAVEN,"Since the 'slave guard' is finished, Patrick can now leave with his boys.");
	};
};


instance DIA_ADDON_THORUS_RAVENTOT(C_INFO)
{
	npc = bdt_10014_addon_thorus;
	nr = 99;
	condition = dia_addon_thorus_raventot_condition;
	information = dia_addon_thorus_raventot_info;
	permanent = FALSE;
	description = "I did it. Raven is finished.";
};


func int dia_addon_thorus_raventot_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thorus_raventot_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_00");	//I did it. Raven is finished.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_01");	//That means you've given Beliar a swift kick.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_02");	//Then you'll be moving on?
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_03");	//My job in this valley is done. I could use a few days' rest.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_04");	//(laughs) Yeah, you're constantly on the move, aren't you? (seriously) Have a good journey.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Thorus_Raventot_15_05");	//Who knows, maybe we'll run into each other again.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Thorus_Raventot_12_06");	//Who knows. There will be lots of gates and passages for you to go through. And you're bound to find me on one of them...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

