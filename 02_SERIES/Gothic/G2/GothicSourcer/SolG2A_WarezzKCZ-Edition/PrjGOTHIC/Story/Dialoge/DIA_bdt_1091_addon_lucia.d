
instance DIA_ADDON_LUCIA_EXIT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 999;
	condition = dia_addon_lucia_exit_condition;
	information = dia_addon_lucia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_lucia_exit_condition()
{
	return TRUE;
};

func void dia_addon_lucia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LUCIA_PICKPOCKET(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 900;
	condition = dia_addon_lucia_pickpocket_condition;
	information = dia_addon_lucia_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80_FEMALE;
};


func int dia_addon_lucia_pickpocket_condition()
{
	return c_beklauen(80,100);
};

func void dia_addon_lucia_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_BACK,dia_addon_lucia_pickpocket_back);
	Info_AddChoice(dia_addon_lucia_pickpocket,DIALOG_PICKPOCKET,dia_addon_lucia_pickpocket_doit);
};

func void dia_addon_lucia_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};

func void dia_addon_lucia_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lucia_pickpocket);
};


instance DIA_ADDON_LUCIA_HI(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_hi_condition;
	information = dia_addon_lucia_hi_info;
	permanent = FALSE;
	description = "And? How's it going?";
};


func int dia_addon_lucia_hi_condition()
{
	return TRUE;
};

func void dia_addon_lucia_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Hi_15_00");	//And? How's it going?
	AI_Output(self,other,"DIA_Addon_Lucia_Hi_16_01");	//Listen. If you want something to eat, go to Snaf. If you want something to drink, you're in the right place.
};


instance DIA_ADDON_LUCIA_WAS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_was_condition;
	information = dia_addon_lucia_was_info;
	permanent = FALSE;
	description = "What do you drink here then?";
};


func int dia_addon_lucia_was_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_was_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_was_15_00");	//What do you drink here then?
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_01");	//We only have a little beer. The only beer on the island was brought by the paladins.
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_02");	//Just about the only good thing those fellows brought with them...
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_03");	//Otherwise we drink booze. I've got moonshine, grog and white rum -
	AI_Output(self,other,"DIA_Addon_Lucia_was_16_04");	//(appreciatively) hmmm... you should try THAT - I got the recipe from Samuel. The old boy really knows his trade.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"I can get booze from Lucia.");
};


instance DIA_ADDON_LUCIA_KHORINIS(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_khorinis_condition;
	information = dia_addon_lucia_khorinis_info;
	permanent = FALSE;
	description = "Aren't you from Khorinis?";
};


func int dia_addon_lucia_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bromor_lucia) || (NADJA_GAVELUCIAINFO == TRUE) || Npc_KnowsInfo(other,dia_addon_elvrich_whatexactly))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_00");	//Aren't you from Khorinis?
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_01");	//Don't remind me! My life in that city was horrible.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_02");	//While the ships with the new convicts kept coming in, there was still life in town.
	AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_03");	//But all those other guys...(laughs) No thanks. Maybe it's because we're on an island... well, those days are over.
	if((MIS_LUCIASLETTER != 0) || (SC_KNOWSLUCIACAUGHTBYBANDITS != 0) || (NADJA_GAVELUCIAINFO != 0))
	{
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_06");	//I'm finished with Elvrich!
		AI_Output(other,self,"DIA_Addon_Lucia_Khorinis_15_04");	//Why?
		AI_Output(self,other,"DIA_Addon_Lucia_Khorinis_16_05");	//He's a wimp! When the bandits dragged me off, he didn't lift a finger to help me.
		TOPIC_END_LUCIA = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	};
	TOPIC_END_LUCIA = TRUE;
};


instance DIA_ADDON_LUCIA_JETZT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_jetzt_condition;
	information = dia_addon_lucia_jetzt_info;
	permanent = FALSE;
	description = "What are you planning to do?";
};


func int dia_addon_lucia_jetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_jetzt_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Jetzt_15_00");	//What are you planning to do?
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_01");	//We'll see. For now, I'll stay here with Snaf, Fisk and the others.
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_02");	//Have you already talked to Thorus? (rolls her eyes) Oh, Innos, is that a hunk of a man!
	AI_Output(self,other,"DIA_Addon_Lucia_Jetzt_16_03");	//(laughs) Excuse me... let's get back to your question... I haven't set a goal, I'm only drifting.
};


instance DIA_ADDON_LUCIA_PALADINE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 2;
	condition = dia_addon_lucia_paladine_condition;
	information = dia_addon_lucia_paladine_info;
	permanent = FALSE;
	description = "You're not very fond of the paladins, are you?";
};


