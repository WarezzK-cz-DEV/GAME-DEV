
instance DIA_TORLOF_DI_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 999;
	condition = dia_torlof_di_kap3_exit_condition;
	information = dia_torlof_di_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_di_kap3_exit_condition()
{
	return TRUE;
};

func void dia_torlof_di_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DI_HALLO(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 4;
	condition = dia_torlof_di_hallo_condition;
	information = dia_torlof_di_hallo_info;
	permanent = TRUE;
	description = "All quiet?";
};


func int dia_torlof_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_torlof_di_hallo_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Hallo_15_00");	//Everything quiet?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_01");	//So far. But that could change in an instant. Watch your back.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_DI_Hallo_01_02");	//If those miserable orcs stay where they are, I don't see a problem.
		b_startotherroutine(torlof_di,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DI_TEACH(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 150;
	condition = dia_torlof_di_teach_condition;
	information = dia_torlof_di_teach_info;
	permanent = TRUE;
	description = "I want to improve my abilities!";
};


func int dia_torlof_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_torlof_di_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_Teach_15_00");	//I want to improve my abilities!
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_back()
{
	Info_ClearChoices(dia_torlof_di_teach);
};

func void dia_torlof_di_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_HIGH);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_HIGH);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_di_teach_str_5);
};

func void dia_torlof_di_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_torlof_di_teach);
	Info_AddChoice(dia_torlof_di_teach,DIALOG_BACK,dia_torlof_di_teach_back);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_di_teach_dex_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_di_teach_dex_5);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_di_teach_str_1);
	Info_AddChoice(dia_torlof_di_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_di_teach_str_5);
};


instance DIA_TORLOF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 4;
	condition = dia_torlof_di_undeaddragondead_condition;
	information = dia_torlof_di_undeaddragondead_info;
	permanent = TRUE;
	description = "I've eliminated the enemy.";
};


func int dia_torlof_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_torlof_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_15_00");	//I've eliminated the enemy.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_01_01");	//I didn't expect anything else. How's it look? Can we finally leave now?
	Info_ClearChoices(dia_torlof_di_undeaddragondead);
	Info_AddChoice(dia_torlof_di_undeaddragondead,"I'll need another minute or two.",dia_torlof_di_undeaddragondead_moment);
	Info_AddChoice(dia_torlof_di_undeaddragondead,"Yes. It's over. Let's go.",dia_torlof_di_undeaddragondead_over);
};

func void dia_torlof_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Torlof_DI_UndeadDragonDead_moment_15_00");	//I'll need another minute or two.
	AI_Output(self,other,"DIA_Torlof_DI_UndeadDragonDead_moment_01_01");	//Hurry up!
	AI_StopProcessInfos(self);
};

func void dia_torlof_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};


instance DIA_TORLOF_DI_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof_di;
	nr = 900;
	condition = dia_torlof_di_pickpocket_condition;
	information = dia_torlof_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_di_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_di_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_di_pickpocket);
	Info_AddChoice(dia_torlof_di_pickpocket,DIALOG_BACK,dia_torlof_di_pickpocket_back);
	Info_AddChoice(dia_torlof_di_pickpocket,DIALOG_PICKPOCKET,dia_torlof_di_pickpocket_doit);
};

func void dia_torlof_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_di_pickpocket);
};

func void dia_torlof_di_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_di_pickpocket);
};

