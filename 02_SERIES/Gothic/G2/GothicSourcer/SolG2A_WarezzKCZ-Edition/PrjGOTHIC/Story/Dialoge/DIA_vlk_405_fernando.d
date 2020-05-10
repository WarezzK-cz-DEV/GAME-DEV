
instance DIA_FERNANDO_EXIT(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 999;
	condition = dia_fernando_exit_condition;
	information = dia_fernando_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fernando_exit_condition()
{
	return TRUE;
};

func void dia_fernando_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_FERNANDO_PICKPOCKET(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 900;
	condition = dia_fernando_pickpocket_condition;
	information = dia_fernando_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fernando_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (50 - THEFTDIFF)) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_pickpocket_info()
{
	Info_ClearChoices(dia_fernando_pickpocket);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_BACK,dia_fernando_pickpocket_back);
	Info_AddChoice(dia_fernando_pickpocket,DIALOG_PICKPOCKET,dia_fernando_pickpocket_doit);
};

func void dia_fernando_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_fernando_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_fernando_pickpocket_back()
{
	Info_ClearChoices(dia_fernando_pickpocket);
};


instance DIA_FERNANDO_HELLO(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_hello_condition;
	information = dia_fernando_hello_info;
	permanent = FALSE;
	description = "How's business?";
};


func int dia_fernando_hello_condition()
{
	if(NPCOBSESSEDBYDMT_FERNANDO == FALSE)
	{
		return TRUE;
	};
};

func void dia_fernando_hello_info()
{
	AI_Output(other,self,"DIA_Fernando_Hello_15_00");	//How's business?
	AI_Output(self,other,"DIA_Fernando_Hello_14_01");	//Not so great. Back when the Barrier was still in place, times were better.
	AI_Output(self,other,"DIA_Fernando_Hello_14_02");	//The prisoners would scrape boxes and boxes of ore from the mines, and my ships then brought it to the mainland.
	AI_Output(self,other,"DIA_Fernando_Hello_14_03");	//And on their way back, they brought food and other wares.
	AI_Output(self,other,"DIA_Fernando_Hello_14_04");	//But now we're cut off from the mainland and have to rely on the farmers for supplies.
};


instance DIA_FERNANDO_PERM(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 850;
	condition = dia_fernando_perm_condition;
	information = dia_fernando_perm_info;
	permanent = TRUE;
	description = "How do you make a living now?";
};


func int dia_fernando_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_perm_info()
{
	AI_Output(other,self,"DIA_Fernando_Perm_15_00");	//How do you make a living now?
	if(FERNANDO_IMKNAST == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if(FERNANDO_HATSZUGEGEBEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_Perm_14_00");	//I don't know. But at any rate, no more shady dealings for me. That much is clear.
	}
	else if(Npc_KnowsInfo(other,dia_fernando_success) == FALSE)
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_01");	//Right now, I'm living off of my savings. But if I can't get back into business, times are going to get rough for me.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Perm_14_02");	//I am ruined. I should have listened to my father and kept out of this mining business.
	};
};


instance DIA_FERNANDO_MINENTAL(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 2;
	condition = dia_fernando_minental_condition;
	information = dia_fernando_minental_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fernando_minental_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2) && (ENTEROW_KAPITEL2 == FALSE) && (FERNANDO_HATSZUGEGEBEN == FALSE) && (FERNANDO_IMKNAST == FALSE))
	{
		return TRUE;
	};
};

func void dia_fernando_minental_info()
{
	AI_Output(self,other,"DIA_Fernando_Minental_14_00");	//Hey you - wait a minute. You are headed for the Valley of Mines, aren't you?
	AI_Output(other,self,"DIA_Fernando_Minental_15_01");	//And?
	AI_Output(self,other,"DIA_Fernando_Minental_14_02");	//Here's a bargain. You give me a report of what's going on with the ore, and for that I get you...
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_03");	//... a runestone.
	}
	else
	{
		AI_Output(self,other,"DIA_Fernando_Minental_14_04");	//... a ring that increases your life energy.
	};
	AI_Output(other,self,"DIA_Fernando_Minental_15_05");	//I'll see what I can do.
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"START");
	Log_CreateTopic(TOPIC_FERNANDO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERNANDO,LOG_RUNNING);
	b_logentry(TOPIC_FERNANDO,"The merchant Fernando wants to know what's with the ore in the Valley of Mines.");
};


