
instance DIA_VLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_1_exit_condition;
	information = dia_vlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_1_exit_condition()
{
	return TRUE;
};

func void dia_vlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_1_join_condition;
	information = dia_vlk_1_join_info;
	permanent = TRUE;
	description = "How can I become a citizen of this town?";
};


func int dia_vlk_1_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_1_join_info()
{
	AI_Output(other,self,"DIA_VLK_1_JOIN_15_00");	//How can I become a citizen of this town?
	AI_Output(self,other,"DIA_VLK_1_JOIN_01_01");	//Go look for a decent job! Everyone who has a set occupation in Khorinis counts as a citizen of the town.
};


instance DIA_VLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_1_people_condition;
	information = dia_vlk_1_people_info;
	permanent = TRUE;
	description = "Who are the important figures around here?";
};


func int dia_vlk_1_people_condition()
{
	return TRUE;
};

func void dia_vlk_1_people_info()
{
	AI_Output(other,self,"DIA_VLK_1_PEOPLE_15_00");	//Who are the important figures around here?
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_01");	//(laughs) Up until recently, it was the governor and the judge. But then the paladins came and took over the city.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_02");	//Lord Hagen is their leader. He's the new governor, more or less.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_03");	//Lord Andre is his right hand man. He leads the city guard and acts a judge as well.
	AI_Output(self,other,"DIA_VLK_1_PEOPLE_01_04");	//Everyone in the city who is guilty of something has to answer to him.
};


instance DIA_VLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_1_location_condition;
	information = dia_vlk_1_location_info;
	permanent = TRUE;
	description = "What's interesting in this town?";
};


func int dia_vlk_1_location_condition()
{
	return TRUE;
};

func void dia_vlk_1_location_info()
{
	AI_Output(other,self,"DIA_VLK_1_LOCATION_15_00");	//What's interesting in this town?
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_01");	//You can buy almost everything you can imagine here. Either from the merchants in the marketplace, or in the lower part of the city.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_02");	//But almost everything that you can buy also costs a bit.
	AI_Output(self,other,"DIA_VLK_1_LOCATION_01_03");	//If you don't have enough money, then maybe Lehmar the moneylender can help you. His house is at the beginning of the harbor district as you come from the lower part of town.
};


instance DIA_VLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_1_standard_condition;
	information = dia_vlk_1_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_vlk_1_standard_condition()
{
	return TRUE;
};

func void dia_vlk_1_standard_info()
{
	AI_Output(other,self,"DIA_VLK_1_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_01");	//Since the collapse of the Barrier, open trade with the big farmer has abruptly stopped. Who knows what he's plotting. There's something fishy going on.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_02");	//Onar is going too far. He still isn't supplying the city. If the militia doesn't intervene soon, the other farmers will soon also do whatever they please.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_03");	//I've heard the bandits have joined forces with magicians. Powerful black magicians in black robes. I could swear that I saw one of them in the city last night.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_04");	//I've heard that some of Onar's mercenaries have set out to kill the dragons. Now they're finally doing something useful!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_1_STANDARD_01_05");	//They say the dragons have been defeated! Lord Hagen is gathering his men to drive the rest of the creatures out of the Valley of Mines.
	};
};

func void b_assignambientinfos_vlk_1(var C_NPC slf)
{
	dia_vlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

