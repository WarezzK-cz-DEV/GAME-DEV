
func void zs_potion_alchemy()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(constantino))
	{
		if(CONSTANTINO_FLAG == 0)
		{
			CONSTANTINO_FLASKS = Npc_HasItems(self,itmi_flask);
			CONSTANTINO_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(salandril))
	{
		if(SALANDRIL_FLAG == 0)
		{
			SALANDRIL_FLASKS = Npc_HasItems(self,itmi_flask);
			SALANDRIL_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(sagitta))
	{
		if(SAGITTA_FLAG == 0)
		{
			SAGITTA_FLASKS = Npc_HasItems(self,itmi_flask);
			SAGITTA_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ignaz))
	{
		if(IGNAZ_FLAG == 0)
		{
			IGNAZ_FLASKS = Npc_HasItems(self,itmi_flask);
			IGNAZ_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(lucia))
	{
		if(LUCIA_FLAG == 0)
		{
			LUCIA_FLASKS = Npc_HasItems(self,itmi_flask);
			LUCIA_FLAG = 1;
		};
	}
	else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(samuel))
	{
		if(SAMUEL_FLAG == 0)
		{
			SAMUEL_FLASKS = Npc_HasItems(self,itmi_flask);
			SAMUEL_FLAG = 1;
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

func int zs_potion_alchemy_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"LAB"))
	{
		AI_UseMob(self,"LAB",1);
	};
	return LOOP_CONTINUE;
};

func void zs_potion_alchemy_end()
{
	AI_UseMob(self,"LAB",-1);
};

