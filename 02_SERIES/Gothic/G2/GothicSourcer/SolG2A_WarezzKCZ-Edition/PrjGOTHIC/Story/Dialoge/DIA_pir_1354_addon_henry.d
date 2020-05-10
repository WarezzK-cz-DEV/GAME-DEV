
instance DIA_ADDON_HENRY_EXIT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 999;
	condition = dia_addon_henry_exit_condition;
	information = dia_addon_henry_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_henry_exit_condition()
{
	return TRUE;
};

func void dia_addon_henry_exit_info()
{
	AI_StopProcessInfos(self);
};

func void b_henry_gold(var int gold)
{
	if(gold == 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold500_04_00");	//500 gold pieces.
	}
	else if(gold == 400)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold400_04_00");	//400 gold pieces.
	}
	else if(gold == 300)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold300_04_00");	//300 gold pieces.
	}
	else if(gold == 200)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold200_04_00");	//200 gold pieces.
	}
	else if(gold == 100)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Gold100_04_00");	//100 gold pieces.
	}
	else
	{
		b_say_gold(self,other,gold);
	};
};


instance DIA_ADDON_HENRY_PICKPOCKET(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 900;
	condition = dia_addon_henry_pickpocket_condition;
	information = dia_addon_henry_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_henry_pickpocket_condition()
{
	return c_beklauen(40,60);
};

func void dia_addon_henry_pickpocket_info()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_BACK,dia_addon_henry_pickpocket_back);
	Info_AddChoice(dia_addon_henry_pickpocket,DIALOG_PICKPOCKET,dia_addon_henry_pickpocket_doit);
};

func void dia_addon_henry_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_henry_pickpocket);
};

func void dia_addon_henry_pickpocket_back()
{
	Info_ClearChoices(dia_addon_henry_pickpocket);
};


const string PIR_1354_CHECKPOINT = "ADW_PIRATECAMP_WAY_02";

instance DIA_ADDON_HENRY_HELLO(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_hello_condition;
	information = dia_addon_henry_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_hello_condition()
{
	if(Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) <= 700)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_00");	//HALT!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_04_01");	//Friend or foe?
	Info_ClearChoices(dia_addon_henry_hello);
	Info_AddChoice(dia_addon_henry_hello,"Foe!",dia_addon_henry_hello_feind);
	Info_AddChoice(dia_addon_henry_hello,"Friend!",dia_addon_henry_hello_freund);
};


var int henry_sc_frech;

func void dia_addon_henry_hello_feind()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Feind_15_00");	//Foe!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_01");	//Asking for a good spanking, you clown?
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Feind_04_02");	//Tell me what you want here, or beat it, and fast.
	HENRY_SC_FRECH = TRUE;
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};

func void dia_addon_henry_hello_freund()
{
	AI_Output(other,self,"DIA_Addon_Henry_Hello_Freund_15_00");	//Friend!
	AI_Output(self,other,"DIA_Addon_Henry_Hello_Freund_04_01");	//Anyone can say that! I don't know you, what do you want here?
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	Info_ClearChoices(dia_addon_henry_hello);
};


instance DIA_ADDON_HENRY_SECONDWARN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_secondwarn_condition;
	information = dia_addon_henry_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_secondwarn_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_SecondWarn_04_00");	//One more step towards the camp and I'll feed you to the sharks.
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PIR_1354_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_HENRY_ATTACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_attack_condition;
	information = dia_addon_henry_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_henry_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PIR_1354_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_addon_henry_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Addon_Henry_Attack_04_00");	//You asked for it...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


var int henry_zoll_whatfor;

instance DIA_ADDON_HENRY_WANTENTER(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_wantenter_condition;
	information = dia_addon_henry_wantenter_info;
	permanent = FALSE;
	description = "I want in there.";
};


func int dia_addon_henry_wantenter_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_wantenter_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_00");	//I want in there.
	AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_01");	//Really? That'll cost you, though.
	b_henry_gold(500);
	if(HENRY_ZOLL_WHATFOR == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_WantEnter_15_02");	//Huh? For what?
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_03");	//Don't make such a fuss.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_04");	//There's PLENTY of stuff here in camp that might interest you...
		HENRY_ZOLL_WHATFOR = TRUE;
	};
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_kdf_l) == TRUE) || (Hlp_IsItem(itm,itar_kdf_h) == TRUE) || (Hlp_IsItem(itm,itar_ranger_addon) == TRUE) || (Hlp_IsItem(itm,itar_mil_l) == TRUE) || (Hlp_IsItem(itm,itar_mil_m) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_07");	//And you look like someone who's got gold on him.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_08");	//So, a small contribution is not going to kill you.
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_09");	//Or did you steal those posh rags of yours?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WantEnter_04_10");	//You've got some gold, haven't you?
	};
};

