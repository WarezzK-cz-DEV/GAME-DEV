
instance DIA_CANTHAR_PICKPOCKET(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 900;
	condition = dia_canthar_pickpocket_condition;
	information = dia_canthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_canthar_pickpocket_condition()
{
	return c_beklauen(20,25);
};

func void dia_canthar_pickpocket_info()
{
	Info_ClearChoices(dia_canthar_pickpocket);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_BACK,dia_canthar_pickpocket_back);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_PICKPOCKET,dia_canthar_pickpocket_doit);
};

func void dia_canthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_canthar_pickpocket);
};

func void dia_canthar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_CANTHAR_EXIT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 999;
	condition = dia_canthar_exit_condition;
	information = dia_canthar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V2;
};


func int dia_canthar_exit_condition()
{
	return TRUE;
};

func void dia_canthar_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//I've got to go!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Suit yourself.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PERSONALCRIMES(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_personalcrimes_condition;
	information = dia_canthar_personalcrimes_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_personalcrimes_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_canthar_personalcrimes_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//It was very foolish of you to attack me.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(mocking) Did you think you could defeat me that easily?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Either you make amends for this, or I shall see to it that you bitterly regret your deed!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//And what exactly did you have in mind?
	b_say_gold(self,other,100);
	Info_ClearChoices(dia_canthar_personalcrimes);
	Info_AddChoice(dia_canthar_personalcrimes,"I don't have that much!",dia_canthar_personalcrimes_notenough);
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_canthar_personalcrimes,"Here's your gold - let's forget the matter!",dia_canthar_personalcrimes_pay);
	};
};

func void dia_canthar_personalcrimes_pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Here's your gold - let's forget the matter!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//Very reasonable of you!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_canthar_personalcrimes_notenough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//I don't have that much!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//Then why are you stealing my time?
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_HALLO(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_hallo_condition;
	information = dia_canthar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Who do we have here then?
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//You are on your way to the city - am I not right?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Maybe.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Hm! (snorts) You look like a fugitive! All fugitives are headed for the city.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//You could even be a former convict from the mining colony.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(hastily) I don't care where you come from. But I believe I have an interesting offer for you...
		CANTHAR_GOTME = TRUE;
	}
	else if(Hlp_IsItem(itm,itar_bau_l) || Hlp_IsItem(itm,itar_bau_m))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//How goes the work, peasant?
		Info_ClearChoices(dia_canthar_hallo);
		Info_AddChoice(dia_canthar_hallo,"Do I look like a farmer?",dia_canthar_hallo_nobauer);
		Info_AddChoice(dia_canthar_hallo,"I can't complain.",dia_canthar_hallo_bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//What can I do for you?
	};
};

func void dia_canthar_hallo_bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//I can't complain.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//Can I do something for you?
	Info_ClearChoices(dia_canthar_hallo);
};

func void dia_canthar_hallo_nobauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Do I look like a farmer?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//Just like a farmer. But you don't talk like one!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(pondering) If I am not entirely mistaken, I have an interesting offer for you...
	CANTHAR_GOTME = TRUE;
	Info_ClearChoices(dia_canthar_hallo);
};


instance DIA_CANTHAR_WHATOFFER(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_whatoffer_condition;
	information = dia_canthar_whatoffer_info;
	permanent = FALSE;
	description = "What can you offer me?";
};


func int dia_canthar_whatoffer_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_hallo))
	{
		return TRUE;
	};
};

func void dia_canthar_whatoffer_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//What do you have to offer?
	if(CANTHAR_GOTME == TRUE)
	{
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//The way you look, the guards will never let you into the city.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//(ironic) If you are as 'convincing' with the guards at the gate as you are with me, they will never let you into the city.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//I can help you get into the city.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//I have here a small piece of paper. With the royal seal and the governor's signature. A pass.
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//With this scrap of paper in your pocket, you can run about as raggedly as you please, and the guards will leave you alone.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//Interested?
		Info_ClearChoices(dia_canthar_whatoffer);
		Info_AddChoice(dia_canthar_whatoffer,"No! Keep your paper!",dia_canthar_whatoffer_no);
		Info_AddChoice(dia_canthar_whatoffer,"What do you want for your pass?",dia_canthar_whatoffer_price);
		Info_AddChoice(dia_canthar_whatoffer,"How will YOU get into town?",dia_canthar_whatoffer_howyouin);
		Info_AddChoice(dia_canthar_whatoffer,"There must be a catch to this...",dia_canthar_whatoffer_strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//I am a traveling merchant. I sell a bit of everything.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Canthar trades in all kinds of weapons.");
};

func void dia_canthar_whatoffer_strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//There must be a catch to this...
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//(exaggerated) No. No catch. You will merely owe me a favor.
};

