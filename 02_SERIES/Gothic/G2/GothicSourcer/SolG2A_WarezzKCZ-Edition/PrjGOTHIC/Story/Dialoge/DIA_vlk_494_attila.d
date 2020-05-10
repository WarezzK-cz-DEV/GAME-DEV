
instance DIA_ATTILA_EXIT(C_INFO)
{
	npc = vlk_494_attila;
	nr = 999;
	condition = dia_attila_exit_condition;
	information = dia_attila_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_attila_exit_condition()
{
	return TRUE;
};

func void dia_attila_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ATTILA_PICKPOCKET(C_INFO)
{
	npc = vlk_494_attila;
	nr = 900;
	condition = dia_attila_pickpocket_condition;
	information = dia_attila_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_attila_pickpocket_condition()
{
	return c_beklauen(55,100);
};

func void dia_attila_pickpocket_info()
{
	Info_ClearChoices(dia_attila_pickpocket);
	Info_AddChoice(dia_attila_pickpocket,DIALOG_BACK,dia_attila_pickpocket_back);
	Info_AddChoice(dia_attila_pickpocket,DIALOG_PICKPOCKET,dia_attila_pickpocket_doit);
};

func void dia_attila_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_attila_pickpocket);
};

func void dia_attila_pickpocket_back()
{
	Info_ClearChoices(dia_attila_pickpocket);
};


instance DIA_ATTILA_HALLO(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_hallo_condition;
	information = dia_attila_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_attila_hallo_condition()
{
	if(MIS_THIEFGUILD_SUCKED == TRUE)
	{
		return TRUE;
	};
};

func void dia_attila_hallo_info()
{
	AI_Output(self,other,"DIA_Attila_Hallo_09_00");	//(quietly) Ah - finally. I've been waiting for you, stranger.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"What do you want from me?",dia_attila_hallo_was);
	Info_AddChoice(dia_attila_hallo,"Who are you?",dia_attila_hallo_wer);
	b_giveplayerxp(XP_ATTILA_METHIM);
};

func void dia_attila_hallo_wer()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//I'm called Attila... but is my name important? Our names are meaningless.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//You should know that best, stranger. (laughs quietly)
	KNOWS_ATTILA_WER = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WAS == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"What do you want from me?",dia_attila_hallo_was);
	};
	Info_AddChoice(dia_attila_hallo,"What's this farce about?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_was()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Was_15_00");	//What do you want from me?
	AI_Output(self,other,"DIA_Attila_Hallo_Was_09_01");	//I'm here to explain a few things to you. And afterwards, I'm going to kill you.
	KNOWS_ATTILA_WAS = TRUE;
	Info_ClearChoices(dia_attila_hallo);
	if(KNOWS_ATTILA_WER == FALSE)
	{
		Info_AddChoice(dia_attila_hallo,"Who are you?",dia_attila_hallo_wer);
	};
	Info_AddChoice(dia_attila_hallo,"Who pays you for this?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"What's this farce about?",dia_attila_hallo_theater);
};

func void dia_attila_hallo_theater()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Theater_15_00");	//What's this farce about?
	AI_Output(self,other,"DIA_Attila_Hallo_Theater_09_01");	//You shouldn't die ignorant at the end of your journey. Consider it a final show of respect to the condemned.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"I'm going to leave now (END)",dia_attila_hallo_ende);
	Info_AddChoice(dia_attila_hallo,"Who pays you for this?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Why do you want to kill me?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_ende()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Ende_15_00");	//I'm going to leave now...
	AI_Output(self,other,"DIA_Attila_Hallo_Ende_09_01");	//I'm afraid... I can't allow that. Resign yourself to it. It is time to die.
	AI_DrawWeapon(self);
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Who pays you for this?",dia_attila_hallo_auftrag);
	Info_AddChoice(dia_attila_hallo,"Why do you want to kill me?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_auftrag()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Auftrag_15_00");	//Who pays you for this?
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_01");	//My employers work out of the public view, as do I.
	AI_Output(self,other,"DIA_Attila_Hallo_Auftrag_09_02");	//A condition of my contract is that I name neither their names nor their residences.
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"Why do you want to kill me?",dia_attila_hallo_warum);
};

