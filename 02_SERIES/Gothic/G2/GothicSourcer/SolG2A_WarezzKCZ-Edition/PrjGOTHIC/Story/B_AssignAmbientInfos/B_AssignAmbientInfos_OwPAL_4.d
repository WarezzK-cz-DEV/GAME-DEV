
instance DIA_OWPAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_owpal_4_exit_condition;
	information = dia_owpal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_owpal_4_exit_condition()
{
	return TRUE;
};

func void dia_owpal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OWPAL_4_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_owpal_4_standard_condition;
	information = dia_owpal_4_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_owpal_4_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_owpal_4_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_00");	//Innos is my honor and my honor is my life.
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_01");	//We shall stand firm here as long as Innos holds his light over us.
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_OWPAL_4_STANDARD_04_02");	//With the help of Innos we shall keep the evil creatures away from here.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_owpal_4(var C_NPC slf)
{
	dia_owpal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_owpal_4_standard.npc = Hlp_GetInstanceID(slf);
};

