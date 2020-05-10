
instance DIA_ALVARES_EXIT(C_INFO)
{
	npc = sld_840_alvares;
	nr = 999;
	condition = dia_alvares_exit_condition;
	information = dia_alvares_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alvares_exit_condition()
{
	return TRUE;
};

func void dia_alvares_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_HAUAB(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_hauab_condition;
	information = dia_alvares_hauab_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_hauab_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_hauab_info()
{
	AKILS_SLDSTILLTHERE = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//Whatever it is that brought you here - you had better forget it and hit the road.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akil's farm is threatened by mercenaries.");
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_ATTACK(C_INFO)
{
	npc = sld_840_alvares;
	nr = 6;
	condition = dia_alvares_attack_condition;
	information = dia_alvares_attack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_attack_condition()
{
	if(Npc_KnowsInfo(other,dia_alvares_hauab) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_attack_info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//Hey, you're still here. I'll give you a choice, stranger: piss off, or die.
	Info_ClearChoices(dia_alvares_attack);
	Info_AddChoice(dia_alvares_attack,"Who are you guys - a pair of jokers?",dia_alvares_attack_kerle);
	Info_AddChoice(dia_alvares_attack,"I want to join you mercenaries.",dia_alvares_attack_soeldner);
	Info_AddChoice(dia_alvares_attack,"You guys get out of here now...",dia_alvares_attack_witz);
	Info_AddChoice(dia_alvares_attack,"I don't want any trouble.",dia_alvares_attack_aerger);
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		Info_AddChoice(dia_alvares_attack,"I've only come to fetch something.",dia_alvares_attack_lieferung);
	};
};

func void dia_alvares_attack_witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//You guys get out of here now, got it?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//Looky here, we've got a hero at our hands - a truly stupid hero.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//Do you know what I think?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//Who cares what you think?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//I think that the only good hero is a dead hero. So do me a favor - hurry up and die!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//Who are you guys - a pair of jokers?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//You got it. I'm still going to laugh when you're lying face down in the mud.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(calls) Engardo, let's get started! You grab the farmer - I'm going to take care of this clown!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//I don't want any trouble.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//But trouble is what we're seeking. We've come a long way just to start a little trouble.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//Yes, we are going to cause a lot of trouble. And I shall start with you if you don't beat it right now.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//I've only come to fetch something.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//So are we. And we were here first. So piss off, or I may have to hurt you.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//I want to join you mercenaries.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//Oh, really? Piss off, then - or you're not going to join anyone ever again.
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_SCHLUSS(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_schluss_condition;
	information = dia_alvares_schluss_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_schluss_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_alvares_attack))
	{
		return TRUE;
	};
};

func void dia_alvares_schluss_info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//You had your chance. But you don't seem to want to listen to reason.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//All right - so I'm going to kill you now. (calls) Engardo, let's do them in!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_ALVARES_PICKPOCKET(C_INFO)
{
	npc = sld_840_alvares;
	nr = 900;
	condition = dia_alvares_pickpocket_condition;
	information = dia_alvares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alvares_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_alvares_pickpocket_info()
{
	Info_ClearChoices(dia_alvares_pickpocket);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_BACK,dia_alvares_pickpocket_back);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_PICKPOCKET,dia_alvares_pickpocket_doit);
};

func void dia_alvares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alvares_pickpocket);
};

func void dia_alvares_pickpocket_back()
{
	Info_ClearChoices(dia_alvares_pickpocket);
};

