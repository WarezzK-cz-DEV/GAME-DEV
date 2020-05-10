
var int evt_archoldead_func_onetime;

func void evt_archoldead_func()
{
	if(Npc_IsDead(skeleton_lord_archol))
	{
		skeleton_archol1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol5.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		skeleton_archol6.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(evt_archoldead_func_onetime == FALSE)
	{
		b_logentry(TOPIC_HALLENVONIRDORATH,"I've found something like a temple here. It is inhabited by a lot of undead beings. This all reminds me a lot of the damned orc temple of the Sleeper. This time I will not fail. Not this time!");
		evt_archoldead_func_onetime = TRUE;
	};
};

