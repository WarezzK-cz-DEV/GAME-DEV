
instance DIA_HAUPTTORWACHE_EXIT(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 999;
	condition = dia_haupttorwache_exit_condition;
	information = dia_haupttorwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_haupttorwache_exit_condition()
{
	return TRUE;
};

func void dia_haupttorwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_AUFGABE(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 4;
	condition = dia_haupttorwache_aufgabe_condition;
	information = dia_haupttorwache_aufgabe_info;
	permanent = TRUE;
	description = "What's your job?";
};


func int dia_haupttorwache_aufgabe_condition()
{
	return TRUE;
};

func void dia_haupttorwache_aufgabe_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//What's your task?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//My assignment is simple. I'm supposed to make sure that the orcs stay away more than 30 feet from the gate.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//If they try to break through the portcullis, I sound the alarm. That's all.
};


instance DIA_HAUPTTORWACHE_TOROEFFNEN(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 5;
	condition = dia_haupttorwache_toroeffnen_condition;
	information = dia_haupttorwache_toroeffnen_info;
	permanent = TRUE;
	description = "What would one have to do to open the main gate?";
};


func int dia_haupttorwache_toroeffnen_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_haupttorwache_toroeffnen_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//What would one have to do to open the main gate?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//For heaven's sake. Why would you want to know that?
	self.flags = 0;
	Info_ClearChoices(dia_haupttorwache_toroeffnen);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"I'm worried about the safety of the castle.",dia_haupttorwache_toroeffnen_sicherheit);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"Never mind. Just asking.",dia_haupttorwache_toroeffnen_frage);
};

func void dia_haupttorwache_toroeffnen_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//I'm worried about the safety of the castle.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//So am I, all the time, believe me.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//And since I am such a faithful guardian, Garond has finally entrusted the key to the gate room to me.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(proudly) That's a great responsibility. I shall guard it well. I had to swear that to Garond.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//Yes. Just imagine someone coming and simply pulling the lever to open the gate, and that rusty, old steel grating getting jammed.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//Nobody could close the gate then. I mustn't think about what would happen next. It's a good thing no one knows that I have the key.
	AI_StopProcessInfos(self);
};

func void dia_haupttorwache_toroeffnen_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//Never mind. Just asking.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//Don't invite trouble by talking like that. Times are hard enough as it is. Now go. I'm busy.
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_PICKPOCKET(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 900;
	condition = dia_haupttorwache_pickpocket_condition;
	information = dia_haupttorwache_pickpocket_info;
	permanent = TRUE;
	description = "(It would be child's play to steal his key)";
};


func int dia_haupttorwache_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_oc_maingate_mis) >= 1) && (KAPITEL >= 5) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_haupttorwache_pickpocket_info()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_BACK,dia_haupttorwache_pickpocket_back);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_PICKPOCKET,dia_haupttorwache_pickpocket_doit);
};

func void dia_haupttorwache_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_oc_maingate_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_haupttorwache_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_haupttorwache_pickpocket_back()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
};

