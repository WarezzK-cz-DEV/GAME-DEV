
instance DIA_LESTER_DI_EXIT(C_INFO)
{
	npc = pc_psionic_di;
	nr = 999;
	condition = dia_lester_di_exit_condition;
	information = dia_lester_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_di_exit_condition()
{
	return TRUE;
};

func void dia_lester_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_DI_HELLO(C_INFO)
{
	npc = pc_psionic_di;
	nr = 1;
	condition = dia_lester_di_hello_condition;
	information = dia_lester_di_hello_info;
	permanent = TRUE;
	description = "Is there anything you need to tell me?";
};


func int dia_lester_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};


var int dia_lester_di_scgotwarning1;
var int dia_lester_di_scgotwarning2;

func void dia_lester_di_hello_info()
{
	AI_Output(other,self,"DIA_Lester_DI_Hello_15_00");	//Is there anything you need to tell me?
	if((Npc_IsDead(mario_di) == FALSE) && (ORKSTURMDI == TRUE) && (DIA_LESTER_DI_SCGOTWARNING1 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_01");	//Mario slipped off when the orcs attacked. In spite of the chaos here on the ship, I was able to keep an eye on him.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_02");	//He just marched right through the orcs' blockade, and the orcs let him go by untouched.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_03");	//I had a funny feeling about the bastard from the beginning. He's in cahoots with the enemy.
		b_giveplayerxp(XP_AMBIENT);
		DIA_LESTER_DI_SCGOTWARNING1 = TRUE;
	}
	else if((Npc_IsDead(mario_di) == FALSE) && (DIA_LESTER_DI_SCGOTWARNING2 == FALSE))
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_04");	//That strange guy who calls himself Mario makes me uneasy. He has an evil aura.
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_05");	//Watch your back, my friend.
		DIA_LESTER_DI_SCGOTWARNING2 = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_DI_Hello_13_06");	//Not at the moment. Maybe later.
	};
};


instance DIA_LESTER_DI_MARIOARSCH(C_INFO)
{
	npc = pc_psionic_di;
	nr = 2;
	condition = dia_lester_di_marioarsch_condition;
	information = dia_lester_di_marioarsch_info;
	description = "You were right. Mario has betrayed us.";
};


func int dia_lester_di_marioarsch_condition()
{
	if(((DIA_LESTER_DI_SCGOTWARNING2 == TRUE) || (DIA_LESTER_DI_SCGOTWARNING2 == TRUE)) && (MIS_MARIO_AMBUSH == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lester_di_marioarsch_info()
{
	AI_Output(other,self,"DIA_Lester_DI_MarioArsch_15_00");	//You were right. Mario has betrayed us.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_01");	//Yes. I may not be too perceptive otherwise, but this case was clear to me.
	AI_Output(self,other,"DIA_Lester_DI_MarioArsch_13_02");	//Be a bit more careful about choosing your companions in the future.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PC_LESTER_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_psionic_di;
	nr = 5;
	condition = dia_pc_lester_di_undeaddragondead_condition;
	information = dia_pc_lester_di_undeaddragondead_info;
	permanent = TRUE;
	description = "We won't be here much longer.";
};


func int dia_pc_lester_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_lester_di_undeaddragondead_onetime;

func void dia_pc_lester_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_00");	//We won't be here much longer.
	if(DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(Npc_GetDistToWP(self,"DI_DRACONIANAREA_19") < 4000)
		{
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_01");	//It's like my headaches just blew away.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_02");	//How did you do that?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_03");	//I have destroyed the enemy.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_04");	//It must have been something very powerful. So what was it, exactly?
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_05");	//An undead dragon.
		};
		if(SC_KNOWSMADPSI == TRUE)
		{
			AI_Output(other,self,"DIA_PC_Lester_DI_UndeadDragonDead_15_06");	//Your former friends from the Swamp Camp gave me a pretty hard time.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_07");	//Yes. Faith can move mountains. That's how it's always been. Unfortunately, they served the wrong god.
			AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_08");	//I'll need some time before I can really get over all this.
		};
		DIA_PC_LESTER_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Lester_DI_UndeadDragonDead_13_09");	//Hopefully, nothing like that will ever happen again. There isn't as much swampweed in the world as I'd like to smoke right now.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PSIONIC_DI_PICKPOCKET(C_INFO)
{
	npc = pc_psionic_di;
	nr = 900;
	condition = dia_psionic_di_pickpocket_condition;
	information = dia_psionic_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_psionic_di_pickpocket_condition()
{
	return c_beklauen(56,25);
};

func void dia_psionic_di_pickpocket_info()
{
	Info_ClearChoices(dia_psionic_di_pickpocket);
	Info_AddChoice(dia_psionic_di_pickpocket,DIALOG_BACK,dia_psionic_di_pickpocket_back);
	Info_AddChoice(dia_psionic_di_pickpocket,DIALOG_PICKPOCKET,dia_psionic_di_pickpocket_doit);
};

func void dia_psionic_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_psionic_di_pickpocket);
};

func void dia_psionic_di_pickpocket_back()
{
	Info_ClearChoices(dia_psionic_di_pickpocket);
};

