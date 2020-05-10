
instance DIA_ADDON_MERDARION_ADW_EXIT(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 999;
	condition = dia_addon_merdarion_adw_exit_condition;
	information = dia_addon_merdarion_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_merdarion_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adw_exit_info()
{
	if((Npc_KnowsInfo(other,dia_addon_merdarion_fokusgeben) || (MERDARION_GOTFOCUSCOUNT > 0)) && !SC_ADW_ACTIVATEDALLTELEPORTSTONES && (TRIGGEREDTELEPORTERADW <= MERDARION_GOTFOCUSCOUNT) && (Npc_HasItems(other,itmi_focus) == 0))
	{
		CreateInvItems(self,itmi_focus,1);
		b_giveinvitems(self,other,itmi_focus,1);
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MERDARION_ADWHELLO(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adwhello_condition;
	information = dia_addon_merdarion_adwhello_info;
	description = "How's it going?";
};


func int dia_addon_merdarion_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_adwhello_back()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_Back_15_00");	//I've heard enough.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
};

func void dia_addon_merdarion_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_01");	//(listening) Listen... Curious. Don't you think?
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_15_02");	//Mmh...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_03");	//These teleporter stones don't appear to function and yet you can hear them hum.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_06_04");	//Although they aren't active, a certain energy rests in them nevertheless.
	Info_ClearChoices(dia_addon_merdarion_adwhello);
	Info_AddChoice(dia_addon_merdarion_adwhello,"How do these teleporter stones get their power?",dia_addon_merdarion_adwhello_reaktor);
	Info_AddChoice(dia_addon_merdarion_adwhello,"What do you think needs to be done to activate them?",dia_addon_merdarion_adwhello_was);
};

func void dia_addon_merdarion_adwhello_was()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_was_15_00");	//What do you think needs to be done to activate them?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_01");	//I have an idea about that. I just need proof for my suspicion.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_02");	//I had a feeling days ago that I had seen this sort of construction somewhere before.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_was_06_03");	//I suspect that we have to supply them with a damn large amount of magical energy to get them back in service.
	Info_AddChoice(dia_addon_merdarion_adwhello,"Where have you seen these teleporter stones before?",dia_addon_merdarion_adwhello_wo);
	Info_AddChoice(dia_addon_merdarion_adwhello,"What could provide enough magical energy...",dia_addon_merdarion_adwhello_focus);
};

func void dia_addon_merdarion_adwhello_focus()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_00");	//What could provide enough magical energy...
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_01");	//I can only think of one thing. A magical focus.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_02");	//I mean one of the five focus stones that were used to create the magical barrier in the Valley of Mines.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focus_06_03");	//As far as I know, you had to get them back for us a while ago.
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focus_15_04");	//Yes. I can remember.
	Info_AddChoice(dia_addon_merdarion_adwhello,"You said you need proof for your suspicion.",dia_addon_merdarion_adwhello_focusproof);
	Info_AddChoice(dia_addon_merdarion_adwhello,"Where are the focus stones now?",dia_addon_merdarion_adwhello_focuswo);
};

func void dia_addon_merdarion_adwhello_focuswo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusWo_15_00");	//Where are the focus stones now?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_01");	//They were entrusted to me. I am supposed to keep them safe until we find another use for them.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusWo_06_02");	//The way it looks, the time is ripe now.
	Info_AddChoice(dia_addon_merdarion_adwhello,"I've heard enough.",dia_addon_merdarion_adwhello_back);
};

func void dia_addon_merdarion_adwhello_focusproof()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_focusProof_15_00");	//You said you need proof for your suspicion.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_01");	//A magical focus should be connected to these stones.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_focusProof_06_02");	//But I don't know where.
};

func void dia_addon_merdarion_adwhello_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_wo_15_00");	//Where have you seen these teleporter stones before?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_01");	//You were in the penal colony, too. Didn't you ever notice those stones?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_wo_06_02");	//I am quite sure that they can still be found there today.
};

func void dia_addon_merdarion_adwhello_reaktor()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADWHello_reaktor_15_00");	//How do these teleporter stones get their power?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_01");	//The builders were a very highly developed people.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_02");	//They used properties of magic that we have never seen.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_03");	//A network of teleporter stones was built so that the builders could move quickly from one place in the city to another.
	AI_Output(self,other,"DIA_Addon_Merdarion_ADWHello_reaktor_06_04");	//The stone HERE obviously forms a kind of center.
};


instance DIA_ADDON_MERDARION_FOKUSGEBEN(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_fokusgeben_condition;
	information = dia_addon_merdarion_fokusgeben_info;
	description = "Give me a focus stone.";
};


func int dia_addon_merdarion_fokusgeben_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_fokusgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FokusGeben_15_00");	//Give me a focus stone. I will try to get the teleporters to work.
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_01");	//All right. But be careful with it, you hear?
	AI_Output(self,other,"DIA_Addon_Merdarion_FokusGeben_06_02");	//Saturas will have my head if we lose them.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSADW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSADW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"The Water Mage Merdarion gave me one of the old focus stones that was used to create the Barrier in the Valley of Mines. I am to try and activate one of the teleporter stones.");
};


instance DIA_ADDON_MERDARION_FIRSTFOCUS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_firstfocus_condition;
	information = dia_addon_merdarion_firstfocus_info;
	description = "I have activated one of the teleporter stones.";
};


