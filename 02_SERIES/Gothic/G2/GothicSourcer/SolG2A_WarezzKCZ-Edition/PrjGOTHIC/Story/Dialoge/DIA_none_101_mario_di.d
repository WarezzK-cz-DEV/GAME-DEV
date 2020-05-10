
instance DIA_NONE_101_MARIO_DI_EXIT(C_INFO)
{
	npc = none_101_mario_di;
	nr = 999;
	condition = dia_none_101_mario_di_exit_condition;
	information = dia_none_101_mario_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_none_101_mario_di_exit_condition()
{
	return TRUE;
};

func void dia_none_101_mario_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_DI_JOB(C_INFO)
{
	npc = none_101_mario_di;
	nr = 4;
	condition = dia_none_101_mario_di_job_condition;
	information = dia_none_101_mario_di_job_info;
	permanent = TRUE;
	description = "Here's your chance to prove your fighting abilities.";
};


func int dia_none_101_mario_di_job_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && (ORKSTURMDI == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_di_job_info()
{
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_00");	//Here's your chance to prove your fighting abilities.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_01");	//Slowly. Everything in its time.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_Job_15_02");	//Mmh. That's just what I'd expected from you.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_Job_07_03");	//Just wait.
};


instance DIA_NONE_101_MARIO_DI_AMBUSH(C_INFO)
{
	npc = none_101_mario_di;
	nr = 4;
	condition = dia_none_101_mario_di_ambush_condition;
	information = dia_none_101_mario_di_ambush_info;
	important = TRUE;
};


func int dia_none_101_mario_di_ambush_condition()
{
	if(ORKSTURMDI == TRUE)
	{
		return TRUE;
	};
};

func void dia_none_101_mario_di_ambush_info()
{
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_00");	//Come closer. So, my friend. Now show me what you've got.
	AI_Output(other,self,"DIA_NONE_101_MARIO_DI_ambush_15_01");	//What do you mean by that?
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_02");	//Quite simple. The Master has had more than enough of you.
	AI_Output(self,other,"DIA_NONE_101_MARIO_DI_ambush_07_03");	//I should have killed you sooner. But my friends and I will correct that mistake here and now.
	Info_ClearChoices(dia_none_101_mario_di_ambush);
	Info_AddChoice(dia_none_101_mario_di_ambush,DIALOG_ENDE,dia_none_101_mario_di_ambush_ambush);
	b_giveplayerxp(XP_MARIO_AMBUSH);
	MIS_MARIO_AMBUSH = LOG_SUCCESS;
};

func void dia_none_101_mario_di_ambush_ambush()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	skeleton_mario1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	skeleton_mario2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	skeleton_mario3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	skeleton_mario4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};


instance DIA_MARIO_DI_PICKPOCKET(C_INFO)
{
	npc = none_101_mario_di;
	nr = 900;
	condition = dia_mario_di_pickpocket_condition;
	information = dia_mario_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mario_di_pickpocket_condition()
{
	return c_beklauen(71,110);
};

func void dia_mario_di_pickpocket_info()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
	Info_AddChoice(dia_mario_di_pickpocket,DIALOG_BACK,dia_mario_di_pickpocket_back);
	Info_AddChoice(dia_mario_di_pickpocket,DIALOG_PICKPOCKET,dia_mario_di_pickpocket_doit);
};

func void dia_mario_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mario_di_pickpocket);
};

func void dia_mario_di_pickpocket_back()
{
	Info_ClearChoices(dia_mario_di_pickpocket);
};

