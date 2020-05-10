
instance DIA_ADDON_MERDARION_EXIT(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 999;
	condition = dia_addon_merdarion_exit_condition;
	information = dia_addon_merdarion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_merdarion_exit_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MERDARION_HALLO(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_hallo_condition;
	information = dia_addon_merdarion_hallo_info;
	description = "Busy?";
};


func int dia_addon_merdarion_hallo_condition()
{
	return TRUE;
};

func void dia_addon_merdarion_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Hallo_15_00");	//Busy?
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_01");	//These vaults are one big mystery for me. It's hard to imagine that no one else should have found them before now.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_02");	//We were able to uncover the entrance without difficulty.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_03");	//People are so occupied with their daily routine that no one looked more closely at this structure.
	AI_Output(self,other,"DIA_Addon_Merdarion_Hallo_06_04");	//I have no other explanation for it.
};


instance DIA_ADDON_MERDARION_AUFGABE(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_aufgabe_condition;
	information = dia_addon_merdarion_aufgabe_info;
	description = "What is your task here?";
};


func int dia_addon_merdarion_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_aufgabe_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Aufgabe_15_00");	//What is your task here?
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_01");	//I am trying to find out where this round portal leads.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_02");	//Besides that, I help Nefarius look for the missing ornament.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_03");	//It is certain that this portal leads to another part of the island that we do not yet know.
	AI_Output(self,other,"DIA_Addon_Merdarion_Aufgabe_06_04");	//(considering) I can't remember ever having heard or read about that...
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(cronos_nw,"START");
	if(nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		b_logentry(TOPIC_ADDON_KDW,"Nefarius is looking for a missing ornament.");
	};
};


instance DIA_ADDON_MERDARION_DADURCH(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_dadurch_condition;
	information = dia_addon_merdarion_dadurch_info;
	description = "You really want to go through the portal?";
};


func int dia_addon_merdarion_dadurch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_dadurch_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_DaDurch_15_00");	//You really want to go through the portal?
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_01");	//Of course. Assuming we find the missing ornament, that is.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_02");	//I admit, it is a somewhat risky business.
	AI_Output(self,other,"DIA_Addon_Merdarion_DaDurch_06_03");	//But we absolutely must find out what it has to do with these constant earthquakes.
};


instance DIA_ADDON_MERDARION_BEDROHUNG(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_bedrohung_condition;
	information = dia_addon_merdarion_bedrohung_info;
	description = "What do you know about the earthquakes?";
};


func int dia_addon_merdarion_bedrohung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_dadurch))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_bedrohung_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Bedrohung_15_00");	//What do you know about the earthquakes?
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_01");	//Something on the other side is causing them.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_02");	//This source is probably also causing the stone sentinels to awaken.
	AI_Output(self,other,"DIA_Addon_Merdarion_Bedrohung_06_03");	//But that isn't my job. Saturas and Cronos can tell you more about that.
};


instance DIA_ADDON_MERDARION_WASDAHINTER2(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_wasdahinter2_condition;
	information = dia_addon_merdarion_wasdahinter2_info;
	description = "What do you think you will find over there?";
};


func int dia_addon_merdarion_wasdahinter2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_wasdahinter2_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Wasdahinter2_15_00");	//What do you think you will find over there?
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_01");	//I'm really not sure.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_02");	//I suspect that, on the other side, there will be a structure similar to this one. And a counterpart to this portal.
	AI_Output(self,other,"DIA_Addon_Merdarion_Wasdahinter2_06_03");	//Everything else we shall see when we get there.
};


instance DIA_ADDON_MERDARION_PERM(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 99;
	condition = dia_addon_merdarion_perm_condition;
	information = dia_addon_merdarion_perm_info;
	permanent = TRUE;
	description = "Can you teach me anything about magic?";
};


func int dia_addon_merdarion_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_PERM_15_00");	//Can you teach me anything about magic?
	AI_Output(self,other,"DIA_Addon_Merdarion_PERM_06_01");	//Once we're over there, I'll be at your disposal.
};


instance DIA_ADDON_MERDARION_TELEPORTSTEIN(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportstein_condition;
	information = dia_addon_merdarion_teleportstein_info;
	description = "What is the fastest way back to the city?";
};


