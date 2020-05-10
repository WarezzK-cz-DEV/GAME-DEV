
instance DIA_ENGOR_EXIT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 999;
	condition = dia_engor_exit_condition;
	information = dia_engor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engor_exit_condition()
{
	return TRUE;
};

func void dia_engor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_HALLO(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_hallo_condition;
	information = dia_engor_hallo_info;
	important = TRUE;
};


func int dia_engor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_engor_hallo_info()
{
	AI_Output(self,other,"DIA_Engor_HALLO_13_00");	//Ah, so you're the guy who made it across the pass.
	AI_Output(other,self,"DIA_Engor_HALLO_15_01");	//Yes.
	AI_Output(self,other,"DIA_Engor_HALLO_13_02");	//Great. I'm Engor - I manage this expedition.
	AI_Output(self,other,"DIA_Engor_HALLO_13_03");	//Just don't get the idea that I give anything away for free!
	AI_Output(self,other,"DIA_Engor_HALLO_13_04");	//But if there's gold in your pockets, I'm always willing to cut a little deal.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Engor manages the supplies at the castle and does a bit of business on the side.");
};


instance DIA_ENGOR_HANDELN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 10;
	condition = dia_engor_handeln_condition;
	information = dia_engor_handeln_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_engor_handeln_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_hallo))
	{
		return TRUE;
	};
};

func void dia_engor_handeln_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Engor_HANDELN_15_00");	//Show me your wares.
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
};


instance DIA_ENGOR_ABOUTPARLAF(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_aboutparlaf_condition;
	information = dia_engor_aboutparlaf_info;
	description = "You're the one who deals out the rations, or so I've heard.";
};


func int dia_engor_aboutparlaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_engor))
	{
		return TRUE;
	};
};

func void dia_engor_aboutparlaf_info()
{
	AI_Output(other,self,"DIA_Engor_ABOUTPARLAF_15_00");	//You're the one who deals out the rations, or so I've heard.
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_01");	//That's right. Why? Should I feed you now, too?
	AI_Output(self,other,"DIA_Engor_ABOUTPARLAF_13_02");	//If there's anything you want, you'll pay for it - just like everyone else.
};


instance DIA_ENGOR_RUESTUNG(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_ruestung_condition;
	information = dia_engor_ruestung_info;
	permanent = FALSE;
	description = "Have you got anything interesting for me?";
};


func int dia_engor_ruestung_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_engor_ruestung_info()
{
	AI_Output(other,self,"DIA_Engor_Ruestung_15_00");	//Have you got anything interesting for me?
	AI_Output(self,other,"DIA_Engor_Ruestung_13_01");	//I can get you better armor - heavy militia armor, if you're interested.
	AI_Output(self,other,"DIA_Engor_Ruestung_13_02");	//It's not cheap, of course. So go get the gold, and I'll give you the armor.
};


instance DIA_ENGOR_RSKAUFEN(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 2;
	condition = dia_engor_rskaufen_condition;
	information = dia_engor_rskaufen_info;
	permanent = TRUE;
	description = "Buy heavy milita armor. Protection: B.+55/B.+55/P.+55 (1800 gold)";
};


var int dia_engor_rskaufen_perm;

func int dia_engor_rskaufen_condition()
{
	if((other.guild == GIL_MIL) && Npc_KnowsInfo(other,dia_engor_ruestung) && (DIA_ENGOR_RSKAUFEN_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_engor_rskaufen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,1800))
	{
		AI_Output(other,self,"DIA_Engor_RSkaufen_15_00");	//Give me the armor.
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_01");	//Here you are, it'll protect you well - it's a damn good piece of work.
		b_giveinvitems(self,other,itar_mil_m,1);
		DIA_ENGOR_RSKAUFEN_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Engor_RSkaufen_13_02");	//Go get the gold first.
	};
};


instance DIA_ENGOR_HELP(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 3;
	condition = dia_engor_help_condition;
	information = dia_engor_help_info;
	description = "Maybe I can help you with your work.";
};


func int dia_engor_help_condition()
{
	if(Npc_KnowsInfo(hero,dia_engor_aboutparlaf))
	{
		return TRUE;
	};
};

func void dia_engor_help_info()
{
	AI_Output(other,self,"DIA_Engor_HELP_15_00");	//Maybe I can help you with your work.
	AI_Output(self,other,"DIA_Engor_HELP_13_01");	//Hmm... Sure, why not? I could use some help.
	AI_Output(other,self,"DIA_Engor_HELP_15_02");	//So, what needs to be done?
	AI_Output(self,other,"DIA_Engor_HELP_13_03");	//Our food supplies are low. Above all, we're almost out of meat.
	AI_Output(self,other,"DIA_Engor_HELP_13_04");	//So if you could get us some meat, raw or cooked, ham or sausages, that would be much appreciated. How about it, will you help us?
	Info_ClearChoices(dia_engor_help);
	Info_AddChoice(dia_engor_help,"I've got no time for that.",dia_engor_help_no);
	Info_AddChoice(dia_engor_help,"Don't worry, I'll get you some meat.",dia_engor_help_yes);
};

