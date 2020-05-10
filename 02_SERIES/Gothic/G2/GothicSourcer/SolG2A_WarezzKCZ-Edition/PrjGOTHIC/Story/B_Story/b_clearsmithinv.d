
func void b_clearsmithinv(var C_NPC self)
{
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(hero))
	{
		Npc_RemoveInvItems(self,itmiswordraw,Npc_HasItems(self,itmiswordraw));
		Npc_RemoveInvItems(self,itmiswordrawhot,Npc_HasItems(self,itmiswordrawhot));
		Npc_RemoveInvItems(self,itmiswordbladehot,Npc_HasItems(self,itmiswordbladehot));
		Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
		Npc_RemoveInvItems(self,itmi_pliers_armr,Npc_HasItems(self,itmi_pliers_armr));
		Npc_RemoveInvItems(self,itmi_pliers_smlt,Npc_HasItems(self,itmi_pliers_smlt));
		Npc_RemoveInvItems(self,itmi_pliers_smlt_2,Npc_HasItems(self,itmi_pliers_smlt_2));
		Npc_RemoveInvItems(self,itmi_panfull,Npc_HasItems(self,itmi_panfull));
		Npc_RemoveInvItems(self,itmi_branch,Npc_HasItems(self,itmi_branch));
		if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(bronko))
		{
			Npc_RemoveInvItems(self,itmw_2h_bau_axe,Npc_HasItems(self,itmw_2h_bau_axe));
		};
	};
};

func void b_clearalchemyinv(var C_NPC slf)
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,itmi_flask,Npc_HasItems(slf,itmi_flask));
	};
};

func void b_clearbonusfoodinv(var C_NPC slf)
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(her))
	{
		if(slf.aivar[89] == TRUE)
		{
			Npc_RemoveInvItems(slf,itfo_apple,Npc_HasItems(slf,itfo_apple));
		}
		else
		{
			slf.aivar[89] = TRUE;
		};
		if(slf.guild == GIL_PAL)
		{
			Npc_RemoveInvItems(slf,itpl_dex_herb_01,Npc_HasItems(slf,itpl_dex_herb_01));
		};
	};
};

