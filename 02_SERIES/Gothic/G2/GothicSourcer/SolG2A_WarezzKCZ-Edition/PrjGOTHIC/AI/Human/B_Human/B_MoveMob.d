
func void b_movemob()
{
	var string door;
	door = Npc_GetDetectedMob(self);
	if(Hlp_StrCmp(door,"DOOR") || Hlp_StrCmp(door,"GATE"))
	{
		if(Wld_GetMobState(self,door) == 0)
		{
			Npc_ClearAIQueue(self);
			AI_UseMob(self,door,1);
			AI_UseMob(self,door,-1);
		};
	}
	else
	{
		return;
	};
	AI_ContinueRoutine(self);
};

