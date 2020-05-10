
func int b_teachplayertalentbowmake(var C_NPC slf,var C_NPC oth,var int rangeweap)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_BOWMAKE,rangeweap);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTBOWMAKE,LOG_NOTE);
	b_logentry(TOPIC_TALENTBOWMAKE,"To craft a bow, first of all I will need wooden blanks. I need to fix one at a special table and leave it to acquire the proper shape. Once the bow has been shaped, I can attach a string.");
	b_logentry(TOPIC_TALENTBOWMAKE,"For arrows I need to saw a wooden blank into shafts and then begin to craft arrows.");
	if(rangeweap == BOW_BSPR_1)
	{
		PLAYER_TALENT_BOWMAKE[0] = TRUE;
		b_logentry(TOPIC_TALENTBOWMAKE,"To craft 'Fine longbow' I need 2 wooden billets and 2 leathers.");
	};
	if(rangeweap == BOW_BSPR_2)
	{
		PLAYER_TALENT_BOWMAKE[1] = TRUE;
		b_logentry(TOPIC_TALENTBOWMAKE,"To craft 'Assassin's bow' I need 2 wooden billets and 3 leathers.");
	};
	if(rangeweap == BOW_BSPR_3)
	{
		PLAYER_TALENT_BOWMAKE[2] = TRUE;
		b_logentry(TOPIC_TALENTBOWMAKE,"To craft 'Combat bow' I need 3 wooden billets and 3 leathers.");
	};
	if(rangeweap == BOW_BSPR_4)
	{
		PLAYER_TALENT_BOWMAKE[3] = TRUE;
		b_logentry(TOPIC_TALENTBOWMAKE,"To craft 'Fine oak bow' I need 4 wooden billets and 2 leathers.");
	};
	if(rangeweap == BOW_BSPR_5)
	{
		PLAYER_TALENT_BOWMAKE[4] = TRUE;
		b_logentry(TOPIC_TALENTBOWMAKE,"To craft 'Heavy steel bow' I need 2 wooden billets, 2 leathers and 10 steel bars.");
	};
	PrintScreen(PRINT_LEARNBOWMAKE,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_BOWMAKE,1);
	return TRUE;
};

