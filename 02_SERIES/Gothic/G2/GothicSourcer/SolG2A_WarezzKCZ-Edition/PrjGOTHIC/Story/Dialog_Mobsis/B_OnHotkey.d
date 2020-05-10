
func int b_getbestplayermap()
{
	if(CURRENTLEVEL == NEWWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_newworld) >= 1)
		{
			return itwr_map_newworld;
		}
		else if(Npc_HasItems(hero,itwr_map_shrine_mis) >= 1)
		{
			return itwr_map_shrine_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_caves_mis) >= 1)
		{
			return itwr_map_caves_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_ornaments_addon) >= 1)
		{
			return itwr_map_newworld_ornaments_addon;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_dexter) >= 1)
		{
			return itwr_map_newworld_dexter;
		}
		else if(Npc_HasItems(hero,itwr_shatteredgolem_mis) >= 1)
		{
			return itwr_shatteredgolem_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_orcelite_mis) >= 1)
		{
			return itwr_map_orcelite_mis;
		}
		else if(Npc_HasItems(hero,itwr_map_newworld_city) >= 1)
		{
			return itwr_map_newworld_city;
		};
	}
	else if(CURRENTLEVEL == OLDWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_oldworld) >= 1)
		{
			return itwr_map_oldworld;
		}
		else if(Npc_HasItems(hero,itwr_map_oldworld_oremines_mis) >= 1)
		{
			return itwr_map_oldworld_oremines_mis;
		};
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
	}
	else if(CURRENTLEVEL == ADDONWORLD_ZEN)
	{
		if(Npc_HasItems(hero,itwr_map_addonworld) >= 1)
		{
			return itwr_map_addonworld;
		}
		else if(Npc_HasItems(hero,itwr_addon_treasuremap) >= 1)
		{
			return itwr_addon_treasuremap;
		};
	};
	return 0;
};

func int b_getanyplayermap()
{
	if(Npc_HasItems(hero,itwr_map_newworld) >= 1)
	{
		return itwr_map_newworld;
	}
	else if(Npc_HasItems(hero,itwr_map_shrine_mis) >= 1)
	{
		return itwr_map_shrine_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_caves_mis) >= 1)
	{
		return itwr_map_caves_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_ornaments_addon) >= 1)
	{
		return itwr_map_newworld_ornaments_addon;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_dexter) >= 1)
	{
		return itwr_map_newworld_dexter;
	}
	else if(Npc_HasItems(hero,itwr_shatteredgolem_mis) >= 1)
	{
		return itwr_shatteredgolem_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_orcelite_mis) >= 1)
	{
		return itwr_map_orcelite_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_newworld_city) >= 1)
	{
		return itwr_map_newworld_city;
	}
	else if(Npc_HasItems(hero,itwr_map_oldworld) >= 1)
	{
		return itwr_map_oldworld;
	}
	else if(Npc_HasItems(hero,itwr_map_oldworld_oremines_mis) >= 1)
	{
		return itwr_map_oldworld_oremines_mis;
	}
	else if(Npc_HasItems(hero,itwr_map_addonworld) >= 1)
	{
		return itwr_map_addonworld;
	}
	else if(Npc_HasItems(hero,itwr_addon_treasuremap) >= 1)
	{
		return itwr_addon_treasuremap;
	};
	return 0;
};

