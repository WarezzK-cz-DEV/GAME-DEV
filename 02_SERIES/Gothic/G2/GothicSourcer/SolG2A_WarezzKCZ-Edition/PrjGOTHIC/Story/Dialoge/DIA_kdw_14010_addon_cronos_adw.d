
instance DIA_ADDON_CRONOS_ADW_EXIT(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 999;
	condition = dia_addon_cronos_adw_exit_condition;
	information = dia_addon_cronos_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_cronos_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_cronos_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRONOS_ADWHELLO(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 1;
	condition = dia_addon_cronos_adwhello_condition;
	information = dia_addon_cronos_adwhello_info;
	important = TRUE;
};


func int dia_addon_cronos_adwhello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adwhello_info()
{
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_00");	//Nice to see you. We feared the worst.
	AI_Output(other,self,"DIA_Addon_Cronos_ADWHello_15_01");	//It wasn't all that bad. How's it going?
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_02");	//This is a very dangerous region here.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_03");	//Some of the animals in the area have never been seen by anyone before us.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_04");	//Close by there is a large swamp that managed to grow for several hundred years without anyone noticing.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_05");	//Not a day goes by that we aren't attacked by the beasts from the swamp.
	AI_Output(self,other,"DIA_Addon_Cronos_ADWHello_04_06");	//I advise you to be careful if you go for a stroll here.
};


instance DIA_ADDON_CRONOS_WAECHTERADW(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 5;
	condition = dia_addon_cronos_waechteradw_condition;
	information = dia_addon_cronos_waechteradw_info;
	description = "Is there anything new about the stone sentinels?";
};


func int dia_addon_cronos_waechteradw_condition()
{
	return TRUE;
};

func void dia_addon_cronos_waechteradw_info()
{
	AI_Output(other,self,"DIA_Addon_Cronos_WaechterADW_15_00");	//Is there anything new about the stone sentinels?
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_01");	//We have already managed to eliminate some of them.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_02");	//They stand there, paralyzed like pillars of salt, and don't budge.
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_03");	//But appearances deceive. If you get too close, they'll attack you!
	AI_Output(self,other,"DIA_Addon_Cronos_WaechterADW_04_04");	//There's no doubt that the source of their power can be found here somewhere.
};


instance DIA_ADDON_CRONOS_ADW_TRADE(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 99;
	condition = dia_addon_cronos_adw_trade_condition;
	information = dia_addon_cronos_adw_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = DIALOG_TRADE_V1;
};


func int dia_addon_cronos_adw_trade_condition()
{
	return TRUE;
};


var int dia_addon_cronos_adw_trade_onetime;

func void dia_addon_cronos_adw_trade_info()
{
	b_givetradeinv(self);
	b_say(other,self,"$TRADE_1");
};


var int cronos_armorperm;

instance DIA_ADDON_CRONOS_ADW_ARMOR(C_INFO)
{
	npc = kdw_14010_addon_cronos_adw;
	nr = 98;
	condition = dia_addon_cronos_adw_armor_condition;
	information = dia_addon_cronos_adw_armor_info;
	permanent = TRUE;
	description = "I need a better armor.";
};


func int dia_addon_cronos_adw_armor_condition()
{
	if((hero.guild == GIL_KDF) && (CRONOS_ARMORPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_cronos_adw_armor_info()
{
	AI_Output(other,self,"DIA_Addon_Huno_Armor_15_00");	//I need better armor.
	Info_AddChoice(dia_addon_cronos_adw_armor,DIALOG_BACK,dia_addon_cronos_adw_armor_back);
	Info_AddChoice(dia_addon_cronos_adw_armor,"Buy water mage's robe. Protection: B.+40/B.+60/P.+20/Df.+40/M.+80 (3200 gold)",dia_addon_cronos_adw_armor_buy);
};

func void dia_addon_cronos_adw_armor_buy()
{
	if(b_giveinvitems(other,self,itmi_gold,3200))
	{
		AI_Output(other,self,"DIA_Addon_Huno_Armor_Buy_15_00");	//Okay, I'll take the armor.
		AI_Output(self,other,"DIA_Addon_Cronos_NW_Trade_04_01");	//Why not? If I remember correctly, we've already done business.
		CreateInvItems(other,itar_kdw_h,1);
		AI_EquipArmor(other,itar_kdw_h);
		CRONOS_ARMORPERM = TRUE;
	}
	else
	{
		AI_PrintScreen(PRINT_NOTENOUGHGOLD,-1,52,FONT_SCREENBRIGHTLARGE,2);
	};
	Info_ClearChoices(dia_addon_cronos_adw_armor);
};

func void dia_addon_cronos_adw_armor_back()
{
	Info_ClearChoices(dia_addon_cronos_adw_armor);
};

