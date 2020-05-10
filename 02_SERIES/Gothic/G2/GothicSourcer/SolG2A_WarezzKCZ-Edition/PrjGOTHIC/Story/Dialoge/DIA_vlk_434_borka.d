
instance DIA_BORKA_EXIT(C_INFO)
{
	npc = vlk_434_borka;
	nr = 999;
	condition = dia_borka_exit_condition;
	information = dia_borka_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_borka_exit_condition()
{
	return TRUE;
};

func void dia_borka_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_PICKPOCKET(C_INFO)
{
	npc = vlk_434_borka;
	nr = 900;
	condition = dia_borka_pickpocket_condition;
	information = dia_borka_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_borka_pickpocket_condition()
{
	return c_beklauen(80,120);
};

func void dia_borka_pickpocket_info()
{
	Info_ClearChoices(dia_borka_pickpocket);
	Info_AddChoice(dia_borka_pickpocket,DIALOG_BACK,dia_borka_pickpocket_back);
	Info_AddChoice(dia_borka_pickpocket,DIALOG_PICKPOCKET,dia_borka_pickpocket_doit);
};

func void dia_borka_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_borka_pickpocket);
};

func void dia_borka_pickpocket_back()
{
	Info_ClearChoices(dia_borka_pickpocket);
};


instance DIA_BORKA_PISSOFF(C_INFO)
{
	npc = vlk_434_borka;
	condition = dia_borka_pissoff_condition;
	information = dia_borka_pissoff_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_borka_pissoff_condition()
{
	if((KNOWS_BORKA_DEALER != TRUE) && (Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST))
	{
		return TRUE;
	};
};

func void dia_borka_pissoff_info()
{
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_00");	//Hey, you! Where are you going? No matter what your plans are - there'll be plenty of time later.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_01");	//You're right in front of the pearl of Khorinis - the RED LANTERN. This is the most beautiful brothel in all of Myrtana, damnit!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_02");	//Sailors from the most remote corners of the world dock here just to spend a few nights in the Red Lantern.
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_03");	//And now it's you who has the chance - nay, the honor - of spending a night with Nadja, the most passionate flower of the gods!
	AI_Output(self,other,"DIA_Borka_PISSOFF_11_04");	//Come on in and you're going to experience what others cannot even dream of!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_TROUBLE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 3;
	condition = dia_borka_trouble_condition;
	information = dia_borka_trouble_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_borka_trouble_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ANDRE_REDLIGHT != LOG_RUNNING) && (Npc_IsDead(nadja) == FALSE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_ENTRANCE") <= 500))
	{
		return TRUE;
	};
};

func void dia_borka_trouble_info()
{
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_00");	//What are you standing around for out here? Go on in and meet our passionate Nadja.
	AI_Output(self,other,"DIA_Borka_TROUBLE_11_01");	//This hot creature of the night will give your life a new meaning!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_SMOKE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 3;
	condition = dia_borka_smoke_condition;
	information = dia_borka_smoke_info;
	permanent = TRUE;
	description = "Do you know where I can buy some weed?";
};


func int dia_borka_smoke_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_smoke_info()
{
	AI_Output(other,self,"DIA_Borka_Smoke_15_00");	//Do you know where I could buy some weed?
	AI_Output(self,other,"DIA_Borka_Smoke_11_01");	//No, piss off!
	AI_StopProcessInfos(self);
};


instance DIA_BORKA_BUYHERB(C_INFO)
{
	npc = vlk_434_borka;
	nr = 2;
	condition = dia_borka_buyherb_condition;
	information = dia_borka_buyherb_info;
	permanent = TRUE;
	description = "I've heard you're selling weed.";
};


func int dia_borka_buyherb_condition()
{
	if((KNOWS_BORKA_DEALER == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (BORKA_DEAL == FALSE) && (UNDERCOVER_FAILED == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Borka_BUYHERB_15_00");	//I've heard you're selling weed.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_01");	//I'm sorry, Mr. City Guard, sir. There must have been a mistake. I know nothing about weed.
	}
	else
	{
		AI_Output(self,other,"DIA_Borka_BUYHERB_11_02");	//Says who?
		Info_ClearChoices(dia_borka_buyherb);
		Info_AddChoice(dia_borka_buyherb,"That's not important.",dia_borka_buyherb_egal);
		Info_AddChoice(dia_borka_buyherb,"Says Nadja.",dia_borka_buyherb_nadja);
	};
};

func void dia_borka_buyherb_egal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Egal_15_00");	//That is besides the point.
	AI_Output(self,other,"DIA_Borka_BUYHERB_Egal_11_01");	//I just want to know who sent you so I can be sure you're all right.
	Info_ClearChoices(dia_borka_buyherb);
	Info_AddChoice(dia_borka_buyherb,"Says Nadja.",dia_borka_buyherb_nadja);
	Info_AddChoice(dia_borka_buyherb,"So do you want to cut a deal, or not?",dia_borka_buyherb_deal);
};

func void dia_borka_buyherb_nadja()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_NADJA_15_00");	//Says Nadja.
	AI_Output(self,other,"DIA_Borka_BUYHERB_NADJA_11_01");	//What do you know, the little bird has sung. You know, you shouldn't believe everything this gal tells you.
	NADJA_VICTIM = TRUE;
	UNDERCOVER_FAILED = TRUE;
	Info_ClearChoices(dia_borka_buyherb);
};

func void dia_borka_buyherb_deal()
{
	AI_Output(other,self,"DIA_Borka_BUYHERB_Deal_15_00");	//So do you want to cut a deal, or not?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_BUYHERB_Deal_11_01");	//... all right... let's make a deal. You give me 50 gold pieces, and then you'll get your weed. No haggling.
	Info_ClearChoices(dia_borka_buyherb);
	BORKA_DEAL = TRUE;
};


instance DIA_BORKA_SECOND_CHANCE(C_INFO)
{
	npc = vlk_434_borka;
	nr = 2;
	condition = dia_borka_second_chance_condition;
	information = dia_borka_second_chance_info;
	permanent = TRUE;
	description = "Let's make a deal (pay 50 gold).";
};


func int dia_borka_second_chance_condition()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((BORKA_DEAL == TRUE) && (Npc_HasItems(other,itmi_gold) >= 50) && (Hlp_IsItem(heroarmor,itar_mil_l) == FALSE))
	{
		return TRUE;
	};
};

func void dia_borka_second_chance_info()
{
	AI_Output(other,self,"DIA_Borka_SECOND_CHANCE_15_00");	//Let's make a deal. Here's the gold.
	b_giveinvitems(hero,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_01");	//All right...
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Borka_SECOND_CHANCE_11_02");	//... here's a fresh, resinous stalk of weed.
	b_giveinvitems(self,hero,itmi_joint,1);
	BORKA_DEAL = 2;
	AI_StopProcessInfos(self);
};

