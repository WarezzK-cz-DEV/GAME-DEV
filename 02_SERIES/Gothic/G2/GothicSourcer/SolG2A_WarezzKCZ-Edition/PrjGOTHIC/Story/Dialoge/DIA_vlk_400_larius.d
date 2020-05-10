
instance DIA_LARIUS_EXIT(C_INFO)
{
	npc = vlk_400_larius;
	nr = 999;
	condition = dia_larius_exit_condition;
	information = dia_larius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_larius_exit_condition()
{
	return TRUE;
};

func void dia_larius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_HELLO(C_INFO)
{
	npc = vlk_400_larius;
	nr = 1;
	condition = dia_larius_hello_condition;
	information = dia_larius_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_larius_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_larius_hello_info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//What's your business here? If you want something, make an appointment.
};


instance DIA_LARIUS_WHOAREYOU(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_whoareyou_condition;
	information = dia_larius_whoareyou_info;
	permanent = FALSE;
	description = "Who are you?";
};


func int dia_larius_whoareyou_condition()
{
	return TRUE;
};

func void dia_larius_whoareyou_info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//I am Larius, the local governor.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Even if it may not seem so at the moment, I am the most powerful man in the city.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//So you're in charge here?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//I... well... at the moment my hands are tied.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//That Lord Hagen is in command here, for as long as he is in the city at any rate.
};


instance DIA_LARIUS_DISTURB(C_INFO)
{
	npc = vlk_400_larius;
	nr = 3;
	condition = dia_larius_disturb_condition;
	information = dia_larius_disturb_info;
	permanent = TRUE;
	description = "I didn't mean to intrude.";
};


func int dia_larius_disturb_condition()
{
	return TRUE;
};

func void dia_larius_disturb_info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//I didn't mean to intrude.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//You have failed utterly at that. So go away!
};


instance DIA_LARIUS_DIELAGE(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_dielage_condition;
	information = dia_larius_dielage_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_larius_dielage_condition()
{
	return TRUE;
};

func void dia_larius_dielage_info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//What business is it of yours? As long as the paladins are in the city, Lord Hagen takes care of all the affairs that concern the city.
};


instance DIA_LARIUS_RICHTERUEBERFALL(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_richterueberfall_condition;
	information = dia_larius_richterueberfall_info;
	description = "The judge hired some thugs to assault you.";
};


func int dia_larius_richterueberfall_condition()
{
	if(SCKNOWSRICHTERKOMPROBRIEF == TRUE)
	{
		return TRUE;
	};
};

func void dia_larius_richterueberfall_info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//The judge hired some thugs to assault you. I can prove it.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Don't talk such nonsense, or do you want me to have you put in chains?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Even if you are a warrior of Innos...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Even if you are an ordained magician...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//My word still has weight in this city. Do not dare to sully the honorable name of the judge ever again!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_400_larius;
	nr = 900;
	condition = dia_larius_pickpocket_condition;
	information = dia_larius_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_larius_pickpocket_condition()
{
	return c_beklauen(35,120);
};

func void dia_larius_pickpocket_info()
{
	Info_ClearChoices(dia_larius_pickpocket);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_BACK,dia_larius_pickpocket_back);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_PICKPOCKET,dia_larius_pickpocket_doit);
};

func void dia_larius_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_larius_pickpocket);
};

func void dia_larius_pickpocket_back()
{
	Info_ClearChoices(dia_larius_pickpocket);
};

