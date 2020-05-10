
instance DIA_KJORN_EXIT(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 999;
	condition = dia_kjorn_exit_condition;
	information = dia_kjorn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kjorn_exit_condition()
{
	return TRUE;
};

func void dia_kjorn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KJORN_HELLO(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_hello_condition;
	information = dia_kjorn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kjorn_hello_condition()
{
	if(Npc_GetDistToNpc(self,hero) < 300)
	{
		return TRUE;
	};
};

func void dia_kjorn_hello_info()
{
	AI_Output(self,other,"DIA_Kjorn_Hello_06_00");	//Hey, come over here!
	AI_Output(other,self,"DIA_Kjorn_Hello_15_01");	//What do you want?
	AI_Output(self,other,"DIA_Kjorn_Hello_06_02");	//This valley is a dangerous place, and without the right equipment you'll find yourself dead in no time.
	AI_Output(other,self,"DIA_Kjorn_Hello_15_03");	//I assume that YOU've got the right equipment.
	AI_Output(self,other,"DIA_Kjorn_Hello_06_04");	//You guessed it. I might even sell it to you.
};


instance DIA_KJORN_TRADE(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 4;
	condition = dia_kjorn_trade_condition;
	information = dia_kjorn_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "What can you offer me?";
};


func int dia_kjorn_trade_condition()
{
	return TRUE;
};

func void dia_kjorn_trade_info()
{
	AI_Output(other,self,"DIA_Kjorn_TRADE_15_00");	//What can you offer me?
	b_givetradeinv(self);
};


instance DIA_KJORN_SELLINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_sellinfos_condition;
	information = dia_kjorn_sellinfos_info;
	permanent = FALSE;
	description = "Do you sell information as well?";
};


func int dia_kjorn_sellinfos_condition()
{
	return TRUE;
};

func void dia_kjorn_sellinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_00");	//Do you sell information as well?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_01");	//That depends. If the price is right, I'll tell you everything I know.
	AI_Output(other,self,"DIA_Kjorn_SellInfos_15_02");	//How much do you charge?
	AI_Output(self,other,"DIA_Kjorn_SellInfos_06_03");	//Hmm... hard to say. But I think that 50 gold pieces for every piece of information I give you sounds about right.
};


instance DIA_KJORN_BUYINFOS(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_buyinfos_condition;
	information = dia_kjorn_buyinfos_info;
	permanent = TRUE;
	description = "I need some information.";
};


func int dia_kjorn_buyinfos_condition()
{
	if(Npc_KnowsInfo(other,dia_kjorn_sellinfos))
	{
		return TRUE;
	};
};

func void dia_kjorn_buyinfos_info()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_15_00");	//I need some information.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_06_01");	//50 gold pieces!
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,"That's too expensive for me.",dia_kjorn_buyinfos_holdmoney);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"Yes, here.",dia_kjorn_buyinfos_givemoney);
	};
};

func void dia_kjorn_buyinfos_holdmoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_HoldMoney_15_00");	//That's too expensive for me.
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_givemoney()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_00");	//Yes, here.
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_GiveMoney_15_01");	//Now tell me...
	Info_ClearChoices(dia_kjorn_buyinfos);
	Info_AddChoice(dia_kjorn_buyinfos,DIALOG_BACK,dia_kjorn_buyinfos_back);
	if(KJORNTOLDDRAGON == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... about the dragons.",dia_kjorn_buyinfos_dragon1);
	}
	else if(KJORNTOLDDRAGON == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... more about the dragons.",dia_kjorn_buyinfos_dragon2);
	};
	if(KJORNTOLDCOLONY == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... about the Valley of Mines.",dia_kjorn_buyinfos_colony1);
	}
	else if(KJORNTOLDCOLONY == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... more about the Valley of Mines.",dia_kjorn_buyinfos_colony2);
	};
	if(KJORNTOLDOLDCAMP == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... about the castle.",dia_kjorn_buyinfos_oldcamp1);
	};
	if(KJORNTOLDORKS == 0)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... about the orcs.",dia_kjorn_buyinfos_orks1);
	}
	else if(KJORNTOLDORKS == 1)
	{
		Info_AddChoice(dia_kjorn_buyinfos,"... more about the orcs.",dia_kjorn_buyinfos_orks2);
	};
};

