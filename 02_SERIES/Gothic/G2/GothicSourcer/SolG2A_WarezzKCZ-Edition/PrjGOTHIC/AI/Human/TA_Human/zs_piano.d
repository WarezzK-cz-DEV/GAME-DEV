
func void zs_piano()
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

func int zs_piano_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"KLAVIER"))
	{
		AI_UseMob(self,"KLAVIER",1);
	};
	return LOOP_CONTINUE;
};

func void zs_piano_end()
{
	AI_UseMob(self,"KLAVIER",-1);
};

