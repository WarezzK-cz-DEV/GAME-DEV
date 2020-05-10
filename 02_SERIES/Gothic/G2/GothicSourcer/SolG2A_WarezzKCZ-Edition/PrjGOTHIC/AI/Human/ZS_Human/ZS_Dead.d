
func void zs_dead()
{
	var int swddmg;
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_stoplookat(self);
	AI_StopPointAt(self);
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
	{
		b_giveplayerxp(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
	};
	if(c_iamcanyonrazor(self) == TRUE)
	{
		CANYONRAZORBODYCOUNT = CANYONRAZORBODYCOUNT + 1;
		if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
		{
			b_countcanyonrazor();
		};
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		swddmg = Hlp_Random(25);
		if(Npc_GetDistToNpc(self,other) <= 50)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg + 150;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		}
		else if(Npc_GetDistToNpc(self,other) < 100)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg + 125;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		}
		else if(Npc_GetDistToNpc(self,other) < 150)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg + 100;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		}
		else if(Npc_GetDistToNpc(self,other) < 200)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg + 75;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		}
		else if(Npc_GetDistToNpc(self,other) < 250)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg + 55;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		}
		else if(Npc_GetDistToNpc(self,other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg + 25;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		}
		else if(Npc_GetDistToNpc(self,other) < 350)
		{
			other.attribute[ATR_HITPOINTS] -= swddmg;
			Wld_PlayEffect("SWD_CASTBLEND",other,other,0,0,0,FALSE);
			Snd_Play("SWD_FART_A3");
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(diegoow))
	{
		DIEGO_ISDEAD = TRUE;
	};
	if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON))
	{
		Npc_RemoveInvItems(self,itmw_1h_bau_mace,Npc_HasItems(self,itmw_1h_bau_mace));
		Npc_RemoveInvItems(self,itmw_1h_misc_sword,Npc_HasItems(self,itmw_1h_misc_sword));
		Npc_RemoveInvItems(self,itmw_1h_misc_axe,Npc_HasItems(self,itmw_1h_misc_axe));
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KILLEDBYPLAYER] = TRUE;
		if(c_dropunconscious())
		{
			MADKILLERCOUNT = MADKILLERCOUNT + 1;
		};
		if((self.guild == GIL_GIANT_BUG) && (MIS_FESTER_KILLBUGS == LOG_RUNNING))
		{
			FESTERS_GIANT_BUG_KILLED = FESTERS_GIANT_BUG_KILLED + 1;
		};
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(swamprat)) && (MIS_KROKOJAGD == LOG_RUNNING))
		{
			ALLIGATORJACK_KROKOSKILLED = ALLIGATORJACK_KROKOSKILLED + 1;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(ramon))
		{
			PLAYER_HASTALKEDTOBANDITCAMP = TRUE;
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(franco))
		{
			if(MIS_HLPLOGAN == LOG_RUNNING)
			{
				MIS_HLPLOGAN = LOG_OBSOLETE;
			};
			if(MIS_HLPEDGOR == LOG_RUNNING)
			{
				MIS_HLPEDGOR = LOG_OBSOLETE;
			};
		};
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(fortuno))
		{
			Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_OBSOLETE);
		};
	};
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(goldminecrawler))
	{
		MINECRAWLER_KILLED += 1;
		if((MINECRAWLER_KILLED > 9) && (BLOODWYN_SPAWN == FALSE))
		{
			AI_Teleport(bloodwyn,"ADW_MINE_TO_MC_03");
			b_startotherroutine(bloodwyn,"MINE");
			BLOODWYN_SPAWN = TRUE;
		};
	};
	if(self.aivar[AIV_MM_REAL_ID] == ID_ORCWARRIOR)
	{
		PCBLOCK = FALSE;
	};
	b_givetradeinv(self);
	b_givedeathinv(self);
	b_clearruneinv(self);
	b_clearsmithinv(self);
	b_clearalchemyinv(self);
	b_clearbonusfoodinv(self);
	b_deletepetzcrime(self);
	self.aivar[AIV_NPCSAWPLAYERCOMMIT] = CRIME_NONE;
	AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int zs_dead_loop()
{
	if(self.aivar[AIV_TAPOSITION] == FALSE)
	{
		b_dragonkillcounter(self);
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	return LOOP_CONTINUE;
};

