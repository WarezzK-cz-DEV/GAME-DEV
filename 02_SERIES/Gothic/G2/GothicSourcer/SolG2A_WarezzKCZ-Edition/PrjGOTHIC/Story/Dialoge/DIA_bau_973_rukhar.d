
instance DIA_RUKHAR_EXIT(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 999;
	condition = dia_rukhar_exit_condition;
	information = dia_rukhar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rukhar_exit_condition()
{
	return TRUE;
};

func void dia_rukhar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HALLO(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 4;
	condition = dia_rukhar_hallo_condition;
	information = dia_rukhar_hallo_info;
	description = "Is the beer any good here?";
};


func int dia_rukhar_hallo_condition()
{
	return TRUE;
};

func void dia_rukhar_hallo_info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//Is the beer any good here?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//It's not exactly the best, but in these bleak times, you can't be choosy.
};


instance DIA_RUKHAR_WASMACHSTDU(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 5;
	condition = dia_rukhar_wasmachstdu_condition;
	information = dia_rukhar_wasmachstdu_info;
	description = "What are you doing here?";
};


func int dia_rukhar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_hallo))
	{
		return TRUE;
	};
};

func void dia_rukhar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//Up until a few weeks ago, I was slaving away on the landowner's fields.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//One day it just got too much for me, and I took myself out of there straight away.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//Now I'm my own boss. Everything I own is in this chest here. And that's all I need, too.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//Interested in a little contest?
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"There are bets on at the tavern.");
};


instance DIA_RUKHAR_WETTKAMPF(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_wettkampf_condition;
	information = dia_rukhar_wettkampf_info;
	description = "What kind of a contest would that be?";
};


func int dia_rukhar_wettkampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_wettkampf_info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//What kind of a contest would that be?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//I call it BOTTOM'S UP.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//The rules are quite simple.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//We take turns ordering a tankard of the best beer the old geezer has to offer.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//Every tankard has to be drunk dry, so that it doesn't even leave a ring if you set it on the table upside down .
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//The last man standing wins. The loser pays the tab and a stake. Well? How about it?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//Maybe some other time, when I'm not in a hurry.
};


instance DIA_RUKHAR_HOLERANDOLPH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_holerandolph_condition;
	information = dia_rukhar_holerandolph_info;
	description = "Could I bet on somebody else, though?";
};


func int dia_rukhar_holerandolph_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wettkampf))
	{
		return TRUE;
	};
};

func void dia_rukhar_holerandolph_info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//Could I bet on somebody else, though?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//Certainly. If you finally manage to find someone with the guts to go up against me, then I'll bet with you.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//Everybody pays the same amount into a pot. The winner gets everything. The size of the stake depends on your purse.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//Bring me someone who dares to go up against me and you've got a bet.
	b_logentry(TOPIC_WETTSAUFEN,"Rukhar calls his little game BOTTOMS UP. No thanks, I'm not interested. I'll find someone else for him to make a fool of.");
};


instance DIA_RUKHAR_RANDOLPHWILL(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_randolphwill_condition;
	information = dia_rukhar_randolphwill_info;
	permanent = TRUE;
	description = "I've got somebody who wants to compete against you.";
};


var int dia_rukhar_randolphwill_noperm;

func int dia_rukhar_randolphwill_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && Npc_KnowsInfo(other,dia_rukhar_holerandolph) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_rukhar_randolphwill_info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//I've got somebody who wants to compete against you.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//Who might that be?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//Randolph.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//Ho ho. Randolph the braggart? All right. Why not.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//Send the wimp to me, and the deal stands.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//You can pick him up again no more than 2 days later. Who knows? Maybe you'll get lucky and he'll be able to stand by then.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//How big is your bet?
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nothing.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 gold coins.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_annehmen()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//I'll take your bet and hold it until the contest is over, all right?
	DIA_RUKHAR_RANDOLPHWILL_NOPERM = TRUE;
};

func void dia_rukhar_randolphwill_mehr()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Nothing.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100 gold coins.",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50 gold coins.",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20 gold coins.",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 gold coins.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Nothing.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//Then we might as well forget the whole thing.
	AI_StopProcessInfos(self);
};

