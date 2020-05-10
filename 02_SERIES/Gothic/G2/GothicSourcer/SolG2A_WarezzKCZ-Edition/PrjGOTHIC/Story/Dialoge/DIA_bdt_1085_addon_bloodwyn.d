
instance DIA_ADDON_BLOODWYN_EXIT(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 999;
	condition = dia_addon_bloodwyn_exit_condition;
	information = dia_addon_bloodwyn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bloodwyn_exit_condition()
{
	return TRUE;
};

func void dia_addon_bloodwyn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BLOODWYN_PICKPOCKET(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 900;
	condition = dia_addon_bloodwyn_pickpocket_condition;
	information = dia_addon_bloodwyn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_bloodwyn_pickpocket_condition()
{
	return c_beklauen(90,250);
};

func void dia_addon_bloodwyn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
	Info_AddChoice(dia_addon_bloodwyn_pickpocket,DIALOG_BACK,dia_addon_bloodwyn_pickpocket_back);
	Info_AddChoice(dia_addon_bloodwyn_pickpocket,DIALOG_PICKPOCKET,dia_addon_bloodwyn_pickpocket_doit);
};

func void dia_addon_bloodwyn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
};

func void dia_addon_bloodwyn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bloodwyn_pickpocket);
};


instance DIA_ADDON_BLOODWYN_DEAD(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 2;
	condition = dia_addon_bloodwyn_dead_condition;
	information = dia_addon_bloodwyn_dead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bloodwyn_dead_condition()
{
	if(Npc_GetDistToWP(self,"BL_RAVEN_09") <= 1000)
	{
		return TRUE;
	};
};

func void dia_addon_bloodwyn_dead_info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_00");	//Hey, how did you get in here?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Dead_15_01");	//Through the entrance.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Dead_04_02");	//Funny... I HATE jokes.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void bloodwyn_choices_1()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"And I thought I did you in.",dia_addon_bloodwyn_wait_good1);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Everything comes to an end.",dia_addon_bloodwyn_wait_bad1);
};

func void bloodwyn_choices_2()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"And who do you think brought down the Barrier?",dia_addon_bloodwyn_wait_good2);
	Info_AddChoice(dia_addon_bloodwyn_wait,"You and a lot of other guys, too...",dia_addon_bloodwyn_wait_bad2);
};

func void bloodwyn_choices_3()
{
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Obviously he's got no time to be picky...",dia_addon_bloodwyn_wait_good3);
	Info_AddChoice(dia_addon_bloodwyn_wait,"Yes, that was his biggest mistake...",dia_addon_bloodwyn_wait_bad3);
};


instance DIA_ADDON_BLOODWYN_WAIT(C_INFO)
{
	npc = bdt_1085_addon_bloodwyn;
	nr = 2;
	condition = dia_addon_bloodwyn_wait_condition;
	information = dia_addon_bloodwyn_wait_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bloodwyn_wait_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MINECRAWLER_KILLED >= 9))
	{
		return TRUE;
	};
};

func void dia_addon_bloodwyn_wait_info()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_00");	//You killed the minecrawlers? Good. I'll take over now. Go on, beat it.
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_01");	//Wait a minute.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_04_02");	//You still aren't gone?
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_15_03");	//We still have to set something straight.
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
	Info_AddChoice(dia_addon_bloodwyn_wait,"I'm looking for Raven.",dia_addon_bloodwyn_wait_raven);
};

func void dia_addon_bloodwyn_wait_raven()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_00");	//I'm looking for Raven.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_01");	//Yeah - and what makes you think that Raven wants to talk to YOU of all... wait, are YOU... Is it YOU?
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_02");	//You're the guy we've been looking for the whole time. What are YOU doing here? You should be long dead!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_03");	//People are always telling me that.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_04");	//Those morons all failed - but you won't get past me. This time I'll finish you!
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_15_05");	//Like I already said - it's Raven I'm looking for - you aren't important to me.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_04_06");	//I'll kill you - I've survived every battle so far!
	bloodwyn_choices_1();
};

func void dia_addon_bloodwyn_wait_fight()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_15_00");	//Enough talk. Let's fight.
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wait_Raven_FIGHT_04_01");	//(triumphant) It's too late for you anyway! Raven is opening the temple right now! Hahahaha - Die, bastard!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void bloodwyn_lach()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Lach_04_00");	//HAHAHA - I'll defeat you all the same!
};

func void bloodwyn_wut()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_Wut_04_00");	//AARGH! You miserable dog!
	self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] - 5;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
};

func void bloodwyn_next_1()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_2_04_00");	//And I survived the explosion of the Barrier without a scratch!
};

func void bloodwyn_next_2()
{
	AI_Output(self,other,"DIA_Addon_Bloodwyn_SayChoice_3_04_00");	//You can't defeat me, I'm Raven's best friend! His right hand!
};

func void dia_addon_bloodwyn_wait_good1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD1_15_00");	//And I thought I did you in.
	bloodwyn_wut();
	bloodwyn_next_1();
	bloodwyn_choices_2();
};

func void dia_addon_bloodwyn_wait_bad1()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD1_15_00");	//Everything comes to an end.
	bloodwyn_lach();
	bloodwyn_next_1();
	bloodwyn_choices_2();
};

func void dia_addon_bloodwyn_wait_good2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD2_15_00");	//And who do you think brought down the Barrier?
	bloodwyn_wut();
	bloodwyn_next_2();
	bloodwyn_choices_3();
};

func void dia_addon_bloodwyn_wait_bad2()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD2_15_00");	//You and a lot of other guys, too...
	bloodwyn_lach();
	bloodwyn_next_2();
	bloodwyn_choices_3();
};

func void dia_addon_bloodwyn_wait_good3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_GOOD3_15_00");	//Obviously he's got no time to be picky...
	bloodwyn_wut();
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
};

func void dia_addon_bloodwyn_wait_bad3()
{
	AI_Output(other,self,"DIA_Addon_Bloodwyn_Wait_Raven_BAD3_15_00");	//Yes, that was his biggest mistake...
	bloodwyn_wut();
	Info_ClearChoices(dia_addon_bloodwyn_wait);
	Info_AddChoice(dia_addon_bloodwyn_wait,PRINT_ADDON_ENOUGHTALK,dia_addon_bloodwyn_wait_fight);
};

