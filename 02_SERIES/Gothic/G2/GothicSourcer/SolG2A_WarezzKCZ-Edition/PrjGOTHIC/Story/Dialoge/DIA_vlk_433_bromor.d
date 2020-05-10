
instance DIA_BROMOR_EXIT(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 999;
	condition = dia_bromor_exit_condition;
	information = dia_bromor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bromor_exit_condition()
{
	return TRUE;
};

func void dia_bromor_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_GIRLS(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_girls_condition;
	information = dia_bromor_girls_info;
	permanent = FALSE;
	description = "Are you the one who runs this place?";
};


func int dia_bromor_girls_condition()
{
	if(NPCOBSESSEDBYDMT_BROMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_bromor_girls_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_GIRLS_15_00");	//Are you the one who runs this place?
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_02");	//I am Bromor. This is my house, and these are my girls. I like my girls.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_03");	//And if you like my girls, too, then you'll pay for it - 50 gold pieces.
	AI_Output(self,other,"DIA_Bromor_GIRLS_07_04");	//And don't get the idea of making trouble here.
};


instance DIA_ADDON_BROMOR_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_addon_bromor_missingpeople_condition;
	information = dia_addon_bromor_missingpeople_info;
	description = "Are all your girls accounted for?";
};


func int dia_addon_bromor_missingpeople_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && Npc_KnowsInfo(other,dia_bromor_girls))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_00");	//Are all your girls accounted for?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_01");	//Of course they are. Or did you think I want to go to jail over something like that?
	AI_Output(other,self,"DIA_Addon_Bromor_MissingPeople_15_02");	//(irritated) Er... I wasn't asking about your payroll. I mean, are they all PRESENT? Or have any gone missing?
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_03");	//Oh. Yes, actually. One of my girls has up and left. Her name's Lucia.
	AI_Output(self,other,"DIA_Addon_Bromor_MissingPeople_07_04");	//I reported it to the militia, too. But they claim they haven't found a trace of her yet.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"A whore named Lucia has disappeared from the brothel down by the harbor.");
};


instance DIA_ADDON_BROMOR_LUCIA(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_lucia_condition;
	information = dia_addon_bromor_lucia_info;
	description = "How long has Lucia been missing?";
};


func int dia_addon_bromor_lucia_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && Npc_KnowsInfo(other,dia_addon_bromor_missingpeople))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_lucia_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_Lucia_15_00");	//How long has Lucia been missing?
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_01");	//Several days. I don't know exactly how long.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_02");	//I assume she's run off with one of her suitors.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_03");	//That bitch made off with part of my savings. A really valuable golden dish.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_04");	//If I get hold of her, I'll give her what for.
	AI_Output(self,other,"DIA_Addon_Bromor_Lucia_07_05");	//So how's that any business of YOURS? Are you trying to make fun of me, or what?
	Log_CreateTopic(TOPIC_ADDON_BROMORSGOLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BROMORSGOLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BROMORSGOLD,"Lucia the whore stole a golden dish from her boss, Bromor. Bromor wants it back.");
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_RUNNING;
};


instance DIA_ADDON_BROMOR_LUCIAGOLD(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 5;
	condition = dia_addon_bromor_luciagold_condition;
	information = dia_addon_bromor_luciagold_info;
	permanent = TRUE;
	description = "I found the dish that Lucia stole from you.";
};


func int dia_addon_bromor_luciagold_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == FALSE) && (MIS_BROMOR_LUCIASTOLEGOLD == LOG_RUNNING) && Npc_HasItems(other,itmi_bromorsgeld_addon))
	{
		return TRUE;
	};
};

func void dia_addon_bromor_luciagold_info()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_15_00");	//I found the dish that Lucia stole from you.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_07_01");	//Great! High time I got it back.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(BROMOR_HAUSVERBOT == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"What about a reward?",dia_addon_bromor_luciagold_lohn);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"Here's your dish.",dia_addon_bromor_luciagold_einfachgeben);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Don't you want to know what became of Lucia?",dia_addon_bromor_luciagold_lucia);
	};
};

func void dia_addon_bromor_luciagold_einfachgeben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_einfachgeben_15_00");	//Here's your dish.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_einfachgeben_07_01");	//Thanks. That's very generous of you. Anything else?
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


var int dia_addon_bromor_luciagold_lucia_onetime;

func void dia_addon_bromor_luciagold_lucia()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lucia_15_00");	//Don't you want to know what became of Lucia?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_01");	//No. Why? I've got the dish back, haven't I?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lucia_07_02");	//I've managed without Lucia so far, and I will in the future. Why would I try to make her come back?
	dia_addon_bromor_luciagold_lucia_onetime = TRUE;
};

func void dia_addon_bromor_luciagold_lohn()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_lohn_15_00");	//What about a reward?
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_lohn_07_01");	//You get to have a good time with one of my girls - for free. What do you say?
	Info_ClearChoices(dia_addon_bromor_luciagold);
	if(DIA_ADDON_BROMOR_LUCIAGOLD_LUCIA_ONETIME == FALSE)
	{
		Info_AddChoice(dia_addon_bromor_luciagold,"Don't you want to know what became of Lucia?",dia_addon_bromor_luciagold_lucia);
	};
	Info_AddChoice(dia_addon_bromor_luciagold,"That's not enough.",dia_addon_bromor_luciagold_mehr);
	Info_AddChoice(dia_addon_bromor_luciagold,"Agreed. Here's your dish.",dia_addon_bromor_luciagold_geben);
};

