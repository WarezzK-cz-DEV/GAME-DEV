
instance DIA_ADDON_BDT_10026_WACHE_EXIT(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 999;
	condition = dia_addon_10026_wache_exit_condition;
	information = dia_addon_10026_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10026_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10026_WACHE_HI(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 99;
	condition = dia_addon_10026_wache_hi_condition;
	information = dia_addon_10026_wache_hi_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_10026_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Hi_15_00");	//How's it going?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		CreateInvItems(self,itfo_bacon,1);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_01");	//It's too bad that we still have so few slaves. We'll have to get some new ones soon.
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_02");	//These guys are totally done in. Probably because they get so little to eat. (laughs)
		b_useitem(self,itfo_bacon);
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_03");	//But I'd rather send the diggers back to work than give these dogs a piece of meat.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Hi_13_04");	//The slaves are gone - too bad. Well, then we'll just have to pound on the diggers again.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10026_WACHE_GRUFT(C_INFO)
{
	npc = bdt_10026_addon_wache;
	nr = 2;
	condition = dia_addon_10026_wache_gruft_condition;
	information = dia_addon_10026_wache_gruft_info;
	permanent = TRUE;
	description = "Do you know anything about the tomb?";
};


func int dia_addon_10026_wache_gruft_condition()
{
	return TRUE;
};

func void dia_addon_10026_wache_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10026_Wache_Gruft_15_00");	//Do you know anything about the tomb?
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_01");	//Yes. The tomb is behind this passage.
	AI_Output(self,other,"DIA_Addon_BDT_10026_Wache_Gruft_13_02");	//(unmoved) Just follow the bodies and you'll find it.
};

