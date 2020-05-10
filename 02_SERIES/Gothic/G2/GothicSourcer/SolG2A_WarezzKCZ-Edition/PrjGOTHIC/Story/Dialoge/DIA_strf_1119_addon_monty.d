
instance DIA_ADDON_MONTY_EXIT(C_INFO)
{
	npc = strf_1119_addon_monty;
	nr = 999;
	condition = dia_addon_monty_exit_condition;
	information = dia_addon_monty_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_monty_exit_condition()
{
	return TRUE;
};

func void dia_addon_monty_exit_info()
{
	AI_StopProcessInfos(self);
};


var int monty_einmal;

instance DIA_ADDON_MONTY_HI(C_INFO)
{
	npc = strf_1119_addon_monty;
	nr = 2;
	condition = dia_addon_monty_hi_condition;
	information = dia_addon_monty_hi_info;
	permanent = FALSE;
	description = "Hey, how's it going?";
};


func int dia_addon_monty_hi_condition()
{
	return TRUE;
};

func void dia_addon_monty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Monty_Hi_15_00");	//Hey, how's it going?
	AI_Output(self,other,"DIA_Addon_Monty_Hi_08_01");	//I'm alive - that's all I care about.
	if(MONTY_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Monty_Hi_08_02");	//If you've got something to discuss, Patrick's your man.
		MONTY_EINMAL = TRUE;
	};
};


instance DIA_ADDON_MONTY_HACKEN(C_INFO)
{
	npc = strf_1119_addon_monty;
	nr = 2;
	condition = dia_addon_monty_hacken_condition;
	information = dia_addon_monty_hacken_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_monty_hacken_condition()
{
	return TRUE;
};

func void dia_addon_monty_hacken_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_00");	//Well, the angle at which you strike is crucial for efficient mining.
	AI_Output(self,other,"DIA_Addon_Monty_Hacken_08_01");	//Not too flat and not too steep, that way you'll get at the nuggets and make your pick hold up forever.
	b_upgrade_hero_hackchance(5);
};

