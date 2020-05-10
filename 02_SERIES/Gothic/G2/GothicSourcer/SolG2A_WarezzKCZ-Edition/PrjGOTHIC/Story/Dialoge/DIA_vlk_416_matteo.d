
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_MATTEO") <= 500)
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//What can I do for you?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "What are you selling?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//What are you selling?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//I can offer you everything you need to survive in the wild. Weapons, torches, provisions... even armor.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//I still have a special piece in stock.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Double hardened armor of snapper leather - still unused. Interested?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Matteo's shop is at the south gate of the city. He sells equipment, weapons and supplies.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Show me your wares.
	b_givetradeinv(self);
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//Since the mercenaries did in the paladin Lothar, the paladins' inspections have gotten a lot tougher.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//I hope that will ease up once they've hanged the murderer.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//It looks like the paladins are really serious this time, they've even withdrawn their ship guards.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//It's a good thing you're refreshing your supplies again, who knows if the city will still be standing next week.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "Buy leather armor. Protection: B.+20/B.+20/P.+20/M.+20. (250 gold)";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//All right, give me the armor.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//You'll love it. (grins)
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//The armor has its price - and it's worth it. So, come back when you have enough gold.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "What do you know about paladins?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//What do you know about paladins?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//Since these bastards have come to the city, I've had nothing but trouble.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//The last time I was headed for the upper end of town, the guards flat out stopped me and asked me what was my business there!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//And?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Of course they let me in!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//I had my shop in the city when most of those pompous asses were still chasing pigs with wooden swords!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//And yesterday the bastards came and confiscated half of my goods!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "The paladins seized your goods?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//The paladins seized your goods?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Everything I had stored in the back yard.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//They simply posted a guard in front of the entrance to the yard.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//If I'm lucky, they won't take everything. At least they might leave the armor here.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "Can you help me get into the upper quarter?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Can you help me get into the upper quarter?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(stunned) What? What are you going to do THERE?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//I've got an important message...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//Well, well... Have you tried getting past the guards?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(bitter laugh) Oh man, forget it!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(laughs) That's TYPICAL of those beggars!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//I don't see why I should even try.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//You're probably right.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//I don't know HOW important your message is - and it's none of my business.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//But even if you told them that a ship full of orcs just anchored in the harbor, they'd send you away.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Because they have their ORDERS.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//It seems to be really important to you.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(slyly) The question is: HOW important is it to you?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//What are you getting at?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//I can help you - after all, I am one of the most influential people here.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//But it'll cost you.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "So can you help me get into the upper quarter?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//So can you help me get into the upper quarter?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "Help me to become an apprentice to one of the masters.";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//So can you help me get into the upper quarter?
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "What are you asking for your help?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//What are you asking for your help?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 gold pieces.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"That's a whole damn lot...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"You shark!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Take it easy! It isn't YOUR gold I have in mind.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//But?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//In principle, it's MY gold.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Gritta, the carpenter's niece, hasn't paid what she owes me in ages.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//But the little brat is constantly running around in new clothes - that means she has the money.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//I'd like to beat it out of her, but Master Thorben - the carpenter - is also a very influential man.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Get me the money and I'll help you.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"Carpenter Thorben's niece Gritta owes Matteo 100 pieces of gold. If I get them back for him, he'll help me to get into the upper quarter.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//You shark!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//That's a whole damn lot...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "Where can I find this Gritta?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Where can I find this Gritta?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Like I said - she's the carpenter's niece - his house is down the street, the last house on the right before the smithy.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "Here's your 100 gold pieces!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Here's your 100 gold pieces!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//That gold has Gritta's blood on it! I didn't say anything about you killing her!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//I don't want anything to do with this business. You can forget our deal! And never speak to me about it again!
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 80)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//And? Did she cause any problems?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//None to speak of.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Good! You've held up your part of the deal.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//You want to pay for her? Hm - I'd have preferred it if you'd squeezed it out of her!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Still - 100 gold pieces is 100 gold pieces.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//You've held up your part of the deal.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//Counting isn't your strong suit, is it? You don't have 100 gold pieces.
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "Help me to become an apprentice to one of the masters.";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Help me sign on as an apprentice with one of the masters!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Don't worry. I'll keep my part of the bargain.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//The other masters will only hear the best about you from me.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"Matteo will give his approval if I want to start as an apprentice somewhere.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//One thing at a time. First fulfill your part of the deal and bring me the gold!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "How EXACTLY can you help me?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//How EXACTLY can you help me?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//Quite simple. I'll use my influence to see to it that one of the master craftsmen here takes you on as an apprentice.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//As such, you'll practically be a citizen of the city and can enter the upper quarter. Besides which, you'll earn something while you're at it.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Matteo can help me to be accepted as an apprentice by one of the master craftsmen.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "Where could I sign on as an apprentice, then?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//Where could I sign on as an apprentice, then?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//Basically, with any master here on the main street.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//That would be Harad the smith, Bosper the bowmaker, Thorben the carpenter or Constantino the alchemist.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//One of them is bound to take you on.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//But it's important that the other masters agree. That's always been the custom here in Khorinis.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"I could start work as an apprentice for Bosper the bowmaker, Harad the smith, Thorben the carpenter or Constantino the alchemist.");
	b_logentry(TOPIC_LEHRLING,"Before I can become an apprentice, I have to get the approval of the other masters.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "How do I get the approval of the other masters?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//How do I get the approval of the other masters?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//You just have to convince them. Go and talk to them.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//But if more than one of them is against you, you don't stand a chance! So behave yourself!
	b_logentry(TOPIC_LEHRLING,"I can only get the masters' approval if I can prove myself to them.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "Why don't YOU take me on as an apprentice?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//Why don't YOU take me on as an apprentice?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//I would - but the other masters wouldn't agree.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//I just recently took on another apprentice.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "Is there another way to get into the upper quarter?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//Is there another way to get into the upper quarter?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Perhaps... if I think of anything, I'll let you know.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "You've got some mining shares among your wares.";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//You've got some mining shares among your wares. Who sold them to you?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(nervously) Mining shares? Oops. Where did they come from? No idea where I got them. Honestly, your honor.
	b_giveplayerxp(XP_AMBIENT);
};

