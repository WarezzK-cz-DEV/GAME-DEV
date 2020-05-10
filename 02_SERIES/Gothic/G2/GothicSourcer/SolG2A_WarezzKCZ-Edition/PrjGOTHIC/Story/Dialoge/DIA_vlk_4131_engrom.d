
instance DIA_ENGROM_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_exit_condition;
	information = dia_engrom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_engrom_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_HALLO(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 5;
	condition = dia_engrom_hallo_condition;
	information = dia_engrom_hallo_info;
	description = "What's up?";
};


func int dia_engrom_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_engrom_hallo_info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Crappy!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Mmh!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//What else should I say. Nothing but up and down this damned river for days.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Orcs lurking on the left, bandits hanging around on the right, and every day I eat lurker meat. I can't take it any more, you see.
};


instance DIA_ENGROM_WHATABOUTLEAVING(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_whataboutleaving_condition;
	information = dia_engrom_whataboutleaving_info;
	description = "Ever considered getting out of here?";
};


func int dia_engrom_whataboutleaving_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_whataboutleaving_info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//Ever considered getting out of here?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Yeah, sure. No problem at all.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//First I'll carve my way through the hordes of orcs, say hello to all the other monsters that are all over the place, and then I just stroll right across the pass!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//That would be quite a trick!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//I got in here, too.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Are you trying to tell me you just came across the pass?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//More or less, yes!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Then you got lucky. As long as things are so messed up around here, I'm not going to budge.
};


instance DIA_ENGROM_JAGD(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_jagd_condition;
	information = dia_engrom_jagd_info;
	permanent = TRUE;
	description = "How's the hunting?";
};


func int dia_engrom_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_jagd_info()
{
	b_wasmachtjagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Hunting is my only consolation. But I'd like to see a target once in a while other than these disgusting lurkers.
};


instance DIA_ENGROM_KAP3_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap3_exit_condition;
	information = dia_engrom_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_engrom_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP4_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap4_exit_condition;
	information = dia_engrom_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_engrom_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_B_NPCOBSESSEDBYDMT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 32;
	condition = dia_engrom_b_npcobsessedbydmt_condition;
	information = dia_engrom_b_npcobsessedbydmt_info;
	description = "Everything all right?";
};


func int dia_engrom_b_npcobsessedbydmt_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_b_npcobsessedbydmt_info()
{
	MIS_TABIN_LOOKFORENGROM = LOG_SUCCESS;
	b_npcobsessedbydmt(self);
};


instance DIA_ENGROM_BESSEN(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 55;
	condition = dia_engrom_bessen_condition;
	information = dia_engrom_bessen_info;
	permanent = TRUE;
	description = "Evil has taken possession of you.";
};


func int dia_engrom_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_bessen_info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Evil has taken possession of you.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Let me help you.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(screams) Don't touch me!
	b_npcclearobsessionbydmt(self);
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	}
	else
	{
		Npc_ExchangeRoutine(self,"FleePass");
		Wld_InsertNpc(orcwarrior_scout,"START");
	};
};


instance DIA_ENGROM_KAP5_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap5_exit_condition;
	information = dia_engrom_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_engrom_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP6_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap6_exit_condition;
	information = dia_engrom_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_engrom_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_PICKPOCKET(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 900;
	condition = dia_engrom_pickpocket_condition;
	information = dia_engrom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_engrom_pickpocket_condition()
{
	return c_beklauen(10,5);
};

func void dia_engrom_pickpocket_info()
{
	Info_ClearChoices(dia_engrom_pickpocket);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_BACK,dia_engrom_pickpocket_back);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_PICKPOCKET,dia_engrom_pickpocket_doit);
};

func void dia_engrom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_engrom_pickpocket);
};

func void dia_engrom_pickpocket_back()
{
	Info_ClearChoices(dia_engrom_pickpocket);
};

