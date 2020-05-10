
instance DIA_CORAGON_EXIT(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 999;
	condition = dia_coragon_exit_condition;
	information = dia_coragon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_coragon_exit_condition()
{
	return TRUE;
};

func void dia_coragon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORAGON_PICKPOCKET(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 900;
	condition = dia_coragon_pickpocket_condition;
	information = dia_coragon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_coragon_pickpocket_condition()
{
	return c_beklauen(40,45);
};

func void dia_coragon_pickpocket_info()
{
	Info_ClearChoices(dia_coragon_pickpocket);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_BACK,dia_coragon_pickpocket_back);
	Info_AddChoice(dia_coragon_pickpocket,DIALOG_PICKPOCKET,dia_coragon_pickpocket_doit);
};

func void dia_coragon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_coragon_pickpocket);
};

func void dia_coragon_pickpocket_back()
{
	Info_ClearChoices(dia_coragon_pickpocket);
};


instance DIA_CORAGON_HALLO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_hallo_condition;
	information = dia_coragon_hallo_info;
	permanent = FALSE;
	description = "Can I get a drink here?";
};


func int dia_coragon_hallo_condition()
{
	return TRUE;
};

func void dia_coragon_hallo_info()
{
	AI_Output(other,self,"DIA_Coragon_HALLO_15_00");	//Can I get a drink here?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_00");	//If you have gold, you can even eat here if you like.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"I can buy food and drink from the inn keeper Coragon.");
};


instance DIA_CORAGON_TRADE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 2;
	condition = dia_coragon_trade_condition;
	information = dia_coragon_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_coragon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_trade_info()
{
	AI_Output(other,self,"DIA_Coragon_Trade_15_00");	//Show me your wares.
	b_givetradeinv(self);
};


instance DIA_CORAGON_WHATSUP(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 3;
	condition = dia_coragon_whatsup_condition;
	information = dia_coragon_whatsup_info;
	permanent = FALSE;
	description = "And, how's business going?";
};


func int dia_coragon_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo))
	{
		return TRUE;
	};
};

func void dia_coragon_whatsup_info()
{
	AI_Output(other,self,"DIA_Coragon_Gelaber_15_00");	//And, how's business going?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_01");	//Ah, don't remind me. Lord Andre is serving free beer at the gallows square.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_02");	//Hardly anybody comes here now except for the rich people from the upper quarter.
	AI_Output(other,self,"DIA_Coragon_Add_15_03");	//What's wrong with them?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_04");	//(laughs) Some of those swells can really get on your nerves.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_05");	//Take that Valentino, for instance - I can't stand the sight of him.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_06");	//But I can't pick my customers. I need every coin I can make.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_07");	//What little I had managed to save has been stolen, along with all my silver.
};


instance DIA_ADDON_CORAGON_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_addon_coragon_missingpeople_condition;
	information = dia_addon_coragon_missingpeople_info;
	description = "Tell me about the missing townspeople.";
};


func int dia_addon_coragon_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_hallo) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_coragon_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Coragon_MissingPeople_15_00");	//Tell me about the missing townspeople.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_01");	//°I heard that a lot of them went missing down by the harbor. Small wonder with all that's going on down there.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_02");	//°Even Thorben, the carpenter in the lower part of town, has lost his apprentice.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_03");	//°Hakon, one of the merchants in the marketplace, had an especially strange tale to tell.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_04");	//°He said that there was this fellow he used to bump into every day, and then suddenly he vanished off the face of the earth. He even went to see the militia about it.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_05");	//°The townspeople all pretty much panicked after that. I don't know what to make of it. I think it's all nonsense.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_06");	//°Khorinis is a rough city, and many dangers lurk outside her gates.
	AI_Output(self,other,"DIA_Addon_Coragon_MissingPeople_09_07");	//Those who don't stay within the city walls will be attacked by bandits or eaten by wild animals. It's that simple.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Hakon, a trader in the marketplace, and Thorben the carpenter should both know something about the missing people.");
};


instance DIA_CORAGON_BESTOHLEN(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 4;
	condition = dia_coragon_bestohlen_condition;
	information = dia_coragon_bestohlen_info;
	permanent = FALSE;
	description = "Somebody stole from you?";
};


func int dia_coragon_bestohlen_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_bestohlen_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_08");	//You've been robbed?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_09");	//Yes, some time ago. It was still rather crowded that night, and I was doing the round serving beer.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_10");	//I wasn't gone long from behind the counter - but it was long enough for those bastards.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_11");	//I went to see the militia about it - but they couldn't find a thing, of course. They prefer to get plastered on free beer.
	MIS_CORAGON_SILBER = LOG_RUNNING;
};


var int coragon_bier;

func void b_coragon_bier()
{
	CORAGON_BIER = CORAGON_BIER + 1;
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_14");	//Here - take this as a reward.
	b_giveinvitems(self,other,itfo_coragonsbeer,1);
	if(CORAGON_BIER < 2)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_21");	//A very special beer. This is my last keg.
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_22");	//It's the very last drop!
	};
};