func void dia_attila_hallo_warum()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Warum_15_00");	//Why do you want to kill me?
	if(BETRAYAL_HALVOR == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_01");	//You blew the whistle on Halvor. Now he's sitting in jail. That was not part of the plan.
	};
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_02");	//You sold Rengaru to the city. He is only a petty thief, but you shouldn't have done that.
	};
	if(NAGUR_AUSGELIEFERT == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_03");	//Nagur is behind bars because of your interference. An unforgivable mistake, as some see it.
	};
	if((BETRAYAL_HALVOR == TRUE) || (RENGARU_INKNAST == TRUE) || (NAGUR_AUSGELIEFERT == TRUE))
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Warum_09_04");	//My employers are not exactly pleased about it. To prevent you from making yet another mistake, they have sent me.
	};
	Info_ClearChoices(dia_attila_hallo);
	Info_AddChoice(dia_attila_hallo,"I can give you gold...",dia_attila_hallo_gold);
	Info_AddChoice(dia_attila_hallo,"Let me at least draw my weapon.",dia_attila_hallo_attacke);
};

func void dia_attila_hallo_gold()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Gold_15_00");	//I can give you gold - a lot of gold.
	AI_Output(self,other,"DIA_Attila_Hallo_Gold_09_01");	//Futile. That's not why I have come. The only price that you will pay is your life. And right now.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_attila_hallo_attacke()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Attacke_15_00");	//Let me at least draw my weapon.
	if(Npc_HasEquippedWeapon(other) == TRUE)
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_01");	//Good, then prepare for your last battle.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Attila_Hallo_Attacke_09_02");	//You're not even wearing one on your belt. You don't have much time left, stranger. Your death awaits you.
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,2);
	};
};


instance DIA_ATTILA_WILLKOMMEN(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_willkommen_condition;
	information = dia_attila_willkommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_attila_willkommen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_THIEFGUILD_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_attila_willkommen_info()
{
	AI_Output(self,other,"DIA_Attila_Willkommen_09_00");	//Ah - finally. I've been waiting for you, stranger.
	b_giveplayerxp(XP_ATTILA_FRIEND);
	AI_Output(other,self,"DIA_Attila_Willkommen_15_01");	//Who are you, and what do you want from me?
	AI_Output(self,other,"DIA_Attila_Willkommen_09_02");	//That isn't important. What is important is what you've done. You have remained loyal - even if you weren't aware of it.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_03");	//Some benefactors have become aware of your loyalty. And they are offering you a chance. So use it.
	AI_Output(other,self,"DIA_Attila_Willkommen_15_04");	//Hey, just tell me why you're here.
	AI_Output(self,other,"DIA_Attila_Willkommen_09_05");	//I have a gift for you. Everything else is up to you, stranger. (laughs quietly)
	b_giveinvitems(self,other,itke_thiefguildkey_mis,1);
	ATTILA_KEY = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_DROPDEADANDKILL] = FALSE;
	self.aivar[AIV_TOUGHGUY] = TRUE;
	Npc_ExchangeRoutine(self,"AFTER");
};


instance DIA_ATTILA_NACHSCHLUESSEL(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_nachschluessel_condition;
	information = dia_attila_nachschluessel_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_attila_nachschluessel_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_wer) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_attila_nachschluessel_info()
{
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_00");	//My task is done - for now.
	AI_Output(self,other,"DIA_Attila_NachSchluessel_09_01");	//But who knows, perhaps our paths will cross again...
	AI_StopProcessInfos(self);
};


instance DIA_ATTILA_WER(C_INFO)
{
	npc = vlk_494_attila;
	nr = 1;
	condition = dia_attila_wer_condition;
	information = dia_attila_wer_info;
	permanent = FALSE;
	description = "Who are you?";
};


func int dia_attila_wer_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_willkommen))
	{
		return TRUE;
	};
};

func void dia_attila_wer_info()
{
	AI_Output(other,self,"DIA_Attila_Hallo_Wer_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_01");	//I'm called Attila... but is my name important? Our names are meaningless.
	AI_Output(self,other,"DIA_Attila_Hallo_Wer_09_02");	//You should know that best, stranger. (laughs quietly)
	AI_StopProcessInfos(self);
};

