
instance DIA_AMBIENTDEMENTOR_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ambientdementor_exit_condition;
	information = dia_ambientdementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ambientdementor_exit_condition()
{
	return TRUE;
};

func void dia_ambientdementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	b_scisobsessed(self);
	Npc_SetRefuseTalk(self,5);
	Snd_Play("MFX_FEAR_CAST");
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	}
	else
	{
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	};
};


instance DIA_AMBIENTDEMENTOR(C_INFO)
{
	nr = 1;
	condition = dia_ambientdementor_condition;
	information = dia_ambientdementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ambientdementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_ambientdementor_info()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	randy = Hlp_Random(4);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		AI_Output(self,other,"DIA_VinoDementor_19_00");	//Have you come to disrupt our ritual? His soul belongs to us. You cannot save him now, magician.
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dragonisle_keymaster))
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_01");	//(laughs) You came in order to challenge me and my work? You are doomed to fail.
			AI_Output(self,other,"DIA_AmbientDementor_19_02");	//No one has ever succeeded in getting past my crypt. Turn back, for you too shall never reach the sacred Halls of Irdorath.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_03");	//You have already come much too far, lowly worm. You shall never reach our inner sanctuary.
			};
			if(randy == 1)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_04");	//Stay where you are. Not another step!
			};
			if(randy == 2)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_05");	//You have come this far, but you cannot get past me.
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_06");	//You came to challenge the Master, but you must get past me first.
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_07");	//Weak little mageling, you will never be able to match the power of the Master.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_08");	//You chose the path of magic to conquer us. A clever move. But even that will do you no good.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_09");	//Even as a magician you cannot stop us.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_10");	//My Master shall destroy you. Your pathetic parlor magic cannot save you.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_11");	//Surrender while you still can. There is no escape for you.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_12");	//Now you shall feel the power of the Master. You cannot elude it.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_13");	//The Master wants your head. No one can save you now.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_14");	//We have caught you in our trap, and now we shall destroy you.
		};
	};
};

func void b_assigndementortalk(var C_NPC slf)
{
	if((slf.guild == GIL_DMT) && (slf.npctype == NPCTYPE_AMBIENT))
	{
		dia_ambientdementor_exit.npc = Hlp_GetInstanceID(slf);
		dia_ambientdementor.npc = Hlp_GetInstanceID(slf);
	};
};

