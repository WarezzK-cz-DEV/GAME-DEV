
instance DIA_PAL_298_EXIT(C_INFO)
{
	npc = pal_298_ritter;
	nr = 999;
	condition = dia_pal_298_exit_condition;
	information = dia_pal_298_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_298_exit_condition()
{
	return TRUE;
};

func void dia_pal_298_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_298_PASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_pass_condition;
	information = dia_pal_298_pass_info;
	permanent = FALSE;
	description = "Where does this path lead?";
};


func int dia_pal_298_pass_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_298_pass_info()
{
	AI_Output(other,self,"DIA_PAL_298_Pass_15_00");	//Where does this path lead?
	AI_Output(self,other,"DIA_PAL_298_Pass_09_01");	//Behind the gate lies the pass to the Valley of Mines.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_02");	//We're on this side - on the other, a few orcs have dug themselves in.
	AI_Output(self,other,"DIA_PAL_298_Pass_09_03");	//It's better if you go back - you cannot get through here.
};


instance DIA_PAL_298_TRESPASS(C_INFO)
{
	npc = pal_298_ritter;
	nr = 2;
	condition = dia_pal_298_trespass_condition;
	information = dia_pal_298_trespass_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_298_trespass_condition()
{
	if(MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pal_298_trespass_info()
{
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_00");	//Are you sure you want to go in there? I'm afraid you won't get very far - the orcs are on the other side.
	AI_Output(other,self,"DIA_PAL_298_TRESPASS_15_01");	//If there's a way into the Valley of Mines, I shall find it.
	AI_Output(self,other,"DIA_PAL_298_TRESPASS_09_02");	//Good, then go. Go with Innos.
};


instance DIA_PAL_298_PERM1(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm1_condition;
	information = dia_pal_298_perm1_info;
	permanent = TRUE;
	description = "And what if I go at my own risk?";
};


func int dia_pal_298_perm1_condition()
{
	if((KAPITEL == 1) && Npc_KnowsInfo(other,dia_pal_298_pass))
	{
		return TRUE;
	};
};

func void dia_pal_298_perm1_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm1_15_00");	//And what if I go at my own risk?
	AI_Output(self,other,"DIA_PAL_298_Perm1_09_01");	//Then you will die. That's why we're here. So that you don't get such stupid ideas.
};


instance DIA_PAL_298_PERM2(C_INFO)
{
	npc = pal_298_ritter;
	nr = 3;
	condition = dia_pal_298_perm2_condition;
	information = dia_pal_298_perm2_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_pal_298_perm2_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pal_298_perm2_info()
{
	AI_Output(other,self,"DIA_PAL_298_Perm2_15_00");	//How's the situation?
	AI_Output(self,other,"DIA_PAL_298_Perm2_09_01");	//Everything's quiet. We have the situation under control.
};

