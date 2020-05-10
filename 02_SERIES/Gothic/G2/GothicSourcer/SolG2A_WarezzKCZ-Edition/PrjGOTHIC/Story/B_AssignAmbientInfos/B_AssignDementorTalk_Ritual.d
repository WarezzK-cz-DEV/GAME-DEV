
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//You have come too late.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//We have destroyed the Eye of Innos, so that it can never regain its power.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//We shall now demonstrate the futility of your attempt to challenge the Master.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"Those sinister guys are getting on my nerves. They destroyed the Eye of Innos. I've no idea how I'm supposed to fix it.");
		b_logentry(TOPIC_TRAITORPEDRO,"I found the Eye of Innos. But there hasn't been a trace of Pedro anywhere so far. Those black magicians are in cahoots with him.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Now feel our power.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//For the Master.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//You cannot hide.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//We shall kill you.
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void b_assigndementortalk_ritual_exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

