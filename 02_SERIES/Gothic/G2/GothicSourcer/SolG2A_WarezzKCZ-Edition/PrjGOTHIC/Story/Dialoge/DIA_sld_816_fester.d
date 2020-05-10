
instance DIA_FESTER_EXIT(C_INFO)
{
	npc = sld_816_fester;
	nr = 999;
	condition = dia_fester_exit_condition;
	information = dia_fester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fester_exit_condition()
{
	return TRUE;
};

func void dia_fester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_HELLO(C_INFO)
{
	npc = sld_816_fester;
	nr = 1;
	condition = dia_fester_hello_condition;
	information = dia_fester_hello_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_fester_hello_condition()
{
	return TRUE;
};

func void dia_fester_hello_info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//I am preparing for battle...
};


instance DIA_FESTER_AUFTRAG(C_INFO)
{
	npc = sld_816_fester;
	nr = 2;
	condition = dia_fester_auftrag_condition;
	information = dia_fester_auftrag_info;
	permanent = FALSE;
	description = "Why?";
};


func int dia_fester_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_hello))
	{
		return TRUE;
	};
};

func void dia_fester_auftrag_info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//Why?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//Lately the farmers have had more and more problems with field raiders.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//A few of them even managed to get themselves eaten.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//Fat Onar didn't exactly find that amusing. None of us got our pay for a week.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//And it was more or less my fault. Now Lee wants me to wipe out the creatures' nest by myself.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//And the other boys have already made bets on whether I'll survive...
};


instance DIA_FESTER_YOUFIGHT(C_INFO)
{
	npc = sld_816_fester;
	nr = 3;
	condition = dia_fester_youfight_condition;
	information = dia_fester_youfight_info;
	permanent = FALSE;
	description = "Are you a good fighter?";
};


func int dia_fester_youfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_hello) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_youfight_info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//Are you a good fighter?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//I'm fair with a sword, but with the bow I'm very good! Why do you ask?
};


instance DIA_FESTER_WONEST(C_INFO)
{
	npc = sld_816_fester;
	nr = 4;
	condition = dia_fester_wonest_condition;
	information = dia_fester_wonest_info;
	permanent = FALSE;
	description = "Where's the nest?";
};


func int dia_fester_wonest_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_auftrag) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_wonest_info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//Where's the nest?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//In the middle of the field here, in the big rock.
};


var int fester_choice;
const int FC_GOLD = 0;
const int FC_JOIN = 1;

instance DIA_FESTER_TOGETHER(C_INFO)
{
	npc = sld_816_fester;
	nr = 5;
	condition = dia_fester_together_condition;
	information = dia_fester_together_info;
	permanent = FALSE;
	description = "We could attack that nest together...";
};


func int dia_fester_together_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_auftrag))
	{
		return TRUE;
	};
};

func void dia_fester_together_info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//We could attack that nest together...
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//You want to help me? Why?
	Info_ClearChoices(dia_fester_together);
	Info_AddChoice(dia_fester_together,"I want to see some gold!",dia_fester_together_gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_fester_together,"I want to join you!",dia_fester_together_join);
	};
};

func void dia_fester_together_join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//I want to join you!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//Oh, so that's the way it is. You want to prove how good you are ..
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(cunningly) All right, let's attack the beasts together.
	FESTER_CHOICE = FC_JOIN;
	Info_ClearChoices(dia_fester_together);
};

func void dia_fester_together_gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//I want to see some gold!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(laughs) You bastard! You want to take advantage of my situation, huh?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//Either I pay you, or I bite the dust.
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//All right. I can pay you 50 gold pieces - that's all I have.
	FESTER_CHOICE = FC_GOLD;
	Info_ClearChoices(dia_fester_together);
};


var int fester_losgeh_day;

instance DIA_FESTER_TOGETHERNOW(C_INFO)
{
	npc = sld_816_fester;
	nr = 6;
	condition = dia_fester_togethernow_condition;
	information = dia_fester_togethernow_info;
	permanent = TRUE;
	description = "Let's attack the nest!";
};


func int dia_fester_togethernow_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_together) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_togethernow_info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//Let's attack the nest!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//In the dark? No, no, we'd better do this by daylight.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//Right now? Or do you need to equip yourself first?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//You could go back to the farm first...
		Info_ClearChoices(dia_fester_togethernow);
		Info_AddChoice(dia_fester_togethernow,"All right, let's wait a little longer...",dia_fester_togethernow_later);
		Info_AddChoice(dia_fester_togethernow,"There's no time like the present.",dia_fester_togethernow_now);
	};
};

