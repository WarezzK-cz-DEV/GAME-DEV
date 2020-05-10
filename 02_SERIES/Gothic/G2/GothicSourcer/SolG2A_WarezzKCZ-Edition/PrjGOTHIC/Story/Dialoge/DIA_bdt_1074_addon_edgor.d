
var int edgor_exiteinmal;

instance DIA_ADDON_EDGOR_EXIT(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 999;
	condition = dia_addon_edgor_exit_condition;
	information = dia_addon_edgor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_edgor_exit_condition()
{
	return TRUE;
};

func void dia_addon_edgor_exit_info()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_mis2) && (EDGOR_EXITEINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Edgor_EXIT_06_00");	//It was nice knowing you...
		EDGOR_EXITEINMAL = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EDGOR_PICKPOCKET(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 900;
	condition = dia_addon_edgor_pickpocket_condition;
	information = dia_addon_edgor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_edgor_pickpocket_condition()
{
	return c_beklauen(10,7);
};

func void dia_addon_edgor_pickpocket_info()
{
	Info_ClearChoices(dia_addon_edgor_pickpocket);
	Info_AddChoice(dia_addon_edgor_pickpocket,DIALOG_BACK,dia_addon_edgor_pickpocket_back);
	Info_AddChoice(dia_addon_edgor_pickpocket,DIALOG_PICKPOCKET,dia_addon_edgor_pickpocket_doit);
};

func void dia_addon_edgor_pickpocket_doit()
{
	b_beklauen();
	b_say(self,self,"$AWAKE");
	Info_ClearChoices(dia_addon_edgor_pickpocket);
};

func void dia_addon_edgor_pickpocket_back()
{
	Info_ClearChoices(dia_addon_edgor_pickpocket);
};


instance DIA_ADDON_EDGOR_HI(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 2;
	condition = dia_addon_edgor_hi_condition;
	information = dia_addon_edgor_hi_info;
	permanent = FALSE;
	description = "How's it going?";
};


func int dia_addon_edgor_hi_condition()
{
	return TRUE;
};

func void dia_addon_edgor_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Hi_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_01");	//You want to know how it's going? I'll tell you how it's going.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_02");	//First some pirates brought me here on a stormy night. Man, I barfed all over that nutshell.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_03");	//Then Raven locked up the mine because some idiots are too greedy for gold.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_04");	//And then Franco became the leader of the hunters, killing anybody who's against him.
	AI_Output(self,other,"DIA_Addon_Edgor_Hi_06_05");	//I'd say it's going pretty badly.
	if(SC_KNOWSRAVENSGOLDMINE == FALSE)
	{
		b_logentry(TOPIC_ADDON_RAVENKDW,LOGTEXT_ADDON_RAVENSGOLDMINE);
		Log_AddEntry(TOPIC_ADDON_SKLAVEN,LOGTEXT_ADDON_RAVENSGOLDMINE);
		b_logentry(TOPIC_ADDON_SCOUTBANDITS,LOG_TEXT_ADDON_SCOUTBANDITS);
	};
	SC_KNOWSRAVENSGOLDMINE = TRUE;
};


instance DIA_ADDON_EDGOR_FRANCO(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 2;
	condition = dia_addon_edgor_franco_condition;
	information = dia_addon_edgor_franco_info;
	permanent = FALSE;
	description = "How did Franco get to be leader?";
};


func int dia_addon_edgor_franco_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_franco_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Franco_15_00");	//How did Franco get to be leader?
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_01");	//Quite simply. He killed Fletcher. He was the leader of the hunters before.
	AI_Output(self,other,"DIA_Addon_Edgor_Franco_06_02");	//Fletcher was okay. Franco's just jerking us all around.
};


instance DIA_ADDON_EDGOR_MIS2(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_mis2_condition;
	information = dia_addon_edgor_mis2_info;
	permanent = FALSE;
	description = "Franco sent me about this stone tablet...";
};


func int dia_addon_edgor_mis2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_mis2_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_MIS2_15_00");	//Franco sent me here about that stone tablet. Have you found it?
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_01");	//Man, I haven't even looked for it. All I know is it's supposed to be in this old building deep in the swamp.
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_02");	//And my inner voice tells me, 'Edgor, stay far away from old buildings deep in the swamp.'
	AI_Output(self,other,"DIA_Addon_Edgor_MIS2_06_03");	//I certainly won't risk my ass for that bum Franco!
	b_logentry(TOPIC_ADDON_STONEPLATE,"Edgor will never set out to look for the stone tablet. He says it is somewhere in an old building in the swamp.");
};


instance DIA_ADDON_EDGOR_WEG(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_weg_condition;
	information = dia_addon_edgor_weg_info;
	permanent = FALSE;
	description = "Where exactly is this old building?";
};


