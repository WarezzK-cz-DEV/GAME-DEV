
instance DIA_ADDON_RIORDIAN_EXIT(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 999;
	condition = dia_addon_riordian_exit_condition;
	information = dia_addon_riordian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HALLO(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_hallo_condition;
	information = dia_addon_riordian_hallo_info;
	description = "What are you doing?";
};


func int dia_addon_riordian_hallo_condition()
{
	return TRUE;
};

func void dia_addon_riordian_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Hallo_15_00");	//What are you doing?
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_01");	//I am studying the culture of the ancient people.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_02");	//Based on the inscriptions, they lived long before our time.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_03");	//I don't know exactly WHEN they erected these halls, but their civilization was highly developed.
	AI_Output(self,other,"DIA_Addon_Riordian_Hallo_10_04");	//They built a city on the other side of the mountains. (considering) And a temple for Adanos.
};


instance DIA_ADDON_RIORDIAN_ALTER(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 6;
	condition = dia_addon_riordian_alter_condition;
	information = dia_addon_riordian_alter_info;
	description = "How old do you think the building here is?";
};


func int dia_addon_riordian_alter_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_alter_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Alter_15_00");	//How old do you think the building here is?
	AI_Output(self,other,"DIA_Addon_Riordian_Alter_10_01");	//Well. I still can't say exactly, but it must be several hundred years old.
};


instance DIA_ADDON_RIORDIAN_ATLANTIS(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 4;
	condition = dia_addon_riordian_atlantis_condition;
	information = dia_addon_riordian_atlantis_info;
	description = "A lost city on the island of Khorinis?";
};


func int dia_addon_riordian_atlantis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_atlantis_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Atlantis_15_00");	//A lost city on the island of Khorinis?
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_01");	//Yes. Until now, we lived in the belief that we knew the whole island.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_02");	//We assumed that the entire northeast of the island was one enormous mountain range.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_03");	//But we were wrong.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_04");	//Behind these mountains lies a valley. The city of the ancient people was located there.
	AI_Output(self,other,"DIA_Addon_Riordian_Atlantis_10_05");	//(sighs) I would only too gladly see the buildings of the city, but they have probably fallen to dust long ago...
	b_logentry(TOPIC_ADDON_KDW,"The Water Mages suspect that an ancient lost city lies behind the portal.");
};


instance DIA_ADDON_RIORDIAN_SATURASWANTYOU(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_saturaswantyou_condition;
	information = dia_addon_riordian_saturaswantyou_info;
	description = "Saturas wants to see you.";
};


func int dia_addon_riordian_saturaswantyou_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo) && (MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_saturaswantyou_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_SaturasWantYou_15_00");	//Saturas wants to see you.
	AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_01");	//Has he gotten further with his investigation? Then I will go to him immediately.
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_02");	//If you want to learn more about this complex, talk to Nefarius.
		AI_Output(self,other,"DIA_Addon_Riordian_SaturasWantYou_10_03");	//You'll find him farther back in these vaults.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Saturas");
	MIS_ADDON_SATURAS_BRINGRIORDIAN2ME = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


var int riordian_permnews;

instance DIA_ADDON_RIORDIAN_PERM(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 99;
	condition = dia_addon_riordian_perm_condition;
	information = dia_addon_riordian_perm_info;
	permanent = TRUE;
	description = "Found out anything new?";
};


func int dia_addon_riordian_perm_condition()
{
	if(MIS_ADDON_SATURAS_BRINGRIORDIAN2ME == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Perm_15_00");	//Found out anything new?
	if(RIORDIAN_PERMNEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_01");	//It has been confirmed. The ancient culture did indeed believe in Adanos!
		RIORDIAN_PERMNEWS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Perm_10_02");	//Not really. Come back again later.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_TEACHPRE(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 5;
	condition = dia_addon_riordian_teachpre_condition;
	information = dia_addon_riordian_teachpre_info;
	description = "Vatras gave me this amulet of the searching will-o'-the-wisp...";
};


func int dia_addon_riordian_teachpre_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_hallo) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teachpre_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_00");	//Vatras gave me this amulet of the searching will-o'-the-wisp...
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_01");	//Ah! (circumspectly) A rare artifact. You can use it to train the will-o'-the-wisp, did you know that?
	AI_Output(other,self,"DIA_Addon_Riordian_TeachPre_15_02");	//Can you help me with that?
	AI_Output(self,other,"DIA_Addon_Riordian_TeachPre_10_03");	//Gladly. I have worked with this sort of magic for a long time.
	RIORDIAN_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
};


instance DIA_ADDON_RIORDIAN_TEACH(C_INFO)
{
	npc = kdw_1404_addon_riordian_nw;
	nr = 90;
	condition = dia_addon_riordian_teach_condition;
	information = dia_addon_riordian_teach_info;
	permanent = TRUE;
	description = "Show me how I can train my will-o'-the-wisp.";
};


var int dia_addon_riordian_teach_noperm;

func int dia_addon_riordian_teach_condition()
{
	if((RIORDIAN_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_teach);
		Info_AddChoice(dia_addon_riordian_teach,DIALOG_BACK,dia_addon_riordian_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

func void dia_addon_riordian_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_teach);
};

