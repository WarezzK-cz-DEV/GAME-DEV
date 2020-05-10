
func int b_teachplayertalentalchemy(var C_NPC slf,var C_NPC oth,var int potion)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_ALCHEMY,potion);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTALCHEMY,LOG_NOTE);
	b_logentry(TOPIC_TALENTALCHEMY,"To brew a potion I need an empty laboratory flask and the ingredients required to make the potion. Using these ingredients on the alchemist's bench I can prepare the desired potion.");
	if(potion == POTION_HEALTH_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Essence of healing' ingredients: 2 healing plants.");
	};
	if(potion == POTION_HEALTH_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Extract of healing' ingredients: 2 healing herbs.");
	};
	if(potion == POTION_HEALTH_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Elixir of healing' ingredients: 2 healing roots.");
	};
	if(potion == POTION_CONST_HEAL)
	{
		PLAYER_TALENT_ALCHEMY[15] = TRUE;
		CONSTANTINO_HEAL = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"I'm now an expert of healing potions, healing potions will now give me more health.");
	};
	if(potion == POTION_MANA_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Essence of mana' ingredients: 2 fire nettles.");
	};
	if(potion == POTION_MANA_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Extract of mana' ingredients: 2 fire nettles.");
	};
	if(potion == POTION_MANA_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Elixir of mana' ingredients: 2 fireweed.");
	};
	if(potion == POTION_CONST_MANA)
	{
		PLAYER_TALENT_ALCHEMY[16] = TRUE;
		CONSTANTINO_MANA = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"I'm now an expert of mana potions, mana potions will now give me more mana.");
	};
	if(potion == POTION_SPEED)
	{
		PLAYER_TALENT_ALCHEMY[POTION_SPEED] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Speed potion' ingredients: 1 snapperweed and 1 meadow knotweed.");
	};
	if(potion == POTION_PERM_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Elixir of strength' ingredients: 1 dragonroot and 1 king's sorrel.");
	};
	if(potion == POTION_PERM_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Elixir of dexterity' ingredients: 1 goblin berries and 1 king's sorrel.");
	};
	if(potion == POTION_PERM_MANA)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Elixir of spirit' ingredients: 3 fire roots and 1 king's sorrel.");
	};
	if(potion == POTION_PERM_HEALTH)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"'Elixir of life' ingredients: 3 healing roots and 1 king's sorrel.");
	};
	PrintScreen(PRINT_LEARNALCHEMY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};

