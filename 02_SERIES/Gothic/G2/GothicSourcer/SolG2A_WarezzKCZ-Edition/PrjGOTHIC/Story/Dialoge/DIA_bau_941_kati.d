
instance DIA_KATI_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_exit_condition;
	information = dia_kati_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_kati_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_SLDNOCHDA(C_INFO)
{
	npc = bau_941_kati;
	nr = 4;
	condition = dia_kati_sldnochda_condition;
	information = dia_kati_sldnochda_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_kati_sldnochda_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_kati_sldnochda_info()
{
	var int hilfe;
	if(hilfe == FALSE)
	{
		AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_00");	//Those cutthroats are threatening my husband! We are citizens of the town, loyal to the king, and the mercenaries are planning to rob us!
		hilfe = TRUE;
	};
	AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_01");	//Now don't you just stand there. Do something then! Help us.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akil's farm is threatened by mercenaries.");
	AI_StopProcessInfos(self);
};


instance DIA_KATI_HALLO(C_INFO)
{
	npc = bau_941_kati;
	nr = 5;
	condition = dia_kati_hallo_condition;
	information = dia_kati_hallo_info;
	permanent = FALSE;
	description = "Are you all right?";
};


func int dia_kati_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_kati_hallo_info()
{
	AI_Output(other,self,"DIA_Kati_HALLO_15_00");	//Are you all right?
	if(Npc_IsDead(akil))
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_01");	//(sobs) My beloved husband is dead! Oh Innos, why do you punish me so hard?
		Npc_ExchangeRoutine(self,"Start");
		b_startotherroutine(randolph,"Start");
		b_giveplayerxp(XP_AKIL_TOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_02");	//Yes, I'm fine, thank you.
	};
};


instance DIA_KATI_ESSEN(C_INFO)
{
	npc = bau_941_kati;
	nr = 12;
	condition = dia_kati_essen_condition;
	information = dia_kati_essen_info;
	permanent = FALSE;
	description = "Akil says you've got a meal for me.";
};


func int dia_kati_essen_condition()
{
	if((KATI_MAHLZEIT == TRUE) && (Npc_IsDead(akil) == FALSE))
	{
		return TRUE;
	};
};

func void dia_kati_essen_info()
{
	AI_Output(other,self,"DIA_Kati_ESSEN_15_00");	//Akil says you've got a meal for me.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_01");	//We've hit some hard times ever since the Barrier fell and the land is no longer safe.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_02");	//Here's a loaf of bread, a little meat and some water. That's all I can spare, I'm afraid.
	b_giveinvitems(self,other,itfo_bread,1);
	b_giveinvitems(self,other,itfo_water,1);
	b_giveinvitems(self,other,itfomutton,1);
};


instance DIA_KATI_BALTRAM(C_INFO)
{
	npc = bau_941_kati;
	nr = 4;
	condition = dia_kati_baltram_condition;
	information = dia_kati_baltram_info;
	permanent = FALSE;
	description = "Baltram sent me...";
};


func int dia_kati_baltram_condition()
{
	if(Npc_IsDead(akil) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && (LIEFERUNG_GEHOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kati_baltram_info()
{
	AI_Output(other,self,"DIA_Kati_Baltram_15_00");	//Baltram sent me. I'm supposed to pick up a shipment for him.
	AI_Output(self,other,"DIA_Kati_Baltram_16_01");	//Yes, of course. Here, I've packed it all up.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_KATI_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_941_kati;
	nr = 6;
	condition = dia_kati_bauernaufstand_condition;
	information = dia_kati_bauernaufstand_info;
	permanent = FALSE;
	description = "Why don't you defend yourselves against Onar's tyranny?";
};


func int dia_kati_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_hallo))
	{
		return TRUE;
	};
};

func void dia_kati_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Kati_BAUERNAUFSTAND_15_00");	//Why don't you defend yourselves against Onar's tyranny?
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_01");	//For us farmers near the city, it makes more sense to stay on the good side of the city militia than to rely on Onar's mercenaries.
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_02");	//On the other hand, there's Bengar and Sekob who would rather give up their farms than work for the king.
};


instance DIA_KATI_ANDEREHOEFE(C_INFO)
{
	npc = bau_941_kati;
	nr = 7;
	condition = dia_kati_anderehoefe_condition;
	information = dia_kati_anderehoefe_info;
	permanent = FALSE;
	description = "Where do I find the farms of Bengar and Sekob?";
};


