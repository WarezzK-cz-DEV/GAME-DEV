
instance DIA_ADDON_PATRICK_EXIT(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 999;
	condition = dia_addon_patrick_exit_condition;
	information = dia_addon_patrick_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_patrick_exit_condition()
{
	return TRUE;
};

func void dia_addon_patrick_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PATRICK_HI(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hi_condition;
	information = dia_addon_patrick_hi_info;
	permanent = FALSE;
	description = "I've been sent by the Water Mages. I've come to free you.";
};


func int dia_addon_patrick_hi_condition()
{
	return TRUE;
};

func void dia_addon_patrick_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_00");	//I've been sent by the Water Mages. I've come to free you.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_01");	//(warily) Really? And why should I believe you?
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_02");	//Do you want to get out of here, or not?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_03");	//Of course I want to get out - but...
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_04");	//Vatras sent me. If that's not enough for you, you can all rot in this hole for all I care.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_05");	//(hastily) All right, I believe you.
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_15_06");	//(baffled) Really? Wow, that went faster than I thought. Okay, now all we need is a plan.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_07");	//Trying to flee poses a great risk. William tried, and he bought it.
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_07_08");	//The prisoners are peasants and workers - they trust me, but they won't dare to mount an escape.
	Info_ClearChoices(dia_addon_patrick_hi);
	Info_AddChoice(dia_addon_patrick_hi,"What do you want me to do - get you a pardon from Raven?",dia_addon_patrick_hi_raven);
	Info_AddChoice(dia_addon_patrick_hi,"Will I have to kill all the bandits before you'll budge at all?",dia_addon_patrick_hi_kill);
};

func void b_say_patrick_plan()
{
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_00");	//But that can't be the plan.
	AI_Output(self,other,"DIA_Addon_Patrick_Plan_07_01");	//Just see to it that the guards don't attack us, and then we'll get out of here.
	AI_Output(other,self,"DIA_Addon_Patrick_Plan_15_02");	//Okay, I'll handle that. Tell the others to get ready.
	b_logentry(TOPIC_ADDON_SKLAVEN,"The slaves will not dare attempt to escape. I have to find a way to let them leave the camp unmolested.");
};

func void dia_addon_patrick_hi_raven()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Raven_15_00");	//What do you want me to do - get you a pardon from Raven?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Raven_07_01");	//(grinning) Not a bad idea.
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};

func void dia_addon_patrick_hi_kill()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hi_Kill_15_00");	//Will I have to kill all the bandits before you'll budge at all?
	AI_Output(self,other,"DIA_Addon_Patrick_Hi_Kill_07_01");	//(scared) But that would be insane!
	b_say_patrick_plan();
	Info_ClearChoices(dia_addon_patrick_hi);
};


instance DIA_ADDON_PATRICK_READY(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_ready_condition;
	information = dia_addon_patrick_ready_info;
	permanent = FALSE;
	description = "All's well, you can make yourselves scarce.";
};


func int dia_addon_patrick_ready_condition()
{
	if(((READY_TOGO == TRUE) && Npc_KnowsInfo(other,dia_addon_patrick_hi)) || (Npc_IsDead(prisonguard) && Npc_IsDead(bloodwyn) && Npc_KnowsInfo(other,dia_addon_thorus_answer)) || (Npc_IsDead(thorus) && Npc_IsDead(bloodwyn) && Npc_IsDead(prisonguard)))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_ready_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_00");	//All's well, you can make yourselves scarce.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_01");	//Great. I know a cave in the swamp where we can gather for now. But then what?
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_02");	//Leave the swamp towards the south-west. The Water Mages have set up their camp near the ruins of the old temple.
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_03");	//They're going to show you the way out of this valley.
	AI_Output(self,other,"DIA_Addon_Patrick_ready_07_04");	//Thanks, thank you so much. (commencing) We are all very deeply...
	AI_Output(other,self,"DIA_Addon_Patrick_ready_15_05");	//Never mind.
	SKLAVEN_FLUCHT = TRUE;
	b_giveplayerxp(XP_ADDON_FLUCHT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLUCHT");
	b_startotherroutine(telbor,"FLUCHT");
	b_startotherroutine(tonak,"FLUCHT");
	b_startotherroutine(pardos,"FLUCHT");
	b_startotherroutine(monty,"FLUCHT");
	b_startotherroutine(buddler_1,"WORK");
	b_startotherroutine(buddler_2,"WORK");
	b_startotherroutine(buddler_3,"WORK");
	b_removenpc(strf_1128_addon_sklave);
	b_removenpc(strf_1129_addon_sklave);
	b_removenpc(strf_1130_addon_sklave);
	b_removenpc(strf_1136_addon_sklave);
	b_removenpc(strf_1137_addon_sklave);
	b_removenpc(strf_1138_addon_sklave);
	b_removenpc(strf_1139_addon_sklave);
	b_removenpc(strf_1140_addon_sklave);
};


instance DIA_ADDON_PATRICK_KILLER(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_killer_condition;
	information = dia_addon_patrick_killer_info;
	permanent = FALSE;
	description = "The guard is done for, you can go now.";
};


func int dia_addon_patrick_killer_condition()
{
	if(Npc_IsDead(prisonguard) && (READY_TOGO == FALSE) && Npc_KnowsInfo(other,dia_addon_patrick_hi))
	{
		return TRUE;
	};
};

func void dia_addon_patrick_killer_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Killer_15_00");	//The guard is done for, you can go now.
	AI_Output(self,other,"DIA_Addon_Patrick_Killer_07_01");	//And what happens once we leave the mine? The other guards will slaughter us then. No, that's too risky.
};


instance DIA_ADDON_PATRICK_HOEHLE(C_INFO)
{
	npc = strf_1118_addon_patrick;
	nr = 2;
	condition = dia_addon_patrick_hoehle_condition;
	information = dia_addon_patrick_hoehle_info;
	permanent = TRUE;
	description = "Don't you want to leave?";
};


func int dia_addon_patrick_hoehle_condition()
{
	if(Npc_GetDistToWP(self,"ADW_BL_HOEHLE_04") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_patrick_hoehle_info()
{
	AI_Output(other,self,"DIA_Addon_Patrick_Hoehle_15_00");	//Don't you want to leave?
	AI_Output(self,other,"DIA_Addon_Patrick_Hoehle_07_01");	//Of course we do. We're only waiting for the right moment.
};

