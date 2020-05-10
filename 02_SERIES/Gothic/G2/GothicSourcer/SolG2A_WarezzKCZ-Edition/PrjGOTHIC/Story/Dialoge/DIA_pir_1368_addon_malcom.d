
instance DIA_ADDON_MALCOM_EXIT(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 999;
	condition = dia_addon_malcom_exit_condition;
	information = dia_addon_malcom_exit_info;
	permanent = TRUE;
	description = "I need to move on.";
};


func int dia_addon_malcom_exit_condition()
{
	return TRUE;
};

func void dia_addon_malcom_exit_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_perm_15_00");	//I need to move on.
	if(MALCOMBOTSCHAFT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_perm_04_01");	//Don't let those beasts eat you. This is a very dangerous place.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_03");	//Hey! When you get to our camp, give Henry a message from me.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_04");	//The trees around here are damned stubborn.
		AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_05");	//He'll have to wait for his wood a while longer. Tell him that.
		MALCOMBOTSCHAFT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MALCOM_PICKPOCKET(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 900;
	condition = dia_addon_malcom_pickpocket_condition;
	information = dia_addon_malcom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_malcom_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_malcom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_BACK,dia_addon_malcom_pickpocket_back);
	Info_AddChoice(dia_addon_malcom_pickpocket,DIALOG_PICKPOCKET,dia_addon_malcom_pickpocket_doit);
};

func void dia_addon_malcom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};

func void dia_addon_malcom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_malcom_pickpocket);
};


instance DIA_ADDON_MALCOM_HELLO(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 1;
	condition = dia_addon_malcom_hello_condition;
	information = dia_addon_malcom_hello_info;
	important = TRUE;
};


func int dia_addon_malcom_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_01");	//You're not from around here, are you?
	AI_Output(self,other,"DIA_Addon_Malcom_Hello_04_02");	//You seem to have traveled far.
};


instance DIA_ADDON_MALCOM_WASMACHEN(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 2;
	condition = dia_addon_malcom_wasmachen_condition;
	information = dia_addon_malcom_wasmachen_info;
	description = "Busy?";
};


func int dia_addon_malcom_wasmachen_condition()
{
	return TRUE;
};

func void dia_addon_malcom_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_00");	//Busy?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_01");	//Don't even ask. Henry wants me to chop down all the trees here.
	if(henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Malcom_WasMachen_15_02");	//Henry?
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_00");	//He's the leader of our troop.
	};
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_04");	//He's stands around at the camp entrance all the time, talking big.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_05");	//More dedicated service to the community, and all that crap.
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_06");	//But he doesn't lift a finger himself.
};


instance DIA_ADDON_MALCOM_ENTERTRUPP(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 5;
	condition = dia_addon_malcom_entertrupp_condition;
	information = dia_addon_malcom_entertrupp_info;
	description = "Henry is your leader?";
};


func int dia_addon_malcom_entertrupp_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_entertrupp_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Entertrupp_15_00");	//Henry is your leader?
	AI_Output(self,other,"DIA_Addon_Malcom_WasMachen_04_03");	//Yes, the leader of our raiding troop.
	AI_Output(self,other,"DIA_Addon_Malcom_Add_04_01");	//Our CAPTAIN is Greg.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Malcom_Add_04_02");	//But he's not here at the moment.
	};
};


instance DIA_ADDON_MALCOM_LAGER(C_INFO)
{
	npc = pir_1368_addon_malcom;
	nr = 3;
	condition = dia_addon_malcom_lager_condition;
	information = dia_addon_malcom_lager_info;
	description = "Where's your camp?";
};


func int dia_addon_malcom_lager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_malcom_wasmachen))
	{
		return TRUE;
	};
};

func void dia_addon_malcom_lager_info()
{
	AI_Output(other,self,"DIA_Addon_Malcom_Lager_15_00");	//Where's your camp?
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_01");	//Just continue down this path here, to the west.
	AI_Output(self,other,"DIA_Addon_Malcom_Lager_04_02");	//You'll see Henry standing there soon enough.
};

