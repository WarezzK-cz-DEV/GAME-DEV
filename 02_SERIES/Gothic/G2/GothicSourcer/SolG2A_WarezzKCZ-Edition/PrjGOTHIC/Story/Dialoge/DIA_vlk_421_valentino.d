
instance DIA_VALENTINO_EXIT(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 999;
	condition = dia_valentino_exit_condition;
	information = dia_valentino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_valentino_exit_condition()
{
	return TRUE;
};

func void dia_valentino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_HALLO(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 1;
	condition = dia_valentino_hallo_condition;
	information = dia_valentino_hallo_info;
	permanent = FALSE;
	description = "Well, what have we here?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//Well, what have we here?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//My name is Valentino. I'm trying not to profane this day given to me by Innos with work.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//Mind your words.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//Oh, pardon me, I meant no offense to our Lord. Please forgive me, sir.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//Have you no manners? That's disgusting!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//Always this filthy rabble. Haven't you a job where you ought to be?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//But I suppose no one would miss a down-at-the-heels fellow like you, hey?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//Well, if you had as much gold as I do, you wouldn't have to work either. But you'll never be that rich.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//I see I'm going to have lots of fun with you.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "I asked you who you are!";
};


func int dia_valentino_whoagain_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_valentino_whoagain_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//I asked you who you are!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//I am Valentino the handsome. Bon vivant and ladies' man.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//Poor in cares, rich in wisdom and gold, and the women throw themselves at me.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//If you have problems, keep them. I don't need them.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "Looks like I'm going to have to teach you some manners!";
};


func int dia_valentino_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_valentino_manieren_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//Looks like I'm going to have to teach you some manners!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//Doesn't matter to me! Thrash me all you want. When I get up tomorrow, I'll be fine again.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//But you'll have to run around with that mug of yours for life.
};


var int valentino_lo_perm;
var int valentino_hi_perm;

instance DIA_VALENTINO_WASNUETZLICHES(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 4;
	condition = dia_valentino_wasnuetzliches_condition;
	information = dia_valentino_wasnuetzliches_info;
	permanent = TRUE;
	description = "Do you have anything else to tell me?";
};


func int dia_valentino_wasnuetzliches_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo))
	{
		return TRUE;
	};
};

func void dia_valentino_wasnuetzliches_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(calmly) Do you have anything else to tell me?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//Make yourself popular, never promise anything to anyone, take what you can, and watch out that you don't get into a quarrel with the militia.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//Or with jealous husbands, of course - they're the worst, let me tell you.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//For a man in your position, anything is possible. You simply have to recognize when it's time to act.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//So don't waste any time, and act.
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//I've told you everything you need to know - the rest is up to you.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_KEY;
};


func int dia_valentino_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_valentino) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_valentino_pickpocket_info()
{
	Info_ClearChoices(dia_valentino_pickpocket);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_BACK,dia_valentino_pickpocket_back);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_PICKPOCKET,dia_valentino_pickpocket_doit);
};

func void dia_valentino_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_valentino,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_valentino_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_valentino_pickpocket_back()
{
	Info_ClearChoices(dia_valentino_pickpocket);
};

