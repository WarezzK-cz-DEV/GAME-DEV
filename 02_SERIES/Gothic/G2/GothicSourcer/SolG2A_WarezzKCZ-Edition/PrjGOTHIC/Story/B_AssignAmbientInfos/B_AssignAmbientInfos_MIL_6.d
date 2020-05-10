
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "What do I have to do to join the militia?";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//What do I have to do to join the militia?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Go to Lord Andre and talk to him. Since the paladins have come to town, he's had the command over the entire militia.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//You can find him in the barracks. He's practically always there.
	};
};


instance DIA_ADDON_MIL_6_MISSINGPEOPLE(C_INFO)
{
	nr = 2;
	condition = dia_addon_mil_6_missingpeople_condition;
	information = dia_addon_mil_6_missingpeople_info;
	permanent = TRUE;
	description = "I heard some citizens have disappeared.";
};


func int dia_addon_mil_6_missingpeople_condition()
{
	if((KAPITEL == 1) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_6_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_MIL_6_MissingPeople_15_00");	//I heard some citizens have disappeared.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_01");	//I've actually heard quite a few rumors of missing people lately.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_02");	//I can't for the life of me explain it.
	AI_Output(self,other,"DIA_Addon_MIL_6_MissingPeople_06_03");	//But we can't do more than keep our eyes open and do our sentry duty.
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "Tell me about these paladins.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//Tell me about these paladins.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//Since the paladins have arrived in Khorinis, they have retreated to the upper end of town.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//They're not letting anyone in there any more. Except for the citizens of the town and the militia, of course.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//There are also some paladins who guard the ship down at the harbor. But those are far from talkative.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "What is there to know about this town?";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//What is there to know about this town?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//The paladins now have control over the whole city. The entire militia reports to them.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Lord Andre is commander of the militia - at the same time, he acts as the judge.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//If you should ever run afoul of the law, you'll have to justify yourself to him.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//But he is pretty lenient for all one hears. He usually lets people get away with a fine.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//More and more riffraff have been pouring into town lately.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Thefts are on the rise, and Lord Andre suspects that it's the work of a gang.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Not long ago, we turned the entire harbor district upside down, but we still haven't found a thing.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//It looks like we now have the bandit problem more or less under control. The raids have all but died off lately.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//It's getting worse and worse, what with all that riffraff coming to town. Last night I trailed a man in a black robe through the upper end of town.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//I'm sure he was up to no good. But when I followed him around the governor's house, he had simply disappeared. A strange character, that was...
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//They say that Lord Hagen has hired mercenaries to fight against the dragons. I'm fine with that, I wouldn't want to fight a dragon myself.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//They say the dragons have been vanquished! Lord Hagen is collecting his forces to drive the remaining creatures from the Valley of Mines as well.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

