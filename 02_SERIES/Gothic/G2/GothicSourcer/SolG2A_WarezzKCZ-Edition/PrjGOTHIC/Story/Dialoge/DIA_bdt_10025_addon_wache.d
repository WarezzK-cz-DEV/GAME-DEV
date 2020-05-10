
instance DIA_ADDON_BDT_10025_WACHE_EXIT(C_INFO)
{
	npc = bdt_10025_addon_wache;
	nr = 999;
	condition = dia_addon_10025_wache_exit_condition;
	information = dia_addon_10025_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10025_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10025_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10025_WACHE_HI(C_INFO)
{
	npc = bdt_10025_addon_wache;
	nr = 2;
	condition = dia_addon_10025_wache_hi_condition;
	information = dia_addon_10025_wache_hi_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_10025_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10025_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10025_Wache_Hi_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_BDT_10025_Wache_Hi_07_01");	//I'm cooking a delicious stew for the diggers and guards.
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10025_Wache_Hi_07_02");	//But the slaves - they don't get anything. Some stale water and old bread, at the most.
		AI_Output(self,other,"DIA_Addon_BDT_10025_Wache_Hi_07_03");	//That won't hurt those city boys.
	};
};

