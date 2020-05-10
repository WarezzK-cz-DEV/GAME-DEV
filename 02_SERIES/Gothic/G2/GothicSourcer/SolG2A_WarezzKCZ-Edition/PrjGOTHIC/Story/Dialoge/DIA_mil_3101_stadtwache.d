
instance DIA_MIL_3101_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 999;
	condition = dia_mil_3101_stadtwache_exit_condition;
	information = dia_mil_3101_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_3101_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_3101_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_3101_CHECKPOINT = "NW_CITY_ENTRANCE_NEW";

var int mil_3101_personal_absolutionlevel;

instance DIA_MIL_3101_STADTWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 1;
	condition = dia_mil_3101_stadtwache_firstwarn_condition;
	information = dia_mil_3101_stadtwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3101_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_3101_CHECKPOINT) <= 50)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_3101_PERSONAL_ABSOLUTIONLEVEL))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_310_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_firstwarn_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_00");	//HALT!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_01");	//(sighs) What is it?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_02");	//You know exactly what!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_03");	//You are wanted in the city for murder!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_04");	//We don't need any filthy thieves here!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_05");	//We don't need any troublemakers in our city!
		};
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_06");	//Why do you think we should let you in?
	}
	else if(((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE)) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_08");	//YOU aren't getting in here, my boy!
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_07");	//What is it?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_10");	//As ragged as you look, you're sure to cause nothing but trouble here!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_11");	//We've got enough rabble in the city. We have no use for people without money.
		Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
		b_logentry(TOPIC_CITY,"For the gate guards to let me into the city, I have to look like I've got money. Either that, or I must find another way.");
	}
	else if((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
	{
		if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_12");	//What do you want this time?
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_13");	//The farmer sent me.
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_14");	//So? Have you at least got a good reason for coming here this time?
		}
		else
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_15");	//Are you one of the hands on Lobart's farm? I've never seen you here!
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_16");	//I haven't been with Lobart for long.
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_17");	//What do you want in the city?
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_18");	//(calmly) What?
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_19");	//Pardon me, but those are our instructions.
			AI_Output(other,self,"DIA_Mil_310_Stadtwache_FirstWarn_15_20");	//Are you trying to stop me?
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_21");	//Of course not. All members of the church of Innos are naturally welcome.
		}
		else
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_FirstWarn_07_22");	//I only wanted to take a look at you. Looks like you've got money. You can go in.
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		MIL_310_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		AI_StopProcessInfos(self);
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_3101_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_3101_STADTWACHE_SECONDWARN(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 2;
	condition = dia_mil_3101_stadtwache_secondwarn_condition;
	information = dia_mil_3101_stadtwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3101_stadtwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_3101_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_SecondWarn_07_00");	//No funny business. One more step and I'll hack you to bits!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_3101_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3101_STADTWACHE_ATTACK(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 3;
	condition = dia_mil_3101_stadtwache_attack_condition;
	information = dia_mil_3101_stadtwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3101_stadtwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_3101_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Attack_07_00");	//You asked for it...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_3101_STADTWACHE_BRIBE(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 5;
	condition = dia_mil_3101_stadtwache_bribe_condition;
	information = dia_mil_3101_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Here's 100 gold pieces. Let me pass!";
};


func int dia_mil_3101_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Bribe_15_00");	//Here's 100 gold pieces. Let me pass!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_01");	//(greedy) 100 gold pieces sounds good. In you go then.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_02");	//And go straight to Lord Andre! Otherwise you'll be out another 100 gold pieces the next time!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
		MIL_310_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_3101_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Bribe_07_03");	//What?! Where?! I don't see 100 gold pieces. Beat it!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3101_STADTWACHE_PASSIERSCHEIN(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 4;
	condition = dia_mil_3101_stadtwache_passierschein_condition;
	information = dia_mil_3101_stadtwache_passierschein_info;
	permanent = FALSE;
	description = "I've got a pass!";
};


