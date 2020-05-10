
instance DIA_JERGAN_EXIT(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 999;
	condition = dia_jergan_exit_condition;
	information = dia_jergan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jergan_exit_condition()
{
	return TRUE;
};

func void dia_jergan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_HALLO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 1;
	condition = dia_jergan_hallo_condition;
	information = dia_jergan_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_hallo_condition()
{
	return TRUE;
};

func void dia_jergan_hallo_info()
{
	AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//If you want to live, go back to wherever you came from.
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//What are you standing around here for?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//I come from the castle. They've sent me to look for those missing, and to check out the area.
};


instance DIA_JERGAN_VERMISSTE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_vermisste_condition;
	information = dia_jergan_vermisste_info;
	permanent = FALSE;
	description = "Those missing?";
};


func int dia_jergan_vermisste_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};

func void dia_jergan_vermisste_info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Those missing?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Some fled when the dragons attacked. Most of them didn't make it - no surprise there!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//But if there are any survivors left, I'll bring them back.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "Can you help me get into the castle?";
};


func int dia_jergan_burg_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_burg_info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Can you help me get into the castle?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Sure, but you have to do me a favor.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//If you can make it to the castle, talk to the paladin Oric. Tell him that his brother bought it up there at the pass.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"When I'm in the castle, I'm to tell Oric that his brother fell up at the pass.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "What do I need to know about this area?";
};


func int dia_jergan_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};


var int jergan_tell;

func void dia_jergan_gegend_info()
{
	AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//What do I need to know about this area?
	AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//The greenhides have laid siege to the castle for weeks now - and those dragons are hiding out somewhere, too.
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//The entire Valley of Mines is teeming with orcs - no matter where you're headed, this won't be a picnic.
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "How can I get into the castle?";
};


func int dia_jergan_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_hilfe_info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//How can I get into the castle?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//First of all, you can forget the direct path. But if you walk around the castle, you might have a chance from the back.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//You should stay away from the paths and use the river. It will be best if you swim downstream for a stretch. It should be easier from there.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//The orcs have set up a ram behind the castle. You can get in that way - creep up on the orcs as closely as you can, and then run for it.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//You might just make it if you're fast enough.
};


instance DIA_JERGAN_MINE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_mine_condition;
	information = dia_jergan_mine_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_jergan_mine_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_mine_info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//I'm a scout. I roam the country. But all those snappers haven't made it easy for me.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//It's a good time to land a few trophies - provided you know what you're doing.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "Can you teach me how to do that?";
};


func int dia_jergan_claw_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_claw_info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Can you teach me how to do that?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//I can show you how to pull the claws off those things once they're dead.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("(Learn to remove claws)",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS));
};


func int dia_jergan_teach_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_teach_info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Show me how to pull claws.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//The important thing is to remove the claws with a jerk. Don't be too hesitant, and don't go poking with a blade.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//You don't only pull the claws from snappers that way, but also from lizards and shadowbeasts.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "Do you know where Diego got to? ";
};


func int dia_jergan_diego_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,dia_diegoow_hallo) == FALSE) && Npc_KnowsInfo(other,dia_parcival_diego))
	{
		return TRUE;
	};
};

func void dia_jergan_diego_info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Do you know where Diego got to?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Diego? He was one of Silvestro's scrapers. But he's made himself scarce.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//I saw him with two knights and a box, not so far from here.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//You can see the old watchtower from here, right? Go over there, and then towards the castle.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//A path leads through the rocks to the right. That's where they went.
};


instance DIA_JERGAN_LEADER(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_leader_condition;
	information = dia_jergan_leader_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_leader_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(newmine_leadsnapper) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_jergan_leader_info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//So you killed the leader of the pack. And - did you get the claws off that beast?
	if((Npc_HasItems(other,itat_clawleader) >= 1) || (LUTERO_KRALLEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Yes.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//They're certainly worth a lot. There are some fellows who collect this stuff.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//If you find the right buyer, you'll get a heap of gold for that.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//No.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//You should do that. I'm sure they're worth a fortune.
	};
};


instance DIA_JERGAN_PICKPOCKET(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 900;
	condition = dia_jergan_pickpocket_condition;
	information = dia_jergan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_jergan_pickpocket_condition()
{
	return c_beklauen(84,110);
};

func void dia_jergan_pickpocket_info()
{
	Info_ClearChoices(dia_jergan_pickpocket);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_BACK,dia_jergan_pickpocket_back);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_PICKPOCKET,dia_jergan_pickpocket_doit);
};

func void dia_jergan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jergan_pickpocket);
};

func void dia_jergan_pickpocket_back()
{
	Info_ClearChoices(dia_jergan_pickpocket);
};

