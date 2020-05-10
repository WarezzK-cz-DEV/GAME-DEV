
instance DIA_PAL_269_EXIT(C_INFO)
{
	npc = pal_269_ritter;
	nr = 999;
	condition = dia_pal_269_exit_condition;
	information = dia_pal_269_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_269_exit_condition()
{
	return TRUE;
};

func void dia_pal_269_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RITTER_HERO(C_INFO)
{
	npc = pal_269_ritter;
	condition = dia_pal_269_hero_condition;
	information = dia_pal_269_hero_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pal_269_hero_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};


var int dia_ritter_hero_noperm;

func void dia_pal_269_hero_info()
{
	AI_Output(self,other,"DIA_Ritter_HERO_04_00");	//Your appearance here is a sign for all of us. We all draw new courage from it.
	if(DIA_RITTER_HERO_NOPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_HERO_04_01");	//We know that our lads in the city have not forgotten us. The Eye of Innos watches over us.
		AI_Output(self,other,"DIA_Ritter_HERO_04_02");	//And if the orcs and dragons storm the gates, we shall meet them upright, to victory or death.
		DIA_RITTER_HERO_NOPERM = TRUE;
	};
};