func int dia_addon_edgor_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_mis2))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_weg_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Weg_15_00");	//Where exactly is this old building?
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_01");	//Just go left past the big rock here. After a while you'll come to another big rock.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_02");	//You have to go left or right past that one - I don't know any more, it was too long ago.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_03");	//But the ruins are supposed to be on some sort of rise. All but hidden among plants.
	AI_Output(self,other,"DIA_Addon_Edgor_Weg_06_04");	//Maybe you'll get lucky and you won't find it...
};


instance DIA_ADDON_EDGOR_FOUND(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 4;
	condition = dia_addon_edgor_found_condition;
	information = dia_addon_edgor_found_info;
	permanent = FALSE;
	description = "I found the stone tablet!";
};


func int dia_addon_edgor_found_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_04) >= 1) && !Npc_IsDead(franco) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_found_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Found_15_00");	//I found the stone tablet!
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_01");	//(bored) Really? You must be a brave guy.
	AI_Output(self,other,"DIA_Addon_Edgor_Found_06_02");	//(bored) Then you've certainly earned your way into the camp. (yawns)
};


instance DIA_ADDON_EDGOR_TEACH(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_teach_condition;
	information = dia_addon_edgor_teach_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_addon_edgor_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_edgor_hi))
	{
		return TRUE;
	};
};

func void dia_addon_edgor_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_Teach_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_01");	//I know a lot about bloodflies. I hate those miserable beasts even more than I hate Franco!
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_02");	//But I know how to tear the stingers and wings from their dead bodies. (crazily) Yeah, tear them out...
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_03");	//Besides that, I know how to remove the secretion from the stinger.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_04");	//If you want, I can teach you all that junk.
	AI_Output(self,other,"DIA_Addon_Edgor_Teach_06_05");	//Of course, nothing is for free out here...
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Edgor knows a lot about bloodflies and their trophies.");
	EDGOR_TEACH = TRUE;
};

func void b_edgor_notenoughgold()
{
	AI_Output(self,other,"DIA_Addon_Edgor_NotEnoughGold_06_00");	//Get me the gold. I only want coins, not nuggets.
};


instance DIA_ADDON_EDGOR_TRAINSTART(C_INFO)
{
	npc = bdt_1074_addon_edgor;
	nr = 9;
	condition = dia_addon_edgor_start_condition;
	information = dia_addon_edgor_start_info;
	permanent = TRUE;
	description = "About the bloodflies...";
};


func int dia_addon_edgor_start_condition()
{
	if(EDGOR_TEACH == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_edgor_start_info()
{
	AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_SEKRET_15_00");	//About the bloodflies...
	AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_SEKRET_06_01");	//What do you want to know?
	Info_ClearChoices(dia_addon_edgor_trainstart);
	Info_AddChoice(dia_addon_edgor_trainstart,DIALOG_BACK,dia_addon_edgor_trainstart_back);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Extract bloodfly stingers (Cost: 1 LP, 100 gold)",dia_addon_edgor_trainstart_sting);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Pull bloodfly wings (Cost: 1 LP, 100 gold)",dia_addon_edgor_trainstart_wing);
	};
	if(KNOWS_BLOODFLY == FALSE)
	{
		Info_AddChoice(dia_addon_edgor_trainstart,"Remove secretion from stinger (Cost: 1 LP, 100 gold)",dia_addon_edgor_trainstart_gift);
	};
};

func void dia_addon_edgor_trainstart_back()
{
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_sting()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Sting_15_00");	//How do I get the stingers from the bloodflies?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_01");	//Turn the dead beasts onto their belly and cut them open crosswise. Grasp the innards and cut through all the tissue at the back.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Sting_06_02");	//Then you can remove the stinger with a jerk.
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_wing()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_Wing_15_00");	//How do I get the wings?
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_Wing_06_01");	//Grab the wings with one hand. With the other you just cut them out along with the upper layer of skin.
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

func void dia_addon_edgor_trainstart_gift()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(other.lp >= 1)
		{
			AI_Output(other,self,"DIA_Addon_Edgor_TrainStart_GIFT_15_00");	//How do I remove the secretion from the bloodflies.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_01");	//Cut open the upper layer of the stinger lengthwise - then the healing secretion will flow right out.
			AI_Output(self,other,"DIA_Addon_Edgor_TrainStart_GIFT_06_02");	//That way it's completely safe to suck out a stinger - or use it for some potions.
			other.lp = other.lp - 1;
			KNOWS_BLOODFLY = TRUE;
			PrintScreen(PRINT_ADDON_KNOWSBF,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
			b_say(self,other,"$NOLEARNNOPOINTS");
		};
	}
	else
	{
		b_edgor_notenoughgold();
	};
	Info_ClearChoices(dia_addon_edgor_trainstart);
};

