
instance DIA_ADDON_FRANCIS_EXIT(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 999;
	condition = dia_addon_francis_exit_condition;
	information = dia_addon_francis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_francis_exit_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_francis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCIS_FIRST(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 1;
	condition = dia_addon_francis_first_condition;
	information = dia_addon_francis_first_info;
	permanent = FALSE;
	description = "Is this your hut?";
};


func int dia_addon_francis_first_condition()
{
	if((KNOWS_GREGSHUT == FALSE) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_first_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_GregsHut_15_00");	//Is this your hut?
	AI_Output(self,other,"DIA_Addon_Francis_GregsHut_13_01");	//No, it belongs to Greg.
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_FRANCIS_LETMEIN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 2;
	condition = dia_addon_francis_letmein_condition;
	information = dia_addon_francis_letmein_info;
	permanent = FALSE;
	description = "I must get into Greg's hut.";
};


func int dia_addon_francis_letmein_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_francis_first) || (KNOWS_GREGSHUT == TRUE)) && (FRANCIS_AUSGESCHISSEN == FALSE) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_letmein_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_LetMeIn_15_00");	//I must get into Greg's hut.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_01");	//Forget it!
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_02");	//Greg's not there. And I've locked the door and see to it that nobody sneaks around here to do a little looting.
	AI_Output(self,other,"DIA_Addon_Francis_LetMeIn_13_03");	//So make yourself scarce, or I'll let you have it!
};


instance DIA_ADDON_FRANCIS_ABOUTGREG(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 3;
	condition = dia_addon_francis_aboutgreg_condition;
	information = dia_addon_francis_aboutgreg_info;
	permanent = FALSE;
	description = "Greg is your boss?";
};


func int dia_addon_francis_aboutgreg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && (FRANCIS_AUSGESCHISSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aboutgreg_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AboutGreg_15_00");	//Greg is your boss?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_01");	//Now don't try and tell me that you know him!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_02");	//Any sailor - even any cursed landlubber on this island - knows the terrible Cap'n Greg!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_03");	//(snootily) And he left ME in command!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_04");	//I'm responsible for making those lazy bums do what he commanded!
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_05");	//Some of the boys may think they can do whatever they bloody well want now that the Captain's not here.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_06");	//Won't THEY be surprised when Greg comes back.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_07");	//I'll tell him everything that's been going on here, got it?
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_08");	//Including who's been trying to get into his hut.
	AI_Output(self,other,"DIA_Addon_Francis_AboutGreg_13_09");	//So make yourself scarce, or you'll be in a load of trouble.
};


var int francis_bezahlt;

instance DIA_ADDON_FRANCIS_KEY(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 4;
	condition = dia_addon_francis_key_condition;
	information = dia_addon_francis_key_info;
	permanent = TRUE;
	description = "Give me the key to Greg's hut!";
};


func int dia_addon_francis_key_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_key_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_15_00");	//Give me the key to Greg's hut!
	AI_Output(self,other,"DIA_Addon_Francis_Key_13_01");	//You must be joking!
	Info_ClearChoices(dia_addon_francis_key);
	Info_AddChoice(dia_addon_francis_key,"I'll think about it...",dia_addon_francis_key_back);
	Info_AddChoice(dia_addon_francis_key,"I'll give you 2000 gold pieces!",dia_addon_francis_key_2000gold);
	Info_AddChoice(dia_addon_francis_key,"I'll give you 1000 gold pieces!",dia_addon_francis_key_1000gold);
};

func void dia_addon_francis_key_back()
{
	Info_ClearChoices(dia_addon_francis_key);
};

func void dia_addon_francis_key_1000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_1000Gold_15_00");	//I'll give you 1000 gold pieces!
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_01");	//That's not quite enough to make me betray my Captain, I'm afraid.
	AI_Output(self,other,"DIA_Addon_Francis_Key_1000Gold_13_02");	//Be careful what you say, or I'll have your hide!
};

func void dia_addon_francis_key_2000gold()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_2000Gold_15_00");	//I'll give you 2000 gold pieces!
	if(Npc_HasItems(other,itmi_gold) >= 2000)
	{
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_01");	//Boy, what you're asking for is mutiny.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_02");	//(to himself) But, on second thought...
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_03");	//Oh well, give it here. No-one needs to know.
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_04");	//Here's the key!
		AI_Output(self,other,"DIA_Addon_Francis_Key_2000Gold_13_05");	//But hurry up before Greg comes back. And not a word to the others, understood?!
		b_giveinvitems(other,self,itmi_gold,2000);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		FRANCIS_BEZAHLT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_FrancisNotEnoughGold_13_05");	//(laughs) Ha! I bet you don't have that much!
	};
	Info_ClearChoices(dia_addon_francis_key);
};


