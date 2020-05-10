
instance DIA_KARDIF_EXIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 999;
	condition = dia_kardif_exit_condition;
	information = dia_kardif_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kardif_exit_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PICKPOCKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 900;
	condition = dia_kardif_pickpocket_condition;
	information = dia_kardif_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kardif_pickpocket_condition()
{
	return c_beklauen(55,85);
};

func void dia_kardif_pickpocket_info()
{
	Info_ClearChoices(dia_kardif_pickpocket);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_BACK,dia_kardif_pickpocket_back);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_PICKPOCKET,dia_kardif_pickpocket_doit);
};

func void dia_kardif_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kardif_pickpocket);
};

func void dia_kardif_pickpocket_back()
{
	Info_ClearChoices(dia_kardif_pickpocket);
};


instance DIA_KARDIF_HI(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hi_condition;
	information = dia_kardif_hi_info;
	permanent = FALSE;
	description = "What's up?";
};


func int dia_kardif_hi_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_hi_info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//How are things?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//If you want something to drink, you'll have to order it.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif sells drinks in the dockside pub.");
};


instance DIA_KARDIF_HALLO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hallo_condition;
	information = dia_kardif_hallo_info;
	permanent = FALSE;
	description = "I bet you overhear a lot of things...";
};


func int dia_kardif_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_hi) && (KARDIF_DEAL == 0))
	{
		return TRUE;
	};
};

func void dia_kardif_hallo_info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//I bet you overhear a lot of things...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//So, what's that to you?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//I've always got an open ear for news.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//Have you got your purse open, then?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Every piece of information I give you will cost 10 gold pieces.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Kardif, the barkeeper of the harbor pub, trades information.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"I'll give you no more than 5 for your info.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"Forget it - I'll get my info elsewhere.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"All right, agreed.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//All right, agreed.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//You struck a good bargain (grins). I'm always at your service.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//I'll give you no more than 5 for your information.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//What, 5 gold pieces? Are you trying to ruin me? (thinks briefly) - Let's make it 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"No, it doesn't work that way. Let's say 6!",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"OK, 7 gold pieces sounds fair.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Forget it - I'll get my information elsewhere.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//All right, all right... I'll go down to 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"OK, 7 gold pieces sounds fair.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"No, I don't need your information that bad.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//OK, 7 gold pieces sounds fair.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(grins) A wise decision. Well, so if there's anything you want to know, ask me.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//No, I don't need your information that bad.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Hey, wait...(sigh) - all right, 5 gold pieces. But that's my final offer!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Why couldn't you say that right away?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//Why couldn't you say that right away?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Oh, I'm simply out of shape. But whatever - it's a deal.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//No, it doesn't work that way. Let's say 6!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//You're a scoundrel, you know that? Well, if you insist, let's say 6 gold pieces for each piece of information.
	KARDIF_DEAL = 6;
	Info_ClearChoices(dia_kardif_hallo);
};


instance DIA_KARDIF_TRADE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_trade_condition;
	information = dia_kardif_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Give me something to drink.";
};


func int dia_kardif_trade_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_trade_info()
{
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Give me something to drink.
	b_givetradeinv(self);
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "I need some information.";
};


func int dia_kardif_tradeinfo_condition()
{
	if((KARDIF_ONEQUESTION == FALSE) && (KARDIF_DEAL > 0))
	{
		return TRUE;
	};
};

func void dia_kardif_tradeinfo_info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//I need information.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Come back when you have enough gold.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "Who counts among the influential citizens in this town?";
};


var int dia_kardif_buerger_permanent;

