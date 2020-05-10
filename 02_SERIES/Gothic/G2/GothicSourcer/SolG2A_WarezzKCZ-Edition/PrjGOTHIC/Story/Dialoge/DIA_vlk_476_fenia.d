
instance DIA_FENIA_EXIT(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 999;
	condition = dia_fenia_exit_condition;
	information = dia_fenia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fenia_exit_condition()
{
	return TRUE;
};

func void dia_fenia_exit_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_00");	//Have a nice day, Mr. Paladin.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fenia_EXIT_17_01");	//Have a safe trip, honorable magician.
	};
	AI_StopProcessInfos(self);
};


instance DIA_FENIA_PICKPOCKET(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 900;
	condition = dia_fenia_pickpocket_condition;
	information = dia_fenia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_fenia_pickpocket_condition()
{
	return c_beklauen(50,75);
};

func void dia_fenia_pickpocket_info()
{
	Info_ClearChoices(dia_fenia_pickpocket);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_BACK,dia_fenia_pickpocket_back);
	Info_AddChoice(dia_fenia_pickpocket,DIALOG_PICKPOCKET,dia_fenia_pickpocket_doit);
};

func void dia_fenia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fenia_pickpocket);
};

func void dia_fenia_pickpocket_back()
{
	Info_ClearChoices(dia_fenia_pickpocket);
};


instance DIA_FENIA_HALLO(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 3;
	condition = dia_fenia_hallo_condition;
	information = dia_fenia_hallo_info;
	important = TRUE;
};


func int dia_fenia_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_fenia_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Fenia_Hallo_17_00");	//You look a little worse for wear. Haven't slept in a long time, have you?
		AI_Output(other,self,"DIA_Fenia_Hallo_15_01");	//Too long, I should say.
	};
	AI_Output(self,other,"DIA_Fenia_Hallo_17_02");	//Come on, step closer. With me, you'll find what you're looking for!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Fenia sells food on the way to the harbor.");
};


instance DIA_FENIA_HANDELN(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_handeln_condition;
	information = dia_fenia_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_fenia_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_handeln_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Fenia_HANDELN_15_00");	//Show me your wares.
};


instance DIA_FENIA_INFOS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 10;
	condition = dia_fenia_infos_condition;
	information = dia_fenia_infos_info;
	permanent = FALSE;
	description = "You said that you've got what I need. Does that include information?";
};


func int dia_fenia_infos_condition()
{
	if(Npc_KnowsInfo(hero,dia_fenia_hallo))
	{
		return TRUE;
	};
};

func void dia_fenia_infos_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_15_00");	//You said that you've got what I need. Does that include information?
	AI_Output(self,other,"DIA_Fenia_Infos_17_01");	//But of course. What is it you want to know?
};


instance DIA_FENIA_MORETRADERS(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 11;
	condition = dia_fenia_moretraders_condition;
	information = dia_fenia_moretraders_info;
	permanent = FALSE;
	description = "Are there any other traders here at the harbor?";
};


func int dia_fenia_moretraders_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_moretraders_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_haendler_15_00");	//Are there any other traders here at the harbor?
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_01");	//If you keep to the left at the quay, you'll find Halvor, my husband. He sells fish.
	AI_Output(self,other,"DIA_Fenia_Infos_haendler_17_02");	//On the other side, there's Brahim, the cartographer.
};


instance DIA_FENIA_OV(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 13;
	condition = dia_fenia_ov_condition;
	information = dia_fenia_ov_info;
	permanent = FALSE;
	description = "Do you know anyone from the upper quarter?";
};


func int dia_fenia_ov_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_fenia_ov_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_oberesViertel_15_00");	//Do you know anyone from the upper quarter?
	AI_Output(self,other,"DIA_Fenia_Infos_oberesViertel_17_01");	//(laughs) If I knew anyone up there I wouldn't be standing here, my boy.
};


instance DIA_FENIA_INTERESTING(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 14;
	condition = dia_fenia_interesting_condition;
	information = dia_fenia_interesting_info;
	permanent = FALSE;
	description = "What interesting things are there to see around the harbor?";
};


func int dia_fenia_interesting_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_interesting_info()
{
	AI_Output(other,self,"DIA_Fenia_Infos_interessantes_15_00");	//What interesting things are there to see about the harbor?
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_01");	//Well. If you're looking for some action, go on down to Kardif's pub at the quay. There's always something brewing there.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_02");	//You can hardly miss it. The guy standing by the entrance there will certainly draw your attention to it.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_03");	//Besides that, there's the large ship of the paladins. The King's stately war galley. That one's really worth seeing.
	AI_Output(self,other,"DIA_Fenia_Infos_interessantes_17_04");	//You'll find it if you keep left at the quay and then pass under the high rock face.
};


instance DIA_FENIA_AUFREGEND(C_INFO)
{
	npc = vlk_476_fenia;
	nr = 15;
	condition = dia_fenia_aufregend_condition;
	information = dia_fenia_aufregend_info;
	permanent = FALSE;
	description = "Has anything exciting happened here lately?";
};


func int dia_fenia_aufregend_condition()
{
	if(Npc_KnowsInfo(other,dia_fenia_infos))
	{
		return TRUE;
	};
};

func void dia_fenia_aufregend_info()
{
	AI_Output(other,self,"DIA_Fenia_Add_15_00");	//Has anything exciting happened lately?
	AI_Output(self,other,"DIA_Fenia_Add_17_01");	//You could say so. It wasn't that long ago.
	AI_Output(self,other,"DIA_Fenia_Add_17_02");	//A thief ran by here. He must have stolen a bow in the lower part of the city.
	AI_Output(self,other,"DIA_Fenia_Add_17_03");	//Of course, the militia came way too late, like always.
	AI_Output(self,other,"DIA_Fenia_Add_17_04");	//He got away from them - just jumped into the harbor, and he was gone.
};

