
instance DIA_TENGRON_EXIT(C_INFO)
{
	npc = pal_280_tengron;
	nr = 999;
	condition = dia_tengron_exit_condition;
	information = dia_tengron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tengron_exit_condition()
{
	return TRUE;
};

func void dia_tengron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TENGRON_FIRST(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_first_condition;
	information = dia_tengron_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE != LOG_RUNNING) && (MIS_SCOUTMINE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_first_info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//What are you doing here?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//I am traveling by order of Lord Hagen.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//You absolutely must try to reach the castle and speak to Commander Garond.
};


instance DIA_TENGRON_HALLO(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_hallo_condition;
	information = dia_tengron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_hallo_condition()
{
	if((Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE == LOG_RUNNING)) || (MIS_SCOUTMINE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_hallo_info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//May Innos be with you! Do you bring news from the castle? Are reinforcements coming soon?
	if(Npc_IsDead(fajeth) == FALSE)
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//I haven't come to bring news, but to get news.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//Then speak to Fajeth. He's in command here. But if you have news from the castle, then let me know.
	};
};


instance DIA_TENGRON_NEWS(C_INFO)
{
	npc = pal_280_tengron;
	nr = 7;
	condition = dia_tengron_news_condition;
	information = dia_tengron_news_info;
	permanent = FALSE;
	description = "About the news...";
};


func int dia_tengron_news_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_news_info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//About the news...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//Yes - what's the situation in the castle?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//It is still besieged by the orcs, and also still open to the dragons' attacks.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//Damn, I hope the boys will hold out.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//Listen, a friend of mine is in the castle. His name is Udar. We've known each other a long time and fought a lot of battles side by side.
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//I want you to take him this ring. He is to keep it safe for me. Tell him I'll get it when I come back.
	Info_ClearChoices(dia_tengron_news);
	Info_AddChoice(dia_tengron_news,"I've got no time for that.",dia_tengron_news_no);
	Info_AddChoice(dia_tengron_news,"No problem...",dia_tengron_news_yes);
};

func void dia_tengron_news_no()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//I've got no time for that.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//I understand.
	Info_ClearChoices(dia_tengron_news);
};

func void dia_tengron_news_yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//No problem. When I get to the castle, I will give the ring to Udar.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//Good. The magic of the ring will give Udar new strength. And tell him that I'll get it back from him.
	b_giveinvitems(self,other,itri_tengron,1);
	Info_ClearChoices(dia_tengron_news);
	Log_CreateTopic(TOPIC_TENGRONRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TENGRONRING,LOG_RUNNING);
	b_logentry(TOPIC_TENGRONRING,"Tengron gave me a ring that I'm to give Udar in the castle.");
};


instance DIA_TENGRON_SITUATION(C_INFO)
{
	npc = pal_280_tengron;
	nr = 70;
	condition = dia_tengron_situation_condition;
	information = dia_tengron_situation_info;
	permanent = TRUE;
	description = "How's your situation here?";
};


func int dia_tengron_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_situation_info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//How's your situation here?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//We are surrounded by monsters and have hardly mined any ore so far. Plus we've lost a lot of good men.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//I don't know how long we can hold out, but we won't give up!
};


instance DIA_TENGRON_HELP(C_INFO)
{
	npc = pal_280_tengron;
	nr = 9;
	condition = dia_tengron_help_condition;
	information = dia_tengron_help_info;
	permanent = FALSE;
	description = "I could use your help...";
};


func int dia_tengron_help_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_help_info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//I could use your help. Fajeth wants me to hunt the lizards, and...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//I take orders ONLY from Fajeth. And my orders say to guard the mining site. And that's exactly what I'm doing.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//Maybe someone else will help you.
};


instance DIA_TENGRON_PICKPOCKET(C_INFO)
{
	npc = pal_280_tengron;
	nr = 900;
	condition = dia_tengron_pickpocket_condition;
	information = dia_tengron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_tengron_pickpocket_condition()
{
	return c_beklauen(32,50);
};

func void dia_tengron_pickpocket_info()
{
	Info_ClearChoices(dia_tengron_pickpocket);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_BACK,dia_tengron_pickpocket_back);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_PICKPOCKET,dia_tengron_pickpocket_doit);
};

func void dia_tengron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tengron_pickpocket);
};

func void dia_tengron_pickpocket_back()
{
	Info_ClearChoices(dia_tengron_pickpocket);
};

