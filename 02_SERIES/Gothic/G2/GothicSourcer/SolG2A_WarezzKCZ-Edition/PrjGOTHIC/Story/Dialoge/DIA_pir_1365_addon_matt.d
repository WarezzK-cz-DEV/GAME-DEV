
instance DIA_ADDON_MATT_EXIT(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 999;
	condition = dia_addon_matt_exit_condition;
	information = dia_addon_matt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_matt_exit_condition()
{
	return TRUE;
};

func void dia_addon_matt_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MATT_PICKPOCKET(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 900;
	condition = dia_addon_matt_pickpocket_condition;
	information = dia_addon_matt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_matt_pickpocket_condition()
{
	return c_beklauen(55,91);
};

func void dia_addon_matt_pickpocket_info()
{
	Info_ClearChoices(dia_addon_matt_pickpocket);
	Info_AddChoice(dia_addon_matt_pickpocket,DIALOG_BACK,dia_addon_matt_pickpocket_back);
	Info_AddChoice(dia_addon_matt_pickpocket,DIALOG_PICKPOCKET,dia_addon_matt_pickpocket_doit);
};

func void dia_addon_matt_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_matt_pickpocket);
};

func void dia_addon_matt_pickpocket_back()
{
	Info_ClearChoices(dia_addon_matt_pickpocket);
};


instance DIA_ADDON_MATT_HELLO(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 1;
	condition = dia_addon_matt_hello_condition;
	information = dia_addon_matt_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_matt_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_matt_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Hello_10_01");	//New here, are you? Great. We can use every man.
};


instance DIA_ADDON_MATT_PERM(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 2;
	condition = dia_addon_matt_perm_condition;
	information = dia_addon_matt_perm_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_addon_matt_perm_condition()
{
	return TRUE;
};

func void dia_addon_matt_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Alright_15_01");	//How are things?
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(self.attribute[ATR_HITPOINTS] < 100)
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_02");	//What part of HEALING POTION didn't you understand?
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Matt_Alright_10_01");	//Everything's ship-shape - (cynically) Cap'n!
		};
	}
	else if((GREGISBACK == TRUE) && !Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_01");	//Very funny. We no longer have a ship.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_02");	//I'll just wait and see what Greg does next.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_03");	//Right now, all's quiet in the camp. So I'm going to relax a little.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_04");	//And if I were you, I'd do the same.
		AI_Output(self,other,"DIA_Addon_Matt_Job_10_05");	//Since the bandits are here now, the situation may change faster than we like.
	};
};


instance DIA_ADDON_MATT_BANDITS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 3;
	condition = dia_addon_matt_bandits_condition;
	information = dia_addon_matt_bandits_info;
	description = "What do you know about the bandits?";
};


func int dia_addon_matt_bandits_condition()
{
	return TRUE;
};

func void dia_addon_matt_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_03");	//What do you know about the bandits?
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_01");	//You mean, besides the fact that they're a deadly menace and outnumber us by far?
	AI_Output(other,self,"DIA_Addon_Matt_Bandits_15_02");	//Yes.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_02");	//They're rolling in gold.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_03");	//Well, at least they WERE rolling in gold. They never paid for their last shipment.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_04");	//But I doubt that that's because those bastards ran out of gold.
	AI_Output(self,other,"DIA_Addon_Matt_Bandits_10_05");	//It's more likely that they've gotten way too big for their boots.
};


instance DIA_ADDON_MATT_FRANCIS(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 4;
	condition = dia_addon_matt_francis_condition;
	information = dia_addon_matt_francis_info;
	description = "What do you know about Francis?";
};


func int dia_addon_matt_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_matt_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_00");	//What do you know about Francis?
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_01");	//You mean, besides the fact that he's lazy and incompetent?
	AI_Output(other,self,"DIA_Addon_Brandon_Matt_15_02");	//Yes.
	AI_Output(self,other,"DIA_Addon_Matt_Francis_10_03");	//Let me think. Hmm... no. That's all that springs to mind.
};


instance DIA_ADDON_MATT_ANHEUERN(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 11;
	condition = dia_addon_matt_anheuern_condition;
	information = dia_addon_matt_anheuern_info;
	permanent = FALSE;
	description = "Come with me.";
};


func int dia_addon_matt_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_matt_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_00");	//Come with me.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_01");	//I can't leave now, I'm just trying to relax.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_02");	//Orders from Greg.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_03");	//(hastily) Ah, I see. That's different of course. I mean, of course I'm coming.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_10_04");	//Where are we going?
	Info_ClearChoices(dia_addon_matt_anheuern);
	Info_AddChoice(dia_addon_matt_anheuern,"Just shut up and come along.",dia_addon_matt_anheuern_shutup);
	Info_AddChoice(dia_addon_matt_anheuern,"We're supposed to clear the canyon.",dia_addon_matt_anheuern_clearcanyon);
};

func void dia_addon_matt_anheuern_shutup()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ShutUp_15_00");	//Just shut up and come along.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ShutUp_10_01");	//(surly) Aye aye - (sarcastically) Cap'n!
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

func void dia_addon_matt_anheuern_clearcanyon()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_00");	//We're supposed to clear the canyon.
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_01");	//You're out of your mind. It's teeming with beasts. And those razors are not to be trifled with.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_ClearCanyon_15_02");	//I know. Are you coming now?
	AI_Output(self,other,"DIA_Addon_Matt_FollowMe_ClearCanyon_10_03");	//(sighs) You'd better pack a few healing potions, we're going to need them.
	Info_ClearChoices(dia_addon_matt_anheuern);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_MATT_COMEON(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 12;
	condition = dia_addon_matt_comeon_condition;
	information = dia_addon_matt_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_matt_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_matt_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_matt_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_ComeOn_15_00");	//Come with me.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_ComeOn_10_01");	//Aye aye - (cynically) Cap'n!
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_MATT_GOHOME(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 13;
	condition = dia_addon_matt_gohome_condition;
	information = dia_addon_matt_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_matt_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_matt_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_DontNeedYou_15_00");	//I no longer need you.
	AI_Output(self,other,"DIA_Addon_Matt_GoHome_10_01");	//(moaning to himself) I need a decent swig of grog!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_MATT_TOOFAR(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 14;
	condition = dia_addon_matt_toofar_condition;
	information = dia_addon_matt_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_matt_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_matt_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_01");	//You can go it alone from here - (cynically) Cap'n.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_03");	//The boys and I are headed back for camp!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_10_02");	//I'm headed back to the camp!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MATT_HEALING(C_INFO)
{
	npc = pir_1365_addon_matt;
	nr = 15;
	condition = dia_addon_matt_healing_condition;
	information = dia_addon_matt_healing_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_matt_healing_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] - 100)))
	{
		return TRUE;
	};
};

func void dia_addon_matt_healing_info()
{
	AI_Output(self,other,"DIA_Addon_Matt_Healing_10_01");	//(cynically) Hello Cap'n! I could use a healing potion!
};

