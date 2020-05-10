
instance DIA_SENGRATH_EXIT(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 999;
	condition = dia_sengrath_exit_condition;
	information = dia_sengrath_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sengrath_exit_condition()
{
	return TRUE;
};

func void dia_sengrath_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENGRATH_HELLO(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_hello_condition;
	information = dia_sengrath_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sengrath_hello_condition()
{
	return TRUE;
};

func void dia_sengrath_hello_info()
{
	AI_Output(self,other,"DIA_Sengrath_Hello_03_00");	//I knew it! I knew that someone would succeed!
	AI_Output(self,other,"DIA_Sengrath_Hello_03_01");	//Have you come over the pass? Our messenger managed to get through, then?
	AI_Output(other,self,"DIA_Sengrath_Hello_15_02");	//No, your messenger didn't make it across the pass. I have come by order of Lord Hagen.
	AI_Output(self,other,"DIA_Sengrath_Hello_03_03");	//(growls) Accursed orcs...
	AI_Output(self,other,"DIA_Sengrath_Hello_03_04");	//Well, Commander Garond will certainly want to speak to you. You'll find him in the large building guarded by two knights.
};


instance DIA_SENGRATH_EQUIPMENT(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_equipment_condition;
	information = dia_sengrath_equipment_info;
	permanent = FALSE;
	description = "Where can I find gear here?";
};


func int dia_sengrath_equipment_condition()
{
	return TRUE;
};

func void dia_sengrath_equipment_info()
{
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_00");	//Where can I find gear here?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_01");	//Tandor hands out the weapons. Engor the steward is responsible for everything else.
	AI_Output(other,self,"DIA_Sengrath_Equipment_15_02");	//What about magic supplies?
	AI_Output(self,other,"DIA_Sengrath_Equipment_03_03");	//We are equipped with spell scrolls. If you want some of them, let me know.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Sengrath sells spell scrolls in the castle.");
};


instance DIA_SENGRATH_PERM(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 2;
	condition = dia_sengrath_perm_condition;
	information = dia_sengrath_perm_info;
	permanent = FALSE;
	description = "Who can teach me something here?";
};


func int dia_sengrath_perm_condition()
{
	return TRUE;
};

func void dia_sengrath_perm_info()
{
	AI_Output(other,self,"DIA_Sengrath_Perm_15_00");	//Who can teach me something here?
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_01");	//Talk to Milten - he's the only magician here.
	}
	else
	{
		AI_Output(self,other,"DIA_Sengrath_Perm_03_02");	//Ask Keroloth. He trains the boys in sword fighting. Maybe he'll teach you something, too.
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"Keroloth trains swordfighters at the castle.");
	};
};


instance DIA_SENGRATH_SCROLLS(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 9;
	condition = dia_sengrath_scrolls_condition;
	information = dia_sengrath_scrolls_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Show me your spell scrolls.";
};


func int dia_sengrath_scrolls_condition()
{
	if(Npc_KnowsInfo(other,dia_sengrath_equipment))
	{
		return TRUE;
	};
};

func void dia_sengrath_scrolls_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sengrath_Scrolls_15_00");	//Show me your spell scrolls.
};


instance DIA_SENGRATH_PICKPOCKET(C_INFO)
{
	npc = pal_267_sengrath;
	nr = 900;
	condition = dia_sengrath_pickpocket_condition;
	information = dia_sengrath_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_sengrath_pickpocket_condition()
{
	return c_beklauen(32,35);
};

func void dia_sengrath_pickpocket_info()
{
	Info_ClearChoices(dia_sengrath_pickpocket);
	Info_AddChoice(dia_sengrath_pickpocket,DIALOG_BACK,dia_sengrath_pickpocket_back);
	Info_AddChoice(dia_sengrath_pickpocket,DIALOG_PICKPOCKET,dia_sengrath_pickpocket_doit);
};

func void dia_sengrath_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sengrath_pickpocket);
};

func void dia_sengrath_pickpocket_back()
{
	Info_ClearChoices(dia_sengrath_pickpocket);
};

