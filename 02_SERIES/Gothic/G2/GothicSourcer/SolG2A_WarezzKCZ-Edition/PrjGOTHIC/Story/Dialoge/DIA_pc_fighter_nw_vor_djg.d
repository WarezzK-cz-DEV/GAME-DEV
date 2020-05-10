
instance DIA_GORNNW_KAP3_EXIT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 999;
	condition = dia_gornnw_kap3_exit_condition;
	information = dia_gornnw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_kap3_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_HALLO(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_hallo_condition;
	information = dia_gornnw_hallo_info;
	permanent = FALSE;
	description = "Everything all right with you?";
};


func int dia_gornnw_hallo_condition()
{
	return TRUE;
};

func void dia_gornnw_hallo_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//Everything all right with you?
	if(MIS_RESCUEGORN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//You saved my ass, man.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//I'll never forget that.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//Milten got me out.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//I'll never forget that.
	};
};


instance DIA_GORNNW_WHATNEXT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_whatnext_condition;
	information = dia_gornnw_whatnext_info;
	permanent = TRUE;
	description = "What are your plans now?";
};


func int dia_gornnw_whatnext_condition()
{
	return TRUE;
};

func void dia_gornnw_whatnext_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//What do you want to do now?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//I think I'll load up on grub first.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//And then?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//Who knows... Maybe I'll go back to the mining colony.
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//Someone should keep an eye on the orcs - otherwise they'll all show up on the doorstep without warning.
};

