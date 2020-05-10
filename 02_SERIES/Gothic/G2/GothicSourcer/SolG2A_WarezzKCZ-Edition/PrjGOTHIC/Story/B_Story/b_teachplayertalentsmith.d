
func int b_teachplayertalentsmith(var C_NPC slf,var C_NPC oth,var int waffe)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_SMITH,waffe);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
	b_logentry(TOPIC_TALENTSMITH,"To forge a weapon, first of all I need a piece of raw steel. This I must heat in the fire of a smithy until it glows red-hot and then shape it on an anvil. Special weapons often require the use of certain substances that give them special characteristics.");
	if(waffe == WEAPON_FIRSTBLADE)
	{
		PLAYER_TALENT_SMITH[0] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Blade>> - 2 steel bars.");
	};
	if(waffe == WEAPON_1H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Ore longsword>> - 2 steel bars, 1 ore bar.");
	};
	if(waffe == WEAPON_2H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Ore two-hander>> - 2 steel bars, 2 ore bars.");
	};
	if(waffe == WEAPON_1H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Ore bastard sword>> - 2 steel bars, 1 ore bar.");
	};
	if(waffe == WEAPON_2H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Heavy ore two-hander>> - 3 steel bars, 2 ore bars.");
	};
	if(waffe == WEAPON_1H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Orcish ore battle sword>> - 2 steel bars, 2 ore bars.");
	};
	if(waffe == WEAPON_2H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Heavy orcish ore battle sword>> - 3 steel bars, 3 ore bars.");
	};
	if(waffe == WEAPON_1H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Ore Dragonslayer>> - 4 steel bars, 3 ore bars, 5 dragon's blood");
	};
	if(waffe == WEAPON_2H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Large ore Dragonslayer>> - 5 steel bars, 3 ore bars, 5 dragon's blood.");
	};
	if(waffe == WEAPON_1H_DEATHBRINGER)
	{
		PLAYER_TALENT_SMITH[18] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Deathbringer>> - 4 steel bars, 4 ore bars, 6 dragon's blood.");
	};
	if(waffe == WEAPON_2H_DEATHBRINGER)
	{
		PLAYER_TALENT_SMITH[19] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Heavy Deathbringer>> - 5 steel bars, 5 ore bars, 7 dragon's blood.");
	};
	if(waffe == WEAPON_1HFINESWORD)
	{
		PLAYER_TALENT_SMITH[9] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Steel longsword>> - 2 steel bars.");
	};
	if(waffe == WEAPON_SOT)
	{
		PLAYER_TALENT_SMITH[10] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Sword Of Truth>> - 2 steel bars.");
	};
	if(waffe == WEAPON_FINEBASTARD)
	{
		PLAYER_TALENT_SMITH[11] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Fine bastard sword>> - 3 steel bars.");
	};
	if(waffe == WEAPON_ANDURIL)
	{
		PLAYER_TALENT_SMITH[12] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Elegant bastard sword>> - 3 steel bars.");
	};
	if(waffe == WEAPON_FIRSTBLADE2H)
	{
		PLAYER_TALENT_SMITH[13] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Two-hander blade>> - 4 steel bars.");
	};
	if(waffe == WEAPON_2HFINESWORD)
	{
		PLAYER_TALENT_SMITH[15] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Steel two-hander>> - 4 steel bars.");
	};
	if(waffe == WEAPON_CLAYMORE)
	{
		PLAYER_TALENT_SMITH[14] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Claymore>> - 4 steel bars.");
	};
	if(waffe == WEAPON_DEMONSLAYER)
	{
		PLAYER_TALENT_SMITH[16] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Demonslayer>> - 5 steel bars.");
	};
	if(waffe == WEAPON_FLAMEBERGE)
	{
		PLAYER_TALENT_SMITH[17] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Flamberge>> - 5 steel bars.");
	};
	if(waffe == WEAPON_SH_HARAD_01)
	{
		PLAYER_TALENT_SMITH[20] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Shield>> - 2 steel bars, 3 wooden bars.");
	};
	if(waffe == WEAPON_SH_HARAD_02)
	{
		PLAYER_TALENT_SMITH[21] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Battle shield>> - 2 steel bars, 4 wooden bars.");
	};
	if(waffe == WEAPON_SH_HARAD_03)
	{
		PLAYER_TALENT_SMITH[22] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Heavy steel shield>> - 7 steel bars.");
	};
	if(waffe == WEAPON_SH_HARAD_04)
	{
		PLAYER_TALENT_SMITH[23] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Wooden tower shield>> - 4 steel bars, 8 wooden bars.");
	};
	if(waffe == WEAPON_SH_HARAD_05)
	{
		PLAYER_TALENT_SMITH[24] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Steel tower shield>> - 12 steel bars.");
	};
	if(waffe == WEAPON_SH_BENNET_01)
	{
		PLAYER_TALENT_SMITH[25] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Ore shield>> - 3 steel bars, 1 ore bar, 3 wooden bars.");
	};
	if(waffe == WEAPON_SH_BENNET_02)
	{
		PLAYER_TALENT_SMITH[26] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Large ore shield>> - 4 steel bars, 2 ore bars, 5 wooden bars.");
	};
	if(waffe == WEAPON_SH_BENNET_03)
	{
		PLAYER_TALENT_SMITH[27] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Excellent ore shield>> - 3 steel bars, 3 ore bars, 4 wooden bars.");
	};
	if(waffe == WEAPON_SH_BENNET_04)
	{
		PLAYER_TALENT_SMITH[28] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Pure ore shield>> - 5 steel bars, 5 ore bars.");
	};
	if(waffe == WEAPON_SH_BENNET_05)
	{
		PLAYER_TALENT_SMITH[29] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"<<Pure ore tower shield>> - 6 steel bars, 8 ore bars.");
	};
	PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

