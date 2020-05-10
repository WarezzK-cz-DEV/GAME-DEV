
instance DIA_RUMBOLD_EXIT(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 999;
	condition = dia_rumbold_exit_condition;
	information = dia_rumbold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rumbold_exit_condition()
{
	return TRUE;
};

func void dia_rumbold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_PREPERM(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_preperm_condition;
	information = dia_rumbold_preperm_info;
	permanent = TRUE;
	description = "What are you doing here?";
};


func int dia_rumbold_preperm_condition()
{
	if(!Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_preperm_info()
{
	AI_Output(other,self,"DIA_Rumbold_PrePerm_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Rumbold_PrePerm_10_01");	//Beat it! Understand?
	AI_StopProcessInfos(self);
};


instance DIA_RUMBOLD_HALLO(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_hallo_condition;
	information = dia_rumbold_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rumbold_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_milizklatschen))
	{
		return TRUE;
	};
};

func void dia_rumbold_hallo_info()
{
	AI_Output(self,other,"DIA_Rumbold_Hallo_10_00");	//Look at this one. Another joke. What are you doing here, huh?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_01");	//Who the hell are you?
	}
	else
	{
		AI_Output(self,other,"DIA_Rumbold_Hallo_10_02");	//You're another one of those filthy mercenaries!
	};
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"I am nobody.",dia_rumbold_hallo_schwanzeinziehen);
	Info_AddChoice(dia_rumbold_hallo,"I want you to disappear from here.",dia_rumbold_hallo_verschwindet);
	Info_AddChoice(dia_rumbold_hallo,"I'm your worst nightmare.",dia_rumbold_hallo_attack);
};

func void dia_rumbold_hallo_attack()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_Attack_15_00");	//I'm your worst nightmare.
	AI_Output(self,other,"DIA_Rumbold_HALLO_Attack_10_01");	//You're a dead man!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_verschwindet()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_verschwindet_15_00");	//I want you to disappear from here.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_01");	//Well, well. So you want us to disappear.
	AI_Output(self,other,"DIA_Rumbold_HALLO_verschwindet_10_02");	//(threatening) What'll happen if we don't go, hey?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"What do I have to pay you to get lost?",dia_rumbold_hallo_geld);
	Info_AddChoice(dia_rumbold_hallo,"In that case, you've bothered the farmers for the last time.",dia_rumbold_hallo_aufsmaul);
};

func void dia_rumbold_hallo_aufsmaul()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_AufsMaul_15_00");	//In that case, you've bothered the farmers for the last time.
	AI_Output(self,other,"DIA_Rumbold_HALLO_AufsMaul_10_01");	//You've bitten off more than you can chew, moron!
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,DIALOG_ENDE,dia_rumbold_hallo_endattack);
};

func void dia_rumbold_hallo_geld()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_15_00");	//What do I have to pay you to get lost?
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_01");	//You want to pay for Bengar? That's different.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_02");	//Let me think. With all his outstanding expenses, Bengar still owes us 65 gold coins.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_03");	//Either pay the dough or go stand quietly in the corner.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_10_04");	//So. Are you Bengar's treasurer, or what?
	Info_ClearChoices(dia_rumbold_hallo);
	Info_AddChoice(dia_rumbold_hallo,"Are you crazy? That's way too much.",dia_rumbold_hallo_geld_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 65)
	{
		Info_AddChoice(dia_rumbold_hallo,"Here's your money, now scram.",dia_rumbold_hallo_geld_ok);
	};
};

func void dia_rumbold_hallo_geld_ok()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_ok_15_00");	//Here's your money, and now scram.
	b_giveinvitems(other,self,itmi_gold,65);
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_ok_10_01");	//I don't care who pays for Bengar. Have a nice day. (to himself) Moron!
	AI_StopProcessInfos(self);
	RUMBOLD_BEZAHLT = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"Start");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(bengar) && !Npc_IsDead(bengar))
	{
		Npc_ExchangeRoutine(bengar,"Start");
		AI_ContinueRoutine(bengar);
	};
};

func void dia_rumbold_hallo_geld_toomuch()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_geld_TooMuch_15_00");	//Are you crazy? That's way too much.
	AI_Output(self,other,"DIA_Rumbold_HALLO_geld_TooMuch_10_01");	//Then go hide in your corner!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_schwanzeinziehen()
{
	AI_Output(other,self,"DIA_Rumbold_HALLO_schwanzeinziehen_15_00");	//I am nobody.
	AI_Output(self,other,"DIA_Rumbold_HALLO_schwanzeinziehen_10_01");	//Then get out of my way!
	AI_StopProcessInfos(self);
};

func void dia_rumbold_hallo_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_FIGHTNOW(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_fightnow_condition;
	information = dia_rumbold_fightnow_info;
	permanent = TRUE;
	description = "Leave the farmer alone!";
};


func int dia_rumbold_fightnow_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_rumbold_fightnow_info()
{
	AI_Output(other,self,"DIA_Rumbold_FightNow_15_00");	//Leave the farmer alone!
	AI_Output(self,other,"DIA_Rumbold_FightNow_10_01");	//Is there something wrong with your ears, boy?
	Info_ClearChoices(dia_rumbold_fightnow);
	Info_AddChoice(dia_rumbold_fightnow,DIALOG_ENDE,dia_rumbold_fightnow_endattack);
};

func void dia_rumbold_fightnow_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_STILLTHERE(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 1;
	condition = dia_rumbold_stillthere_condition;
	information = dia_rumbold_stillthere_info;
	permanent = TRUE;
	description = "Hey, you're still here!";
};


func int dia_rumbold_stillthere_condition()
{
	if(Npc_KnowsInfo(other,dia_rumbold_hallo) && (RUMBOLD_BEZAHLT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rumbold_stillthere_info()
{
	AI_Output(other,self,"DIA_Rumbold_StillThere_15_00");	//Hey, you're still here!
	AI_Output(self,other,"DIA_Rumbold_StillThere_10_01");	//I've about had it with you!
	Info_ClearChoices(dia_rumbold_stillthere);
	Info_AddChoice(dia_rumbold_stillthere,DIALOG_ENDE,dia_rumbold_stillthere_endattack);
};

func void dia_rumbold_stillthere_endattack()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
	if(Hlp_IsValidNpc(rick) && !c_npcisdown(rick))
	{
		b_attack(rick,other,AR_KILL,1);
	};
};


instance DIA_RUMBOLD_PICKPOCKET(C_INFO)
{
	npc = mil_335_rumbold;
	nr = 900;
	condition = dia_rumbold_pickpocket_condition;
	information = dia_rumbold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rumbold_pickpocket_condition()
{
	return c_beklauen(24,45);
};

func void dia_rumbold_pickpocket_info()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_BACK,dia_rumbold_pickpocket_back);
	Info_AddChoice(dia_rumbold_pickpocket,DIALOG_PICKPOCKET,dia_rumbold_pickpocket_doit);
};

func void dia_rumbold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rumbold_pickpocket);
};

func void dia_rumbold_pickpocket_back()
{
	Info_ClearChoices(dia_rumbold_pickpocket);
};

