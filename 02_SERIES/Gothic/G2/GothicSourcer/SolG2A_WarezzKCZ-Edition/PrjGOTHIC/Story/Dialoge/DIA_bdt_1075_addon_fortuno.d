
instance DIA_ADDON_FORTUNO_EXIT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 999;
	condition = dia_addon_fortuno_exit_condition;
	information = dia_addon_fortuno_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_fortuno_exit_condition()
{
	return TRUE;
};

func void dia_addon_fortuno_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FORTUNO_PICKPOCKET(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 900;
	condition = dia_addon_fortuno_pickpocket_condition;
	information = dia_addon_fortuno_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_fortuno_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_addon_fortuno_pickpocket_info()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_BACK,dia_addon_fortuno_pickpocket_back);
	Info_AddChoice(dia_addon_fortuno_pickpocket,DIALOG_PICKPOCKET,dia_addon_fortuno_pickpocket_doit);
};

func void dia_addon_fortuno_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};

func void dia_addon_fortuno_pickpocket_back()
{
	Info_ClearChoices(dia_addon_fortuno_pickpocket);
};


instance DIA_ADDON_FORTUNO_HI(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_hi_condition;
	information = dia_addon_fortuno_hi_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_fortuno_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (FORTUNO_GEHEILT_01 == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_hi_info()
{
	if(FORTUNO_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_00");	//(anxiously) A dark cloud over the house... the one approaches...
		AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_01");	//With blood... needed to call him... HE who sees me... he sees me... oh, no, go away, begone...
		AI_Output(other,self,"DIA_Addon_Fortuno_Hi_15_02");	//Are you all right?
		FORTUNO_EINMAL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_FORTUNO,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno is out of his mind. He is looking for a 'green novice'");
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_13_03");	//Green... green novice... I cannot find it...
	Info_ClearChoices(dia_addon_fortuno_hi);
	Info_AddChoice(dia_addon_fortuno_hi,"I'll be back later...(THE END)",dia_addon_fortuno_hi_back);
	Info_AddChoice(dia_addon_fortuno_hi,"How can I help you?",dia_addon_fortuno_hi_hilfe);
	if(Npc_HasItems(other,itmi_joint) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Here, take this swampweed.",dia_addon_fortuno_hi_joint);
	};
	if(Npc_HasItems(other,itmi_addon_joint_01) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_hi,"Here, take this 'Green Novice'.",dia_addon_fortuno_hi_green);
	};
};

func void dia_addon_fortuno_hi_back()
{
	Info_ClearChoices(dia_addon_fortuno_hi);
	AI_StopProcessInfos(self);
};

func void dia_addon_fortuno_hi_hilfe()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_HILFE_15_00");	//How can I help you?
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_HILFE_13_01");	//The green... the green novice will help the novice...
};

func void dia_addon_fortuno_hi_joint()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_JOINT_15_00");	//Here, take this swampweed.
	if(b_giveinvitems(other,self,itmi_joint,1))
	{
		AI_UseItem(self,itmi_joint);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_JOINT_13_01");	//Not green, not strong, not green, not strong...
};

func void dia_addon_fortuno_hi_green()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Hi_GREEN_15_00");	//Here, take this 'Green Novice'.
	if(b_giveinvitems(other,self,itmi_addon_joint_01,1))
	{
		AI_UseItem(self,itmi_addon_joint_01);
	};
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_01");	//(recovering) AAAHHH...
	AI_Output(self,other,"DIA_Addon_Fortuno_Hi_GREEN_13_02");	//My head... who... I am... Fortuno... what... what is wrong?
	Info_ClearChoices(dia_addon_fortuno_hi);
	FORTUNO_GEHEILT_01 = TRUE;
	b_giveplayerxp(XP_ADDON_FORTUNO_01);
	b_logentry(TOPIC_ADDON_FORTUNO,"The 'green novice' has helped Fortuno clear his head.");
};


instance DIA_ADDON_FORTUNO_WER(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_wer_condition;
	information = dia_addon_fortuno_wer_info;
	permanent = FALSE;
	description = "So, tell me what is wrong with you.";
};


