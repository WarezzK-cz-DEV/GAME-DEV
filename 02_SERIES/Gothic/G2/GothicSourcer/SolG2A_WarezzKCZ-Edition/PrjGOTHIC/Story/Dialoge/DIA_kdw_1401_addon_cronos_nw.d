
instance DIA_ADDON_CRONOS_EXIT(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 999;
	condition = dia_addon_cronos_exit_condition;
	information = dia_addon_cronos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cronos_exit_condition()
{
	return TRUE;
};

func void dia_addon_cronos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRONOS_HALLO(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_hallo_condition;
	information = dia_addon_cronos_hallo_info;
	description = "May I bother you for a moment?";
};


func int dia_addon_cronos_hallo_condition()
{
	return TRUE;
};

func void dia_addon_cronos_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Hallo_15_00");	//May I bother you for a moment?
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_01");	//(surprised) It's YOU. I never thought I would see your face again.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_02");	//It's very brave of you to show up here. There was a time we would have skinned you alive.
	AI_Output(self,other,"DIA_Addon_Cronos_Hallo_04_03");	//You can be glad that was a few weeks ago and we've all calmed down.
};


instance DIA_ADDON_CRONOS_WASMACHSTDU(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_wasmachstdu_condition;
	information = dia_addon_cronos_wasmachstdu_info;
	description = "What are you doing here?";
};


func int dia_addon_cronos_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WasMachstdu_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_01");	//(confused) My task is to find out more about the guardians of the temple.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_02");	//That is a tough nut, let me tell you. These stone sentinels have a characteristic that is utterly foreign to me.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_03");	//One moment they're standing around completely lifeless and the next they're attacking you like they're possessed.
	AI_Output(self,other,"DIA_Addon_Cronos_WasMachstdu_04_04");	//I still haven't been able to determine their driving power, but one thing is sure. It is of magical origin.
};


instance DIA_ADDON_CRONOS_WAECHTER(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_waechter_condition;
	information = dia_addon_cronos_waechter_info;
	description = "Tell me more about these stone sentinels.";
};


func int dia_addon_cronos_waechter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_waechter_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_Waechter_15_00");	//Tell me more about these stone sentinels.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_01");	//(confused) I can't tell you much so far. Unfortunately, we have had to destroy them. Now they aren't dangerous.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_02");	//When we came here, they attacked us.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_03");	//We could only defeat them with our combined power, and I'm afraid there are even more waiting for us behind the portal.
	AI_Output(self,other,"DIA_Addon_Cronos_Waechter_04_04");	//There must be a way to banish their driving force, so that they remain nothing more than statues.
};


instance DIA_ADDON_CRONOS_NW_TRADE(C_INFO)
{
	npc = kdw_1401_addon_cronos_nw;
	nr = 5;
	condition = dia_addon_cronos_nw_trade_condition;
	information = dia_addon_cronos_nw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "Can you sell me some equipment?";
};


func int dia_addon_cronos_nw_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_cronos_wasmachstdu))
	{
		return TRUE;
	};
};


var int dia_addon_cronos_nw_trade_onetime;

func void dia_addon_cronos_nw_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_NW_Trade_15_00");	//Can you sell me some equipment?
	b_givetradeinv(self);
	if(DIA_ADDON_CRONOS_NW_TRADE_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Why not? If I remember correctly, we've already done business.
		DIA_ADDON_CRONOS_NW_TRADE_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_02");	//Tell me what you need.
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_CRONOSTRADE);
};

