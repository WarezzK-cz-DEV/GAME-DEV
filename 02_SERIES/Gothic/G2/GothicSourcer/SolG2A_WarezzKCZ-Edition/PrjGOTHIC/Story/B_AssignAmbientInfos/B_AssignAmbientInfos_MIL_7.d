
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_7_exit_condition;
	information = dia_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_7_exit_condition()
{
	return TRUE;
};

func void dia_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_7_join_condition;
	information = dia_mil_7_join_info;
	permanent = TRUE;
	description = "I want to join the militia!";
};


func int dia_mil_7_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_7_join_info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//I want to join the militia!
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//You're not even a citizen of Khorinis! Why do you think Lord Andre should accept you?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//Anyone could come along  - get issued a weapon and some armor in passing, and then disappear with it!
		if(c_npcisinquarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//But I'm serious!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//Don't explain that to me, explain it to Lord Andre. You'll find him in the barracks.
		};
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_7_people_condition;
	information = dia_mil_7_people_info;
	permanent = TRUE;
	description = "What do you know about the paladins?";
};


func int dia_mil_7_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_7_people_info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//What do you know about the paladins?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//Not much. Nobody knows exactly why they're here. Not even those of us in the city guard.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//They've taken control of the city, chased the governor out of his council chamber and relieved the judge of his office.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//If you ask me, it's a good thing. Those pompous asses bitterly needed a lesson in humility.
};


instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_7_location_condition;
	information = dia_mil_7_location_info;
	permanent = TRUE;
	description = "What are my options here in town?";
};


func int dia_mil_7_location_condition()
{
	return TRUE;
};

func void dia_mil_7_location_info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//What are my options here in town?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//If you don't want to end up in the gutter in the harbor district, find a regular job. Ask around in the lower part of town - maybe you'll get lucky.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//If you're planning on staying longer here in the city, you should join the militia or at least get trained in combat.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//The combat instructors in the barracks also train civilians.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//The orcs will come soon, and then you'll be glad of every hour you spent on the drill ground.
};


instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_7_standard_condition;
	information = dia_mil_7_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_mil_7_standard_condition()
{
	return TRUE;
};

func void dia_mil_7_standard_info()
{
	var int randy;
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		randy = Hlp_Random(2);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_MIL_7_STANDARD_07_00");	//Citizens are disappearing from here one by one. Up to now, we haven't been able to find out what's happening to them. Could the orcs be behind it?
			if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
			{
				Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
				b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
			};
			SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//They say the farmers have rebelled. We can't use crap like that now, when we're in the middle of a war with the orcs!
		};
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//It's time the paladins ended the farmers' rebellion. He who breaks the law must be punished. Especially now, when we're at war.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//The mercenary who was accused of murdering Lothar is supposedly innocent. Someone found proof that he was being framed.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//One of Onar's mercenaries murdered the honorable paladin Lothar. But the bastard was caught and tossed in prison.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//Some of the mercenaries have already left Onar's farm. Some problems solve themselves.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//The dragons are finished, but it isn't over. The orcs are next. We'll clean things up properly!
	};
};

func void b_assignambientinfos_mil_7(var C_NPC slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