func int dia_addon_fortuno_wer_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_00");	//So, tell me what is wrong with you.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_01");	//Once I belonged to the Brotherhood of the Sleeper. Everything was all right back then.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_02");	//Fine, we were all condemned crimials, but for us novices life was free from care...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_03");	//Hey, I was a prisoner in the Valley of Mines myself. Tell me something new.
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_04");	//I... I don't remember anything. Darkness lies across my mind...
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_05");	//Come on, concentrate. What happened? When did you come back to your senses?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_06");	//Raven... I only remember Raven and... and dark rooms.
	AI_Output(other,self,"DIA_Addon_Fortuno_wer_15_07");	//What about Raven? What did he do to you?
	AI_Output(self,other,"DIA_Addon_Fortuno_wer_13_08");	//(sighs) I'm sorry. It's as though my mind were held prisoner... I don't understand it myself...
};


instance DIA_ADDON_FORTUNO_FREE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 5;
	condition = dia_addon_fortuno_free_condition;
	information = dia_addon_fortuno_free_info;
	permanent = FALSE;
	description = "There must be a way to refresh your memory.";
};


func int dia_addon_fortuno_free_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_wer))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_free_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_00");	//There must be a way to refresh your memory.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_01");	//Yes... yes, maybe there is a way.
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_02");	//The gurus knew of various forms of altering the spirit and the will.
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_03");	//Do YOU remember anything about that?
	AI_Output(self,other,"DIA_Addon_Fortuno_FREE_13_04");	//No, I'm afraid this knowledge vanished with the gurus...
	AI_Output(other,self,"DIA_Addon_Fortuno_FREE_15_05");	//Damn. Well - if there is a way to free your spirit, I'll find it.
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(bloodfly,"ADW_PATH_TO_LOCH_01");
	b_logentry(TOPIC_ADDON_FORTUNO,"Fortuno has regained his senses, but he still remembers nothing.");
};


instance DIA_ADDON_FORTUNO_HERB(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 99;
	condition = dia_addon_fortuno_herb_condition;
	information = dia_addon_fortuno_herb_info;
	permanent = FALSE;
	description = "Do you need more swampweed?";
};


func int dia_addon_fortuno_herb_condition()
{
	if(FORTUNO_GEHEILT_01 == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_herb_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Herb_15_00");	//Do you need more swampweed?
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_01");	//Yeeesss, definitely. I will buy all the swampweed you can get your hands on.
	AI_Output(self,other,"DIA_Addon_Fortuno_Herb_13_02");	//I'll even pay you more for it than Fisk.
};

func void b_fortuno_infomanager()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
	Info_AddChoice(dia_addon_fortuno_trade,DIALOG_BACK,dia_addon_fortuno_trade_back);
	if(Npc_HasItems(other,itpl_swampherb) >= 1)
	{
		Info_AddChoice(dia_addon_fortuno_trade,"(hand over all swampweed)",dia_addon_fortuno_trade_all);
		Info_AddChoice(dia_addon_fortuno_trade,"(hand over 1 swampweed)",dia_addon_fortuno_trade_1);
	};
};


instance DIA_ADDON_FORTUNO_TRADE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 100;
	condition = dia_addon_fortuno_trade_condition;
	information = dia_addon_fortuno_trade_info;
	permanent = TRUE;
	description = "I've got swampweed for you...";
};


func int dia_addon_fortuno_trade_condition()
{
	if((Npc_HasItems(other,itpl_swampherb) >= 1) && Npc_KnowsInfo(other,dia_addon_fortuno_herb))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trade_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trade_15_00");	//I've got swampweed for you...
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_back()
{
	Info_ClearChoices(dia_addon_fortuno_trade);
};

func void dia_addon_fortuno_trade_all()
{
	var int amount;
	amount = Npc_HasItems(other,itpl_swampherb);
	if(b_giveinvitems(other,self,itpl_swampherb,amount))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,amount * VALUE_SWAMPHERB);
	b_giveplayerxp(amount * 10);
	b_fortuno_infomanager();
};

