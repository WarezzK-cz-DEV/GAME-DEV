
instance DIA_LIESEL_EXIT(C_INFO)
{
	npc = follow_sheep;
	nr = 999;
	condition = dia_liesel_exit_condition;
	information = dia_liesel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_liesel_exit_condition()
{
	return TRUE;
};

func void dia_liesel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LIESEL_HALLO(C_INFO)
{
	npc = follow_sheep;
	nr = 1;
	condition = dia_liesel_hallo_condition;
	information = dia_liesel_hallo_info;
	permanent = FALSE;
	description = "Hello!";
};


func int dia_liesel_hallo_condition()
{
	return TRUE;
};

func void dia_liesel_hallo_info()
{
	AI_Output(other,self,"DIA_Liesel_Hallo_15_00");	//Hello... (clears his throat) ...sheep.
	b_lieselmaeh();
};


instance DIA_LIESEL_KOMMMIT(C_INFO)
{
	npc = follow_sheep;
	nr = 1;
	condition = dia_liesel_kommmit_condition;
	information = dia_liesel_kommmit_info;
	permanent = TRUE;
	description = "Come with me!";
};


func int dia_liesel_kommmit_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,dia_liesel_hallo) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		return TRUE;
	};
};

func void dia_liesel_kommmit_info()
{
	AI_Output(other,self,"DIA_Liesel_KommMit_15_00");	//Come with me!
	b_lieselmaeh();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_LIESEL_WARTEHIER(C_INFO)
{
	npc = follow_sheep;
	nr = 1;
	condition = dia_liesel_wartehier_condition;
	information = dia_liesel_wartehier_info;
	permanent = TRUE;
	description = "Wait here!";
};


func int dia_liesel_wartehier_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && Npc_KnowsInfo(other,dia_liesel_hallo) && (self.aivar[AIV_TAPOSITION] == FALSE))
	{
		return TRUE;
	};
};

func void dia_liesel_wartehier_info()
{
	AI_Output(other,self,"DIA_Liesel_WarteHier_15_00");	//Wait here!
	b_lieselmaeh();
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
};

