
instance DIA_ADDON_HAMMERPIRATE_EXIT(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 999;
	condition = dia_addon_hammerpirate_exit_condition;
	information = dia_addon_hammerpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_hammerpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_hammerpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HAMMERPIRATE_HELLO(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 1;
	condition = dia_addon_hammerpirate_hello_condition;
	information = dia_addon_hammerpirate_hello_info;
	permanent = TRUE;
	description = "Everything ship-shape?";
};


func int dia_addon_hammerpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_hammerpirate_hello_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_Hello_15_00");	//Everything ship-shape?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(c_towerbanditsdead() == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_01");	//Sure, now that we've got that over with. Those scumbags are as flat as flounders!
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_02");	//Let's get it over with!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Hello_07_03");	//No! Hammering's just not my thing.
	};
};


instance DIA_ADDON_HAMMERPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 11;
	condition = dia_addon_hammerpirate_anheuern_condition;
	information = dia_addon_hammerpirate_anheuern_info;
	permanent = FALSE;
	description = "You're supposed to help me.";
};


func int dia_addon_hammerpirate_anheuern_condition()
{
	if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_00");	//Don't tell me! You want me to come along and help you flatten those bandits!
	AI_Output(other,self,"DIA_Addon_PIR_6_JoinHenry_15_08");	//You got it.
	if(!Npc_IsDead(sawpirate))
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_01");	//Why don't you ask the guy who's manning the saw?
	};
	AI_Output(self,other,"DIA_Addon_HammerPirate_Anheuern_07_02");	//I... can't use all this stress...
};


instance DIA_ADDON_HAMMERPIRATE_COMEON(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 12;
	condition = dia_addon_hammerpirate_comeon_condition;
	information = dia_addon_hammerpirate_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_hammerpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_HENRY_FREEBDTTOWER == LOG_RUNNING) && (c_towerbanditsdead() == FALSE) && Npc_KnowsInfo(other,dia_addon_hammerpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_ComeOn_15_00");	//Come with me.
	if(sawpirate.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_01");	//Henry needs one of us to stay HERE...
	}
	else if(Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000)
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_02");	//Let's go back a little towards the camp first.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_HammerPirate_ComeOn_07_03");	//(sighs) Aye aye...
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_HAMMERPIRATE_GOHOME(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 13;
	condition = dia_addon_hammerpirate_gohome_condition;
	information = dia_addon_hammerpirate_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_hammerpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_HammerPirate_GoHome_15_00");	//I no longer need you.
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_01");	//If you say so...
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_HAMMERPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 14;
	condition = dia_addon_hammerpirate_toofar_condition;
	information = dia_addon_hammerpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_hammerpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_08") > 6000))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_TooFar_07_01");	//If you want to continue in that direction, don't let me keep you...
	AI_Output(self,other,"DIA_Addon_HammerPirate_GoHome_07_02");	//I think I'll be headed back now.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HAMMERPIRATE_SUCCESS(C_INFO)
{
	npc = pir_1360_addon_pirat;
	nr = 14;
	condition = dia_addon_hammerpirate_success_condition;
	information = dia_addon_hammerpirate_success_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_hammerpirate_success_condition()
{
	if((c_towerbanditsdead() == TRUE) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_hammerpirate_success_info()
{
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_01");	//You know what - I've been doing some thinking. You're not such a bad sort!
	AI_Output(self,other,"DIA_Addon_HammerPirate_Success_07_02");	//I'm headed back to the camp, then. See ya!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};

