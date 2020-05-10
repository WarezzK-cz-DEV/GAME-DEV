
instance DIA_OCVLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_1_exit_condition;
	information = dia_ocvlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_1_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_1_people_condition;
	information = dia_ocvlk_1_people_info;
	permanent = TRUE;
	description = "Who's in command here?";
};


func int dia_ocvlk_1_people_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Who's in command here?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Commander Garond. But since the situation here has become worse, he has not been seen outside the throne room. I'm afraid that will come to a bad end.
};


instance DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_1_location_condition;
	information = dia_ocvlk_1_location_info;
	permanent = TRUE;
	description = "What do you know about the Valley of Mines?";
};


func int dia_ocvlk_1_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//What do you know about the Valley of Mines?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//A few of our boys are at the mines and still prospecting, as far as I know.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//I wouldn't want to trade with them. The whole valley is swarming with orcs. Not to mention the dragons.
};


instance DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_1_standard_condition;
	information = dia_ocvlk_1_standard_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_ocvlk_1_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//How are things?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//The orcs have us right where they want us! Without reinforcements, none of us here will survive! I'm amazed the dragons haven't finished us off completely.
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//At least we'll finally get some reinforcements.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//I heard that all the dragons have been slain? Thank Innos!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//This accursed ore. We should throw our entire ore supply down from the battlements. Maybe the orcs will leave us in peace then.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Those ridiculous boxes which they have piled up haphazardly in front of the entrance will do nothing to deter the orcs!
		};
	};
};

func void b_assignambientinfos_ocvlk_1(var C_NPC slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

