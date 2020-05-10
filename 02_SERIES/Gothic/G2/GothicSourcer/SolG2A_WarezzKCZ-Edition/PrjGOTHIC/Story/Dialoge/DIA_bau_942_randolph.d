
instance DIA_RANDOLPH_EXIT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 999;
	condition = dia_randolph_exit_condition;
	information = dia_randolph_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_randolph_exit_condition()
{
	return TRUE;
};

func void dia_randolph_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SCHWERELUFT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_schwereluft_condition;
	information = dia_randolph_schwereluft_info;
	permanent = FALSE;
	description = "Everything all right?";
};


func int dia_randolph_schwereluft_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_schwereluft_info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Everything all right?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Hmm... as soon as anyone says anything wrong around here, the dance starts... so watch your step, or there'll be a slaughter.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Will you join the fight?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//I'm not going to just stand here when the ruckus starts. But I'm not going to push it either.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Akil's farm is threatened by mercenaries.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "Everything all right?";
};


func int dia_randolph_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_hallo_info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Everything all right?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Now that Kati and Akil have been taken to the realm of Innos, I'm going to run the farm.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Yes, I'm fine. That Alvares has become bolder and bolder lately. Good thing that's over now.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//What I could use now is a good drop in the tavern.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "Baltram sent me...";
};


func int dia_randolph_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && Npc_IsDead(akil) && Npc_IsDead(kati) && (LIEFERUNG_GEHOLT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_baltram_info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Baltram sent me. I'm supposed to pick up his shipment.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Good. I've already prepared everything. Here's your package.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_RANDOLPH_GESCHICHTE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_geschichte_condition;
	information = dia_randolph_geschichte_info;
	permanent = FALSE;
	description = "You're not from around here, right?";
};


func int dia_randolph_geschichte_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_geschichte_info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//You're not from around here, right?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//I come from the southern isles. At some point they said they needed people in Khorinis, because of that magic ore.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//But when I got there, they had this huge barrier in place. And I didn't want to go in there. So I started working in the harbor.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//Well, the ships stopped coming in, and so I went to work for Akil. I've had worse jobs, actually.
};


instance DIA_RANDOLPH_TAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_taverne_condition;
	information = dia_randolph_taverne_info;
	description = "You hang out in the tavern?";
};


func int dia_randolph_taverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_taverne_info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//You hang out in the tavern?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//That's right. But not recently.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//I cannot afford going there any more.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "What exactly is going on there in the tavern?";
};


func int dia_randolph_wasistintaverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_taverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasistintaverne_info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//What exactly is going on there in the tavern?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//There's gambling there.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Two fellows compete against each other. Whoever can hold the most beer wins.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//In the end, I did nothing but lose, and now I need to make some more money first.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"There are bets on at the tavern.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "Who did you go up against?";
};


func int dia_randolph_gegenwen_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasistintaverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_gegenwen_info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//Who did you go up against?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//Against Rukhar, that old good-for-nothing. So far he's beaten me every time.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//But somehow I have the creeping suspicion that the filthy swine has laced my beer with gin every time.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//I suspect he keeps the gin hidden in that damn chest of his. That lousy scumbag!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Somebody ought to sneak some plain water into his chest. Then he could lace my beer all he wants.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//If only I had enough money to compete against him one more time.
	b_logentry(TOPIC_WETTSAUFEN,"Randolph told me about Rukhar and the drinking contest. Randolph doesn't have enough money to compete against Rukhar again.");
	b_logentry(TOPIC_WETTSAUFEN,"Randolph suspects Rukhar of cheating in the drinking contest. Randolph would like to swap the gin bottle in Rukhar's chest for a bottle of water.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "How much money do you need for the contest?";
};


func int dia_randolph_wasbrauchstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasbrauchstdu_info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//How much money do you need for the contest?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 gold coins.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "I'll give you the money to compete against Rukhar.";
};


var int dia_randolph_ichgebedirgeld_noperm;