func int dia_mil_3101_stadtwache_passierschein_condition()
{
	if(Npc_HasItems(other,itwr_passierschein) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_passierschein_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_00");	//I've got a pass!
	if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_01");	//Really? And who did you kill for that, you cut-throat?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Passierschein_15_02");	//Now will you let me pass, or not?
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_03");	//Well, go on in before I change my mind!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Passierschein_07_04");	//Seems to be all right. Go on.
	};
	self.aivar[AIV_PASSGATE] = TRUE;
	stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	MIL_310_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3101_STADTWACHE_ZUMSCHMIED(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 3;
	condition = dia_mil_3101_stadtwache_zumschmied_condition;
	information = dia_mil_3101_stadtwache_zumschmied_info;
	permanent = FALSE;
	description = "I want to see the blacksmith. To have some tools repaired.";
};


func int dia_mil_3101_stadtwache_zumschmied_condition()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(((Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE)) && Npc_KnowsInfo(other,dia_maleth_tothecity) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_zumschmied_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_00");	//I want to see the blacksmith. To have some tools repaired.
	if(MIL_310_SCHEISSE_ERZAEHLT == TRUE)
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_01");	//(angry) Oh? And why didn't you say so right away?
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_ZumSchmied_15_02");	//I was just curious how you would react.
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_03");	//What?! Try something like that with me again and I'll show you how I react to that kind of thing, you stupid yokel!
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_04");	//Okay, fine, in you go then.
	};
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_ZumSchmied_07_05");	//And if you see Lobart, you can tell him he should feed his sheep well, we're coming back to him shortly! (dirty laugh)
	self.aivar[AIV_PASSGATE] = TRUE;
	stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
	MIL_310_SCHONMALREINGELASSEN = TRUE;
	b_checklog();
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MIL_3101_STADTWACHE_CONSTANTINO(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 2;
	condition = dia_addon_mil_3101_stadtwache_constantino_condition;
	information = dia_addon_mil_3101_stadtwache_constantino_info;
	permanent = TRUE;
	description = "I'm bringing some herbs for Constantino the alchemist.";
};


func int dia_addon_mil_3101_stadtwache_constantino_condition()
{
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO == LOG_RUNNING) && (MIL_310_SCHONMALREINGELASSEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_mil_3101_stadtwache_constantino_info()
{
	AI_Output(other,self,"DIA_Addon_Mil_310_Stadtwache_Constantino_15_00");	//I'm bringing some herbs for Constantino the alchemist.
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) || (Npc_HasItems(other,itpl_mana_herb_02) > 0) || (Npc_HasItems(other,itpl_mana_herb_03) > 0) || (Npc_HasItems(other,itpl_health_herb_01) > 0) || (Npc_HasItems(other,itpl_health_herb_02) > 0) || (Npc_HasItems(other,itpl_health_herb_03) > 0) || (Npc_HasItems(other,itpl_dex_herb_01) > 0) || (Npc_HasItems(other,itpl_strength_herb_01) > 0) || (Npc_HasItems(other,itpl_speed_herb_01) > 0) || (Npc_HasItems(other,itpl_temp_herb) > 0) || (Npc_HasItems(other,itpl_perm_herb) > 0) || (Npc_HasItems(other,itpl_beet) > 0))
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_01");	//(slyly) Really? Then you won't mind showing me what you've brought.
		if((Npc_HasItems(other,itpl_mana_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_mana_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_02) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_health_herb_03) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_dex_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_strength_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_speed_herb_01) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_temp_herb) >= MINIMUMPASSAGEPLANTS) || (Npc_HasItems(other,itpl_perm_herb) >= MINIMUMPASSAGEPLANTS))
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_02");	//(approving) Mmh. Looks good. All right. In you go. But don't cause any trouble, understood?
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_333.aivar[AIV_PASSGATE] = TRUE;
			MIL_310_SCHONMALREINGELASSEN = TRUE;
			MIS_ADDON_LESTER_PICKFORCONSTANTINO = LOG_SUCCESS;
			b_checklog();
			b_giveplayerxp(XP_ADDON_PICKFORCONSTANTINO);
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_03");	//What? What is this supposed to be?
			if(Npc_HasItems(other,itpl_beet) >= MINIMUMPASSAGEPLANTS)
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_04");	//What's an alchemist to do with a bunch of clunky turnips? Are you trying to be cute? Get lost!
			}
			else
			{
				AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_05");	//I don't know much about alchemy, but who is going to use this trussed-up bundle of mixed veggies for anything? Nice try.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Mil_310_Stadtwache_Constantino_07_06");	//What herbs? You don't have any herbs. Beat it!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3101_STADTWACHE_MILIZWERDEN(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 2;
	condition = dia_mil_3101_stadtwache_milizwerden_condition;
	information = dia_mil_3101_stadtwache_milizwerden_info;
	permanent = FALSE;
	description = "I've come to join the militia!";
};


