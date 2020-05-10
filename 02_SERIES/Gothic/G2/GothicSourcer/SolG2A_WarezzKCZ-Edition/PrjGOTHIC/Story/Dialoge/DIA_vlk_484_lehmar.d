
instance DIA_LEHMAR_EXIT(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 999;
	condition = dia_lehmar_exit_condition;
	information = dia_lehmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lehmar_exit_condition()
{
	return TRUE;
};

func void dia_lehmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_ENTSCHULDIGUNG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 2;
	condition = dia_lehmar_entschuldigung_condition;
	information = dia_lehmar_entschuldigung_info;
	permanent = FALSE;
	description = "What's up?";
};


func int dia_lehmar_entschuldigung_condition()
{
	return TRUE;
};

func void dia_lehmar_entschuldigung_info()
{
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_01");	//(bored) How much do you want?
	AI_Output(other,self,"DIA_Lehmar_ENTSCHULDIGUNG_15_02");	//What do you mean, 'how much'?
	AI_Output(self,other,"DIA_Lehmar_ENTSCHULDIGUNG_09_03");	//I'm the moneylender and you came to me. What could you want from me? Money, of course.
};


instance DIA_LEHMAR_GELDLEIHEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_geldleihen_condition;
	information = dia_lehmar_geldleihen_info;
	permanent = TRUE;
	description = "Lend me some money!";
};


var int dia_lehmar_geldleihen_noperm;

func int dia_lehmar_geldleihen_condition()
{
	if(Npc_KnowsInfo(other,dia_lehmar_entschuldigung) && (DIA_LEHMAR_GELDLEIHEN_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldleihen_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_15_00");	//Lend me some money!
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_09_01");	//Sure! How much would you like? I charge 20 percent!
	Info_ClearChoices(dia_lehmar_geldleihen);
	Info_AddChoice(dia_lehmar_geldleihen,"I'll think about it.",dia_lehmar_geldleihen_back);
	Info_AddChoice(dia_lehmar_geldleihen,"1000 gold coins.",dia_lehmar_geldleihen_1000);
	Info_AddChoice(dia_lehmar_geldleihen," 200 gold coins.",dia_lehmar_geldleihen_200);
	Info_AddChoice(dia_lehmar_geldleihen,"  50 gold coins.",dia_lehmar_geldleihen_50);
};

func void dia_lehmar_geldleihen_back()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_back_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_back_09_01");	//Make up your mind! Don't waste my time!
	AI_StopProcessInfos(self);
};

func void dia_lehmar_geldleihen_50()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_50_15_00");	//50 gold coins.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_50_09_01");	//Small fry, huh? I want it back tomorrow, got it?
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 50;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_200()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_200_15_00");	//200 gold coins.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_200_09_01");	//That's a lot of money. I'll see you here again tomorrow, and the money too, understand?
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 200;
	Info_ClearChoices(dia_lehmar_geldleihen);
};

func void dia_lehmar_geldleihen_1000()
{
	AI_Output(other,self,"DIA_Lehmar_GELDLEIHEN_1000_15_00");	//1000 gold coins.
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_01");	//You got a couple of screws loose or something?
	AI_Output(self,other,"DIA_Lehmar_GELDLEIHEN_1000_09_02");	//I'll give you 100. And don't forget, I want it back tomorrow!
	CreateInvItems(self,itmi_gold,100);
	b_giveinvitems(self,other,itmi_gold,100);
	DIA_LEHMAR_GELDLEIHEN_NOPERM = TRUE;
	LEHMAR_GELDGELIEHEN_DAY = Wld_GetDay();
	LEHMAR_GELDGELIEHEN = 100;
	Info_ClearChoices(dia_lehmar_geldleihen);
};


instance DIA_LEHMAR_WARUMGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 3;
	condition = dia_lehmar_warumgeld_condition;
	information = dia_lehmar_warumgeld_info;
	permanent = FALSE;
	description = "Do you always throw your money at people like that?";
};


func int dia_lehmar_warumgeld_condition()
{
	if(LEHMAR_GELDGELIEHEN != 0)
	{
		return TRUE;
	};
};

func void dia_lehmar_warumgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_WARUMGELD_15_00");	//Do you always throw your money at people like that?
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_01");	//(amused) Don't worry. You'll be back. Otherwise I'll find you and kill you. It's that simple.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_02");	//You've got such a distinctive mug that it wouldn't take long for me to find you.
	AI_Output(self,other,"DIA_Lehmar_WARUMGELD_09_03");	//So don't even think about mucking around with me.
};


var int lehmar_vorbei;

instance DIA_LEHMAR_GELDEINTREIBEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 5;
	condition = dia_lehmar_geldeintreiben_condition;
	information = dia_lehmar_geldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_geldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_00");	//You're overdue, you bastard! Give me my cash! And since I had to remind you about it, it gets more expensive.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_09_01");	//That will cost you 30 percent instead of the usual 20.
	Info_ClearChoices(dia_lehmar_geldeintreiben);
	Info_AddChoice(dia_lehmar_geldeintreiben,"I'll pay my debts.",dia_lehmar_geldeintreiben_schuldenzahlen);
	Info_AddChoice(dia_lehmar_geldeintreiben,"I'm not giving you anything.",dia_lehmar_geldeintreiben_kannstmich);
};