func int dia_kardif_buerger_condition()
{
	if((DIA_KARDIF_BUERGER_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_buerger_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Who counts among the influential citizens in this town?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//You won't find anyone down here at the harbor. The only powerful man here is Lehmar.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//The moneylender is not very popular, but he has gold, and other influential citizens owe him money.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//The merchants and craftsmen also have a lot of influence - too much if you ask me.
		DIA_KARDIF_BUERGER_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LEHMAR(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lehmar_condition;
	information = dia_kardif_lehmar_info;
	permanent = TRUE;
	description = "Who's in debt to Lehmar?";
};


var int dia_kardif_lehmar_permanent;

func int dia_kardif_lehmar_condition()
{
	if((DIA_KARDIF_LEHMAR_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_BUERGER_PERMANENT == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lehmar_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Who's in debt to Lehmar?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(laughs) If you want to know that, you should take a look in his ledger.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Only it might be pretty difficult to do that without him noticing.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//As far as I know, he always carries it with him...
		DIA_KARDIF_LEHMAR_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ARBEIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_arbeit_condition;
	information = dia_kardif_arbeit_info;
	permanent = TRUE;
	description = "Where can I find work?";
};


var int dia_kardif_arbeit_permanent;

func int dia_kardif_arbeit_condition()
{
	if((DIA_KARDIF_ARBEIT_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_arbeit_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Where can I find work?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//You're not likely to find work down here at the harbor. You need to go to the craftsmen in the lower part of town for that.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//But if you wield a decent blade, you could go challenge Alrik. He fights for gold, behind the warehouse.
		DIA_KARDIF_ARBEIT_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_ADDON_KARDIF_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_addon_kardif_missingpeople_condition;
	information = dia_addon_kardif_missingpeople_info;
	permanent = TRUE;
	description = "What do you know about the missing citizens?";
};


var int dia_addon_kardif_missingpeople_permanent;

func int dia_addon_kardif_missingpeople_condition()
{
	if((DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_kardif_missingpeople_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Addon_Kardif_MissingPeople_15_00");	//What do you know about the missing citizens?
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_01");	//All I know is that some people have vanished during the last few days.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_02");	//It's especially bad down here at the harbor, they say. Maybe you should ask around here a bit.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_03");	//There were some cases in the lower part of the city, too.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_04");	//If you want to know more, you should talk to Coragon.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_05");	//He has his pub in the lower part of town, and he's likely to hear a thing or two.
		AI_Output(self,other,"DIA_Addon_Kardif_MissingPeople_14_06");	//Halvor, the fish merchant down by the quay, might know something, too. Many people frequent him.
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Kardif says I should ask Coragon, the tavern barkeeper from the lower part of town, and Halvor the fishmonger at the harbor about the missing citizens.");
		DIA_ADDON_KARDIF_MISSINGPEOPLE_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LERNEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lernen_condition;
	information = dia_kardif_lernen_info;
	permanent = TRUE;
	description = "Who can teach me something here?";
};


var int dia_kardif_lernen_permanent;

func int dia_kardif_lernen_condition()
{
	if((DIA_KARDIF_LERNEN_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lernen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//Who can teach me something here?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//There are a few competent people here in the harbor district.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Carl the blacksmith is a sturdy fellow. I bet he can show you how to get stronger.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Alrik knows a lot about fighting. And Lares is a cunning rogue. He's down here at the harbor sometimes as well.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//And if you're crazy enough to go see old Ignaz - he knows all about aleche... almich... potions.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//Where can I find all these people?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(groans) Boy, the King will have won his war against the orcs before I'm done explaining that to you.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Just look around the harbor district, and you're bound to find them. And if you don't know your way about, go to Brahim and buy yourself a map.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//HE is easy to find. His hut is right next to my pub. (murmurs) I should have charged double for that one.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Carl, the smith in the harbor district, can help me become stronger.");
		b_logentry(TOPIC_CITYTEACHER,"Lares can help me improve my dexterity.");
		b_logentry(TOPIC_CITYTEACHER,"Alrik can train me to fight with one-handed weapons. He hangs round behind the storehouse in the harbor district.");
		b_logentry(TOPIC_CITYTEACHER,"Ignaz can show me some recipes for brewing potions. He lives in the harbor district.");
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Brahim draws and sells maps near the harbor.");
		DIA_KARDIF_LERNEN_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk_condition;
	information = dia_kardif_diebeswerk_info;
	permanent = TRUE;
	description = "Is there any 'special' work to be had...?";
};


var int dia_kardif_diebeswerk_permanent;

func int dia_kardif_diebeswerk_condition()
{
	if((DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//Is there any 'special' work to be had around here where I could make some quick money?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Something special, you say? Hmmm...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//... go talk to Nagur then. Maybe he can help you.
		DIA_KARDIF_DIEBESWERK_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK2(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk2_condition;
	information = dia_kardif_diebeswerk2_info;
	permanent = TRUE;
	description = "Got anything 'special' for me to do?";
};


var int dia_kardif_diebeswerk2_permanent;

func int dia_kardif_diebeswerk2_condition()
{
	if((DIA_KARDIF_DIEBESWERK2_PERMANENT == FALSE) && (DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk2_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Got anything 'special' for me to do?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//I've got something for you - but that should only interest you if you're a man of versatile talents.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//What have you got?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Well, Zuris, the potion vendor in the marketplace, currently has a guest - Daron the Fire Magician.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//And?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//He had a new chest made specially for him by Thorben the carpenter.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//They say that this Daron has brought a bunch of valuable stuff with him. But you didn't hear that from me, understand?
		DIA_KARDIF_DIEBESWERK2_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ZURUECK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_zurueck_condition;
	information = dia_kardif_zurueck_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_kardif_zurueck_condition()
{
	if(KARDIF_ONEQUESTION == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zurueck_info()
{
	KARDIF_ONEQUESTION = FALSE;
	Info_ClearChoices(dia_kardif_zurueck);
};


instance DIA_KARDIF_DOPE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_dope_condition;
	information = dia_kardif_dope_info;
	permanent = TRUE;
	description = "Where can I buy weed here?";
};


var int dia_kardif_dope_perm;

func int dia_kardif_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_DOPE_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_dope_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Where can I buy weed here?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Certainly not here - I've nothing to do with stuff like that.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Certainly not here.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//All right, where then?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//I'd talk to Meldor if I were you - after all, he smokes all day.
		DIA_KARDIF_DOPE_PERM = TRUE;
	};
};


instance DIA_KARDIF_PAKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 3;
	condition = dia_kardif_paket_condition;
	information = dia_kardif_paket_info;
	permanent = TRUE;
	description = "What do you know about a package of swampweed?";
};


var int dia_kardif_paket_perm;

func int dia_kardif_paket_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_PAKET_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_paket_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//What do you know about a package of swampweed?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Whoever owns such a package is a rich man. And probably a very relaxed man as well!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Don't try to fool me. You know something. So spit it out!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//All right, all right - this fellow came to my pub the other day. One of the mercenaries.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//He said that he'd sold a package of swampweed at the harbor, but of course he was completely stoned. That's all I know.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"Kardif's been talking to a mercenary. The guy had a package of swampweed he was looking to sell.");
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_SENDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_sendattila_condition;
	information = dia_kardif_sendattila_info;
	important = TRUE;
};


func int dia_kardif_sendattila_condition()
{
	if(((MIS_THIEFGUILD_SUCKED == TRUE) || (DIEBESGILDE_OKAY >= 3) || (MIS_NAGUR_BOTE == LOG_FAILED) || ((DIEBESGILDE_OKAY == 2) && (NAGURHACK == TRUE))) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_kardif_sendattila_info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Hey you, come over here. I've got something for you.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//There was a fellow here who insisted on talking to you.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Since you weren't here, he told me to give you a message.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//He wants to meet you. Behind Halvor's fish shop.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//This piece of information is free - but that's an exception, kid! Anything beyond that will cost you.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//What did the guy look like?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//I could tell you that - but you need to pay for it, my friend. (grins)
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Every piece of information I give you will cost 10 gold pieces.
		KARDIF_DEAL = 10;
	};
	Wld_InsertNpc(vlk_494_attila,"NW_CITY_ENTRANCE_01");
	if((NAGURHACK == TRUE) || (MIS_NAGUR_BOTE == LOG_FAILED))
	{
		MIS_THIEFGUILD_SUCKED = TRUE;
	};
};


instance DIA_KARDIF_KERL(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_kerl_condition;
	information = dia_kardif_kerl_info;
	permanent = TRUE;
	description = "What did the guy look like?";
};


var int dia_kardif_kerl_permanent;

func int dia_kardif_kerl_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_sendattila) && (attila.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_KERL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_kerl_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//What did the guy look like?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Well, rather tall, dark-skinned and strong - but no uniform. Somehow... menacing.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//And his face?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//His face? When he looked at me I was glad that it wasn't me he had come for.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//There was something scary in his eyes - anyway, I think you should go see him. This is bound to be interesting.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Yeah... the question is, for whom...
		DIA_KARDIF_KERL_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DEFEATEDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_defeatedattila_condition;
	information = dia_kardif_defeatedattila_info;
	permanent = FALSE;
	description = "That bastard tried to kill me!";
};


func int dia_kardif_defeatedattila_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_hallo))
	{
		return TRUE;
	};
};

func void dia_kardif_defeatedattila_info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//That bastard tried to kill me!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Hey, how would that be my fault? All I did was pass on some information.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//If anyone is determined to step on your toes, I guess he'll have his reasons.
	b_giveplayerxp(XP_KARDIF_BLAME4ATTILA);
	b_killnpc(attila);
	Npc_RemoveInvItem(attila,itmi_oldcoin);
};


instance DIA_KARDIF_ZEICHEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_zeichen_condition;
	information = dia_kardif_zeichen_info;
	permanent = FALSE;
	description = "(Show thieves' signal)";
};


func int dia_kardif_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Ah, you're involved with the gang. All right. In that case, I've got something for you.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(quietly) If you ever need some lock picks, come to me. I still have a few around. Just ask me for something to drink.
	CreateInvItems(self,itke_lockpick,20);
};


instance DIA_KARDIF_CREW(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 51;
	condition = dia_kardif_crew_condition;
	information = dia_kardif_crew_info;
	permanent = FALSE;
	description = "I still need a few sailors.";
};


func int dia_kardif_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_crew_info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//I still need a few sailors.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Bad times, my friend. You won't find enough sailors in all of Khorinis. Most of them have left the city.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//But with a good captain, it shouldn't be too hard to find yourself a few bright lads and make them into a decent crew before too long.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Where can I find a captain?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//You're asking the wrong guy. I just run this pub.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"Kardif sent me to old Jack. Apparently, he should be able to help me.");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Go talk to Old Jack. He's been hanging around this harbor for as long as I can think. When it comes to seafaring, he's your man.
	};
};