func int player_hotkey_screen_map()
{
	var int oldinstance;
	var int newinstance;
	oldinstance = b_getplayermap();
	if((oldinstance > 0) && (Npc_HasItems(hero,oldinstance) < 1))
	{
		oldinstance = 0;
	};
	b_setplayermap(oldinstance);
	newinstance = oldinstance;
	if(CURRENTLEVEL != NEWWORLD_ZEN)
	{
		if((oldinstance == itwr_map_caves_mis) || (oldinstance == itwr_map_newworld) || (oldinstance == itwr_map_newworld_city) || (oldinstance == itwr_map_newworld_dexter) || (oldinstance == itwr_map_newworld_ornaments_addon) || (oldinstance == itwr_map_orcelite_mis) || (oldinstance == itwr_map_shrine_mis) || (oldinstance == itwr_shatteredgolem_mis))
		{
			newinstance = 0;
		};
	};
	if(CURRENTLEVEL != OLDWORLD_ZEN)
	{
		if((oldinstance == itwr_map_oldworld) || (oldinstance == itwr_map_oldworld_oremines_mis))
		{
			newinstance = 0;
		};
	};
	if(CURRENTLEVEL != DRAGONISLAND_ZEN)
	{
	};
	if(CURRENTLEVEL != ADDONWORLD_ZEN)
	{
		if((oldinstance == itwr_map_addonworld) || (oldinstance == itwr_addon_treasuremap))
		{
			newinstance = 0;
		};
	};
	if(newinstance <= 0)
	{
		newinstance = b_getbestplayermap();
	};
	if((newinstance <= 0) && (oldinstance <= 0))
	{
		newinstance = b_getanyplayermap();
	};
	if(newinstance > 0)
	{
		b_setplayermap(newinstance);
		return newinstance;
	}
	else
	{
		return oldinstance;
	};
};

func void b_lameschlork()
{
	Snd_Play("DRINKBOTTLE");
};

func void player_hotkey_lame_potion()
{
	if((Npc_IsInState(hero,zs_dead) == FALSE) && (hero.attribute[ATR_MANA] < hero.attribute[ATR_MANA_MAX]))
	{
		if(Npc_HasItems(hero,itpo_mana_03))
		{
			CONSTANTINO_MANA_TIME += 5;
			if(CONSTANTINO_MANA_TIME > 30)
			{
				CONSTANTINO_MANA_TIME = 30;
			};
			Npc_RemoveInvItem(hero,itpo_mana_03);
			PrintScreen("Elixir of mana used",-1,17,FONT_SCREENBRIGHTLARGE,2);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_mana_02))
		{
			CONSTANTINO_MANA_TIME += 10;
			if(CONSTANTINO_MANA_TIME > 30)
			{
				CONSTANTINO_MANA_TIME = 30;
			};
			Npc_RemoveInvItem(hero,itpo_mana_02);
			PrintScreen("Extract of mana used",-1,20,FONT_SCREENBRIGHTLARGE,2);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_mana_01))
		{
			CONSTANTINO_MANA_TIME += 20;
			if(CONSTANTINO_MANA_TIME > 30)
			{
				CONSTANTINO_MANA_TIME = 30;
			};
			Npc_RemoveInvItem(hero,itpo_mana_01);
			PrintScreen("Essence of mana used",-1,23,FONT_SCREENBRIGHTLARGE,2);
			b_lameschlork();
		}
		else
		{
			Print("No mana potions available!");
		};
	};
};

func void player_hotkey_lame_heal()
{
	if((Npc_IsInState(hero,zs_dead) == FALSE) && (hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX]))
	{
		if(Npc_HasItems(hero,itpo_health_03))
		{
			CONSTANTINO_HEAL_TIME += 30;
			if(CONSTANTINO_HEAL_TIME > 60)
			{
				CONSTANTINO_HEAL_TIME = 60;
			};
			Npc_RemoveInvItem(hero,itpo_health_03);
			PrintScreen("Elixir of healing used",-1,17,FONT_SCREENBRIGHTLARGE,2);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_health_02))
		{
			CONSTANTINO_HEAL_TIME += 20;
			if(CONSTANTINO_HEAL_TIME > 60)
			{
				CONSTANTINO_HEAL_TIME = 60;
			};
			Npc_RemoveInvItem(hero,itpo_health_02);
			PrintScreen("Extract of healing used",-1,20,FONT_SCREENBRIGHTLARGE,2);
			b_lameschlork();
		}
		else if(Npc_HasItems(hero,itpo_health_01))
		{
			CONSTANTINO_HEAL_TIME += 15;
			if(CONSTANTINO_HEAL_TIME > 60)
			{
				CONSTANTINO_HEAL_TIME = 60;
			};
			Npc_RemoveInvItem(hero,itpo_health_01);
			PrintScreen("Essence of healing used",-1,23,FONT_SCREENBRIGHTLARGE,2);
			b_lameschlork();
		}
		else
		{
			Print("No healing potions available!");
		};
	};
};

