
instance DIA_ADDON_MIGUEL_EXIT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 999;
	condition = dia_addon_miguel_exit_condition;
	information = dia_addon_miguel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_miguel_exit_condition()
{
	return TRUE;
};

func void dia_addon_miguel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIGUEL_PICKPOCKET(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 900;
	condition = dia_addon_miguel_pickpocket_condition;
	information = dia_addon_miguel_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_miguel_pickpocket_condition()
{
	return c_beklauen(40,48);
};

func void dia_addon_miguel_pickpocket_info()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_BACK,dia_addon_miguel_pickpocket_back);
	Info_AddChoice(dia_addon_miguel_pickpocket,DIALOG_PICKPOCKET,dia_addon_miguel_pickpocket_doit);
};

func void dia_addon_miguel_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};

func void dia_addon_miguel_pickpocket_back()
{
	Info_ClearChoices(dia_addon_miguel_pickpocket);
};


instance DIA_ADDON_MIGUEL_HI(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 1;
	condition = dia_addon_miguel_hi_condition;
	information = dia_addon_miguel_hi_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_addon_miguel_hi_condition()
{
	return TRUE;
};

func void dia_addon_miguel_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_00");	//What are you doing here?
	if(Wld_IsTime(6,0,22,0))
	{
		AI_Output(other,self,"DIA_Addon_Miguel_Hi_15_01");	//Are you looking for something?
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_02");	//Plants - I'm looking for plants.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_03");	//Usually, I look for plants.
	};
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_04");	//Most of the stuff that grows here can be used for something.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_05");	//Many plants have healing properties and you can smoke swampweed reefers.
	AI_Output(self,other,"DIA_Addon_Miguel_Hi_11_06");	//Before my time behind the Barrier I worked as an alchemist.
};


instance DIA_ADDON_MIGUEL_STORY(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 2;
	condition = dia_addon_miguel_story_condition;
	information = dia_addon_miguel_story_info;
	permanent = FALSE;
	description = "Why did they put you behind the Barrier?";
};


func int dia_addon_miguel_story_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_story_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Story_15_00");	//Why did they put you behind the Barrier?
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_01");	//I worked with mind-altering potions a lot.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_02");	//One evening, my master Ignaz drank my 'experiment' instead of his wine.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_03");	//That rendered him temporarily... eh... unpredictable, and since then he's been somewhat confused.
	AI_Output(self,other,"DIA_Addon_Miguel_Story_11_04");	//(snidely) The mages had me thrown behind the Barrier for that. 'Research into forbidden knowledge' they called it.
};


instance DIA_ADDON_MIGUEL_LAGER(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 3;
	condition = dia_addon_miguel_lager_condition;
	information = dia_addon_miguel_lager_info;
	permanent = FALSE;
	description = "What can you tell me about the camp?";
};


func int dia_addon_miguel_lager_condition()
{
	return TRUE;
};

func void dia_addon_miguel_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Lager_15_00");	//What can you tell me about the camp?
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_01");	//Not much. I have never been in there myself.
	AI_Output(self,other,"DIA_Addon_Miguel_Lager_11_02");	//Only Raven's people were there from the beginning. All the others who came later, like me, have to wait until they need new people.
};


instance DIA_ADDON_MIGUEL_WHEREFROM(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_wherefrom_condition;
	information = dia_addon_miguel_wherefrom_info;
	permanent = FALSE;
	description = "Where did you come from?";
};


func int dia_addon_miguel_wherefrom_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_hi) || Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_wherefrom_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_00");	//Where did you come from?
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_01");	//Well, the same way as you I suppose. With the pirates. Over the sea.
	AI_Output(self,other,"DIA_Addon_Miguel_WhereFrom_11_02");	//The valley here is completely cut off. There's no connection over land.
	AI_Output(other,self,"DIA_Addon_Miguel_WhereFrom_15_03");	//(thoughtfully) Right.
};


instance DIA_ADDON_MIGUEL_ANGEFORDERT(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 4;
	condition = dia_addon_miguel_angefordert_condition;
	information = dia_addon_miguel_angefordert_info;
	permanent = FALSE;
	description = "When do they need new people?";
};


func int dia_addon_miguel_angefordert_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_lager))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_angefordert_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Angefordert_15_00");	//When do they need new people?
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_01");	//Well, when they're missing some in there.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_02");	//If a digger gets himself eaten by a minecrawler, they let one of us replace him.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_03");	//Sometimes they also kill each other. But they've been better about that lately.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_04");	//Raven has controlled the access to the mine somehow, so that not everyone can get in at the same time.
	AI_Output(self,other,"DIA_Addon_Miguel_Angefordert_11_05");	//But I don't know exactly how that works. I've never been inside.
};


instance DIA_ADDON_MIGUEL_FORTUNO(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 6;
	condition = dia_addon_miguel_fortuno_condition;
	information = dia_addon_miguel_fortuno_info;
	permanent = FALSE;
	description = "About Fortuno...";
};


func int dia_addon_miguel_fortuno_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_free))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_fortuno_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_00");	//Fortuno is pretty confused and could use a potion to restore his memory.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_01");	//Fortuno? That's Raven's servant, no?
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_02");	//He was. Now he's just a wreck. And it's Raven's fault.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_03");	//Raven? Until now, I thought a lot of him. Hm, all right. But here in the swamp, I can't brew any potions.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_04");	//I could brew the potion. There's an alchemist's bench in the camp. I just need the recipe.
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_05");	//Be careful with this recipe. Brewing this potion is dangerous.
	b_giveinvitems(self,other,itwr_addon_mcelixier_01,1);
	AI_Output(self,other,"DIA_Addon_Miguel_Fortuno_11_06");	//If something goes wrong in the brewing or one of the ingredients isn't right, the potion will be deadly.
	AI_Output(other,self,"DIA_Addon_Miguel_Fortuno_15_07");	//I'll be careful.
	b_logentry(TOPIC_ADDON_FORTUNO,"Miguel has given me a recipe for a potion. I can use it to help Fortuno remember. I should only brew the potion when I am familiar with all of the ingredients. Otherwise it is deadly.");
};


instance DIA_ADDON_MIGUEL_BRAU(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 7;
	condition = dia_addon_miguel_brau_condition;
	information = dia_addon_miguel_brau_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_addon_miguel_brau_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_story))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_brau_info()
{
	AI_Output(other,self,"DIA_Addon_Miguel_BRAU_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_01");	//No time. I am here to get gold. And as long as I can't get into the camp, I make a living by selling my herbs.
	AI_Output(self,other,"DIA_Addon_Miguel_BRAU_11_02");	//But if you need a few potions, I still have some.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"I can buy potions and plants from Miguel.");
};


instance DIA_ADDON_MIGUEL_TRADE(C_INFO)
{
	npc = bdt_10022_addon_miguel;
	nr = 888;
	condition = dia_addon_miguel_trade_condition;
	information = dia_addon_miguel_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V1;
};


func int dia_addon_miguel_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_miguel_brau))
	{
		return TRUE;
	};
};

func void dia_addon_miguel_trade_info()
{
	b_say(other,self,"$TRADE_1");
	b_givetradeinv(self);
};

