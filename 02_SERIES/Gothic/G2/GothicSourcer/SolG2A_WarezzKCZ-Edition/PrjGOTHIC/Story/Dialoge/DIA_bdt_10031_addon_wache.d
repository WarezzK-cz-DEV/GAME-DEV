
instance DIA_ADDON_BDT_10031_WACHE_EXIT(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 999;
	condition = dia_addon_10031_wache_exit_condition;
	information = dia_addon_10031_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_10031_wache_exit_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_10031_WACHE_SCATTY(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_scatty_condition;
	information = dia_addon_10031_wache_scatty_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_10031_wache_scatty_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_scatty_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_00");	//Hey, do you want to go digging? Then don't forget to stock up with Scatty.
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Scatty_15_01");	//What do I need then?
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_02");	//Well, at the very least a pickaxe. And some provisions can't hurt.
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Scatty_06_03");	//Or how 'bout some healing potions? There are minecrawlers down there.
	AI_StopProcessInfos(self);
};


var int wache_joker;

instance DIA_ADDON_BDT_10031_WACHE_HI(C_INFO)
{
	npc = bdt_10031_addon_wache;
	nr = 2;
	condition = dia_addon_10031_wache_hi_condition;
	information = dia_addon_10031_wache_hi_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_addon_10031_wache_hi_condition()
{
	return TRUE;
};

func void dia_addon_10031_wache_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10031_Wache_Hi_15_00");	//Everything all right?
	if((SKLAVEN_FLUCHT == TRUE) && (WACHE_JOKER == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_01");	//Boy, oh boy. The slaves sure were in a hurry.
		AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_02");	//When they heard they were free, they ran like rabbits!
		WACHE_JOKER = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_BDT_10031_Wache_Hi_06_03");	//Yeah. So, don't make any trouble and everything will be all right.
};

