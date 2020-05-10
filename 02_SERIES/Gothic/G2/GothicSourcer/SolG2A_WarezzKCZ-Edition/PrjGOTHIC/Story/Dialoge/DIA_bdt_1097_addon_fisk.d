
instance DIA_ADDON_FISK_EXIT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 999;
	condition = dia_addon_fisk_exit_condition;
	information = dia_addon_fisk_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fisk_exit_condition()
{
	return TRUE;
};

func void dia_addon_fisk_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FISK_PICKPOCKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 900;
	condition = dia_addon_fisk_pickpocket_condition;
	information = dia_addon_fisk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_addon_fisk_pickpocket_condition()
{
	return c_beklauen(118,300);
};

func void dia_addon_fisk_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_BACK,dia_addon_fisk_pickpocket_back);
	Info_AddChoice(dia_addon_fisk_pickpocket,DIALOG_PICKPOCKET,dia_addon_fisk_pickpocket_doit);
};

func void dia_addon_fisk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};

func void dia_addon_fisk_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fisk_pickpocket);
};


instance DIA_ADDON_FISK_HI(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 1;
	condition = dia_addon_fisk_hi_condition;
	information = dia_addon_fisk_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_fisk_hi_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_00");	//Hey, if you're looking for a decent trader here in the camp, then you just found him.
	AI_Output(self,other,"DIA_Addon_Fisk_Hi_12_01");	//My hut is right behind Esteban. So if you need anything, come on by.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Fisk deals in all sorts of wares.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_FISK_TRADE(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 888;
	condition = dia_addon_fisk_trade_condition;
	information = dia_addon_fisk_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V2;
};


func int dia_addon_fisk_trade_condition()
{
	if(Npc_GetDistToWP(self,"BL_INN_UP_06") > 500)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_trade_info()
{
	b_say(other,self,"$TRADE_2");
	b_givetradeinv(self);
	if(Npc_HasItems(self,itrw_bolt) < 50)
	{
		CreateInvItems(self,itrw_bolt,50 - Npc_HasItems(self,itrw_bolt));
	};
	if(Npc_HasItems(self,itrw_arrow) < 50)
	{
		CreateInvItems(self,itrw_arrow,50 - Npc_HasItems(self,itrw_arrow));
	};
};


instance DIA_ADDON_FISK_ATTENTAT(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_attentat_condition;
	information = dia_addon_fisk_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fisk_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_fisk_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_00");	//Listen, I don't want anything to do with that business, got it!
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_01");	//(innocently) I have my own worries, I'm a victim myself.
	AI_Output(other,self,"DIA_Addon_Fisk_Attentat_15_02");	//In what way?
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_03");	//I paid a lot of gold for my last delivery.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_04");	//But it never came! Some swine made off with it.
	AI_Output(self,other,"DIA_Addon_Fisk_Attentat_12_05");	//(outraged) I've been robbed - probably by some of our own people!
};


instance DIA_ADDON_FISK_LIEFERUNG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 3;
	condition = dia_addon_fisk_lieferung_condition;
	information = dia_addon_fisk_lieferung_info;
	permanent = FALSE;
	description = "What sort of delivery?";
};


func int dia_addon_fisk_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_lieferung_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Lieferung_15_00");	//What sort of delivery?
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_01");	//A packet of lock picks. Someone was supposed to get them from the pirates for me.
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_02");	//But a guy named Juan snatched it away from me. (angry) Including the gold that I paid for it!
	AI_Output(self,other,"DIA_Addon_Fisk_Lieferung_12_03");	//The bastard is hiding somewhere in the swamp.
	MIS_LENNAR_LOCKPICK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_FISK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FISK,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"A guy named Juan was in on the deal with the bandits. They say he's hiding somewhere in the swamp.");
	b_logentry(TOPIC_ADDON_FISK,"A fellow named Juan stole the delivery (a package of lock picks) from Fisk. He is hiding somewhere in the swamp.");
};

func void b_addon_fisk_aboutjuan()
{
	if(Npc_IsDead(juan))
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_00");	//He's dead.
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_01");	//Good, then he can't cause me any more trouble!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_02");	//He's still alive...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_03");	//You let the swine live?
		AI_Output(other,self,"DIA_Addon_Fisk_AboutJuan_15_04");	//He wasn't alone...
		AI_Output(self,other,"DIA_Addon_Fisk_AboutJuan_12_05");	//Never mind - I can deal with those scumbags anyway...
	};
};

