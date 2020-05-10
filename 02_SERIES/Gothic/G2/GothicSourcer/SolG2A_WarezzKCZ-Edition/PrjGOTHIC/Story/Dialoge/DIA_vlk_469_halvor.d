
instance DIA_HALVOR_EXIT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 999;
	condition = dia_halvor_exit_condition;
	information = dia_halvor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_halvor_exit_condition()
{
	return TRUE;
};

func void dia_halvor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HALVOR_PICKPOCKET(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 900;
	condition = dia_halvor_pickpocket_condition;
	information = dia_halvor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_halvor_pickpocket_condition()
{
	return c_beklauen(78,150);
};

func void dia_halvor_pickpocket_info()
{
	Info_ClearChoices(dia_halvor_pickpocket);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_BACK,dia_halvor_pickpocket_back);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_PICKPOCKET,dia_halvor_pickpocket_doit);
};

func void dia_halvor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_halvor_pickpocket);
};

func void dia_halvor_pickpocket_back()
{
	Info_ClearChoices(dia_halvor_pickpocket);
};


instance DIA_HALVOR_HALLO(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hallo_condition;
	information = dia_halvor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void dia_halvor_hallo_info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//Hey, do you need fish? Get your fish here, fresh from the depths of the sea!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Halvor sells fish at the harbor.");
};


instance DIA_HALVOR_TRADE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_trade_condition;
	information = dia_halvor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Show me your fish.";
};


func int dia_halvor_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_halvor_hallo) && Wld_IsTime(5,0,20,0) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//Show me your fish.
};


instance DIA_HALVOR_NIGHT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_night_condition;
	information = dia_halvor_night_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_halvor_night_condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,zs_talk) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_night_info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//Hey, if you want to buy fish, come to my booth tomorrow, OK?
};


instance DIA_ADDON_HALVOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 5;
	condition = dia_addon_halvor_missingpeople_condition;
	information = dia_addon_halvor_missingpeople_info;
	description = "Can you tell me something about those missing people?";
};


func int dia_addon_halvor_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_halvor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_15_00");	//Can you tell me something about those missing people?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_01");	//Missing people? This is a harbor, pal. Things like that are bound to happen.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_02");	//The sea is treacherous, and bound to claim a life now and then.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_03");	//Captains of large vessels will always sign on new sailors in large seaports such as Khorinis to complete their crews.
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_06_04");	//And if they don't find any volunteers, some people may get dragged off against their will. And then they're gone.
	Info_ClearChoices(dia_addon_halvor_missingpeople);
	Info_AddChoice(dia_addon_halvor_missingpeople,DIALOG_BACK,dia_addon_halvor_missingpeople_back);
	Info_AddChoice(dia_addon_halvor_missingpeople,"What ship would that have been?",dia_addon_halvor_missingpeople_schiff);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Do you know of anyone who's missing?",dia_addon_halvor_missingpeople_wer);
	Info_AddChoice(dia_addon_halvor_missingpeople,"Are YOU missing someone?",dia_addon_halvor_missingpeople_you);
};

func void dia_addon_halvor_missingpeople_back()
{
	Info_ClearChoices(dia_addon_halvor_missingpeople);
};

func void dia_addon_halvor_missingpeople_wer()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_wer_15_00");	//Do you know of anyone who's missing?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_wer_06_01");	//No idea. Ask the ship builders.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"The best advice Halvor the fishmonger could give me was to go ask the ship builders.");
};

func void dia_addon_halvor_missingpeople_schiff()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_schiff_15_00");	//What ship would that have been?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_schiff_06_01");	//Good question. Not many ships have come into Khorinis lately, that's true.
};

func void dia_addon_halvor_missingpeople_you()
{
	AI_Output(other,self,"DIA_Addon_Halvor_MissingPeople_you_15_00");	//Are YOU missing someone?
	AI_Output(self,other,"DIA_Addon_Halvor_MissingPeople_you_06_01");	//Me? No.
};


instance DIA_HALVOR_MESSAGE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_message_condition;
	information = dia_halvor_message_info;
	permanent = FALSE;
	description = "I think this piece of paper belongs to you...";
	trade = FALSE;
};


func int dia_halvor_message_condition()
{
	if(KNOWS_HALVOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_halvor_message_info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//I think this piece of paper belongs to you...
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//What...? Let me see.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(sweating) Er... OK, let's stay calm about this - er... listen. I have resold the goods I got from the bandits.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(hastily) But there's no reason to take this straight to the militia, right? I'm sure we can come to an understanding, can't we?
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"Make me an offer, then.",dia_halvor_message_offer);
	Info_AddChoice(dia_halvor_message,"Looks like it's the slammer for you.",dia_halvor_message_prison);
};

func void dia_halvor_message_offer()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//Make me an offer, then.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//All right. I'll tell you something. I can sell you more than just fish.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//If you hand me this ridiculous piece of paper and, er... forget about the matter, you and I can become the best of trading partners.
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"All right, agreed.",dia_halvor_message_okay);
	Info_AddChoice(dia_halvor_message,"Looks like it's the slammer for you.",dia_halvor_message_prison);
	Info_AddChoice(dia_halvor_message,"Oh really? What kind of goods would those be?",dia_halvor_message_deal);
};

func void dia_halvor_message_prison()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//Looks like it's the slammer for you.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//No, wait, you can't do that! After all, I'm nothing but... you know... small fry.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//You should have thought of that sooner. Now I'm going to report you to Lord Andre.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//You'll regret this.
	BETRAYAL_HALVOR = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_halvor_message_deal()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//Oh really? What kind of goods would those be?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//Well, I could offer you... quite special fish, you see. Not just plain ones for eating.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//You mean like the one that contained your hidden message?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//You've got it. I have several of those... fish.
};

