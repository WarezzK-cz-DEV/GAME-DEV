
instance DIA_ADDON_SAWPIRATE_EXIT(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 999;
	condition = dia_addon_sawpirate_exit_condition;
	information = dia_addon_sawpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_sawpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAWPIRATE_HELLO(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 1;
	condition = dia_addon_sawpirate_hello_condition;
	information = dia_addon_sawpirate_hello_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_sawpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_sawpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_Hello_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_SawPirate_Hello_09_01");	//Stop gabbing at me.
};


instance DIA_ADDON_SAWPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 11;
	condition = dia_addon_sawpirate_anheuern_condition;
	information = dia_addon_sawpirate_anheuern_info;
	permanent = FALSE;
	description = "Are you one of Henry's boys?";
};


func int dia_addon_sawpirate_anheuern_condition()
{
	if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_00");	//Are you one of Henry's boys?
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_01");	//No. I'm just sawing up this tree for entertainment.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_02");	//What's up? Did Henry tell you what you're supposed to do?
	AI_Output(other,self,"DIA_Addon_Bones_JoinHenry_15_04");	//Yes. I'm supposed to do in a few bandits for him.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_03");	//(fending off) Ooh no! Don't LOOK at me that way. I don't wanna go there.
	AI_Output(self,other,"DIA_Addon_SawPirate_Anheuern_09_04");	//Just leave me to my sawing, will you?
};


var int sawpirate_comeon_once;

instance DIA_ADDON_SAWPIRATE_COMEON(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 12;
	condition = dia_addon_sawpirate_comeon_condition;
	information = dia_addon_sawpirate_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_sawpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_HENRY_FREEBDTTOWER == LOG_RUNNING) && (c_towerbanditsdead() == FALSE) && Npc_KnowsInfo(other,dia_addon_sawpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_ComeOn_15_00");	//Come with me.
	if(hammerpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_01");	//Why? You've already got somebody with you...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_04");	//First let's go back a little towards the camp.
		AI_StopProcessInfos(self);
	}
	else if(!Npc_IsDead(hammerpirate) && (SAWPIRATE_COMEON_ONCE == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_02");	//(to himself) He COULD have asked somebody ELSE...
		SAWPIRATE_COMEON_ONCE = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_SawPirate_ComeOn_09_03");	//(sighs) Aye aye...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SAWPIRATE_GOHOME(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 13;
	condition = dia_addon_sawpirate_gohome_condition;
	information = dia_addon_sawpirate_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_sawpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_SawPirate_GoHome_15_00");	//I no longer need you.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_01");	//I guess I'll go back to my sawing then.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SAWPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 14;
	condition = dia_addon_sawpirate_toofar_condition;
	information = dia_addon_sawpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_sawpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_TooFar_09_01");	//We're too far away from the camp.
	AI_Output(self,other,"DIA_Addon_SawPirate_GoHome_09_02");	//I don't like this at all. I'm going back now.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAWPIRATE_SUCCESS(C_INFO)
{
	npc = pir_1361_addon_pirat;
	nr = 14;
	condition = dia_addon_sawpirate_success_condition;
	information = dia_addon_sawpirate_success_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_sawpirate_success_condition()
{
	if((c_towerbanditsdead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_sawpirate_success_info()
{
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_01");	//You know what - I've been doing some thinking. You're an asshole!
	AI_Output(self,other,"DIA_Addon_SawPirate_Success_09_02");	//I'm headed back to the camp, and I hope I never set eyes on you again!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

