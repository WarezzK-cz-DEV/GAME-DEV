
var int evt_orkoberst_onetime;

func void evt_orkoberst()
{
	if(evt_orkoberst_onetime == FALSE)
	{
		orkelite_antipaladinorkoberst_di.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		orcelite_dioberst1_rest.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		orcelite_dioberst2_rest.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		orcelite_dioberst3_rest.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		Wld_InsertNpc(orcwarrior_roam,"SHIP_DECK_05");
		Wld_InsertNpc(orcwarrior_roam,"SHIP_DECK_17");
		Wld_InsertNpc(orcwarrior_roam,"SHIP_IN_22");
		Wld_InsertNpc(orcwarrior_roam,"DI_SHIP_04");
		if(TORLOFISCAPTAIN == TRUE)
		{
			Wld_InsertNpc(orcwarrior_roam,"DI_SHIP_04");
		};
		if(!Npc_IsDead(vatras_di))
		{
			vatras_di.flags = NPC_FLAG_IMMORTAL;
		};
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_DI_ORK_02");
		Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_DI_ORK_03");
		b_startotherroutine(biff_di,"OrkSturmDI");
		b_startotherroutine(jack_di,"OrkSturmDI");
		b_startotherroutine(torlof_di,"OrkSturmDI");
		if(!Npc_IsDead(mario_di))
		{
			CreateInvItem(mario_di,itwr_dementorobsessionbook_mis);
			b_startotherroutine(mario_di,"OrkSturmDI");
			Wld_InsertNpc(skeleton_mario1,"FP_ROAM_DI_MARIOSSKELETONS_01");
			Wld_InsertNpc(skeleton_mario2,"FP_ROAM_DI_MARIOSSKELETONS_02");
			Wld_InsertNpc(skeleton_mario3,"FP_ROAM_DI_MARIOSSKELETONS_03");
			Wld_InsertNpc(skeleton_mario4,"FP_ROAM_DI_MARIOSSKELETONS_04");
		}
		else
		{
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_01");
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_02");
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_03");
			Wld_InsertNpc(undeadorcwarrior,"FP_ROAM_DI_MARIOSSKELETONS_04");
		};
		ORKSTURMDI = TRUE;
		b_logentry(TOPIC_HALLENVONIRDORATH,"The orc colonel is a really tough cookie. Somewhere in his throne room there must be a way to get on.");
		evt_orkoberst_onetime = TRUE;
	};
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

