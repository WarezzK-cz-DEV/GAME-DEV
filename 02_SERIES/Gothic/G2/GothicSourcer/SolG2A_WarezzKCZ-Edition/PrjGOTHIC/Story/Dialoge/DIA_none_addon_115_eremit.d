
instance DIA_ADDON_EREMIT_EXIT(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 999;
	condition = dia_addon_eremit_exit_condition;
	information = dia_addon_eremit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_eremit_exit_condition()
{
	return TRUE;
};

func void dia_addon_eremit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EREMIT_HELLO(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 1;
	condition = dia_addon_eremit_hello_condition;
	information = dia_addon_eremit_hello_info;
	important = TRUE;
};


func int dia_addon_eremit_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_00");	//(amazed) What are you doing here?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_00");	//What am I doing here?! What the hell are YOU doing here?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_01");	//I came to the remotest spot on the island because I finally wanted some peace!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_02");	//Civil war, bandit raids, hordes of orcs outside my door...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_03");	//That just wasn't my thing. I've retired from that madness.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_04");	//There may be orcs here, but not very many.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_05");	//And other PEOPLE - thank Innos - never show up here. (grumpily) Until today.
};


instance DIA_ADDON_EREMIT_SEEKTAFELN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 2;
	condition = dia_addon_eremit_seektafeln_condition;
	information = dia_addon_eremit_seektafeln_info;
	description = "I am looking for some stone tablets...";
};


func int dia_addon_eremit_seektafeln_condition()
{
	return TRUE;
};

func void dia_addon_eremit_seektafeln_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_02");	//I am searching for stone tablets. You wouldn't happen to have found any?
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_06");	//(carefully) Yes... But I'm keeping them!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_07");	//They're the only thing there is to read around here.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_08");	//I may not understand all of it yet, but I've been able to decipher some of the texts.
};


var int eremit_teach_once;

instance DIA_ADDON_EREMIT_TEACH(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 3;
	condition = dia_addon_eremit_teach_condition;
	information = dia_addon_eremit_teach_info;
	permanent = TRUE;
	description = "About the stone tablets...";
};


func int dia_addon_eremit_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_eremit_seektafeln) && (EREMIT_TEACH_ONCE == FALSE) && (KNOW_FOREIGNLANGUAGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_eremit_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_03");	//About the stone tablets...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_25");	//Shall I teach you to read them?
	if(MIS_EREMIT_KLAMOTTEN != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_26");	//(hastily) But you won't get mine! You'll have to find your own!
	};
	Info_ClearChoices(dia_addon_eremit_teach);
	if(KNOW_FOREIGNLANGUAGE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_27");	//Well, it's quite simple. A G is an O, a T is an H and an I is a C.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_28");	//If you understand that, the rest is quite logical...
		AI_PrintScreen("Learn language of the builders",-1,-1,FONT_SCREENBRIGHTLARGE,3);
		Info_ClearChoices(dia_addon_eremit_teach);
		EREMIT_TEACH_ONCE = TRUE;
		KNOW_FOREIGNLANGUAGE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_29");	//I don't think there is any more I can teach you about that.
		EREMIT_TEACH_ONCE = TRUE;
	};
};


instance DIA_ADDON_EREMIT_KLAMOTTEN(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 4;
	condition = dia_addon_eremit_klamotten_condition;
	information = dia_addon_eremit_klamotten_info;
	permanent = TRUE;
	description = "I have some clothes for you...";
};


