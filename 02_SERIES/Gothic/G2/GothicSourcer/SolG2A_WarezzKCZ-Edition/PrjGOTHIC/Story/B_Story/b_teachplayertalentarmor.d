
func int b_teachplayertalentarmor(var C_NPC slf,var C_NPC oth,var int armastery)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_ARMOR,armastery);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
	if(armastery == ARMASTERY_1)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ARMOR,1);
		PLAYER_TALENT_ARMOR[0] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,LOGTEXT_ADDON_ARMOR_1);
		PrintScreen("Learned: Armor crafting - Apprentice",-1,-1,FONT_SCREEN,2);
	};
	if(armastery == ARMASTERY_2)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ARMOR,2);
		PLAYER_TALENT_ARMOR[1] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,LOGTEXT_ADDON_ARMOR_2);
		PrintScreen("Learned: Armor crafting - Expert",-1,-1,FONT_SCREEN,2);
	};
	if(armastery == ARMASTERY_3)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ARMOR,3);
		PLAYER_TALENT_ARMOR[2] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,LOGTEXT_ADDON_ARMOR_3);
		PrintScreen("Learned: Armor crafting - Master",-1,-1,FONT_SCREEN,2);
	};
	return TRUE;
};