func void b_henry_nojoin()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_00");	//If you were planning to sign on with us, lad, you're out of luck.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_01");	//Only the Captain decides who gets to sign on here, and he took half the crew and went to sea after booty.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_02");	//But you can stay until he's back.
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_03");	//Provided you don't cause any trouble here!
};


instance DIA_ADDON_HENRY_EINIGEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 2;
	condition = dia_addon_henry_einigen2_condition;
	information = dia_addon_henry_einigen2_info;
	description = "Here's your 500 gold coins.";
};


func int dia_addon_henry_einigen2_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter) && !Npc_KnowsInfo(other,dia_addon_henry_einigen) && (Npc_HasItems(other,itmi_gold) >= 500))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen2_15_00");	//Here's your 500 gold coins.
	b_giveinvitems(other,self,itmi_gold,500);
	AI_Output(self,other,"DIA_Addon_Henry_Einigen2_04_01");	//All right. Welcome to our camp!
	b_henry_nojoin();
	self.aivar[AIV_PASSGATE] = TRUE;
};


instance DIA_ADDON_HENRY_EINIGEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 3;
	condition = dia_addon_henry_einigen_condition;
	information = dia_addon_henry_einigen_info;
	description = "Can't we come to an agreement somehow?";
};


func int dia_addon_henry_einigen_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_wantenter))
	{
		return TRUE;
	};
};

func void dia_addon_henry_einigen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Einigen_15_00");	//Can't we come to an agreement somehow?
	AI_Output(self,other,"DIA_Addon_Henry_Einigen_04_01");	//Well. Give me a good reason, and I might make it cheaper for you.
};


instance DIA_ADDON_HENRY_MEATFORMORGAN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 4;
	condition = dia_addon_henry_meatformorgan_condition;
	information = dia_addon_henry_meatformorgan_info;
	permanent = FALSE;
	description = "I'm supposed to bring Morgan this meat.";
};


func int dia_addon_henry_meatformorgan_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_henry_meatformorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_00");	//I'm supposed to bring Morgan this meat.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_01");	//(curtly) Aha. And who sent you?
	AI_Output(other,self,"DIA_Addon_Henry_MeatForMorgan_15_02");	//Alligator Jack. He says that Morgan is already waiting for it.
	AI_Output(self,other,"DIA_Addon_Henry_MeatForMorgan_04_03");	//I see. Not in the mood himself, is he?
};


instance DIA_ADDON_HENRY_MALCOM(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 5;
	condition = dia_addon_henry_malcom_condition;
	information = dia_addon_henry_malcom_info;
	description = "Malcom sent me.";
};


func int dia_addon_henry_malcom_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && (MALCOMBOTSCHAFT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_malcom_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Malcom_15_00");	//Malcolm sent me. He says the wood may take a while.
	AI_Output(self,other,"DIA_Addon_Henry_Malcom_04_01");	//(griping) Oh great. I might have known. It's taking forever again.
	b_malcomexident();
};


instance DIA_ADDON_HENRY_BALTRAMPACK(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_baltrampack_condition;
	information = dia_addon_henry_baltrampack_info;
	description = "I've got a delivery here for Skip. Is he here?";
};