func int dia_addon_merdarion_firstfocus_condition()
{
	if(TRIGGEREDTELEPORTERADW != 0)
	{
		return TRUE;
	};
};


var int merdarion_gotfocuscount;

func void dia_addon_merdarion_firstfocus_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_00");	//I have activated one of the teleporter stones.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_01");	//I can see that. So I was right.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_02");	//I have talked to the others about it.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_03");	//We want you to try to activate all of the teleporter stones.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_04");	//It would be a great help in our investigations if we could move quickly from one part of the city to another.
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_05");	//Here is another focus stone.
	CreateInvItems(self,itmi_focus,1);
	b_giveinvitems(self,other,itmi_focus,1);
	MERDARION_GOTFOCUSCOUNT = 1;
	AI_Output(self,other,"DIA_Addon_Merdarion_FirstFocus_06_06");	//Activate them all if you can.
	AI_Output(other,self,"DIA_Addon_Merdarion_FirstFocus_15_07");	//I'll try.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	b_logentry(TOPIC_ADDON_TELEPORTSADW,"Merdarion gave me another focus stone. I am supposed to try and get all the teleporter stone working. He will give me another focus stone as soon as the next teleporter stone is working.");
};


instance DIA_ADDON_MERDARION_ACTIVATETELEPORTS(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_activateteleports_condition;
	information = dia_addon_merdarion_activateteleports_info;
	permanent = TRUE;
	description = "I have activated another one of the teleporter stones.";
};


func int dia_addon_merdarion_activateteleports_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_firstfocus) && (TRIGGEREDTELEPORTERADW > MERDARION_GOTFOCUSCOUNT) && (MERDARION_GOTFOCUSCOUNT < 6))
	{
		return TRUE;
	};
};


var int dia_addon_merdarion_activateteleports_onetime;

func void dia_addon_merdarion_activateteleports_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_00");	//I have activated another one of the teleporter stones.
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_01");	//Give me the next focus.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_02");	//Of course. Here it is.
		CreateInvItems(self,itmi_focus,1);
		b_giveinvitems(self,other,itmi_focus,1);
	};
	if(DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_03");	//Was it difficult.
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_04");	//Depends on how you look at it. I could use a bit of support.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_05");	//I can give you some gold, would that help?
		AI_Output(other,self,"DIA_Addon_Merdarion_ActivateTeleports_15_06");	//It couldn't hurt.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_07");	//Let's see...
		DIA_ADDON_MERDARION_ACTIVATETELEPORTS_ONETIME = TRUE;
	};
	if(SC_ADW_ACTIVATEDALLTELEPORTSTONES == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_08");	//You have done really well. I can only congraulate you on your work.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_09");	//They are all working again now. An impressive sight, don't you think?
	};
	AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_10");	//Here are a few gold coins.
	b_giveplayerxp(XP_ADDON_ACTIVATEDTELEPORTSTONE);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MERDARION_GOTFOCUSCOUNT = MERDARION_GOTFOCUSCOUNT + 1;
	if((MERDARION_GOTFOCUSCOUNT >= 1) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == 0))
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_11");	//Oh, by the way. Before I forget, Saturas would like to talk to you.
		AI_Output(self,other,"DIA_Addon_Merdarion_ActivateTeleports_06_12");	//You should see him as soon as possible.
	};
};


instance DIA_ADDON_MERDARION_ADW_PRETEACHMANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 5;
	condition = dia_addon_merdarion_adw_preteachmana_condition;
	information = dia_addon_merdarion_adw_preteachmana_info;
	description = "Can you teach me your magic skills?";
};


func int dia_addon_merdarion_adw_preteachmana_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_preteachmana_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_PreTeachMana_15_00");	//Can you teach me your magic skills?
	AI_Output(self,other,"DIA_Addon_Merdarion_ADW_PreTeachMana_06_01");	//I can show you how to increase your magic power.
	MERDARION_ADDON_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,"Merdarion can increase my mana.");
};


instance DIA_ADDON_MERDARION_ADW_TEACH_MANA(C_INFO)
{
	npc = kdw_14050_addon_merdarion_adw;
	nr = 99;
	condition = dia_addon_merdarion_adw_teach_mana_condition;
	information = dia_addon_merdarion_adw_teach_mana_info;
	permanent = TRUE;
	description = "I want to increase my magic power.";
};


var int merdarion_adw_empty;

func int dia_addon_merdarion_adw_teach_mana_condition()
{
	if((MERDARION_ADW_EMPTY == FALSE) && (MERDARION_ADDON_TEACHMANA == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_adw_teach_mana_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_ADW_TEACH_MANA_15_00");	//I want to increase my magic power.
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_HIGH)
	{
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_00");	//Your request goes beyond my capabilities.
		AI_Output(self,other,"DIA_Addon_Merdarion_ADW_TEACH_MANA_06_01");	//I cannot teach you anything more.
		MERDARION_ADW_EMPTY = TRUE;
	};
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
};

func void dia_addon_merdarion_adw_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_HIGH);
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_addon_merdarion_adw_teach_mana_5);
};

func void dia_addon_merdarion_adw_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_HIGH);
	Info_ClearChoices(dia_addon_merdarion_adw_teach_mana);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,DIALOG_BACK,dia_addon_merdarion_adw_teach_mana_back);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_addon_merdarion_adw_teach_mana_1);
	Info_AddChoice(dia_addon_merdarion_adw_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_addon_merdarion_adw_teach_mana_5);
};

