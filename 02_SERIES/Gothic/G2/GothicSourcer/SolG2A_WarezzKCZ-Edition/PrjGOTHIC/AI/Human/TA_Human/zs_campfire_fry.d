
func void zs_campfire_fry()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_campfire_fry_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"CAMPFIRE"))
	{
		AI_UseMob(self,"CAMPFIRE",1);
	};
	return LOOP_CONTINUE;
};

func void zs_campfire_fry_end()
{
	AI_UseMob(self,"CAMPFIRE",-1);
};