func void dia_canthar_whatoffer_howyouin()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//How will YOU get into town?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//The guards know me. I will simply tell them that I have lost my pass.
};

func void dia_canthar_whatoffer_price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//What do you want for your pass?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(pleased) I KNEW you were the right man!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Listen. You will get the pass from me - now.
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Just like that?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Just so. BUT: If I meet you in the city, you owe me a favor.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Do we have a deal?
	Info_AddChoice(dia_canthar_whatoffer,"Sure. Give me that paper.",dia_canthar_whatoffer_ok);
};

func void dia_canthar_whatoffer_ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Sure. Give me that paper.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Here. Be careful with that, it is very valuable.
	CreateInvItems(self,itwr_passierschein,1);
	b_giveinvitems(self,other,itwr_passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//One more thing: Don't even think about breaking your word!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//As a merchant, I have a great deal of influence in the city - it wouldn't go well for you, believe me!
	CANTHAR_GEFALLEN = TRUE;
	Info_ClearChoices(dia_canthar_whatoffer);
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"I got a pass from the merchant Canthar that will enable me to get into the city. In return, I owe him a favor next time I see him there.");
};

func void dia_canthar_whatoffer_no()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//No! Keep your paper!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Hm. I seem to have misjudged you, huh?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//Well. Do you want something else? Can I interest you in my wares?
	Info_ClearChoices(dia_canthar_whatoffer);
};


instance DIA_CANTHAR_TRADE(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 888;
	condition = dia_canthar_trade_condition;
	information = dia_canthar_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_canthar_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_trade_info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Show me your wares!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Take your pick.
};


instance DIA_CANTHAR_PAYPRICEINCITY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_paypriceincity_condition;
	information = dia_canthar_paypriceincity_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_canthar_paypriceincity_condition()
{
	if((CANTHAR_INSTADT == TRUE) && (Npc_IsDead(sarah) == FALSE) && (CANTHAR_GOTME == TRUE))
	{
		return TRUE;
	};
};

func void dia_canthar_paypriceincity_info()
{
	if(CANTHAR_GEFALLEN == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//You still owe me a favor. It is time to pay your debt.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Hey you, I have a proposition for you.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//What do you want?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//I want my old stall in the marketplace back. Sarah snatched it away from me.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//But she has had that spot long enough. I want her to give up the stall.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//And what's my part in this?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//I will give you a letter to stick in her pocket.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Then you go to Andre and tell him that Sarah is selling weapons to Onar.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//She lands in prison, you pocket the bounty, and I get the stall.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//You have two days to accomplish this.
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//What's in it for me?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//When I have the stall, you will get a weapon from me - and a damned good one.
	};
	Info_ClearChoices(dia_canthar_paypriceincity);
	Info_AddChoice(dia_canthar_paypriceincity,"No, I want no part of this.",dia_canthar_paypriceincity_nein);
	Info_AddChoice(dia_canthar_paypriceincity,"All right, I'll do it.",dia_canthar_paypriceincity_ok);
	Info_AddChoice(dia_canthar_paypriceincity,"What will happen if I refuse to do that?",dia_canthar_paypriceincity_if);
};

func void dia_canthar_paypriceincity_if()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//What will happen if I refuse to do that?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//That would be truly stupid of you, because you see, I know that you are an escaped convict.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//If that gets around, it could do considerable harm to your situation in the city...
};

func void dia_canthar_paypriceincity_nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//No, I want no part of this.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//That was the wrong decision, boy. We shall speak again.
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	Info_ClearChoices(dia_canthar_paypriceincity);
};

func void dia_canthar_paypriceincity_ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//All right, looks like I've got no choice.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//You're a clever lad. Here is the letter.
	CreateInvItems(self,itwr_canthars_komprobrief_mis,1);
	b_giveinvitems(self,other,itwr_canthars_komprobrief_mis,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//How am I supposed to foist the letter on her?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Let her show you her wares - and while she does, you hide the letter on her.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//And bear in mind, I am an influential man in the city, so don't try to play me for a fool.
	MIS_CANTHARS_KOMPROBRIEF = LOG_RUNNING;
	MIS_CANTHARS_KOMPROBRIEF_DAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_CANTHAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CANTHAR,LOG_RUNNING);
	if(CANTHAR_GEFALLEN == TRUE)
	{
		b_logentry(TOPIC_CANTHAR,"Canthar wants me to do him the favor I still owe him.");
	}
	else
	{
		b_logentry(TOPIC_CANTHAR,"Canthar has promised to give me a weapon in return for doing him a favor.");
	};
	b_logentry(TOPIC_CANTHAR,"I'm to foist a letter on the merchant Sarah, which will make it look like she's been selling weapons to Onar. Then I'm to go to Lord Andre and rat on her.");
	Info_ClearChoices(dia_canthar_paypriceincity);
};


