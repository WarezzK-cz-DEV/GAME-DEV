
func void potionalchemy_s1()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_POTIONALCHEMY;
		AI_ProcessInfos(hero);
	};
};


instance PC_POTIONALCHEMY_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_potionalchemy_end_condition;
	information = pc_potionalchemy_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_potionalchemy_end_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_potionalchemy_end_info()
{
	CreateInvItems(self,itmi_flask,1);
	b_endproductiondialog();
};


var int boozestart;

instance PC_BOOZE_START(C_INFO)
{
	npc = pc_hero;
	nr = 10;
	condition = pc_booze_start_condition;
	information = pc_booze_start_info;
	permanent = TRUE;
	description = "Distill booze";
};


func int pc_booze_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_booze_start_info()
{
	BOOZESTART = TRUE;
};


instance PC_BOOZE_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_booze_stop_condition;
	information = pc_booze_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_booze_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_stop_info()
{
	BOOZESTART = FALSE;
};


instance PC_BOOZE_LOU(C_INFO)
{
	npc = pc_hero;
	nr = 5;
	condition = pc_booze_lou_condition;
	information = pc_booze_lou_info;
	permanent = TRUE;
	description = "Try Lou's Hammer";
};


func int pc_booze_lou_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_LOUSHAMMER == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_lou_info()
{
	if((Npc_HasItems(self,itpl_swampherb) >= 1) && (Npc_HasItems(self,itpl_beet) >= 2) && (Npc_HasItems(self,itat_sharkteeth) >= 1) && (Npc_HasItems(self,itfo_addon_rum) >= 1))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,1);
		Npc_RemoveInvItems(self,itpl_beet,2);
		Npc_RemoveInvItems(self,itat_sharkteeth,1);
		Npc_RemoveInvItems(self,itfo_addon_rum,1);
		Print(PRINT_ALCHEMYSUCCESS);
		CreateInvItems(self,itfo_addon_loushammer,1);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_BOOZE_SCHLAF(C_INFO)
{
	npc = pc_hero;
	nr = 6;
	condition = pc_booze_schlaf_condition;
	information = pc_booze_schlaf_info;
	permanent = TRUE;
	description = "Lou's Hammer with twice the rum";
};


func int pc_booze_schlaf_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_SCHLAFHAMMER == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_schlaf_info()
{
	if((Npc_HasItems(self,itpl_swampherb) >= 1) && (Npc_HasItems(self,itpl_beet) >= 2) && (Npc_HasItems(self,itat_sharkteeth) >= 1) && (Npc_HasItems(self,itfo_addon_rum) >= 2))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,1);
		Npc_RemoveInvItems(self,itpl_beet,2);
		Npc_RemoveInvItems(self,itat_sharkteeth,1);
		Npc_RemoveInvItems(self,itfo_addon_rum,2);
		Print(PRINT_ALCHEMYSUCCESS);
		CreateInvItems(self,itfo_addon_schlafhammer,1);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_BOOZE_SCHNELLERHERING(C_INFO)
{
	npc = pc_hero;
	nr = 5;
	condition = pc_booze_schnellerhering_condition;
	information = pc_booze_schnellerhering_info;
	permanent = TRUE;
	description = "Mix a hasty herring (1 snapperweed, 1 rum, 1 fish)";
};


func int pc_booze_schnellerhering_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (BOOZESTART == TRUE) && (KNOWS_SCHNELLERHERING == TRUE))
	{
		return TRUE;
	};
};

