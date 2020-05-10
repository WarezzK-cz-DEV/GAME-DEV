
var int activebonus1;
var int activebonus2;
var int wite_winf;
var int asss_winf;

func void evt_upddef_addon_func()
{
	if((PASSIVE_HP == TRUE) && (hero.attribute[ATR_HITPOINTS] >= 1) && !c_bodystatecontains(hero,BS_DEAD))
	{
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,1);
	};
	if(PASSIVE_MP == TRUE)
	{
		Npc_ChangeAttribute(hero,ATR_MANA,1);
	};
	if((PASSIVE_ENCHHP >= 1) && (hero.attribute[ATR_HITPOINTS] >= 1) && !c_bodystatecontains(hero,BS_DEAD))
	{
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,1);
	};
	if((PASSIVE_ENCHHP >= 2) && (hero.attribute[ATR_HITPOINTS] >= 1) && !c_bodystatecontains(hero,BS_DEAD))
	{
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,1);
	};
	if(PASSIVE_ENCHMP >= 1)
	{
		Npc_ChangeAttribute(hero,ATR_MANA,1);
	};
	if(PASSIVE_ENCHMP >= 2)
	{
		Npc_ChangeAttribute(hero,ATR_MANA,1);
	};
	if((PASSIVE_ACROBATIC == TRUE) && (PASSIVE_ACROBATIC_ON == FALSE))
	{
		Mdl_ApplyOverlayMds(hero,"Humans_Acrobatic.mds");
		Mdl_ApplyOverlayMds(hero,"HUMANS_FLEE.MDS");
		PASSIVE_ACROBATIC_ON = TRUE;
	};
	if((CONSTANTINO_HEAL_TIME > 0) && (hero.attribute[ATR_HITPOINTS] >= 1) && !c_bodystatecontains(hero,BS_DEAD))
	{
		Npc_ChangeAttribute(hero,ATR_HITPOINTS,5);
		CONSTANTINO_HEAL_TIME -= 1;
	};
	if(CONSTANTINO_HEAL_TIME < 0)
	{
		CONSTANTINO_HEAL_TIME = 0;
	};
	if((CONSTANTINO_MANA_TIME > 0) && (hero.attribute[ATR_HITPOINTS] >= 1) && !c_bodystatecontains(hero,BS_DEAD))
	{
		Npc_ChangeAttribute(hero,ATR_MANA,5);
		CONSTANTINO_MANA_TIME -= 1;
	};
	if(CONSTANTINO_MANA_TIME < 0)
	{
		CONSTANTINO_MANA_TIME = 0;
	};
	if((hero.hitchance[NPC_TALENT_1H] >= 60) || (hero.hitchance[NPC_TALENT_2H] >= 60))
	{
		ORBLIG = 0;
	}
	else if((hero.hitchance[NPC_TALENT_1H] >= 50) || (hero.hitchance[NPC_TALENT_2H] >= 50))
	{
		ORBLIG = 10 + Hlp_Random(10);
	}
	else if((hero.hitchance[NPC_TALENT_1H] >= 40) || (hero.hitchance[NPC_TALENT_2H] >= 40))
	{
		ORBLIG = 20 + Hlp_Random(20);
	}
	else if((hero.hitchance[NPC_TALENT_1H] >= 30) || (hero.hitchance[NPC_TALENT_2H] >= 30))
	{
		ORBLIG = 30 + Hlp_Random(30);
	}
	else if((hero.hitchance[NPC_TALENT_1H] >= 20) || (hero.hitchance[NPC_TALENT_2H] >= 20))
	{
		ORBLIG = 40 + Hlp_Random(40);
	}
	else if((hero.hitchance[NPC_TALENT_1H] >= 10) || (hero.hitchance[NPC_TALENT_2H] >= 10))
	{
		ORBLIG = 50 + Hlp_Random(50);
	}
	else if((hero.hitchance[NPC_TALENT_1H] >= 1) || (hero.hitchance[NPC_TALENT_2H] >= 1))
	{
		ORBLIG = 60 + Hlp_Random(60);
	};
	if((PCBLOCK == TRUE) && c_bodystatecontainsadd(hero,BS_PARADE))
	{
		if(ORBLIG >= 1)
		{
			Npc_ChangeAttribute(hero,ATR_HITPOINTS,-ORBLIG);
			PrintScreen(PRINT_BLOCK_CHANCE,-1,52,FONT_SCREENBRIGHTLARGE,1);
			AI_PlayAni(hero,"T_STUMBLEB");
		};
	};
	if((Npc_GetDistToWP(sarah,"TAVERN02") >= 450) && !c_bodystatecontains(sarah,BS_SIT))
	{
		Wld_SendUntrigger("EVT_PIANO_01_TRIGGERLIST");
	};
	if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
		if(Npc_IsInFightMode(firedragonisland,FMODE_FIST) && (Npc_GetDistToNpc(firedragonisland,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(firedragonisland);
		};
		if(Npc_IsInFightMode(undeaddragon,FMODE_FIST) && (Npc_GetDistToNpc(undeaddragon,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(undeaddragon);
		};
		if((firedragonisland.attribute[ATR_HITPOINTS] < firedragonisland.attribute[ATR_HITPOINTS_MAX]) && (firedragonisland.attribute[ATR_HITPOINTS] > (firedragonisland.attribute[ATR_HITPOINTS_MAX] / 10)) && !c_bodystatecontains(firedragonisland,BS_DEAD))
		{
			firedragonisland.attribute[ATR_HITPOINTS] += 20;
		};
		if((undeaddragon.attribute[ATR_HITPOINTS] < undeaddragon.attribute[ATR_HITPOINTS_MAX]) && (undeaddragon.attribute[ATR_HITPOINTS] > (undeaddragon.attribute[ATR_HITPOINTS_MAX] / 10)) && !c_bodystatecontains(undeaddragon,BS_DEAD))
		{
			undeaddragon.attribute[ATR_HITPOINTS] += 20;
		};
	};
	if(CURRENTLEVEL == OLDWORLD_ZEN)
	{
		if(Npc_IsInFightMode(firedragon,FMODE_FIST) && (Npc_GetDistToNpc(firedragon,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(firedragon);
		};
		if(Npc_IsInFightMode(icedragon,FMODE_FIST) && (Npc_GetDistToNpc(icedragon,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(icedragon);
		};
		if(Npc_IsInFightMode(rockdragon,FMODE_FIST) && (Npc_GetDistToNpc(rockdragon,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(rockdragon);
		};
		if(Npc_IsInFightMode(swampdragon,FMODE_FIST) && (Npc_GetDistToNpc(swampdragon,other) > FIGHT_DIST_DRAGON_MAGIC))
		{
			AI_RemoveWeapon(swampdragon);
		};
		if((firedragon.attribute[ATR_HITPOINTS] < firedragon.attribute[ATR_HITPOINTS_MAX]) && (firedragon.attribute[ATR_HITPOINTS] > (firedragon.attribute[ATR_HITPOINTS_MAX] / 10)) && !c_bodystatecontains(firedragon,BS_DEAD))
		{
			firedragon.attribute[ATR_HITPOINTS] += 20;
		};
		if((icedragon.attribute[ATR_HITPOINTS] < icedragon.attribute[ATR_HITPOINTS_MAX]) && (icedragon.attribute[ATR_HITPOINTS] > (icedragon.attribute[ATR_HITPOINTS_MAX] / 10)) && !c_bodystatecontains(icedragon,BS_DEAD))
		{
			icedragon.attribute[ATR_HITPOINTS] += 20;
		};
		if((rockdragon.attribute[ATR_HITPOINTS] < rockdragon.attribute[ATR_HITPOINTS_MAX]) && (rockdragon.attribute[ATR_HITPOINTS] > (rockdragon.attribute[ATR_HITPOINTS_MAX] / 10)) && !c_bodystatecontains(rockdragon,BS_DEAD))
		{
			rockdragon.attribute[ATR_HITPOINTS] += 20;
		};
		if((swampdragon.attribute[ATR_HITPOINTS] < swampdragon.attribute[ATR_HITPOINTS_MAX]) && (swampdragon.attribute[ATR_HITPOINTS] > (swampdragon.attribute[ATR_HITPOINTS_MAX] / 10)) && !c_bodystatecontains(swampdragon,BS_DEAD))
		{
			swampdragon.attribute[ATR_HITPOINTS] += 20;
		};
		if((Npc_GetDistToNpc(amort,hero) < 5000) && (AMORTBATTLE == FALSE))
		{
			amort.attribute[ATR_HITPOINTS] = amort.attribute[ATR_HITPOINTS_MAX];
			AMORTBATTLE_ONETIME = FALSE;
		};
	};
	if(DRG_SD == TRUE)
	{
		DRG_SD = FALSE;
	};
	if((CURRENTLEVEL == NEWWORLD_ZEN) && (trollblack.attribute[ATR_HITPOINTS] < trollblack.attribute[ATR_HITPOINTS_MAX]) && (trollblack.attribute[ATR_HITPOINTS] > (trollblack.attribute[ATR_HITPOINTS_MAX] / 15)) && !c_bodystatecontains(trollblack,BS_DEAD))
	{
		trollblack.attribute[ATR_HITPOINTS] += 10;
	};
	if(CURRENTLEVEL == ADDONWORLD_ZEN)
	{
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			if(((Npc_GetDistToWP(alligatorjack,"ADW_ENTRANCE_2_PIRATECAMP_13") < 3000) || (Npc_GetDistToWP(alligatorjack,"ADW_CANYON_PATH_TO_LIBRARY_19") < 3000) || (Npc_GetDistToWP(alligatorjack,"ADW_CANYON_PATH_TO_MINE2_13") < 3000) || (Npc_GetDistToWP(alligatorjack,"ADW_CANYON_PATH_TO_BANDITS_27") < 3000)) && !Npc_IsInState(alligatorjack,zs_attack))
			{
				if(c_bodystatecontains(alligatorjack,BS_RUN))
				{
					Npc_ClearAIQueue(alligatorjack);
				};
				AI_TurnToNPC(alligatorjack,hero);
				b_say(alligatorjack,alligatorjack,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");
				alligatorjack.aivar[AIV_PARTYMEMBER] = FALSE;
				b_startotherroutine(alligatorjack,"START");
			};
			if(((Npc_GetDistToWP(skip,"ADW_ENTRANCE_2_PIRATECAMP_13") < 3000) || (Npc_GetDistToWP(skip,"ADW_CANYON_PATH_TO_LIBRARY_19") < 3000) || (Npc_GetDistToWP(skip,"ADW_CANYON_PATH_TO_MINE2_13") < 3000) || (Npc_GetDistToWP(skip,"ADW_CANYON_PATH_TO_BANDITS_27") < 3000)) && !Npc_IsInState(skip,zs_attack) && (skip.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				if(c_bodystatecontains(skip,BS_RUN))
				{
					Npc_ClearAIQueue(skip);
				};
				AI_TurnToNPC(skip,hero);
				b_say(skip,skip,"DIA_Addon_Skip_TooFar_08_03");
				skip.aivar[AIV_PARTYMEMBER] = FALSE;
				b_startotherroutine(skip,"START");
			};
			if(((Npc_GetDistToWP(matt,"ADW_ENTRANCE_2_PIRATECAMP_13") < 3000) || (Npc_GetDistToWP(matt,"ADW_CANYON_PATH_TO_LIBRARY_19") < 3000) || (Npc_GetDistToWP(matt,"ADW_CANYON_PATH_TO_MINE2_13") < 3000) || (Npc_GetDistToWP(matt,"ADW_CANYON_PATH_TO_BANDITS_27") < 3000)) && !Npc_IsInState(matt,zs_attack) && (matt.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				if(c_bodystatecontains(matt,BS_RUN))
				{
					Npc_ClearAIQueue(matt);
				};
				AI_TurnToNPC(matt,hero);
				b_say(matt,matt,"DIA_Addon_Matt_TooFar_10_02");
				matt.aivar[AIV_PARTYMEMBER] = FALSE;
				b_startotherroutine(matt,"START");
			};
			if(((Npc_GetDistToWP(brandon,"ADW_ENTRANCE_2_PIRATECAMP_13") < 3000) || (Npc_GetDistToWP(brandon,"ADW_CANYON_PATH_TO_LIBRARY_19") < 3000) || (Npc_GetDistToWP(brandon,"ADW_CANYON_PATH_TO_MINE2_13") < 3000) || (Npc_GetDistToWP(brandon,"ADW_CANYON_PATH_TO_BANDITS_27") < 3000)) && !Npc_IsInState(brandon,zs_attack) && (brandon.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				if(c_bodystatecontains(brandon,BS_RUN))
				{
					Npc_ClearAIQueue(brandon);
				};
				AI_TurnToNPC(brandon,hero);
				b_say(brandon,brandon,"DIA_Addon_Brandon_TooFar_04_02");
				brandon.aivar[AIV_PARTYMEMBER] = FALSE;
				b_startotherroutine(brandon,"START");
			};
			if(((Npc_GetDistToWP(roastpirate,"ADW_ENTRANCE_2_PIRATECAMP_13") < 3000) || (Npc_GetDistToWP(roastpirate,"ADW_CANYON_PATH_TO_LIBRARY_19") < 3000) || (Npc_GetDistToWP(roastpirate,"ADW_CANYON_PATH_TO_MINE2_13") < 3000) || (Npc_GetDistToWP(roastpirate,"ADW_CANYON_PATH_TO_BANDITS_27") < 3000)) && !Npc_IsInState(roastpirate,zs_attack) && (roastpirate.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				if(c_bodystatecontains(roastpirate,BS_RUN))
				{
					Npc_ClearAIQueue(roastpirate);
				};
				AI_TurnToNPC(roastpirate,hero);
				b_say(roastpirate,roastpirate,"$RUNAWAY");
				roastpirate.aivar[AIV_PARTYMEMBER] = FALSE;
				b_startotherroutine(roastpirate,"START");
			};
			if(((Npc_GetDistToWP(benchpirate,"ADW_ENTRANCE_2_PIRATECAMP_13") < 3000) || (Npc_GetDistToWP(benchpirate,"ADW_CANYON_PATH_TO_LIBRARY_19") < 3000) || (Npc_GetDistToWP(benchpirate,"ADW_CANYON_PATH_TO_MINE2_13") < 3000) || (Npc_GetDistToWP(benchpirate,"ADW_CANYON_PATH_TO_BANDITS_27") < 3000)) && !Npc_IsInState(benchpirate,zs_attack) && (benchpirate.aivar[AIV_PARTYMEMBER] == TRUE))
			{
				if(c_bodystatecontains(benchpirate,BS_RUN))
				{
					Npc_ClearAIQueue(benchpirate);
				};
				AI_TurnToNPC(benchpirate,hero);
				b_say(benchpirate,benchpirate,"$RUNAWAY");
				benchpirate.aivar[AIV_PARTYMEMBER] = FALSE;
				b_startotherroutine(benchpirate,"START");
			};
		};
	};
	if((hero.flags == NPC_FLAG_IMMORTAL) && !c_bodystatecontains(hero,BS_PARADE))
	{
		hero.flags = 0;
		SNDLOCK = FALSE;
	};
	if(LOAD_CHECK > 0)
	{
		LOAD_CHECK -= 1;
	};
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	if(STAT_SWORDDEF < 0)
	{
		STAT_SWORDDEF = 0;
	};
	if(DEAD_TIME >= 14)
	{
		DEAD_TIME = 0;
		if(c_bodystatecontains(hero,BS_DEAD))
		{
			Snd_Play("MYSTERY_03");
		};
	};
	if(c_bodystatecontains(hero,BS_DEAD))
	{
		if(DEAD_CHECK == FALSE)
		{
			DEAD_CHECK = TRUE;
		};
		DEAD_TIME += 1;
		PrintScreen("You died.",-1,20,FONT_SCREENBRIGHTLARGE,2);
	};
	if(!c_bodystatecontains(hero,BS_DEAD) && (DEAD_CHECK == TRUE))
	{
		DEAD_TIME = 0;
		DEAD_CHECK = FALSE;
		Wld_StopEffect("PCDEAD_FX");
	};
	if((START_CHECK == TRUE) && (hero.level == 0))
	{
		if(hero.attribute[ATR_HITPOINTS_MAX] != 0)
		{
			AI_Wait(hero,2);
			Wld_PlayEffect("START_BLEND",hero,hero,0,0,0,FALSE);
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",hero,hero,0,0,0,FALSE);
			Snd_Play("AMBIENTTONE_01_HIGH");
			START_CHECK = FALSE;
			Wld_SendTrigger("XARSTAR");
		};
	};
	Wld_SendTrigger("UPD_DEF_ADDON");
};

func void evt_updhtf_addon_func()
{
	var int dominicbless;
	if(CURRENTLEVEL == NEWWORLD_ZEN)
	{
		if((Npc_HasEquippedArmor(sarah) == FALSE) && (Npc_GetDistToWP(sarah,"NW_NM_02_ADD_07") >= 350))
		{
			AI_EquipArmor(sarah,itar_w2_ves);
		};
		if((Npc_HasEquippedArmor(sonja) == FALSE) && (Npc_GetDistToWP(sonja,"NW_CITY_HABOUR_PUFF_SONJA") >= 350))
		{
			AI_EquipArmor(sonja,itar_baron_babe_addon);
		};
	};
	if(CURRENTLEVEL == ADDONWORLD_ZEN)
	{
		if((Npc_HasEquippedArmor(lucia) == FALSE) && (Npc_GetDistToWP(lucia,"BL_INN_UPSIDE_BATH_01") >= 350))
		{
			AI_EquipArmor(lucia,itar_lucia_addon);
		};
	};
	if(DOMINICCURSE == TRUE)
	{
		dominicbless = Hlp_Random(15);
		if((hero.guild == GIL_PAL) && (DOMINICFREE == TRUE))
		{
			if((hero.attribute[ATR_HITPOINTS] >= 1) && !c_bodystatecontains(hero,BS_DEAD))
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,dominicbless);
			};
		}
		else
		{
			Snd_Play("EVIL_SPELL_01");
			if(hero.attribute[ATR_HITPOINTS] > 0)
			{
				Npc_ChangeAttribute(hero,ATR_HITPOINTS,-dominicbless);
			};
		};
	};
	if(ADDON_PRING == TRUE)
	{
		if(Npc_HasItems(hero,itmi_portalring_addon) >= 1)
		{
			Npc_RemoveInvItems(hero,itmi_portalring_addon,1);
			ADDON_PRING = FALSE;
		};
	};
	if(ADDON_TMPLOPN == TRUE)
	{
		if(Npc_HasItems(hero,itmi_tempeltorkey) >= 1)
		{
			Npc_RemoveInvItems(hero,itmi_tempeltorkey,1);
			ADDON_TMPLOPN = FALSE;
		};
	};
	if(DRG_LF == TRUE)
	{
		DRG_LF = FALSE;
	};
	Wld_SendTrigger("UPD_HTF_ADDON");
};