func void b_addon_fisk_belohnung()
{
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_00");	//As far as you are concerned...
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_01");	//I have a pretty good relationship with Huno.
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_02");	//I'll see to it that you get your armor cheap from now on.
	HUNO_ARMORCHEAP = TRUE;
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_03");	//And here, I once got this stone from Corristo.
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_04");	//It's the only thing that survived my flight from the Barrier. I think you'll have more use for it than I do.
		b_giveinvitems(self,other,itmi_runeblank,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_05");	//Also, I'll give you one of my weapons.
		if(other.hitchance[NPC_TALENT_2H] > other.hitchance[NPC_TALENT_1H])
		{
			b_giveinvitems(self,other,itmw_streitaxt1,1);
		}
		else
		{
			b_giveinvitems(self,other,itmw_bartaxt,1);
		};
	};
	AI_Output(self,other,"DIA_Addon_Fisk_Belohnung_12_06");	//(mischieviously) One hand washes the other - that hasn't changed since back then.
};


instance DIA_ADDON_FISK_GIVEPAKET(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 4;
	condition = dia_addon_fisk_givepaket_condition;
	information = dia_addon_fisk_givepaket_info;
	permanent = FALSE;
	description = "I have your package.";
};


func int dia_addon_fisk_givepaket_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_lennar_paket) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepaket_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePaket_15_00");	//I have your package.
	b_giveinvitems(other,self,itmi_addon_lennar_paket,1);
	MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LENNARPAKET);
	AI_Output(self,other,"DIA_Addon_Fisk_GivePaket_12_01");	//(pleased) Indeed! (suspiciously) What about Juan?
	b_addon_fisk_aboutjuan();
	b_addon_fisk_belohnung();
};


instance DIA_ADDON_FISK_PAKETOPEN(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 5;
	condition = dia_addon_fisk_paketopen_condition;
	information = dia_addon_fisk_paketopen_info;
	permanent = FALSE;
	description = "I opened your package!";
};


func int dia_addon_fisk_paketopen_condition()
{
	if((MIS_LENNAR_LOCKPICK == LOG_RUNNING) && (LENNARPAKET_OPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_paketopen_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_PaketOpen_15_00");	//I opened your package!
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_01");	//(laughs) Of course! You just couldn't wait, could you?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_02");	//Do you at least still have the lock picks?
	AI_Output(self,other,"DIA_Addon_Fisk_PaketOpen_12_03");	//And even more importantly, what about Juan?
	b_addon_fisk_aboutjuan();
};


instance DIA_ADDON_FISK_GIVEPICKS(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 6;
	condition = dia_addon_fisk_givepicks_condition;
	information = dia_addon_fisk_givepicks_info;
	permanent = TRUE;
	description = "Here's a dozen lock picks...";
};


func int dia_addon_fisk_givepicks_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_paketopen) && (MIS_LENNAR_LOCKPICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_givepicks_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_GivePicks_15_00");	//Here's a dozen lock picks...
	if(b_giveinvitems(other,self,itke_lockpick,12))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_01");	//Very good. Some people are already waiting for new merchandise.
		b_addon_fisk_belohnung();
		MIS_LENNAR_LOCKPICK = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_LENNARPAKET);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_GivePicks_12_02");	//That isn't a dozen! (slyly) You're not trying to cheat me, are you?
	};
};


instance DIA_ADDON_FISK_INSPEKTOR(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 7;
	condition = dia_addon_fisk_inspektor_condition;
	information = dia_addon_fisk_inspektor_info;
	permanent = FALSE;
	description = "Juan worked for Esteban!";
};


func int dia_addon_fisk_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fisk_lieferung) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_00");	//Juan worked for Esteban!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_01");	//(amazed) What?
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_15_02");	//Don't play games with me! You knew about it!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_03");	//(calmly) Fine. You're right. But I hope you also realize why I didn't tell you about it.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_04");	//Everyone in the camp knows you work for Esteban.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_12_05");	//I don't have any desire to get dragged into this business just because you're hot for a red stone.
	Info_ClearChoices(dia_addon_fisk_inspektor);
	Info_AddChoice(dia_addon_fisk_inspektor,"I'm not really working for Esteban...",dia_addon_fisk_inspektor_antiesteban);
	Info_AddChoice(dia_addon_fisk_inspektor,"I don't believe you!",dia_addon_fisk_inspektor_dontbelieve);
	Info_AddChoice(dia_addon_fisk_inspektor,"I see!",dia_addon_fisk_inspektor_isee);
};

