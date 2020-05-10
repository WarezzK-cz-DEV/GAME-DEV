
instance DIA_BOLTAN_EXIT(C_INFO)
{
	npc = mil_313_boltan;
	nr = 999;
	condition = dia_boltan_exit_condition;
	information = dia_boltan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V2;
};


func int dia_boltan_exit_condition()
{
	return TRUE;
};

func void dia_boltan_exit_info()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_Weg_15_00");	//I need to get going.
	AI_StopProcessInfos(self);
};


instance DIA_BOLTAN_HALLO(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallo_condition;
	information = dia_boltan_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallo_condition()
{
	return TRUE;
};

func void dia_boltan_hallo_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//What do you want here?
};


instance DIA_BOLTAN_TOCONVICTS(C_INFO)
{
	npc = mil_313_boltan;
	nr = 2;
	condition = dia_boltan_toconvicts_condition;
	information = dia_boltan_toconvicts_info;
	permanent = TRUE;
	description = "I want to see the prisoners.";
};


func int dia_boltan_toconvicts_condition()
{
	return TRUE;
};

func void dia_boltan_toconvicts_info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//I want to see the prisoners.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Yeah, go ahead and say good-bye to your pal.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//We've put away the swine who murdered Lothar the paladin.
		};
	}
	else if((CANTHAR_AUSGELIEFERT == FALSE) && (SARAH_AUSGELIEFERT == FALSE) && (RENGARU_AUSGELIEFERT == FALSE) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//All the cells are empty at the moment.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//All right, mate.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Of course.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Go ahead, but don't stay away too long, understood?
	};
};


instance DIA_BOLTAN_HALLOBENNET(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallobennet_condition;
	information = dia_boltan_hallobennet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallobennet_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_boltan_hallobennet_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//You haven't come to get your buddy out of here, have you?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Forget it! As soon as I raise the alarm, the boys will be here in an instant!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//And then we'll have us some minced mercenary! (dirty laugh)
};


instance DIA_BOLTAN_HALLOCANTHAR(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallocanthar_condition;
	information = dia_boltan_hallocanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallocanthar_condition()
{
	if(((KAPITEL != 3) || ((KAPITEL == 3) && ((MIS_RESCUEBENNET == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (CANTHAR_WIEDERRAUS == TRUE) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_boltan_hallocanthar_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Hey, you're the guy who filed a complaint against Canthar, the merchant.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//Lots of people came here to vouch for him. Well-respected people.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//The matter must have been a misunderstanding. These things happen.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//In future, you should be more careful about who you send to jail.
};