func void dia_engor_help_no()
{
	AI_Output(other,self,"DIA_Engor_HELP_NO_15_00");	//I don't have time for that.
	AI_Output(self,other,"DIA_Engor_HELP_NO_13_01");	//So what are you wasting mine for?
	MIS_ENGOR_BRINGMEAT = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};

func void dia_engor_help_yes()
{
	AI_Output(other,self,"DIA_Engor_HELP_YES_15_00");	//Don't worry, I'll get you some meat.
	AI_Output(self,other,"DIA_Engor_HELP_YES_13_01");	//About two dozen chunks of meat would help me feed quite a few hungry mouths. Come back when you have the meat. I need to get back to my work now.
	Log_CreateTopic(TOPIC_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_BRINGMEAT,"Engor needs two dozen chunks of meat to supply the men with.");
	b_logentry(TOPIC_BRINGMEAT,"It doesn't matter whether it's sausages, ham, fried meat or raw meat. Just as long as the boys get something decent to bite.");
	MIS_ENGOR_BRINGMEAT = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ENGOR_BRINGMEAT(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 4;
	condition = dia_engor_bringmeat_condition;
	information = dia_engor_bringmeat_info;
	permanent = TRUE;
	description = "Here, I bought you something (give meat).";
};


func int dia_engor_bringmeat_condition()
{
	if((MIS_ENGOR_BRINGMEAT == LOG_RUNNING) && (MEAT_COUNTER < MEAT_AMOUNT) && ((Npc_HasItems(hero,itfo_bacon) >= 1) || (Npc_HasItems(hero,itfomuttonraw) >= 1) || (Npc_HasItems(hero,itfomutton) >= 1) || (Npc_HasItems(hero,itfo_sausage) >= 1)))
	{
		return TRUE;
	};
};

func void dia_engor_bringmeat_info()
{
	var int info_ypos;
	var string concatraw;
	var string concatmutton;
	var string concatbacon;
	var string concatsausage;
	var string gesamtfleisch;
	var int rawcounter;
	var int muttoncounter;
	var int baconcounter;
	var int sausagecounter;
	info_ypos = 35;
	AI_Output(other,self,"DIA_Engor_BRINGMEAT_15_00");	//Here, I bought you something.
	if(Npc_HasItems(other,itfomuttonraw) && (MEAT_COUNTER < MEAT_AMOUNT))
	{
		Npc_GetInvItem(other,itfomuttonraw);
		rawcounter = MEAT_AMOUNT - MEAT_COUNTER;
		if(Npc_HasItems(other,itfomuttonraw) > rawcounter)
		{
			concatraw = IntToString(rawcounter);
			MEAT_COUNTER += rawcounter;
			Npc_RemoveInvItems(other,itfomuttonraw,rawcounter);
		}
		else
		{
			concatraw = IntToString(Npc_HasItems(other,itfomuttonraw));
			MEAT_COUNTER += Npc_HasItems(other,itfomuttonraw);
			Npc_RemoveInvItems(other,itfomuttonraw,Npc_HasItems(other,itfomuttonraw));
		};
		concatraw = ConcatStrings(concatraw," pieces of raw meat given");
		AI_PrintScreen(concatraw,-1,info_ypos,FONT_SCREENSMALL,3);
		info_ypos += 3;
	};
	if(Npc_HasItems(other,itfomutton) && (MEAT_COUNTER < MEAT_AMOUNT))
	{
		Npc_GetInvItem(other,itfomutton);
		muttoncounter = MEAT_AMOUNT - MEAT_COUNTER;
		if(Npc_HasItems(other,itfomutton) > muttoncounter)
		{
			concatmutton = IntToString(muttoncounter);
			MEAT_COUNTER += muttoncounter;
			Npc_RemoveInvItems(other,itfomutton,muttoncounter);
		}
		else
		{
			concatmutton = IntToString(Npc_HasItems(other,itfomutton));
			MEAT_COUNTER += Npc_HasItems(other,itfomutton);
			Npc_RemoveInvItems(other,itfomutton,Npc_HasItems(other,itfomutton));
		};
		concatmutton = ConcatStrings(concatmutton," pieces of fried meat given");
		AI_PrintScreen(concatmutton,-1,info_ypos,FONT_SCREENSMALL,3);
		info_ypos += 3;
	};
	if(Npc_HasItems(other,itfo_bacon) && (MEAT_COUNTER < MEAT_AMOUNT))
	{
		Npc_GetInvItem(other,itfo_bacon);
		baconcounter = MEAT_AMOUNT - MEAT_COUNTER;
		if(Npc_HasItems(other,itfo_bacon) > baconcounter)
		{
			concatbacon = IntToString(baconcounter);
			MEAT_COUNTER += baconcounter;
			Npc_RemoveInvItems(other,itfo_bacon,baconcounter);
		}
		else
		{
			concatbacon = IntToString(Npc_HasItems(other,itfo_bacon));
			MEAT_COUNTER += Npc_HasItems(other,itfo_bacon);
			Npc_RemoveInvItems(other,itfo_bacon,Npc_HasItems(other,itfo_bacon));
		};
		concatbacon = ConcatStrings(concatbacon," ham given");
		AI_PrintScreen(concatbacon,-1,info_ypos,FONT_SCREENSMALL,3);
		info_ypos += 3;
	};
	if(Npc_HasItems(other,itfo_sausage) && (MEAT_COUNTER < MEAT_AMOUNT))
	{
		Npc_GetInvItem(other,itfo_sausage);
		sausagecounter = MEAT_AMOUNT - MEAT_COUNTER;
		if(Npc_HasItems(other,itfo_sausage) > sausagecounter)
		{
			concatsausage = IntToString(sausagecounter);
			MEAT_COUNTER += sausagecounter;
			Npc_RemoveInvItems(other,itfo_sausage,sausagecounter);
		}
		else
		{
			concatsausage = IntToString(Npc_HasItems(other,itfo_sausage));
			MEAT_COUNTER += Npc_HasItems(other,itfo_sausage);
			Npc_RemoveInvItems(other,itfo_sausage,Npc_HasItems(other,itfo_sausage));
		};
		concatsausage = ConcatStrings(concatsausage," sausages given");
		AI_PrintScreen(concatsausage,-1,info_ypos,FONT_SCREENSMALL,3);
		info_ypos += 3;
	};
	if(MEAT_AMOUNT > MEAT_COUNTER)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_01");	//That's not bad for starters, but I need more.
		gesamtfleisch = IntToString(MEAT_COUNTER);
		gesamtfleisch = ConcatStrings("Total meat given: ",gesamtfleisch);
		AI_PrintScreen(gesamtfleisch,-1,info_ypos,FONT_SCREENSMALL,3);
	};
	if(MEAT_COUNTER >= MEAT_AMOUNT)
	{
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_02");	//Great, you brought enough meat. That'll do for a while.
		AI_Output(self,other,"DIA_Engor_BRINGMEAT_13_03");	//But don't get the idea that I'll give you anything for free now!
		MIS_ENGOR_BRINGMEAT = LOG_SUCCESS;
		b_giveplayerxp(XP_BRINGMEAT);
		Log_AddEntry(TOPIC_BRINGMEAT,"Engor's got the meat. He'll make sure it's shared out among the men.");
	};
};


