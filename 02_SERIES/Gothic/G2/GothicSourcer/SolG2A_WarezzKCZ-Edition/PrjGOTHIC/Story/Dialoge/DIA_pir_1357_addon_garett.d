
instance DIA_ADDON_GARETT_EXIT(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 999;
	condition = dia_addon_garett_exit_condition;
	information = dia_addon_garett_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garett_exit_condition()
{
	return TRUE;
};

func void dia_addon_garett_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARETT_PICKPOCKET(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 900;
	condition = dia_addon_garett_pickpocket_condition;
	information = dia_addon_garett_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_garett_pickpocket_condition()
{
	return c_beklauen(36,55);
};

func void dia_addon_garett_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_BACK,dia_addon_garett_pickpocket_back);
	Info_AddChoice(dia_addon_garett_pickpocket,DIALOG_PICKPOCKET,dia_addon_garett_pickpocket_doit);
};

func void dia_addon_garett_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garett_pickpocket);
};

func void dia_addon_garett_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garett_pickpocket);
};


instance DIA_ADDON_GARETT_ANHEUERN(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_anheuern_condition;
	information = dia_addon_garett_anheuern_info;
	important = TRUE;
};


func int dia_addon_garett_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_00");	//Don't even think about asking me to join your raiding troop.
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_01");	//What do you think the other boys will do once I'm gone, huh?
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_02");	//When I come back, there won't be ONE full crate left in my hut!
	AI_Output(self,other,"DIA_Addon_Garett_Anheuern_09_03");	//I'll just stay here and guard our supplies.
};


instance DIA_ADDON_GARETT_HELLO(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 1;
	condition = dia_addon_garett_hello_condition;
	information = dia_addon_garett_hello_info;
	important = TRUE;
};


func int dia_addon_garett_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_00");	//What have we here? A fresh face. And not one of those filthy bandits, I hope.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_01");	//I'm Garett. If there's anything you need, ask me first.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_02");	//I can get you almost anything. Wine, weapons, and other stuff you might need.
	AI_Output(self,other,"DIA_Addon_Garett_Hello_09_03");	//Except for booze - if it's a decent drink you want, go see Samuel.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_GARETT_SAMUEL(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 2;
	condition = dia_addon_garett_samuel_condition;
	information = dia_addon_garett_samuel_info;
	permanent = FALSE;
	description = "Who's Samuel?";
};


func int dia_addon_garett_samuel_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) && (samuel.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_garett_samuel_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Samuel_15_00");	//Who's Samuel?
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_01");	//He's our moonshiner. He's got his cave on the beach, a little distance from the camp.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_02");	//You can't miss it, just walk north.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_03");	//You'll be well advised to keep yourself supplied with grog.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_04");	//Some of the boys here aren't very fond of greenhorns at all, if you get my drift.
	AI_Output(self,other,"DIA_Addon_Garett_Samuel_09_05");	//A decent swig of grog can work wonders for you!
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_GARETT_WAREZ(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_warez_condition;
	information = dia_addon_garett_warez_info;
	description = "Where do you get your supplies?";
};


func int dia_addon_garett_warez_condition()
{
	return TRUE;
};

func void dia_addon_garett_warez_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Warez_15_00");	//Where do you get your supplies?
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_01");	//Skip always brings loads of stuff from Khorinis when he visits there.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_02");	//Until recently, he used to sell some of it directly to the bandits.
	AI_Output(self,other,"DIA_Addon_Garett_Warez_09_03");	//But since we've been at war with the bandits, I'm the one who ends up with all the stuff now.
};


instance DIA_ADDON_GARETT_BANDITS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 3;
	condition = dia_addon_garett_bandits_condition;
	information = dia_addon_garett_bandits_info;
	description = "What do you know about the bandits?";
};


func int dia_addon_garett_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_warez))
	{
		return TRUE;
	};
};

func void dia_addon_garett_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Bandits_15_00");	//What do you know about the bandits?
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_01");	//You'd better ask Skip about that.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_02");	//He's been through quite a lot with that bunch, let me tell you.
	AI_Output(self,other,"DIA_Addon_Garett_Bandits_09_03");	//Greg has given orders to do away with any bandit who shows up near the camp.
};


instance DIA_ADDON_GARETT_GREG(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 4;
	condition = dia_addon_garett_greg_condition;
	information = dia_addon_garett_greg_info;
	permanent = FALSE;
	description = "Your Captain Greg. What's he like?";
};


func int dia_addon_garett_greg_condition()
{
	return TRUE;
};

func void dia_addon_garett_greg_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Greg_15_00");	//Your Captain Greg. What's he like?
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_01");	//He's a tough old bastard, and no doubt about it.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_02");	//And greedy to the bone.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_03");	//He makes Francis, our treasurer, pay out not a penny more than what it takes to prevent a mutiny.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_04");	//And if one of us ever gets his hands on something REALLY valuable, he'll inevitably take it for himself.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_05");	//I once took a compass from a royal frigate.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_06");	//That bastard Greg made me hand it over, of course.
	AI_Output(self,other,"DIA_Addon_Garett_Greg_09_07");	//Bah. He probably buried it somewhere, just like the rest of his treasures.
};


