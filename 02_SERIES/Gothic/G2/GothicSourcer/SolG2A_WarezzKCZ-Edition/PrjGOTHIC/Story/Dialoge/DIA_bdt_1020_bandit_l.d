
instance DIA_BDT_1020_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 999;
	condition = dia_wegelagerer_exit_condition;
	information = dia_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wegelagerer_exit_condition()
{
	return TRUE;
};

func void dia_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


const string BDT_1020_WEGELAGERER_CHECKPOINT = "NW_TROLLAREA_PATH_46";

instance DIA_BDT_1020_WEGELAGERER_FIRSTWARN(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 1;
	condition = dia_bdt_1020_wegelagerer_firstwarn_condition;
	information = dia_bdt_1020_wegelagerer_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_firstwarn_condition()
{
	if((other.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_firstwarn_info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_00");	//Hey you, stop right there!
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_15_01");	//What do you want?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_06_02");	//If you don't want me to smash in your face, you had better transfer a few gold coins from your pockets to mine - and pronto!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"How much do you want?",dia_bdt_1020_wegelagerer_firstwarn_howmuch);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"You're joking.",dia_bdt_1020_wegelagerer_firstwarn_joke);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Get out of my way!",dia_bdt_1020_wegelagerer_pissoff);
	if(MIS_SCHNITZELJAGD == LOG_RUNNING)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Say, have you seen a novice?",dia_bdt_1020_wegelagerer_agon);
	};
};

func void dia_bdt_1020_wegelagerer_agon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_AGON_15_00");	//Say, have you seen a novice?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_01");	//(puzzled) er - what? Hmm...(thinking) That might well be.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_AGON_06_02");	//Give me 20 gold pieces, and I'll tell you!
	WEGELAGERER_SURPRISE = TRUE;
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"All right, here's your money.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Sorry, I don't have any money.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Just get out of my way.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_firstwarn_howmuch()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_15_00");	//How much do you want?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_HowMuch_06_01");	//(grins) 20 gold pieces and we could be friends.
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"All right, here's your money.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Sorry, I don't have any money.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Just get out of my way.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_firstwarn_joke()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_15_00");	//You're joking.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_01");	//Do I look the part?
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_02");	//If I don't see 20 gold pieces before you come even one step closer...
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Joke_06_03");	//Then I'll flatten you. So fork over the dough already.
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"All right, here's your money.",dia_bdt_1020_wegelagerer_firstwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Sorry, I don't have any money.",dia_bdt_1020_wegelagerer_firstwarn_nomoney);
	Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Just get out of my way.",dia_bdt_1020_wegelagerer_firstwarn_never);
};

func void dia_bdt_1020_wegelagerer_pissoff()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_PissOff_15_00");	//Get out of my way!
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_01");	//My, you have a big mouth for such a scrawny little fellow.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_PissOff_06_02");	//It's time I shut it for you.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_givemoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_15_00");	//All right, here's your money.
	if(WEGELAGERER_SURPRISE == FALSE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_01");	//(sneering) I should say 20 gold pieces wasn't too much to pay for your life. You can pass.
	};
	if(WEGELAGERER_SURPRISE == TRUE)
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_02");	//OK, now, this novice came by here almost an hour ago.
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveMoney_06_03");	//He was in a bit of a hurry, looking behind him all the time, he was. Now scram.
	};
	b_giveinvitems(other,self,itmi_gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_bdt_1020_wegelagerer_firstwarn_nomoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_15_00");	//Sorry, I don't have any money.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_01");	//Yeah, these are terrible times all right.
	if(Npc_HasEquippedMeleeWeapon(other))
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_02");	//But I'll tell you what - just hand me your weapon. Then I'll let you pass.
		Info_ClearChoices(dia_bdt_1020_wegelagerer_firstwarn);
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Forget it.",dia_bdt_1020_wegelagerer_firstwarn_noweapon);
		Info_AddChoice(dia_bdt_1020_wegelagerer_firstwarn,"Here, take my weapon.",dia_bdt_1020_wegelagerer_firstwarn_giveweapon);
	}
	else
	{
		AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoMoney_06_03");	//I'll tell you what: come back when you have money. No money, no bridge.
		self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
		AI_StopProcessInfos(self);
	};
};

func void dia_bdt_1020_wegelagerer_firstwarn_never()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_15_00");	//Just get out of my way.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_Never_06_01");	//So you want it the hard way?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_noweapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_15_00");	//Forget it.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_NoWeapon_06_01");	//OK, the hard way it is.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bdt_1020_wegelagerer_firstwarn_giveweapon()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_15_00");	//Here, take my weapon.
	AI_DrawWeapon(other);
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_FirstWarn_GiveWeapon_06_01");	//Stay away from that weapon. Just you wait!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_BDT_1020_WEGELAGERER_SECONDWARN(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 2;
	condition = dia_bdt_1020_wegelagerer_secondwarn_condition;
	information = dia_bdt_1020_wegelagerer_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_secondwarn_info()
{
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_06_00");	//You really want to take your chances? It's your call.
	Info_ClearChoices(dia_bdt_1020_wegelagerer_secondwarn);
	if(Npc_HasItems(other,itmi_gold) >= 20)
	{
		Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,"Here's your money.",dia_bdt_1020_wegelagerer_secondwarn_givemoney);
	};
	Info_AddChoice(dia_bdt_1020_wegelagerer_secondwarn,"I won't give you a penny.",dia_bdt_1020_wegelagerer_secondwarn_nomoney);
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
};

func void dia_bdt_1020_wegelagerer_secondwarn_givemoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_15_00");	//Here's your money.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_GiveMoney_06_01");	//Ah, now you're talking.
	b_giveinvitems(other,self,itmi_gold,20);
	self.aivar[AIV_PASSGATE] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_bdt_1020_wegelagerer_secondwarn_nomoney()
{
	AI_Output(other,self,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_15_00");	//I won't give you a penny.
	AI_Output(self,other,"DIA_BDT_1020_Wegelagerer_SecondWarn_NoMoney_06_01");	//I'll get it for myself then.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BDT_1020_WEGELAGERER_ATTACK(C_INFO)
{
	npc = bdt_1020_bandit_l;
	nr = 3;
	condition = dia_bdt_1020_wegelagerer_attack_condition;
	information = dia_bdt_1020_wegelagerer_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1020_wegelagerer_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,BDT_1020_WEGELAGERER_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_bdt_1020_wegelagerer_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

