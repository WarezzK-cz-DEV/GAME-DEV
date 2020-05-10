
func int b_getlearncosttalent(var C_NPC oth,var int talent,var int skill)
{
	var int kosten;
	kosten = 0;
	if(talent == NPC_TALENT_MAGE)
	{
		if((skill >= 1) && (skill <= 6))
		{
			kosten = 5;
		};
	};
	if(talent == NPC_TALENT_1H)
	{
		if(oth.aivar[REAL_TALENT_1H] >= 120)
		{
			kosten = skill * 5;
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 90)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_1H],120,skill,4);
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 60)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_1H],90,skill,3);
		}
		else if(oth.aivar[REAL_TALENT_1H] >= 30)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_1H],60,skill,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_1H],30,skill,1);
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		if(oth.aivar[REAL_TALENT_2H] >= 100)
		{
			kosten = skill * 5;
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 75)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_2H],100,skill,4);
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 50)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_2H],75,skill,3);
		}
		else if(oth.aivar[REAL_TALENT_2H] >= 25)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_2H],50,skill,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_2H],25,skill,1);
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		if(oth.aivar[REAL_TALENT_BOW] >= 120)
		{
			kosten = skill * 5;
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 90)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_BOW],120,skill,4);
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 60)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_BOW],90,skill,3);
		}
		else if(oth.aivar[REAL_TALENT_BOW] >= 30)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_BOW],60,skill,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_BOW],30,skill,1);
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		if(oth.aivar[REAL_TALENT_CROSSBOW] >= 120)
		{
			kosten = 5 * skill;
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 90)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_CROSSBOW],120,skill,4);
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 60)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_CROSSBOW],90,skill,3);
		}
		else if(oth.aivar[REAL_TALENT_CROSSBOW] >= 30)
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_CROSSBOW],60,skill,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_TALENT_CROSSBOW],30,skill,1);
		};
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		kosten = 5;
	};
	if((talent == NPC_TALENT_PICKLOCK) || (talent == NPC_TALENT_PICKPOCKET))
	{
		kosten = 5;
	};
	if(talent == NPC_TALENT_LEATHER)
	{
		if(skill == LEATHERFASE_1)
		{
			kosten = 5;
		};
	};
	if(talent == NPC_TALENT_BOWMAKE)
	{
		if(skill == BOW_BSPR_1)
		{
			kosten = 3;
		}
		else if(skill == BOW_BSPR_2)
		{
			kosten = 4;
		}
		else if(skill == BOW_BSPR_3)
		{
			kosten = 5;
		}
		else if(skill == BOW_BSPR_4)
		{
			kosten = 6;
		}
		else if(skill == BOW_BSPR_5)
		{
			kosten = 7;
		};
	};
	if(talent == NPC_TALENT_SMITH)
	{
		if(skill == WEAPON_FIRSTBLADE)
		{
			kosten = 2;
		};
		if(skill == WEAPON_FIRSTBLADE2H)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_CLAYMORE)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1HFINESWORD)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_2HFINESWORD)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_FLAMEBERGE)
		{
			kosten = 7;
		}
		else if(skill == WEAPON_DEMONSLAYER)
		{
			kosten = 5;
		}
		else if(skill == WEAPON_1H_SPECIAL_01)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_2H_SPECIAL_01)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_1H_SPECIAL_02)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_2H_SPECIAL_02)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_1H_SPECIAL_03)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_2H_SPECIAL_03)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_1H_DEATHBRINGER)
		{
			kosten = 8;
		}
		else if(skill == WEAPON_2H_DEATHBRINGER)
		{
			kosten = 10;
		}
		else if(skill == WEAPON_SOT)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_FINEBASTARD)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_ANDURIL)
		{
			kosten = 5;
		}
		else if(skill == WEAPON_SH_HARAD_01)
		{
			kosten = 2;
		}
		else if(skill == WEAPON_SH_HARAD_02)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_SH_HARAD_03)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_SH_HARAD_04)
		{
			kosten = 5;
		}
		else if(skill == WEAPON_SH_HARAD_05)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_SH_BENNET_01)
		{
			kosten = 3;
		}
		else if(skill == WEAPON_SH_BENNET_02)
		{
			kosten = 4;
		}
		else if(skill == WEAPON_SH_BENNET_03)
		{
			kosten = 5;
		}
		else if(skill == WEAPON_SH_BENNET_04)
		{
			kosten = 6;
		}
		else if(skill == WEAPON_SH_BENNET_05)
		{
			kosten = 7;
		};
	};
	if(talent == NPC_TALENT_ARMOR)
	{
		if(skill == ARMASTERY_1)
		{
			kosten = 10;
		}
		else if(skill == ARMASTERY_2)
		{
			kosten = 10;
		}
		else if(skill == ARMASTERY_3)
		{
			kosten = 10;
		};
	};
	if(talent == NPC_TALENT_OREMASTER)
	{
		if(skill == ORMASTERY_1)
		{
			kosten = 3;
		}
		else if(skill == ORMASTERY_2)
		{
			kosten = 3;
		}
		else if(skill == ORMASTERY_3)
		{
			kosten = 4;
		};
	};
	if(talent == NPC_TALENT_WOODMASTER)
	{
		if(skill == WOODMASTERY_1)
		{
			kosten = 3;
		}
		else if(skill == WOODMASTERY_2)
		{
			kosten = 3;
		}
		else if(skill == WOODMASTERY_3)
		{
			kosten = 4;
		};
	};
	if(talent == NPC_TALENT_ENCHANTING)
	{
		if(skill == ENCHANTMASTERY_0)
		{
			kosten = 10;
		}
		else if(skill == ENCHANTMASTERY_1)
		{
			kosten = 10;
		}
		else if(skill == ENCHANTMASTERY_2)
		{
			kosten = 10;
		};
	};
	if(talent == NPC_TALENT_ALCHEMY)
	{
		if(skill == POTION_HEALTH_01)
		{
			kosten = 3;
		}
		else if(skill == POTION_HEALTH_02)
		{
			kosten = 4;
		}
		else if(skill == POTION_HEALTH_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_HEALTH_04)
		{
			kosten = 5;
		}
		else if(skill == POTION_CONST_HEAL)
		{
			kosten = 5;
		}
		else if(skill == POTION_MANA_01)
		{
			kosten = 3;
		}
		else if(skill == POTION_MANA_02)
		{
			kosten = 4;
		}
		else if(skill == POTION_MANA_03)
		{
			kosten = 5;
		}
		else if(skill == POTION_MANA_04)
		{
			kosten = 5;
		}
		else if(skill == POTION_CONST_MANA)
		{
			kosten = 5;
		}
		else if(skill == POTION_SPEED)
		{
			kosten = 5;
		}
		else if(skill == POTION_PERM_STR)
		{
			kosten = 20;
		}
		else if(skill == POTION_PERM_DEX)
		{
			kosten = 20;
		}
		else if(skill == POTION_PERM_MANA)
		{
			kosten = 10;
		}
		else if(skill == POTION_PERM_HEALTH)
		{
			kosten = 15;
		}
		else if(skill == POTION_MEGADRINK)
		{
			kosten = 20;
		};
	};
	if(talent == NPC_TALENT_TAKEANIMALTROPHY)
	{
		if(skill == TROPHY_TEETH)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_MEAT)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_CLAWS)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_FUR)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_HEART)
		{
			kosten = 2;
		}
		else if(skill == TROPHY_SHADOWHORN)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_FIRETONGUE)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFWING)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_BFSTING)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_MANDIBLES)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_CRAWLERPLATE)
		{
			kosten = 3;
		}
		else if(skill == TROPHY_DRGSNAPPERHORN)
		{
			kosten = 1;
		}
		else if(skill == TROPHY_DRAGONSCALE)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_DRAGONBLOOD)
		{
			kosten = 5;
		}
		else if(skill == TROPHY_REPTILESKIN)
		{
			kosten = 2;
		};
	};
	if(talent == NPC_TALENT_WISPDETECTOR)
	{
		if(skill == WISPSKILL_NF)
		{
			kosten = 0;
		}
		else if(skill == WISPSKILL_FF)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_NONE)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_RUNE)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_MAGIC)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_FOOD)
		{
			kosten = 1;
		}
		else if(skill == WISPSKILL_POTIONS)
		{
			kosten = 1;
		};
	};
	if(talent == NPC_TALENT_RUNES)
	{
		if(skill == SPL_PALLIGHT)
		{
			kosten = 1;
		}
		else if(skill == SPL_PALLIGHTHEAL)
		{
			kosten = 3;
		}
		else if(skill == SPL_PALHOLYBOLT)
		{
			kosten = 3;
		}
		else if(skill == SPL_PALMEDIUMHEAL)
		{
			kosten = 5;
		}
		else if(skill == SPL_PALREPELEVIL)
		{
			kosten = 5;
		}
		else if(skill == SPL_PALFULLHEAL)
		{
			kosten = 10;
		}
		else if(skill == SPL_PALDESTROYEVIL)
		{
			kosten = 10;
		}
		else if(skill == SPL_PALTELEPORTSECRET)
		{
			kosten = 5;
		}
		else if(skill == SPL_LIGHT)
		{
			kosten = 1;
		}
		else if(skill == SPL_FIREBOLT)
		{
			kosten = 4;
		}
		else if(skill == SPL_LIGHTHEAL)
		{
			kosten = 3;
		}
		else if(skill == SPL_SUMMONGOBLINSKELETON)
		{
			kosten = 3;
		}
		else if(skill == SPL_ZAP)
		{
			kosten = 5;
		}
		else if(skill == SPL_ICEBOLT)
		{
			kosten = 6;
		}
		else if(skill == SPL_INSTANTFIREBALL)
		{
			kosten = 8;
		}
		else if(skill == SPL_SUMMONWOLF)
		{
			kosten = 5;
		}
		else if(skill == SPL_WINDFIST)
		{
			kosten = 5;
		}
		else if(skill == SPL_SLEEP)
		{
			kosten = 5;
		}
		else if(skill == SPL_CHARM)
		{
			kosten = 5;
		}
		else if(skill == SPL_ICELANCE)
		{
			kosten = 10;
		}
		else if(skill == SPL_WHIRLWIND)
		{
			kosten = 5;
		}
		else if(skill == SPL_MEDIUMHEAL)
		{
			kosten = 5;
		}
		else if(skill == SPL_LIGHTNINGFLASH)
		{
			kosten = 12;
		}
		else if(skill == SPL_CHARGEFIREBALL)
		{
			kosten = 14;
		}
		else if(skill == SPL_SUMMONSKELETON)
		{
			kosten = 10;
		}
		else if(skill == SPL_FEAR)
		{
			kosten = 5;
		}
		else if(skill == SPL_ICECUBE)
		{
			kosten = 10;
		}
		else if(skill == SPL_THUNDERSTORM)
		{
			kosten = 10;
		}
		else if(skill == SPL_GEYSER)
		{
			kosten = 10;
		}
		else if(skill == SPL_CHARGEZAP)
		{
			kosten = 10;
		}
		else if(skill == SPL_SUMMONGOLEM)
		{
			kosten = 15;
		}
		else if(skill == SPL_DESTROYUNDEAD)
		{
			kosten = 10;
		}
		else if(skill == SPL_PYROKINESIS)
		{
			kosten = 10;
		}
		else if(skill == SPL_WATERFIST)
		{
			kosten = 10;
		}
		else if(skill == SPL_FIRESTORM)
		{
			kosten = 10;
		}
		else if(skill == SPL_ICEWAVE)
		{
			kosten = 20;
		}
		else if(skill == SPL_SUMMONDEMON)
		{
			kosten = 20;
		}
		else if(skill == SPL_FULLHEAL)
		{
			kosten = 10;
		}
		else if(skill == SPL_MASTEROFDISASTER)
		{
			kosten = 15;
		}
		else if(skill == SPL_FIRERAIN)
		{
			kosten = 20;
		}
		else if(skill == SPL_BREATHOFDEATH)
		{
			kosten = 20;
		}
		else if(skill == SPL_MASSDEATH)
		{
			kosten = 20;
		}
		else if(skill == SPL_ARMYOFDARKNESS)
		{
			kosten = 20;
		}
		else if(skill == SPL_SHRINK)
		{
			kosten = 20;
		}
		else
		{
			kosten = 5;
		};
	};
	return kosten;
};