func void dia_rukhar_randolphwill_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 gold coins.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//Come on, you can't be serious. A few more coins won't kill you.
	RUKHAR_EINSATZ = 10;
	RUKHAR_GEWINN = 20;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(select another stake)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(accept stake)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//If you want to bet, then kindly do it right.
	RUKHAR_EINSATZ = 20;
	RUKHAR_GEWINN = 40;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(select another stake)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(accept stake)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//Not so timid. Be daring.
	RUKHAR_EINSATZ = 50;
	RUKHAR_GEWINN = 100;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(select another stake)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(accept stake)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//That's what I like to hear.
	RUKHAR_EINSATZ = 100;
	RUKHAR_GEWINN = 200;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(select another stake)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(accept stake)",dia_rukhar_randolphwill_annehmen);
};


instance DIA_RUKHAR_ICHSEHEDICH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_ichsehedich_condition;
	information = dia_rukhar_ichsehedich_info;
	permanent = TRUE;
	description = "Here's my stake.";
};


var int dia_rukhar_ichsehedich_noperm;

func int dia_rukhar_ichsehedich_condition()
{
	if((DIA_RUKHAR_ICHSEHEDICH_NOPERM == FALSE) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == TRUE) && (RUKHAR_EINSATZ != 0))
	{
		return TRUE;
	};
};

func void dia_rukhar_ichsehedich_info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//Here's my stake.
	if(b_giveinvitems(other,self,itmi_gold,RUKHAR_EINSATZ))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//All right. Don't take too long bringing Randolph here, you hear?
		DIA_RUKHAR_ICHSEHEDICH_NOPERM = TRUE;
		MIS_RUKHAR_WETTKAMPF = LOG_RUNNING;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//Very funny. Come back when you have enough money.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_GELDZURUECK(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_geldzurueck_condition;
	information = dia_rukhar_geldzurueck_info;
	permanent = TRUE;
	description = "I want my money back.";
};


func int dia_rukhar_geldzurueck_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == TRUE))
	{
		return TRUE;
	};
};

func void dia_rukhar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//I want my money back.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//Gambling debts are debts of honor, pal. You should have thought it over before.
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HAENSELN(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_haenseln_condition;
	information = dia_rukhar_haenseln_info;
	permanent = TRUE;
	description = "You seem to have bitten off more than you can chew.";
};


func int dia_rukhar_haenseln_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == FALSE))
	{
		return TRUE;
	};
};


var int dia_rukhar_haenseln_nureimalgeld;

func void dia_rukhar_haenseln_info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//You seem to have bitten off more than you can chew.
	if(DIA_RUKHAR_HAENSELN_NUREIMALGELD == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//Here's your money and not one word more.
		b_giveplayerxp(XP_RUKHAR_LOST);
		IntToFloat(RUKHAR_GEWINN);
		CreateInvItems(self,itmi_gold,RUKHAR_GEWINN);
		b_giveinvitems(self,other,itmi_gold,RUKHAR_GEWINN);
		DIA_RUKHAR_HAENSELN_NUREIMALGELD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//I'll get even with you, you can count on it.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_PERM(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 7;
	condition = dia_rukhar_perm_condition;
	information = dia_rukhar_perm_info;
	permanent = TRUE;
	description = "Did anything else of interest happen?";
};


func int dia_rukhar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_perm_info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//Did anything else of interest happen?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//Not that I know of. Nobody tells me anything.
};


instance DIA_RUKHAR_PICKPOCKET(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 900;
	condition = dia_rukhar_pickpocket_condition;
	information = dia_rukhar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rukhar_pickpocket_condition()
{
	return c_beklauen(26,30);
};

func void dia_rukhar_pickpocket_info()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_BACK,dia_rukhar_pickpocket_back);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_PICKPOCKET,dia_rukhar_pickpocket_doit);
};

func void dia_rukhar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rukhar_pickpocket);
};

func void dia_rukhar_pickpocket_back()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
};

