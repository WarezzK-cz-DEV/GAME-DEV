
func void zs_smith_anvil()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bennet))
	{
		if(BENNET_FLAG == 0)
		{
			BENNET_SWORDRAWS = Npc_HasItems(self,itmiswordraw);
			BENNET_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(brian))
	{
		if(BRIAN_FLAG == 0)
		{
			BRIAN_SWORDRAWS = Npc_HasItems(self,itmiswordraw);
			BRIAN_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sarah))
	{
		if(SARAH_FLAG == 0)
		{
			SARAH_SWORDRAWS = Npc_HasItems(self,itmiswordraw);
			SARAH_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(huno))
	{
		if(HUNO_FLAG == 0)
		{
			HUNO_SWORDRAWS = Npc_HasItems(self,itmiswordraw);
			HUNO_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(bennet_di))
	{
		if(BENNET_DI_FLAG == 0)
		{
			BENNET_DI_SWORDRAWS = Npc_HasItems(self,itmiswordraw);
			BENNET_DI_FLAG = 1;
		};
	};
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_smith_anvil_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_UseMob(self,"BSANVIL",1);
	};
	return LOOP_CONTINUE;
};

func void zs_smith_anvil_end()
{
	AI_UseMob(self,"BSANVIL",-1);
};