instance DIA_CORAGON_BRINGSILBER(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 5;
	condition = dia_coragon_bringsilber_condition;
	information = dia_coragon_bringsilber_info;
	permanent = FALSE;
	description = "I've got your silver.";
};


func int dia_coragon_bringsilber_condition()
{
	if((MIS_CORAGON_SILBER == LOG_RUNNING) && (Npc_HasItems(other,itmi_coragonssilber) >= 8))
	{
		return TRUE;
	};
};

func void dia_coragon_bringsilber_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_12");	//I've got your silver.
	if(b_giveinvitems(other,self,itmi_coragonssilber,8))
	{
		Npc_RemoveInvItems(self,itmi_coragonssilber,8);
	};
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_13");	//Really!
	b_giveplayerxp(XP_CORAGONSSILBER);
	b_coragon_bier();
	MIS_CORAGON_SILBER = LOG_SUCCESS;
};


instance DIA_CORAGON_SCHULDENBUCH(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 6;
	condition = dia_coragon_schuldenbuch_condition;
	information = dia_coragon_schuldenbuch_info;
	permanent = FALSE;
	description = "Look what I have here...";
};


func int dia_coragon_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_coragon_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_15");	//Look what I have here...
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_16");	//Mmm? (surprised) But this is Lehmar's ledger!
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_17");	//What are you planning to do with that?
};


instance DIA_CORAGON_GIVEBOOK(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 7;
	condition = dia_coragon_givebook_condition;
	information = dia_coragon_givebook_info;
	permanent = FALSE;
	description = "Here is the book.";
};


func int dia_coragon_givebook_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_coragon_givebook_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_18");	//Here is your book.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_19");	//Thanks! You saved my butt. Lehmar can get rather ugly.
	b_giveplayerxp(XP_SCHULDENBUCH);
	b_coragon_bier();
};


instance DIA_CORAGON_TOOV(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 9;
	condition = dia_coragon_toov_condition;
	information = dia_coragon_toov_info;
	permanent = FALSE;
	description = "What do I have to do to get into the upper quarter?";
};


func int dia_coragon_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup) && (other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_coragon_toov_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_23");	//What do I have to do to get into the upper quarter?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_24");	//You need to be a citizen of the town. Go find some work.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_25");	//Preferably with the craftsmen in the lower part of town. That would make you a citizen.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_26");	//Well, and if that's still not enough, go talk to Lord Andre at the barracks.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_27");	//Maybe he'll let you join the city guard. They can go into the upper quarter, too.
};


instance DIA_CORAGON_VALENTINO(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 8;
	condition = dia_coragon_valentino_condition;
	information = dia_coragon_valentino_info;
	permanent = FALSE;
	description = "What is it with this Valentino?";
};


func int dia_coragon_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_whatsup))
	{
		return TRUE;
	};
};

func void dia_coragon_valentino_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_28");	//What is it with this Valentino?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_29");	//He's filthy rich and has no need to work. And he brags about it to everyone.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_30");	//Whether you want to hear it or not.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_31");	//He drinks a lot and always stays until the end - then, early in the morning, he totters back to the upper quarter.
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_32");	//It's the same every day.
};


instance DIA_CORAGON_NEWS(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 1;
	condition = dia_coragon_news_condition;
	information = dia_coragon_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_coragon_news_condition()
{
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		if(REGIS_RING == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_coragon_news_info()
{
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_33");	//Valentino was unable to pay his bar tab last night.
	if(valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_34");	//He was blathering something about having being robbed, and paying me later... Really!
	}
	else
	{
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_35");	//And right before that, he had been crowing about how much money he had.
		AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_36");	//Then he put his hand in his pocket and made a funny face. He said he had been robbed...
	};
	AI_Output(other,self,"DIA_Coragon_Add_15_37");	//And? What did you do?
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_38");	//Well, I gave him a good thrashing, what else?
};


instance DIA_CORAGON_RING(C_INFO)
{
	npc = vlk_420_coragon;
	nr = 10;
	condition = dia_coragon_ring_condition;
	information = dia_coragon_ring_info;
	permanent = FALSE;
	description = "Here - take this ring.";
};


func int dia_coragon_ring_condition()
{
	if(Npc_KnowsInfo(other,dia_coragon_news) && (Npc_HasItems(other,itri_valentinosring) > 0))
	{
		return TRUE;
	};
};

func void dia_coragon_ring_info()
{
	AI_Output(other,self,"DIA_Coragon_Add_15_39");	//Here - take this ring.
	b_giveinvitems(other,self,itri_valentinosring,1);
	AI_Output(self,other,"DIA_ADDON_NEW_Coragon_Add_09_40");	//What? I don't understand...
	AI_Output(other,self,"DIA_Coragon_Add_15_41");	//It used to belong to Valentino.
	AI_Output(other,self,"DIA_Coragon_Add_15_42");	//You're welcome to pass it on to the next person who tans his hide...
	b_giveplayerxp(300);
	AI_StopProcessInfos(self);
};

