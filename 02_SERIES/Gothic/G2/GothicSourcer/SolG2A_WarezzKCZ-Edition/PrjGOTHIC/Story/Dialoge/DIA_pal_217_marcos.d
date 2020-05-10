
instance DIA_MARCOS_EXIT(C_INFO)
{
	npc = pal_217_marcos;
	nr = 999;
	condition = dia_marcos_exit_condition;
	information = dia_marcos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marcos_exit_condition()
{
	return TRUE;
};

func void dia_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_HALLO(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hallo_condition;
	information = dia_marcos_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marcos_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marcos_hallo_info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//HALT - in the name of Innos! I am Marcos, paladin of the king. Say what you want, and speak the truth!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//A Chosen of Innos always speaks the truth.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//Forgive me, reverend magician. I did not realize with whom I was speaking.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//Yes, all right, never mind.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//If I am permitted to ask - what brings you to this area?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//Relax - I am in the service of Lord Hagen.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//You're one of the troops. What orders bring you here?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//Relax, we're working for the same boss - Lord Hagen.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//Since when does Lord Hagen hire mercenaries? Speak - what do you want here?
	};
};


instance DIA_MARCOS_HAGEN(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hagen_condition;
	information = dia_marcos_hagen_info;
	permanent = FALSE;
	description = "I need to bring Lord Hagen proof that the dragons exist.";
};


func int dia_marcos_hagen_condition()
{
	if((KAPITEL == 2) && (garond.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_hagen_info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//I need to bring Lord Hagen proof that the dragons exist.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//Then you shouldn't lose any time and don't risk your life unnecessarily.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//Do you think you're going to find a dragon scale here you can take to him?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//Try to reach the castle and speak to Commander Garond.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//He must learn that you are on a mission from Lord Hagen! And he will take care of your assignment, too.
};


instance DIA_MARCOS_GAROND(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_garond_condition;
	information = dia_marcos_garond_info;
	permanent = FALSE;
	description = "I come from Garond...";
};


func int dia_marcos_garond_condition()
{
	if((KAPITEL == 2) && (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_marcos_garond_info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//I come from Garond - he needs to know how much ore is ready for transport.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//Tell Garond that I had to leave the mining site because the orc attacks became too intense.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//I tried to reach the castle with a few people, but I am the only survivor.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//I have stored the ore safely. There are FOUR chests. Go to Garond and report that to him.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//Tell him that I will guard the ore with my life. But I don't know how long it will be before the orcs find me here.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//Tell him to send me some support.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//I'll let him know.
	b_logentry(TOPIC_SCOUTMINE,"Paladin Marcos guards FOUR crates of ore in a small valley.");
	Log_CreateTopic(TOPIC_MARCOSJUNGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARCOSJUNGS,LOG_RUNNING);
	b_logentry(TOPIC_MARCOSJUNGS,"Marcos wants Garond to send him some help.");
	MIS_MARCOS_JUNGS = LOG_RUNNING;
	MARCOS_ORE = TRUE;
	self.flags = 0;
};


instance DIA_MARCOS_PERM(C_INFO)
{
	npc = pal_217_marcos;
	nr = 9;
	condition = dia_marcos_perm_condition;
	information = dia_marcos_perm_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_marcos_perm_condition()
{
	if((KAPITEL >= 2) && (Npc_KnowsInfo(other,dia_marcos_hagen) || Npc_KnowsInfo(other,dia_marcos_garond)))
	{
		return TRUE;
	};
};

func void dia_marcos_perm_info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//How's the situation?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//I need a strong draught of healing potion!
		b_useitem(self,itpo_health_03);
	}
	else if(MIS_MARCOS_JUNGS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//I shall hold out - and I hope that Garond will send me support soon.
	}
	else if(MIS_MARCOS_JUNGS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//Thank you for your help. Innos will give us the strength to stand firm.
		if(MARCOS_EINMALIG == FALSE)
		{
			b_giveplayerxp(XP_MARCOS_JUNGS);
			MARCOS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//I shall stand firm because Innos is with me!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_PICKPOCKET(C_INFO)
{
	npc = pal_217_marcos;
	nr = 900;
	condition = dia_marcos_pickpocket_condition;
	information = dia_marcos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_marcos_pickpocket_condition()
{
	return c_beklauen(65,380);
};

func void dia_marcos_pickpocket_info()
{
	Info_ClearChoices(dia_marcos_pickpocket);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_BACK,dia_marcos_pickpocket_back);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_PICKPOCKET,dia_marcos_pickpocket_doit);
};

func void dia_marcos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marcos_pickpocket);
};

func void dia_marcos_pickpocket_back()
{
	Info_ClearChoices(dia_marcos_pickpocket);
};