instance DIA_ADDON_FRANCIS_AUFSMAUL(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_aufsmaul_condition;
	information = dia_addon_francis_aufsmaul_info;
	permanent = TRUE;
	description = "Well, then, let's see what you've got.";
};


func int dia_addon_francis_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_francis_letmein) && Npc_HasItems(self,itke_greg_addon_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_AufsMaul_15_00");	//Well, then, let's see what you've got.
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_01");	//(shrilly) What? I'm the Captain here!
	AI_Output(self,other,"DIA_Addon_Francis_AufsMaul_13_02");	//I'll teach you respect, you landlubber!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ADDON_FRANCIS_BUCH(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 5;
	condition = dia_addon_francis_buch_condition;
	information = dia_addon_francis_buch_info;
	permanent = TRUE;
	description = "I found your cache...";
};


func int dia_addon_francis_buch_condition()
{
	if(Npc_HasItems(other,itwr_addon_francisabrechnung_mis))
	{
		return TRUE;
	};
};

func void dia_addon_francis_buch_info()
{
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_03");	//I found your hiding-place. Your treasure and your paybook. This is your book, isn't it?
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_01");	//Er... I've never seen this book before.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_02");	//And... Er... even IF this were my book...
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_03");	//You don't REALLY believe the lads will buy YOUR story based on a few yellowed pages, do you?
	AI_Output(other,self,"DIA_Addon_Francis_Key_Business_15_01");	//You cheated them all out of their shares.
	AI_Output(self,other,"DIA_Addon_Francis_Buch_13_04");	//Er... wait a minute...
	if(Npc_HasItems(self,itke_greg_addon_mis))
	{
		if(Npc_KnowsInfo(other,dia_addon_francis_letmein))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_05");	//(slimily) You wanted the key to Greg's hut, didn't you?
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_06");	//I'll GIVE you the key to Greg's hut!
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_07");	//There's plenty of valuable stuff in there...
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_08");	//(nervously) But you'll give me the book and keep your trap shut, right?
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		Npc_RemoveInvItem(self,itwr_addon_francisabrechnung_mis);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_09");	//Just don't do anything stupid!
		if((FRANCIS_BEZAHLT == TRUE) && (Npc_HasItems(self,itmi_gold) >= 2000))
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_10");	//Here's your 2000 pieces of gold!
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_11");	//And I'll add another 500.
			b_giveinvitems(self,other,itmi_gold,2500);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Francis_Buch_13_12");	//Here's 500 gold pieces!
			b_giveinvitems(self,other,itmi_gold,500);
		};
		AI_Output(self,other,"DIA_Addon_Francis_Buch_13_13");	//(hastily) And now give me that thing...
		b_giveinvitems(other,self,itwr_addon_francisabrechnung_mis,1);
		Npc_RemoveInvItem(self,itwr_addon_francisabrechnung_mis);
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCIS_PICKPOCKET(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_pickpocket_condition;
	information = dia_francis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_KEY;
};


func int dia_francis_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_greg_addon_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_francis_pickpocket_info()
{
	Info_ClearChoices(dia_francis_pickpocket);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_BACK,dia_francis_pickpocket_back);
	Info_AddChoice(dia_francis_pickpocket,DIALOG_PICKPOCKET,dia_francis_pickpocket_doit);
};

func void dia_francis_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_greg_addon_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_francis_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
	Info_ClearChoices(dia_francis_pickpocket);
};

func void dia_francis_pickpocket_back()
{
	Info_ClearChoices(dia_francis_pickpocket);
};


instance DIA_FRANCIS_AUSGESCHISSEN(C_INFO)
{
	npc = pir_1350_addon_francis;
	nr = 900;
	condition = dia_francis_ausgeschissen_condition;
	information = dia_francis_ausgeschissen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_francis_ausgeschissen_condition()
{
	if((FRANCIS_AUSGESCHISSEN == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_francis_ausgeschissen_info()
{
	if(!Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_00");	//(furious) Thanks to you, Greg is making me saw planks now until there's no wood left on the island.
	};
	AI_Output(self,other,"DIA_Addon_Francis_Ausgeschissen_13_01");	//Just leave me alone!
	AI_StopProcessInfos(self);
};