instance DIA_ENGOR_BUSINESS(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 1;
	condition = dia_engor_business_condition;
	information = dia_engor_business_info;
	permanent = FALSE;
	description = "How's business?";
};


func int dia_engor_business_condition()
{
	if((KAPITEL >= 4) && (MIS_ENGOR_BRINGMEAT == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_engor_business_info()
{
	AI_Output(other,self,"DIA_Engor_Business_15_00");	//How's business?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_01");	//So-so. I hope that the Dragon hunters are as full of gold as they are of hot air.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Engor_Business_13_02");	//Lousy! The paladins just aren't buying a thing.
	};
	AI_Output(self,other,"DIA_Engor_Business_13_03");	//How about you, is there anything else you need?
};


instance DIA_ENGOR_PICKPOCKET(C_INFO)
{
	npc = vlk_4108_engor;
	nr = 900;
	condition = dia_engor_pickpocket_condition;
	information = dia_engor_pickpocket_info;
	permanent = TRUE;
	description = "(It would be risky to steal his map)";
};


func int dia_engor_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_map_oldworld) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_engor_pickpocket_info()
{
	Info_ClearChoices(dia_engor_pickpocket);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_BACK,dia_engor_pickpocket_back);
	Info_AddChoice(dia_engor_pickpocket,DIALOG_PICKPOCKET,dia_engor_pickpocket_doit);
};

func void dia_engor_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itwr_map_oldworld,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_engor_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_engor_pickpocket_back()
{
	Info_ClearChoices(dia_engor_pickpocket);
};

