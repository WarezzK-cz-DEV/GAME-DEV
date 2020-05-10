
func void b_assignschiffswachenguard(var C_NPC schiffswache)
{
	if((MIS_SHIPISFREE == TRUE) || (MIS_SCVISITSHIP == LOG_RUNNING))
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_04_00");	//We are watching you. Remember that.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_09_01");	//Don't get into trouble while you're here.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_Ambient_12_02");	//Don't even think of stealing anything here, got it?
		};
		AI_StopProcessInfos(schiffswache);
		Npc_SetRefuseTalk(schiffswache,60);
		Npc_SetRefuseTalk(pal_220_schiffswache,60);
		Npc_SetRefuseTalk(pal_221_schiffswache,60);
		Npc_SetRefuseTalk(pal_222_schiffswache,60);
		Npc_SetRefuseTalk(pal_223_schiffswache,60);
		Npc_SetRefuseTalk(pal_224_schiffswache,60);
		Npc_SetRefuseTalk(pal_225_schiffswache,60);
		Npc_SetRefuseTalk(pal_226_schiffswache,60);
		Npc_SetRefuseTalk(pal_227_schiffswache,60);
		Npc_SetRefuseTalk(pal_228_schiffswache,60);
	}
	else
	{
		b_say(self,other,"$ALARM");
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
		Npc_SetRefuseTalk(schiffswache,20);
		Npc_SetRefuseTalk(pal_220_schiffswache,20);
		Npc_SetRefuseTalk(pal_221_schiffswache,20);
		Npc_SetRefuseTalk(pal_222_schiffswache,20);
		Npc_SetRefuseTalk(pal_223_schiffswache,20);
		Npc_SetRefuseTalk(pal_224_schiffswache,20);
		Npc_SetRefuseTalk(pal_225_schiffswache,20);
		Npc_SetRefuseTalk(pal_226_schiffswache,20);
		Npc_SetRefuseTalk(pal_227_schiffswache,20);
		Npc_SetRefuseTalk(pal_228_schiffswache,20);
	};
};

func void b_assignschiffswacheninfos(var C_NPC schiffswache)
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_00");	//The damned orcs have stormed Garond's castle. We must act at once.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_01");	//If we ever get hold of that traitor who opened the main gate to the castle, we'll make short work of him.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_02");	//We can't wait much longer. Our boys in the Valley of Mines need our help before the next wave of orcs attacks.
		};
	}
	else
	{
		if(schiffswache.voice == 4)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_04_03");	//Garond has called for a general mobilization. We'll set out for the Valley of Mines soon.
		};
		if(schiffswache.voice == 9)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_09_04");	//The orcs must finally be taught a lesson.
		};
		if(schiffswache.voice == 12)
		{
			AI_Output(self,other,"DIA_Pal_Schiffswache_AmbientKap5_12_05");	//I can barely wait to give those orcs what for. We'll get started soon.
		};
	};
	AI_StopProcessInfos(schiffswache);
};

func void b_assignschiffswachentalk(var C_NPC schiffswache)
{
	if(KAPITEL >= 5)
	{
		b_assignschiffswacheninfos(schiffswache);
	}
	else
	{
		b_assignschiffswachenguard(schiffswache);
	};
};

func int b_assignschiffswacheninfoconditions(var C_NPC schiffswache)
{
	if((KAPITEL < 5) && (Npc_RefuseTalk(self) == FALSE) && (MIS_SCVISITSHIP != LOG_RUNNING))
	{
		return TRUE;
	}
	else if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