func void pc_booze_schnellerhering_info()
{
	if((Npc_HasItems(self,itpl_speed_herb_01) >= 1) && (Npc_HasItems(self,itfo_fish) >= 1) && (Npc_HasItems(self,itfo_addon_rum) >= 1))
	{
		Npc_RemoveInvItems(self,itpl_speed_herb_01,1);
		Npc_RemoveInvItems(self,itfo_addon_rum,1);
		Npc_RemoveInvItems(self,itfo_fish,1);
		Print(PRINT_ALCHEMYSUCCESS);
		CreateInvItems(self,itfo_addon_schnellerhering,1);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_CHARGE_INNOSEYE(C_INFO)
{
	nr = 1;
	npc = pc_hero;
	condition = pc_charge_innoseye_condition;
	information = pc_charge_innoseye_info;
	permanent = TRUE;
	description = "Recharge the Eye of Innos";
};


func int pc_charge_innoseye_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] == TRUE) && (Npc_HasItems(hero,itmi_innoseye_discharged_mis) >= 1) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_charge_innoseye_info()
{
	if(((Npc_HasItems(hero,itat_icedragonheart) >= 1) || (Npc_HasItems(hero,itat_rockdragonheart) >= 1) || (Npc_HasItems(hero,itat_firedragonheart) >= 1) || (Npc_HasItems(hero,itat_swampdragonheart) >= 1)) && (Npc_HasItems(hero,itmi_innoseye_discharged_mis) >= 1))
	{
		if(Npc_HasItems(hero,itat_swampdragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_swampdragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_rockdragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_rockdragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_firedragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_firedragonheart,1);
		}
		else if(Npc_HasItems(hero,itat_icedragonheart) >= 1)
		{
			Npc_RemoveInvItems(hero,itat_icedragonheart,1);
		};
		Npc_RemoveInvItems(hero,itmi_innoseye_discharged_mis,1);
		CreateInvItems(hero,itmi_innoseye_mis,1);
		Print(PRINT_ALCHEMYSUCCESSINNOSEYE);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int manastart;

instance PC_MANA_START(C_INFO)
{
	npc = pc_hero;
	nr = 6;
	condition = pc_mana_start_condition;
	information = pc_mana_start_info;
	permanent = TRUE;
	description = "Brew mana potions";
};


func int pc_mana_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_mana_start_info()
{
	MANASTART = TRUE;
};


instance PC_MANA_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_mana_stop_condition;
	information = pc_mana_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_mana_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_mana_stop_info()
{
	MANASTART = FALSE;
};


instance PC_ITPO_MANA_01(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_mana_01_condition;
	information = pc_itpo_mana_01_info;
	permanent = TRUE;
	description = "Essence of mana (2 fire nettles)";
};


func int pc_itpo_mana_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_01_info()
{
	if(Npc_HasItems(hero,itpl_mana_herb_01) >= 2)
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_01,2);
		CreateInvItems(hero,itpo_mana_01,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_02(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_mana_02_condition;
	information = pc_itpo_mana_02_info;
	permanent = TRUE;
	description = "Extract of mana (2 fireweeds)";
};


func int pc_itpo_mana_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_02_info()
{
	if(Npc_HasItems(hero,itpl_mana_herb_02) >= 2)
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_02,2);
		CreateInvItems(hero,itpo_mana_02,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_03(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_mana_03_condition;
	information = pc_itpo_mana_03_info;
	permanent = TRUE;
	description = "Elixir of mana  (2 fire roots)";
};


func int pc_itpo_mana_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_03_info()
{
	if(Npc_HasItems(hero,itpl_mana_herb_03) >= 2)
	{
		Npc_RemoveInvItems(hero,itpl_mana_herb_03,2);
		CreateInvItems(hero,itpo_mana_03,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_MANA_04(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_mana_04_condition;
	information = pc_itpo_mana_04_info;
	permanent = TRUE;
	description = "Pure mana potion(2 extracts of mana, 1 meadow knotweed)";
};


func int pc_itpo_mana_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_04] == TRUE) && (MANASTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_mana_04_info()
{
	if((Npc_HasItems(hero,itpo_mana_02) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_mana_02,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_mana_addon_04,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int healthstart;

instance PC_HEALTH_START(C_INFO)
{
	npc = pc_hero;
	nr = 7;
	condition = pc_health_start_condition;
	information = pc_health_start_info;
	permanent = TRUE;
	description = "Brew healing potions";
};


func int pc_health_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_health_start_info()
{
	HEALTHSTART = TRUE;
};


instance PC_HEALTH_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_health_stop_condition;
	information = pc_health_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_health_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_health_stop_info()
{
	HEALTHSTART = FALSE;
};


instance PC_ITPO_HEALTH_01(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_health_01_condition;
	information = pc_itpo_health_01_info;
	permanent = TRUE;
	description = "Essence of healing (2 healing plants)";
};


func int pc_itpo_health_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_01_info()
{
	if(Npc_HasItems(hero,itpl_health_herb_01) >= 2)
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_01,2);
		CreateInvItem(hero,itpo_health_01);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_02(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_health_02_condition;
	information = pc_itpo_health_02_info;
	permanent = TRUE;
	description = "Extract of healing (2 healing herbs)";
};


func int pc_itpo_health_02_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_02_info()
{
	if(Npc_HasItems(hero,itpl_health_herb_02) >= 2)
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_02,2);
		CreateInvItems(hero,itpo_health_02,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_03(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_health_03_condition;
	information = pc_itpo_health_03_info;
	permanent = TRUE;
	description = "Elixir of healing (2 healing roots)";
};


func int pc_itpo_health_03_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_03_info()
{
	if(Npc_HasItems(hero,itpl_health_herb_03) >= 2)
	{
		Npc_RemoveInvItems(hero,itpl_health_herb_03,2);
		CreateInvItems(hero,itpo_health_03,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_HEALTH_04(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itpo_health_04_condition;
	information = pc_itpo_health_04_info;
	permanent = TRUE;
	description = "Pure life potion(2 extracts of healing, 1 meadow knotweed)";
};


func int pc_itpo_health_04_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_04] == TRUE) && (HEALTHSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_health_04_info()
{
	if((Npc_HasItems(hero,itpo_health_02) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_health_02,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_health_addon_04,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int specialstart;

instance PC_SPECIAL_START(C_INFO)
{
	npc = pc_hero;
	nr = 9;
	condition = pc_special_start_condition;
	information = pc_special_start_info;
	permanent = TRUE;
	description = "Brew special potions";
};


func int pc_special_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_special_start_info()
{
	SPECIALSTART = TRUE;
};


instance PC_SPECIAL_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_special_stop_condition;
	information = pc_special_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_special_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_special_stop_info()
{
	SPECIALSTART = FALSE;
};


instance PC_ITPO_ADDON_GEIST(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_addon_geist_condition;
	information = pc_itpo_addon_geist_info;
	permanent = TRUE;
	description = "Elixir of mental alteration";
};


func int pc_itpo_addon_geist_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (KNOWS_MCELIXIER == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_addon_geist_info()
{
	if((Npc_HasItems(hero,itat_sting) >= 2) && (Npc_HasItems(hero,itpo_mana_02) >= 1) && (Npc_HasItems(hero,itpo_health_01) >= 1) && (Npc_HasItems(hero,itfo_addon_pfeffer_01) >= 1))
	{
		Npc_RemoveInvItems(hero,itat_sting,2);
		Npc_RemoveInvItems(hero,itpo_mana_02,1);
		Npc_RemoveInvItems(hero,itpo_health_01,1);
		Npc_RemoveInvItems(hero,itfo_addon_pfeffer_01,1);
		if(KNOWS_BLOODFLY == TRUE)
		{
			CreateInvItems(hero,itpo_addon_geist_02,1);
		}
		else
		{
			CreateInvItems(hero,itpo_addon_geist_01,1);
		};
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_HEALTH(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_health_condition;
	information = pc_itpo_perm_health_info;
	permanent = TRUE;
	description = "Elixir of life (3 pure life potions, 1 king's sorrel)";
};


func int pc_itpo_perm_health_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_health_info()
{
	if((Npc_HasItems(hero,itpo_health_addon_04) >= 3) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_health_addon_04,3);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_health,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_BAPEHBE(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_bapehbe_condition;
	information = pc_itpo_bapehbe_info;
	permanent = TRUE;
	description = "Berry broth (10 woodland berries, 1 water)";
};


func int pc_itpo_bapehbe_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (KNOWS_BAPEHBE == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_bapehbe_info()
{
	if((Npc_HasItems(hero,itpl_forestberry) >= 10) && (Npc_HasItems(hero,itfo_water) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_forestberry,10);
		Npc_RemoveInvItems(hero,itfo_water,1);
		CreateInvItems(hero,itpo_bapehbe,1);
		CreateInvItems(self,itmi_flask,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_MANA(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_mana_condition;
	information = pc_itpo_perm_mana_info;
	permanent = TRUE;
	description = "Elixir of spirit (3 pure mana potion, 1 king's sorrel)";
};


func int pc_itpo_perm_mana_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_mana_info()
{
	if((Npc_HasItems(hero,itpo_mana_addon_04) >= 3) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpo_mana_addon_04,3);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_mana,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_PERM_MUSHROOMMP(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_perm_mushroommp_condition;
	information = pc_itpo_perm_mushroommp_info;
	permanent = TRUE;
	description = "Elixir of dark mushrooms (50 dark mushrooms)";
};


func int pc_itpo_perm_mushroommp_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (KNOWS_MUSHROOMMP == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_perm_mushroommp_info()
{
	if(Npc_HasItems(hero,itpl_mushroom_01) >= 50)
	{
		Npc_RemoveInvItems(hero,itpl_mushroom_01,50);
		CreateInvItems(hero,itpo_perm_mushroommp,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_DEX(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_dex_condition;
	information = pc_itpo_dex_info;
	permanent = TRUE;
	description = "Potion of dexterity (1 goblin berry, 1 king's sorrel)";
};


func int pc_itpo_dex_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_dex_info()
{
	if((Npc_HasItems(hero,itpl_dex_herb_01) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_dex_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_dex,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_STRG(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_strg_condition;
	information = pc_itpo_strg_info;
	permanent = TRUE;
	description = "Potion of strength (1 dragonroot, 1 king's sorrel)";
};


func int pc_itpo_strg_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_strg_info()
{
	if((Npc_HasItems(hero,itpl_strength_herb_01) >= 1) && (Npc_HasItems(hero,itpl_perm_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_strength_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_perm_herb,1);
		CreateInvItems(hero,itpo_perm_str,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_DEF(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_def_condition;
	information = pc_itpo_def_info;
	permanent = TRUE;
	description = "Elixir of protection (3 grave moss, 15 skeleton's bones)";
};


func int pc_itpo_def_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (KNOWS_PDEFMOSS == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_def_info()
{
	if((Npc_HasItems(hero,itpl_gravemoss) >= 3) && (Npc_HasItems(hero,itat_skeletonbone) >= 15))
	{
		Npc_RemoveInvItems(hero,itpl_gravemoss,3);
		Npc_RemoveInvItems(hero,itat_skeletonbone,15);
		CreateInvItems(hero,itpo_perm_def,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITPO_SPEED(C_INFO)
{
	nr = 3;
	npc = pc_hero;
	condition = pc_itpo_speed_condition;
	information = pc_itpo_speed_info;
	permanent = TRUE;
	description = "Potion of speed (1 snapperweed, 1 meadow knotweed)";
};


func int pc_itpo_speed_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_SPEED] == TRUE) && (SPECIALSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itpo_speed_info()
{
	if((Npc_HasItems(hero,itpl_speed_herb_01) >= 1) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_speed_herb_01,1);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itpo_speed,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


var int constantinstart;

instance PC_CONSTANTIN_START(C_INFO)
{
	npc = pc_hero;
	nr = 9;
	condition = pc_constantin_start_condition;
	information = pc_constantin_start_info;
	permanent = TRUE;
	description = "Special potions";
};


func int pc_constantin_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (MANASTART == FALSE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE) && ((PLAYER_TALENT_ALCHEMY[15] == TRUE) || (PLAYER_TALENT_ALCHEMY[16] == TRUE)))
	{
		return TRUE;
	};
};

func void pc_constantin_start_info()
{
	CONSTANTINSTART = TRUE;
};


instance PC_CONSTANTIN_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_constantin_stop_condition;
	information = pc_constantin_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_constantin_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (CONSTANTINSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_constantin_stop_info()
{
	CONSTANTINSTART = FALSE;
};


var int tabakstart;

instance PC_TABAK_START(C_INFO)
{
	npc = pc_hero;
	nr = 11;
	condition = pc_tabak_start_condition;
	information = pc_tabak_start_info;
	permanent = TRUE;
	description = "Blend tobacco and roll reefers";
};


func int pc_tabak_start_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == FALSE) && (BOOZESTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_tabak_start_info()
{
	TABAKSTART = TRUE;
};


instance PC_TABAK_STOP(C_INFO)
{
	npc = pc_hero;
	nr = 99;
	condition = pc_tabak_stop_condition;
	information = pc_tabak_stop_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int pc_tabak_stop_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_tabak_stop_info()
{
	TABAKSTART = FALSE;
};


instance PC_ITMI_JOINT(C_INFO)
{
	nr = 10;
	npc = pc_hero;
	condition = pc_itmi_joint_condition;
	information = pc_itmi_joint_info;
	permanent = TRUE;
	description = "Process swampweed (1 stalk)";
};


func int pc_itmi_joint_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmi_joint_info()
{
	if(Npc_HasItems(hero,itpl_swampherb) >= 1)
	{
		Npc_RemoveInvItems(hero,itpl_swampherb,1);
		CreateInvItems(hero,itmi_joint,1);
		Print(PRINT_JOINTSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITMI_ADDON_JOINT_01(C_INFO)
{
	nr = 11;
	npc = pc_hero;
	condition = pc_itmi_addon_joint_01_condition;
	information = pc_itmi_addon_joint_01_info;
	permanent = TRUE;
	description = "Green novice (2 reefer, 1 meadow knotweed)";
};


func int pc_itmi_addon_joint_01_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (TABAKSTART == TRUE) && (GREEN_EXTREM == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmi_addon_joint_01_info()
{
	if((Npc_HasItems(hero,itpl_swampherb) >= 2) && (Npc_HasItems(hero,itpl_temp_herb) >= 1))
	{
		Npc_RemoveInvItems(hero,itpl_swampherb,2);
		Npc_RemoveInvItems(hero,itpl_temp_herb,1);
		CreateInvItems(hero,itmi_addon_joint_01,1);
		Print(PRINT_ADDON_JOINT_01_SUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};


instance PC_ITMI_TABAK(C_INFO)
{
	nr = 10;
	npc = pc_hero;
	condition = pc_itmi_tabak_condition;
	information = pc_itmi_tabak_info;
	permanent = TRUE;
	description = "Blend tobacco...";
};


func int pc_itmi_tabak_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (Npc_HasItems(hero,itmi_apfeltabak) >= 1) && (TABAKSTART == TRUE))
	{
		return TRUE;
	};
};

func void pc_itmi_tabak_info()
{
	Info_ClearChoices(pc_itmi_tabak);
	Info_AddChoice(pc_itmi_tabak,DIALOG_BACK,pc_itmi_tabak_back);
	if(Npc_HasItems(hero,itfo_honey) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...with honey",pc_itmi_tabak_honey);
	};
	if(Npc_HasItems(hero,itpl_swampherb) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...with swampweed",pc_itmi_tabak_swampherb);
	};
	if(Npc_HasItems(hero,itpl_mushroom_01) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...with dark mushroom",pc_itmi_tabak_mushroom_01);
	};
	if(Npc_HasItems(hero,itfo_apple) >= 1)
	{
		Info_AddChoice(pc_itmi_tabak,"...with apple",pc_itmi_tabak_double);
	};
};

func void pc_itmi_tabak_back()
{
	Info_ClearChoices(pc_itmi_tabak);
};

func void pc_itmi_tabak_honey()
{
	Npc_RemoveInvItems(hero,itmi_apfeltabak,1);
	Npc_RemoveInvItems(hero,itfo_honey,1);
	CreateInvItems(hero,itmi_honigtabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_swampherb()
{
	Npc_RemoveInvItems(hero,itmi_apfeltabak,1);
	Npc_RemoveInvItems(hero,itpl_swampherb,1);
	CreateInvItems(hero,itmi_sumpftabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_mushroom_01()
{
	Npc_RemoveInvItems(hero,itmi_apfeltabak,1);
	Npc_RemoveInvItems(hero,itpl_mushroom_01,1);
	CreateInvItems(hero,itmi_pilztabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};

func void pc_itmi_tabak_double()
{
	Npc_RemoveInvItems(hero,itmi_apfeltabak,1);
	Npc_RemoveInvItems(hero,itfo_apple,1);
	CreateInvItems(hero,itmi_doppeltabak,1);
	Print(PRINT_TABAKSUCCESS);
	b_endproductiondialog();
};


instance PC_ITPO_MEGADRINK(C_INFO)
{
	nr = 2;
	npc = pc_hero;
	condition = pc_itpo_megadrink_condition;
	information = pc_itpo_megadrink_info;
	permanent = TRUE;
	description = "Dragon egg potion (10 dragon eggs, 1 black pearl, 1 sulfur)";
};


func int pc_itpo_megadrink_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_POTIONALCHEMY) && (PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] == TRUE) && (BOOZESTART == FALSE) && (TABAKSTART == FALSE) && (HEALTHSTART == FALSE) && (MANASTART == FALSE) && (SPECIALSTART == FALSE) && (CONSTANTINSTART == FALSE))
	{
		return TRUE;
	};
};

func void pc_itpo_megadrink_info()
{
	if((Npc_HasItems(hero,itat_dragonegg_mis) >= 10) && (Npc_HasItems(hero,itmi_darkpearl) >= 1) && (Npc_HasItems(hero,itmi_sulfur) >= 1))
	{
		Npc_RemoveInvItems(hero,itat_dragonegg_mis,10);
		Npc_RemoveInvItems(hero,itmi_darkpearl,1);
		Npc_RemoveInvItems(hero,itmi_sulfur,1);
		CreateInvItems(hero,itpo_megadrink,1);
		Print(PRINT_ALCHEMYSUCCESS);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
		CreateInvItems(self,itmi_flask,1);
	};
	b_endproductiondialog();
};