func int dia_addon_henry_baltrampack_condition()
{
	if((self.aivar[AIV_PASSGATE] == FALSE) && Npc_KnowsInfo(other,dia_addon_henry_einigen) && Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_henry_baltrampack_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_BaltramPack_15_00");	//I've got a delivery here for Skip. Is he here?
	AI_Output(self,other,"DIA_Addon_Henry_BaltramPack_04_01");	//Yes. Skip is here. And now?
};


var int henry_amount;

instance DIA_ADDON_HENRY_TRIBUT(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 7;
	condition = dia_addon_henry_tribut_condition;
	information = dia_addon_henry_tribut_info;
	permanent = TRUE;
	description = "Let me in.";
};


func int dia_addon_henry_tribut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_einigen) && (self.aivar[AIV_PASSGATE] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_tribut_info()
{
	HENRY_AMOUNT = 500;
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_15_00");	//Let me in.
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_01");	//Mmh...
	if(Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_02");	//You brought me a message from our woodcutters.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_meatformorgan))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_03");	//You want to play errand boy for Alligator Jack and bring the swamp rat meat to Morgan.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(Npc_KnowsInfo(other,dia_addon_henry_baltrampack))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_04");	//You've got a package for Skip.
		HENRY_AMOUNT = HENRY_AMOUNT - 100;
	};
	if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
	{
		if(HENRY_AMOUNT < 500)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_00");	//And, best of all:
		};
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_01");	//You got that varmint in the tower off our backs.
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_02");	//I never thought you could do it all by yourself.
		HENRY_AMOUNT = HENRY_AMOUNT - 200;
	};
	if(HENRY_AMOUNT <= 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_Add_04_03");	//Tell you what. You get in for free.
		self.aivar[AIV_PASSGATE] = TRUE;
		Info_ClearChoices(dia_addon_henry_tribut);
	}
	else
	{
		b_henry_gold(HENRY_AMOUNT);
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_04_05");	//... or you just get lost. It's as simple as that.
		Info_ClearChoices(dia_addon_henry_tribut);
		Info_AddChoice(dia_addon_henry_tribut,"I think that's too much.",dia_addon_henry_tribut_nein);
		if(Npc_HasItems(other,itmi_gold) >= HENRY_AMOUNT)
		{
			Info_AddChoice(dia_addon_henry_tribut,"Good. Here's your gold.",dia_addon_henry_tribut_ja);
		};
	};
};

func void dia_addon_henry_tribut_ja()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_ja_15_00");	//Good. Here's your gold.
	b_giveinvitems(other,self,itmi_gold,HENRY_AMOUNT);
	AI_Output(self,other,"DIA_Addon_Henry_Tribut_ja_04_01");	//Thanks. Welcome to our camp.
	b_henry_nojoin();
	Info_ClearChoices(dia_addon_henry_tribut);
	self.aivar[AIV_PASSGATE] = TRUE;
};

func void dia_addon_henry_tribut_nein()
{
	AI_Output(other,self,"DIA_Addon_Henry_Tribut_nein_15_00");	//I think that's too much.
	if(HENRY_AMOUNT < 500)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_03");	//Come on, I already made it cheaper for you.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Tribut_nein_04_04");	//Get lost, then.
	};
	Info_ClearChoices(dia_addon_henry_tribut);
};


instance DIA_ADDON_HENRY_PALISADE(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_condition;
	information = dia_addon_henry_palisade_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_addon_henry_palisade_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_01");	//What does it look like? I must see to it that these miserable wretches get the palisade built in time.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_02");	//If they don't, Cap'n Greg will kick my ass all over the place.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_04_03");	//Also, I keep strangers from traipsing in here just like that.
};


instance DIA_ADDON_HENRY_PALISADE_WHATFOR(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 12;
	condition = dia_addon_henry_palisade_whatfor_condition;
	information = dia_addon_henry_palisade_whatfor_info;
	permanent = FALSE;
	description = "What are you building the palisade for?";
};


func int dia_addon_henry_palisade_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_WhatFor_15_00");	//What are you building the palisade for?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_10");	//Well, we don't want to make it too easy for the bandits!
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_02");	//Those bastards are getting more brazen all the time. They've been sneaking around our camp for days now. Just like sharks after a shipwreck.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_11");	//Some of those good-for-nothings are holing up in the tower a little south of here.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_12");	//But that's only an advance party, I'm sure.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_WhatFor_04_03");	//If they're really stupid enough to mount an attack, we'll give them a welcome they won't forget.
	Log_CreateTopic(TOPIC_ADDON_BANDITSTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BANDITSTOWER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BANDITSTOWER,"A few bandits have occupied the tower south of the pirate camp and fortified it.");
};

func void b_henry_whereistower()
{
	AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_08");	//Where exactly is that tower located?
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_07");	//Set off from here and keep to the right.
	AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_08");	//You'll find the tower on a small cliff there.
};


