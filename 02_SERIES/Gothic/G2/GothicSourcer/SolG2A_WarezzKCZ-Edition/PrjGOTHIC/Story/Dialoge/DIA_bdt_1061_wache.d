
instance DIA_1061_WACHE_EXIT(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 999;
	condition = dia_1061_wache_exit_condition;
	information = dia_1061_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1061_wache_exit_condition()
{
	return TRUE;
};

func void dia_1061_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_WACHE_HALLO(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 1;
	condition = dia_1061_wache_hallo_condition;
	information = dia_1061_wache_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1061_wache_hallo_condition()
{
	return TRUE;
};

func void dia_1061_wache_hallo_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//Halt - you can't go through here.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//I want to talk to your leader.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//(ironic) Oh, I see, you want to talk to my boss. Well, then OF COURSE I will let you through.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//(deadly serious) But only if you know his name - because if you don't, I'll be obliged to kill you! Well?
	Info_ClearChoices(dia_1061_wache_hallo);
	Info_AddChoice(dia_1061_wache_hallo,"Lee",dia_1061_wache_hallo_lee);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_1061_wache_hallo,"Dexter",dia_1061_wache_hallo_dexter);
	};
	Info_AddChoice(dia_1061_wache_hallo,"Diego",dia_1061_wache_hallo_diego);
	Info_AddChoice(dia_1061_wache_hallo,"No idea.",dia_1061_wache_hallo_ahnung);
};

func void dia_1061_wache_hallo_lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Lee.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//Well, what can I say? You just forfeited your life, man!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//Dexter.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//Well,... I guess you know the boss. Okay, I'll let you through. But I'm warning you.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//You get too close to anybody, you won't get out of here alive!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//So take a deep breath and leave your weapons where they are. You'll find Dexter in the house.
	KNOWS_DEXTER = TRUE;
	banditguard.aivar[AIV_PASSGATE] = TRUE;
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
};

func void dia_1061_wache_hallo_diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//Diego.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//Right!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//No, that was just a joke. You don't have any idea who my boss is.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//So there's no reason why I shouldn't kill you.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//No idea.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//Then you'll die ignorant.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_1061_WACHE_PERM(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 2;
	condition = dia_1061_wache_perm_condition;
	information = dia_1061_wache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_1061_wache_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_1061_wache_perm_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//Remember, stay cool and you'll get out of here alive.
	AI_StopProcessInfos(self);
};

