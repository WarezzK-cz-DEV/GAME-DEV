
instance DIA_JACK_DI_EXIT(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 999;
	condition = dia_jack_di_exit_condition;
	information = dia_jack_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_di_exit_condition()
{
	return TRUE;
};

func void dia_jack_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_DI_GREET(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 4;
	condition = dia_jack_di_greet_condition;
	information = dia_jack_di_greet_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_jack_di_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_jack_di_greet_onetime;

func void dia_jack_di_greet_info()
{
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_00");	//I hope you know what you're doing, matey.
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_01");	//It won't be long now.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_02");	//Keep your head on your shoulders and come back in one piece.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(DIA_JACK_DI_GREET_ONETIME == FALSE)
		{
			AI_Output(other,self,"DIA_Jack_DI_GREET_15_03");	//What are you doing down here?
			b_giveplayerxp(XP_AMBIENT);
			DIA_JACK_DI_GREET_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_04");	//If this hell breaks loose over us one more time, I'll get the ship out of here. With or without you, d'you hear?
		AI_Output(other,self,"DIA_Jack_DI_GREET_15_05");	//None of this nonsense. I'll handle this.
		AI_Output(self,other,"DIA_Jack_DI_GREET_14_06");	//Make haste, then.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_JACK_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_444_jack_di;
	nr = 4;
	condition = dia_jack_di_undeaddragondead_condition;
	information = dia_jack_di_undeaddragondead_info;
	permanent = TRUE;
	description = "I did it. I eliminated the enemy.";
};


func int dia_jack_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jack_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_15_00");	//I did it. I eliminated the enemy.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_01");	//I had hoped that everything would turn out well. But I must admit that, during those last few hours, I haven't been so sure.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_14_02");	//Can we finally set sail again now?
	Info_ClearChoices(dia_jack_di_undeaddragondead);
	Info_AddChoice(dia_jack_di_undeaddragondead,"One more minute.",dia_jack_di_undeaddragondead_moment);
	Info_AddChoice(dia_jack_di_undeaddragondead,"Yes. Let us end it.",dia_jack_di_undeaddragondead_over);
};

func void dia_jack_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jack_DI_UndeadDragonDead_moment_15_00");	//Just a moment, now. There's something else I need to do.
	AI_Output(self,other,"DIA_Jack_DI_UndeadDragonDead_moment_14_01");	//Make haste, will you. I don't want to catch scurvy here.
	AI_StopProcessInfos(self);
};

func void dia_jack_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