instance DIA_ADDON_HENRY_TURMBANDITEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 13;
	condition = dia_addon_henry_turmbanditen_whatfor_condition;
	information = dia_addon_henry_turmbanditen_whatfor_info;
	permanent = TRUE;
	description = "About those bandits in the tower...";
};


func int dia_addon_henry_turmbanditen_whatfor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor) && (MIS_HENRY_FREEBDTTOWER != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_henry_turmbanditen_whatfor_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Turmbanditen_15_00");	//About those bandits in the tower...
	if(c_towerbanditsdead() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_01");	//Yes?
		AI_Output(other,self,"DIA_Addon_Francis_BanditsDead_15_01");	//They're history.
		if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_02");	//Great! One less problem, then.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_03");	//Did you pull that off all by yourself? Respect!
			AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_04");	//Maybe you'll even be a real pirate some day!
		};
		sawpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(sawpirate,"START");
		hammerpirate.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(hammerpirate,"START");
		MIS_HENRY_FREEBDTTOWER = LOG_SUCCESS;
		b_logentry(TOPIC_ADDON_BANDITSTOWER,"The bandits in the tower are dead.");
		b_giveplayerxp(XP_ADDON_HENRY_FREEBDTTOWER);
	}
	else if(MIS_HENRY_FREEBDTTOWER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_07");	//What else do you want?
		b_henry_whereistower();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_05");	//If you're planning to take them on ALL BY YOURSELF, forget it!
		AI_Output(self,other,"DIA_Addon_Henry_Turmbanditen_04_06");	//I'll be sending two people from my raiding troop soon. Let them handle the bandits.
		KNOWS_HENRYSENTERTRUPP = TRUE;
	};
};


instance DIA_ADDON_HENRY_PALISADE_BANDITS(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 14;
	condition = dia_addon_henry_palisade_bandits_condition;
	information = dia_addon_henry_palisade_bandits_info;
	permanent = FALSE;
	description = "Why would the bandits attack you?";
};


func int dia_addon_henry_palisade_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade_whatfor))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Bandits_15_00");	//Why would the bandits attack you?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_04");	//Because there's WAR between them and us! What did you think?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_05");	//Everything was peachy at first. We brought them here, they marched right into their swamp and left us alone.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_06");	//But now, those bastards attack anyone who's not one of them.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_07");	//Heaven knows what's gotten into them.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_08");	//I reckon they may be after our boats. There's no other way to get out of here, after all.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_09");	//You should ask Skip about this. He's been with them - and barely got away with his life.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_10");	//He's got quite an interesting tale to tell.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Bandits_04_11");	//(mischievously) Too bad you can't hear it, though. You haven't paid your toll, after all.
		HENRY_ZOLL_WHATFOR = TRUE;
	};
};


var int henry_entercrewmember;

instance DIA_ADDON_HENRY_ENTERCREW(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 31;
	condition = dia_addon_henry_entercrew_condition;
	information = dia_addon_henry_entercrew_info;
	permanent = TRUE;
	description = "I want to join your raiding troop.";
};


func int dia_addon_henry_entercrew_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ENTERCREWMEMBER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_entercrew_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_00");	//I want to join your raiding troop.
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_00");	//(laughs) You won't get past me that easily, kid!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_01");	//First let's talk about whether you can get into the CAMP at all!
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_06");	//Well, welcome to my raiding troop, then!
		AI_Output(self,other,"DIA_Addon_Henry_Entercrew_04_07");	//One more fighter to help keep the bandits off our backs.
		if(MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_02");	//Hmm, I should have said, get one of the boys and smoke out those bastards in the tower.
			AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_03");	//But you already did that.
		}
		else
		{
			if(Npc_IsDead(sawpirate) && Npc_IsDead(hammerpirate))
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_04");	//Well, my men are both dead. So you'll have to go it alone after all.
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_05");	//Get rid of those bandits in the tower for us!
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry wants me to drive the bandits out of the tower. He can't give me any support.");
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Henry_Entercrew_Add_04_06");	//Grab one of the boys and make short shrift of those bandits in the tower.
				HENRY_GETPARTYMEMBER = TRUE;
				b_logentry(TOPIC_ADDON_BANDITSTOWER,"Henry wants me to drive the bandits out of the tower. I am to take one of his boys with me.");
			};
			b_henry_whereistower();
			AI_Output(other,self,"DIA_Addon_Henry_Entercrew_15_09");	//Aye aye, Sir!
			MIS_HENRY_FREEBDTTOWER = LOG_RUNNING;
		};
		HENRY_ENTERCREWMEMBER = TRUE;
	};
};


