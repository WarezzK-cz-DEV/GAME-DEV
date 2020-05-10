
instance DIA_PAL_270_EXIT(C_INFO)
{
	npc = pal_270_ritter;
	nr = 999;
	condition = dia_pal_270_exit_condition;
	information = dia_pal_270_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_270_exit_condition()
{
	return TRUE;
};

func void dia_pal_270_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RITTER_OUT(C_INFO)
{
	npc = pal_270_ritter;
	condition = dia_ritter_out_condition;
	information = dia_ritter_out_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_ritter_out_noperm;

func int dia_ritter_out_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ritter_out_info()
{
	if(DIA_RITTER_OUT_NOPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_00");	//You've come from Khorinis, haven't you? When all this is over, I shall return there.
		DIA_RITTER_OUT_NOPERM = TRUE;
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_01");	//It's a great comfort having you on our side, Sir.
	}
	else
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_02");	//We're going to make it. We'll bring the ore to Khorinis and let them celebrate us!
	};
};

