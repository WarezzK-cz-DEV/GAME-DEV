
instance DIA_BULLCO_EXIT(C_INFO)
{
	npc = sld_807_bullco;
	nr = 999;
	condition = dia_bullco_exit_condition;
	information = dia_bullco_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bullco_exit_condition()
{
	return TRUE;
};

func void dia_bullco_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_HALLO(C_INFO)
{
	npc = sld_807_bullco;
	nr = 1;
	condition = dia_bullco_hallo_condition;
	information = dia_bullco_hallo_info;
	permanent = TRUE;
	description = "The two of us should have a chat...";
};


func int dia_bullco_hallo_condition()
{
	return TRUE;
};

func void dia_bullco_hallo_info()
{
	AI_Output(other,self,"DIA_Bullco_HALLO_15_00");	//The two of us should have a chat...
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_01");	//Listen, you win! Now leave me alone.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_HALLO_06_02");	//I wouldn't know about what.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_QUATSCHER(C_INFO)
{
	npc = sld_807_bullco;
	nr = 2;
	condition = dia_bullco_quatscher_condition;
	information = dia_bullco_quatscher_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bullco_quatscher_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SYLVIO_ANGEQUATSCHT >= 2))
	{
		return TRUE;
	};
};

func void dia_bullco_quatscher_info()
{
	AI_Output(self,other,"DIA_Bullco_Quatscher_06_00");	//Sylvio doesn't like being talked to. You might have gathered as much by now.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
	b_attack(self,other,AR_NONE,1);
};


var int bullco_leave_day;
var int bullco_scharf;

instance DIA_BULLCO_PLEASELEAVE(C_INFO)
{
	npc = sld_807_bullco;
	nr = 3;
	condition = dia_bullco_pleaseleave_condition;
	information = dia_bullco_pleaseleave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bullco_pleaseleave_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) || (SYLVIO_MENDEFEATED == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bullco_pleaseleave_info()
{
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_00");	//We need to talk, you and I.
	AI_Output(other,self,"DIA_Bullco_PleaseLeave_15_01");	//What do you want?
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_02");	//I think the best thing would be if you didn't show your face on the farm any more.
	AI_Output(self,other,"DIA_Bullco_PleaseLeave_06_03");	//See to it that you're gone by tomorrow. We understand each other?
	BULLCO_LEAVE_DAY = b_getdayplus();
	BULLCO_SCHARF = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PEE");
};


var int bullco_hitcounter;

instance DIA_BULLCO_DAILYCHECK(C_INFO)
{
	npc = sld_807_bullco;
	nr = 4;
	condition = dia_bullco_dailycheck_condition;
	information = dia_bullco_dailycheck_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bullco_dailycheck_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (BULLCO_SCHARF == TRUE) && (Wld_GetDay() > BULLCO_LEAVE_DAY))
	{
		return TRUE;
	};
};

func void dia_bullco_dailycheck_info()
{
	if(BULLCO_HITCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_00");	//You're still here after all...
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_01");	//I thought we had agreed that I shall let you depart in peace.
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_02");	//You really should have listened to me.
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_DailyCheck_06_03");	//I don't believe this! The fellow is still here!
	};
	BULLCO_HITCOUNTER = BULLCO_HITCOUNTER + 1;
	BULLCO_LEAVE_DAY = b_getdayplus();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BULLCO_WONTLEAVE(C_INFO)
{
	npc = sld_807_bullco;
	nr = 5;
	condition = dia_bullco_wontleave_condition;
	information = dia_bullco_wontleave_info;
	permanent = FALSE;
	description = "I'm NOT going to leave here!";
};


func int dia_bullco_wontleave_condition()
{
	if(BULLCO_SCHARF == TRUE)
	{
		return TRUE;
	};
};

func void dia_bullco_wontleave_info()
{
	AI_Output(other,self,"DIA_Bullco_WontLeave_15_00");	//I'm NOT going to leave here!
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_01");	//(sighs) I guess we're going to have to discuss this again.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WontLeave_06_02");	//(grouchy) Yeah, yeah, go tell it to someone who cares.
		BULLCO_SCHARF = FALSE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BULLCO_PEPESSCHAFE(C_INFO)
{
	npc = sld_807_bullco;
	nr = 6;
	condition = dia_bullco_pepesschafe_condition;
	information = dia_bullco_pepesschafe_info;
	permanent = FALSE;
	description = "Does the name Pepe ring a bell?";
};


func int dia_bullco_pepesschafe_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (BULLCO_SCHARF == TRUE) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_bullco_pepesschafe_info()
{
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_00");	//Does the name Pepe ring a bell?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_01");	//I don't get a word of what you're blathering about, but I don't like your tone!
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_02");	//You were supposed to guard his sheep.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_03");	//What do I care about his sheep?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_04");	//Lee cares about them.
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_05");	//What are you getting at?
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_06");	//If you keep getting on my nerves, I'll se to it that you are made to pay for the sheep.
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_07");	//So if you're at all interested in your pay, leave me alone from now on!
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_08");	//(furious) You, you...
	AI_Output(other,self,"DIA_Bullco_PepesSchafe_15_09");	//(calmly) Yes?
	AI_Output(self,other,"DIA_Bullco_PepesSchafe_06_10");	//(to himself) Wretched little lowlife...
	BULLCO_SCHARF = FALSE;
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_BULLCOSLD_PICKPOCKET(C_INFO)
{
	npc = sld_807_bullco;
	nr = 900;
	condition = dia_bullcosld_pickpocket_condition;
	information = dia_bullcosld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bullcosld_pickpocket_condition()
{
	return c_beklauen(56,35);
};

func void dia_bullcosld_pickpocket_info()
{
	Info_ClearChoices(dia_bullcosld_pickpocket);
	Info_AddChoice(dia_bullcosld_pickpocket,DIALOG_BACK,dia_bullcosld_pickpocket_back);
	Info_AddChoice(dia_bullcosld_pickpocket,DIALOG_PICKPOCKET,dia_bullcosld_pickpocket_doit);
};

func void dia_bullcosld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bullcosld_pickpocket);
};

func void dia_bullcosld_pickpocket_back()
{
	Info_ClearChoices(dia_bullcosld_pickpocket);
};

