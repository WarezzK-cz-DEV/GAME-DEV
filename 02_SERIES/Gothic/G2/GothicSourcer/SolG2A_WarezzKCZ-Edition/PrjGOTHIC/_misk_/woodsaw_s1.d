
func void woodsaw_s1()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_WOODSAW;
		AI_ProcessInfos(hero);
	};
};


instance PC_WOODSAW_END(C_INFO)
{
	npc = pc_hero;
	nr = 999;
	condition = pc_woodsaw_end_condition;
	information = pc_woodsaw_end_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int pc_woodsaw_end_condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_WOODSAW)
	{
		return TRUE;
	};
};

func void pc_woodsaw_end_info()
{
	b_endproductiondialog();
};


instance PC_WOODSAW_1(C_INFO)
{
	npc = pc_hero;
	nr = 3;
	condition = pc_woodsaw_1_condition;
	information = pc_woodsaw_1_info;
	permanent = TRUE;
	description = "Saw 1 billet";
};


func int pc_woodsaw_1_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODSAW) && (Npc_HasItems(hero,itmi_woodbar_big) >= 1))
	{
		return TRUE;
	};
};

func void pc_woodsaw_1_info()
{
	Npc_RemoveInvItems(hero,itmi_woodbar_big,1);
	PrintScreen("Sawing 1 billet...",-1,-1,FONT_SCREENBRIGHTLARGE,3);
	AI_Wait(hero,3);
	CreateInvItems(hero,itmi_woodbar,2);
	AI_PrintScreen("Received 2 wooden bars!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	b_endproductiondialog();
};


instance PC_WOODSAW_2(C_INFO)
{
	npc = pc_hero;
	nr = 4;
	condition = pc_woodsaw_2_condition;
	information = pc_woodsaw_2_info;
	permanent = TRUE;
	description = "Saw 2 billets";
};


func int pc_woodsaw_2_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODSAW) && (Npc_HasItems(hero,itmi_woodbar_big) >= 2))
	{
		return TRUE;
	};
};

func void pc_woodsaw_2_info()
{
	Npc_RemoveInvItems(hero,itmi_woodbar_big,2);
	PrintScreen("Sawing 2 billets...",-1,-1,FONT_SCREENBRIGHTLARGE,5);
	AI_Wait(hero,5);
	CreateInvItems(hero,itmi_woodbar,4);
	AI_PrintScreen("Received 4 wooden bars!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	b_endproductiondialog();
};


instance PC_WOODSAW_5(C_INFO)
{
	npc = pc_hero;
	nr = 5;
	condition = pc_woodsaw_5_condition;
	information = pc_woodsaw_5_info;
	permanent = TRUE;
	description = "Saw 5 billets";
};


func int pc_woodsaw_5_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODSAW) && (Npc_HasItems(hero,itmi_woodbar_big) >= 5))
	{
		return TRUE;
	};
};

func void pc_woodsaw_5_info()
{
	Npc_RemoveInvItems(hero,itmi_woodbar_big,5);
	PrintScreen("Sawing 5 billets...",-1,-1,FONT_SCREENBRIGHTLARGE,10);
	AI_Wait(hero,10);
	CreateInvItems(hero,itmi_woodbar,10);
	AI_PrintScreen("Received 10 wooden bars!",-1,52,FONT_SCREENBRIGHTLARGE,2);
	b_endproductiondialog();
};


instance PC_WOODSAW_ALL(C_INFO)
{
	npc = pc_hero;
	nr = 6;
	condition = pc_woodsaw_all_condition;
	information = pc_woodsaw_all_info;
	permanent = TRUE;
	description = "Saw all billets";
};


func int pc_woodsaw_all_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WOODSAW) && (Npc_HasItems(hero,itmi_woodbar_big) >= 3))
	{
		return TRUE;
	};
};

func void pc_woodsaw_all_info()
{
	var string billetsstring;
	var string barstring;
	var int billetcount;
	var int barcount;
	var int messagewait;
	var float waittime;
	billetcount = Npc_HasItems(hero,itmi_woodbar_big);
	barcount = billetcount * 2;
	Npc_RemoveInvItems(hero,itmi_woodbar_big,billetcount);
	messagewait = billetcount * 2;
	waittime = IntToFloat(messagewait);
	billetsstring = "Sawing ";
	billetsstring = ConcatStrings(billetsstring,IntToString(billetcount));
	billetsstring = ConcatStrings(billetsstring," billets...");
	if(messagewait >= 20)
	{
		messagewait = 20;
		waittime = 20;
	};
	AI_PrintScreen(billetsstring,-1,50,FONT_SCREENBRIGHTLARGE,messagewait);
	AI_Wait(hero,waittime);
	barstring = "Received ";
	barstring = ConcatStrings(barstring,IntToString(barcount));
	barstring = ConcatStrings(barstring," wooden bars!");
	AI_PrintScreen(barstring,-1,53,FONT_SCREENBRIGHTLARGE,2);
	CreateInvItems(hero,itmi_woodbar,barcount);
	b_endproductiondialog();
};