func void dia_fester_togethernow_now()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//There's no time like the present.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//Good, then let's see what you've got.
	Npc_ExchangeRoutine(self,"GUIDE");
	FESTER_LOSGEH_DAY = b_getdayplus();
	MIS_FESTER_KILLBUGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FESTERRAUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FESTERRAUBER,LOG_RUNNING);
	b_logentry(TOPIC_FESTERRAUBER,"I'm going to attack the field raiders' nest with Fester.");
	Info_ClearChoices(dia_fester_togethernow);
	AI_StopProcessInfos(self);
	Wld_InsertNpc(giant_bug,"NW_BIGFARM_FELDREUBER_LHADD04");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM_FELDREUBER_LHADD01");
};

func void dia_fester_togethernow_later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//All right, let's wait a little longer...
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//You know where to find me...
	Info_ClearChoices(dia_fester_togethernow);
};


instance DIA_FESTER_INCAVE(C_INFO)
{
	npc = sld_816_fester;
	nr = 7;
	condition = dia_fester_incave_condition;
	information = dia_fester_incave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fester_incave_condition()
{
	if((MIS_FESTER_KILLBUGS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
		return TRUE;
	};
};

func void dia_fester_incave_info()
{
	if(Wld_GetDay() > FESTER_LOSGEH_DAY)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//Where the devil have you been?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//So this is where they dragged the dead farmers. Disgusting.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//The filthy things should all be wiped out now.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//Let's go back!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_WASMITABMACHUNG(C_INFO)
{
	npc = sld_816_fester;
	nr = 8;
	condition = dia_fester_wasmitabmachung_condition;
	information = dia_fester_wasmitabmachung_info;
	permanent = FALSE;
	description = "What about our agreement?";
};


func int dia_fester_wasmitabmachung_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_incave))
	{
		return TRUE;
	};
};

func void dia_fester_wasmitabmachung_info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//What about our agreement?
	if(FESTERS_GIANT_BUG_KILLED == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//Are you kidding? You didn't do anything for it.
	}
	else if(FESTER_CHOICE == FC_JOIN)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//Well, I could help you to get accepted with us, but I won't.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//And why not?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//If I tell everybody that you helped me, they'll hit me with a new assignment.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//You understand that I don't fancy that, don't you?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//Well, tough luck, kid. I'm sure you'll find someone else to help you.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//Hey - you wanted to take advantage of my situation. Now I'm taking a bit of advantage of you.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//But look at the bright side: you had a learning experience. That's something, isn't it?
	};
	MIS_FESTER_KILLBUGS = LOG_OBSOLETE;
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int fester_duell_day;
var int fester_fightverarscht;
var int fester_fightsylvio;

instance DIA_FESTER_PERMPRUEGEL(C_INFO)
{
	npc = sld_816_fester;
	nr = 9;
	condition = dia_fester_permpruegel_condition;
	information = dia_fester_permpruegel_info;
	permanent = TRUE;
	description = "I think your hide could do with another tanning.";
};


func int dia_fester_permpruegel_condition()
{
	if((Npc_KnowsInfo(other,dia_fester_wasmitabmachung) || Npc_KnowsInfo(other,dia_jarvis_missionko) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE)) && (MIS_READYFORCHAPTER4 == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_permpruegel_info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//I think your hide could do with another tanning.
	if(FESTER_DUELL_DAY < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,itmi_gold,random);
		FESTER_DUELL_DAY = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) && (FESTER_FIGHTVERARSCHT == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//I don't like having my leg pulled.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//I'm shaking, I'm shaking.
		FESTER_FIGHTVERARSCHT = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//It wasn't a good idea for you to take up with Sylvio.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//You're one of Lee's toadies, aren't you? You've come to the wrong man!
		FESTER_FIGHTSYLVIO = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//What the devil do you want from me now?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//I just love to watch you kiss the mud!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//You just don't get it, do you?
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_FESTER_PICKPOCKET(C_INFO)
{
	npc = sld_816_fester;
	nr = 900;
	condition = dia_fester_pickpocket_condition;
	information = dia_fester_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fester_pickpocket_condition()
{
	return c_beklauen(27,45);
};

func void dia_fester_pickpocket_info()
{
	Info_ClearChoices(dia_fester_pickpocket);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_BACK,dia_fester_pickpocket_back);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_PICKPOCKET,dia_fester_pickpocket_doit);
};

func void dia_fester_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fester_pickpocket);
};

func void dia_fester_pickpocket_back()
{
	Info_ClearChoices(dia_fester_pickpocket);
};

