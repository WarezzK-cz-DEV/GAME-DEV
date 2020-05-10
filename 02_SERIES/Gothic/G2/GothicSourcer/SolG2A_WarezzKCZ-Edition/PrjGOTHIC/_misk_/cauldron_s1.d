
func void cauldron_s1()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_CAULDRON;
		AI_ProcessInfos(hero);
	};
};


instance PC_CAULDRON_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_cauldron_end_condition;
	information = pc_cauldron_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_cauldron_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_CAULDRON)
	{
		return TRUE;
	};
};

func void pc_cauldron_end_info()
{
	b_endproductiondialog();
};


instance PC_ITFO_FISHSOUP(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itfo_fishsoup_condition;
	information = pc_itfo_fishsoup_info;
	permanent = TRUE;
	description = "Fish soup (1 fish, 1 bottle of water)";
};


func int pc_itfo_fishsoup_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_CAULDRON) && (PLAYER_TALENT_FOOD[0] == TRUE) && (Npc_HasItems(hero,itfo_fish) >= 1) && (Npc_HasItems(hero,itfo_water) >= 1))
	{
		return TRUE;
	};
};

func void pc_itfo_fishsoup_info()
{
	if((Npc_HasItems(hero,itfo_fish) >= 1) && (Npc_HasItems(hero,itfo_water) >= 1))
	{
		Npc_RemoveInvItems(hero,itfo_fish,1);
		Npc_RemoveInvItems(hero,itfo_water,1);
		PrintScreen("Cooking 1 Fish Soup...",-1,-1,FONT_SCREENBRIGHTLARGE,2);
		AI_Wait(hero,2);
		CreateInvItems(hero,itfo_fishsoup,1);
		AI_PrintScreen("Received 1 Fish Soup!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
	};
	b_endproductiondialog();
};


instance PC_ITFO_STEW(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itfo_stew_condition;
	information = pc_itfo_stew_info;
	permanent = TRUE;
	description = "Stew (1 raw meat, 1 turnip)";
};


func int pc_itfo_stew_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_CAULDRON) && (PLAYER_TALENT_FOOD[1] == TRUE) && (Npc_HasItems(hero,itfomuttonraw) >= 1) && (Npc_HasItems(hero,itpl_beet) >= 1))
	{
		return TRUE;
	};
};

func void pc_itfo_stew_info()
{
	if((Npc_HasItems(hero,itfomuttonraw) >= 1) && (Npc_HasItems(hero,itpl_beet) >= 1))
	{
		Npc_RemoveInvItems(hero,itfomuttonraw,1);
		Npc_RemoveInvItems(hero,itpl_beet,1);
		PrintScreen("Cooking 1 Stew...",-1,-1,FONT_SCREENBRIGHTLARGE,2);
		AI_Wait(hero,2);
		CreateInvItems(hero,itfo_stew,1);
		AI_PrintScreen("Received 1 Stew!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
	};
	b_endproductiondialog();
};


instance PC_ITFO_MANTIS_SOUP(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itfo_mantis_soup_condition;
	information = pc_itfo_mantis_soup_info;
	permanent = TRUE;
	description = "Mantis' head soup (1 mantis' head, 1 fire root)";
};


func int pc_itfo_mantis_soup_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_CAULDRON) && (PLAYER_TALENT_FOOD[2] == TRUE) && (Npc_HasItems(hero,itat_addon_bckopf) >= 1) && (Npc_HasItems(hero,itpl_mana_herb_03) >= 1))
	{
		return TRUE;
	};
};

func void pc_itfo_mantis_soup_info()
{
	if((Npc_HasItems(hero,itat_addon_bckopf) >= 1) && (Npc_HasItems(hero,itpl_mana_herb_03) >= 1))
	{
		Npc_RemoveInvItems(hero,itat_addon_bckopf,1);
		Npc_RemoveInvItems(hero,itpl_mana_herb_03,1);
		PrintScreen("Cooking 1 Mantis Head Soup...",-1,-1,FONT_SCREENBRIGHTLARGE,2);
		AI_Wait(hero,2);
		CreateInvItems(hero,itfo_mantis_soup,1);
		AI_PrintScreen("Received 1 Mantis Head Soup!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
	};
	b_endproductiondialog();
};


instance PC_ITFO_MEATBUG_STEW(C_INFO)
{
	nr = 4;
	npc = pc_hero;
	condition = pc_itfo_meatbug_stew_condition;
	information = pc_itfo_meatbug_stew_info;
	permanent = TRUE;
	description = "Meatbug Ragout (3 meatbugs, 2 digger's meat)";
};


func int pc_itfo_meatbug_stew_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_CAULDRON) && (PLAYER_TALENT_FOOD[3] == TRUE) && (Npc_HasItems(hero,itat_meatbugflesh) >= 3) && (Npc_HasItems(hero,itpl_mushroom_02) >= 2))
	{
		return TRUE;
	};
};

func void pc_itfo_meatbug_stew_info()
{
	if((Npc_HasItems(hero,itat_meatbugflesh) >= 3) && (Npc_HasItems(hero,itpl_mushroom_02) >= 2))
	{
		Npc_RemoveInvItems(hero,itat_meatbugflesh,3);
		Npc_RemoveInvItems(hero,itpl_mushroom_02,2);
		PrintScreen("Cooking 1 Meatbug Rugout...",-1,-1,FONT_SCREENBRIGHTLARGE,2);
		AI_Wait(hero,2);
		CreateInvItems(hero,itfo_meatbug_ragout,1);
		AI_PrintScreen("Received 1 Meatbug Rugout!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	}
	else
	{
		b_say(hero,hero,"$BEZI_SKLADNIKI");
	};
	b_endproductiondialog();
};

