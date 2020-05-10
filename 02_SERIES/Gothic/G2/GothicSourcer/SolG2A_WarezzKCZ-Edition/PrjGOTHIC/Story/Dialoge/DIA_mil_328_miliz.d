
instance DIA_328_MILIZ_EXIT(C_INFO)
{
	npc = mil_328_miliz;
	nr = 999;
	condition = dia_328_miliz_exit_condition;
	information = dia_328_miliz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_328_miliz_exit_condition()
{
	return TRUE;
};

func void dia_328_miliz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_328_MILIZ_HI(C_INFO)
{
	npc = mil_328_miliz;
	nr = 1;
	condition = dia_328_miliz_hi_condition;
	information = dia_328_miliz_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_328_miliz_hi_condition()
{
	return TRUE;
};

func void dia_328_miliz_hi_info()
{
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//Hey, you've got no business here, understand?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//Who are you?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//That's none of your business! I'm the boss here, okay?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//The boss? Of what? Of those chests?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//Hey, the storeroom is under my supervision, got it? So piss off, or else I'll bash in your skull.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
};


instance DIA_328_MILIZ_KILL(C_INFO)
{
	npc = mil_328_miliz;
	nr = 2;
	condition = dia_328_miliz_kill_condition;
	information = dia_328_miliz_kill_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_328_miliz_kill_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_328_miliz_kill_info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//Hey, you're still here. Didn't I tell you to piss off?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//Now I'll show you who's boss around here!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	b_attack(self,other,AR_KILL,1);
};

