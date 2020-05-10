
instance DIA_ADDON_ESTEBAN_EXIT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 999;
	condition = dia_addon_esteban_exit_condition;
	information = dia_addon_esteban_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_esteban_exit_condition()
{
	if(BODYGUARD_KILLER == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ESTEBAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 900;
	condition = dia_addon_esteban_pickpocket_condition;
	information = dia_addon_esteban_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_esteban_pickpocket_condition()
{
	return c_beklauen(105,500);
};

func void dia_addon_esteban_pickpocket_info()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_BACK,dia_addon_esteban_pickpocket_back);
	Info_AddChoice(dia_addon_esteban_pickpocket,DIALOG_PICKPOCKET,dia_addon_esteban_pickpocket_doit);
};

func void dia_addon_esteban_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};

func void dia_addon_esteban_pickpocket_back()
{
	Info_ClearChoices(dia_addon_esteban_pickpocket);
};


instance DIA_ADDON_ESTEBAN_HI(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 2;
	condition = dia_addon_esteban_hi_condition;
	information = dia_addon_esteban_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_esteban_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_00");	//So you're the fellow who fought his way into camp.
	AI_Output(other,self,"DIA_Addon_Esteban_Hi_15_01");	//That got around fast...
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_02");	//Franco was a tough nut. No one messed with him. No one - except you.
	AI_Output(self,other,"DIA_Addon_Esteban_Hi_07_03");	//Just to make it clear, if you try the same shit with me, I'll kill you.
};


instance DIA_ADDON_ESTEBAN_MINE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_mine_condition;
	information = dia_addon_esteban_mine_info;
	permanent = FALSE;
	description = "I want into the mine!";
};


func int dia_addon_esteban_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_hi))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mine_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Mine_15_00");	//I want into the mine!
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_01");	//(grins) Of course you do. Then you're in the right place with me.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_02");	//Because everyone who digs in the mine gets to keep a hefty share of the gold.
	AI_Output(self,other,"DIA_Addon_Esteban_Mine_07_03");	//And I hand out the red stones you need, so that Thorus will let you in.
};


instance DIA_ADDON_ESTEBAN_ROT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 3;
	condition = dia_addon_esteban_rot_condition;
	information = dia_addon_esteban_rot_info;
	permanent = FALSE;
	description = "Give me one of those red stones.";
};


func int dia_addon_esteban_rot_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_mine))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_rot_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Rot_15_00");	//Give me one of those red stones.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_01");	//Okay, but they aren't free.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_02");	//Normally, I demand a share of the gold the boys get for digging.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_03");	//(appraisingly) How much do you know about mining gold, hm?
	if(HERO_HACKCHANCE > 25)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_04");	//You've probably learned a few tricks, right?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_05");	//You don't appear to know a whole lot about it...
	};
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_06");	//(snidely) If I give you a red stone, it won't be because you're such a great digger.
	AI_Output(self,other,"DIA_Addon_Esteban_Rot_07_07");	//No, I have another job for you...
};


instance DIA_ADDON_ESTEBAN_MIS(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 4;
	condition = dia_addon_esteban_mis_condition;
	information = dia_addon_esteban_mis_info;
	permanent = FALSE;
	description = "What sort of job?";
};


func int dia_addon_esteban_mis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_mis_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_00");	//What sort of job?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_01");	//One of the bandits planned to kill me. But instead, my guards killed HIM.
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_02");	//He was hot for your job, huh?
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_03");	//He was an idiot! A thug without a brain. He never would have got the idea to attack me on his own.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_04");	//No, he was only fulfilling a contract - someone else sent him...
	AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_05");	//So I'm supposed to find out who was behind it.
	AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_06");	//Whoever sent me this assassin will pay for it. Find him - and I'll let you into the mine.
	if(!Npc_IsDead(senyan) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		AI_Output(other,self,"DIA_Addon_Esteban_MIS_15_07");	//Senyan sent me to you about this business.
		AI_Output(self,other,"DIA_Addon_Esteban_MIS_07_08");	//Senyan? He also works for me. I told him he should keep his eyes open.
	};
	MIS_JUDAS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ESTEBAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ESTEBAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ESTEBAN,"There was an attempt on Esteban's life. I'm supposed to find out who is behind it.");
};


instance DIA_ADDON_ESTEBAN_KERL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_kerl_condition;
	information = dia_addon_esteban_kerl_info;
	permanent = FALSE;
	description = "How should I go about it?";
};


func int dia_addon_esteban_kerl_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_kerl_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Kerl_15_00");	//How should I go about it?
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_01");	//Everyone here in the camp knows about it. So you're playing with all your cards on the table.
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_02");	//Try to find out who is on my side and who isn't and don't let the boys make a fool of you!
	AI_Output(self,other,"DIA_Addon_Esteban_Kerl_07_03");	//Talk to Snaf. That fat cook picks up a lot.
	b_logentry(TOPIC_ADDON_ESTEBAN,"In order to find the person responsible, I should talk to all the people in camp and find out whose side they are on. Snaf is a good place to go because he hears a lot.");
};


instance DIA_ADDON_ESTEBAN_ARMOR(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 9;
	condition = dia_addon_esteban_armor_condition;
	information = dia_addon_esteban_armor_info;
	permanent = FALSE;
	description = "I need better armor.";
};