func void dia_addon_bromor_luciagold_mehr()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_mehr_15_00");	//That's not enough.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_mehr_07_01");	//Take it, or you needn't show your face around here again.
	Info_AddChoice(dia_addon_bromor_luciagold,"Forget it.",dia_addon_bromor_luciagold_nein);
};

func void dia_addon_bromor_luciagold_nein()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_nein_15_00");	//Forget it.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_01");	//Then leave my establishment right now, you bastard.
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_nein_07_02");	//And don't even think that you'll get served here ever again.
	Info_ClearChoices(dia_addon_bromor_luciagold);
	BROMOR_HAUSVERBOT = TRUE;
	BROMOR_PAY = 0;
};

func void dia_addon_bromor_luciagold_geben()
{
	AI_Output(other,self,"DIA_Addon_Bromor_LuciaGold_geben_15_00");	//Agreed. Here's your dish.
	b_giveinvitems(other,self,itmi_bromorsgeld_addon,1);
	AI_Output(self,other,"DIA_Addon_Bromor_LuciaGold_geben_07_01");	//Thanks. Go to Nadja. She'll accompany you upstairs.
	BROMOR_PAY = 1;
	MIS_BROMOR_LUCIASTOLEGOLD = LOG_SUCCESS;
	BROMOR_HAUSVERBOT = FALSE;
	b_giveplayerxp(XP_ADDON_BROMOR_LUCIAGOLD);
	Info_ClearChoices(dia_addon_bromor_luciagold);
};


instance DIA_BROMOR_PAY(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 2;
	condition = dia_bromor_pay_condition;
	information = dia_bromor_pay_info;
	permanent = TRUE;
	description = "I want to have some fun (pay 50 pieces of gold).";
};


func int dia_bromor_pay_condition()
{
	if((BROMOR_PAY == FALSE) && (BROMOR_HAUSVERBOT == FALSE) && Npc_KnowsInfo(other,dia_bromor_girls) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (Npc_IsDead(nadja) == FALSE))
	{
		return TRUE;
	};
};


var int dia_bromor_pay_onetime;

func void dia_bromor_pay_info()
{
	AI_Output(other,self,"DIA_Bromor_Pay_15_00");	//I want to have some fun.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_01");	//Fine. (grins) You're not likely to forget the next few hours of your life any time soon.
		AI_Output(self,other,"DIA_Bromor_Pay_07_02");	//Go upstairs with Nadja, then. Have fun.
		if(DIA_BROMOR_PAY_ONETIME == FALSE)
		{
			DIA_BROMOR_PAY_ONETIME = TRUE;
		};
		BROMOR_PAY = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Bromor_Pay_07_03");	//I can't stand it when people try to pull my leg. Get out of here if you can't pay.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_DOPE(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 3;
	condition = dia_bromor_dope_condition;
	information = dia_bromor_dope_info;
	permanent = FALSE;
	description = "Can I get 'special' goods here, too?";
};


func int dia_bromor_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (BROMOR_HAUSVERBOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bromor_dope_info()
{
	AI_Output(other,self,"DIA_Bromor_DOPE_15_00");	//Can I get 'special' goods here, too?
	AI_Output(self,other,"DIA_Bromor_DOPE_07_01");	//Sure, all my girls are very special. (grins)
	AI_Output(self,other,"DIA_Bromor_DOPE_07_02");	//If you have enough gold, you can go upstairs with Nadja.
};


instance DIA_BROMOR_OBSESSION(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 30;
	condition = dia_bromor_obsession_condition;
	information = dia_bromor_obsession_info;
	description = "Are you all right?";
};


func int dia_bromor_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_BROMOR == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_bromor_obsession_gotmoney;

func void dia_bromor_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_BROMOR_HEILUNG(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 55;
	condition = dia_bromor_heilung_condition;
	information = dia_bromor_heilung_info;
	permanent = TRUE;
	description = "You're possessed!";
};


func int dia_bromor_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_BROMOR == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_bromor_heilung_info()
{
	AI_Output(other,self,"DIA_Bromor_Heilung_15_00");	//You are possessed.
	AI_Output(self,other,"DIA_Bromor_Heilung_07_01");	//What? What are you talking about? Get out of here.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BROMOR_PICKPOCKET(C_INFO)
{
	npc = vlk_433_bromor;
	nr = 900;
	condition = dia_bromor_pickpocket_condition;
	information = dia_bromor_pickpocket_info;
	permanent = TRUE;
	description = "(It would be risky to steal his key)";
};


func int dia_bromor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_bromor) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bromor_pickpocket_info()
{
	Info_ClearChoices(dia_bromor_pickpocket);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_BACK,dia_bromor_pickpocket_back);
	Info_AddChoice(dia_bromor_pickpocket,DIALOG_PICKPOCKET,dia_bromor_pickpocket_doit);
};

func void dia_bromor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_bromor,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bromor_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bromor_pickpocket_back()
{
	Info_ClearChoices(dia_bromor_pickpocket);
};

