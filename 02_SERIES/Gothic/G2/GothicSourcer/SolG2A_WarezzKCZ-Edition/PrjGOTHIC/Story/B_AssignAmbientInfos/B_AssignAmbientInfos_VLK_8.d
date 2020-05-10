
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_8_exit_condition;
	information = dia_vlk_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_8_exit_condition()
{
	return TRUE;
};

func void dia_vlk_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_8_join_condition;
	information = dia_vlk_8_join_info;
	permanent = TRUE;
	description = "I want to become a citizen of this town!";
};


func int dia_vlk_8_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_8_join_info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//I want to become a citizen of this town!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//And why are you telling me that? Go to one of the master craftsmen in the lower part of the city. Maybe, if you're lucky, one of them is looking for an apprentice.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//Otherwise, you'll have to go to the governor and have yourself registered as a citizen.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//But right now, you can forget that. The governor isn't in charge any more, since the paladins came.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//And their leader, Lord Hagen, is guaranteed not to have time for things like that.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "Who are the most important citizens in this town?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Who are the most important citizens in this town?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Besides the paladins... the master craftsmen in the lower part of town. They are all very important.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "What interesting things are there to see here?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//What interesting things are there to see here?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//The big ship that the paladins came in is in the harbor. It's an enormous boat! You have to take a look at it.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//But I can't imagine that they'll let you on board. The paladins guard the ship like the crown jewels.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//No wonder. It's also the only sea-worthy vessel anchored anywhere far and wide.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_00");	//Everyone has been worried lately.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_01");	//It's not enough that the paladins have made themselves at home here, now people are constantly disappearing in the strangest fashion.
		AI_Output(self,other,"DIA_Addon_VLK_8_STANDARD_08_02");	//It's about time the militia finally did something about it.
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
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Everyone is waiting for the paladins to announce why they're really here. I suspect it's because of the orcs. They're sure to attack soon!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//The paladins may have the blessing of Innos, but when the orc hordes show up here, that's it for us.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//They say the paladins are only here to get all the ore on the island. For the war on the mainland, they say.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Do you know what that means? The king doesn't give a damn if we all die miserably when the orcs attack.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//I'll make sure that I'm on the ship when the paladins weigh anchor.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//They say the orcs are riding here on dragons that are as big as half the city! We don't stand a chance!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//People are saying that the dragons have been defeated. Could it be true?
	};
};

func void b_assignambientinfos_vlk_8(var C_NPC slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

