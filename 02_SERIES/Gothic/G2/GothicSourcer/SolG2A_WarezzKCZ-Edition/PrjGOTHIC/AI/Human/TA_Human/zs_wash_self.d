
func void zs_wash_self()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_wash_self_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"WASH"))
	{
		AI_UseMob(self,"WASH",1);
	};
	return LOOP_CONTINUE;
};

func void zs_wash_self_end()
{
	AI_UseMob(self,"WASH",-1);
};