instance DIA_ADDON_GARETT_TIPS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 5;
	condition = dia_addon_garett_tips_condition;
	information = dia_addon_garett_tips_info;
	description = "Where might Greg have buried that compass?";
};


func int dia_addon_garett_tips_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_tips_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_00");	//Where might Greg have buried that compass?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_01");	//Greg once told me that Death himself watches over my compass. Then he laughed.
	AI_Output(other,self,"DIA_Addon_Garett_Tips_15_02");	//Anything else?
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_03");	//There's a beach at the southern coast. It can only be reached by sea.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_04");	//Greg is said to have been there often. Maybe you'll find something there.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_05");	//I once went there to see what I might find myself, but the area is teeming with monsters.
	AI_Output(self,other,"DIA_Addon_Garett_Tips_09_06");	//If you really want to give it a try, don't forget to bring a pick.
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KOMPASS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KOMPASS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KOMPASS,"Greg has taken a valuable compass from Garret. Garret suspects that he buried it somewhere on the southern beach.");
};


instance DIA_ADDON_GARETT_GIVEKOMPASS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 6;
	condition = dia_addon_garett_givekompass_condition;
	information = dia_addon_garett_givekompass_info;
	permanent = FALSE;
	description = "Here's your compass.";
};


func int dia_addon_garett_givekompass_condition()
{
	if((Npc_HasItems(other,itmi_addon_kompass_mis) >= 1) && (MIS_ADDON_GARETT_BRINGKOMPASS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_garett_givekompass_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_GiveKompass_15_00");	//Here's your compass.
	if(b_giveinvitems(other,self,itmi_addon_kompass_mis,1))
	{
		Npc_RemoveInvItems(self,itmi_addon_kompass_mis,1);
	};
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_01");	//(happily) Yes, that's it. I never thought I'd see it again.
	AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_02");	//Thanks, man!
	if(Npc_HasItems(self,itbe_addon_prot_edgpoi) > 0)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_03");	//This time Greg WON'T get hold of it again...
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_04");	//Here, take this belt in return. It's my most valuable piece.
		b_giveinvitems(self,other,itbe_addon_prot_edgpoi,1);
	}
	else if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_05");	//You bought this belt from me, remember?
		AI_Output(self,other,"DIA_Addon_Garett_GiveKompass_09_06");	//And you paid a lot for it - (hastily) not that it wasn't worth it. Here - take back your gold.
		b_giveinvitems(self,other,itmi_gold,VALUE_ITBE_ADDON_PROT_EDGPOI);
	};
	b_logentry(TOPIC_ADDON_KOMPASS,"Garret was very pleased that I brought his compass back.");
	MIS_ADDON_GARETT_BRINGKOMPASS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GARETT_BRING_KOMPASS);
};


instance DIA_ADDON_GARETT_FRANCIS(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 7;
	condition = dia_addon_garett_francis_condition;
	information = dia_addon_garett_francis_info;
	permanent = FALSE;
	description = "What can you tell me about Francis?";
};


func int dia_addon_garett_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_greg))
	{
		return TRUE;
	};
};

func void dia_addon_garett_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_Francis_15_00");	//What can you tell me about Francis?
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_01");	//Greg put him in command while he's gone.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_02");	//But Francis is a total failure as a leader!
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_03");	//He can't even get Morgan to stir his lazy ass out of bed.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_04");	//Henry and his boys are the only ones doing anything around here.
	AI_Output(self,other,"DIA_Addon_Garett_Francis_09_05");	//The others are just enjoying themselves instead of working.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_06");	//I can only hope that Greg will come back soon.
		AI_Output(self,other,"DIA_Addon_Garett_Francis_09_07");	//He'll give them all a good swift kick in the ass.
	};
};


instance DIA_ADDON_GARETT_PERM(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 99;
	condition = dia_addon_garett_perm_condition;
	information = dia_addon_garett_perm_info;
	permanent = TRUE;
	description = "Anything new?";
};


func int dia_addon_garett_perm_condition()
{
	return TRUE;
};

func void dia_addon_garett_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Garett_PERM_15_00");	//Anything new?
	if((GREGISBACK == FALSE) || Npc_IsDead(greg))
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_02");	//Nothing ever happens any more since Greg left.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Garett_PERM_09_01");	//Now that Greg has come back, things are starting to look up around here.
	};
};


instance DIA_ADDON_GARETT_TRADE(C_INFO)
{
	npc = pir_1357_addon_garett;
	nr = 888;
	condition = dia_addon_garett_trade_condition;
	information = dia_addon_garett_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE;
	trade = TRUE;
};


func int dia_addon_garett_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garett_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_garett_trade_info()
{
	var int garett_random;
	var int mcbolzenamount;
	var int mcarrowamount;
	garett_random = Hlp_Random(3);
	if(garett_random == 0)
	{
		b_say(other,self,"$TRADE_1");
	}
	else if(garett_random == 1)
	{
		b_say(other,self,"$TRADE_2");
	}
	else
	{
		b_say(other,self,"$TRADE_3");
	};
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 25;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 25;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
};

