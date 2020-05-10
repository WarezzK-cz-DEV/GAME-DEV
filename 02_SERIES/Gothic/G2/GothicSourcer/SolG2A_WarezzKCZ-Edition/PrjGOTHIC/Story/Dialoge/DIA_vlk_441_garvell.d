
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = "(It would be child's play to steal his purse.)";
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,itse_goldpocket25,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "What are you doing here?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//I'm building a ship because I want to get out of here - as fast as I can.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//But the way it looks right now, this ship will never be finished.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "Why are you in such a hurry?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//Why are you in such a hurry?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//Soon the orcs will come and burn down the city.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//What makes you think that?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//Boy, have you noticed the paladins running around everywhere? Why do you think they're here?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//I tell you, they're here because the orcs will attack soon. And that won't be pretty.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "Why can't you finish your ship?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//Why can't you finish your ship?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//(dismissively) Oh, we have thousands of problems. The hull still isn't stable, and it's still missing a lot of boards.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//But I have hardly any gold left to buy new material with, and the last delivery had bugs in it.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//My boys don't work productively. One wants a fast ship above all else, the other one is worried about the figurehead!
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//As if we didn't have more important things to do!
	AI_Output(self,other,"DIA_Addon_Garvell_Schiff_04_00");	//Also, one of my people is simply not showing up for work any more. I'm beginning to fear that this will delay the construction even more.
};


instance DIA_ADDON_GARVELL_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 5;
	condition = dia_addon_garvell_missingpeople_condition;
	information = dia_addon_garvell_missingpeople_info;
	description = "You're short a worker?";
};


func int dia_addon_garvell_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_schiff) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garvell_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_15_00");	//You're short a worker?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_01");	//Yes. His name's Monty. He's vanished into thin air.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_04_02");	//That lazy pig is probably living the high life on a farm somewhere. I should never have paid him in advance.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Garvell is complaining about his worker Monty who failed to show up for work one day. Garvell thinks that Monty is living the high life with the farmers.");
	Info_ClearChoices(dia_addon_garvell_missingpeople);
	Info_AddChoice(dia_addon_garvell_missingpeople,"I've heard that other people have gone missing, too.",dia_addon_garvell_missingpeople_more);
	if(SCKNOWSFARIMASWILLIAMSFRIEND == FALSE)
	{
		Info_AddChoice(dia_addon_garvell_missingpeople,"When was the last time you saw Monty?",dia_addon_garvell_missingpeople_wo);
	};
};

func void dia_addon_garvell_missingpeople_more()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_more_15_00");	//I've heard that other people have gone missing, too.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_01");	//Just what I'm saying. That's where the evil starts.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_02");	//Farim the fisherman told me something similar. His buddy William is no longer around.
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_more_04_03");	//I bet that the orcs are behind all this.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Farim the fisherman seems to know a thing or two about the disappearance of his friend William.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_AddChoice(dia_addon_garvell_missingpeople,DIALOG_BACK,dia_addon_garvell_missingpeople_back);
	if(farim.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		Info_AddChoice(dia_addon_garvell_missingpeople,"Where can I find this Farim?",dia_addon_garvell_missingpeople_farim);
	};
};

func void dia_addon_garvell_missingpeople_back()
{
	Info_ClearChoices(dia_addon_garvell_missingpeople);
};

func void dia_addon_garvell_missingpeople_farim()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_Farim_15_00");	//Where can I find this Farim?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_Farim_04_01");	//He's a fisherman. I think that his hut is near the provisions store of the paladins. But I don't know for sure.
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Farim's hut is situated near the paladins' provisions store.");
};

func void dia_addon_garvell_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Garvell_MissingPeople_wo_15_00");	//When was the last time you saw Monty?
	AI_Output(self,other,"DIA_Addon_Garvell_MissingPeople_wo_04_01");	//(angrily) He hasn't bothered to show up for work for at least two days.
};


instance DIA_GARVELL_RETURNMONTY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_returnmonty_condition;
	information = dia_garvell_returnmonty_info;
	description = "And, how's it going NOW?";
};


func int dia_garvell_returnmonty_condition()
{
	if((Npc_GetDistToWP(monty_nw,"NW_CITY_HABOUR_WERFT_IN_01") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_returnmonty_info()
{
	AI_Output(other,self,"DIA_Addon_Garvell_ReturnMonty_15_00");	//And, how's it going NOW?
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_01");	//Monty is back! He's busy studying the plans.
	AI_Output(self,other,"DIA_Addon_Garvell_ReturnMonty_04_02");	//Maybe we can get the ship done now...
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "Is there any way I can help you?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//Can I help you somehow?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//Yes you can. Find out what the paladins are planning. I want to know why they're here.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//And I have to know if the orcs will attack - and how far from the city they are.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//One of the bastards was even seen outside the city.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//Just bring me all the information you can get.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//I need to know how much time I have left to finish the boat.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"Garvell wants information about the orcs, and he wants to know why the paladins are in town.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//Good. If you find out more, let me know.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//Thanks for the information. The way it looks, we have all the time in the world for building our ship.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "I've got some information about the orcs.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//I've got some information about the orcs.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//Let's hear it.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//They're stuck in the Valley of Mines, and it looks like they're going to stay there.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//To be on the safe side, the paladins are guarding the pass.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "I know why the paladins are here.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//I know why the paladins are here.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//Really? Tell me!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//The paladins are here to get the magical ore from the Valley of Mines, not because they expect the orcs to attack the city.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//As soon as they've got the ore, they're going to return to the mainland.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "As to that orc outside of town...";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//As to that orc outside of town...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//Yeees...?
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//Don't worry about him. The city guard is going to take care of him.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "What's going on at the harbor?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//What's going on at the harbor?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//The orcs are breathing down our necks and you're asking about the harbor?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//I only wanted to...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//The biggest problem we have is that there aren't enough ships in the harbor to get us out of here.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//To be honest, there's only one ship here, and that belongs to the paladins. They certainly won't let us get out of here with it.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//Look around for yourself, there's nothing going on here.
	};
};

