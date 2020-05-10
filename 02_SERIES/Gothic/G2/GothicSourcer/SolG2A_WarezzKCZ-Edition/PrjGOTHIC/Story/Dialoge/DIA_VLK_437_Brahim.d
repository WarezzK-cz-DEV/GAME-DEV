
var int brahim_showedmaps;

func void b_brahimnewmaps()
{
	if(BRAHIM_SHOWEDMAPS == TRUE)
	{
		AI_Output(self,other,"B_BrahimNewMaps_07_00");	//Come back again later. I'm sure to have something new for you then.
	};
};


instance DIA_BRAHIM_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_exit_condition;
	information = dia_brahim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_brahim_exit_info()
{
	b_brahimnewmaps();
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_PICKPOCKET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 900;
	condition = dia_brahim_pickpocket_condition;
	information = dia_brahim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brahim_pickpocket_condition()
{
	return c_beklauen(15,15);
};

func void dia_brahim_pickpocket_info()
{
	Info_ClearChoices(dia_brahim_pickpocket);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_BACK,dia_brahim_pickpocket_back);
	Info_AddChoice(dia_brahim_pickpocket,DIALOG_PICKPOCKET,dia_brahim_pickpocket_doit);
};

func void dia_brahim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brahim_pickpocket);
};

func void dia_brahim_pickpocket_back()
{
	Info_ClearChoices(dia_brahim_pickpocket);
};


instance DIA_BRAHIM_GREET(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 2;
	condition = dia_brahim_greet_condition;
	information = dia_brahim_greet_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_brahim_greet_condition()
{
	return TRUE;
};

func void dia_brahim_greet_info()
{
	AI_Output(other,self,"DIA_Brahim_GREET_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Brahim_GREET_07_01");	//My name is Brahim. I draw maps, and sell them.
	AI_Output(self,other,"DIA_Brahim_GREET_07_02");	//Since you're new here, maybe you could use a map of the city.
	AI_Output(self,other,"DIA_Brahim_GREET_07_03");	//It's quite affordable - and very useful until you know your way around.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Brahim draws and sells maps near the harbor.");
};


instance DIA_ADDON_BRAHIM_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 5;
	condition = dia_addon_brahim_missingpeople_condition;
	information = dia_addon_brahim_missingpeople_info;
	description = "Is it true that some townspeople have simply vanished?";
};


func int dia_addon_brahim_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_brahim_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Brahim_MissingPeople_15_00");	//Is it true that some townspeople have simply vanished?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_01");	//So I've heard. But I'm not sure whether it's really true.
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_02");	//Just look around you. Does this rathole look like the place where you want to spend your golden years?
	AI_Output(self,other,"DIA_Addon_Brahim_MissingPeople_07_03");	//Small wonder that people are getting themselves out of here.
};


instance DIA_BRAHIM_BUY(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 9;
	condition = dia_brahim_buy_condition;
	information = dia_brahim_buy_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Show me your maps.";
};


func int dia_brahim_buy_condition()
{
	if(Npc_KnowsInfo(hero,dia_brahim_greet) && (BRAHIM_ATTACKED_DAY <= Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_brahim_buy_info()
{
	AI_Output(other,self,"DIA_Brahim_BUY_15_00");	//Show me your maps.
	b_givetradeinv(self);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_01");	//You won't find better in that monastery of yours.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Brahim_BUY_07_02");	//Good maps are important, especially for people who come from the mainland, Mr. Paladin.
	};
	BRAHIM_SHOWEDMAPS = TRUE;
};


instance DIA_BRAHIM_KAP3_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_exit_condition;
	information = dia_brahim_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_KnowsInfo(other,dia_brahim_kap3_first_exit) || (Npc_HasItems(other,itwr_shatteredgolem_mis) == 0)))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_exit_info()
{
	if(KAPITEL <= 4)
	{
		b_brahimnewmaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_BRAHIM_KAP3_FIRST_EXIT(C_INFO)
{
	npc = vlk_437_brahim;
	nr = 999;
	condition = dia_brahim_kap3_first_exit_condition;
	information = dia_brahim_kap3_first_exit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_brahim_kap3_first_exit_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_brahim_kap3_first_exit_info()
{
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_00");	//I knew this piece would interest you.
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_15_01");	//What piece would that be?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_02");	//Well, that old map you just bought.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_07_03");	//I know your kind. You go for any chance of finding riches.
	Info_ClearChoices(dia_brahim_kap3_first_exit);
	Info_AddChoice(dia_brahim_kap3_first_exit,DIALOG_BACK,dia_brahim_kap3_first_exit_back);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Where did you get that document?",dia_brahim_kap3_first_exit_wheregetit);
	Info_AddChoice(dia_brahim_kap3_first_exit,"What kind of document is that?",dia_brahim_kap3_first_exit_content);
	Info_AddChoice(dia_brahim_kap3_first_exit,"Why don't you keep it for yourself?",dia_brahim_kap3_first_exit_keepit);
};

func void dia_brahim_kap3_first_exit_back()
{
	Info_ClearChoices(dia_brahim_kap3_first_exit);
};

func void dia_brahim_kap3_first_exit_wheregetit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00");	//Where did you get this map?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01");	//Oh, I found that in a stack of old maps which I bought recently.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02");	//The seller must have overlooked it.
};

func void dia_brahim_kap3_first_exit_content()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_Content_15_00");	//What kind of a map is it?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01");	//It seems to be a treasure map or the like.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02");	//But you look to me like one who will get to the heart of this matter himself.
};

func void dia_brahim_kap3_first_exit_keepit()
{
	AI_Output(other,self,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00");	//Why don't you keep it for yourself?
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01");	//I'm an old man, and the times when I set out myself are long past.
	AI_Output(self,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02");	//I leave that to younger people.
};

