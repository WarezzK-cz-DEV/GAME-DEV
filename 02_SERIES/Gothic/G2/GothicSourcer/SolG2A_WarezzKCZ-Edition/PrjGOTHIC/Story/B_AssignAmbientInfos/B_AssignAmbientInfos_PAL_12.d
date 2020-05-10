
instance DIA_PAL_12_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_12_exit_condition;
	information = dia_pal_12_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_12_exit_condition()
{
	return TRUE;
};

func void dia_pal_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_12_join_condition;
	information = dia_pal_12_join_info;
	permanent = TRUE;
	description = "I want to become a paladin!";
};


func int dia_pal_12_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_12_join_info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//I want to become a paladin!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//You? Don't make me laugh! You're not even a member of the city guard.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//If I couldn't plainly see what a dense yokel you are, I'd think you were trying to insult me.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Only the best of the best among the faithful followers of the king and our Lord Innos are accepted as paladins.
};


instance DIA_PAL_12_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_12_people_condition;
	information = dia_pal_12_people_info;
	permanent = TRUE;
	description = "Who's in command here?";
};


func int dia_pal_12_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_12_people_info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Who's in command here?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//The honorable Lord Hagen. But Lord Andre is responsible for all the matters concerning the simple folk.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//You'll find him in the barracks. Maybe you'll get lucky and he'll devote a few minutes of his valuable time to you.
};


instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_12_location_condition;
	information = dia_pal_12_location_info;
	permanent = TRUE;
	description = "What are you paladins doing here in Khorinis?";
};


func int dia_pal_12_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_12_location_info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//What are you paladins doing here in Khorinis?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//People who ask questions like that wind up on the gallows before they know it.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//If there's ONE thing Lord Andre cannot afford, it's having knowledge of our mission falling into the hands of spies.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//So, you'd better watch out what you ask.
};


instance DIA_PAL_12_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_12_standard_condition;
	information = dia_pal_12_standard_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_pal_12_standard_condition()
{
	return TRUE;
};

func void dia_pal_12_standard_info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//How are things?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Now that we know we're dealing with dragons, our commander will surely do something soon.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//We still don't have any news from our detachment in the Valley of Mines. That is very disturbing.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Thanks be to Innos! The threat of the dragons has been averted. Now we only have to deal with the orcs to get to the ore.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//You don't seriously expect me to answer that question, boy!
	};
};

func void b_assignambientinfos_pal_12(var C_NPC slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