func int dia_mil_3101_stadtwache_milizwerden_condition()
{
	if(MIL_310_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_milizwerden_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_MilizWerden_15_00");	//I've come to join the militia!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_MilizWerden_07_01");	//That's a good one! Try that at the other gate - maybe THEY'LL buy that from you.
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
};


instance DIA_MIL_3101_STADTWACHE_PALADINE(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 1;
	condition = dia_mil_3101_stadtwache_paladine_condition;
	information = dia_mil_3101_stadtwache_paladine_info;
	permanent = FALSE;
	description = "I need to see the leader of the paladins! I've got an important message for him!";
};


func int dia_mil_3101_stadtwache_paladine_condition()
{
	if(MIL_310_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_paladine_info()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_15_00");	//I need to see the leader of the paladins! I've got an important message for him!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_07_01");	//Oh? And what important message might that be?
	MIL_310_SCHEISSE_ERZAEHLT = TRUE;
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"The city will soon be under attack!",dia_mil_3101_stadtwache_paladine_attacksoon);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"The hosts of evil are camped in the valley of Khorinis!",dia_mil_3101_stadtwache_paladine_evilarmy);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"I have come to get the Eye of Innos!",dia_mil_3101_stadtwache_paladine_eyeinnos);
};

func void dia_mil_3101_stadtwache_paladine_eyeinnos()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_00");	//I have come to get the Eye of Innos!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_01");	//What? Never heard of it - what's that supposed to be?
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_02");	//It's an important artifact.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_03");	//You don't look much like an important messenger. Do you have some kind of identification?
	if(!Npc_HasItems(other,itwr_passierschein) > 0)
	{
		AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_15_04");	//No, I don't!
		AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EyeInnos_07_05");	//Then don't waste my time!
	};
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
};

func void dia_mil_3101_stadtwache_paladine_evilarmy()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_15_00");	//The hosts of evil are camped in the valley of Khorinis!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_EvilArmy_07_01");	//In the Valley of Mines? You come from there? Have you seen the army?
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"No - but I've been sent by someone who saw them.",dia_mil_3101_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"No. But I know that it's led by dragons!",dia_mil_3101_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"Yes. I was in the valley of Khorinis. I saw some gigantic dragons!",dia_mil_3101_stadtwache_paladine_yesdragons);
};

func void dia_mil_3101_stadtwache_paladine_attacksoon()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_15_00");	//The city will soon be under attack!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AttackSoon_07_01");	//What? By whom? The orcs? Have you seen our army?
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"No - but I've been sent by someone who saw them.",dia_mil_3101_stadtwache_paladine_nosomeone);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"No. But I know that it's led by dragons!",dia_mil_3101_stadtwache_paladine_nodragons);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"Yes. I was in the valley of Khorinis. I saw some gigantic dragons!",dia_mil_3101_stadtwache_paladine_yesdragons);
};

