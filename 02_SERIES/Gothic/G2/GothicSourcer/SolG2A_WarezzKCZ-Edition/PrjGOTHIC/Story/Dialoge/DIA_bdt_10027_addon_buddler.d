
instance DIA_ADDON_BDT_10027_BUDDLER_EXIT(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 999;
	condition = dia_addon_10027_buddler_exit_condition;
	information = dia_addon_10027_buddler_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10027_buddler_exit_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10027_BUDDLER_HI(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 2;
	condition = dia_addon_10027_buddler_hi_condition;
	information = dia_addon_10027_buddler_hi_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_addon_10027_buddler_hi_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10027_Buddler_Hi_15_00");	//How's it going?
	if(SKLAVEN_FLUCHT == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_01");	//I slaved away for the ore barons long enough. It's good that someone else is digging now.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BDT_10027_Buddler_Hi_11_02");	//Damn. Now we'll have to go back to digging ourselves, huh?
	};
};


instance DIA_ADDON_10027_BUDDLER_HACKEN(C_INFO)
{
	npc = bdt_10027_addon_buddler;
	nr = 3;
	condition = dia_addon_10027_buddler_hacken_condition;
	information = dia_addon_10027_buddler_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_10027_buddler_hacken_condition()
{
	return TRUE;
};

func void dia_addon_10027_buddler_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_00");	//Brain work, boy. Mining gold is a purely mental procedure. Don't try to force the rock - it's harder than you.
	AI_Output(self,other,"DIA_Addon_10027_Buddler_Hacken_11_01");	//Free your mind of everything - and try to become one with the gold. Then it is like meditation, a prayer.
	b_upgrade_hero_hackchance(10);
};