func void dia_kjorn_buyinfos_back()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Back_15_00");	//You know, just give me back my money, I changed my mind.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Back_06_01");	//Suit yourself.
	b_giveinvitems(self,other,itmi_gold,50);
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon1_15_00");	//Tell me about the dragons.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_01");	//Dragons are ancient, incredibly powerful creatures. Once there were thousands of them living all over the world.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_02");	//It's been over a hundred years, though, that any of them were seen.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon1_06_03");	//Their blood is as hot as boiling oil. If they look into your eyes, your heart will turn to stone. So I've heard...
	KJORNTOLDDRAGON = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_dragon2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Dragon2_15_00");	//Tell me more about the dragons.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_01");	//But all dragons are not alike.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_02");	//Some of them could cover the entire land with a layer of ice several feet thick.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Dragon2_06_03");	//Others prefer living in swampy surroundings, or in volcanoes.
	b_logentry(TOPIC_DRACHENJAGD,"Kjorn the Dragon hunter thinks there are different kinds of dragons. Some supposedly prefer cold, damp places, others seem to like fire better.");
	KJORNTOLDDRAGON = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony1_15_00");	//Tell me about the Valley of Mines.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_01");	//The Valley of Mines of Khorinis is known all over the country for its magic ore.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_02");	//These mountains are the only place where the magic ore can be found.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_03");	//A weapon forged from this ore is virtually unbreakable and will cut through the strongest armor.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony1_06_04");	//Until a few weeks ago, the entire valley was surrounded by a magic barrier. It was impenetrable, and nobody could get out.
	KJORNTOLDCOLONY = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_colony2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Colony2_15_00");	//Tell me more about the Valley of Mines.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_01");	//The valley has changed a lot during these last few days.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_02");	//When the orcs came, other horrible creatures showed up as well, the likes of which have never been seen around here before.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_03");	//They say that a few lonely hunters are still about, but I'm not sure whether they're even still alive.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Colony2_06_04");	//It seems like all the creatures of Beliar have flocked together in this very valley.
	KJORNTOLDCOLONY = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_oldcamp1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_OldCamp1_15_00");	//Tell me about the castle.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_01");	//It lies pretty much in the center of the Valley of Mines.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_OldCamp1_06_02");	//Back when the valley was still a prison, the ore barons controlled the entire ore trade from there.
	KJORNTOLDOLDCAMP = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks1()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks1_15_00");	//Tell me about the orcs.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_01");	//The orcs haven't been here for long. At least those orcs in front of the castle, that is.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_02");	//But I'm wondering about how well they're organized. Orcs usually attack blindly, no matter what.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks1_06_03");	//These orcs are biding their time. They're waiting, but we don't know for what.
	KJORNTOLDORKS = 1;
	Info_ClearChoices(dia_kjorn_buyinfos);
};

func void dia_kjorn_buyinfos_orks2()
{
	AI_Output(other,self,"DIA_Kjorn_BuyInfos_Orks2_15_00");	//Tell me more about the orcs.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_01");	//The orcs are led by elite warriors. Those warriors are very strong and heavily armored. They are almost impossible to defeat.
	AI_Output(self,other,"DIA_Kjorn_BuyInfos_Orks2_06_02");	//I once saw one of them fell a fully-grown oak tree with one blow of his axe.
	KJORNTOLDORKS = 2;
	Info_ClearChoices(dia_kjorn_buyinfos);
};


instance DIA_KJORN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 5;
	condition = dia_kjorn_alldragonsdead_condition;
	information = dia_kjorn_alldragonsdead_info;
	permanent = FALSE;
	description = "I killed all the dragons!";
};


func int dia_kjorn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kjorn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kjorn_AllDragonsDead_15_00");	//I killed all the dragons!
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_01");	//(laughs) Sure, and I'm a paladin.
	AI_Output(self,other,"DIA_Kjorn_AllDragonsDead_06_02");	//You might have killed ONE, but all of them? Go find somebody else who will believe you.
};


instance DIA_KJORN_PICKPOCKET(C_INFO)
{
	npc = djg_710_kjorn;
	nr = 900;
	condition = dia_kjorn_pickpocket_condition;
	information = dia_kjorn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kjorn_pickpocket_condition()
{
	return c_beklauen(47,75);
};

func void dia_kjorn_pickpocket_info()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_BACK,dia_kjorn_pickpocket_back);
	Info_AddChoice(dia_kjorn_pickpocket,DIALOG_PICKPOCKET,dia_kjorn_pickpocket_doit);
};

func void dia_kjorn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kjorn_pickpocket);
};

func void dia_kjorn_pickpocket_back()
{
	Info_ClearChoices(dia_kjorn_pickpocket);
};

