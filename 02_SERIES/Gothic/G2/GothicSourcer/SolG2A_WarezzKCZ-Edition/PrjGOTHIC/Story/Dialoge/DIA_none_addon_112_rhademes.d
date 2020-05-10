
instance DIA_ADDON_RHADEMES_EXIT(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 999;
	condition = dia_addon_rhademes_exit_condition;
	information = dia_addon_rhademes_exit_info;
	permanent = TRUE;
	description = "I shall find my own way! (THE END)";
};


func int dia_addon_rhademes_exit_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_EXIT_15_00");	//I'll find a way myself!
	AI_Output(self,other,"DIA_Addon_Rhademes_EXIT_03_01");	//As you will...
	AI_StopProcessInfos(self);
};


var int rhademes_understood;

instance DIA_ADDON_RHADEMES_FIRST(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 1;
	condition = dia_addon_rhademes_first_condition;
	information = dia_addon_rhademes_first_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_rhademes_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RHADEMES_UNDERSTOOD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_first_info()
{
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_00");	//My spirit has been held captive for an eternity.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_01");	//At last I am free. The sword has a NEW bearer.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_02");	//The final chamber has been opened.
		AI_Output(other,self,"DIA_Addon_Rhademes_First_15_03");	//But the gate appears closed!
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_04");	//This is not the gate to the final chamber.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_05");	//THIS gate merely leads to the antechamber.
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_06");	//The bearer... has closed it behind him.
		RHADEMES_UNDERSTOOD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_07");	//(strained) Ghanima en Kandra Adanos?!
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//(angry) Bengla anthani!
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RHADEMES_PFORTE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 2;
	condition = dia_addon_rhademes_pforte_condition;
	information = dia_addon_rhademes_pforte_info;
	permanent = FALSE;
	description = "How do I open the gate?";
};


func int dia_addon_rhademes_pforte_condition()
{
	return TRUE;
};

func void dia_addon_rhademes_pforte_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_00");	//How do I open the gate?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_01");	//Move... one of the levers.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Any one?
	AI_Output(self,other,"DIA_Addon_Rhademes_Pforte_03_03");	//All of these levers open the gate.
};


instance DIA_ADDON_RHADEMES_HEBEL(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 3;
	condition = dia_addon_rhademes_hebel_condition;
	information = dia_addon_rhademes_hebel_info;
	permanent = FALSE;
	description = "Not all of the levers trigger the trap, right?";
};


func int dia_addon_rhademes_hebel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && !Npc_KnowsInfo(other,dia_addon_rhademes_deinvater))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_hebel_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_Hebel_15_00");	//Not all of the levers trigger the trap, right?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Yes, they do!
};


instance DIA_ADDON_RHADEMES_DONTBELIEVE(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 4;
	condition = dia_addon_rhademes_dontbelieve_condition;
	information = dia_addon_rhademes_dontbelieve_info;
	permanent = FALSE;
	description = "I don't believe you!";
};


func int dia_addon_rhademes_dontbelieve_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && !Npc_KnowsInfo(other,dia_addon_rhademes_deinvater))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_dontbelieve_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DontBelieve_15_00");	//I don't believe you!
	AI_Output(self,other,"DIA_Addon_Rhademes_DontBelieve_03_01");	//Yet, I... speak only the truth.
};


instance DIA_ADDON_RHADEMES_DEINVATER(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 5;
	condition = dia_addon_rhademes_deinvater_condition;
	information = dia_addon_rhademes_deinvater_info;
	permanent = FALSE;
	description = "Your father built the trap, how would YOU know how it works?!";
};


func int dia_addon_rhademes_deinvater_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_rhademes_pforte) && (Npc_HasItems(other,itmi_addon_stone_04) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_deinvater_info()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_00");	//Your father built the trap, how would YOU know how it works?!
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_01");	//QUARHODRON! I can still hear the pounding of the hammers... on the other side of the gate... after so long a time...
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_02");	//The sword... showed me... revenge... for my failure...
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_15_03");	//You mean you have seen which lever is the right one?
	AI_Output(self,other,"DIA_Addon_Rhademes_DeinVater_03_04");	//I have long forgotten it.
	Info_ClearChoices(dia_addon_rhademes_deinvater);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Then guess!",dia_addon_rhademes_deinvater_guess);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Try to remember!",dia_addon_rhademes_deinvater_remember);
	Info_AddChoice(dia_addon_rhademes_deinvater,"Think!",dia_addon_rhademes_deinvater_think);
};


var int rhademes_fertig;

func void b_addon_rhademes_lever(var int choice)
{
	AI_Output(self,other,"DIA_Addon_Rhademes_Lever_03_00");	//It was so long ago...
	AI_StopProcessInfos(self);
	if(choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	RHADEMES_FERTIG = TRUE;
};

func void dia_addon_rhademes_deinvater_think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Think!
	b_addon_rhademes_lever(1);
};

func void dia_addon_rhademes_deinvater_remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Try to remember!
	b_addon_rhademes_lever(2);
};

func void dia_addon_rhademes_deinvater_guess()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Guess_15_00");	//Then guess!
	b_addon_rhademes_lever(3);
};


instance DIA_ADDON_RHADEMES_PERM(C_INFO)
{
	npc = none_addon_112_rhademes;
	nr = 2;
	condition = dia_addon_rhademes_perm_condition;
	information = dia_addon_rhademes_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_rhademes_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RHADEMES_FERTIG == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_rhademes_perm_info()
{
	AI_Output(self,other,"DIA_Addon_Rhademes_PERM_03_00");	//If you have the strength... sink it... in the depths of the sea...
	SC_TOOKRHADEMESTRAP = TRUE;
	SC_TALKEDTORHADEMAFTER = TRUE;
	AI_StopProcessInfos(self);
};

