
instance DIA_GORNOW_EXIT(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 999;
	condition = dia_gornow_exit_condition;
	information = dia_gornow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornow_exit_condition()
{
	return TRUE;
};

func void dia_gornow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNOW_HELLO(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_hello_condition;
	information = dia_gornow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_hello_condition()
{
	return TRUE;
};

func void dia_gornow_hello_info()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Enough of this lounging about - you're free!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//It's about time somebody got me out of here.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//I certainly hadn't expected it to be you, though. It's damn good to see you.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(grins) Garond says you eat too much and he can no longer afford to feed you.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Now that you mention it, I could stand a couple of beers. Let's get out of here, I've seen enough of this cell.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Wait, I've still got something here that you can really use.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//I found this armor here in the cell. Some prisoner must have hidden it here.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//It's too small for me, but it might fit you...
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//Thanks! I'll see you at Milten's...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//OK, see you at Milten's.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Sure thing.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	b_startotherroutine(milten,"GORNFREE");
	MIS_RESCUEGORN = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEGORN);
};


instance DIA_GORNOW_METMILTEN(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_metmilten_condition;
	information = dia_gornow_metmilten_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_metmilten_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_metmilten_info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//Listen - I've loafed around here long enough. It's time I saw something other than this valley.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//How did you get over the pass?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//There is a path through the abandoned mine.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Good. I'll wait for the right moment and then I'm out of here.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//Where will you go then?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//I heard that Lee is still alive. I want to join up with him again.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//Then go to Onar's Farm. Lee and his boys are there. He needs good men such as you.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//I'll do that. I'll go check out how they're doing there.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "We'll meet again.";
};


func int dia_gornow_seeyou_condition()
{
	if(Npc_KnowsInfo(other,dia_gornow_metmilten) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_seeyou_info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//We'll meet again.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//You can count on it.
	AI_StopProcessInfos(self);
};

