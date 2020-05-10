
instance DIA_MORGAHARD_EXIT(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 999;
	condition = dia_morgahard_exit_condition;
	information = dia_morgahard_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_morgahard_exit_condition()
{
	return TRUE;
};

func void dia_morgahard_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_HALLO(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_hallo_condition;
	information = dia_morgahard_hallo_info;
	description = "You are Morgahard.";
};


func int dia_morgahard_hallo_condition()
{
	return TRUE;
};

func void dia_morgahard_hallo_info()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_00");	//You are Morgahard.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_01");	//How come you know my name?
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_02");	//The judge is looking for you. You fled from his jail.
	AI_Output(other,self,"DIA_Morgahard_HALLO_15_03");	//What did you do, then? Steal his wallet?
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_04");	//Not his. The governor's. And on his behalf, too.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_05");	//After we attacked the governor, he didn't want to share the booty with us and had us arrested.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_06");	//We didn't want to wind up on the gallows, so we fled.
	AI_Output(self,other,"DIA_Morgahard_HALLO_07_07");	//We thought they'd never catch us that way. That seems to have been a mistake.
	Info_ClearChoices(dia_morgahard_hallo);
	Info_AddChoice(dia_morgahard_hallo,"Stop whining and draw your weapon.",dia_morgahard_hallo_attack);
	Info_AddChoice(dia_morgahard_hallo,"What can we do against the judge?",dia_morgahard_hallo_richter);
	Info_AddChoice(dia_morgahard_hallo,"The judge ordered me to kill you.",dia_morgahard_hallo_tot);
	b_logentry(TOPIC_RICHTERLAKAI,"I've found Morgahard, the leader of the fugitives.");
	SCFOUNDMORGAHARD = TRUE;
	b_giveplayerxp(XP_FOUNDMORGAHARD);
};

func void dia_morgahard_hallo_tot()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_tot_15_00");	//The judge ordered me to kill you.
	AI_Output(self,other,"DIA_Morgahard_HALLO_tot_07_01");	//Yeah, sure. That's why you're here, isn't it?
};

func void dia_morgahard_hallo_richter()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_00");	//What can we do against the judge?
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_01");	//Nothing at all. He sits up there in the upper end of town like a spider in its web, untouchable.
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_02");	//I wouldn't say that. We'd only need some proof of his guilt in the matter concerning the governor.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_03");	//Proof, you say? I have that. But who would listen to a convicted criminal?
	AI_Output(other,self,"DIA_Morgahard_HALLO_richter_15_04");	//Give me your proof, and I'll see to it that no one will hunt you again.
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_05");	//Are you sure? All right. Here, take this letter. It bears the judge's signature.
	b_giveinvitems(self,other,itwr_richterkomprobrief_mis,1);
	AI_Output(self,other,"DIA_Morgahard_HALLO_richter_07_06");	//Even if it doesn't change my guilt, it should be enough to confirm that he was an accomplice in the business.
	b_logentry(TOPIC_RICHTERLAKAI,"Morgahard gave me the judge's assignment. This piece of paper definitely proves that the judge had Governor Larius robbed. I think this is just the kind of thing Lee wanted me to find.");
	AI_StopProcessInfos(self);
};


var int morgahardsucked;

func void dia_morgahard_hallo_attack()
{
	AI_Output(other,self,"DIA_Morgahard_HALLO_attack_15_00");	//Stop whining and draw your weapon. We'll put an end to this now.
	AI_Output(self,other,"DIA_Morgahard_HALLO_attack_07_01");	//Suits me fine. I've got nothing left to lose anyway.
	AI_StopProcessInfos(self);
	MORGAHARDSUCKED = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_MORGAHARD_PERM(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm_condition;
	information = dia_morgahard_perm_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_morgahard_hallo) && (MORGAHARDSUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm_07_00");	//That swine of a judge - I'll see him swing some day.
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PERM2(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 3;
	condition = dia_morgahard_perm2_condition;
	information = dia_morgahard_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_morgahard_perm2_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MORGAHARDSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_morgahard_perm2_info()
{
	AI_Output(self,other,"DIA_Morgahard_Perm2_07_00");	//Why don't you just disappear?
	AI_StopProcessInfos(self);
};


instance DIA_MORGAHARD_PICKPOCKET(C_INFO)
{
	npc = bdt_1030_morgahard;
	nr = 900;
	condition = dia_morgahard_pickpocket_condition;
	information = dia_morgahard_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_morgahard_pickpocket_condition()
{
	return c_beklauen(73,45);
};

func void dia_morgahard_pickpocket_info()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_BACK,dia_morgahard_pickpocket_back);
	Info_AddChoice(dia_morgahard_pickpocket,DIALOG_PICKPOCKET,dia_morgahard_pickpocket_doit);
};

func void dia_morgahard_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_morgahard_pickpocket);
};

func void dia_morgahard_pickpocket_back()
{
	Info_ClearChoices(dia_morgahard_pickpocket);
};