instance DIA_ADDON_FERNANDO_BANDITTRADER(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_addon_fernando_bandittrader_condition;
	information = dia_addon_fernando_bandittrader_info;
	description = "You've been selling weapons to the bandits.";
};


func int dia_addon_fernando_bandittrader_condition()
{
	if(Npc_KnowsInfo(other,dia_fernando_hello) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (Npc_HasItems(other,itmw_addon_bandittrader) || Npc_HasItems(other,itri_addon_bandittrader) || (Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))))
	{
		return TRUE;
	};
};

func void dia_addon_fernando_bandittrader_info()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_00");	//You've been selling weapons to the bandits.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_01");	//(baffled) But - what makes you think THAT?
	b_logentry(TOPIC_ADDON_BANDITTRADER,"Fernando the overseas trader admitted himself that he supplied weapons to the bandits.");
	b_giveplayerxp(XP_ADDON_FERNANDO_HATSZUGEGEBEN);
	FERNANDO_HATSZUGEGEBEN = TRUE;
	if(Npc_HasItems(other,itwr_addon_bandittrader) && (BANDITTRADER_LIEFERUNG_GELESEN == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_02");	//This list of merchandise that I took from a bandit bears YOUR signature.
	};
	if(Npc_HasItems(other,itri_addon_bandittrader))
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_03");	//I found this ring of the overseas traders' guild Araxos with the bandits. You're an overseas trader.
		if(Npc_HasItems(other,itmw_addon_bandittrader))
		{
			AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_04");	//And the swords which the bandits were carrying bore your initials.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_05");	//The swords which the bandits were carrying bore your initials.
	};
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_06");	//You can admit it now. I've blown your cover.
	if(FERNANDO_IMKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_07");	//So YOU did this. YOU'RE the one who gave me away. I'm going to make you pay for this.
		AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_15_08");	//You'd first have to get out of here, and I hardly think they're going to let you go any time soon.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_09");	//(angrily, to himself) My time will come.
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_10");	//(pleading) I didn't mean to do that, believe me.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_11");	//(pleading) First, all they wanted from me was food supplies. Business was really slow, so I got involved with them.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_12");	//(pleading) Then they became more aggressive and threatened to kill me if I didn't sell them the swords they wanted.
		AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_14_13");	//(pleading) You can't blame me for this. I am a victim of circumstances.
		if(FERNANDO_IMKNAST == FALSE)
		{
			Info_ClearChoices(dia_addon_fernando_bandittrader);
			Info_AddChoice(dia_addon_fernando_bandittrader,"What will you pay me if I let you go?",dia_addon_fernando_bandittrader_preis);
			Info_AddChoice(dia_addon_fernando_bandittrader,"The militia is going to deal with you.",dia_addon_fernando_bandittrader_mil);
			Info_AddChoice(dia_addon_fernando_bandittrader,"I'm shaking, I'm shaking.",dia_addon_fernando_bandittrader_uptown);
		};
	};
};

func void dia_addon_fernando_bandittrader_uptown()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_00");	//Don't make me weep. You're pretty repulsive for someone who lives in the upper quarter.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_Uptown_15_01");	//You'd sell your soul for a fistful of gold pieces.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_Uptown_14_02");	//I've got my expenses to cover. If I'm not liquid, they're going to feed me to the mob from the harbor district.
};

func void dia_addon_fernando_bandittrader_mil()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_00");	//The militia is going to deal with you.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_01");	//You can't do this.
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_mil_15_02");	//I should say I can. You'll be amazed.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_mil_14_03");	//By Innos. I'm ruined.
	b_npcclearobsessionbydmt(self);
};

func void dia_addon_fernando_bandittrader_preis()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_preis_15_00");	//What will you pay me if I let you go?
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_01");	//You know I'm not doing too well. I can't give you much.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_02");	//I'll give you 200 gold coins and a valuable ring.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_preis_14_03");	//That will have to do. Will you give me the incriminating material now?
	Info_ClearChoices(dia_addon_fernando_bandittrader);
	Info_AddChoice(dia_addon_fernando_bandittrader,"Forget it. I'm not going to give that away.",dia_addon_fernando_bandittrader_nein);
	Info_AddChoice(dia_addon_fernando_bandittrader,"Well, all right. Agreed.",dia_addon_fernando_bandittrader_ja);
};

