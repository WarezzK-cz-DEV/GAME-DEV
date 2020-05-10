
instance DIA_NADJA_EXIT(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 999;
	condition = dia_nadja_exit_condition;
	information = dia_nadja_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nadja_exit_condition()
{
	return TRUE;
};

func void dia_nadja_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_PICKPOCKET(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 900;
	condition = dia_nadja_pickpocket_condition;
	information = dia_nadja_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_nadja_pickpocket_condition()
{
	return c_beklauen(40,40);
};

func void dia_nadja_pickpocket_info()
{
	Info_ClearChoices(dia_nadja_pickpocket);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_BACK,dia_nadja_pickpocket_back);
	Info_AddChoice(dia_nadja_pickpocket,DIALOG_PICKPOCKET,dia_nadja_pickpocket_doit);
};

func void dia_nadja_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nadja_pickpocket);
};

func void dia_nadja_pickpocket_back()
{
	Info_ClearChoices(dia_nadja_pickpocket);
};


instance DIA_NADJA_STANDARD(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_standard_condition;
	information = dia_nadja_standard_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_standard_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE))
	{
		return TRUE;
	};
};


var int nadja_luciainfo;

func void dia_nadja_standard_info()
{
	if(NADJA_LUCIAINFO == TRUE)
	{
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_00");	//I can only talk to you if you speak to Bromor first.
	}
	else
	{
		AI_Output(self,other,"DIA_Nadja_STANDARD_16_00");	//Hey, I can't take care of you now, baby. Talk to Bromor if you want to have some fun.
	};
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE) && (NADJA_LUCIAINFO == FALSE))
	{
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_01");	//I just want to ask you a few questions about those missing people.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_02");	//I could tell you a thing or two, but not here, honey.
		AI_Output(other,self,"DIA_ADDON_Nadja_STANDARD_15_03");	//Then let's go upstairs.
		AI_Output(self,other,"DIA_ADDON_Nadja_STANDARD_16_04");	//Fine. But you get it settled with Bromor first. I don't want any trouble.
		NADJA_LUCIAINFO = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_DANACH(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_danach_condition;
	information = dia_nadja_danach_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_nadja_danach_condition()
{
	if(Npc_IsInState(self,zs_talk) && (BROMOR_PAY == FALSE) && (NADJA_NACHT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nadja_danach_info()
{
	AI_Output(self,other,"DIA_Nadja_Danach_16_00");	//Come back to me the next time.
	NADJA_NACHT = FALSE;
	AI_StopProcessInfos(self);
};


instance DIA_NADJA_HOCHGEHEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_hochgehen_condition;
	information = dia_nadja_hochgehen_info;
	important = FALSE;
	permanent = TRUE;
	description = "Let's go upstairs.";
};


func int dia_nadja_hochgehen_condition()
{
	if(BROMOR_PAY == 1)
	{
		return TRUE;
	};
};

func void dia_nadja_hochgehen_info()
{
	AI_Output(other,self,"DIA_Nadja_hochgehen_15_00");	//Let's go upstairs.
	AI_Output(self,other,"DIA_Nadja_hochgehen_16_01");	//Today's your lucky day, baby. Let's go.
	BROMOR_PAY = 2;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DANCE");
};


instance DIA_ADDON_NADJA_LUCIAINFO(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 5;
	condition = dia_addon_nadja_luciainfo_condition;
	information = dia_addon_nadja_luciainfo_info;
	description = "Can we talk now?";
};


func int dia_addon_nadja_luciainfo_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 200) && (NADJA_LUCIAINFO == TRUE))
	{
		return TRUE;
	};
};


var int nadja_gaveluciainfo;

func void dia_addon_nadja_luciainfo_info()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_15_00");	//So can we talk NOW?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_01");	//We've got enough privacy up here.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_02");	//Bromor doesn't like to see us talk to guests during work if there's nothing in it for him.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_03");	//So you want to know more about the people who disappeared down here at the harbor, do you?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_16_04");	//I don't know whether I can help you much, but at least I can tell you what became of Lucia.
	NADJA_GAVELUCIAINFO = TRUE;
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Where did she disappear to?",dia_addon_nadja_luciainfo_wo);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Tell me about Lucia.",dia_addon_nadja_luciainfo_lucia);
};

func void dia_addon_nadja_luciainfo_lucia()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_00");	//Tell me about Lucia.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_01");	//Nobody here is too sorry that she's gone.
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_lucia_15_02");	//Why?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_03");	//I don't think there was anyone here whom she didn't try to use.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_lucia_16_04");	//She was a real bitch!
};

func void dia_addon_nadja_luciainfo_wo()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_wo_15_00");	//Where did she disappear to?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_01");	//She used to see a lot of Elvrich, the apprentice of Thorben the carpenter from the lower part of town.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_wo_16_02");	//I bet she's up and left with that young man.
	Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_LUCIA,"Lucia the whore disappeared from Bromor's brothel overnight. They assume that she ran off with Elvrich, Thorben the carpenter's apprentice.");
	Info_AddChoice(dia_addon_nadja_luciainfo,"Where could the two of them have gone?",dia_addon_nadja_luciainfo_elvrich);
};

