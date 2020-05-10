
func void b_malcomexident()
{
	if(MALCOM_ACCIDENT == FALSE)
	{
		if(!Npc_IsDead(malcom))
		{
			AI_Teleport(malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			b_startotherroutine(malcom,"Start");
			b_killnpc(malcom);
			AI_Teleport(malcom,"ADW_PIRATECAMP_SECRETCAVE_02");
			MALCOM_ACCIDENT = TRUE;
			if(!Npc_IsDead(owen))
			{
				b_startotherroutine(owen,"Start");
			};
		};
	};
};

