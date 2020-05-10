
instance DIA_BAU_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_1_exit_condition;
	information = dia_bau_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_1_exit_condition()
{
	return TRUE;
};

func void dia_bau_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_1_join_condition;
	information = dia_bau_1_join_info;
	permanent = TRUE;
	description = "Tell me more about those mercenaries.";
};


func int dia_bau_1_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_1_join_info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//Tell me more about those mercenaries.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//I can only advise you to give them a wide berth.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//If one of them doesn't like your face, he just might punch you in the nose.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//You can complain to Lee afterwards, but your nose will still be broken.
};


instance DIA_BAU_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_1_people_condition;
	information = dia_bau_1_people_info;
	permanent = TRUE;
	description = "Who's in charge here?";
};


func int dia_bau_1_people_condition()
{
	return TRUE;
};

func void dia_bau_1_people_info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Who's in charge here?
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//This is Onar's farm. He makes all the decisions around here.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Let me give you a tip: don't pick a fight with his mercenaries. The boys aren't to be trifled with.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Sylvio in particular is an underhanded rogue. But their leader, Lee, is all right.
};


instance DIA_BAU_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_1_location_condition;
	information = dia_bau_1_location_info;
	permanent = TRUE;
	description = "So what is there here in this area?";
};


func int dia_bau_1_location_condition()
{
	return TRUE;
};

func void dia_bau_1_location_info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//So what is there here in this area?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Just fields and farms. And a bunch of mercenaries. But almost all of them are in the east on Onar's farm.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//To the north is Sekob's farm, but they only go there to collect the rent.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//To the southwest is the path to Bengar's farm.
};


instance DIA_BAU_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_1_standard_condition;
	information = dia_bau_1_standard_info;
	permanent = TRUE;
	description = "What's new?";
};


func int dia_bau_1_standard_condition()
{
	return TRUE;
};

func void dia_bau_1_standard_info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//What's new?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Onar has hired mercenaries to keep the militia from the city off his back. Otherwise, they would even take our last sheep!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Not much. It's always the same problems. Militia, orcs, and field raiders.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Strange things are going on here. A few nights ago I saw a black figure. It wasn't human.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//You see orcs more and more often. Sometimes I think two new orcs show up for every dead one.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_05");	//The paladins are going into the Valley of Mines. What's it all about? There won't be anyone left to hold back the militia.
	};
};

func void b_assignambientinfos_bau_1(var C_NPC slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

