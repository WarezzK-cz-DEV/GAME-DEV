
instance DIA_ADDON_OWEN_EXIT(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 999;
	condition = dia_addon_owen_exit_condition;
	information = dia_addon_owen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_owen_exit_condition()
{
	return TRUE;
};

func void dia_addon_owen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_OWEN_PICKPOCKET(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 900;
	condition = dia_addon_owen_pickpocket_condition;
	information = dia_addon_owen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_owen_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_addon_owen_pickpocket_info()
{
	Info_ClearChoices(dia_addon_owen_pickpocket);
	Info_AddChoice(dia_addon_owen_pickpocket,DIALOG_BACK,dia_addon_owen_pickpocket_back);
	Info_AddChoice(dia_addon_owen_pickpocket,DIALOG_PICKPOCKET,dia_addon_owen_pickpocket_doit);
};

func void dia_addon_owen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_owen_pickpocket);
};

func void dia_addon_owen_pickpocket_back()
{
	Info_ClearChoices(dia_addon_owen_pickpocket);
};


instance DIA_ADDON_OWEN_HELLO(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 1;
	condition = dia_addon_owen_hello_condition;
	information = dia_addon_owen_hello_info;
	important = TRUE;
};


func int dia_addon_owen_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_owen_hello_info()
{
	var C_ITEM itm;
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_00");	//How's it look?
	AI_Output(self,other,"DIA_Addon_Owen_Hello_13_01");	//Who are YOU? Are you one of the bandits?
	AI_Output(other,self,"DIA_Addon_Owen_Hello_15_02");	//Do I look like one?
	itm = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(itm,itar_pir_m_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_l_addon) == TRUE) || (Hlp_IsItem(itm,itar_pir_h_addon) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_03");	//You're wearing our clothes, but I don't know you.
	}
	else if((Hlp_IsItem(itm,itar_bdt_m) == TRUE) || (Hlp_IsItem(itm,itar_bdt_h) == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_04");	//To be honest, you do.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Hello_13_05");	//No. Judging from your clothes, you've come a long way.
	};
};


instance DIA_ADDON_OWEN_WASMACHEN(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_wasmachen_condition;
	information = dia_addon_owen_wasmachen_info;
	description = "What are you doing here?";
};


func int dia_addon_owen_wasmachen_condition()
{
	if(MALCOM_ACCIDENT == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_owen_wasmachen_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_WasMachen_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_01");	//I'm cutting wood for our camp.
	AI_Output(self,other,"DIA_Addon_Owen_WasMachen_13_02");	//I'm slaving away here, almost breaking my back, and back in camp they're all lounging in the sun.
};


instance DIA_ADDON_OWEN_PERM(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 99;
	condition = dia_addon_owen_perm_condition;
	information = dia_addon_owen_perm_info;
	permanent = TRUE;
	description = "And?";
};


func int dia_addon_owen_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_wasmachen) || Npc_KnowsInfo(other,dia_addon_owen_malcomstunt))
	{
		return TRUE;
	};
};

func void dia_addon_owen_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Perm_15_00");	//And?
	AI_Output(self,other,"DIA_Addon_Owen_Perm_13_01");	//If I had known all this in advance, I'd never have become a pirate.
};


instance DIA_ADDON_OWEN_HENRY(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_henry_condition;
	information = dia_addon_owen_henry_info;
	permanent = TRUE;
	description = "Henry is waiting for the wood he needs for the palisade.";
};


func int dia_addon_owen_henry_condition()
{
	if((MIS_HENRY_HOLOWEN == LOG_RUNNING) && (OWEN_COMESTOHENRY == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_owen_henry_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_Henry_15_00");	//Henry is waiting for the wood he needs for the palisade.
	if(MIS_OWEN_FINDMALCOM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_01");	//First I want to find out what has happened to my buddy Malcolm.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_02");	//Look, relax. I'll bring him that stupid wood sooner or later.
		AI_Output(self,other,"DIA_Addon_Owen_Henry_13_03");	//Go and tell him that.
		b_logentry(TOPIC_ADDON_HOLOWEN,"I am supposed to tell Henry that Owen will deliver the wood.");
		AI_StopProcessInfos(self);
		OWEN_COMESTOHENRY = TRUE;
	};
};


instance DIA_ADDON_OWEN_MALCOMSTUNT(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 1;
	condition = dia_addon_owen_malcomstunt_condition;
	information = dia_addon_owen_malcomstunt_info;
	description = "What's up?";
};


func int dia_addon_owen_malcomstunt_condition()
{
	if(MALCOM_ACCIDENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_owen_malcomstunt_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomStunt_15_00");	//What's up?
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_01");	//My buddy Malcolm has disappeared.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_02");	//One of those filthy lurkers attacked us.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_03");	//So we fled into this cave.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_04");	//But that lurker came after us.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_05");	//Malcolm fought with it, and then they both fell into that hole over there.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_06");	//Seems to be full of water.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_07");	//The lurker and Malcolm continued to fight down there for a while. Then it went quiet.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomStunt_13_08");	//I've no idea whether he's still alive or not.
	Log_CreateTopic(TOPIC_ADDON_MALCOMSSTUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MALCOMSSTUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"Owen wants to know if his friend Malcom is still alive. He fell together with a lurker into the deep hole near the campfire.");
	Log_AddEntry(TOPIC_ADDON_MALCOMSSTUNT,"Owen said that there is water down there and that Malcom was alive at first. But after a while everything was quiet.");
	MIS_OWEN_FINDMALCOM = LOG_RUNNING;
};


instance DIA_ADDON_OWEN_RUNTER(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 2;
	condition = dia_addon_owen_runter_condition;
	information = dia_addon_owen_runter_info;
	description = "How do I get down into that crevice?";
};


func int dia_addon_owen_runter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_malcomstunt) && (MIS_OWEN_FINDMALCOM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_owen_runter_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_runter_15_00");	//How do I get down into that crevice?
	AI_Output(self,other,"DIA_Addon_Owen_runter_13_01");	//Beats me. You can either climb down or jump, I suppose.
};


instance DIA_ADDON_OWEN_MALCOMDEAD(C_INFO)
{
	npc = pir_1367_addon_owen;
	nr = 3;
	condition = dia_addon_owen_malcomdead_condition;
	information = dia_addon_owen_malcomdead_info;
	description = "Your pal Malcolm is dead.";
};


func int dia_addon_owen_malcomdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_owen_malcomstunt) && (MIS_OWEN_FINDMALCOM == LOG_RUNNING) && Npc_IsDead(secretcavelurker1) && Npc_IsDead(secretcavelurker2))
	{
		return TRUE;
	};
};

func void dia_addon_owen_malcomdead_info()
{
	AI_Output(other,self,"DIA_Addon_Owen_MalcomDead_15_00");	//Your pal Malcolm is dead.
	AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_01");	//I thought as much. Poor devil. I should have helped him after all.
	if(SC_MADESTUNT == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_02");	//You're really brave, you know that?
		AI_Output(self,other,"DIA_Addon_Owen_MalcomDead_13_03");	//I couldn't have done that with the crevice.
	};
	b_logentry(TOPIC_ADDON_MALCOMSSTUNT,"I have given Owen the news about Malcom's death. He took it very calmly.");
	MIS_OWEN_FINDMALCOM = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_OWEN_MALCOMDEAD);
};

