
instance DIA_OCPAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_9_exit_condition;
	information = dia_ocpal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_9_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_9_people_condition;
	information = dia_ocpal_9_people_info;
	permanent = TRUE;
	description = "Who's in command here?";
};


func int dia_ocpal_9_people_condition()
{
	return TRUE;
};

func void dia_ocpal_9_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Who's in command here?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Garond is the commander of the castle. You can't exactly envy him his job.
};


instance DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_9_location_condition;
	information = dia_ocpal_9_location_info;
	permanent = TRUE;
	description = "What do you know about this valley?";
};


func int dia_ocpal_9_location_condition()
{
	return TRUE;
};

func void dia_ocpal_9_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//What do you know about this valley?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//In the east, the orcs have built a huge protective wall - to protect their supplies, I suppose. Behind the wall, there's a place where they can dock their ships.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//I hope the orcs don't get their supplies too quickly. What we have to deal with NOW is enough for me.
};


instance DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_9_standard_condition;
	information = dia_ocpal_9_standard_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_ocpal_9_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_9_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//How are things?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//The dragons have attacked again! But Innos will protect us in battle. The creatures of Beliar will pay a high toll in blood!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//Dragon hunters! They should have sent us paladins!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Now that we're rid of those dragons, we can take care of the orcs!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//We need to get the ore onto the ship and then get the hell out of this accursed land.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Treason! The gate should never have been opened. Death to all traitors!
		};
	};
};

func void b_assignambientinfos_ocpal_9(var C_NPC slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

