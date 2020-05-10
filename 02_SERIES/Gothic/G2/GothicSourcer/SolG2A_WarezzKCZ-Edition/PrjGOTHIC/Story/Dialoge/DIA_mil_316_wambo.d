
instance DIA_WAMBO_EXIT(C_INFO)
{
	npc = mil_316_wambo;
	nr = 999;
	condition = dia_wambo_exit_condition;
	information = dia_wambo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wambo_exit_condition()
{
	return TRUE;
};

func void dia_wambo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAMBO_PICKPOCKET(C_INFO)
{
	npc = mil_316_wambo;
	nr = 900;
	condition = dia_wambo_pickpocket_condition;
	information = dia_wambo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_KEY;
};


func int dia_wambo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void dia_wambo_pickpocket_info()
{
	Info_ClearChoices(dia_wambo_pickpocket);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_BACK,dia_wambo_pickpocket_back);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_PICKPOCKET,dia_wambo_pickpocket_doit);
};

func void dia_wambo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_city_tower_04,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_wambo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_wambo_pickpocket_back()
{
	Info_ClearChoices(dia_wambo_pickpocket);
};


instance DIA_WAMBO_JOB(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_job_condition;
	information = dia_wambo_job_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_wambo_job_condition()
{
	return TRUE;
};

func void dia_wambo_job_info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//I make sure that nobody enters the houses.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//Explicit order from Lord Hagen. And don't even think about violating this order!
};


instance DIA_WAMBO_SITUATION(C_INFO)
{
	npc = mil_316_wambo;
	nr = 10;
	condition = dia_wambo_situation_condition;
	information = dia_wambo_situation_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_wambo_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_job))
	{
		return TRUE;
	};
};

func void dia_wambo_situation_info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//How are things?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//At the moment, everything is quiet.
};


instance DIA_WAMBO_RAMIREZ(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_ramirez_condition;
	information = dia_wambo_ramirez_info;
	permanent = FALSE;
	description = "I come from our mutual friend Ramirez.";
};


func int dia_wambo_ramirez_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_viertel))
	{
		return TRUE;
	};
};

func void dia_wambo_ramirez_info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//I come from our mutual friend Ramirez.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Oh? That Ramirez is a little rat. And he's no friend of mine. Never mind. Did you bring me anything?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//That depends on what it is you want.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(quietly) Okay, I'll tell you how it works. You pay 250 gold pieces. Then I won't be here at night.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//If you're too conspicuous anyway and I happen to be in the area, the deal is off.
};


instance DIA_WAMBO_DEAL(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_deal_condition;
	information = dia_wambo_deal_info;
	permanent = TRUE;
	description = "(Pay 250 gold)";
};


var int dia_wambo_deal_permanent;

func int dia_wambo_deal_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_ramirez) && (DIA_WAMBO_DEAL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wambo_deal_info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//I've got your money...
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//All right, then I'll disappear in the evening from now on.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//And remember - if you cause trouble around me, I don't know you.
		DIA_WAMBO_DEAL_PERMANENT = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//... but not with me right now.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//I can't stand it when somebody tries to make a fool out of me. So get the gold.
		AI_StopProcessInfos(self);
	};
};

