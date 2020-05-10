
instance DIA_BULLCODJG_EXIT(C_INFO)
{
	npc = djg_701_bullco;
	nr = 999;
	condition = dia_bullcodjg_exit_condition;
	information = dia_bullcodjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bullcodjg_exit_condition()
{
	return TRUE;
};

func void dia_bullcodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BULLCODJG_HALLO(C_INFO)
{
	npc = djg_701_bullco;
	nr = 5;
	condition = dia_bullcodjg_hallo_condition;
	information = dia_bullcodjg_hallo_info;
	description = "What's the matter??";
};


func int dia_bullcodjg_hallo_condition()
{
	if(Npc_IsDead(djg_sylvio) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bullcodjg_hallo_info()
{
	AI_Output(other,self,"DIA_BullcoDJG_HALLO_15_00");	//What's the matter??
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_01");	//It's so damn cold here, man! I don't see why Sylvio insisted on coming here of all places.
	AI_Output(self,other,"DIA_BullcoDJG_HALLO_06_02");	//There's plenty of other places around where there's something to be had!
	AI_StopProcessInfos(self);
};


instance DIA_BULLCODJG_WARTEMAL(C_INFO)
{
	npc = djg_701_bullco;
	nr = 6;
	condition = dia_bullcodjg_wartemal_condition;
	information = dia_bullcodjg_wartemal_info;
	permanent = TRUE;
	description = "Everything else all right?";
};


func int dia_bullcodjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_bullcodjg_hallo) || Npc_KnowsInfo(other,dia_bullco_wasnun))
	{
		return TRUE;
	};
};

func void dia_bullcodjg_wartemal_info()
{
	AI_Output(other,self,"DIA_BullcoDJG_WARTEMAL_15_00");	//Everything else all right?
	if(Npc_KnowsInfo(other,dia_bullco_wasnun))
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_01");	//Just don't get on my nerves.
	}
	else
	{
		AI_Output(self,other,"DIA_BullcoDJG_WARTEMAL_06_02");	//Not now! I'm freezing! I just want to get out of here as fast as I can.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BULLCO_SYLVIODEAD(C_INFO)
{
	npc = djg_701_bullco;
	nr = 7;
	condition = dia_bullco_sylviodead_condition;
	information = dia_bullco_sylviodead_info;
	important = TRUE;
};


func int dia_bullco_sylviodead_condition()
{
	if(Npc_IsDead(djg_sylvio))
	{
		return TRUE;
	};
};

func void dia_bullco_sylviodead_info()
{
	AI_Output(self,other,"DIA_Bullco_SYLVIODEAD_06_00");	//Damnit. Sylvio is dead.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BULLCO_WASNUN(C_INFO)
{
	npc = djg_701_bullco;
	nr = 8;
	condition = dia_bullco_wasnun_condition;
	information = dia_bullco_wasnun_info;
	description = "What are your plans now that Sylvio is dead?";
};


func int dia_bullco_wasnun_condition()
{
	if(Npc_KnowsInfo(other,dia_bullco_sylviodead) && Npc_IsDead(djg_sylvio))
	{
		return TRUE;
	};
};

func void dia_bullco_wasnun_info()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_15_00");	//What are your plans now that Sylvio is dead?
	AI_Output(self,other,"DIA_Bullco_WASNUN_06_01");	//No idea. I guess I'll go with the other Dragon hunters if they still want me around.
	Info_AddChoice(dia_bullco_wasnun,"I ought to just tear off your head.",dia_bullco_wasnun_kopfab);
	Info_AddChoice(dia_bullco_wasnun,"Do you know where the others are?",dia_bullco_wasnun_woandere);
};

func void dia_bullco_wasnun_woandere()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_15_00");	//Do you know where the others are?
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_06_01");	//I think so. At least I saw one of them at the river over there.
	Info_AddChoice(dia_bullco_wasnun,"Take me to the other Dragon hunters.",dia_bullco_wasnun_woandere_zuihnen);
};

func void dia_bullco_wasnun_woandere_zuihnen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_15_00");	//Take me to the other Dragon hunters.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_06_01");	//Hey, I'm not your lackey.
	Info_ClearChoices(dia_bullco_wasnun);
	Info_AddChoice(dia_bullco_wasnun,"Suit yourself. I'm sure I'll find them.",dia_bullco_wasnun_woandere_zuihnen_alleine);
	Info_AddChoice(dia_bullco_wasnun,"Count yourself lucky if I let you live.",dia_bullco_wasnun_woandere_zuihnen_lebenlassen);
	Info_AddChoice(dia_bullco_wasnun,"I'll pay you 50 gold coins for it.",dia_bullco_wasnun_woandere_zuihnen_geld);
};

func void dia_bullco_wasnun_woandere_zuihnen_lebenlassen()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_15_00");	//Count yourself lucky if I let you live.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_lebenlassen_06_01");	//Leave me alone.
	AI_StopProcessInfos(self);
};

func void dia_bullco_wasnun_woandere_zuihnen_geld()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_15_00");	//I'll pay you 50 gold coins for it.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_01");	//All right then. Fork over the dough.
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_02");	//Follow me. I'll take you to where I last saw one of the other Dragon hunters.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DJGVorposten");
	}
	else
	{
		AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_Geld_06_03");	//You don't have 50 gold coins, and I'm not falling for that crap. Get lost.
		AI_StopProcessInfos(self);
	};
};

func void dia_bullco_wasnun_woandere_zuihnen_alleine()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_15_00");	//Suit yourself. I'm sure I'll find them.
	AI_Output(self,other,"DIA_Bullco_WASNUN_woandere_zuihnen_alleine_06_01");	//Don't get lost, then.
	AI_StopProcessInfos(self);
};

func void dia_bullco_wasnun_kopfab()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_15_00");	//I ought to just tear off your head.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_06_01");	//Shut that big trap of yours.
	Info_AddChoice(dia_bullco_wasnun,"Draw your weapon. We'll put an end to this now.",dia_bullco_wasnun_kopfab_angriff);
};

func void dia_bullco_wasnun_kopfab_angriff()
{
	AI_Output(other,self,"DIA_Bullco_WASNUN_kopfab_angriff_15_00");	//Draw your weapon. We'll put an end to this now.
	AI_Output(self,other,"DIA_Bullco_WASNUN_kopfab_angriff_06_01");	//So be it.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BULLCO_PICKPOCKET(C_INFO)
{
	npc = djg_701_bullco;
	nr = 900;
	condition = dia_bullco_pickpocket_condition;
	information = dia_bullco_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bullco_pickpocket_condition()
{
	return c_beklauen(34,65);
};

func void dia_bullco_pickpocket_info()
{
	Info_ClearChoices(dia_bullco_pickpocket);
	Info_AddChoice(dia_bullco_pickpocket,DIALOG_BACK,dia_bullco_pickpocket_back);
	Info_AddChoice(dia_bullco_pickpocket,DIALOG_PICKPOCKET,dia_bullco_pickpocket_doit);
};

func void dia_bullco_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bullco_pickpocket);
};

func void dia_bullco_pickpocket_back()
{
	Info_ClearChoices(dia_bullco_pickpocket);
};

