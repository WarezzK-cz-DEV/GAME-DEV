
instance DIA_SERGIO_EXIT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 999;
	condition = dia_sergio_exit_condition;
	information = dia_sergio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sergio_exit_condition()
{
	return TRUE;
};

func void dia_sergio_exit_info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//May Innos illuminate your path.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_WELCOME(C_INFO)
{
	npc = pal_299_sergio;
	nr = 5;
	condition = dia_sergio_welcome_condition;
	information = dia_sergio_welcome_info;
	important = TRUE;
};


func int dia_sergio_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,dia_sergio_isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void dia_sergio_welcome_info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Innos be with you, what can I do for you?
};


instance DIA_SERGIO_ISGAROTH(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_isgaroth_condition;
	information = dia_sergio_isgaroth_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_isgaroth_condition()
{
	if(Npc_KnowsInfo(hero,pc_prayshrine_paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_sergio_isgaroth_info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//You have prayed for my brethren. I want to thank you for that. Tell me what I can do for you.
	Info_ClearChoices(dia_sergio_isgaroth);
	Info_AddChoice(dia_sergio_isgaroth,"What about a little donation?",dia_sergio_isgaroth_spende);
	Info_AddChoice(dia_sergio_isgaroth,"Let me share your fighting experience.",dia_sergio_isgaroth_xp);
};

func void dia_sergio_isgaroth_spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//What about a little donation?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//May this gold be of use to you.
	b_giveinvitems(self,other,itmi_gold,100);
	Info_ClearChoices(dia_sergio_isgaroth);
};

func void dia_sergio_isgaroth_xp()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Let me share your fighting experience.
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//When you fight, always make sure that no one can attack you from behind.
	b_raisefighttalent(other,NPC_TALENT_2H,2);
	PrintScreen(PRINT_LEARN2H,-1,-1,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_sergio_isgaroth);
};


instance DIA_SERGIO_AUFGABE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_aufgabe_condition;
	information = dia_sergio_aufgabe_info;
	description = "I need access to the library.";
};


func int dia_sergio_aufgabe_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_sergio_isgaroth))
	{
		return TRUE;
	};
};

func void dia_sergio_aufgabe_info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//I need access to the library.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//Well, I cannot grant you access. For that you must first fulfill your tasks.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//But I can help you. Go to Master Isgaroth and talk to him. I have heard that he needs help and would go to him - but I pass this task on to you.
	SERGIO_SENDS = TRUE;
	Wld_InsertNpc(blackwolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(TOPIC_ISGAROTHWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ISGAROTHWOLF,LOG_RUNNING);
	b_logentry(TOPIC_ISGAROTHWOLF,"Master Isgaroth needs help at the shrine. I should look him up.");
};


instance DIA_SERGIO_WHAT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_what_condition;
	information = dia_sergio_what_info;
	description = "What are you doing here?";
};


func int dia_sergio_what_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_sergio_what_info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//I am praying to Innos that he strengthen my arm and my will.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//Thus, I am armed against all dangers and shall destroy all his enemies in order to do him honor.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//What enemies?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//All those who oppose the will of Innos. Whether they be human born or summoned creature.
};


instance DIA_SERGIO_BABO(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_babo_condition;
	information = dia_sergio_babo_info;
	description = "Can you go through a few exercises with Babo?";
};


func int dia_sergio_babo_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_anliegen))
	{
		return TRUE;
	};
};

func void dia_sergio_babo_info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Can you go through a few exercises with Babo?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//Why doesn't he ask me himself?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//I think he's shy.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//I see. Good, if it means so much to him, I shall train with him every morning for two hours. We begin at 5 o'clock. Tell him that.
	Npc_ExchangeRoutine(self,"TRAIN");
	b_startotherroutine(babo,"TRAIN");
	b_logentry(TOPIC_BABOTRAIN,"Sergio has agreed to train with Babo for two hours every morning from now on.");
};


instance DIA_SERGIO_WHY(C_INFO)
{
	npc = pal_299_sergio;
	nr = 4;
	condition = dia_sergio_why_condition;
	information = dia_sergio_why_info;
	description = "Why aren't you with the other paladins?";
};


func int dia_sergio_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_welcome) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_why_info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Why aren't you with the other paladins?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//It may seem unusual that I am here, however we paladins also serve the magicians, for they preach the will of Innos.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//We paladins are warriors in the name of Innos. His will is our law. At the moment, I am waiting for new orders from the magicians.
};


instance DIA_SERGIO_ORDERS(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_orders_condition;
	information = dia_sergio_orders_info;
	permanent = TRUE;
	description = "And do you already have new orders?";
};


func int dia_sergio_orders_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_why) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_orders_info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//And do you already have new orders?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//Until then I still have time to find strength in prayer.
};


instance DIA_SERGIO_START(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_start_condition;
	information = dia_sergio_start_info;
	permanent = FALSE;
	description = "You are to escort me to the pass.";
};


func int dia_sergio_start_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (SERGIO_FOLLOW == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_start_info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//You are to escort me to the pass.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Good, then I shall do that. I know the way, so follow me.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_SERGIO_GUIDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_guide_condition;
	information = dia_sergio_guide_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_sergio_guide_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_guide_info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//I shall take you to the pass. But the dangerous part of the journey only begins there.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//But let us waste no time. We need to be on our way.
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_ENDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_ende_condition;
	information = dia_sergio_ende_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_ende_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_ende_info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//We are there. Whatever awaits you in the Valley of the Mines, I hope that you find your way back.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Don't fear - I shall return.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Go with Innos. May he always protect you.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_SERGIO_PERM(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_perm_condition;
	information = dia_sergio_perm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_perm_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//For Innos, Brother. If you have come to learn something about the Consecration of the Sword, then ask Marduk.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//I have heard of you. You are the fellow from the farms who was in the Valley of Mines. My respects.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_PICKPOCKET(C_INFO)
{
	npc = pal_299_sergio;
	nr = 900;
	condition = dia_sergio_pickpocket_condition;
	information = dia_sergio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sergio_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_sergio_pickpocket_info()
{
	Info_ClearChoices(dia_sergio_pickpocket);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_BACK,dia_sergio_pickpocket_back);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_PICKPOCKET,dia_sergio_pickpocket_doit);
};

func void dia_sergio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sergio_pickpocket);
};

func void dia_sergio_pickpocket_back()
{
	Info_ClearChoices(dia_sergio_pickpocket);
};