instance DIA_ADDON_HENRY_OWEN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 32;
	condition = dia_addon_henry_owen_condition;
	information = dia_addon_henry_owen_info;
	description = "Is there anything else for me to do?";
};


func int dia_addon_henry_owen_condition()
{
	if((MIS_HENRY_FREEBDTTOWER == LOG_SUCCESS) && (HENRY_ENTERCREWMEMBER == TRUE) && !Npc_IsDead(malcom))
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen_15_01");	//Is there anything else for me to do?
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_01");	//We've been waiting for wood for our palisade for days now.
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_05");	//Malcolm and Owen should have been back some time ago.
	if(!Npc_KnowsInfo(other,dia_addon_henry_malcom))
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_06");	//Their woodcutters' camp isn't far from here, by the hollow to the south-east.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_Owen_04_07");	//Malcolm said it would take a WHILE - not half an ETERNITY!
	};
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_08");	//Tell them we're waiting for that wood!
	AI_Output(self,other,"DIA_Addon_Henry_Owen_04_09");	//No, wait! Tell OWEN. Malcolm is too unreliable.
	b_malcomexident();
	MIS_HENRY_HOLOWEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_HOLOWEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOLOWEN,"Henry is waiting for the wood for the palisade. I'm supposed to inform Owen. He is together with Malcom by the hollow.");
};

func void b_addon_henry_malcomsdead()
{
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_00");	//What about Malcolm?
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_Add_15_01");	//He's dead.
	AI_Output(self,other,"DIA_Addon_Henry_Owen2_Add_04_02");	//Well, looks like he ran out of luck, then.
};


instance DIA_ADDON_HENRY_OWEN2(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 33;
	condition = dia_addon_henry_owen2_condition;
	information = dia_addon_henry_owen2_info;
	permanent = TRUE;
	description = "About that woodcutter, Owen...";
};


func int dia_addon_henry_owen2_condition()
{
	if(MIS_HENRY_HOLOWEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_owen2_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_00");	//About that woodcutter, Owen...
	if(Npc_IsDead(pir_1367_addon_owen) == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_01");	//He's dead.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_02");	//Damnit! I guess I'll have to send a new man, then.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_03");	//(grumbling) High time Morgan finally got around to getting rid of those beasts around here.
		b_addon_henry_malcomsdead();
		MIS_HENRY_HOLOWEN = LOG_OBSOLETE;
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen and Malcom are both dead.");
		Log_SetTopicStatus(TOPIC_ADDON_HOLOWEN,LOG_OBSOLETE);
	}
	else if(OWEN_COMESTOHENRY == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_03");	//Owen will bring you the wood.
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_04");	//Very good. And high time, too.
		b_addon_henry_malcomsdead();
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_05");	//Here's your reward.
		b_giveinvitems(self,other,itmi_gold,200);
		b_startotherroutine(pir_1367_addon_owen,"PostStart");
		b_logentry(TOPIC_ADDON_HOLOWEN,"Owen will take the wood to Henry.");
		MIS_HENRY_HOLOWEN = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_OWEN_COMESTOHENRY);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Henry_Owen2_15_06");	//Where's his camp again?
		AI_Output(self,other,"DIA_Addon_Henry_Owen2_04_07");	//It's not far from here, to the south-east by the hollow.
	};
};


var int henry_perm_once;

instance DIA_ADDON_HENRY_PALISADE_CANHELP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 34;
	condition = dia_addon_henry_palisade_canhelp_condition;
	information = dia_addon_henry_palisade_canhelp_info;
	permanent = TRUE;
	description = "Do you need help?";
};


func int dia_addon_henry_palisade_canhelp_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_SUCCESS) || (MIS_HENRY_HOLOWEN == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_canhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_00");	//Do you need help?
	if(HENRY_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_01");	//Do you know anything about building palisades?
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_CanHelp_15_02");	//No, not really.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_03");	//Then I can't use you here. Go and help out somewhere else.
		HENRY_PERM_ONCE = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_CanHelp_04_04");	//Get roaring drunk for all I care, but keep out of the way of my workers.
};