func int dia_randolph_ichgebedirgeld_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasbrauchstdu) && (DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_ichgebedirgeld_info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//I'll give you the money to compete against Rukhar.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(enthusiastically) Really? Thank you so much. I'll repay you soon.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//If I win, I'll even fork out a little more than that. I'll be seeing you.
		b_logentry(TOPIC_WETTSAUFEN,"The bet's on. I should watch this.");
		b_giveplayerxp(XP_RANDOLPH_WETTKAMPFSTART);
		DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM = TRUE;
		b_npcclearobsessionbydmt(self);
		MIS_RUKHAR_WETTKAMPF_DAY = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		b_startotherroutine(orlan,"Wettkampf");
		b_startotherroutine(rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//It's all right. You don't even have enough for yourself.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_WETTKAMPFZUENDE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 10;
	condition = dia_randolph_wettkampfzuende_condition;
	information = dia_randolph_wettkampfzuende_info;
	permanent = TRUE;
	description = "Hangover?";
};


func int dia_randolph_wettkampfzuende_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (KAPITEL < 4))
	{
		return TRUE;
	};
};


var int dia_randolph_wettkampfzuende_onetime;

func void dia_randolph_wettkampfzuende_info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Hangover?
	if(RUKHAR_WON_WETTKAMPF == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//This is the mother of all hangovers, and I can't get rid of it. I'll never touch another drop, I swear.
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Your money is gone. I'm sorry.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Nope. I feel fine, really.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//It finally worked this time. Thanks again for your money. Here, take it back.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			b_giveplayerxp(XP_RUKHAR_WETTKAMPFVORBEI);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Looks like Rukhar won't be getting up any time soon.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PERM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 30;
	condition = dia_randolph_perm_condition;
	information = dia_randolph_perm_info;
	permanent = TRUE;
	description = "Are you crazy?";
};


func int dia_randolph_perm_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_RANDOLPH == FALSE))
	{
		return TRUE;
	};
};


var int dia_randolph_perm_gotmoney;

func void dia_randolph_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Are you crazy?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//You send me off without a coin and don't bother telling me that the stuff is this expensive?
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Sagitta wants 300 gold coins from me.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//I can't give you more than 150 gold coins. Please. You've got to help me. Please.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Really down-and-out. Ever since I stopped drinking, the deprivation is killing me. I really need help.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//There is a remedy that should help.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Sagitta, the old herb witch, used to prepare it for me. But I don't think I can make it there any more with all those orcs around.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"Randolph's supposedly given up drinking and has sent me to see Sagitta the herb witch and get her to give me something for his withdrawal symptoms.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//I'm still a bit wobbly on my legs, but apart from that I'm better.
		};
	};
};


instance DIA_RANDOLPH_HEILUNG(C_INFO)
{
	npc = bau_942_randolph;
	nr = 55;
	condition = dia_randolph_heilung_condition;
	information = dia_randolph_heilung_info;
	permanent = TRUE;
	description = "Booze got to your head, huh?";
};


func int dia_randolph_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_RANDOLPH == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_randolph_heilung_info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Booze got to your head, huh?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//I'll never drink another drop. Not in this life. You can bet on that, man.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "Here. This will ease your withdrawal symptoms.";
};


func int dia_randolph_sagittaheal_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && Npc_HasItems(other,itpo_healrandolph_mis))
	{
		return TRUE;
	};
};

func void dia_randolph_sagittaheal_info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Here. This will ease your withdrawal symptoms.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Oah! Thanks, man. Now I'll rest easy again.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//How can I ever repay you for this?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//I guess these few coins can only serve to save my face. But that's all, I'm afraid.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//I paid a bunch of money for you, and your few shabby coins don't even come close to reimbursing my expenses.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Well - in that case I can count myself lucky that I've met such a helpful paladin, don't you think?
	};
	MIS_HEALRANDOLPH = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALRANDOLPH);
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PICKPOCKET(C_INFO)
{
	npc = bau_942_randolph;
	nr = 900;
	condition = dia_randolph_pickpocket_condition;
	information = dia_randolph_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_randolph_pickpocket_condition()
{
	return c_beklauen(58,2);
};

func void dia_randolph_pickpocket_info()
{
	Info_ClearChoices(dia_randolph_pickpocket);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_BACK,dia_randolph_pickpocket_back);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_PICKPOCKET,dia_randolph_pickpocket_doit);
};

func void dia_randolph_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_randolph_pickpocket);
};

func void dia_randolph_pickpocket_back()
{
	Info_ClearChoices(dia_randolph_pickpocket);
};

