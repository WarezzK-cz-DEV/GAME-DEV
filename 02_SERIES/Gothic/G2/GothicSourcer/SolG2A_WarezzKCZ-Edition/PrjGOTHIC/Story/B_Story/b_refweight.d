
func void b_refweight()
{
	Mdl_RemoveOverlayMds(hero,"A_SHIELD.MDS");
	Mdl_RemoveOverlayMds(hero,"B_SHIELD.MDS");
	Mdl_RemoveOverlayMds(hero,"C_SHIELD.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_1hST1.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_1hST2.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_2hST1.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_2hST2.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_2hST3.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_bowT1.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_bowT2.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_cbowT1.MDS");
	Mdl_RemoveOverlayMds(hero,"humans_cbowT2.MDS");
};

func void b_addfightskill(var C_NPC self,var int talent,var int percent)
{
	if(talent == NPC_TALENT_1H)
	{
		self.hitchance[NPC_TALENT_1H] = self.hitchance[NPC_TALENT_1H] + percent;
		if(self.hitchance[NPC_TALENT_1H] > 100)
		{
			self.hitchance[NPC_TALENT_1H] = 100;
		};
		if((self.hitchance[NPC_TALENT_1H] >= 60) && (self.aivar[91] == FALSE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
			};
			Mdl_RemoveOverlayMds(self,"A_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"B_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"C_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST1.MDS");
			Mdl_ApplyOverlayMds(self,"humans_1hST2.mds");
		};
		if((self.hitchance[NPC_TALENT_1H] >= 30) && (self.hitchance[NPC_TALENT_1H] < 60) && (self.aivar[91] == FALSE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
			};
			Mdl_RemoveOverlayMds(self,"A_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"B_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"C_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST2.MDS");
			Mdl_ApplyOverlayMds(self,"humans_1hST1.mds");
		};
		if((self.hitchance[NPC_TALENT_1H] < 30) && (self.aivar[91] == FALSE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_1H,0);
			};
			Mdl_RemoveOverlayMds(self,"A_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"B_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"C_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST2.MDS");
		};
		if((self.hitchance[NPC_TALENT_1H] >= 60) && (self.aivar[91] == TRUE) && (self.aivar[92] != SH_FALSE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_1H,2);
			};
			Mdl_RemoveOverlayMds(self,"A_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"B_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST2.mds");
			Mdl_ApplyOverlayMds(self,"C_SHIELD.MDS");
		};
		if((self.hitchance[NPC_TALENT_1H] >= 30) && (self.hitchance[NPC_TALENT_1H] < 60) && (self.aivar[91] == TRUE) && (self.aivar[92] != SH_FALSE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_1H,1);
			};
			Mdl_RemoveOverlayMds(self,"A_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"C_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST2.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST1.mds");
			Mdl_ApplyOverlayMds(self,"B_SHIELD.MDS");
		};
		if((self.hitchance[NPC_TALENT_1H] < 30) && (self.aivar[91] == TRUE) && (self.aivar[92] != SH_FALSE))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_1H,0);
			};
			Mdl_RemoveOverlayMds(self,"B_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"C_SHIELD.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_1hST2.MDS");
			Mdl_ApplyOverlayMds(self,"A_SHIELD.MDS");
		};
	};
	if(talent == NPC_TALENT_2H)
	{
		self.hitchance[NPC_TALENT_2H] = self.hitchance[NPC_TALENT_2H] + percent;
		if(self.hitchance[NPC_TALENT_2H] > 100)
		{
			self.hitchance[NPC_TALENT_2H] = 100;
		};
		if(self.hitchance[NPC_TALENT_2H] >= 75)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_2H,3);
			};
			Mdl_ApplyOverlayMds(self,"humans_2hST3.mds");
			Mdl_RemoveOverlayMds(self,"humans_2hST1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_2hST2.MDS");
		};
		if((self.hitchance[NPC_TALENT_2H] >= 50) && (self.hitchance[NPC_TALENT_2H] < 75))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_2H,2);
			};
			Mdl_ApplyOverlayMds(self,"humans_2hST2.mds");
			Mdl_RemoveOverlayMds(self,"humans_2hST1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_2hST3.MDS");
		};
		if((self.hitchance[NPC_TALENT_2H] >= 25) && (self.hitchance[NPC_TALENT_2H] < 50))
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_2H,1);
			};
			Mdl_ApplyOverlayMds(self,"humans_2hST1.mds");
			Mdl_RemoveOverlayMds(self,"humans_2hST2.MDS");
			Mdl_RemoveOverlayMds(self,"humans_2hST3.MDS");
		};
		if(self.hitchance[NPC_TALENT_2H] < 25)
		{
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
			{
				Npc_SetTalentSkill(self,NPC_TALENT_2H,0);
			};
			Mdl_RemoveOverlayMds(self,"humans_2hST1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_2hST2.MDS");
			Mdl_RemoveOverlayMds(self,"humans_2hST3.MDS");
		};
	};
	if(talent == NPC_TALENT_BOW)
	{
		self.hitchance[NPC_TALENT_BOW] = self.hitchance[NPC_TALENT_BOW] + percent;
		if(self.hitchance[NPC_TALENT_BOW] > 100)
		{
			self.hitchance[NPC_TALENT_BOW] = 100;
		};
		if(self.hitchance[NPC_TALENT_BOW] >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_BOW,2);
			Mdl_ApplyOverlayMds(self,"humans_bowT2.mds");
		}
		else if(self.hitchance[NPC_TALENT_BOW] >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_BOW,1);
			Mdl_ApplyOverlayMds(self,"humans_bowT1.mds");
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_BOW,0);
			Mdl_RemoveOverlayMds(self,"humans_bowT1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_bowT2.MDS");
		};
	};
	if(talent == NPC_TALENT_CROSSBOW)
	{
		self.hitchance[NPC_TALENT_CROSSBOW] = self.hitchance[NPC_TALENT_CROSSBOW] + percent;
		if(self.hitchance[NPC_TALENT_CROSSBOW] > 100)
		{
			self.hitchance[NPC_TALENT_CROSSBOW] = 100;
		};
		if(self.hitchance[NPC_TALENT_CROSSBOW] >= 60)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,2);
			Mdl_ApplyOverlayMds(self,"humans_cbowT2.mds");
		}
		else if(self.hitchance[NPC_TALENT_CROSSBOW] >= 30)
		{
			Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,1);
			Mdl_ApplyOverlayMds(self,"humans_cbowT1.mds");
		}
		else
		{
			Npc_SetTalentSkill(self,NPC_TALENT_CROSSBOW,0);
			Mdl_RemoveOverlayMds(self,"humans_cbowT1.MDS");
			Mdl_RemoveOverlayMds(self,"humans_cbowT2.MDS");
		};
	};
};