func void dia_lehmar_geldeintreiben_kannstmich()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_15_00");	//I'm not giving you anything.
	AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_kannstmich_09_01");	//Oh yes, you will.
	LEHMAR_VORBEI = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_lehmar_geldeintreiben_schuldenzahlen()
{
	AI_Output(other,self,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_15_00");	//I'll pay my debts.
	if(LEHMAR_GELDGELIEHEN == 50)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 65;
	};
	if(LEHMAR_GELDGELIEHEN == 200)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 260;
	};
	if(LEHMAR_GELDGELIEHEN == 100)
	{
		LEHMAR_GELDGELIEHEN_MITZINSEN = 130;
	};
	IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
	if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
	{
		b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_01");	//Lucky you! And now scram!
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_02");	//You don't have enough on you! Well, fine. I see I'll have to teach you a lesson.
		AI_Output(self,other,"DIA_Lehmar_GELDEINTREIBEN_schuldenzahlen_09_03");	//Don't take it personally - I have a reputation to maintain.
		LEHMAR_VORBEI = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_LEHMAR_GELDZURUECK(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 6;
	condition = dia_lehmar_geldzurueck_condition;
	information = dia_lehmar_geldzurueck_info;
	permanent = TRUE;
	description = "Here's your money back!";
};


func int dia_lehmar_geldzurueck_condition()
{
	if(!Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Lehmar_GELDZURUECK_15_00");	//Here's your money back!
	if((RANGERHELP_LEHMARKOHLE == TRUE) && (LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)))
	{
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_00");	//Don't worry. Lares has already taken care of this for you.
		AI_Output(self,other,"DIA_Addon_Lehmar_GELDZURUECK_09_01");	//That bastard is a friend of yours, huh? Oh well, none of my business. Have a nice day.
		LEHMAR_GELDGELIEHEN = 0;
		AI_StopProcessInfos(self);
	}
	else
	{
		if(LEHMAR_GELDGELIEHEN == 50)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 60;
		};
		if(LEHMAR_GELDGELIEHEN == 200)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 240;
		};
		if(LEHMAR_GELDGELIEHEN == 100)
		{
			LEHMAR_GELDGELIEHEN_MITZINSEN = 120;
		};
		IntToFloat(LEHMAR_GELDGELIEHEN_MITZINSEN);
		if(Npc_HasItems(other,itmi_gold) >= LEHMAR_GELDGELIEHEN_MITZINSEN)
		{
			b_giveinvitems(other,self,itmi_gold,LEHMAR_GELDGELIEHEN_MITZINSEN);
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_01");	//Wonderful! Nice doing business with you.
			LEHMAR_GELDGELIEHEN = 0;
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Lehmar_GELDZURUECK_09_02");	//You don't have enough! Come back when you have it. Your deadline is still open. Remember, 20 percent!
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_LEHMAR_NOCHMALGELD(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 8;
	condition = dia_lehmar_nochmalgeld_condition;
	information = dia_lehmar_nochmalgeld_info;
	permanent = TRUE;
	description = "Can I borrow some more money from you?";
};


func int dia_lehmar_nochmalgeld_condition()
{
	if((LEHMAR_GELDGELIEHEN == 0) && (LEHMAR_GELDGELIEHEN_MITZINSEN != 0))
	{
		return TRUE;
	};
};

func void dia_lehmar_nochmalgeld_info()
{
	AI_Output(other,self,"DIA_Lehmar_NOCHMALGELD_15_00");	//Can I borrow some more money from you?
	if(Npc_KnowsInfo(other,dia_lehmar_geldeintreiben) || Npc_KnowsInfo(other,dia_lehmar_buchweg))
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_01");	//Do you think I'm stupid? Buzz off!
	}
	else
	{
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_02");	//No more now! I just had a big outlay and I need every coin.
		AI_Output(self,other,"DIA_Lehmar_NOCHMALGELD_09_03");	//Come back in a few days!
	};
};


instance DIA_LEHMAR_PICKPOCKET(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 900;
	condition = dia_lehmar_pickpocket_condition;
	information = dia_lehmar_pickpocket_info;
	permanent = TRUE;
	description = "(It would be child's play to steal his little book)";
};


func int dia_lehmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_schuldenbuch) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_lehmar_pickpocket_info()
{
	Info_ClearChoices(dia_lehmar_pickpocket);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_BACK,dia_lehmar_pickpocket_back);
	Info_AddChoice(dia_lehmar_pickpocket,DIALOG_PICKPOCKET,dia_lehmar_pickpocket_doit);
};

func void dia_lehmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itwr_schuldenbuch,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_lehmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_lehmar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_LEHMAR_BUCHWEG(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_buchweg_condition;
	information = dia_lehmar_buchweg_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lehmar_buchweg_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == TRUE))
	{
		return TRUE;
	};
};

func void dia_lehmar_buchweg_info()
{
	AI_Output(self,other,"DIA_Lehmar_Add_09_00");	//(remorsefully) Some miserable pickpocket has stolen my ledger...
	AI_Output(self,other,"DIA_Lehmar_Add_09_01");	//You didn't have anything to do with this business, did you?
	AI_Output(other,self,"DIA_Addon_Lehmar_Add_15_02");	//(grins) Me? No.
	AI_Output(self,other,"DIA_Lehmar_Add_09_03");	//Yes, yes, all right. Just get out of here...
	AI_StopProcessInfos(self);
};


instance DIA_LEHMAR_VERHAUEN(C_INFO)
{
	npc = vlk_484_lehmar;
	nr = 1;
	condition = dia_lehmar_verhauen_condition;
	information = dia_lehmar_verhauen_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lehmar_verhauen_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_KnowsInfo(other,dia_lehmar_buchweg) || (LEHMAR_VORBEI == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_lehmar_verhauen_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};

