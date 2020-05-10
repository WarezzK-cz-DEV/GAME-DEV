
func void b_assesstalk()
{
	var C_NPC pcl;
	var C_NPC pcr;
	var int rnd;
	pcl = Hlp_GetNpc(pc_levelinspektor);
	pcr = Hlp_GetNpc(pc_rockefeller);
	if((Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcr)))
	{
		PrintScreen(ConcatStrings("Voice:",IntToString(self.voice)),-1,70,FONT_SCREEN,2);
		PrintScreen("NO HERO!",-1,-1,FONT_SCREEN,2);
		PrintScreen(IntToString(self.aivar[AIV_FOLLOWDIST]),-1,70,FONT_SCREEN,2);
		if(c_npcisinquarter(self) == Q_KASERNE)
		{
			PrintScreen("Q_BARRACKS",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_GALGEN)
		{
			PrintScreen("Q_GALLOWS",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_MARKT)
		{
			PrintScreen("Q_MARKET",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_TEMPEL)
		{
			PrintScreen("Q_TEMPLE",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_UNTERSTADT)
		{
			PrintScreen("Q_LOWER CITY",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_HAFEN)
		{
			PrintScreen("Q_HARBOR",-1,30,FONT_SCREEN,2);
		};
		if(c_npcisinquarter(self) == Q_OBERSTADT)
		{
			PrintScreen("Q_UPPER CITY",-1,30,FONT_SCREEN,2);
		};
		return;
	};
	if(self.guild > GIL_SEPERATOR_HUM)
	{
		if(Npc_CheckInfo(self,1) == FALSE)
		{
			if(Npc_CheckInfo(self,0) == FALSE)
			{
				return;
			};
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(b_assessenemy())
		{
			return;
		};
		if((b_getplayercrime(self) == CRIME_MURDER) && c_wanttoattackmurder(self,other))
		{
			b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
			return;
		};
		if((c_playerisfakebandit(self,other) == TRUE) && (self.guild != GIL_BDT))
		{
			b_attack(self,other,AR_GUILDENEMY,0);
			return;
		};
		if(c_refusetalk(self,other))
		{
			if(c_playerhasfakeguild(self,other))
			{
				Npc_ClearAIQueue(self);
				AI_StartState(self,zs_commentfakeguild,1,"");
				return;
			}
			else
			{
				b_say(self,other,"$NOTNOW");
				return;
			};
		};
	};
	if(self.aivar[AIV_NPCSTARTEDTALK] == FALSE)
	{
		if(c_bodystatecontains(self,BS_WALK) || c_bodystatecontains(self,BS_RUN))
		{
			b_say(other,self,"$SC_HEYWAITASECOND");
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			rnd = Hlp_Random(100);
			if(rnd <= 25)
			{
				b_say(other,self,"$SC_HEYTURNAROUND");
			}
			else if(rnd <= 50)
			{
				b_say(other,self,"$SC_HEYTURNAROUND02");
			}
			else if(rnd <= 75)
			{
				b_say(other,self,"$SC_HEYTURNAROUND03");
			}
			else if(rnd <= 99)
			{
				b_say(other,self,"$SC_HEYTURNAROUND04");
			};
		};
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	if(c_bodystatecontains(self,BS_SIT))
	{
		if(self.aivar[AIV_NPCSTARTEDTALK] == TRUE)
		{
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(other);
		};
		if(Npc_CanSeeNpc(self,other) || (Npc_GetDistToWP(self,"OC_EBR_HALL_THRONE") <= 1000))
		{
			AI_StartState(self,zs_talk,0,"");
		}
		else
		{
			if(Npc_IsInState(self,zs_observeplayer))
			{
				AI_Standup(self);
			};
			AI_StartState(self,zs_talk,1,"");
		};
		return;
	}
	else
	{
		if(self.aivar[AIV_NPCSTARTEDTALK] == TRUE)
		{
			AI_StandupQuick(self);
			AI_StandupQuick(other);
		}
		else
		{
			AI_Standup(self);
			AI_Standup(other);
		};
		AI_StartState(self,zs_talk,0,"");
		return;
	};
};