func void dia_addon_fortuno_trade_1()
{
	if(b_giveinvitems(other,self,itpl_swampherb,1))
	{
		Npc_RemoveInvItems(self,itpl_swampherb,Npc_HasItems(self,itpl_swampherb));
	};
	b_giveinvitems(self,other,itmi_gold,VALUE_SWAMPHERB);
	b_giveplayerxp(10);
	b_fortuno_infomanager();
};


instance DIA_ADDON_FORTUNO_TRANK(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 3;
	condition = dia_addon_fortuno_trank_condition;
	information = dia_addon_fortuno_trank_info;
	permanent = FALSE;
	description = "I've got a potion for you...";
};


func int dia_addon_fortuno_trank_condition()
{
	if((FORTUNO_GEHEILT_01 == TRUE) && Npc_KnowsInfo(other,dia_addon_fortuno_free) && ((Npc_HasItems(other,itpo_addon_geist_01) >= 1) || (Npc_HasItems(other,itpo_addon_geist_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_trank_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_Trank_15_00");	//I have a potion for you. It will help you to remember.
	AI_Output(self,other,"DIA_Addon_Fortuno_Trank_13_01");	//I trust you.
	if(Npc_HasItems(other,itpo_addon_geist_02) >= 1)
	{
		if(b_giveinvitems(other,self,itpo_addon_geist_02,1))
		{
			AI_UseItem(self,itpo_addon_geist_02);
		};
		b_giveplayerxp(XP_ADDON_FORTUNO_02);
	}
	else if(b_giveinvitems(other,self,itpo_addon_geist_01,1))
	{
		Log_SetTopicStatus(TOPIC_ADDON_FORTUNO,LOG_OBSOLETE);
		AI_StopProcessInfos(self);
		AI_UseItem(self,itpo_addon_geist_01);
	};
};


instance DIA_ADDON_FORTUNO_MORE(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 2;
	condition = dia_addon_fortuno_more_condition;
	information = dia_addon_fortuno_more_info;
	permanent = FALSE;
	description = "And...?";
};


func int dia_addon_fortuno_more_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_more_info()
{
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_00");	//And...?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_01");	//Aah! I... I remember again! Now I see... Adanos be with me - what have I done?
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_02");	//Yes, what have you done? And above all - what has Raven done?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_03");	//I helped him... to make contact. With HIM. He wanted various elixirs... I brewed them for him.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_04");	//He tried to open the portal to get into the temple.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_05");	//Why? What does he want in the temple?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_06");	//A powerful artifact... it lies buried together with the one who once bore it. A mighty warrior who fell to HIM...
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_07");	//And then?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_08");	//We couldn't open the portal...
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_09");	//But Raven was SURE that he could, if he had the tomb of the priest excavated.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_10");	//That's why he brought the slaves here. Victims he could force to dig where the powers of time lie at rest.
	AI_Output(other,self,"DIA_Addon_Fortuno_more_15_11");	//Tomb of the priest?
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_12");	//The resting place of a priest of Adanos. It lies in the mine.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_13");	//I also remember the stone tablets. He believed that they would show him the way.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_14");	//And once he was able to decipher the characters on them, he no longer needed me.
	AI_Output(self,other,"DIA_Addon_Fortuno_more_13_15");	//He put a spell of forgetfulness on me and... and you have freed me.
	SC_KNOWSFORTUNOINFOS = TRUE;
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven wants to recover a powerful artifact from the temple of Adanos.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"For some reason Raven has had the tomb of a priest of the old culture excavated in the mine.");
	Log_AddEntry(TOPIC_ADDON_RAVENKDW,"Raven believes that some stone tablets will help him with his plans.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_ADDON_FORTUNO_03);
};


instance DIA_ADDON_FORTUNO_ATTENTAT(C_INFO)
{
	npc = bdt_1075_addon_fortuno;
	nr = 9;
	condition = dia_addon_fortuno_attentat_condition;
	information = dia_addon_fortuno_attentat_info;
	permanent = FALSE;
	description = DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};


func int dia_addon_fortuno_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_fortuno_trank))
	{
		return TRUE;
	};
};

func void dia_addon_fortuno_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Fortuno_Attentat_13_00");	//Attack? Sorry, I was... absent... for some time. I don't know anything about it.
};

