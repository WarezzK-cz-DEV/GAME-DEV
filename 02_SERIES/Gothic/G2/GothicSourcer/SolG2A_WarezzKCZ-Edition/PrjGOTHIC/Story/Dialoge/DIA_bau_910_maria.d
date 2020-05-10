
instance DIA_MARIA_EXIT(C_INFO)
{
	npc = bau_910_maria;
	nr = 999;
	condition = dia_maria_exit_condition;
	information = dia_maria_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maria_exit_condition()
{
	return TRUE;
};

func void dia_maria_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARIA_HALLO(C_INFO)
{
	npc = bau_910_maria;
	nr = 1;
	condition = dia_maria_hallo_condition;
	information = dia_maria_hallo_info;
	permanent = FALSE;
	description = "Who are you?";
};


func int dia_maria_hallo_condition()
{
	return TRUE;
};

func void dia_maria_hallo_info()
{
	AI_Output(other,self,"DIA_Maria_Hallo_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Maria_Hallo_17_01");	//I am Onar's wife, Maria.
	AI_Output(self,other,"DIA_Maria_Hallo_17_02");	//What do you want here?
};


instance DIA_MARIA_UMSEHEN(C_INFO)
{
	npc = bau_910_maria;
	nr = 2;
	condition = dia_maria_umsehen_condition;
	information = dia_maria_umsehen_info;
	permanent = FALSE;
	description = "I just wanted to have a look around here...";
};


func int dia_maria_umsehen_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_umsehen_info()
{
	AI_Output(other,self,"DIA_Maria_Umsehen_15_00");	//I just wanted to have a look around here...
	AI_Output(self,other,"DIA_Maria_Umsehen_17_01");	//With all these men on the farm now, there's no peace to be had inside the house.
	AI_Output(self,other,"DIA_Maria_Umsehen_17_02");	//They just keep barging in here.
};


instance DIA_MARIA_SOELDNER(C_INFO)
{
	npc = bau_910_maria;
	nr = 3;
	condition = dia_maria_soeldner_condition;
	information = dia_maria_soeldner_info;
	permanent = FALSE;
	description = "Do the mercenaries bother you?";
};


func int dia_maria_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_umsehen))
	{
		return TRUE;
	};
};

func void dia_maria_soeldner_info()
{
	AI_Output(other,self,"DIA_Maria_Soeldner_15_00");	//Do the mercenaries bother you?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_01");	//Oh well, forget what I just said - it's been a lot safer here since you guys showed up.
	}
	else
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_02");	//Oh well, at least the farm has been a lot safer since the mercenaries came.
	};
	AI_Output(self,other,"DIA_Maria_Soeldner_17_03");	//Back when we were still on our own, the militia came from town all the time to plunder our provisions.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_04");	//They dragged off the better part of the harvest. And they took some sheep, too. They did nothing for us in return.
	AI_Output(self,other,"DIA_Maria_Soeldner_17_05");	//A few of those scoundrels even stole from us.
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Soeldner_17_06");	//Don't get me wrong now, soldier. I know that not all of you are like that.
	};
};


instance DIA_MARIA_MISSION(C_INFO)
{
	npc = bau_910_maria;
	nr = 4;
	condition = dia_maria_mission_condition;
	information = dia_maria_mission_info;
	permanent = FALSE;
	description = "So what did they steal from you?";
};


func int dia_maria_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_soeldner) && (MIS_MARIA_BRINGPLATE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maria_mission_info()
{
	AI_Output(other,self,"DIA_Maria_Mission_15_00");	//So what did they steal from you?
	AI_Output(self,other,"DIA_Maria_Mission_17_01");	//Mostly gold and silver. They even took my wedding present. A golden plate.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Maria_Mission_17_02");	//I bet it's now gathering dust in the chest of some filthy city guard.
	};
	MIS_MARIA_BRINGPLATE = LOG_RUNNING;
};


instance DIA_MARIA_BRINGPLATE(C_INFO)
{
	npc = bau_910_maria;
	nr = 5;
	condition = dia_maria_bringplate_condition;
	information = dia_maria_bringplate_info;
	permanent = FALSE;
	description = "I have a golden plate here. Would this be yours?";
};


func int dia_maria_bringplate_condition()
{
	if(Npc_HasItems(other,itmi_mariasgoldplate) > 0)
	{
		return TRUE;
	};
};

func void dia_maria_bringplate_info()
{
	b_giveinvitems(other,self,itmi_mariasgoldplate,1);
	AI_Output(other,self,"DIA_Maria_BringPlate_15_00");	//I have a golden plate here. Would this be yours?
	AI_Output(self,other,"DIA_Maria_BringPlate_17_01");	//Yes! That is it! Thanks a million!
	MIS_MARIA_BRINGPLATE = LOG_SUCCESS;
	b_giveplayerxp(XP_MARIA_TELLER);
};


var int maria_belohnung;

instance DIA_MARIA_BELOHNUNG(C_INFO)
{
	npc = bau_910_maria;
	nr = 6;
	condition = dia_maria_belohnung_condition;
	information = dia_maria_belohnung_info;
	permanent = TRUE;
	description = "So what about my reward?";
};


