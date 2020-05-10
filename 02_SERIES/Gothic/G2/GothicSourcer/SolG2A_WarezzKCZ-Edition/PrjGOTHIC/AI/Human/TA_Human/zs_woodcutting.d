
func void zs_woodcutting()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_woodcutting_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"WOODCHOPPIN"))
	{
		AI_UseMob(self,"WOODCHOPPIN",1);
	};
	if((Npc_GetStateTime(self) > 15) && c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_woodcutting_end()
{
	AI_UseMob(self,"WOODCHOPPIN",-1);
};

