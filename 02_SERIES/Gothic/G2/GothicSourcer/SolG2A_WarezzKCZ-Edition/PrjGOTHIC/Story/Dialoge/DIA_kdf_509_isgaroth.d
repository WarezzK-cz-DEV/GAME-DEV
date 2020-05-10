
instance DIA_ISGAROTH_EXIT(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 999;
	condition = dia_isgaroth_exit_condition;
	information = dia_isgaroth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_isgaroth_exit_condition()
{
	return TRUE;
};

func void dia_isgaroth_exit_info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//May Innos watch over you always.
	AI_StopProcessInfos(self);
};


instance DIA_ISGAROTH_HELLO(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_hello_condition;
	information = dia_isgaroth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_isgaroth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_isgaroth_hello_info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//Innos be with you. What can I do for you, wanderer?
};


instance DIA_ISGAROTH_SEGEN(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 10;
	condition = dia_isgaroth_segen_condition;
	information = dia_isgaroth_segen_info;
	permanent = TRUE;
	description = "Bless me!";
};


func int dia_isgaroth_segen_condition()
{
	return TRUE;
};

func void dia_isgaroth_segen_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//Bless me!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//I bless you in the name of Innos. May the Lord's fire burn in your heart and give you the strength to act according to his justice.
	ISGAROTH_SEGEN = TRUE;
};


instance DIA_ISGAROTH_WOLF(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_wolf_condition;
	information = dia_isgaroth_wolf_info;
	permanent = FALSE;
	description = "Sergio sent me...";
};


func int dia_isgaroth_wolf_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (SERGIO_SENDS == TRUE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_isgaroth_wolf_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//Sergio sent me. I have taken over his task. So, what is it?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//A dark wolf has been roaming the area recently. Track it down and kill it.
	MIS_ISGAROTHWOLF = LOG_RUNNING;
	b_logentry(TOPIC_ISGAROTHWOLF,"There's a dark wolf roaming around the shrine. I should find him and kill him.");
};


instance DIA_ISGAROTH_TOT(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_tot_condition;
	information = dia_isgaroth_tot_info;
	permanent = TRUE;
	description = "I have killed the wolf.";
};


func int dia_isgaroth_tot_condition()
{
	WOLFI = Hlp_GetNpc(blackwolf);
	if((MIS_ISGAROTHWOLF == LOG_RUNNING) && Npc_IsDead(wolfi))
	{
		return TRUE;
	};
};

func void dia_isgaroth_tot_info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//I have killed the wolf.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//Good work, novice. You are a brave man. But now return to the monastery and go about your duties.
	MIS_ISGAROTHWOLF = LOG_SUCCESS;
	b_giveplayerxp(XP_ISGAROTHWOLF);
	AI_StopProcessInfos(self);
};


instance DIA_ISGAROTH_JOB(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 4;
	condition = dia_isgaroth_job_condition;
	information = dia_isgaroth_job_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_isgaroth_job_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_isgaroth_job_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//I am a Magician of Fire. A priest of our god Innos.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//This shrine is consecrated to HIM, the highest god, the creator of the fire and lord of justice.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//People come to me in order to pray to Innos and be blessed.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//And for a small donation, you can get many useful things from me.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"Master Isgaroth trades useful magic objects at the shrine in front of the monastery.");
};


instance DIA_ISGAROTH_TRADE(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 99;
	condition = dia_isgaroth_trade_condition;
	information = dia_isgaroth_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_isgaroth_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_isgaroth_job))
	{
		return TRUE;
	};
};

func void dia_isgaroth_trade_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
};


instance DIA_ISGAROTH_KLOSTER(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 3;
	condition = dia_isgaroth_kloster_condition;
	information = dia_isgaroth_kloster_info;
	permanent = FALSE;
	description = "Where will this path take me?";
};


func int dia_isgaroth_kloster_condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_isgaroth_kloster_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//Where will this path take me?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//The path leads to the monastery of the Magicians of Fire. However, access is permitted only to the servants of Innos.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//And if you want to be accepted as a novice in the monastery, you must bring a sheep and...
		b_say_gold(self,other,SUMME_KLOSTER);
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"To become a novice at the monastery of Innos, I need a sheep and 1000 pieces of gold.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//Since you have already chosen to join another group, entrance will be denied you.
	};
};


instance DIA_ISGAROTH_VATRAS(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 3;
	condition = dia_isgaroth_vatras_condition;
	information = dia_isgaroth_vatras_info;
	permanent = TRUE;
	description = "I carry a message from Vatras.";
};


func int dia_isgaroth_vatras_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && ((Npc_HasItems(other,itwr_vatrasmessage) == 1) || (Npc_HasItems(other,itwr_vatrasmessage_open) == 1)))
	{
		return TRUE;
	};
};

func void dia_isgaroth_vatras_info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//I carry a message from Vatras.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//What is this message?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//It's a letter. Here.
	if(Npc_HasItems(other,itwr_vatrasmessage) == 1)
	{
		if(b_giveinvitems(other,self,itwr_vatrasmessage,1))
		{
			Npc_RemoveInvItems(self,itwr_vatrasmessage,1);
		};
		b_usefakescroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//Good, you can tell Vatras that I have received the message.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//Take these potions as a reward for your service, they will surely be of use to you.
		CreateInvItems(self,itpo_health_02,2);
		b_giveinvitems(self,other,itpo_health_02,2);
		b_giveplayerxp(XP_AMBIENT * 2);
	}
	else if(Npc_HasItems(other,itwr_vatrasmessage_open) == 1)
	{
		if(b_giveinvitems(other,self,itwr_vatrasmessage_open,1))
		{
			Npc_RemoveInvItems(self,itwr_vatrasmessage_open,1);
		};
		b_usefakescroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//The seal is broken. What were you thinking, you fool!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//Go and tell Vatras that I have received his message.
		AI_StopProcessInfos(self);
	};
	VATRAS_RETURN = TRUE;
};


instance DIA_ISGAROTH_PICKPOCKET(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 900;
	condition = dia_isgaroth_pickpocket_condition;
	information = dia_isgaroth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_isgaroth_pickpocket_condition()
{
	return c_beklauen(48,50);
};

func void dia_isgaroth_pickpocket_info()
{
	Info_ClearChoices(dia_isgaroth_pickpocket);
	Info_AddChoice(dia_isgaroth_pickpocket,DIALOG_BACK,dia_isgaroth_pickpocket_back);
	Info_AddChoice(dia_isgaroth_pickpocket,DIALOG_PICKPOCKET,dia_isgaroth_pickpocket_doit);
};

func void dia_isgaroth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_isgaroth_pickpocket);
};

func void dia_isgaroth_pickpocket_back()
{
	Info_ClearChoices(dia_isgaroth_pickpocket);
};

