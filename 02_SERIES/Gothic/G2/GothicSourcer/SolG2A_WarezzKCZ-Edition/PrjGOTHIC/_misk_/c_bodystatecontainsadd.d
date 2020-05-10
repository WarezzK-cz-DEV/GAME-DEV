
var int ravenblitz;

func int c_bodystatecontainsadd(var C_NPC slf,var int bodystate)
{
	if((Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)) == (bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

func int c_enemyisundead(var C_NPC slf)
{
	if((slf.guild == GIL_GOBBO_SKELETON) || (slf.aivar[AIV_MM_REAL_ID] == ID_GOBBO_SKELETON) || (slf.guild == GIL_SUMMONED_GOBBO_SKELETON) || (slf.guild == GIL_SKELETON) || (slf.guild == GIL_SUMMONED_SKELETON) || (slf.guild == GIL_SKELETON_MAGE) || (slf.guild == GIL_ZOMBIE) || (slf.guild == GIL_SHADOWBEAST_SKELETON) || (slf.guild == GIL_UNDEADORC) || (slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD))
	{
		return TRUE;
	};
	return FALSE;
};

func void b_mm_assesscs(var C_NPC self)
{
	var int kritdmg;
	if(c_bodystatecontainsadd(other,BS_HIT) && Npc_IsInFightMode(other,FMODE_MELEE) && !Npc_IsInState(self,zs_attack) && !Npc_IsInState(self,zs_mm_attack))
	{
		kritdmg = other.level + other.attribute[ATR_DEXTERITY] + BACKSTAB;
		b_magichurtnpc(other,self,kritdmg);
		PrintScreen("Critical hit!",-1,40,FONT_SCREENBRIGHTLARGE,2);
	};
};

func void b_beliarsweaponspecialdamage(var C_NPC oth,var C_NPC slf)
{
	var int ravenrandy;
	var int ravenrandclawdmg;
	var int heroclawdmg;
	var int damagerandy;
	var int dmgforevil_01;
	var int dmgforevil_02;
	var int dmgforevil_03;
	var int masterdmg;
	var int greatbowdmg;
	var int armordmg;
	var int trollstun;
	var int trollsdmg;
	var int dragoncrit;
	var int dragoncritdmg;
	var int weapstun;
	var int weapstundmg;
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(raven))
	{
		ravenrandclawdmg = Hlp_Random(50);
		Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",slf,slf,0,0,0,FALSE);
		if(RAVENBLITZ <= 0)
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
			b_magichurtnpc(slf,oth,ravenrandclawdmg);
			RAVENBLITZ += 1;
		}
		else if(RAVENBLITZ >= 3)
		{
			ravenrandy = Hlp_Random(3);
			if(ravenrandy <= 50)
			{
				RAVENBLITZ = 0;
			};
		}
		else
		{
			RAVENBLITZ += 1;
		};
	}
	else if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		damagerandy = Hlp_Random(100);
		heroclawdmg = 25 + Hlp_Random(75);
		if(c_schasreadiedbeliarsweapon() && (damagerandy <= BELIARDAMAGECHANCE))
		{
			if(slf.aivar[AIV_MM_REAL_ID] == ID_DRAGON_UNDEAD)
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",oth,oth,0,0,0,FALSE);
				b_magichurtnpc(slf,oth,heroclawdmg);
			}
			else if((slf.flags != NPC_FLAG_IMMORTAL) && !c_bodystatecontainsadd(slf,BS_PARADE))
			{
				Wld_PlayEffect("spellFX_BELIARSRAGE",slf,slf,0,0,0,FALSE);
				b_magichurtnpc(oth,slf,heroclawdmg);
			};
			Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",hero,hero,0,0,0,FALSE);
		};
		if(c_schasreadiedbeliarsweapon() && (damagerandy <= 50))
		{
			Wld_PlayEffect("spellFX_BELIARSRAGE_COLLIDE",hero,hero,0,0,0,FALSE);
		};
	};
	if(Hlp_GetInstanceID(oth) == Hlp_GetInstanceID(hero))
	{
		if(c_schasreadiedblessedweapon_01())
		{
			dmgforevil_01 = 25 + Hlp_Random(25);
			if(c_enemyisundead(self) && !c_bodystatecontainsadd(self,BS_PARADE) && c_bodystatecontainsadd(self,BS_STUMBLE))
			{
				Wld_PlayEffect("VOB_EVILBURN",slf,slf,0,0,0,FALSE);
				b_magichurtnpc(oth,slf,dmgforevil_01);
			};
		};
		if(c_schasreadiedblessedweapon_02())
		{
			dmgforevil_02 = 40 + Hlp_Random(40);
			if(c_enemyisundead(self) && !c_bodystatecontainsadd(self,BS_PARADE) && c_bodystatecontainsadd(self,BS_STUMBLE))
			{
				Wld_PlayEffect("VOB_EVILBURN",slf,slf,0,0,0,FALSE);
				b_magichurtnpc(oth,slf,dmgforevil_02);
			};
		};
		if(c_schasreadiedblessedweapon_03())
		{
			dmgforevil_03 = 55 + Hlp_Random(55);
			if(c_enemyisundead(self) && !c_bodystatecontainsadd(self,BS_PARADE) && c_bodystatecontainsadd(self,BS_STUMBLE))
			{
				Wld_PlayEffect("VOB_EVILBURN",slf,slf,0,0,0,FALSE);
				b_magichurtnpc(oth,slf,dmgforevil_03);
			};
		};
		if(c_schasreadiedmasterweapon())
		{
			masterdmg = other.level + (other.attribute[ATR_DEXTERITY] / 2);
			if(((self.guild == GIL_ORC) || (self.guild == GIL_DRACONIAN) || (self.guild == GIL_SKELETON) || (self.guild < GIL_SEPERATOR_HUM) || (self.aivar[AIV_MM_REAL_ID] == ID_D_RAGE)) && c_bodystatecontainsadd(self,BS_PARADE))
			{
				AI_PlayAni(other,"S_ATTACK_MASTER");
				AI_PlayAni(self,"T_STUMBLEB");
				b_magichurtnpc(other,self,masterdmg);
			};
		};
		if(c_schasreadiedgreatbow())
		{
			greatbowdmg = other.level + (other.attribute[ATR_DEXTERITY] / 2);
			trollstun = Hlp_Random(5);
			trollsdmg = 35 + Hlp_Random(35);
			if(self.guild == GIL_TROLL)
			{
				b_magichurtnpc(oth,slf,greatbowdmg);
				if((trollstun == 2) || (trollstun == 4))
				{
					b_magichurtnpc(oth,slf,trollsdmg);
					AI_PlayAni(self,"T_STUMBLEB");
				};
			};
		};
		if(c_schasreadiedhsweapon())
		{
			armordmg = Hlp_Random(25) + (other.attribute[ATR_STRENGTH] / 4);
			if(((self.aivar[90] == TRUE) || (self.guild == GIL_PAL)) && c_bodystatecontainsadd(self,BS_STUMBLE) && (Npc_GetDistToNpc(self,hero) < 350))
			{
				b_magichurtnpc(oth,slf,armordmg);
				Snd_Play("METAL_HEAVY");
			};
		};
		if(c_schasreadieddragonslayer())
		{
			dragoncrit = Hlp_Random(7);
			dragoncritdmg = Hlp_Random(25) + (other.attribute[ATR_STRENGTH] / 4);
			if(self.guild == GIL_DRAGON)
			{
				b_magichurtnpc(oth,slf,dragoncritdmg);
				Snd_Play("DRG_DS");
				if((dragoncrit == 2) || (dragoncrit == 5))
				{
					b_magichurtnpc(oth,slf,dragoncritdmg);
					Snd_Play("DRG_HURT_A3");
				};
			};
		};
		if(c_schasreadiedstunweapon())
		{
			weapstun = Hlp_Random(7);
			weapstundmg = Hlp_Random(35) + (other.attribute[ATR_STRENGTH] / 4);
			if(((self.guild < GIL_SEPERATOR_HUM) || (self.guild == GIL_ORC) || (self.guild == GIL_DRACONIAN)) && c_bodystatecontainsadd(self,BS_STUMBLE) && (Npc_GetDistToNpc(self,hero) < 350))
			{
				if((weapstun == 3) || (weapstun == 5))
				{
					b_magichurtnpc(oth,slf,armordmg);
					Snd_Play("BLUNT_FLESH");
					AI_PlayAni(self,"T_BASH");
					AI_Wait(self,1);
				};
			};
		};
		if((Npc_GetDistToNpc(self,other) < 355) && !Npc_CanSeeNpc(self,other))
		{
			b_mm_assesscs(self);
		};
	};
};

