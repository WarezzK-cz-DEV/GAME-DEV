
func int b_teachplayertalenttakeanimaltrophy(var C_NPC slf,var C_NPC oth,var int trophy)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_TAKEANIMALTROPHY,trophy);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTANIMALTROPHY,LOG_NOTE);
	b_logentry(TOPIC_TALENTANIMALTROPHY,"Now I can:");
	if(trophy == TROPHY_TEETH)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove teeth from dead animals.");
	};
	if(trophy == TROPHY_MEAT)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[1] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... extract the meat from dead animals.");
	};
	if(trophy == TROPHY_CLAWS)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[2] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove claws from dead animals.");
	};
	if(trophy == TROPHY_FUR)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[3] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove fur from dead animals.");
	};
	if(trophy == TROPHY_REPTILESKIN)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[14] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove skin from reptiles.");
	};
	if(trophy == TROPHY_HEART)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[4] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove heart from dead golems and dead demons.");
	};
	if(trophy == TROPHY_SHADOWHORN)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[5] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove horn from dead shadowbeasts.");
	};
	if(trophy == TROPHY_FIRETONGUE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[6] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove tongue from dead fire lizards.");
	};
	if(trophy == TROPHY_BFWING)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[7] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove wings from dead bloodflies.");
	};
	if(trophy == TROPHY_BFSTING)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[8] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove sting from dead bloodflies and hornets.");
	};
	if(trophy == TROPHY_MANDIBLES)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[9] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove mandibles from dead animals.");
	};
	if(trophy == TROPHY_CRAWLERPLATE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[10] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove plates from dead minecrawlers.");
	};
	if(trophy == TROPHY_DRGSNAPPERHORN)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[11] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove horn from dead dragon snappers.");
	};
	if(trophy == TROPHY_DRAGONSCALE)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[12] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... remove scales from the hide of dead dragons.");
	};
	if(trophy == TROPHY_DRAGONBLOOD)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[13] = TRUE;
		b_logentry(TOPIC_TALENTANIMALTROPHY,"... collect blood from dead dragons.");
	};
	PrintScreen(PRINT_LEARNTAKEANIMALTROPHY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_TAKEANIMALTROPHY,1);
	return TRUE;
};

