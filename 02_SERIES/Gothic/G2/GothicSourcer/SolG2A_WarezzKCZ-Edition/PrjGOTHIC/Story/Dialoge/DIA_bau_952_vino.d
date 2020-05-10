
instance DIA_VINO_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_exit_condition;
	information = dia_vino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_vino_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_HALLO(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_hallo_condition;
	information = dia_vino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_hallo_info()
{
	AI_Output(other,self,"DIA_Vino_HALLO_15_00");	//And how goes the work?
	AI_Output(self,other,"DIA_Vino_HALLO_05_01");	//The same as always. A lot to do, not enough money, and with a bit of bad luck the orcs will come tomorrow and burn down our farm.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_HALLO_05_02");	//The king's paladins have occupied the whole city. But I can hardly believe they'll move their butts out here when the orcs attack us.
	};
};


instance DIA_VINO_SEEKWORK(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_seekwork_condition;
	information = dia_vino_seekwork_info;
	permanent = FALSE;
	description = "Can I help you? I'm looking for work.";
};


func int dia_vino_seekwork_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_worknow) || Npc_KnowsInfo(other,dia_lobart_kleidung)) && !Npc_IsDead(lobart) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_seekwork_info()
{
	AI_Output(other,self,"DIA_Vino_SeekWork_15_00");	//Can I help you? I'm looking for work.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_01");	//Do you know anything about working in the fields?
		AI_Output(other,self,"DIA_Vino_SeekWork_15_02");	//What is there to know?
		AI_Output(self,other,"DIA_Vino_SeekWork_05_03");	//Ah! In that case... I think we're fine here, thank you.
		if(!Npc_IsDead(lobart))
		{
			AI_Output(self,other,"DIA_Vino_SeekWork_05_04");	//If you want to work for Lobart as a day laborer, I can only warn you. He pays people like you really miserably!
			if(((Mob_HasItems("CHEST_LOBART",itar_bau_l) == TRUE) || (Npc_HasItems(lobart,itar_bau_l) > 0)) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (Npc_KnowsInfo(other,dia_lobart_kleidung) || Npc_KnowsInfo(other,dia_lobart_worknow)))
			{
				AI_Output(other,self,"DIA_Vino_SeekWork_15_05");	//He offered to sell me some clean clothes cheap if I help out on the farm.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_06");	//Hmm. I don't have anything for you to do, but you can bring me and the boys something to drink.
				AI_Output(self,other,"DIA_Vino_SeekWork_05_07");	//Fetch me a bottle of wine and I'll tell Lobart that you were a real help to us (laughs mockingly).
				MIS_VINO_WEIN = LOG_RUNNING;
				Log_CreateTopic(TOPIC_VINO,LOG_MISSION);
				Log_SetTopicStatus(TOPIC_VINO,LOG_RUNNING);
				b_logentry(TOPIC_VINO,"If I bring Vino a bottle of wine, he'll tell Lobart I helped him.");
			}
			else
			{
				AI_Output(self,other,"DIA_Vino_SeekWork_05_08");	//But you didn't get that from me, understood?
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_SeekWork_05_09");	//I don't think so. Someone of your standing wouldn't want to do the sort of lowly jobs I have to offer.
	};
};


instance DIA_VINO_BRINGWINE(C_INFO)
{
	npc = bau_952_vino;
	nr = 1;
	condition = dia_vino_bringwine_condition;
	information = dia_vino_bringwine_info;
	permanent = FALSE;
	description = "Here's your wine.";
};


func int dia_vino_bringwine_condition()
{
	if((MIS_VINO_WEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_bringwine_info()
{
	AI_Output(other,self,"DIA_Vino_BringWine_15_00");	//Here's your wine.
	b_giveinvitems(other,self,itfo_wine,1);
	AI_Output(self,other,"DIA_Vino_BringWine_05_01");	//I'd better not ask where you got it from, eh? (laughs) Who cares?
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Vino_BringWine_05_02");	//Thanks, anyway.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Vino_BringWine_05_03");	//Lobart will hear only the best about you.
		};
	};
	MIS_VINO_WEIN = LOG_SUCCESS;
	b_giveplayerxp(XP_VINOWEIN);
};


instance DIA_VINO_TOTHECITY(C_INFO)
{
	npc = bau_952_vino;
	nr = 3;
	condition = dia_vino_tothecity_condition;
	information = dia_vino_tothecity_info;
	permanent = FALSE;
	description = "I'm headed for town.";
};


func int dia_vino_tothecity_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_vino_tothecity_info()
{
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_00");	//I'm headed for town.
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_01");	//And?
	AI_Output(other,self,"DIA_Vino_ToTheCity_15_02");	//Is there anything interesting you can tell me about the city?
	AI_Output(self,other,"DIA_Vino_ToTheCity_05_03");	//Nope. But Maleth goes to the city from time to time - maybe he knows something - I mean, something that would interest you.
};


var int vino_gossip_orks;
var int vino_gossip_bugs;

instance DIA_VINO_PERM(C_INFO)
{
	npc = bau_952_vino;
	nr = 10;
	condition = dia_vino_perm_condition;
	information = dia_vino_perm_info;
	permanent = TRUE;
	description = "Is there any interesting news?";
};


func int dia_vino_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_vino_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_vino_perm_info()
{
	AI_Output(other,self,"DIA_Vino_PERM_15_00");	//Is there any interesting news?
	if(VINO_GOSSIP_ORKS == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_01");	//I could have sworn I saw an orc over there on the edge of the woods two days ago.
		AI_Output(self,other,"DIA_Vino_PERM_05_02");	//Since then I've kept at least one eye open at night.
		VINO_GOSSIP_ORKS = TRUE;
		KNOWS_ORK = TRUE;
	}
	else if((VINO_GOSSIP_BUGS == FALSE) && (MIS_ANDREHELPLOBART == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_03");	//These huge disgusting plague beetles are becoming a real nuisance. They're everywhere. They'll eat everything in sight, if you don't watch out.
		AI_Output(self,other,"DIA_Vino_PERM_05_04");	//A few days ago, I was lying in the grass, minding my own business, just about to doze off, and one of the damn things was chewing on my shoe!
		AI_Output(self,other,"DIA_Vino_PERM_05_05");	//You should have seen me run. Since then, I haven't been able to sleep in peace.
		VINO_GOSSIP_BUGS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM_05_06");	//Besides what I already told you? No.
	};
};


instance DIA_VINO_KAP3_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap3_exit_condition;
	information = dia_vino_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_vino_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_DMTAMSTART(C_INFO)
{
	npc = bau_952_vino;
	nr = 31;
	condition = dia_vino_dmtamstart_condition;
	information = dia_vino_dmtamstart_info;
	permanent = TRUE;
	description = "And how's it going for you?";
};


func int dia_vino_dmtamstart_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};


var int dia_vino_dmtamstart_onetime;

func void dia_vino_dmtamstart_info()
{
	AI_Output(other,self,"DIA_Vino_DMTAMSTART_15_00");	//And how's it going for you?
	if((FOUNDVINOSKELLEREI == TRUE) && (DIA_VINO_DMTAMSTART_ONETIME == FALSE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_01");	//Crappy. The militia found my hidden still.
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_02");	//I hope they never find out that it belongs to me.
		b_giveplayerxp(XP_AMBIENTKAP3);
		DIA_VINO_DMTAMSTART_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_DMTAMSTART_05_03");	//Those black-hooded bastards are everywhere. Someone ought to stuff their hoods down their throats.
	};
};


instance DIA_VINO_OBESESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 32;
	condition = dia_vino_obesessed_condition;
	information = dia_vino_obesessed_info;
	permanent = TRUE;
	description = "What's wrong?";
};


func int dia_vino_obesessed_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == FALSE) && (KAPITEL >= 3) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_vino_obesessed_info()
{
	if(Npc_IsDead(dmt_vino1) && Npc_IsDead(dmt_vino2) && Npc_IsDead(dmt_vino3) && Npc_IsDead(dmt_vino4))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Vino_Obesessed_15_00");	//What's wrong?
		AI_Output(self,other,"DIA_Vino_Obesessed_05_01");	//(bellows) Damn, beat it. Otherwise, they'll kill me.
		AI_StopProcessInfos(self);
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_VINO_HEILUNG(C_INFO)
{
	npc = bau_952_vino;
	nr = 55;
	condition = dia_vino_heilung_condition;
	information = dia_vino_heilung_info;
	permanent = TRUE;
	description = "You're not at all yourself.";
};


func int dia_vino_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_VINO == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && ((Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vino_heilung_onetime;

func void dia_vino_heilung_info()
{
	AI_Output(other,self,"DIA_Vino_Heilung_15_00");	//You're not at all yourself.
	AI_Output(self,other,"DIA_Vino_Heilung_05_01");	//My head... I can't stand it any more.
	if(DIA_VINO_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Vino_Heilung_15_02");	//You should go to the monastery. Pyrokar, the highest Fire Magician, might be able to help you.
		AI_Output(self,other,"DIA_Vino_Heilung_05_03");	//Do you think? Okay. I'll give it a try.
		b_npcclearobsessionbydmt(self);
		b_startotherroutine(vino,"Kloster");
		b_logentry(TOPIC_DEMENTOREN,"Vino's possessed. I sent him to the monastery to be healed. I hope he makes it there in one piece.");
		b_giveplayerxp(XP_VINOFREEFROMDMT);
		DIA_VINO_HEILUNG_ONETIME = TRUE;
	};
};


instance DIA_VINO_KAP4_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap4_exit_condition;
	information = dia_vino_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_vino_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PERM4OBSESSED(C_INFO)
{
	npc = bau_952_vino;
	nr = 41;
	condition = dia_vino_perm4obsessed_condition;
	information = dia_vino_perm4obsessed_info;
	permanent = TRUE;
	description = "How are you?";
};


func int dia_vino_perm4obsessed_condition()
{
	if((hero.guild == GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == TRUE) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_07") < 4000))
	{
		return TRUE;
	};
};


var int dia_vino_perm4obsessed_xp_onetime;

func void dia_vino_perm4obsessed_info()
{
	AI_Output(other,self,"DIA_Vino_PERM4OBSESSED_15_00");	//How are you?
	AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_01");	//Yeah, yeah, all right already. I think the boys here can help me. But I still feel really dizzy.
	if(DIA_VINO_PERM4OBSESSED_XP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vino_PERM4OBSESSED_05_02");	//But, I have to say, their wine is the best I've ever tasted.
		b_giveplayerxp(XP_AMBIENT);
		DIA_VINO_PERM4OBSESSED_XP_ONETIME = TRUE;
	};
};


instance DIA_VINO_PERM45UND6(C_INFO)
{
	npc = bau_952_vino;
	nr = 42;
	condition = dia_vino_perm45und6_condition;
	information = dia_vino_perm45und6_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_vino_perm45und6_condition()
{
	if((KAPITEL >= 4) && (hero.guild != GIL_KDF) && (NPCOBSESSEDBYDMT_VINO == FALSE))
	{
		return TRUE;
	};
};

func void dia_vino_perm45und6_info()
{
	AI_Output(other,self,"DIA_Vino_PERM45UND6_15_00");	//Any news?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_01");	//The number of orcs in the area has gone up drastically.
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_02");	//You paladins will finish them off, won't you?
	}
	else
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_03");	//Soon we'll have to give up the farm and join you mercenaries on Onar's farm, I'm afraid.
	};
	if((FOUNDVINOSKELLEREI == TRUE) && (hero.guild != GIL_MIL))
	{
		AI_Output(self,other,"DIA_Vino_PERM45UND6_05_04");	//Unfortunately, the militia found my still. I just hope they won't catch me.
	};
};


instance DIA_VINO_KAP5_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap5_exit_condition;
	information = dia_vino_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vino_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_KAP6_EXIT(C_INFO)
{
	npc = bau_952_vino;
	nr = 999;
	condition = dia_vino_kap6_exit_condition;
	information = dia_vino_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vino_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_vino_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_VINO_PICKPOCKET(C_INFO)
{
	npc = bau_952_vino;
	nr = 900;
	condition = dia_vino_pickpocket_condition;
	information = dia_vino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_vino_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_vino_pickpocket_info()
{
	Info_ClearChoices(dia_vino_pickpocket);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_BACK,dia_vino_pickpocket_back);
	Info_AddChoice(dia_vino_pickpocket,DIALOG_PICKPOCKET,dia_vino_pickpocket_doit);
};

func void dia_vino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vino_pickpocket);
};

func void dia_vino_pickpocket_back()
{
	Info_ClearChoices(dia_vino_pickpocket);
};