instance DIA_ADDON_HENRY_WHATTEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 21;
	condition = dia_addon_henry_whatteach_condition;
	information = dia_addon_henry_whatteach_info;
	permanent = TRUE;
	description = "Can you teach me how to be a better fighter?";
};


func int dia_addon_henry_whatteach_condition()
{
	if((KNOWS_HENRYSENTERTRUPP == TRUE) && (HENRY_ADDON_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_whatteach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_WhatTeach_Add_15_00");	//Can you teach me how to be a better fighter?
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_01");	//(laughs) First, pay your toll. After that, I can talk to you about fighting.
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_02");	//(slyly) It's all included in the price.
		HENRY_ZOLL_WHATFOR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Henry_WhatTeach_Add_04_03");	//Sure, why not?
		HENRY_ADDON_TEACHPLAYER = TRUE;
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	};
};


var int henry_merke2h;
var int henry_labercount;

func void b_henry_commentfightskill()
{
	if(HENRY_LABERCOUNT == 0)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_01");	//You're learning fast, maybe you'll be a real pirate some day.
		HENRY_LABERCOUNT = 1;
	}
	else if(HENRY_LABERCOUNT == 1)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_02");	//If you continue like that, you'll soon be able to board a ship all by yourself.
		HENRY_LABERCOUNT = 2;
	}
	else if(HENRY_LABERCOUNT == 2)
	{
		AI_Output(self,other,"DIA_Addon_Henry_CommentFightSkill_04_03");	//Always remember - he who parries lives longer!
		HENRY_LABERCOUNT = 0;
	};
};


instance DIA_ADDON_HENRY_TEACH(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 6;
	condition = dia_addon_henry_teach_condition;
	information = dia_addon_henry_teach_info;
	permanent = TRUE;
	description = "Teach me!";
};


func int dia_addon_henry_teach_condition()
{
	if(HENRY_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_henry_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Teach_15_00");	//Teach me!
	HENRY_MERKE2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] > HENRY_MERKE2H)
	{
		b_henry_commentfightskill();
	}
	else if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_Addon_Henry_Teach_Back_04_00");	//You're getting really good.
	};
	Info_ClearChoices(dia_addon_henry_teach);
};

func void dia_addon_henry_teach_cb_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_cb_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};

func void dia_addon_henry_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_addon_henry_teach);
	Info_AddChoice(dia_addon_henry_teach,DIALOG_BACK,dia_addon_henry_teach_back);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_addon_henry_teach_2h_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_addon_henry_teach_2h_5);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_addon_henry_teach_cb_1);
	Info_AddChoice(dia_addon_henry_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_addon_henry_teach_cb_5);
};


instance DIA_ADDON_HENRY_PALISADE_TRAIN(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 11;
	condition = dia_addon_henry_palisade_train_condition;
	information = dia_addon_henry_palisade_train_info;
	permanent = FALSE;
	description = "Greg's your boss?";
};


func int dia_addon_henry_palisade_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_henry_palisade) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_henry_palisade_train_info()
{
	AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_00");	//Greg's your boss?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_01");	//He sure is. And it's CAPTAIN Greg to you. Have I made myself clear?
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_02");	//He's a great man. If you meet him, be careful not to get on the wrong side of him. You won't live long enough to regret it.
	if(pir_1300_addon_greg_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Henry_Palisade_Train_15_03");	//I've already met him.
		AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_04");	//Even better. So you know what I'm talking about.
	};
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_05");	//He's not in camp right now, though.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_06");	//Francis is in command for now.
	AI_Output(self,other,"DIA_Addon_Henry_Palisade_Train_04_07");	//He sits in front of Greg's hut all day and goggles at us working.
};


instance DIA_ADDON_HENRY_YOUROWNTRUPP(C_INFO)
{
	npc = pir_1354_addon_henry;
	nr = 1;
	condition = dia_addon_henry_yourowntrupp_condition;
	information = dia_addon_henry_yourowntrupp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_henry_yourowntrupp_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_henry_yourowntrupp_info()
{
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_04");	//The Captain gave you your own raiding troop, did he?
	AI_Output(self,other,"DIA_Addon_Henry_Add_04_05");	//Then see to it that your boys get plenty to do!
	AI_StopProcessInfos(self);
};

