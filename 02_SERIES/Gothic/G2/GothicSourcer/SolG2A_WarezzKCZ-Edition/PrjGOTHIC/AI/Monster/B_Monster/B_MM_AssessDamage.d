
func void b_mm_assessdamage()
{
	var C_NPC maggol;
	var C_ITEM othweap;
	var int drg_rnd_strf;
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;
	b_beliarsweaponspecialdamage(other,self);
	if(Npc_HasItems(other,holy_hammer_mis) > 0)
	{
		maggol = Hlp_GetNpc(magicgolem);
		Npc_GetInvItem(other,holy_hammer_mis);
		othweap = Npc_GetReadiedWeapon(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(maggol)) && (Hlp_GetInstanceID(othweap) == Hlp_GetInstanceID(item)))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-1000);
			return;
		};
	};
	if((self.guild == GIL_STONEGUARDIAN) && (self.aivar[AIV_ENEMYOVERRIDE] == TRUE))
	{
		b_awake_stoneguardian(self);
	};
	if((self.guild == GIL_DRAGON) && (Npc_GetDistToNpc(self,other) < 550))
	{
		drg_rnd_strf = Hlp_Random(100);
		if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(hero))
		{
			if(drg_rnd_strf <= 20)
			{
				AI_PlayAni(self,"T_FISTRUNSTRAFEL");
				AI_TurnToNPC(self,other);
			}
			else if(drg_rnd_strf >= 80)
			{
				AI_PlayAni(self,"T_FISTRUNSTRAFER");
				AI_TurnToNPC(self,other);
			};
		};
		if(Hlp_GetInstanceID(other) != Hlp_GetInstanceID(hero))
		{
			if(drg_rnd_strf <= 5)
			{
				AI_PlayAni(self,"T_FISTRUNSTRAFEL");
				AI_TurnToNPC(self,other);
			}
			else if(drg_rnd_strf >= 95)
			{
				AI_PlayAni(self,"T_FISTRUNSTRAFER");
				AI_TurnToNPC(self,other);
			};
		};
	};
	if(c_predatorfoundprey(other,self))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		b_clearperceptions(self);
		AI_StartState(self,zs_mm_flee,0,"");
		return;
	};
	if(Npc_IsInState(self,zs_mm_attack))
	{
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if(self.aivar[AIV_HITBYOTHERNPC] == Hlp_GetInstanceID(other))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HITBYOTHERNPC] = Hlp_GetInstanceID(other);
			};
		};
		return;
	};
	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	b_clearperceptions(self);
	AI_StartState(self,zs_mm_attack,0,"");
};