instance DIA_CANTHAR_SARAHERLEDIGT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_saraherledigt_condition;
	information = dia_canthar_saraherledigt_info;
	permanent = TRUE;
	description = "About Sarah...";
};


func int dia_canthar_saraherledigt_condition()
{
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_canthar_saraherledigt_info()
{
	if(Npc_IsDead(sarah) == FALSE)
	{
		if(MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//Don't you have a job to do?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//First foist the letter onto Sarah, then go to Andre and accuse her..
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Do that - and don't try to cheat me, you would regret it.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//You are taking your own sweet time about this. Get going!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Sarah is dead.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Really? Wonderful. Then you have completed your half of our little bargain.
		MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_SUCCESS(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_success_condition;
	information = dia_canthar_success_info;
	permanent = FALSE;
	description = "About Sarah...";
};


func int dia_canthar_success_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && (Npc_IsDead(sarah) == FALSE))
	{
		return TRUE;
	};
};

func void dia_canthar_success_info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Well done. Sarah is where she belongs.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//I have taken over her goods, so if you need a weapon, come to me.
	if(KAPITEL == 1)
	{
		CreateInvItems(self,itmw_shortsword3,1);
		CreateInvItems(self,itmw_shortsword4,1);
		CreateInvItems(self,itmw_shortsword5,1);
		CreateInvItems(self,itmw_kriegshammer1,1);
		CreateInvItems(self,itmw_1h_vlk_sword,1);
		CreateInvItems(self,itmw_1h_nov_mace,1);
	};
	if(KAPITEL == 2)
	{
		CreateInvItems(self,itmw_stabkeule,1);
		CreateInvItems(self,itmw_steinbrecher,1);
		CreateInvItems(self,itmw_schwert2,1);
		CreateInvItems(self,itmw_bartaxt,1);
	};
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//You were going to give me a weapon.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Correct. Here, this weapon is a masterpiece of the blacksmith's art.
		b_giveinvitems(self,other,itmw_schiffsaxt,1);
	};
	b_giveplayerxp(XP_CANTHARS_KOMPROBRIEF);
};


instance DIA_CANTHAR_AGAIN(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_again_condition;
	information = dia_canthar_again_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_again_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_again_info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Oh, here you are again.
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Why aren't you in jail?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//I have been released. As I already told you - I am an influential man in the city.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//In the meantime, I have dealt with Sarah myself. You can forget the business with the letter.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Did I not warn you? It would have been better if you had done what I told you.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//Now word is out among the merchants that you are a convict.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//A regrettable affair - now you won't be able to get even a piece of bread here in the marketplace.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//I could, of course, sort things out for you for, shall we say...
	b_say_gold(self,other,CANTHAR_GOLD);
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PAY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_pay_condition;
	information = dia_canthar_pay_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_pay_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_again) && (CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_pay_info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Have you come to pay?
	Info_ClearChoices(dia_canthar_pay);
	if(Npc_HasItems(other,itmi_gold) >= CANTHAR_GOLD)
	{
		Info_AddChoice(dia_canthar_pay,"All right, I'll pay up...",dia_canthar_pay_ja);
	};
	Info_AddChoice(dia_canthar_pay,"I haven't got enough money on me...",dia_canthar_pay_nein);
	Info_AddChoice(dia_canthar_pay,"How much was that again?",dia_canthar_pay_wieviel);
};

func void dia_canthar_pay_ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//All right, I'll pay up, you leave me no choice.
	b_giveinvitems(other,self,itmi_gold,CANTHAR_GOLD);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(grins) Good. Then I shall see to it that your reputation with the merchants rises once again.
	CANTHAR_SPERRE = FALSE;
	CANTHAR_PAY = TRUE;
	Info_ClearChoices(dia_canthar_pay);
};

func void dia_canthar_pay_nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//I haven't got enough money on me...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Then get it.
	Info_ClearChoices(dia_canthar_pay);
	AI_StopProcessInfos(self);
};

func void dia_canthar_pay_wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//How much was that again?
	b_say_gold(self,other,CANTHAR_GOLD);
};


instance DIA_CANTHAR_CANTHARANGEPISST(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_cantharangepisst_condition;
	information = dia_canthar_cantharangepisst_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_canthar_cantharangepisst_condition()
{
	if((CANTHAR_AUSGELIEFERT == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_cantharangepisst_info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//I warned you, but you wouldn't listen. We will discuss this later.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//Now get lost, I want to rest.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_MINENANTEIL(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 3;
	condition = dia_canthar_minenanteil_condition;
	information = dia_canthar_minenanteil_info;
	description = "You're selling illegal mining shares!";
};


func int dia_canthar_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_minenanteil_info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//You're selling illegal mining shares!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//Yes, and? So what! If I don't do it, someone else will.
	b_giveplayerxp(XP_AMBIENT);
};