func int dia_addon_lucia_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_paladine_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_15_00");	//You're not very fond of the paladins, are you?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_01");	//Those fanatical murderers in the pay of the Fire Magicians? No.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_02");	//That Lord Hagen occupies the city with his thugs, and everybody bows down to him.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_16_03");	//And I didn't want to do that. I wasn't going to wait until they closed down the Red Lantern and locked me up.
	if((Npc_GetTrueGuild(other) != GIL_SLD) && (Npc_GetTrueGuild(other) != GIL_DJG))
	{
		Info_ClearChoices(dia_addon_lucia_paladine);
		Info_AddChoice(dia_addon_lucia_paladine,"End conversation.",dia_addon_lucia_paladine_back);
		Info_AddChoice(dia_addon_lucia_paladine,"The paladins don't only fight in his name. Innos chooses his warriors.",dia_addon_lucia_paladine_wahl);
		Info_AddChoice(dia_addon_lucia_paladine,"The paladins are the warriors of Innos. They aren't murderers.",dia_addon_lucia_paladine_murder);
	};
};

func void dia_addon_lucia_paladine_back()
{
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_wahl()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WAHL_15_00");	//The paladins don't only fight in his name. Innos chooses his warriors.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_01");	//So? I believe it's the people who choose themselves.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WAHL_16_02");	//Still, your words amaze me. You talk almost like you were one of them.
	Info_AddChoice(dia_addon_lucia_paladine,"Have you ever killed someone?",dia_addon_lucia_paladine_kill);
};

func void dia_addon_lucia_paladine_kill()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_KILL_15_00");	//Have you ever killed someone?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_01");	//No, and I'm very glad of it.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_02");	//Please, let's not be so serious any more.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_KILL_16_03");	//Instead, let's drink and enjoy every moment the gods give us.
	Info_ClearChoices(dia_addon_lucia_paladine);
};

func void dia_addon_lucia_paladine_weib()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_WEIB_15_00");	//Do you deny Innos then, wench?
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_01");	//How could I? It's just people who misuse his name.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_WEIB_16_02");	//But I never doubted Innos' divine splendor for a second.
};

func void dia_addon_lucia_paladine_murder()
{
	AI_Output(other,self,"DIA_Addon_Lucia_Paladine_MURDER_15_00");	//The paladins are the warriors of Innos. They aren't murderers.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_01");	//So? Blood sticks to their swords too - just like the weapons of the pirates or the bandits.
	AI_Output(self,other,"DIA_Addon_Lucia_Paladine_MURDER_16_02");	//The only difference is they do it in Innos' name and not because they want to survive.
	Info_AddChoice(dia_addon_lucia_paladine,"Do you deny Innos then, wench?",dia_addon_lucia_paladine_weib);
};


instance DIA_ADDON_LUCIA_ATTENTAT(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 9;
	condition = dia_addon_lucia_attentat_condition;
	information = dia_addon_lucia_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_lucia_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lucia_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Lucia_Attentat_16_00");	//Nothing at all.
};


instance DIA_ADDON_LUCIA_TRADE(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 99;
	condition = dia_addon_lucia_trade_condition;
	information = dia_addon_lucia_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Give me something to drink.";
};


func int dia_addon_lucia_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_was))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_trade_info()
{
	if(LUCIA_FLAG == 1)
	{
		b_clearalchemyinv(self);
		if(LUCIA_FLASKS > 0)
		{
			CreateInvItems(self,itmi_flask,LUCIA_FLASKS);
		};
		LUCIA_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Addon_Lucia_Trade_15_00");	//Give me something to drink.
	b_givetradeinv(self);
};


instance DIA_ADDON_LUCIA_LERNEN(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 19;
	condition = dia_addon_lucia_lernen_condition;
	information = dia_addon_lucia_lernen_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_addon_lucia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_lernen_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_lernen_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Lucia_lernen_16_01");	//(laughs) Only too gladly. You can train your DEXTERITY with me.
	Log_CreateTopic(TOPIC_ADDON_BDT_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TEACHER,"Lucia can help me train my dexterity.");
};


instance DIA_ADDON_LUCIA_TEACH(C_INFO)
{
	npc = bdt_1091_addon_lucia;
	nr = 101;
	condition = dia_addon_lucia_teach_condition;
	information = dia_addon_lucia_teach_info;
	permanent = TRUE;
	description = "I want to become more dexterous.";
};


func int dia_addon_lucia_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lucia_lernen))
	{
		return TRUE;
	};
};

func void dia_addon_lucia_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lucia_TEACH_15_00");	//I want to become more dexterous.
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_back()
{
	Info_ClearChoices(dia_addon_lucia_teach);
};

func void dia_addon_lucia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_lucia_teach_5);
};

func void dia_addon_lucia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_addon_lucia_teach);
	Info_AddChoice(dia_addon_lucia_teach,DIALOG_BACK,dia_addon_lucia_teach_back);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_lucia_teach_1);
	Info_AddChoice(dia_addon_lucia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_lucia_teach_5);
};

