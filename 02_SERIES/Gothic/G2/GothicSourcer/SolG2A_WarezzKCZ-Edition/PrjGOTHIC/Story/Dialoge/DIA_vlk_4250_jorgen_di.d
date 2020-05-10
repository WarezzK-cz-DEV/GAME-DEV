
instance DIA_JORGEN_DI_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 999;
	condition = dia_jorgen_di_kap3_exit_condition;
	information = dia_jorgen_di_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_di_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_di_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_hallo_condition;
	information = dia_jorgen_di_hallo_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_jorgen_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_jorgen_di_hallo_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//Everything all right?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//Sure enough - just as long as all those monsters stay away from us...
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//We're not going to survive another orc attack like that. So hurry up - we need to get out of here.
		b_startotherroutine(jorgen_di,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_undeaddragondead_condition;
	information = dia_jorgen_di_undeaddragondead_info;
	permanent = TRUE;
	description = "The enemy is dead.";
};


func int dia_jorgen_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jorgen_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//The enemy is dead.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//That's good news. Is that all we needed to do on this island?
	Info_ClearChoices(dia_jorgen_di_undeaddragondead);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"One more minute.",dia_jorgen_di_undeaddragondead_moment);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Yes, That's it. Let's go.",dia_jorgen_di_undeaddragondead_over);
};

func void dia_jorgen_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//One more minute. I've still got to take care of something.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//All right. But hurry.
	AI_StopProcessInfos(self);
};

func void dia_jorgen_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

