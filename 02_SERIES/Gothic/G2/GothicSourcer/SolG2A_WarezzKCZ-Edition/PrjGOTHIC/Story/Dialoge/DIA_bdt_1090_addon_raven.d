
instance DIA_ADDON_RAVEN_EXIT(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 999;
	condition = dia_addon_raven_exit_condition;
	information = dia_addon_raven_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_raven_exit_condition()
{
	return TRUE;
};

func void dia_addon_raven_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RAVEN_HI(C_INFO)
{
	npc = bdt_1090_addon_raven;
	nr = 1;
	condition = dia_addon_raven_hi_condition;
	information = dia_addon_raven_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_raven_hi_condition()
{
	return TRUE;
};

func void dia_addon_raven_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_00");	//Look who has come.
	if(c_bodystatecontains(self,BS_SIT))
	{
		Npc_StopAni(self,"T_PRAY_RANDOM");
		AI_PlayAniBS(self,"T_PRAY_2_STAND",BS_STAND);
		AI_TurnToNPC(self,other);
	};
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_01");	//My master warned me that Innos would send his henchmen.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_02");	//But I had not expected that you would appear so soon.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_03");	//Well, since you were so quick (laughs), I shall give you a quick death.
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"YOU are the one who is going to die.",dia_addon_raven_hi_du);
	Info_AddChoice(dia_addon_raven_hi,"You sold your soul to Beliar!",dia_addon_raven_hi_soul);
};

func void dia_addon_raven_hi_du()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_00");	//YOU are the one who is going to die.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_04");	//(laughs) You are no threat to me. I bear Beliar's sword.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_05");	//I shall lead the dragons to the mainland. Together we will plunge the world of men into the deepest darkness.
};

func void dia_addon_raven_hi_soul()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_01");	//You sold your soul to Beliar!
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_06");	//For a good price. I will command his armies as a general.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_07");	//And what about you? Do you know how much YOUR soul is worth?
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"I've had it. Let us begin...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"I'm only doing what has to be done.",dia_addon_raven_hi_only);
};

func void dia_addon_raven_hi_only()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_02");	//I'm only doing what has to be done.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_08");	//(laughs) Listen to him. You have sent me a humble servant, Innos! (laughs loud)
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"I've had it. Let us begin...",dia_addon_raven_hi_attack);
	Info_AddChoice(dia_addon_raven_hi,"Are you sure that I am a servant of Innos?",dia_addon_raven_hi_sure);
};

func void dia_addon_raven_hi_sure()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_03");	//Are you sure that I am a servant of Innos?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_09");	//What? What are you saying?
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_04");	//Don't you consider it possible that I could be a servant of Adanos?
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_10");	//(laughs) Nonsense!
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_05");	//Maybe I ALSO serve Beliar - or only myself.
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_11");	//(sneering) Well, in that case, you are not even a worthy opponent for me!
	Info_ClearChoices(dia_addon_raven_hi);
	Info_AddChoice(dia_addon_raven_hi,"I've had it. Let us begin...",dia_addon_raven_hi_attack);
};

func void dia_addon_raven_hi_attack()
{
	AI_Output(other,self,"DIA_Addon_Raven_Add_15_06");	//I've had it. Let us begin...
	AI_Output(self,other,"DIA_Addon_Raven_Add_10_12");	//(sneering) Are you in such a hurry to die? Well, since you insist...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