func int dia_addon_merdarion_teleportstein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_aufgabe) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_teleportstein_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_00");	//What is the fastest way back to the city?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_01");	//I recommend you go back the same way you came.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_02");	//(considering) But you could also... No. That would be too dangerous.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_03");	//Out with it.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_04");	//Well. The builders of these halls had their own method of travelling.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_05");	//As far as we can tell, they could teleport.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_15_06");	//That's nothing special.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_07");	//The teleporter stones that we have found here in Khorinis are special indeed.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_08");	//It seems as though the teleporter stone here in these halls might lead to the harbor city.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_06_09");	//However, none of us has had the courage to try it.
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"What if I were to try to use it?",dia_addon_merdarion_teleportstein_ich);
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Where is this teleporter stone?",dia_addon_merdarion_teleportstein_wo);
};

func void dia_addon_merdarion_teleportstein_wo()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_wo_15_00");	//Where is this teleporter stone?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_wo_06_01");	//There is a door in the basin room. I have locked it up behind there.
	Info_AddChoice(dia_addon_merdarion_teleportstein,"Give me the key. I want to take a look at this thing.",dia_addon_merdarion_teleportstein_key);
};

func void dia_addon_merdarion_teleportstein_ich()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_ich_15_00");	//What if I were to try to use it?
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_ich_06_01");	//No idea. We know too little about it. It is possible that you wouldn't survive.
};

func void dia_addon_merdarion_teleportstein_key()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_00");	//Give me the key. I want to take a look at this thing.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_01");	//(unsure) Really? But I take no responsibility for it.
	AI_Output(other,self,"DIA_Addon_Merdarion_Teleportstein_key_15_02");	//Give it here.
	AI_Output(self,other,"DIA_Addon_Merdarion_Teleportstein_key_06_03");	//If you say so. Here it is.
	CreateInvItems(self,itke_portaltempelwalkthrough_addon,1);
	b_giveinvitems(self,other,itke_portaltempelwalkthrough_addon,1);
	SC_GOTPORTALTEMPELWALKTHROUGHKEY = TRUE;
	Log_CreateTopic(TOPIC_ADDON_TELEPORTSNW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_TELEPORTSNW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Merdarion gave me the key to a locked door in the vaults of the portal. Behind it is a teleporter stone that should take me back to the seaport.");
	Info_ClearChoices(dia_addon_merdarion_teleportstein);
};


instance DIA_ADDON_MERDARION_WHEREOTHERTELEPORTS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_whereotherteleports_condition;
	information = dia_addon_merdarion_whereotherteleports_info;
	description = "Where are the other teleporter stones?";
};


func int dia_addon_merdarion_whereotherteleports_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_teleportstein))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_whereotherteleports_info()
{
	AI_Output(other,self,"DIA_Addon_Merdarion_WHereOtherTeleports_15_00");	//Where are the other teleporter stones?
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_01");	//So far, we have only found one other somewhere in the middle of Khorinis.
	AI_Output(self,other,"DIA_Addon_Merdarion_WHereOtherTeleports_06_02");	//Near the Dead Harpy tavern.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"There should be another teleporter stone near the Dead Harpy tavern.");
};


instance DIA_ADDON_MERDARION_TELEPORTSTEINSUCCESS(C_INFO)
{
	npc = kdw_1405_addon_merdarion_nw;
	nr = 5;
	condition = dia_addon_merdarion_teleportsteinsuccess_condition;
	information = dia_addon_merdarion_teleportsteinsuccess_info;
	description = "The teleporter stones seem to work nicely.";
};


func int dia_addon_merdarion_teleportsteinsuccess_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_merdarion_teleportstein) && (SCUSED_NW_TELEPORTSTATION_MAYA == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_merdarion_teleportsteinsuccess_info()
{
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_00");	//The teleporter stones seem to work nicely.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_01");	//You actually did it? You really went in?
	AI_Output(other,self,"DIA_Addon_Merdarion_TeleportsteinSuccess_15_02");	//Yes. They obviously still work.
	AI_Output(self,other,"DIA_Addon_Merdarion_TeleportsteinSuccess_06_03");	//(fascinated) Unbelievable. I'll have to look at this more closely later.
};