func int dia_maria_belohnung_condition()
{
	if((MIS_MARIA_BRINGPLATE == LOG_SUCCESS) && (MARIA_BELOHNUNG == FALSE))
	{
		return TRUE;
	};
};

func void dia_maria_belohnung_info()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_15_00");	//So what about my reward?
	if((other.guild == GIL_SLD) || Npc_KnowsInfo(other,dia_onar_howmuch))
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_01");	//You're working for my husband as a mercenary, aren't you?
		AI_Output(other,self,"DIA_Maria_Belohnung_15_02");	//Right.
		AI_Output(self,other,"DIA_Maria_Belohnung_17_03");	//How much is my husband paying you?
		b_say_gold(other,self,SOLD);
		AI_Output(self,other,"DIA_Maria_Belohnung_17_04");	//That's not enough. Go to him and tell him to pay you more.
		AI_Output(other,self,"DIA_Maria_Belohnung_15_05");	//And you think he'll do that?
		AI_Output(self,other,"DIA_Maria_Belohnung_17_06");	//He knows what happens if he doesn't. Believe me.
		MARIA_MEHRGOLD = TRUE;
		MARIA_BELOHNUNG = TRUE;
	}
	else if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Maria_Belohnung_17_07");	//Do you want to hire on as a mercenary here on the farm?
		Info_ClearChoices(dia_maria_belohnung);
		Info_AddChoice(dia_maria_belohnung,"No - not really.",dia_maria_belohnung_gold);
		Info_AddChoice(dia_maria_belohnung,"Yes.",dia_maria_belohnung_sold);
	}
	else
	{
		b_giveinvitems(self,other,itmi_gold,50);
		MARIA_BELOHNUNG = TRUE;
		AI_Output(self,other,"DIA_Maria_Belohnung_17_08");	//Here, take this. You deserve it.
	};
};

func void dia_maria_belohnung_gold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_Gold_15_00");	//No - not really.
	b_giveinvitems(self,other,itmi_gold,50);
	MARIA_BELOHNUNG = TRUE;
	AI_Output(self,other,"DIA_Maria_Belohnung_Gold_17_01");	//Then take this gold as a reward. You've earned it.
	Info_ClearChoices(dia_maria_belohnung);
};

func void dia_maria_belohnung_sold()
{
	AI_Output(other,self,"DIA_Maria_Belohnung_SOLD_15_00");	//Yes.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_01");	//All right, if you work here, then I shall see to it that you're getting a decent pay.
	AI_Output(self,other,"DIA_Maria_Belohnung_SOLD_17_02");	//Come back when you have discussed your pay with my husband.
	Info_ClearChoices(dia_maria_belohnung);
};


instance DIA_MARIA_ABOUTONAR(C_INFO)
{
	npc = bau_910_maria;
	nr = 7;
	condition = dia_maria_aboutonar_condition;
	information = dia_maria_aboutonar_info;
	permanent = FALSE;
	description = "Tell me about Onar.";
};


func int dia_maria_aboutonar_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_aboutonar_info()
{
	AI_Output(other,self,"DIA_Maria_AboutOnar_15_00");	//Tell me about Onar.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_01");	//He's a good man. A little grumpy and very impatient, but we've all got our faults.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_02");	//I told my husband, why do you let the soldiers from the city treat you like that?
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_03");	//Do something, I said.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_04");	//So he hired the mercenaries. Now I feel like I'm in the middle of a war.
	AI_Output(self,other,"DIA_Maria_AboutOnar_17_05");	//But then, we ARE at war, aren't we?
};


instance DIA_MARIA_PERM(C_INFO)
{
	npc = bau_910_maria;
	nr = 8;
	condition = dia_maria_perm_condition;
	information = dia_maria_perm_info;
	permanent = FALSE;
	description = "Has anything exciting happened here lately?";
};


func int dia_maria_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_maria_hallo))
	{
		return TRUE;
	};
};

func void dia_maria_perm_info()
{
	AI_Output(other,self,"DIA_Maria_PERM_15_00");	//Has anything exciting happened here lately?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_01");	//The paladins passed by here.
		AI_Output(self,other,"DIA_Maria_PERM_17_02");	//At first we thought they were going to attack the farm, but the were headed for the Valley of Mines.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_03");	//Wasili chased off a thief a few nights ago. Apart from that, everything's been quiet.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Maria_PERM_17_04");	//It's been a lot quieter here since some of the mercenaries left.
	};
};


instance DIA_MARIA_PICKPOCKET(C_INFO)
{
	npc = bau_910_maria;
	nr = 900;
	condition = dia_maria_pickpocket_condition;
	information = dia_maria_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_maria_pickpocket_condition()
{
	return c_beklauen(60,110);
};

func void dia_maria_pickpocket_info()
{
	Info_ClearChoices(dia_maria_pickpocket);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_BACK,dia_maria_pickpocket_back);
	Info_AddChoice(dia_maria_pickpocket,DIALOG_PICKPOCKET,dia_maria_pickpocket_doit);
};

func void dia_maria_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maria_pickpocket);
};

func void dia_maria_pickpocket_back()
{
	Info_ClearChoices(dia_maria_pickpocket);
};

