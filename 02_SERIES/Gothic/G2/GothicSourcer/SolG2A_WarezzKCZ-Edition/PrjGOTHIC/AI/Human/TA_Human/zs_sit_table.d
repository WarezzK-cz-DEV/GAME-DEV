
func void zs_sit_table()
{
	perception_set_normal();
	b_resetall(self);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_sit_table_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"TABLE1"))
	{
		AI_UseMob(self,"TABLE1",1);
	};
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"TABLE2"))
	{
		AI_UseMob(self,"TABLE2",1);
	};
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"TABLE3"))
	{
		AI_UseMob(self,"TABLE3",1);
	};
	return LOOP_CONTINUE;
};

func void zs_sit_table_end()
{
	AI_UseMob(self,"TABLE1",-1);
	AI_UseMob(self,"TABLE2",-1);
	AI_UseMob(self,"TABLE3",-1);
};

