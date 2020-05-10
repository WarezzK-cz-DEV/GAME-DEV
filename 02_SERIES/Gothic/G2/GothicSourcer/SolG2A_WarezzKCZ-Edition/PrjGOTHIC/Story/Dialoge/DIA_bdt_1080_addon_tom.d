
instance DIA_ADDON_TOM_EXIT(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 999;
	condition = dia_addon_tom_exit_condition;
	information = dia_addon_tom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_tom_exit_condition()
{
	return TRUE;
};

func void dia_addon_tom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_TOM_PICKPOCKET(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 900;
	condition = dia_addon_tom_pickpocket_condition;
	information = dia_addon_tom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_tom_pickpocket_condition()
{
	return c_beklauen(40,52);
};

func void dia_addon_tom_pickpocket_info()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_BACK,dia_addon_tom_pickpocket_back);
	Info_AddChoice(dia_addon_tom_pickpocket,DIALOG_PICKPOCKET,dia_addon_tom_pickpocket_doit);
};

func void dia_addon_tom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_tom_pickpocket);
};

func void dia_addon_tom_pickpocket_back()
{
	Info_ClearChoices(dia_addon_tom_pickpocket);
};


instance DIA_ADDON_TOM_HI(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 1;
	condition = dia_addon_tom_hi_condition;
	information = dia_addon_tom_hi_info;
	permanent = FALSE;
	description = "Why are you sitting around here?";
};


func int dia_addon_tom_hi_condition()
{
	return TRUE;
};

func void dia_addon_tom_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_00");	//Why are you sitting around here?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_01");	//I've got problems. At the moment, it's better for my health if I'm not seen in the camp.
	AI_Output(other,self,"DIA_Addon_Tom_HI_15_02");	//What's wrong?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_03");	//I had really good relations with some of the pirates, you see?
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_04");	//I was always meeting the boys outside their camp and trading.
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_05");	//Man! I bought stuff for half the camp. 'Tom bring me this - Tom bring me that.'
	AI_Output(self,other,"DIA_Addon_Tom_HI_11_06");	//And then that bastard Esteban got in between.
};


instance DIA_ADDON_TOM_JUAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 2;
	condition = dia_addon_tom_juan_condition;
	information = dia_addon_tom_juan_info;
	permanent = FALSE;
	description = "What happened?";
};


func int dia_addon_tom_juan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_hi))
	{
		return TRUE;
	};
};

func void dia_addon_tom_juan_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Juan_15_00");	//What happened?
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_01");	//Esteban sent Juan - one of his boys. The bastard waylaid us.
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_02");	//I was just about to make a deal with the pirates when he came out of the dark and knocked me down with two blows!
	AI_Output(self,other,"DIA_Addon_Tom_Juan_11_03");	//Man, that guy is fast! But not fast enough. I was able to get away from him.
	SC_KNOWS_JUANMURDEREDANGUS = TRUE;
	b_logentry(TOPIC_ADDON_KILLJUAN,"So Juan is responsible for the murder of Hank and Angus. He lay in wait for the two of them and then killed them.");
};


instance DIA_ADDON_TOM_ESTEBAN(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 3;
	condition = dia_addon_tom_esteban_condition;
	information = dia_addon_tom_esteban_info;
	permanent = FALSE;
	description = "And since the ambush you've been hiding here?";
};


func int dia_addon_tom_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_juan))
	{
		return TRUE;
	};
};

func void dia_addon_tom_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Esteban_15_00");	//And since the ambush you've been hiding here?
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_01");	//First I went back to the camp and let Fisk, Huno and the others know that they could forget their delivery.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_02");	//And that Esteban was behind it.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_03");	//If Esteban finds out that I told the others that HE was responsible, I'm dead.
	AI_Output(self,other,"DIA_Addon_Tom_Esteban_11_04");	//That's why I can't go back to the camp.
	TOM_TELLS = TRUE;
};


instance DIA_ADDON_TOM_DEAD(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 4;
	condition = dia_addon_tom_dead_condition;
	information = dia_addon_tom_dead_info;
	permanent = FALSE;
	description = "Esteban is dead.";
};


func int dia_addon_tom_dead_condition()
{
	if(Npc_IsDead(esteban) && Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_dead_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_00");	//Esteban is dead.
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_01");	//Really? Man, THAT'S lucky!
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_02");	//Who did it?
	AI_Output(other,self,"DIA_Addon_Tom_Dead_15_03");	//(mischieviously) Let's just say, someone you know...
	AI_Output(self,other,"DIA_Addon_Tom_Dead_11_04");	//Thanks for coming to me. Now I can go back to the camp...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"LAGER");
};


instance DIA_ADDON_TOM_PERM(C_INFO)
{
	npc = bdt_1080_addon_tom;
	nr = 5;
	condition = dia_addon_tom_perm_condition;
	information = dia_addon_tom_perm_info;
	permanent = TRUE;
	description = "What else?";
};


func int dia_addon_tom_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_tom_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_tom_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Tom_PERM_15_00");	//What else?
	if(Npc_GetDistToWP(self,"BL_INN_05_B") <= 500)
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_01");	//Now I can down Lucia's booze in peace again.
	}
	else if(Npc_KnowsInfo(other,dia_addon_tom_dead))
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_02");	//Now I can finally show my face in the camp again!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Tom_PERM_11_03");	//Else? Else I'll sit here counting rocks...
	};
};