func void dia_addon_fisk_inspektor_isee()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_ISee_15_00");	//I see!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_ISee_12_01");	//Good! Then leave it be. We don't want to be overheard!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_dontbelieve()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_DontBelieve_15_00");	//I don't believe you!
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_DontBelieve_12_01");	//Believe what you want! But I'm warning you, if you're planning on telling Esteban some fairy tale about me, you're next!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};

func void dia_addon_fisk_inspektor_antiesteban()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Inspektor_AntiEsteban_15_00");	//I'm not really working for Esteban...
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_01");	//So? You want to pull the wool over the old swine's eyes?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_02");	//Then I'll give you some good advice, keep it to yourself.
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_03");	//When it comes to Esteban, trust NO ONE - not even me, got it?
	AI_Output(self,other,"DIA_Addon_Fisk_Inspektor_AntiEsteban_12_04");	//Now enough about that - we don't want to be overheard!
	Info_ClearChoices(dia_addon_fisk_inspektor);
};


instance DIA_ADDON_FISK_MEETING(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_meeting_condition;
	information = dia_addon_fisk_meeting_info;
	permanent = FALSE;
	description = "So YOU were behind the attack.";
};


func int dia_addon_fisk_meeting_condition()
{
	if((Npc_GetDistToWP(self,"BL_INN_UP_06") <= 500) && Npc_IsInState(self,zs_talk) && (MIS_JUDAS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_meeting_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_15_00");	//So YOU were behind the attack.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_01");	//Yes. Esteban is in the way of my business.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_02");	//He won't let any of the bandits who work for me into the mine. He's making sure that EVERYONE works for him - and only for him.
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_12_03");	//That way, he can pocket a percentage of every deal and control the whole camp.
	Info_ClearChoices(dia_addon_fisk_meeting);
	Info_AddChoice(dia_addon_fisk_meeting,"What are you planning?",dia_addon_fisk_meeting_now);
	Info_AddChoice(dia_addon_fisk_meeting,"Do you want to take his place?",dia_addon_fisk_meeting_you);
	if(!Npc_IsDead(esteban))
	{
		Info_AddChoice(dia_addon_fisk_meeting,"I could sell you to Esteban...",dia_addon_fisk_meeting_sell);
	};
};

func void dia_addon_fisk_meeting_you()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_You_15_00");	//Do you want to take his place?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_You_12_01");	//No, I'm a trader - I just want to go about my business in peace.
};

func void dia_addon_fisk_meeting_sell()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_sell_15_00");	//I could sell you to Esteban...
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_01");	//And then? What do you think will happen then? Do you think he'll give you what you want?
	AI_Output(self,other,"DIA_Addon_Fisk_Meeting_sell_12_02");	//Forget it - I have a better plan.
};

func void dia_addon_fisk_meeting_now()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_00");	//What are you planning?
	if(!Npc_IsDead(esteban))
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_01");	//We'll get Esteban out of the way. That means YOU will kill him and take his place.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_02");	//As long as his bodyguards are with him, I don't have a chance.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_03");	//Then we'll have to get them to leave - by telling the truth.
		AI_Output(other,self,"DIA_Addon_Fisk_Meeting_now_15_04");	//What truth?
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_05");	//You have done your job. You know that I was behind the attack.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_06");	//Tell Esteban and he'll send his boys to kill me. I'll expect them here.
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_07");	//When they're gone, you can deal with the bastard and I'll take care of the guards.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_08");	//Esteban is dead. I can devote myself to my business again...
		AI_Output(self,other,"DIA_Addon_Fisk_Meeting_now_12_09");	//Here, this is for you...
		b_giveinvitems(self,other,itmi_gold,500);
	};
	Info_ClearChoices(dia_addon_fisk_meeting);
	MIS_JUDAS = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"AMBUSH");
	b_logentry(TOPIC_ADDON_ESTEBAN,"Fisk contracted the attack on Esteban.");
};


instance DIA_ADDON_FISK_SIEG(C_INFO)
{
	npc = bdt_1097_addon_fisk;
	nr = 2;
	condition = dia_addon_fisk_sieg_condition;
	information = dia_addon_fisk_sieg_info;
	permanent = FALSE;
	description = "Esteban is finished.";
};


func int dia_addon_fisk_sieg_condition()
{
	if((MIS_JUDAS == LOG_SUCCESS) && Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_fisk_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Fisk_Sieg_15_00");	//Esteban is finished.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_01");	//I've waited for this for a long time.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_02");	//I think you've got things to do now, and I need to go back to my business.
	AI_Output(self,other,"DIA_Addon_Fisk_Sieg_12_03");	//So, if you need anything else, you know where to find me.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};

