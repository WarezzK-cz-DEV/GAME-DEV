
func int b_teachplayertalentrunes(var C_NPC slf,var C_NPC oth,var int spell)
{
	var int kosten;
	var C_NPC scrolltrader;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
	b_logentry(TOPIC_TALENTRUNES,"To create a rune I need the scroll for the spell and certain ingredients for each rune. Using those ingredients and a blank runestone I can create the desired rune at a rune table.");
	if(Npc_IsDead(gorax) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(gorax);
	}
	else if(Npc_IsDead(isgaroth) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(isgaroth);
	}
	else if(Npc_IsDead(engor) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(engor);
	}
	else if(Npc_IsDead(orlan) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(orlan);
	}
	else if(Npc_IsDead(cronos_adw) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(cronos_adw);
	};
	if(spell == SPL_PALLIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
	};
	if(spell == SPL_PALLIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
	};
	if(spell == SPL_PALHOLYBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
	};
	if(spell == SPL_PALMEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
	};
	if(spell == SPL_PALREPELEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
	};
	if(spell == SPL_PALFULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] = TRUE;
	};
	if(spell == SPL_PALDESTROYEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] = TRUE;
	};
	if(spell == SPL_PALTELEPORTSECRET)
	{
		PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
	};
	if(spell == SPL_TELEPORTSEAPORT)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTSEAPORT] = TRUE;
	};
	if(spell == SPL_TELEPORTMONASTERY)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTMONASTERY] = TRUE;
	};
	if(spell == SPL_TELEPORTFARM)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTFARM] = TRUE;
	};
	if(spell == SPL_TELEPORTXARDAS)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTXARDAS] = TRUE;
	};
	if(spell == SPL_TELEPORTPASSNW)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTPASSNW] = TRUE;
	};
	if(spell == SPL_TELEPORTPASSOW)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTPASSOW] = TRUE;
	};
	if(spell == SPL_TELEPORTOC)
	{
		PLAYER_TALENT_RUNES[SPL_TELEPORTOC] = TRUE;
	};
	if(spell == SPL_LIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHT] = TRUE;
		CreateInvItems(scrolltrader,itsc_light,1);
		b_logentry(TOPIC_TALENTRUNES,"'Light' ingredients: 1 gold piece.");
	};
	if(spell == SPL_FIREBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_FIREBOLT] = TRUE;
		CreateInvItems(scrolltrader,itsc_firebolt,1);
		b_logentry(TOPIC_TALENTRUNES,"'Fire arrow' ingredients: 1 sulfur.");
	};
	if(spell == SPL_ICEBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_ICEBOLT] = TRUE;
		CreateInvItems(scrolltrader,itsc_icebolt,1);
		b_logentry(TOPIC_TALENTRUNES,"'Ice arrow' ingredients: 1 glacier quartz.");
	};
	if(spell == SPL_LIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_lightheal,1);
		b_logentry(TOPIC_TALENTRUNES,"'Heal light wounds' ingredients: 1 healing plant.");
	};
	if(spell == SPL_SUMMONGOBLINSKELETON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumgobskel,1);
		b_logentry(TOPIC_TALENTRUNES,"'Summon goblin skeleton' ingredients: 1 goblin's bone.");
	};
	if(spell == SPL_INSTANTFIREBALL)
	{
		PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] = TRUE;
		CreateInvItems(scrolltrader,itsc_instantfireball,1);
		b_logentry(TOPIC_TALENTRUNES,"'Fireball' ingredients: 1 pitch.");
	};
	if(spell == SPL_ZAP)
	{
		PLAYER_TALENT_RUNES[SPL_ZAP] = TRUE;
		CreateInvItems(scrolltrader,itsc_zap,1);
		b_logentry(TOPIC_TALENTRUNES,"'Small lightning' ingredients: 1 rock crystal.");
	};
	if(spell == SPL_SUMMONWOLF)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumwolf,1);
		b_logentry(TOPIC_TALENTRUNES,"'Summon wolf' ingredients: 1 wolf skin.");
	};
	if(spell == SPL_WINDFIST)
	{
		PLAYER_TALENT_RUNES[SPL_WINDFIST] = TRUE;
		CreateInvItems(scrolltrader,itsc_windfist,1);
		b_logentry(TOPIC_TALENTRUNES,"'Wind fist' ingredients: 1 coal.");
	};
	if(spell == SPL_SLEEP)
	{
		PLAYER_TALENT_RUNES[SPL_SLEEP] = TRUE;
		CreateInvItems(scrolltrader,itsc_sleep,1);
		b_logentry(TOPIC_TALENTRUNES,"'Sleep' ingredients: 1 swampweed.");
	};
	if(spell == SPL_MEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_mediumheal,1);
		b_logentry(TOPIC_TALENTRUNES,"'Heal medium wounds' ingredients: 1 healing herb.");
	};
	if(spell == SPL_LIGHTNINGFLASH)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] = TRUE;
		CreateInvItems(scrolltrader,itsc_lightningflash,1);
		b_logentry(TOPIC_TALENTRUNES,"'Lightning' ingredients: 1 rock crystal and 1 glacier quartz.");
	};
	if(spell == SPL_CHARGEFIREBALL)
	{
		PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] = TRUE;
		CreateInvItems(scrolltrader,itsc_chargefireball,1);
		b_logentry(TOPIC_TALENTRUNES,"'Large fireball' ingredients: 1 sulfur and 1 pitch.");
	};
	if(spell == SPL_SUMMONSKELETON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumskel,1);
		b_logentry(TOPIC_TALENTRUNES,"'Summon skeleton' ingredients: 1 skeleton's bone.");
	};
	if(spell == SPL_FEAR)
	{
		PLAYER_TALENT_RUNES[SPL_FEAR] = TRUE;
		CreateInvItems(scrolltrader,itsc_fear,1);
		b_logentry(TOPIC_TALENTRUNES,"'Fear' ingredients: 1 black pearl.");
	};
	if(spell == SPL_ICECUBE)
	{
		PLAYER_TALENT_RUNES[SPL_ICECUBE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icecube,1);
		b_logentry(TOPIC_TALENTRUNES,"'Ice block' ingredients: 1 glacier quartz and 1 aquamarine.");
	};
	if(spell == SPL_CHARGEZAP)
	{
		PLAYER_TALENT_RUNES[SPL_CHARGEZAP] = TRUE;
		CreateInvItems(scrolltrader,itsc_thunderball,1);
		b_logentry(TOPIC_TALENTRUNES,"'Ball lightning' ingredients: 1 sulfur and 1 rock crystal.");
	};
	if(spell == SPL_SUMMONGOLEM)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumgol,1);
		b_logentry(TOPIC_TALENTRUNES,"'Summon golem' ingredients: 1 heart of a stone golem.");
	};
	if(spell == SPL_DESTROYUNDEAD)
	{
		PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] = TRUE;
		CreateInvItems(scrolltrader,itsc_harmundead,1);
		b_logentry(TOPIC_TALENTRUNES,"'Destroy undead' ingredients: 1 holy water.");
	};
	if(spell == SPL_PYROKINESIS)
	{
		PLAYER_TALENT_RUNES[SPL_PYROKINESIS] = TRUE;
		CreateInvItems(scrolltrader,itsc_pyrokinesis,1);
		b_logentry(TOPIC_TALENTRUNES,"'Large fire storm' ingredients: 1 sulfur and 1 tongue of a fire lizard.");
	};
	if(spell == SPL_FIRESTORM)
	{
		PLAYER_TALENT_RUNES[SPL_FIRESTORM] = TRUE;
		CreateInvItems(scrolltrader,itsc_firestorm,1);
		b_logentry(TOPIC_TALENTRUNES,"'Small fire storm' ingredients: 1 sulfur and 1 pitch.");
	};
	if(spell == SPL_ICEWAVE)
	{
		PLAYER_TALENT_RUNES[SPL_ICEWAVE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icewave,1);
		b_logentry(TOPIC_TALENTRUNES,"'Ice wave' ingredients: 1 glacier quartz and 1 aquamarine.");
	};
	if(spell == SPL_SUMMONDEMON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumdemon,1);
		b_logentry(TOPIC_TALENTRUNES,"'Summon demon' ingredients: 1 heart of a demon.");
	};
	if(spell == SPL_FULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_FULLHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_fullheal,1);
		b_logentry(TOPIC_TALENTRUNES,"'Heal heavy wounds' ingredients: 1 healing root.");
	};
	if(spell == SPL_FIRERAIN)
	{
		PLAYER_TALENT_RUNES[SPL_FIRERAIN] = TRUE;
		CreateInvItems(scrolltrader,itsc_firerain,1);
		b_logentry(TOPIC_TALENTRUNES,"'Fire rain' ingredients: 1 pitch and 1 tongue of a fire lizard.");
	};
	if(spell == SPL_BREATHOFDEATH)
	{
		PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] = TRUE;
		CreateInvItems(scrolltrader,itsc_breathofdeath,1);
		b_logentry(TOPIC_TALENTRUNES,"'Breath of death' ingredients: 1 coal and 1 black pearl.");
	};
	if(spell == SPL_MASSDEATH)
	{
		PLAYER_TALENT_RUNES[SPL_MASSDEATH] = TRUE;
		CreateInvItems(scrolltrader,itsc_massdeath,1);
		b_logentry(TOPIC_TALENTRUNES,"'Wave of death' ingredients: 1 skeleton's bone and 1 black pearl.");
	};
	if(spell == SPL_ARMYOFDARKNESS)
	{
		PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] = TRUE;
		CreateInvItems(scrolltrader,itsc_armyofdarkness,1);
		b_logentry(TOPIC_TALENTRUNES,"'Army of darkness' ingredients: 1 skeleton's bone, 1 black pearl, 1 heart of a stone golem and 1 heart of a demon.");
	};
	if(spell == SPL_SHRINK)
	{
		PLAYER_TALENT_RUNES[SPL_SHRINK] = TRUE;
		CreateInvItems(scrolltrader,itsc_shrink,1);
		b_logentry(TOPIC_TALENTRUNES,"'Shrink monster' ingredients: 1 goblin's bone and 1 troll fang.");
	};
	if(spell == SPL_WHIRLWIND)
	{
		PLAYER_TALENT_RUNES[SPL_WHIRLWIND] = TRUE;
		CreateInvItems(scrolltrader,itsc_whirlwind,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_WHIRLWIND);
	};
	if(spell == SPL_WATERFIST)
	{
		PLAYER_TALENT_RUNES[SPL_WATERFIST] = TRUE;
		CreateInvItems(scrolltrader,itsc_waterfist,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_WATERFIST);
	};
	if(spell == SPL_ICELANCE)
	{
		PLAYER_TALENT_RUNES[SPL_ICELANCE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icelance,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_ICELANCE);
	};
	if(spell == SPL_GEYSER)
	{
		PLAYER_TALENT_RUNES[SPL_GEYSER] = TRUE;
		CreateInvItems(scrolltrader,itsc_geyser,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_GEYSER);
	};
	if(spell == SPL_THUNDERSTORM)
	{
		PLAYER_TALENT_RUNES[SPL_THUNDERSTORM] = TRUE;
		CreateInvItems(scrolltrader,itsc_thunderstorm,1);
		b_logentry(TOPIC_TALENTRUNES,LOG_TEXT_ADDON_TALENTRUNE_THUNDERSTORM);
	};
	PrintScreen(PRINT_LEARNRUNES,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

func int b_teachplayerpalrunes(var C_NPC slf,var C_NPC oth,var int spell)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_RUNES,spell);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(spell == SPL_PALLIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(slf,itru_pallight,1);
		b_giveinvitems(slf,oth,itru_pallight,1);
	};
	if(spell == SPL_PALLIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
		CreateInvItems(slf,itru_pallightheal,1);
		b_giveinvitems(slf,oth,itru_pallightheal,1);
	};
	if(spell == SPL_PALHOLYBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
		CreateInvItems(slf,itru_palholybolt,1);
		b_giveinvitems(slf,oth,itru_palholybolt,1);
	};
	if(spell == SPL_PALMEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
		CreateInvItems(slf,itru_palmediumheal,1);
		b_giveinvitems(slf,oth,itru_palmediumheal,1);
	};
	if(spell == SPL_PALREPELEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
		CreateInvItems(slf,itru_palrepelevil,1);
		b_giveinvitems(slf,oth,itru_palrepelevil,1);
	};
	if(spell == SPL_PALFULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] = TRUE;
		CreateInvItems(slf,itru_palfullheal,1);
		b_giveinvitems(slf,oth,itru_palfullheal,1);
	};
	if(spell == SPL_PALDESTROYEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] = TRUE;
		CreateInvItems(slf,itru_paldestroyevil,1);
		b_giveinvitems(slf,oth,itru_paldestroyevil,1);
	};
	if(spell == SPL_PALTELEPORTSECRET)
	{
		PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
		CreateInvItems(slf,itru_palteleportsecret,1);
		b_giveinvitems(slf,oth,itru_palteleportsecret,1);
	};
	return TRUE;
};

