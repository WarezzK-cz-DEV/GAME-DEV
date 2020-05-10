
instance DIA_VLK_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_16_exit_condition;
	information = dia_vlk_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_16_exit_condition()
{
	return TRUE;
};

func void dia_vlk_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_16_join_condition;
	information = dia_vlk_16_join_info;
	permanent = TRUE;
	description = "I want to become a citizen of this town!";
};


func int dia_vlk_16_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_16_join_info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//I want to become a citizen of this town!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Will you help us defend the city against the orcs?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//If you're a citizen of Khorinis, you can join the militia - you should talk to one of the city guards.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "Who are the important figures in this town?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Who are the important figures in this town?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//The paladins are holding the upper quarter.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "What interesting things are there to see here?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//What interesting things are there to see here?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//There are all kinds of goods on display in the marketplace.
};


instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_16_standard_condition;
	information = dia_vlk_16_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_vlk_16_standard_condition()
{
	return TRUE;
};

func void dia_vlk_16_standard_info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_00");	//I hope the militia will finally find out why the population of Khorinis keeps shrinking.
		AI_Output(self,other,"DIA_Addon_VLK_16_STANDARD_16_01");	//You have to fear for your life when you hear that so many have already gone missing.
		if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
		{
			Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
			b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
		};
		SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Have you heard? The orcs have been seen outside the city. Let's hope the paladins have enough men.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//I wonder whether that's the reason the farmers no longer come to the market.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//The mercenary who was said to have murdered Lothar is innocent. They found proof that he was framed. I heard that in the marketplace.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//It's an outrage. The landowner's mercenaries have murdered the honorable Lothar in the middle of the street.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//But Innos himself will punish them for their sins. No one is allowed to raise a hand against a warrior of our Lord.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//I have heard that the criminals are fleeing Onar's farm. They say that, for fear of Lord Hagen's men, they went back to the Valley of Mines.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//I have heard that a troop of paladins managed to defeat the horrible dragons in the Valley of Mines.
	};
};

func void b_assignambientinfos_vlk_16(var C_NPC slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

