
instance DIA_ADDON_MYXIR_CITY_EXIT(C_INFO)
{
	npc = kdw_140300_addon_myxir_city;
	nr = 999;
	condition = dia_addon_myxir_city_exit_condition;
	information = dia_addon_myxir_city_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_city_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_city_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_CITY_HELLOCITY(C_INFO)
{
	npc = kdw_140300_addon_myxir_city;
	nr = 5;
	condition = dia_addon_myxir_city_hellocity_condition;
	information = dia_addon_myxir_city_hellocity_info;
	permanent = TRUE;
	description = "Will you stay in the city now?";
};


func int dia_addon_myxir_city_hellocity_condition()
{
	return TRUE;
};


var int dia_addon_myxir_city_hellocity_onetime;

func void dia_addon_myxir_city_hellocity_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_00");	//Will you stay in the city now?
	AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_01");	//One of us has to be HERE if Vatras leaves the city.
	VATRASABLOESEISTDA = TRUE;
	if((RAVENISDEAD == TRUE) && (DIA_ADDON_MYXIR_CITY_HELLOCITY_ONETIME == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_02");	//One more thing I wanted to say to you.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_03");	//That really was a heroic feat that you accomplished in Jharkendar.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_04");	//Unfortunately, I'm still not finished with my tasks here in Khorinis.
		AI_Output(self,other,"DIA_Addon_Myxir_CITY_HelloCITY_12_05");	//True, but I am sure that you will master them as well, Preserver.
		AI_Output(other,self,"DIA_Addon_Myxir_CITY_HelloCITY_15_06");	//We'll see.
		DIA_ADDON_MYXIR_CITY_HELLOCITY_ONETIME = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_ADDON_MYXIR_CITY_TEACH(C_INFO)
{
	npc = kdw_140300_addon_myxir_city;
	nr = 90;
	condition = dia_addon_myxir_city_teach_condition;
	information = dia_addon_myxir_city_teach_info;
	permanent = TRUE;
	description = "Teach me that language.";
};


var int dia_addon_myxir_city_teach_noperm;
var int dia_addon_myxir_city_teach_onetime;

func int dia_addon_myxir_city_teach_condition()
{
	if((DIA_ADDON_MYXIR_CITY_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_city_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Teach me that language.
	if(KNOW_FOREIGNLANGUAGE == FALSE)
	{
		b_dia_addon_myxir_teach_fl();
		b_dia_addon_myxir_teach_language_x();
		AI_PrintScreen("Learn language of the builders",-1,-1,FONT_SCREENBRIGHTLARGE,3);
		Info_ClearChoices(dia_addon_myxir_city_teach);
		KNOW_FOREIGNLANGUAGE = TRUE;
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_CITY_TEACH_NOPERM = TRUE;
	};
};

