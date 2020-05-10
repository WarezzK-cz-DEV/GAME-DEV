
instance DIA_HANNA_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_exit_condition;
	information = dia_hanna_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_hanna_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_HELLO(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_hello_condition;
	information = dia_hanna_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_hello_condition()
{
	return TRUE;
};

func void dia_hanna_hello_info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//Ah, a customer - what can I do for you?
};


instance DIA_HANNA_ROOM(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 2;
	condition = dia_hanna_room_condition;
	information = dia_hanna_room_info;
	permanent = FALSE;
	description = "I'm looking for a room.";
};


func int dia_hanna_room_condition()
{
	return TRUE;
};

func void dia_hanna_room_info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//I'm looking for a room.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//You're in the right place, then.
	if(Npc_KnowsInfo(other,dia_lothar_schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//One of the paladins told me that I could spend the night here for free...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//What does it cost to spend the night?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//Absolutely nothing.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//The paladins are responsible for the lodging of all travelers.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//So can I stay the night here for free?
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//Yes, yes.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//Just go up the stairs.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//We still have one or two beds free.
};


instance DIA_HANNA_WHYPAY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 3;
	condition = dia_hanna_whypay_condition;
	information = dia_hanna_whypay_info;
	permanent = FALSE;
	description = "Why do the paladins pay for everything?";
};


func int dia_hanna_whypay_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_whypay_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//Why do the paladins pay for everything?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//I don't know what that's all about either.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//For one thing, I think they want to get all the poor suckers off the streets so they don't make any mischief.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//And for another, they want to get on the good side of the traveling traders.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//Now that the farmers are rebelling, we have to rely on the traders for provisions.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//Besides, I think they want to improve the morale in the city a bit.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//Lord Andre has even arranged for free beer to be given out at the gallows square.
};


instance DIA_HANNA_WERHIER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 4;
	condition = dia_hanna_werhier_condition;
	information = dia_hanna_werhier_info;
	permanent = TRUE;
	description = "Who's staying here at the moment?";
};


func int dia_hanna_werhier_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_werhier_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//Who's staying here at the moment?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//Almost all of them are traveling traders from the market.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//Aha.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//Don't even think of messing with their stuff! I don't want any trouble here!
};


instance DIA_HANNA_CITY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 5;
	condition = dia_hanna_city_condition;
	information = dia_hanna_city_info;
	permanent = TRUE;
	description = "I have a few questions about the city...";
};


func int dia_hanna_city_condition()
{
	return TRUE;
};

func void dia_hanna_city_info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//I have a few questions about the city...
	Info_ClearChoices(dia_hanna_city);
	Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
	Info_AddChoice(dia_hanna_city,"Where can I buy something around here?",dia_hanna_city_buy);
	Info_AddChoice(dia_hanna_city,"Tell me about the town.",dia_hanna_city_city);
};

func void dia_hanna_city_back()
{
	Info_ClearChoices(dia_hanna_city);
};

func void dia_hanna_city_buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//Where can I buy something around here?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//The market is directly in front of the door. You should be able to find everything there.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//There are a few more shops and craftsmen on the other side of town. Most of them are near the other city gate.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//Also, there's a fishmonger in the harbor district. His shop is directly at the harbor. He's easy to find.
};

func void dia_hanna_city_city()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//Tell me about the town.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//Khorinis is one of the wealthiest cities within the kingdom, even if it doesn't look like it at the moment.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//But since the orc war started, trade has almost come to a complete standstill. The king has requisitioned the entire merchant fleet for military service,
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//which means that hardly any ships come into the harbor now. So, the supply of goods is very scarce now, and many citizens of the town are very worried.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//Nobody really knows what the future will bring. There's basically nothing we can do but wait and see what happens. It's not like we can change anything.
};


instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_kap3_exit_condition;
	information = dia_hanna_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hanna_priceforletter;

instance DIA_HANNA_ANYNEWS(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_anynews_condition;
	information = dia_hanna_anynews_info;
	permanent = FALSE;
	description = "What's up?";
};


func int dia_hanna_anynews_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_anynews_info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//You don't look like you care about other people's worries in the least.
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Yeah, sure, I do.",dia_hanna_anynews_yes);
	Info_AddChoice(dia_hanna_anynews,"That depends.",dia_hanna_anynews_depends);
	Info_AddChoice(dia_hanna_anynews,"Not really.",dia_hanna_anynews_no);
};

func void dia_hanna_anynews_no()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//Not really.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//That's what I'm saying. Everyone here thinks of no one but himself. So what do you want?
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//That depends.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//That depends on how much there is to be had, you mean.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//I can't use the likes of you around here.
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//Yeah, sure.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//What do you know, the world is full of surprises. I cleared out some of my stuff recently and sold a stack of old maps to Brahim, the cartographer down by the harbor.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//Unfortunately, I noticed that I'm missing a document.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//I assume it must have slipped in among the papers.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//Could you perhaps get it back for me?
	MIS_HANNARETRIEVELETTER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
	b_logentry(TOPIC_HANNARETRIEVELETTER,"Hanna's missing a document. Seems it disappeared at the harbor, where the cartographer Brahim is.");
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"I'm not an errand boy.",dia_hanna_anynews_yes_footboy);
	Info_AddChoice(dia_hanna_anynews,"What's in it for me?",dia_hanna_anynews_yes_reward);
	Info_AddChoice(dia_hanna_anynews,"I'll see what I can do.",dia_hanna_anynews_yes_willsee);
};

