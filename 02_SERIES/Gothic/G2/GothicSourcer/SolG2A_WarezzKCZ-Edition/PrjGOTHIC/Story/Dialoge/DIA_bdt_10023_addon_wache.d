
instance DIA_ADDON_10023_WACHE_EXIT(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 999;
	condition = dia_addon_10023_wache_exit_condition;
	information = dia_addon_10023_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10023_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10023_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_10023_WACHE_HI(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 2;
	condition = dia_addon_10023_wache_hi_condition;
	information = dia_addon_10023_wache_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10023_wache_hi_condition()
{
	if(Npc_GetDistToNpc(self,other) <= 300)
	{
		return TRUE;
	};
};

func void dia_addon_10023_wache_hi_info()
{
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_00");	//Hey, where are you going? Do you want to go into this passage?
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_01");	//Well sure, why not?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_02");	//There are even more slaves back there. As far as I'm concerned you can go in, but don't hit them so hard they can't work any more.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_03");	//After all, we certainly don't want them just sitting around. They have to dig for gold.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_04");	//I see. And who ordered that?
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_05");	//That is a direct order from Bloodwyn.
	AI_Output(other,self,"DIA_Addon_10023_Wache_Hi_15_06");	//I thought Raven was the boss here.
	AI_Output(self,other,"DIA_Addon_10023_Wache_Hi_11_07");	//Right - but he gave the slaves to Bloodwyn. He doesn't have any more use for them.
	pardos.attribute[ATR_HITPOINTS] = 70;
	b_logentry(TOPIC_ADDON_SKLAVEN,"Raven has no more use for the slaves. They now belong to Bloodwyn.");
};


var int prisonguard_rules;

instance DIA_ADDON_10023_WACHE_GO(C_INFO)
{
	npc = bdt_10023_addon_wache;
	nr = 99;
	condition = dia_addon_10023_wache_go_condition;
	information = dia_addon_10023_wache_go_info;
	permanent = TRUE;
	description = "Let the slaves go!";
};


func int dia_addon_10023_wache_go_condition()
{
	if(READY_TOGO == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_10023_wache_go_info()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_15_00");	//Let the slaves go!
	if(PRISONGUARD_RULES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_01");	//Listen. Bloodwyn is in command here. The slaves belong to him, so he has the right to set them free.
		AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_02");	//Besides, Thorus also has a say in that. And what about you?
		PRISONGUARD_RULES = TRUE;
		b_logentry(TOPIC_ADDON_SKLAVEN,"Bloodwyn and Thorus have the sole right to set the slaves free.");
	};
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_11_03");	//Do YOU have any say?
	Info_ClearChoices(dia_addon_10023_wache_go);
	Info_AddChoice(dia_addon_10023_wache_go,DIALOG_BACK,dia_addon_10023_wache_go_back);
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"I've had a talk with Thorus.",dia_addon_10023_wache_go_thorus);
	}
	else if(Npc_IsDead(bloodwyn) && (Npc_HasItems(other,itmi_addon_bloodwyn_kopf) >= 1))
	{
		Info_AddChoice(dia_addon_10023_wache_go,"(show Bloodwyn's head)",dia_addon_10023_wache_go_blood);
	}
	else
	{
		Info_AddChoice(dia_addon_10023_wache_go,"I decide WHO goes into the mine.",dia_addon_10023_wache_go_wer);
	};
};

func void dia_addon_10023_wache_go_back()
{
	Info_ClearChoices(dia_addon_10023_wache_go);
};

func void dia_addon_10023_wache_go_wer()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_WER_15_00");	//I decide WHO goes into the mine.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_WER_11_01");	//You're doing Esteban's old job. Then you have ABSOLUTELY NO say here. Buzz off.
	Info_ClearChoices(dia_addon_10023_wache_go);
};


var int wache_einmal;

func void dia_addon_10023_wache_go_blood()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_00");	//Here, is that enough?
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_01");	//(gags) Put that away. I don't want to see THAT.
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_02");	//It would be better for you if you let the slaves go NOW.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_03");	//Wait a minute. Bloodwyn isn't the only one who has a say here. So long as I don't have an order from Thorus, no one will be set free.
	if(Npc_KnowsInfo(other,dia_addon_thorus_answer))
	{
		Info_ClearChoices(dia_addon_10023_wache_go);
		Info_AddChoice(dia_addon_10023_wache_go,"I've had a talk with Thorus.",dia_addon_10023_wache_go_thorus);
	}
	else
	{
		if(WACHE_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_04");	//But you just said that the slaves belong to Bloodwyn.
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_05");	//Yes, but I also said that I won't set anyone free without an order from Thorus.
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_06");	//You're one of those guys who won't take a leak without orders, eh?
			WACHE_EINMAL = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_10023_Wache_go_Blood_11_07");	//Yes, but I also said...
			AI_Output(other,self,"DIA_Addon_10023_Wache_go_Blood_15_08");	//... all right, spare me the rest.
		};
		Info_ClearChoices(dia_addon_10023_wache_go);
	};
};

func void dia_addon_10023_wache_go_thorus()
{
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_00");	//I talked with Thorus. He ordered the slaves to be set free.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_01");	//Okay, if Thorus ordered it. But I have to ask myself why he decided on something like that...
	AI_Output(other,self,"DIA_Addon_10023_Wache_go_Thorus_15_02");	//... but you aren't being paid to ask questions.
	AI_Output(self,other,"DIA_Addon_10023_Wache_go_Thorus_11_03");	//All right, all right. I'm obviously not needed here any more, so I'll go get me some stew.
	READY_TOGO = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SOUP");
};

