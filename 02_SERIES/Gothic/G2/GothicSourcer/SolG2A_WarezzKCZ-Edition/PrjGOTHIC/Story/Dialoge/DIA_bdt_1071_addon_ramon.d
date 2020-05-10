
instance DIA_ADDON_RAMON_EXIT(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 999;
	condition = dia_addon_ramon_exit_condition;
	information = dia_addon_ramon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_ramon_exit_condition()
{
	return TRUE;
};

func void dia_addon_ramon_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1071_CHECKPOINT = "BL_UP_CHECK";

instance DIA_ADDON_RAMON_FIRSTWARN(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 1;
	condition = dia_addon_ramon_firstwarn_condition;
	information = dia_addon_ramon_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_firstwarn_info()
{
	if(Npc_IsDead(franco))
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_00");	//Hey, what happened down there?
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_01");	//I flattened Franco.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_02");	//So? Then now it's YOUR job to make sure the lazy dogs do their work every day.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_03");	//Hey, I'm not here to be bothered with the hunters. I want to enter the camp.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_04");	//Forget it. You did in Franco - now you're the leader. So do your job.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_05");	//If I'm the leader, then I decide who goes in next.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_06");	//And I decided that I'M next.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_07");	//(laughs) It isn't that easy. We haven't asked for ANYONE, so NO one gets in.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_08");	//Thorus can send a new leader for the hunters, then there will be a vacancy inside for me.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_09");	//(laughs) You don't give up, do you? Okay, then move your butt inside.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_10");	//Thorus will make sure that the hunters won't have to live without a leader.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_11");	//What are you waiting for? And get yourself a pickaxe.
		self.aivar[AIV_PASSGATE] = TRUE;
		PLAYER_HASTALKEDTOBANDITCAMP = TRUE;
		b_giveplayerxp(XP_ADDON_HINEIN);
		AI_StopProcessInfos(self);
		AI_Teleport(carlos,"BL_WAIT_FINN");
		b_startotherroutine(carlos,"START");
		b_startotherroutine(finn,"START");
	}
	else if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_12");	//Hey, what do you want? I can't imagine you have a permit for the camp.
		if(Npc_KnowsInfo(other,dia_addon_franco_hi))
		{
			AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_13");	//Franco sent me. He wants to know if anyone is needed in the camp.
		};
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_14");	//Yeah, we need someone. Another one of the guys kicked the bucket yesterday.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_15");	//That idiot tangled with Esteban.
		AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_15_16");	//Who is Esteban?
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_17");	//The leader of the lower camp. He decides who gets into the mine.
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_18");	//So tell Franco that Thorus wants a new man. Got it?
		Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FRANCO,"Thorus needs a new man for the camp. Franco will be interested.");
		Info_ClearChoices(dia_addon_ramon_firstwarn);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? THE Thorus?",dia_addon_ramon_firstwarn_yes);
		Info_AddChoice(dia_addon_ramon_firstwarn,"Thorus? Never heard of him...",dia_addon_ramon_firstwarn_no);
		RAMON_NEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_07_19");	//Hey, slow down! You aren't getting in there - so beat it!
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};

func void dia_addon_ramon_firstwarn_yes()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_00");	//Thorus? THE Thorus?
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_01");	//Yes. THE Thorus. THE man who calls for new people.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_02");	//The man who decides if and when a new guy gets out of the swamp and into the camp.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_03");	//You aren't trying to tell me that you know him from earlier?
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_YES_15_04");	//Well... yes...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_05");	//Listen - EVERYONE knows Thorus.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_YES_07_06");	//Nevertheless, you aren't getting in - and I WON'T give him a message!
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};

func void dia_addon_ramon_firstwarn_no()
{
	AI_Output(other,self,"DIA_Addon_Ramon_FirstWarn_NO_15_00");	//Thorus? Never heard of him...
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_01");	//Oh man, you don't know him? He was the chief of the guards in the Old Camp.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_02");	//He's the man everybody trusts.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_03");	//He calls for new people, and he decides if and when a new man gets into the camp.
	AI_Output(self,other,"DIA_Addon_Ramon_FirstWarn_NO_07_04");	//If you live long enough, you'll get to know him.
	Info_ClearChoices(dia_addon_ramon_firstwarn);
};


instance DIA_ADDON_RAMON_SECONDWARN(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 2;
	condition = dia_addon_ramon_secondwarn_condition;
	information = dia_addon_ramon_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Ramon_SecondWarn_07_00");	//One more step and it'll be your last!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1071_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_ATTACK(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 3;
	condition = dia_addon_ramon_attack_condition;
	information = dia_addon_ramon_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_ramon_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1071_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Ramon_Attack_07_00");	//Some people never learn...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_ADDON_RAMON_NEWS(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_news_condition;
	information = dia_addon_ramon_news_info;
	permanent = FALSE;
	description = "I'm the new man.";
};


func int dia_addon_ramon_news_condition()
{
	if(!Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_news_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_News_15_00");	//I'm the new man.
	AI_Output(self,other,"DIA_Addon_Ramon_News_07_01");	//Hey, don't try to fool me. It's still Franco who decides which of you gets into the camp.
};


instance DIA_ADDON_RAMON_LIE(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 10;
	condition = dia_addon_ramon_lie_condition;
	information = dia_addon_ramon_lie_info;
	permanent = FALSE;
	description = "Franco sent me...";
};


func int dia_addon_ramon_lie_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_ramon_news) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_lie_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Lie_15_00");	//Franco sent me...
	AI_Output(self,other,"DIA_Addon_Ramon_Lie_07_01");	//He did not. So beat it, otherwise I'll break your bones...
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAMON_PERM(C_INFO)
{
	npc = bdt_1071_addon_ramon;
	nr = 99;
	condition = dia_addon_ramon_perm_condition;
	information = dia_addon_ramon_perm_info;
	permanent = TRUE;
	description = "Everything under control?";
};


func int dia_addon_ramon_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_ramon_news) && !Npc_IsDead(franco))
	{
		return TRUE;
	};
};

func void dia_addon_ramon_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Ramon_Perm_15_00");	//Everything under control?
	AI_Output(self,other,"DIA_Addon_Ramon_Perm_07_01");	//Everything is fine here - as long as no one tries to get in who SHOULDN'T.
	AI_StopProcessInfos(self);
};

