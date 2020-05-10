
instance DIA_BILGOT_EXIT(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 999;
	condition = dia_bilgot_exit_condition;
	information = dia_bilgot_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bilgot_exit_condition()
{
	return TRUE;
};

func void dia_bilgot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_HALLO(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_hallo_condition;
	information = dia_bilgot_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_hallo_condition()
{
	return TRUE;
};

func void dia_bilgot_hallo_info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//Hey, where do you come from? Have you come from the castle?
	Info_AddChoice(dia_bilgot_hallo,"Yes, I come from the castle - why?",dia_bilgot_hallo_burg);
	Info_AddChoice(dia_bilgot_hallo,"I just chanced to come by here...",dia_bilgot_hallo_zufall);
};

func void dia_bilgot_hallo_zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//I just chanced to come by here...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//Boy, nobody just HAPPENS to come by here. We're screwed here - surrounded by snappers!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//Not a day has gone by so far without one of us biting the dust.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//You won't tell me where you came from? All right - may the snappers take you then!
	AI_StopProcessInfos(self);
};

func void dia_bilgot_hallo_burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//Yes, I come from the castle - why?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//What's the situation there?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//No better than here. The orcs are still there, if that's what you mean.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//Damn. You're not safe anywhere.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//I'll tell you something. If I weren't scared shitless, I'd just beat it out of here.
	Info_ClearChoices(dia_bilgot_hallo);
};


instance DIA_BILGOT_JOB(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_job_condition;
	information = dia_bilgot_job_info;
	permanent = FALSE;
	description = "What are you doing here anyway?";
};


func int dia_bilgot_job_condition()
{
	return TRUE;
};

func void dia_bilgot_job_info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//What are you doing here anyway?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//I'm the general dogsbody here. Schlep stuff around, keep an eye on the snappers, Bilgot here, Bilgot there.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//I should have just stayed home with my old lady. It wasn't any different there, but at least there was something decent to eat.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//And now I'm all that remains of the men-at-arms that were assigned to Fajeth.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//How was I to know that this expedition wasn't going to make it back?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//My pal Olav made himself scarce. Maybe HE pulled it off...
};


instance DIA_BILGOT_HILFE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_hilfe_condition;
	information = dia_bilgot_hilfe_info;
	permanent = FALSE;
	description = "What do you know about the snappers?";
};


func int dia_bilgot_hilfe_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bilgot_hilfe_info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//What do you know about the snappers?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//Why do you want to know that? And don't tell me you're just curious!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//I'm going to hunt those snappers,
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//That's crazy. I've watched them - those are bloodthirsty beasts.
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//Then tell me what you know about them.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//Hm... I could help you - but only under one condition!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//What do you want?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//If you manage to kill the snappers - then you have to get me out of here!
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//I can't take it here much longer - have you talked to Fed? The guy is wrecked - and I don't want to end up like him!
	};
};


instance DIA_BILGOT_KNOWSLEADSNAPPER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 4;
	condition = dia_bilgot_knowsleadsnapper_condition;
	information = dia_bilgot_knowsleadsnapper_info;
	permanent = FALSE;
	description = "Tell me what you know. Then I'll get you out of here!";
};


func int dia_bilgot_knowsleadsnapper_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_hilfe) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bilgot_knowsleadsnapper_info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//Tell me what you know. Then I'll get you out of here!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//I knew I could count on you. So, pay attention. I've watched the snappers for quite a while.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//They're very cunning and have a kind of... communication. They never go alone and attack only in a pack.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//But there's something else. There's a lizard among them that's different. It rarely shows up - but I've seen it.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//The other beasts bow when they go past it - but they always keep it in sight as they do so.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//As long as that one doesn't move, no lizard in its vicinity will.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//Where can I find that bloody beast?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//I saw it by the steps to the old watchtower.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//Fine. I think I understand. Thank you!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//Remember, you gave me your word!
	Wld_InsertNpc(newmine_leadsnapper,"OW_ORC_LOOKOUT_2_01");
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"Bilgot told me about the leader of a snapper pack. It's supposed to be at the steps to the old watchtower.");
	Log_CreateTopic(TOPIC_BILGOTESCORT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BILGOTESCORT,LOG_RUNNING);
	b_logentry(TOPIC_BILGOTESCORT,"Bilgot wants me to get him out of the valley.");
};


instance DIA_BILGOT_TAKEYOUWITHME(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_takeyouwithme_condition;
	information = dia_bilgot_takeyouwithme_info;
	permanent = FALSE;
	description = "(Keep promise)";
};


func int dia_bilgot_takeyouwithme_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_bilgot_takeyouwithme_info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//It's time, Bilgot! Pack your things, we're off.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//I'm ready!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	bilgot.flags = 0;
	MIS_RESCUEBILGOT = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_LAUFSCHNELLER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 5;
	condition = dia_bilgot_laufschneller_condition;
	information = dia_bilgot_laufschneller_info;
	permanent = FALSE;
	description = "Can't you walk a little faster?!";
};


func int dia_bilgot_laufschneller_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_takeyouwithme) && (Npc_KnowsInfo(other,dia_bilgot_beibrueckeangekommen) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bilgot_laufschneller_info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//Can't you walk a little faster?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//I'm going as fast as I can.
};


instance DIA_BILGOT_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_beibrueckeangekommen_condition;
	information = dia_bilgot_beibrueckeangekommen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_beibrueckeangekommen_condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void dia_bilgot_beibrueckeangekommen_info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//Right, there we are. Now hit the road. This area's hot!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//Thank you!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//Don't get yourself eaten. That would be a pity.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//Farewell!
	AI_StopProcessInfos(self);
	TSCHUESSBILGOT = TRUE;
	MIS_RESCUEBILGOT = LOG_SUCCESS;
	b_giveplayerxp(XP_BILGOTESCORT);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_BILGOT_LETZTEPAUSE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_letztepause_condition;
	information = dia_bilgot_letztepause_info;
	permanent = TRUE;
	description = "What are you doing here? I thought you were headed across the pass?";
};


func int dia_bilgot_letztepause_condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void dia_bilgot_letztepause_info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//What are you doing here? I thought you were headed across the pass?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//I just can't go on. Let me rest for a moment. I'll manage. Don't worry!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//If you say so.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//Just a little break.
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_OLAV(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_olav_condition;
	information = dia_bilgot_olav_info;
	permanent = FALSE;
	description = "I found Olav.";
};


func int dia_bilgot_olav_condition()
{
	if((Npc_HasItems(olav,itse_olav) == 0) && Npc_KnowsInfo(other,dia_bilgot_job))
	{
		return TRUE;
	};
};

func void dia_bilgot_olav_info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//I found Olav.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//And what's he up to?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//He's dead. The wolves ate him.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//Oh, damn. I hope that at least I will manage to get out of here.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BILGOT_PICKPOCKET(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 900;
	condition = dia_bilgot_pickpocket_condition;
	information = dia_bilgot_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_bilgot_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_bilgot_pickpocket_info()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_BACK,dia_bilgot_pickpocket_back);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_PICKPOCKET,dia_bilgot_pickpocket_doit);
};

func void dia_bilgot_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bilgot_pickpocket);
};

func void dia_bilgot_pickpocket_back()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
};