func void dia_halvor_message_okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//All right, it's a deal. I think we can keep this little matter between ourselves.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//Thank you. Just drop in the next time you happen to be in the vicinity. I'm bound to have some interesting things for you.
	b_giveinvitems(other,self,itwr_halvormessage,1);
	Npc_RemoveInvItems(self,itwr_halvormessage,1);
	HALVOR_DEAL = TRUE;
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
	CreateInvItems(self,itse_erzfisch,1);
	CreateInvItems(self,itse_goldfisch,1);
	CreateInvItems(self,itse_ringfisch,1);
	CreateInvItems(self,itse_lockpickfisch,1);
	Info_ClearChoices(dia_halvor_message);
};


instance DIA_HALVOR_ZEICHEN(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_zeichen_condition;
	information = dia_halvor_zeichen_info;
	permanent = FALSE;
	description = "(Show thieves' signal)";
};


func int dia_halvor_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//I see. You haven't come just to buy fish.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(quietly) I'll make you an offer. If you have any silver plates or chalices - I'll take them for a good price.
	CreateInvItems(self,itke_lockpick,20);
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"Halvor will buy silver plates and chalices for a better price than any other merchant.");
};


instance DIA_HALVOR_HEHLEREI(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hehlerei_condition;
	information = dia_halvor_hehlerei_info;
	permanent = TRUE;
	description = "(Sell all plates and chalices)";
};


func int dia_halvor_hehlerei_condition()
{
	if(Npc_KnowsInfo(other,dia_halvor_zeichen) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_hehlerei_info()
{
	HALVOR_SCORE = 0;
	if(HALVOR_DAY != Wld_GetDay())
	{
		if((Npc_HasItems(other,itmi_silverplate) >= 1) || (Npc_HasItems(other,itmi_silvercup) >= 1))
		{
			HALVOR_SCORE = (Npc_HasItems(other,itmi_silverplate) * (VALUE_SILVERPLATE / 2)) + (Npc_HasItems(other,itmi_silvercup) * (VALUE_SILVERCUP / 2));
			if(HALVOR_SCORE <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//For all your stuff, I'll give you...
				b_say_gold(self,other,HALVOR_SCORE);
				Info_ClearChoices(dia_halvor_hehlerei);
				Info_AddChoice(dia_halvor_hehlerei,"All right, sold.",dia_halvor_hehlerei_annehmen);
				Info_AddChoice(dia_halvor_hehlerei,"I'll think about it.",dia_halvor_hehlerei_ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//You brought too much stuff. I can't give you that much gold all at once.
				Info_ClearChoices(dia_halvor_hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//Come back when you have some silver plates or chalices.
			Info_ClearChoices(dia_halvor_hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//You can get rid of your silver here tomorrow. Today's too early.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//Sorry, no more business for today. Come back tomorrow, OK?
	};
};

func void dia_halvor_hehlerei_annehmen()
{
	var int amount;
	var string concattext;
	amount = Npc_HasItems(other,itmi_silverplate) + Npc_HasItems(other,itmi_silvercup);
	concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
	AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	Npc_RemoveInvItems(other,itmi_silvercup,Npc_HasItems(other,itmi_silvercup));
	Npc_RemoveInvItems(other,itmi_silverplate,Npc_HasItems(other,itmi_silverplate));
	b_giveinvitems(self,other,itmi_gold,HALVOR_SCORE);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//All right, sold.
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//We've made some good deals today. Better not come back until tomorrow, or somebody might get suspicious, you see?
	HALVOR_DAY = Wld_GetDay();
	Info_ClearChoices(dia_halvor_hehlerei);
};

func void dia_halvor_hehlerei_ablehnen()
{
	Info_ClearChoices(dia_halvor_hehlerei);
};


instance DIA_HALVOR_CREW(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 51;
	condition = dia_halvor_crew_condition;
	information = dia_halvor_crew_info;
	permanent = FALSE;
	description = "I'm looking for a crew.";
};


func int dia_halvor_crew_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_crew_info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//I'm looking for a crew.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//But how are you planning to leave here?
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,"That's my own business.",dia_halvor_crew_mything);
	Info_AddChoice(dia_halvor_crew,"I'm going to appropriate a ship.",dia_halvor_crew_stealship);
};

func void dia_halvor_crew_mything()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//That's my own business.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//Suit yourself. It's none of my business, really.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Wanna come along?",dia_halvor_crew_joinme);
	Info_AddChoice(dia_halvor_crew,"Can you help me?",dia_halvor_crew_helpme);
};

func void dia_halvor_crew_stealship()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//I'm going to appropriate a ship.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//Yeah right. Are you for real? The paladins will make short work of you, when they get hold of you.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//Suit yourself - it's not my life you're risking.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"Wanna come along?",dia_halvor_crew_joinme);
	if(Npc_IsDead(jack) == FALSE)
	{
		Info_AddChoice(dia_halvor_crew,"Can you help me?",dia_halvor_crew_helpme);
	};
};

func void dia_halvor_crew_joinme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//Wanna come along?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//Naah, I think not. I've plenty to do here and, honestly, I have no desire to encounter a slave galley full of orcs.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//But I wish you lots of luck.
};

func void dia_halvor_crew_helpme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//Can you help me?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//I'm not the right person for that. But go talk to Jack, he should be hanging out here somewhere in the harbor. He'll know best what you need to make that journey.
};

func void dia_halvor_crew_back()
{
	Info_ClearChoices(dia_halvor_crew);
};