func void dia_mil_3101_stadtwache_paladine_nodragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_15_00");	//No. But I know that it's led by dragons!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_01");	//Sure! And my grandmother advises the orc generals.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_02");	//You don't think we'll let you carry an old wives' tale like that to Lord Hagen!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoDragons_07_03");	//Scram!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_3101_stadtwache_paladine_nosomeone()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_15_00");	//No - but I've been sent by someone who saw them.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_NoSomeone_07_01");	//(distrustful) WHO sent you?
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"I don't have permission to tell you that.",dia_mil_3101_stadtwache_paladine_canttellyou);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"A paladin.",dia_mil_3101_stadtwache_paladine_apaladin);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"A magician.",dia_mil_3101_stadtwache_paladine_amage);
};

func void dia_mil_3101_stadtwache_paladine_yesdragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_15_00");	//Yes. I was in the valley of Khorinis. I saw some gigantic dragons!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_01");	//You liar! The pass to the valley is held on both sides. No one gets through!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_YesDragons_07_02");	//Get out of here!
	AI_StopProcessInfos(self);
};

func void dia_mil_3101_stadtwache_paladine_amage()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_00");	//A magician.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_01");	//You have news from the magicians? Then you certainly have a seal as proof!
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_02");	//No.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_03");	//What? The magicians ALWAYS give their messengers a seal.
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_AMage_15_04");	//Not this magician.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_AMage_07_05");	//I don't believe you. If you're really a messenger, then spit out your news or clear off!
	Info_ClearChoices(dia_mil_310_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"I can only give this message to the paladins!",dia_mil_3101_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"The army of evil is led by dragons!",dia_mil_3101_stadtwache_paladine_depechedragons);
};

func void dia_mil_3101_stadtwache_paladine_apaladin()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_APaladin_15_00");	//A paladin.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_01");	//Hm, that could be - the paladins hold the pass to the Valley of Mines.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_APaladin_07_02");	//Give me your message and I'll report you.
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"I can only give this message to the paladins!",dia_mil_3101_stadtwache_paladine_onlypaladins);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"The army of evil is led by dragons!",dia_mil_3101_stadtwache_paladine_depechedragons);
};

func void dia_mil_3101_stadtwache_paladine_canttellyou()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_15_00");	//I don't have permission to tell you that.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_01");	//Don't act like that with me, boy! I'm a member of the city guard.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_CantTellYou_07_02");	//You can tell me EVERYTHING. So - who sent you?
};

func void dia_mil_3101_stadtwache_paladine_depechedragons()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_15_00");	//The army of evil is led by dragons!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_01");	//What? That can't be true. And I came that close to letting you in.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_02");	//If you served up THAT story to Lord Hagen, he'd have handed me my head.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_DepecheDragons_07_03");	//Scram!
	PLAYER_KNOWSLORDHAGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_mil_3101_stadtwache_paladine_onlypaladins()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_15_00");	//I can only give this message to the paladins!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_01");	//It doesn't work like that, boy!
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_OnlyPaladins_07_02");	//Like hell will I let you see Lord Hagen if I can't be sure that you won't waste his valuable time.
	PLAYER_KNOWSLORDHAGEN = TRUE;
	Info_ClearChoices(dia_mil_3101_stadtwache_paladine);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"No. The message is for the paladins ONLY.",dia_mil_3101_stadtwache_paladine_only2);
	Info_AddChoice(dia_mil_3101_stadtwache_paladine,"The army of evil is led by dragons!",dia_mil_3101_stadtwache_paladine_depechedragons);
};

func void dia_mil_3101_stadtwache_paladine_only2()
{
	AI_Output(other,self,"DIA_Mil_310_Stadtwache_Paladine_Only2_15_00");	//No. The message is for the paladins ONLY.
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_Paladine_Only2_07_01");	//Then your journey ends here, stranger.
	AI_StopProcessInfos(self);
};


instance DIA_MIL_3101_STADTWACHE_PERM(C_INFO)
{
	npc = mil_3101_stadtwache;
	nr = 5;
	condition = dia_mil_3101_stadtwache_perm_condition;
	information = dia_mil_3101_stadtwache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_3101_stadtwache_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_3101_stadtwache_perm_info()
{
	AI_Output(self,other,"DIA_Mil_310_Stadtwache_PERM_07_00");	//Move along!
	AI_StopProcessInfos(self);
};

