
instance DIA_BAU_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_13_exit_condition;
	information = dia_bau_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_13_exit_condition()
{
	return TRUE;
};

func void dia_bau_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_13_join_condition;
	information = dia_bau_13_join_info;
	permanent = TRUE;
	description = "Tell me more about those mercenaries!";
};


func int dia_bau_13_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_13_join_info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Tell me more about those mercenaries!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//If you ever have trouble with them, go to Lee. That's what we farmers do. He's really strict with his people.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//If one of them misbehaves, he really lets him have it.
};


instance DIA_BAU_13_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_13_people_condition;
	information = dia_bau_13_people_info;
	permanent = TRUE;
	description = "Who's in charge here?";
};


func int dia_bau_13_people_condition()
{
	return TRUE;
};

func void dia_bau_13_people_info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Who's in charge here?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//If you ask me, it's the mercenaries. Sure, Onar pays them, but Innos knows how long they'll take orders from him.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//If the mercenaries ever get it into their heads that he's useless around here, I wouldn't want to be in his shoes.
};


instance DIA_BAU_13_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_13_location_condition;
	information = dia_bau_13_location_info;
	permanent = TRUE;
	description = "What can you tell me about this area?";
};


func int dia_bau_13_location_condition()
{
	return TRUE;
};

func void dia_bau_13_location_info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//What can you tell me about this area?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//There are three farms here. Onar's to the east and Sekob's at the north end of the valley.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//There's a path up to the high plain in the southwest. That's where Bengar's farm is.
};


instance DIA_BAU_13_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_13_standard_condition;
	information = dia_bau_13_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_bau_13_standard_condition()
{
	return TRUE;
};

func void dia_bau_13_standard_info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//The troops from the city don't take away our livestock and harvest anymore! They don't want to play that game, now that we can defend ourselves!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//The paladins in the city don't care about us farmers. If the orcs attack, we're on our own.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//Dragons! There's a rumor there are dragons in the Valley of Mines. They're bound to come over the pass soon!
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//They even say some bandits from the mountains are headed for the Valley of Mines. Well, that would be too dangerous for me.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//When the taxes go down again and we get paid reasonably for our work, then we'll trade with the city again.
	};
};

func void b_assignambientinfos_bau_13(var C_NPC slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

