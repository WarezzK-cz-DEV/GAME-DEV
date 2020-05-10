
func void b_raiserealattributelearncounter(var C_NPC oth,var int attrib,var int points)
{
	if(attrib == ATR_STRENGTH)
	{
		oth.aivar[REAL_STRENGTH] = oth.aivar[REAL_STRENGTH] + points;
	}
	else if(attrib == ATR_DEXTERITY)
	{
		oth.aivar[REAL_DEXTERITY] = oth.aivar[REAL_DEXTERITY] + points;
	}
	else if(attrib == ATR_MANA_MAX)
	{
		oth.aivar[REAL_MANA_MAX] = oth.aivar[REAL_MANA_MAX] + points;
	};
};

func void b_raiseattribute(var C_NPC oth,var int attrib,var int points)
{
	var string concattext;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] = oth.attribute[ATR_STRENGTH] + points;
		if((oth.attribute[ATR_STRENGTH] >= 160) && (PASSIVE_HP == FALSE))
		{
			PASSIVE_HP = TRUE;
			Snd_Play("LevelUp");
			PrintScreen(PRINT_ADDON_HEALREGBONUS,-1,55,FONT_SCREENBRIGHTLARGE,5);
		};
		concattext = ConcatStrings(PRINT_LEARNSTR,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] = oth.attribute[ATR_DEXTERITY] + points;
		if((oth.attribute[ATR_DEXTERITY] >= 160) && (PASSIVE_ACROBATIC == FALSE))
		{
			PASSIVE_ACROBATIC = TRUE;
			Snd_Play("LevelUp");
			PrintScreen(PRINT_ADDON_ACROBATBONUS,-1,55,FONT_SCREENBRIGHTLARGE,5);
		};
		concattext = ConcatStrings(PRINT_LEARNDEX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] = oth.attribute[ATR_MANA_MAX] + points;
		if((oth.attribute[ATR_MANA_MAX] >= 160) && (PASSIVE_MP == FALSE))
		{
			PASSIVE_MP = TRUE;
			Snd_Play("LevelUp");
			PrintScreen(PRINT_ADDON_MANAREGBONUS,-1,55,FONT_SCREENBRIGHTLARGE,5);
		};
		concattext = ConcatStrings(PRINT_LEARNMANA_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] = oth.attribute[ATR_HITPOINTS_MAX] + points;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
};

