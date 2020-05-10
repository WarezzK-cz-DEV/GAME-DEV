
func int b_teachplayertalentwoodmaster(var C_NPC slf,var C_NPC oth,var int woodmastery)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_WOODMASTER,woodmastery);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTWOODMASTER,LOG_NOTE);
	if(woodmastery == WOODMASTERY_1)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_WOODMASTER,1);
		PLAYER_TALENT_WOODMASTER[0] = TRUE;
		b_logentry(TOPIC_TALENTWOODMASTER,LOGTEXT_ADDON_WOOD_1);
		AI_PrintScreen("Learned: Woodcutting - Lumberjack",-1,52,FONT_SCREENBRIGHTLARGE,3);
	};
	if(woodmastery == WOODMASTERY_2)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_WOODMASTER,2);
		PLAYER_TALENT_WOODMASTER[1] = TRUE;
		b_logentry(TOPIC_TALENTWOODMASTER,LOGTEXT_ADDON_WOOD_2);
		AI_PrintScreen("Learned: Woodcutting - Expert",-1,52,FONT_SCREENBRIGHTLARGE,3);
	};
	if(woodmastery == WOODMASTERY_3)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_WOODMASTER,3);
		PLAYER_TALENT_WOODMASTER[2] = TRUE;
		b_logentry(TOPIC_TALENTWOODMASTER,LOGTEXT_ADDON_WOOD_3);
		AI_PrintScreen("Learned: Woodcutting - Master",-1,52,FONT_SCREENBRIGHTLARGE,3);
	};
	return TRUE;
};