func void dia_addon_fernando_bandittrader_ja()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_ja_15_00");	//Well, all right. Agreed.
	b_giveplayerxp(XP_AMBIENT);
	Npc_RemoveInvItems(hero,itmw_addon_bandittrader,Npc_HasItems(other,itmw_addon_bandittrader));
	Npc_RemoveInvItem(hero,itri_addon_bandittrader);
	Npc_RemoveInvItem(hero,itwr_addon_bandittrader);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_01");	//Fine, here's your gold.
	CreateInvItems(self,itmi_gold,200);
	b_giveinvitems(self,other,itmi_gold,200);
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_ja_14_02");	//And the ring. We're even now.
	CreateInvItems(self,itri_prot_point_01,1);
	b_giveinvitems(self,other,itri_prot_point_01,1);
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};

func void dia_addon_fernando_bandittrader_nein()
{
	AI_Output(other,self,"DIA_Addon_Fernando_BanditTrader_nein_15_00");	//No. I think I'd rather keep it.
	AI_Output(self,other,"DIA_Addon_Fernando_BanditTrader_nein_14_01");	//Fine. Keep it then, but woe betide you if you rat on me.
	Info_ClearChoices(dia_addon_fernando_bandittrader);
};


instance DIA_FERNANDO_SUCCESS(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 5;
	condition = dia_fernando_success_condition;
	information = dia_fernando_success_info;
	permanent = FALSE;
	description = "I've been to the Valley of Mines.";
};


func int dia_fernando_success_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (KAPITEL >= 3) && Npc_KnowsInfo(other,dia_fernando_minental))
	{
		return TRUE;
	};
};

func void dia_fernando_success_info()
{
	AI_Output(other,self,"DIA_Fernando_Success_15_00");	//I've been to the Valley of Mines.
	if(FERNANDO_IMKNAST == FALSE)
	{
		FERNANDO_ERZ = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		AI_Output(self,other,"DIA_Fernando_Success_14_01");	//And? How is the situation there?
		AI_Output(other,self,"DIA_Fernando_Success_15_02");	//The mines are all depleted, there's barely more than a few chests full of ore. It's hardly worth digging for that.
		AI_Output(self,other,"DIA_Fernando_Success_14_03");	//That can't be true! That means I'm ruined...
		if(FERNANDO_HATSZUGEGEBEN == FALSE)
		{
			AI_Output(other,self,"DIA_Fernando_Success_15_04");	//What about our deal?
			AI_Output(self,other,"DIA_Fernando_Success_14_05");	//Now, about your reward...
			if(other.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_06");	//Here, take this runestone.
				b_giveinvitems(self,other,itmi_runeblank,1);
			}
			else
			{
				AI_Output(self,other,"DIA_Fernando_Minental_14_07");	//Here's your ring.
				b_giveinvitems(self,other,itri_hp_02,1);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOTNOW");
		Log_SetTopicStatus(TOPIC_FERNANDO,LOG_OBSOLETE);
		b_logentry(TOPIC_FERNANDO,"Fernando no longer wants the information. And I'm not going to get paid, either.");
	};
};


instance DIA_FERNANDO_OBSESSION(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 30;
	condition = dia_fernando_obsession_condition;
	information = dia_fernando_obsession_info;
	description = "Are you all right?";
};


func int dia_fernando_obsession_condition()
{
	if((KAPITEL >= 3) && (NPCOBSESSEDBYDMT_FERNANDO == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_obsession_info()
{
	b_npcobsessedbydmt(self);
};


instance DIA_FERNANDO_HEILUNG(C_INFO)
{
	npc = vlk_405_fernando;
	nr = 55;
	condition = dia_fernando_heilung_condition;
	information = dia_fernando_heilung_info;
	permanent = TRUE;
	description = "You're possessed!";
};


func int dia_fernando_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_FERNANDO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_fernando_heilung_info()
{
	AI_Output(other,self,"DIA_Fernando_Heilung_15_00");	//You're possessed!
	AI_Output(self,other,"DIA_Fernando_Heilung_14_01");	//Go away. Go already.
	b_npcclearobsessionbydmt(self);
};

