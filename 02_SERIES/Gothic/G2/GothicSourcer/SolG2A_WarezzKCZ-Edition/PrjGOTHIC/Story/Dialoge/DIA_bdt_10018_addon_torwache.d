
instance DIA_ADDON_BDT_10018_TORWACHE_EXIT(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 999;
	condition = dia_addon_bdt_10018_torwache_exit_condition;
	information = dia_addon_bdt_10018_torwache_exit_info;
	permanent = TRUE;
	description = "We'll talk again.";
};


func int dia_addon_bdt_10018_torwache_exit_condition()
{
	return TRUE;
};

func void dia_addon_bdt_10018_torwache_exit_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_EXIT_15_00");	//We'll talk again.
	if(BDT_100018_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_01");	//You already know what I'll tell you then...
		BDT_100018_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_EXIT_04_02");	//Beat it.
	};
	AI_StopProcessInfos(self);
};


const string BDT_10018_CHECKPOINT = "BL_RAVEN_CHECK";

instance DIA_ADDON_BDT_10018_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 1;
	condition = dia_addon_bdt_10018_torwache_firstwarn_condition;
	information = dia_addon_bdt_10018_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_firstwarn_info()
{
	if(BDT_100018_TELLS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_00");	//Hey, slow down! You aren't getting in there - so beat it!
		AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_FirstWarn_15_01");	//Get out of my way - I have to see Raven.
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_02");	//No one enters these quarters. Direct orders from Raven himself.
		BDT_100018_TELLS = TRUE;
		Log_CreateTopic(TOPIC_ADDON_TEMPEL,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_TEMPEL,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_TEMPEL,"The gatekeeper in front of the temple won't let me in. I'll have to find a way to get inside.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_FirstWarn_04_03");	//You again? You're getting on my nerves!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_10018_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_ADDON_BDT_10018_TORWACHE_SECONDWARN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_bdt_10018_torwache_secondwarn_condition;
	information = dia_addon_bdt_10018_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_SecondWarn_04_00");	//One more step and it'll be your last!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_10018_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10018_TORWACHE_ATTACK(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 3;
	condition = dia_addon_bdt_10018_torwache_attack_condition;
	information = dia_addon_bdt_10018_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_bdt_10018_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_10018_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_bdt_10018_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Attack_04_00");	//For Raven!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_ADDON_BDT_10018_TORWACHE_HI(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_hi_condition;
	information = dia_addon_10018_torwache_hi_info;
	permanent = FALSE;
	description = "It is damned important that I get to him.";
};


func int dia_addon_10018_torwache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10018_torwache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Hi_15_00");	//It is damned important that I get to him.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Hi_04_01");	//No. It isn't. Only Bloodwyn has permission to stay in there.
	b_logentry(TOPIC_ADDON_TEMPEL,"Only Bloodwyn is allowed to stay in the temple. Maybe I can get into the temple through him.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_BLOODWYN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 2;
	condition = dia_addon_10018_torwache_bloodwyn_condition;
	information = dia_addon_10018_torwache_bloodwyn_info;
	permanent = FALSE;
	description = "Bloodwyn? Isn't he supposed to be dead?";
};


func int dia_addon_10018_torwache_bloodwyn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_bloodwyn_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_15_00");	//Bloodwyn? Isn't he supposed to be dead?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bloodwyn_04_01");	//He's stronger than ever before. And if he finds out that someone is causing trouble out here, he'll make mincemeat out of you.
};


instance DIA_ADDON_BDT_10018_TORWACHE_BRIBE(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 9;
	condition = dia_addon_10018_torwache_bribe_condition;
	information = dia_addon_10018_torwache_bribe_info;
	permanent = FALSE;
	description = "I'll give you a thousand gold pieces if you let me in.";
};


func int dia_addon_10018_torwache_bribe_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_bribe_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Bribe_15_00");	//I'll give you a thousand gold pieces if you let me in.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Bribe_04_01");	//You're wasting your time, bum.
};


instance DIA_ADDON_BDT_10018_TORWACHE_DRIN(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_drin_condition;
	information = dia_addon_10018_torwache_drin_info;
	permanent = FALSE;
	description = "Bloodwyn is in there? Then get him out.";
};


func int dia_addon_10018_torwache_drin_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bdt_10018_torwache_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_drin_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_Drin_15_00");	//Bloodwyn is in there? Then get him out.
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_01");	//Ha! Do you seriously believe I'd do that?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_02");	//Maybe you're an important man in the camp now. But your power ends RIGHT HERE. Got it?
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_Drin_04_03");	//So go to the mine and dig for gold or do something else - but don't stand in the way here!
	MIS_BLOODWYNRAUS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn is in the temple. But I'm not getting anywhere here. Maybe I should have a look around in the mine.");
};


instance DIA_ADDON_BDT_10018_TORWACHE_KOPF(C_INFO)
{
	npc = bdt_10018_addon_torwache;
	nr = 90;
	condition = dia_addon_10018_torwache_kopf_condition;
	information = dia_addon_10018_torwache_kopf_info;
	permanent = FALSE;
	description = "(show Bloodwyn's head)";
};


func int dia_addon_10018_torwache_kopf_condition()
{
	if(Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1)
	{
		return TRUE;
	};
};

func void dia_addon_10018_torwache_kopf_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10018_Torwache_kopf_15_00");	//Here! Do you still want to stop me now!?
	if(Npc_HasItems(hero,itmi_addon_bloodwyn_kopf) >= 1)
	{
		AI_PrintScreen("Bloodwyn's head thrown at guard's feet.",-1,26,FONT_SCREENBRIGHTLARGE,2);
		Npc_RemoveInvItems(hero,itmi_addon_bloodwyn_kopf,1);
	};
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_01");	//Is that... is that... Bloodwyn...? Bleah, that's...
	AI_Output(self,other,"DIA_Addon_BDT_10018_Torwache_kopf_04_02");	//Uh... yes, uh no. I mean... uh... you can go in...
	MIS_BLOODWYNRAUS = LOG_SUCCESS;
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