func int dia_addon_esteban_armor_condition()
{
	if(HUNO_ARMORCHEAP == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Armor_15_00");	//I need better armor.
	AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_01");	//Why? You already have some. That's good enough for you for now!
	if(MIS_JUDAS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Armor_07_02");	//If you complete your assignement, we'll talk about it again...
	};
};


instance DIA_ADDON_ESTEBAN_AUFTRAG(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_auftrag_condition;
	information = dia_addon_esteban_auftrag_info;
	permanent = TRUE;
	description = "About the assignment...";
};


func int dia_addon_esteban_auftrag_condition()
{
	if(((MIS_JUDAS == LOG_RUNNING) || (MIS_JUDAS == LOG_SUCCESS)) && (BODYGUARD_KILLER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_auftrag_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_00");	//About the assignment...
	AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_01");	//Listen, I have other things I have to take care of.
	if(MIS_JUDAS == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_02");	//I thought you might be interested in knowing who was behind the attack...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_03");	//Who is it? Tell me his name so my guards can wring his neck...
		AI_Output(other,self,"DIA_Addon_Esteban_Auftrag_15_04");	//The trader Fisk is behind it. At the moment, he's sitting in the bar unsuspecting and drinking...
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_05");	//HA! Well done, kid. My guards will take care of him.
		AI_TurnToNPC(self,wache_01);
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_06");	//You heard him, boys. Go get Fisk.
		AI_TurnToNPC(self,other);
		BODYGUARD_KILLER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Esteban_Auftrag_07_07");	//Come back when you've found out who the guy is.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_ESTEBAN_AWAY(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_away_condition;
	information = dia_addon_esteban_away_info;
	permanent = FALSE;
	description = "And what happens next?";
};


func int dia_addon_esteban_away_condition()
{
	if(BODYGUARD_KILLER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_esteban_away_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Away_15_00");	//And what happens next?
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_01");	//What happens next? I'll tell you what happens.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_02");	//Fisk will die a painful death. And everyone in the camp will find out about it.
	AI_Output(self,other,"DIA_Addon_Esteban_Away_07_03");	//That will be a warning to all of them.
	b_startotherroutine(wache_01,"AMBUSH");
	b_startotherroutine(wache_02,"AMBUSH");
};


instance DIA_ADDON_ESTEBAN_STONE(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_stone_condition;
	information = dia_addon_esteban_stone_info;
	permanent = FALSE;
	description = "Do I get a red stone now?";
};


func int dia_addon_esteban_stone_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_away) && (BODYGUARD_KILLER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_stone_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Stone_15_00");	//Do I get a red stone now?
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_01");	//You did your job well. Someone like you has no business in the mine.
	AI_Output(self,other,"DIA_Addon_Esteban_Stone_07_02");	//I can use you much better out here. You will stay in the camp and continue working for me.
};


instance DIA_ADDON_ESTEBAN_NOT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 5;
	condition = dia_addon_esteban_not_condition;
	information = dia_addon_esteban_not_info;
	permanent = FALSE;
	description = "I'll think about it.";
};


func int dia_addon_esteban_not_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_not_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_not_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_01");	//You're forgetting who you're talking to. I'm in charge here and you will do exactly what I say.
	AI_Output(self,other,"DIA_Addon_Esteban_not_07_02");	//And I say, you will work for me and no one else. Is that clear?
};


instance DIA_ADDON_ESTEBAN_FIGHT(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 6;
	condition = dia_addon_esteban_fight_condition;
	information = dia_addon_esteban_fight_info;
	permanent = FALSE;
	description = "Are you trying to pull my leg?";
};


func int dia_addon_esteban_fight_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_stone))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_00");	//Are you trying to play me for a fool? There was never a question of me working for you.
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_01");	//It isn't everyone who gets an offer like this. But if you don't want it, you're free to leave the camp...
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_02");	//How about if you keep your word and give me a red stone?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_03");	//Hey - one more word and my guards will have to hurt you, too.
	AI_Output(other,self,"DIA_Addon_Esteban_fight_15_04");	//(grins) What guards...?
	AI_Output(self,other,"DIA_Addon_Esteban_fight_07_05");	//What...? Ah, I see... you're trying to pull a fast one, just wait...
	BODYGUARD_KILLER = FALSE;
	b_killnpc(wache_01);
	b_killnpc(wache_02);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_ESTEBAN_DUELL(C_INFO)
{
	npc = bdt_1083_addon_esteban;
	nr = 99;
	condition = dia_addon_esteban_duell_condition;
	information = dia_addon_esteban_duell_info;
	permanent = FALSE;
	description = "Give me the stone NOW or I'll get it myself!";
};


func int dia_addon_esteban_duell_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_esteban_rot) && (BODYGUARD_KILLER != TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_esteban_duell_info()
{
	AI_Output(other,self,"DIA_Addon_Esteban_Duell_15_00");	//Give me the stone NOW or I'll get it myself!
	AI_Output(self,other,"DIA_Addon_Esteban_Duell_07_01");	//Oh, you've got a death wish. All right, I'll do you a favor and put you out of your stupidity!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

