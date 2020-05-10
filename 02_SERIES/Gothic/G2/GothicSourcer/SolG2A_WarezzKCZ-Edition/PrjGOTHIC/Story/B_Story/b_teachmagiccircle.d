
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE,circle);
	if((circle < 1) || (circle > 6))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic(TOPIC_TALENTMAGICCIRCLE,LOG_NOTE);
	b_logentry(TOPIC_TALENTMAGICCIRCLE,"The magic runes I have access to are divided into Circles. I can't use a spell that requires a higher Circle than the ones I've mastered.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LEARNCIRCLE_1,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"The spells of the 1st Circle are: Light, Fire arrow, Small lightning, Heal light wounds and Summon goblin skeleton.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LEARNCIRCLE_2,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"The spells of the 2nd Circle are: Fireball, Ice arrow, Summon wolf, Wind fist and Sleep.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LEARNCIRCLE_3,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"The spells of the 3rd Circle are: Heal medium wounds, Ball lightning, Small fire storm, Summon skeleton, Fear and Ice block.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LEARNCIRCLE_4,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"The spells of the 4th Circle are: Lightning, Summon golem, Destroy undead and Large fireball.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LEARNCIRCLE_5,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"The spells of the 5th Circle are: Large fire storm, Ice wave, Summon demon and Heal heavy wounds.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LEARNCIRCLE_6,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"The spells of the 6th Circle are: Fire rain, Breath of death, Wave of death, Army of darkness and Shrink monster.");
		return TRUE;
	};
};