func void dia_hanna_anynews_yes_footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//I'm not an errand boy.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//I see - the problems of a common woman are too profane for you. Then I guess I'll have to take care to it myself.
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//What's in it for me?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//A-ha, I knew it - you're really no better than the rabble down at the harbor.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//So what is it you're asking of a poor woman?
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"Never mind.",dia_hanna_anynews_yes_reward_ok);
	Info_AddChoice(dia_hanna_anynews,"You could be a little nice to me.",dia_hanna_anynews_yes_reward_benice);
	Info_AddChoice(dia_hanna_anynews,"Gold.",dia_hanna_anynews_yes_reward_gold);
};

func void dia_hanna_anynews_yes_reward_ok()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//Never mind.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//At least you have a shred of decency left. If you get the document back for me, I'll give you 75 gold pieces.
	HANNA_PRICEFORLETTER = 75;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward_benice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//You could be a little nice to me.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//But that's outrageous. I... get out of here! You boorish lout!
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void dia_hanna_anynews_yes_reward_gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//Gold.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//Filthy lucre is more than I can offer you. Oh well - it'll be worth 50 gold pieces to me.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//If you manage to get the document back, I'll give you 50 gold pieces.
	HANNA_PRICEFORLETTER = 50;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_willsee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//I'll see what I can do.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//You're so sweet. I wish you much luck!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//If you bring the paper back to me, I'll give you a reward.
	HANNA_PRICEFORLETTER = 200;
	Info_ClearChoices(dia_hanna_anynews);
};


instance DIA_HANNA_THISLETTER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_thisletter_condition;
	information = dia_hanna_thisletter_info;
	permanent = FALSE;
	description = "Did you mean this document?";
};


func int dia_hanna_thisletter_condition()
{
	if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_thisletter_info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//Did you mean this document?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//Yes, that's exactly it. Thank you.
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//What's my reward?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//Not so fast. Here's your money.
	CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(other,self,itwr_shatteredgolem_mis,1);
	MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
	b_giveplayerxp(XP_HANNARETRIEVELETTER);
};


instance DIA_HANNA_PICKPOCKET(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 900;
	condition = dia_hanna_pickpocket_condition;
	information = dia_hanna_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_hanna_pickpocket_condition()
{
	return c_beklauen(45,25);
};

func void dia_hanna_pickpocket_info()
{
	Info_ClearChoices(dia_hanna_pickpocket);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};

func void dia_hanna_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hanna_pickpocket);
};

func void dia_hanna_pickpocket_back()
{
	Info_ClearChoices(dia_hanna_pickpocket);
};


instance DIA_HANNA_AUSKELLER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 11;
	condition = dia_hanna_auskeller_condition;
	information = dia_hanna_auskeller_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_auskeller_condition()
{
	if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_auskeller_info()
{
	if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//Where... do you come from?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//I found something interesting in your cellar...
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//What were you doing in my cellar?!
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//You know damn well!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(coldly) I don't know what you're talking about...
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(distrustful) Look at you! Where do you come from? Hm?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(embarrassed) I...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(laughs) I know!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(conspiratorially) You don't have to tell me. I know everything.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//Just don't even think of stealing anything here, got it?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//We can't afford drawing attention to the hotel.
	};
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_schuldenbuch_condition;
	information = dia_hanna_schuldenbuch_info;
	permanent = FALSE;
	description = "Look what book I have here!";
};


func int dia_hanna_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//Look what book I have here!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//Lehmar's ledger. How did you get hold of that?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//Well...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//If Lehmar doesn't have it any more, that's a good thing. But I'd rather have it myself...
};


instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_giveschuldenbuch_condition;
	information = dia_hanna_giveschuldenbuch_info;
	permanent = FALSE;
	description = "Here - take the book.";
};


func int dia_hanna_giveschuldenbuch_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_giveschuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//Here - take the book.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//Thanks.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//Take this as a reward.
	b_giveinvitems(self,other,itse_hannasbeutel,1);
	b_giveplayerxp(XP_SCHULDENBUCH);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//What is this you've you given me?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//It is a key to the gate of wealth.
};


instance DIA_HANNA_BLUBB(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_blubb_condition;
	information = dia_hanna_blubb_info;
	permanent = TRUE;
	description = "(Ask about thief hideout.)";
};


func int dia_hanna_blubb_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_auskeller))
	{
		return TRUE;
	};
};

func void dia_hanna_blubb_info()
{
	if(ANDRE_DIEBESGILDE_AUFGERAEUMT == FALSE)
	{
		if(KNOWS_SECRETSIGN == TRUE)
		{
			AI_Output(other,self,"DIA_Hanna_Add_15_37");	//Everything all right in the hideout?
			AI_Output(self,other,"DIA_Hanna_Add_17_39");	//I haven't seen any of them in quite a while.
			AI_Output(self,other,"DIA_Hanna_Add_17_40");	//I should go down there when I get the chance and check up on things.
			AI_Output(self,other,"DIA_Hanna_Add_17_38");	//Yes. But you'd better not talk about it...
		}
		else
		{
			AI_Output(other,self,"DIA_Hanna_Add_15_25");	//Did you know about the thieves' hideout?
			AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(smirks) I don't know what you're talking about...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_32");	//The militia was here... Somebody betrayed the hideout!
		AI_Output(self,other,"DIA_Hanna_Add_17_33");	//They couldn't pin anything on me, but Cassia and her people are dead!
		AI_Output(self,other,"DIA_Hanna_Add_17_34");	//I'm sure it was YOU...
		AI_Output(self,other,"DIA_Hanna_Add_17_35");	//I bought this here especially for you.
		AI_Output(self,other,"DIA_Hanna_Add_17_36");	//It cost me a lot of money. But you're worth it, you swine...
		dia_hanna_blubb.permanent = FALSE;
		AI_StopProcessInfos(self);
		CreateInvItem(self,itsc_icecube);
		CreateInvItem(self,itsc_firestorm);
		b_attack(self,other,AR_NONE,1);
	};
};