func void dia_addon_nadja_luciainfo_elvrich()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_Elvrich_15_00");	//Where could the two of them have gone?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_01");	//If the wolves didn't eat them, I suppose they went to stay with the farmers.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_Elvrich_16_02");	//Where else would they go?
	Info_AddChoice(dia_addon_nadja_luciainfo,"What else do you know?",dia_addon_nadja_luciainfo_sonst);
};

func void dia_addon_nadja_luciainfo_sonst()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_sonst_15_00");	//What else do you know?
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_01");	//I've heard many stories about people who disappeared down here at the harbor.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_02");	//But I'm not so sure whether I should believe them.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_03");	//You should have a chat with the merchants down here.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_04");	//That's all I can tell you, alas.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_05");	//Now, what about the two of us, sweetie? You paid for it, after all.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_sonst_16_06");	//Wouldn't you like to have a little fun before you leave?
	Info_ClearChoices(dia_addon_nadja_luciainfo);
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		Info_AddChoice(dia_addon_nadja_luciainfo,PRINT_ADDON_NADJAWAIT,dia_addon_nadja_wait);
	};
	Info_AddChoice(dia_addon_nadja_luciainfo,"Thanks. But I've got to go.",dia_addon_nadja_luciainfo_weiter);
	Info_AddChoice(dia_addon_nadja_luciainfo,"Why not...?",dia_nadja_poppen_start);
};

func void dia_addon_nadja_luciainfo_weiter()
{
	AI_Output(other,self,"DIA_Addon_Nadja_LuciaInfo_weiter_15_00");	//Thanks, but I've got to go now.
	AI_Output(self,other,"DIA_Addon_Nadja_LuciaInfo_weiter_16_01");	//Too bad. Well, maybe next time.
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_addon_nadja_wait()
{
	Info_ClearChoices(dia_addon_nadja_luciainfo);
};


instance DIA_NADJA_POPPEN(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 3;
	condition = dia_nadja_poppen_condition;
	information = dia_nadja_poppen_info;
	permanent = TRUE;
	description = "(Have fun)";
};


func int dia_nadja_poppen_condition()
{
	if((BROMOR_PAY == 2) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 300))
	{
		return TRUE;
	};
};

func void dia_nadja_poppen_info()
{
	AI_Output(self,other,"DIA_Nadja_Poppen_16_00");	//The next couple of hours belong to us.
	AI_Output(self,other,"DIA_Nadja_Poppen_16_01");	//It's time for you to relax. Lie back and enjoy.
	Info_ClearChoices(dia_nadja_poppen);
	Info_AddChoice(dia_nadja_poppen,"Okay...",dia_nadja_poppen_start);
};

func void dia_nadja_poppen_start()
{
	BROMOR_PAY = FALSE;
	NADJA_NACHT = NADJA_NACHT + 1;
	PlayVideo("LOVESCENE.BIK");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_addon_nadja_luciainfo_pop()
{
	dia_nadja_poppen_start();
};


instance DIA_NADJA_BUYHERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_buyherb_condition;
	information = dia_nadja_buyherb_info;
	permanent = TRUE;
	description = "Where can I buy weed here?";
};


func int dia_nadja_buyherb_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_nadja_want_herb) == FALSE) && (NADJA_MONEY == FALSE) && (UNDERCOVER_FAILED == FALSE))
	{
		return TRUE;
	};
};

func void dia_nadja_buyherb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_BUYHERB_15_00");	//Where can I buy weed around here?
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_NADJA") < 500)
	{
		if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_01");	//How would I know? Even if I knew, I'd certainly not tell the city guard.
			UNDERCOVER_FAILED = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_02");	//If you want me to tell you something, you'd better part with a few gold pieces.
			AI_Output(other,self,"DIA_Nadja_BUYHERB_15_03");	//How much do you want?
			AI_Output(self,other,"DIA_Nadja_BUYHERB_16_04");	//50 gold pieces should do the trick.
			NADJA_MONEY = TRUE;
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
	};
};


instance DIA_NADJA_WANT_HERB(C_INFO)
{
	npc = vlk_435_nadja;
	nr = 2;
	condition = dia_nadja_want_herb_condition;
	information = dia_nadja_want_herb_info;
	permanent = FALSE;
	description = "Now tell me where I can buy weed (pay 50 gold).";
};


func int dia_nadja_want_herb_condition()
{
	if((Npc_HasItems(other,itmi_gold) >= 50) && (NADJA_MONEY == TRUE) && (MIS_ANDRE_REDLIGHT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_nadja_want_herb_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Nadja_WANT_HERB_15_00");	//Now tell me where I can buy weed.
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_01");	//Sorry, I simply can't remember.
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,50);
		AI_Output(self,other,"DIA_Nadja_WANT_HERB_16_02");	//Talk to Borka, baby. He'll have some weed for you.
		KNOWS_BORKA_DEALER = TRUE;
	};
};

