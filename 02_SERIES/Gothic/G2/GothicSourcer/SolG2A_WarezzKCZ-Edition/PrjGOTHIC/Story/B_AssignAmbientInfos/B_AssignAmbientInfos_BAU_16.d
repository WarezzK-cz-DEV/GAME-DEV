
instance DIA_BAU_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_16_exit_condition;
	information = dia_bau_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_16_exit_condition()
{
	return TRUE;
};

func void dia_bau_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_16_join_condition;
	information = dia_bau_16_join_info;
	permanent = TRUE;
	description = "Tell me more about those mercenaries!";
};


func int dia_bau_16_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_16_join_info()
{
	AI_Output(other,self,"DIA_BAU_16_JOIN_15_00");	//Tell me more about those mercenaries!
	AI_Output(self,other,"DIA_BAU_16_JOIN_16_01");	//They're loitering around the farm all day, beat each other up on occasion, and think it's a hoot.
};


instance DIA_BAU_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_16_people_condition;
	information = dia_bau_16_people_info;
	permanent = TRUE;
	description = "Who's in charge here?";
};


func int dia_bau_16_people_condition()
{
	return TRUE;
};

func void dia_bau_16_people_info()
{
	AI_Output(other,self,"DIA_BAU_16_PEOPLE_15_00");	//Who's in charge here?
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_01");	//If you ask me, it's the mercenaries.
	AI_Output(self,other,"DIA_BAU_16_PEOPLE_16_02");	//Onar pays them, but most of them do whatever they like.
};


instance DIA_BAU_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_16_location_condition;
	information = dia_bau_16_location_info;
	permanent = TRUE;
	description = "What can you tell me about this area?";
};


func int dia_bau_16_location_condition()
{
	return TRUE;
};

func void dia_bau_16_location_info()
{
	AI_Output(other,self,"DIA_BAU_16_LOCATION_15_00");	//What can you tell me about this area?
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_01");	//There are three farms here. Onar's to the east and Sekob's in the north end of the valley.
	AI_Output(self,other,"DIA_BAU_16_LOCATION_16_02");	//There's a path up to the high plain in the southwest. That's where Bengar's farm is.
};


instance DIA_BAU_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_16_standard_condition;
	information = dia_bau_16_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_bau_16_standard_condition()
{
	return TRUE;
};

func void dia_bau_16_standard_info()
{
	AI_Output(other,self,"DIA_BAU_16_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_01");	//The troops from the city don't take away our livestock and harvest any more! We're no longer playing that game, we're able to defend ourselves now!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_02");	//They say an army is gathering in the Valley of Mines. They'll be here soon.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_03");	//I heard rumors that there are dragons in the Valley of Mines. I can hardly believe it.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_04");	//Some of the mercenaries have left. I don't know whether that's a good thing or a bad thing.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_16_STANDARD_16_05");	//Sending the paladins to the Valley of Mines - what's that all about?
	};
};

func void b_assignambientinfos_bau_16(var C_NPC slf)
{
	dia_bau_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_16_standard.npc = Hlp_GetInstanceID(slf);
};

