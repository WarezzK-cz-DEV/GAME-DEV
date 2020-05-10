
instance DIA_RANGAR_EXIT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 999;
	condition = dia_rangar_exit_condition;
	information = dia_rangar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rangar_exit_condition()
{
	return TRUE;
};

func void dia_rangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RANGAR_PICKPOCKET(C_INFO)
{
	npc = mil_321_rangar;
	nr = 900;
	condition = dia_rangar_pickpocket_condition;
	information = dia_rangar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_KEY;
};


func int dia_rangar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_rangar_pickpocket_info()
{
	Info_ClearChoices(dia_rangar_pickpocket);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_BACK,dia_rangar_pickpocket_back);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_PICKPOCKET,dia_rangar_pickpocket_doit);
};

func void dia_rangar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_city_tower_02,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_rangar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_rangar_pickpocket_back()
{
	Info_ClearChoices(dia_rangar_pickpocket);
};


instance DIA_RANGAR_HALLO(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_rangar_hallo_condition;
	information = dia_rangar_hallo_info;
	permanent = FALSE;
	description = "Hey, what's up?";
};


func int dia_rangar_hallo_condition()
{
	if(((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_hallo_info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//Hey, what's up?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//As long as the paladins don't have any new assignments for me, I can have myself a couple of beers here. What more could you ask? (grins)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//You're working for the paladins?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//Yeah, I report to them on the situation in the city. At the moment, everything is quiet.
};


instance DIA_RANGAR_ORK(C_INFO)
{
	npc = mil_321_rangar;
	nr = 3;
	condition = dia_rangar_ork_condition;
	information = dia_rangar_ork_info;
	permanent = FALSE;
	description = "How are things with the orcs?";
};


func int dia_rangar_ork_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_ork_info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//How are things with the orcs?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//No reason to worry - we in the city guard and the paladins have everything under control.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//Go home and let us do our work. We're watching over the town and its citizens. -HIC-
};


instance DIA_RANGAR_BIER(C_INFO)
{
	npc = mil_321_rangar;
	nr = 4;
	condition = dia_rangar_bier_condition;
	information = dia_rangar_bier_info;
	permanent = TRUE;
	description = "Would you like another beer?";
};


func int dia_rangar_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo) && ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) == FALSE) && ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03") < 500) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rangar_bier_info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//Would you like another beer?
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		if(KNOWS_PALADINS == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//Ah - there's nothing better than a cool ale.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//You were about to say something about the orcs...
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//Oh, yeah, right. The orcs are absolutely no threat to the city.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//They're stuck in the Valley of Mines. And the pass is held by the paladins.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//Not even a meatbug could get through there.
			KNOWS_PALADINS = 1;
			Info_ClearChoices(dia_rangar_bier);
		}
		else if((KNOWS_PALADINS == 1) && (KNOWS_ORK == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//I won't say no to a decent pint.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//They've even spotted an orc outside of town.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//Yeah, right, the dangerous orc outside the city. A real monster of an orc. He's bound to attack the city soon.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//Listen, we'll kick that fat orc in his fat ass if he comes too close to the city. Got it?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//I see.
			KNOWS_PALADINS = 2;
			Info_ClearChoices(dia_rangar_bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//A tasty bitter ale is absolutely the best.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//You know, you don't often meet someone who'll treat you to a beer. You're all right.
			Info_ClearChoices(dia_rangar_bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//Sure I want another beer. Get me one.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_RANGAR_ERWISCHT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 5;
	condition = dia_addon_rangar_erwischt_condition;
	information = dia_addon_rangar_erwischt_info;
	description = "What are you doing there?";
};


var int dia_addon_rangar_erwischt_onetime;

func int dia_addon_rangar_erwischt_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15") < 500) && (DIA_ADDON_RANGAR_ERWISCHT_ONETIME == FALSE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_erwischt_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_00");	//What are you doing there?
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_01");	//(feeling caught) Uuhm. I... Er... It's none of your business. Get lost.
	AI_Output(other,self,"DIA_Addon_Rangar_Erwischt_15_02");	//Martin will be so happy when I tell him who's rummaging through his belongings while he's gone.
	AI_Output(self,other,"DIA_Addon_Rangar_Erwischt_07_03");	//(scornfully) You do whatever you want. I'll be on my way then, little man.
	b_giveplayerxp(XP_ADDON_MARTIN_GOTRANGAR);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	SC_GOTRANGAR = TRUE;
};


instance DIA_ADDON_RANGAR_NACHHAKEN(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_addon_rangar_nachhaken_condition;
	information = dia_addon_rangar_nachhaken_info;
	permanent = TRUE;
	description = "Do you really think you're going to get away with this?";
};


func int dia_addon_rangar_nachhaken_condition()
{
	if((SC_GOTRANGAR == TRUE) && (MIS_ADDON_MARTIN_GETRANGAR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_rangar_nachhaken_info()
{
	AI_Output(other,self,"DIA_Addon_Rangar_nachhaken_15_00");	//Do you really think you're going to get away with this?
	AI_Output(self,other,"DIA_Addon_Rangar_nachhaken_07_01");	//(indifferently) Don't make such a fuss about a little bit of grub.
};