func int dia_kati_anderehoefe_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_kati_anderehoefe_info()
{
	AI_Output(other,self,"DIA_Kati_ANDEREHOEFE_15_00");	//Where do I find the farms of Bengar and Sekob?
	AI_Output(self,other,"DIA_Kati_ANDEREHOEFE_16_01");	//They're not far from the farm where the landowner lives. Go east from here, and you'll find them.
};


instance DIA_KATI_HIERWEG(C_INFO)
{
	npc = bau_941_kati;
	nr = 9;
	condition = dia_kati_hierweg_condition;
	information = dia_kati_hierweg_info;
	permanent = FALSE;
	description = "Haven't you ever considered moving away from here?";
};


func int dia_kati_hierweg_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_kati_hierweg_info()
{
	AI_Output(other,self,"DIA_Kati_HIERWEG_15_00");	//Haven't you ever considered moving away from here?
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_01");	//It's not easy to get away from this part of the country. All the land is walled in by a high, insurmountable chain of mountains.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_02");	//The only two ways out of here are the pass to the Valley of Mines, and the harbor.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_03");	//Since we cannot afford passage on a ship, and the Valley of Mines is a place of no return, we're going to have to stay here.
};


instance DIA_KATI_PASS(C_INFO)
{
	npc = bau_941_kati;
	nr = 10;
	condition = dia_kati_pass_condition;
	information = dia_kati_pass_info;
	permanent = FALSE;
	description = "What do you know about the pass?";
};


func int dia_kati_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_hierweg))
	{
		return TRUE;
	};
};

func void dia_kati_pass_info()
{
	AI_Output(other,self,"DIA_Kati_PASS_15_00");	//What do you know about the pass?
	AI_Output(self,other,"DIA_Kati_PASS_16_01");	//I've never been there myself. But it must be somewhere near Bengar's farm on the high pastures.
};


instance DIA_KATI_PERMKAP1(C_INFO)
{
	npc = bau_941_kati;
	nr = 11;
	condition = dia_kati_permkap1_condition;
	information = dia_kati_permkap1_info;
	permanent = TRUE;
	description = "Look out for your husband.";
};


func int dia_kati_permkap1_condition()
{
	if(!c_npcisdown(akil) && Npc_KnowsInfo(other,dia_kati_hallo) && Npc_KnowsInfo(other,dia_kati_bauernaufstand) && Npc_KnowsInfo(other,dia_kati_anderehoefe) && Npc_KnowsInfo(other,dia_kati_hierweg) && Npc_KnowsInfo(other,dia_kati_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_kati_permkap1_info()
{
	AI_Output(other,self,"DIA_Kati_PERMKAP1_15_00");	//Look out for your husband.
	AI_Output(self,other,"DIA_Kati_PERMKAP1_16_01");	//I shall do my best.
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP3_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap3_exit_condition;
	information = dia_kati_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_kati_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_PERM(C_INFO)
{
	npc = bau_941_kati;
	nr = 3;
	condition = dia_kati_perm_condition;
	information = dia_kati_perm_info;
	permanent = TRUE;
	description = "Everything still fine with you?";
};


func int dia_kati_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_kati_hallo))
	{
		return TRUE;
	};
};

func void dia_kati_perm_info()
{
	AI_Output(other,self,"DIA_Kati_PERM_15_00");	//Everything still fine with you?
	AI_Output(self,other,"DIA_Kati_PERM_16_01");	//We can manage. I just wonder how much longer we're going to have to endure these devils in black.
	AI_Output(self,other,"DIA_Kati_PERM_16_02");	//I can't stand it any more. They sneak around the house, making those funny noises.
};


instance DIA_KATI_KAP4_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap4_exit_condition;
	information = dia_kati_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_kati_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP5_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap5_exit_condition;
	information = dia_kati_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_kati_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP6_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap6_exit_condition;
	information = dia_kati_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_kati_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_PICKPOCKET(C_INFO)
{
	npc = bau_941_kati;
	nr = 900;
	condition = dia_kati_pickpocket_condition;
	information = dia_kati_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_kati_pickpocket_condition()
{
	return c_beklauen(13,15);
};

func void dia_kati_pickpocket_info()
{
	Info_ClearChoices(dia_kati_pickpocket);
	Info_AddChoice(dia_kati_pickpocket,DIALOG_BACK,dia_kati_pickpocket_back);
	Info_AddChoice(dia_kati_pickpocket,DIALOG_PICKPOCKET,dia_kati_pickpocket_doit);
};

func void dia_kati_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kati_pickpocket);
};

func void dia_kati_pickpocket_back()
{
	Info_ClearChoices(dia_kati_pickpocket);
};

