
instance DIA_GRIMES_EXIT(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 999;
	condition = dia_grimes_exit_condition;
	information = dia_grimes_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int grimes_first;

func int dia_grimes_exit_condition()
{
	return TRUE;
};

func void dia_grimes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMES_HALLO(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_hallo_condition;
	information = dia_grimes_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimes_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_grimes_hallo_info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//You? Who would have thought we'd see each other again.
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//So it looks like we both know how to stay alive, and as you can see I've stuck with prospecting.
	if(GRIMES_FIRST == FALSE)
	{
		Wld_InsertNpc(snapper,"OW_PATH_148_A");
		Wld_InsertNpc(snapper,"OW_PATH_146");
		Wld_InsertNpc(snapper,"OW_PATH_147");
		Wld_InsertNpc(snapper,"OW_PATH_148");
		Wld_InsertNpc(snapper,"OW_PATH_264");
		GRIMES_FIRST = TRUE;
	};
};


instance DIA_GRIMES_ERZ(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_erz_condition;
	information = dia_grimes_erz_info;
	permanent = FALSE;
	description = "How much ore have you already mined?";
};


func int dia_grimes_erz_condition()
{
	if((KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_grimes_erz_info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//How much ore have you already mined?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//A few chests. But there's nothing of that left here.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Paladin Marcos decided to take the ore to the castle, because we were constantly being attacked by orcs.
};


instance DIA_GRIMES_WEG(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 3;
	condition = dia_grimes_weg_condition;
	information = dia_grimes_weg_info;
	permanent = FALSE;
	description = "Do you know which way Marcos went?";
};


func int dia_grimes_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_erz) && (Npc_KnowsInfo(other,dia_marcos_garond) == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimes_weg_info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Do you know which way Marcos went?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//He didn't take the direct route - instead he wanted to cross the river where it was frozen.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//He wanted to cut around and approach the castle from the west.
};


instance DIA_GRIMES_GRIMES(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_grimes_condition;
	information = dia_grimes_grimes_info;
	permanent = FALSE;
	description = "Don't you want to leave the valley?";
};


func int dia_grimes_grimes_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_grimes_grimes_info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Don't you want to leave the valley?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//No, I'll keep on mining ore.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//I'm not going to let a few orcs stop me - I've been through a lot more than that.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Back then when we were digging in the old mine, and suddenly the water broke in...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//But those are old stories.
};


instance DIA_GRIMES_PERM(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_perm_condition;
	information = dia_grimes_perm_info;
	permanent = TRUE;
	description = "How's your work?";
};


func int dia_grimes_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_grimes_perm_info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//How's your work?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//This rock is damn stubborn - almost like it was trying to prevent us from taking the ore.
};


instance DIA_GRIMES_TEACH_ORE(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 3;
	condition = dia_grimes_teach_ore_condition;
	information = dia_grimes_teach_ore_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_grimes_teach_ore_condition()
{
	if((KAPITEL >= 2) && ((PLAYER_TALENT_OREMASTER[0] == FALSE) || (PLAYER_TALENT_OREMASTER[1] == FALSE) || (PLAYER_TALENT_OREMASTER[2] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_grimes_teach_ore_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	if((PLAYER_TALENT_OREMASTER[0] == FALSE) || (PLAYER_TALENT_OREMASTER[1] == FALSE) || (PLAYER_TALENT_OREMASTER[2] == FALSE))
	{
		Info_ClearChoices(dia_grimes_teach_ore);
		Info_AddChoice(dia_grimes_teach_ore,DIALOG_BACK,dia_grimes_teach_ore_back);
	};
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		Info_AddChoice(dia_grimes_teach_ore,b_buildlearnstring("Learn ore extraction - Miner",b_getlearncosttalent(other,NPC_TALENT_OREMASTER,ORMASTERY_1)),dia_grimes_teach_ore_ormastery_1);
	}
	else if((PLAYER_TALENT_OREMASTER[1] == FALSE) && (PLAYER_TALENT_OREMASTER[0] == TRUE))
	{
		Info_AddChoice(dia_grimes_teach_ore,b_buildlearnstring("Learn ore extraction - Expert",b_getlearncosttalent(other,NPC_TALENT_OREMASTER,ORMASTERY_2)),dia_grimes_teach_ore_ormastery_2);
	}
	else if((PLAYER_TALENT_OREMASTER[2] == FALSE) && (PLAYER_TALENT_OREMASTER[0] == TRUE) && (PLAYER_TALENT_OREMASTER[1] == TRUE))
	{
		Info_AddChoice(dia_grimes_teach_ore,b_buildlearnstring("Learn ore extraction - Master",b_getlearncosttalent(other,NPC_TALENT_OREMASTER,ORMASTERY_3)),dia_grimes_teach_ore_ormastery_3);
	};
};

func void dia_grimes_teach_ore_back()
{
	Info_ClearChoices(dia_grimes_teach_ore);
};

func void dia_grimes_teach_ore_ormastery_1()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_1);
	Info_ClearChoices(dia_grimes_teach_ore);
};

func void dia_grimes_teach_ore_ormastery_2()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_2);
	Info_ClearChoices(dia_grimes_teach_ore);
};

func void dia_grimes_teach_ore_ormastery_3()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_3);
	Info_ClearChoices(dia_grimes_teach_ore);
};


instance DIA_GRIMES_PICKPOCKET(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 900;
	condition = dia_grimes_pickpocket_condition;
	information = dia_grimes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_grimes_pickpocket_condition()
{
	return c_beklauen(43,21);
};

func void dia_grimes_pickpocket_info()
{
	Info_ClearChoices(dia_grimes_pickpocket);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_BACK,dia_grimes_pickpocket_back);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_PICKPOCKET,dia_grimes_pickpocket_doit);
};

func void dia_grimes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimes_pickpocket);
};

func void dia_grimes_pickpocket_back()
{
	Info_ClearChoices(dia_grimes_pickpocket);
};

