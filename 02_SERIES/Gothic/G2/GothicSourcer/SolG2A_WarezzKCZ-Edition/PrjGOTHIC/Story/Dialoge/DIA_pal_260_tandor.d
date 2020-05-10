
instance DIA_TANDOR_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_exit_condition;
	information = dia_tandor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_tandor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_HALLO(C_INFO)
{
	npc = pal_260_tandor;
	nr = 2;
	condition = dia_tandor_hallo_condition;
	information = dia_tandor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tandor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_tandor_hallo_info()
{
	AI_Output(self,other,"DIA_Tandor_Hallo_08_00");	//You came over the pass? Well done. We have already lost a lot of men out there.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_01");	//I know myself what it's like out there - I accompanied a reconnaissance unit for a while.
	AI_Output(self,other,"DIA_Tandor_Hallo_08_02");	//Do you have a weapon? If you need a good weapon, I'm your man.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"Tandor trades in weapons at the castle.");
};


instance DIA_TANDOR_TRUPP(C_INFO)
{
	npc = pal_260_tandor;
	nr = 2;
	condition = dia_tandor_trupp_condition;
	information = dia_tandor_trupp_info;
	permanent = FALSE;
	description = "What became of the unit?";
};


func int dia_tandor_trupp_condition()
{
	if(Npc_KnowsInfo(other,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_trupp_info()
{
	AI_Output(other,self,"DIA_Tandor_Trupp_15_00");	//What became of the unit?
	AI_Output(self,other,"DIA_Tandor_Trupp_08_01");	//We scouted the area and wanted to advance to the coast. We set up our camp in a cave.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_02");	//It was late at night when the orcs came. They charged up the slope with torches and drums - and discovered us.
	AI_Output(self,other,"DIA_Tandor_Trupp_08_03");	//We tried to flee, but I was the only one who got through...
	AI_Output(self,other,"DIA_Tandor_Trupp_08_04");	//Soon after that, the orcs erected their big palisade and we pulled back into the castle.
};


instance DIA_TANDOR_TRADE(C_INFO)
{
	npc = pal_260_tandor;
	nr = 900;
	condition = dia_tandor_trade_condition;
	information = dia_tandor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_tandor_trade_condition()
{
	return TRUE;
};

func void dia_tandor_trade_info()
{
	AI_Output(other,self,"DIA_Tandor_Trade_15_00");	//Show me your wares.
	b_clearbonusfoodinv(self);
	b_givetradeinv(self);
};


instance DIA_TANDOR_EQUIPMENT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 3;
	condition = dia_tandor_equipment_condition;
	information = dia_tandor_equipment_info;
	description = "Garond sent me - I need some gear.";
};


func int dia_tandor_equipment_condition()
{
	if(Npc_KnowsInfo(hero,dia_garond_equipment) && (other.guild == GIL_MIL) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_tandor_equipment_info()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_15_00");	//Garond sent me - I need some gear.
	AI_Output(self,other,"DIA_Tandor_Equipment_08_01");	//Close or long-range combat?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Close combat.",dia_tandor_equipment_nah);
	Info_AddChoice(dia_tandor_equipment,"Long-range combat.",dia_tandor_equipment_fern);
};

func void dia_tandor_equipment_nah()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Nah_15_00");	//Close combat.
	AI_Output(self,other,"DIA_Tandor_Equipment_Nah_08_01");	//One-handed or two-handed fighter?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"One-handed.",dia_tandor_equipment_ein);
	Info_AddChoice(dia_tandor_equipment,"Two-handed.",dia_tandor_equipment_zwei);
};

func void dia_tandor_equipment_fern()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Fern_15_00");	//Long-range combat.
	AI_Output(self,other,"DIA_Tandor_Equipment_Fern_08_01");	//Bow or crossbow?
	Info_ClearChoices(dia_tandor_equipment);
	Info_AddChoice(dia_tandor_equipment,"Bow",dia_tandor_equipment_bow);
	Info_AddChoice(dia_tandor_equipment,"Crossbow",dia_tandor_equipment_crossbow);
};

func void dia_tandor_equipment_ein()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Ein_15_00");	//One-handed.
	AI_Output(self,other,"DIA_Tandor_Equipment_Ein_08_01");	//Then take this stonebreaker. A good weapon.
	b_giveinvitems(self,other,itmw_steinbrecher,1);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_zwei()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Zwei_15_00");	//Two-handed.
	AI_Output(self,other,"DIA_Tandor_Equipment_Zwei_08_01");	//You are well-armed with this two-hander.
	b_giveinvitems(self,other,itmw_zweihaender1,1);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//Bow.
	AI_Output(self,other,"DIA_Tandor_Equipment_Bow_08_01");	//This hunting bow is exactly right for you. And I'll give you some arrows, too.
	b_giveinvitems(self,other,itrw_bow_l_03,1);
	b_giveinvitems(self,other,itrw_arrow,50);
	Info_ClearChoices(dia_tandor_equipment);
};

func void dia_tandor_equipment_crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//Crossbow.
	AI_Output(self,other,"DIA_Tandor_Equipment_Crossbow_08_01");	//Then take this light crossbow. You can also get bolts from me.
	b_giveinvitems(self,other,itrw_crossbow_l_02,1);
	b_giveinvitems(self,other,itrw_bolt,50);
	Info_ClearChoices(dia_tandor_equipment);
};


instance DIA_TANDOR_KAP3_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap3_exit_condition;
	information = dia_tandor_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_tandor_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_KAP4_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap4_exit_condition;
	information = dia_tandor_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_tandor_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_NEWS(C_INFO)
{
	npc = pal_260_tandor;
	nr = 40;
	condition = dia_tandor_news_condition;
	information = dia_tandor_news_info;
	permanent = TRUE;
	description = "Do you have any news?";
};


func int dia_tandor_news_condition()
{
	if((KAPITEL == 4) && Npc_KnowsInfo(hero,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_news_info()
{
	AI_Output(other,self,"DIA_Tandor_News_15_00");	//Do you have any news?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Tandor_News_08_01");	//The only thing that's happened recently is you Dragon hunters coming here.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_News_08_02");	//The Dragon hunters have arrived.
		AI_Output(self,other,"DIA_Tandor_News_08_03");	//They strike me as tough bastards - and I hope they are, because otherwise they won't survive for long.
	};
};


instance DIA_TANDOR_KAP5_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap5_exit_condition;
	information = dia_tandor_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_tandor_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_WASISTLOS(C_INFO)
{
	npc = pal_260_tandor;
	nr = 51;
	condition = dia_tandor_wasistlos_condition;
	information = dia_tandor_wasistlos_info;
	permanent = TRUE;
	description = "That's not a happy face you're making.";
};


func int dia_tandor_wasistlos_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(hero,dia_tandor_hallo))
	{
		return TRUE;
	};
};

func void dia_tandor_wasistlos_info()
{
	AI_Output(other,self,"DIA_Tandor_WASISTLOS_15_00");	//That's not a happy face you're making.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_01");	//The orcs will keep on coming. Until we're all dead.
	}
	else
	{
		AI_Output(self,other,"DIA_Tandor_WASISTLOS_08_02");	//No decent food for weeks. I'm starving.
	};
};


instance DIA_TANDOR_KAP6_EXIT(C_INFO)
{
	npc = pal_260_tandor;
	nr = 999;
	condition = dia_tandor_kap6_exit_condition;
	information = dia_tandor_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tandor_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_tandor_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TANDOR_PICKPOCKET(C_INFO)
{
	npc = pal_260_tandor;
	nr = 900;
	condition = dia_tandor_pickpocket_condition;
	information = dia_tandor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_tandor_pickpocket_condition()
{
	return c_beklauen(47,90);
};

func void dia_tandor_pickpocket_info()
{
	Info_ClearChoices(dia_tandor_pickpocket);
	Info_AddChoice(dia_tandor_pickpocket,DIALOG_BACK,dia_tandor_pickpocket_back);
	Info_AddChoice(dia_tandor_pickpocket,DIALOG_PICKPOCKET,dia_tandor_pickpocket_doit);
};

func void dia_tandor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tandor_pickpocket);
};

func void dia_tandor_pickpocket_back()
{
	Info_ClearChoices(dia_tandor_pickpocket);
};