func int dia_addon_eremit_klamotten_condition()
{
	if(MIS_EREMIT_KLAMOTTEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_eremit_klamotten_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_01");	//I have some clothes for you...
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_19");	//Really? Show me, let's see if they fit!
	Info_ClearChoices(dia_addon_eremit_klamotten);
	Info_AddChoice(dia_addon_eremit_klamotten,DIALOG_BACK,dia_addon_eremit_klamotten_back);
	if(Npc_HasItems(other,itar_pir_l_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give pirate clothes",dia_addon_eremit_klamotten_pir_l);
	};
	if(Npc_HasItems(other,itar_pir_m_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give pirate armor",dia_addon_eremit_klamotten_pir_m);
	};
	if(Npc_HasItems(other,itar_pir_h_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give pirate captain's armor",dia_addon_eremit_klamotten_pir_h);
	};
	if(Npc_HasItems(other,itar_ranger_addon) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give armor of the 'Ring of Water'",dia_addon_eremit_klamotten_ranger);
	};
	if(Npc_HasItems(other,itar_governor) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give governor's doublet",dia_addon_eremit_klamotten_governor);
	};
	if(Npc_HasItems(other,itar_smith) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give smith's apron",dia_addon_eremit_klamotten_smith);
	};
	if(Npc_HasItems(other,itar_barkeeper) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give barkeeper's apron",dia_addon_eremit_klamotten_barkeeper);
	};
	if(Npc_HasItems(other,itar_vlk_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give citizen's clothing",dia_addon_eremit_klamotten_vlk_l);
	};
	if(Npc_HasItems(other,itar_vlk_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give merchant's clothing",dia_addon_eremit_klamotten_vlk_m);
	};
	if(Npc_HasItems(other,itar_vlk_h) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give wealthy citizen's clothing",dia_addon_eremit_klamotten_vlk_h);
	};
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give farmer's clothing",dia_addon_eremit_klamotten_bau_l);
	};
	if(Npc_HasItems(other,itar_bau_m) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give landowner's clothing",dia_addon_eremit_klamotten_bau_m);
	};
	if(Npc_HasItems(other,itar_djg_crawler) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give crawler plate armor",dia_addon_eremit_klamotten_djg_crawler);
	};
	if(Npc_HasItems(other,itar_leather_l) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give leather armor",dia_addon_eremit_klamotten_leather);
	};
	if(Npc_HasItems(other,itar_diego) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give Diego's armor",dia_addon_eremit_klamotten_diego);
	};
	if(Npc_HasItems(other,itar_prisoner) > 0)
	{
		Info_AddChoice(dia_addon_eremit_klamotten,"Give convict's pants",dia_addon_eremit_klamotten_prisoner);
	};
};

func void b_eremit_tatsache()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//They do!
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_21");	//Well, what do I do now? I gave all my gold to the pirates for the crossing.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_22");	//All I can give you is a couple of old stone tablets.
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_23");	//Here, take them, by all means. I'll look for some new ones.
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,2);
	MIS_EREMIT_KLAMOTTEN = LOG_SUCCESS;
	b_giveplayerxp(200);
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_back()
{
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_24");	//Oh, great. First you get me all stirred up and then...(sighs)
	Info_ClearChoices(dia_addon_eremit_klamotten);
};

func void dia_addon_eremit_klamotten_pir_l()
{
	b_giveinvitems(other,self,itar_pir_l_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_m()
{
	b_giveinvitems(other,self,itar_pir_m_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pir_h()
{
	b_giveinvitems(other,self,itar_pir_h_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_orebaron()
{
	b_giveinvitems(other,self,itar_orebaron_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_raven()
{
	b_giveinvitems(other,self,itar_raven_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_ranger()
{
	b_giveinvitems(other,self,itar_ranger_addon,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdw_h()
{
	b_giveinvitems(other,self,itar_kdw_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_governor()
{
	b_giveinvitems(other,self,itar_governor,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_judge()
{
	b_giveinvitems(other,self,itar_judge,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_smith()
{
	b_giveinvitems(other,self,itar_smith,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_barkeeper()
{
	b_giveinvitems(other,self,itar_barkeeper,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_l()
{
	b_giveinvitems(other,self,itar_vlk_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_m()
{
	b_giveinvitems(other,self,itar_vlk_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlk_h()
{
	b_giveinvitems(other,self,itar_vlk_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_l()
{
	b_giveinvitems(other,self,itar_vlkbabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_m()
{
	b_giveinvitems(other,self,itar_vlkbabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_vlkbabe_h()
{
	b_giveinvitems(other,self,itar_vlkbabe_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_l()
{
	b_giveinvitems(other,self,itar_mil_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_mil_m()
{
	b_giveinvitems(other,self,itar_mil_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_m()
{
	b_giveinvitems(other,self,itar_pal_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_h()
{
	b_giveinvitems(other,self,itar_pal_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_pal_skel()
{
	b_giveinvitems(other,self,itar_pal_skel,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_l()
{
	b_giveinvitems(other,self,itar_bau_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bau_m()
{
	b_giveinvitems(other,self,itar_bau_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_l()
{
	b_giveinvitems(other,self,itar_baubabe_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_baubabe_m()
{
	b_giveinvitems(other,self,itar_baubabe_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_l()
{
	b_giveinvitems(other,self,itar_sld_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_m()
{
	b_giveinvitems(other,self,itar_sld_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_sld_h()
{
	b_giveinvitems(other,self,itar_sld_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_crawler()
{
	b_giveinvitems(other,self,itar_djg_crawler,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_l()
{
	b_giveinvitems(other,self,itar_djg_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_m()
{
	b_giveinvitems(other,self,itar_djg_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_djg_h()
{
	b_giveinvitems(other,self,itar_djg_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_nov_l()
{
	b_giveinvitems(other,self,itar_nov_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_l()
{
	b_giveinvitems(other,self,itar_kdf_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_kdf_h()
{
	b_giveinvitems(other,self,itar_kdf_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_leather()
{
	b_giveinvitems(other,self,itar_leather_l,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_m()
{
	b_giveinvitems(other,self,itar_bdt_m,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_bdt_h()
{
	b_giveinvitems(other,self,itar_bdt_h,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_xardas()
{
	b_giveinvitems(other,self,itar_xardas,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_lester()
{
	b_giveinvitems(other,self,itar_lester,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_diego()
{
	b_giveinvitems(other,self,itar_diego,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_corangar()
{
	b_giveinvitems(other,self,itar_corangar,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_prisoner()
{
	b_giveinvitems(other,self,itar_prisoner,1);
	b_eremit_tatsache();
};

func void dia_addon_eremit_klamotten_dementor()
{
	b_giveinvitems(other,self,itar_dementor,1);
	b_eremit_tatsache();
};


instance DIA_ADDON_EREMIT_PERM(C_INFO)
{
	npc = none_addon_115_eremit;
	nr = 99;
	condition = dia_addon_eremit_perm_condition;
	information = dia_addon_eremit_perm_info;
	permanent = TRUE;
	description = "And? How's life as a drop-out?";
};


func int dia_addon_eremit_perm_condition()
{
	return TRUE;
};

func void dia_addon_eremit_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Eremit_Add_15_04");	//And? How's life as a drop-out?
	if(MIS_EREMIT_KLAMOTTEN == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_09");	//(proudly) I built everything myself. My weapons, my tools, my hut, everything.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_10");	//Came here with nothing but a good mood...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_11");	//Sometimes, though...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Yes?
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_12");	//Sometimes, I wish I had at least taken a few clothes with me.
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_13");	//I don't know how to weave or tan hides...
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_14");	//And the nights aren't exactly warm in this part of the island.
		MIS_EREMIT_KLAMOTTEN = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Eremit_Add_04_15");	//I manage.
		if(MIS_EREMIT_KLAMOTTEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_18");	//With clothes, I could get through the winter! After that... we'll see...
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_16");	//Better than Khorinis, anyway!
			AI_Output(self,other,"DIA_Addon_Eremit_Add_04_17");	//Even without clothes.
		};
	};
};

