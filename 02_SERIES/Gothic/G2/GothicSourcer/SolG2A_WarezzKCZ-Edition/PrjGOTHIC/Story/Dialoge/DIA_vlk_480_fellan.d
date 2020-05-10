
instance DIA_FELLAN_EXIT(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 999;
	condition = dia_fellan_exit_condition;
	information = dia_fellan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fellan_exit_condition()
{
	return TRUE;
};

func void dia_fellan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_PICKPOCKET(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 900;
	condition = dia_fellan_pickpocket_condition;
	information = dia_fellan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fellan_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_fellan_pickpocket_info()
{
	Info_ClearChoices(dia_fellan_pickpocket);
	Info_AddChoice(dia_fellan_pickpocket,DIALOG_BACK,dia_fellan_pickpocket_back);
	Info_AddChoice(dia_fellan_pickpocket,DIALOG_PICKPOCKET,dia_fellan_pickpocket_doit);
};

func void dia_fellan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fellan_pickpocket);
};

func void dia_fellan_pickpocket_back()
{
	Info_ClearChoices(dia_fellan_pickpocket);
};


instance DIA_FELLAN_NEWS(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 1;
	condition = dia_fellan_news_condition;
	information = dia_fellan_news_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_fellan_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_fellan_news_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_00");	//OK, so you beat me. Some heroic deed that was.
		if((MIS_ATTACKFELLAN == LOG_RUNNING) && (FELLANGESCHLAGEN == FALSE))
		{
			AI_Output(other,self,"DIA_Fellan_News_15_01");	//Will you stop hammering now, or do I have to thrash you again?
			AI_Output(self,other,"DIA_Fellan_News_06_02");	//No, don't hit me any more. I'll stop. But if everything collapses around here, it'll be your fault!
			FELLANGESCHLAGEN = TRUE;
			Npc_ExchangeRoutine(self,"OHNEHAMMER");
			AI_StopProcessInfos(self);
		};
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_03");	//What's the matter? Want another punch in the face?
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
	{
		AI_Output(self,other,"DIA_Fellan_News_06_04");	//What kind of a loony are you? Fight, don't fight, talk - what exactly is it you want?
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_FELLAN_HALLO(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 2;
	condition = dia_fellan_hallo_condition;
	information = dia_fellan_hallo_info;
	permanent = FALSE;
	description = "Why are you hammering?";
};


func int dia_fellan_hallo_condition()
{
	if(FELLANGESCHLAGEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_fellan_hallo_info()
{
	AI_Output(other,self,"DIA_Fellan_HALLO_15_00");	//Why are you hammering?
	AI_Output(self,other,"DIA_Fellan_HALLO_06_01");	//For days now, I've been desperately trying to fix the leaks in my house.
	AI_Output(self,other,"DIA_Fellan_HALLO_06_02");	//The rafters have been crumbling away ever since we had those rainfalls recently. Soon everything's going to come down around my ears!
	AI_StopProcessInfos(self);
};


instance DIA_FELLAN_STOP(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 3;
	condition = dia_fellan_stop_condition;
	information = dia_fellan_stop_info;
	permanent = FALSE;
	description = "Could you stop hammering?";
};


func int dia_fellan_stop_condition()
{
	if(MIS_ATTACKFELLAN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fellan_stop_info()
{
	AI_Output(other,self,"DIA_Fellan_Stop_15_00");	//Could you stop hammering?
	AI_Output(self,other,"DIA_Fellan_Stop_06_01");	//No, I have to finish this.
	Info_ClearChoices(dia_fellan_stop);
	Info_AddChoice(dia_fellan_stop,"Stop that hammering, or I'll break every bone in your body.",dia_fellan_stop_bones);
	Info_AddChoice(dia_fellan_stop,"I'll give you 10 gold pieces if you stop that hammering.",dia_fellan_stop_gold);
	Info_AddChoice(dia_fellan_stop,"Just quit hammering, OK?",dia_fellan_stop_just);
};

func void dia_fellan_stop_bones()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Bones_15_00");	//Stop that hammering, or I'll break every bone in your body.
	AI_Output(self,other,"DIA_Fellan_Stop_Bones_06_01");	//Forget it, or I'll knock some sense into your head with my hammer.
	AI_StopProcessInfos(self);
};

func void dia_fellan_stop_gold()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Gold_15_00");	//I'll give you 10 gold pieces if you stop that hammering.
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_01");	//Hey... That's very generous of you. But as to your gold, you can...
	AI_Output(self,other,"DIA_Fellan_Stop_Gold_06_02");	//... well, you know what you can do with it.
};

func void dia_fellan_stop_just()
{
	AI_Output(other,self,"DIA_Fellan_Stop_Just_15_00");	//Just quit hammering, OK?
	AI_Output(self,other,"DIA_Fellan_Stop_Just_06_01");	//Just try not to bug me too much, OK?
};


instance DIA_FELLAN_KLAR(C_INFO)
{
	npc = vlk_480_fellan;
	nr = 5;
	condition = dia_fellan_klar_condition;
	information = dia_fellan_klar_info;
	permanent = TRUE;
	description = "Hellooo - are you feeling quite well?";
};


func int dia_fellan_klar_condition()
{
	if(Npc_KnowsInfo(other,dia_fellan_hallo))
	{
		return TRUE;
	};
};

func void dia_fellan_klar_info()
{
	AI_Output(other,self,"DIA_Fellan_klar_15_00");	//Hellooo - are you feeling quite well?
	if(FELLANGESCHLAGEN == FALSE)
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_01");	//Fine, just as long as I manage to get all this repaired in time.
	}
	else
	{
		AI_Output(self,other,"DIA_Fellan_klar_06_02");	//The roof is getting worse all the time. The next time it rains, the water will be sloshing up to my ankles. And it's all your fault!
	};
	AI_StopProcessInfos(self);
};

