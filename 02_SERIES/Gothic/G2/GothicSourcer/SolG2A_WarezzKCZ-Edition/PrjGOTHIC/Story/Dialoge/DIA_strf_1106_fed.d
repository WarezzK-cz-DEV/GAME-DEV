
instance DIA_FED_EXIT(C_INFO)
{
	npc = strf_1106_fed;
	nr = 999;
	condition = dia_fed_exit_condition;
	information = dia_fed_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fed_exit_condition()
{
	return TRUE;
};

func void dia_fed_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FED_HALLO(C_INFO)
{
	npc = strf_1106_fed;
	nr = 2;
	condition = dia_fed_hallo_condition;
	information = dia_fed_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fed_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_FAJETH_KILL_SNAPPER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_fed_hallo_info()
{
	AI_Output(self,other,"DIA_Fed_HALLO_08_00");	//What do you want from me? I'm not going anywhere!
	AI_Output(other,self,"DIA_Fed_HALLO_15_01");	//Stay calm, relax - no one wants you to go anywhere.
	AI_Output(self,other,"DIA_Fed_HALLO_08_02");	//Thank Innos. You know, over the last few days, several men have left the camp - and not one of them has come back.
	AI_Output(self,other,"DIA_Fed_HALLO_08_03");	//They were all eaten by snappers. But not me. I'll just stay put here until it's all over.
};


instance DIA_FED_SNAPPER(C_INFO)
{
	npc = strf_1106_fed;
	nr = 3;
	condition = dia_fed_snapper_condition;
	information = dia_fed_snapper_info;
	permanent = FALSE;
	description = "What do you know about the snappers?";
};


func int dia_fed_snapper_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fed_snapper_info()
{
	AI_Output(other,self,"DIA_Fed_Snapper_15_00");	//What do you know about the snappers?
	AI_Output(self,other,"DIA_Fed_Snapper_08_01");	//Bilgot watches them at night. A few of them are down at the pool at the base of the dark tower.
	AI_Output(self,other,"DIA_Fed_Snapper_08_02");	//Others are right above us - on top of the cliff. They're just waiting until we're all exhausted.
	AI_Output(self,other,"DIA_Fed_Snapper_08_03");	//We managd to trap ourselves here. Soon they'll attack the camp - and have their bloody feast...
	AI_Output(other,self,"DIA_Fed_Snapper_15_04");	//I see.
};


instance DIA_FED_PERM(C_INFO)
{
	npc = strf_1106_fed;
	nr = 5;
	condition = dia_fed_perm_condition;
	information = dia_fed_perm_info;
	permanent = TRUE;
	description = "Are you crazy?";
};


func int dia_fed_perm_condition()
{
	return TRUE;
};

func void dia_fed_perm_info()
{
	AI_Output(other,self,"DIA_Fed_Perm_15_00");	//Are you all right?
	if(MIS_FAJETH_KILL_SNAPPER != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_01");	//The snappers are out there. Can you smell them...? I can smell them...
	}
	else
	{
		AI_Output(self,other,"DIA_Fed_Perm_08_02");	//The snappers seem to have pulled back. But that doesn't mean anything. They'll come back - or the wolves, or the lizards, or the orcs.
		AI_Output(self,other,"DIA_Fed_Perm_08_03");	//And sooner or later they'll get us and feed on our dead bodies...
	};
	AI_StopProcessInfos(self);
};


instance DIA_FED_PICKPOCKET(C_INFO)
{
	npc = strf_1106_fed;
	nr = 900;
	condition = dia_fed_pickpocket_condition;
	information = dia_fed_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fed_pickpocket_condition()
{
	return c_beklauen(32,8);
};

func void dia_fed_pickpocket_info()
{
	Info_ClearChoices(dia_fed_pickpocket);
	Info_AddChoice(dia_fed_pickpocket,DIALOG_BACK,dia_fed_pickpocket_back);
	Info_AddChoice(dia_fed_pickpocket,DIALOG_PICKPOCKET,dia_fed_pickpocket_doit);
};

func void dia_fed_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fed_pickpocket);
};

func void dia_fed_pickpocket_back()
{
	Info_ClearChoices(dia_fed_pickpocket);
};

