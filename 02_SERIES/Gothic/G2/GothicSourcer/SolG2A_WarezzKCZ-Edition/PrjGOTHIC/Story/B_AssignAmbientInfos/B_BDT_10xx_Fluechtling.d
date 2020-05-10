
func void b_dia_bdt_10xx_fluechtling_stimme7()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_07_00");	//Forget it. I'm not going back to jail.
};

func void b_dia_bdt_10xx_fluechtling_stimme6()
{
	AI_Output(self,other,"DIA_B_DIA_BDT_10XX_Fluechtling_06_00");	//You haven't come to take us back to jail, have you?
};


instance DIA_BDT_1031_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 999;
	condition = dia_bdt_1031_fluechtling_exit_condition;
	information = dia_bdt_1031_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1031_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1031_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_FLUECHTLING_TIP1(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 2;
	condition = dia_bdt_1031_fluechtling_tip1_condition;
	information = dia_bdt_1031_fluechtling_tip1_info;
	important = TRUE;
};


func int dia_bdt_1031_fluechtling_tip1_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_tip1_info()
{
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_07_00");	//You'd better stay away from me if you don't want to land in jail.
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1031_fluechtling_tip1);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"I'm not planning on ratting on you.",dia_bdt_1031_fluechtling_tip1_frei);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"I have come to arrest you.",dia_bdt_1031_fluechtling_tip1_knast);
		Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Where is Morgahard, your leader?",dia_bdt_1031_fluechtling_tip1_morgahard);
	};
};

func void dia_bdt_1031_fluechtling_tip1_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00");	//Where is Morgahard, your leader?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01");	//We split up, so we wouldn't get caught so quickly. No idea where the others are.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"Too bad. Then I guess I'll have to get the judge.",dia_bdt_1031_fluechtling_tip1_morgahard_drohen);
};

func void dia_bdt_1031_fluechtling_tip1_morgahard_drohen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00");	//Too bad. Then I guess I'll have to get the judge.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01");	//Okay, okay. I suppose some of us have made off to the tavern. But you didn't hear that from me, OK?
	AI_StopProcessInfos(self);
};

func void dia_bdt_1031_fluechtling_tip1_knast()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00");	//I have come to arrest you.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01");	//Over my dead body.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1031_fluechtling_tip1_frei()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_15_00");	//I'm not planning on ratting on you.
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_07_01");	//If the judge sent you, then you can tell him from us that he can get stuffed.
	Info_AddChoice(dia_bdt_1031_fluechtling_tip1,"So what's your crime?",dia_bdt_1031_fluechtling_tip1_frei_verbrechen);
};

func void dia_bdt_1031_fluechtling_tip1_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00");	//So what's your crime?
	AI_Output(self,other,"DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01");	//That's none of your business.
};


instance DIA_BDT_1031_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1031_fluechtling;
	nr = 3;
	condition = dia_bdt_1031_fluechtling_perm_condition;
	information = dia_bdt_1031_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1031_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1031_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 999;
	condition = dia_bdt_1032_fluechtling_exit_condition;
	information = dia_bdt_1032_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1032_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1032_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1032_fluechtling;
	nr = 2;
	condition = dia_bdt_1032_fluechtling_perm_condition;
	information = dia_bdt_1032_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1032_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1032_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 999;
	condition = dia_bdt_1033_fluechtling_exit_condition;
	information = dia_bdt_1033_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1033_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1033_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_FLUECHTLING_TIP2(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 2;
	condition = dia_bdt_1033_fluechtling_tip2_condition;
	information = dia_bdt_1033_fluechtling_tip2_info;
	important = TRUE;
};


func int dia_bdt_1033_fluechtling_tip2_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_tip2_info()
{
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_07_00");	//(scared) What do you want from me?
	b_giveplayerxp(XP_AMBIENTKAP3);
	if(SCFOUNDMORGAHARD == FALSE)
	{
		Info_ClearChoices(dia_bdt_1033_fluechtling_tip2);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Relax. I only want to talk.",dia_bdt_1033_fluechtling_tip2_frei);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"The judge has sent me to bring you back.",dia_bdt_1033_fluechtling_tip2_knast);
		Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"Where is Morgahard, your leader?",dia_bdt_1033_fluechtling_tip2_morgahard);
	};
};

func void dia_bdt_1033_fluechtling_tip2_morgahard()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00");	//Where is Morgahard, your leader?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01");	//(scared) I don't want any trouble. Go to the landowner. He wanted to hide himself with the mercenaries. And now leave me alone.
	AI_StopProcessInfos(self);
};

func void dia_bdt_1033_fluechtling_tip2_knast()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00");	//The judge has sent me to bring you back.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01");	//(screams) NO.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1033_fluechtling_tip2_frei()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_15_00");	//Relax. I only want to talk.
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_07_01");	//But I don't want to talk to you. Beat it, man.
	Info_AddChoice(dia_bdt_1033_fluechtling_tip2,"You're really scared shitless, aren't you?",dia_bdt_1033_fluechtling_tip2_frei_verbrechen);
};

func void dia_bdt_1033_fluechtling_tip2_frei_verbrechen()
{
	AI_Output(other,self,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00");	//You're really scared shitless, aren't you?
	AI_Output(self,other,"DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01");	//You can talk. The gallows isn't waiting for you if you get caught.
};


instance DIA_BDT_1033_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1033_fluechtling;
	nr = 3;
	condition = dia_bdt_1033_fluechtling_perm_condition;
	information = dia_bdt_1033_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1033_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1033_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 999;
	condition = dia_bdt_1034_fluechtling_exit_condition;
	information = dia_bdt_1034_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1034_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1034_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1034_fluechtling;
	nr = 2;
	condition = dia_bdt_1034_fluechtling_perm_condition;
	information = dia_bdt_1034_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1034_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1034_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_EXIT(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 999;
	condition = dia_bdt_1035_fluechtling_exit_condition;
	information = dia_bdt_1035_fluechtling_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1035_fluechtling_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1035_fluechtling_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_FLUECHTLING_PERM(C_INFO)
{
	npc = bdt_1035_fluechtling;
	nr = 2;
	condition = dia_bdt_1035_fluechtling_perm_condition;
	information = dia_bdt_1035_fluechtling_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_bdt_1035_fluechtling_perm_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1035_fluechtling_perm_info()
{
	b_dia_bdt_10xx_fluechtling_stimme7();
	AI_StopProcessInfos(self);
};

