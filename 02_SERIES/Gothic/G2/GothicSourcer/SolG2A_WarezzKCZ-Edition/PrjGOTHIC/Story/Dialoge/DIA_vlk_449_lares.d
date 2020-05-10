
instance DIA_ADDON_LARES_PATCH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 99;
	condition = dia_addon_lares_patch_condition;
	information = dia_addon_lares_patch_info;
	description = "(Ornament - reclaim piece)";
};


func int dia_addon_lares_patch_condition()
{
	if(Npc_HasItems(self,itmi_ornament_addon_vatras) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_addon_lares_patch_info()
{
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
};


instance DIA_LARES_KAP1_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap1_exit_condition;
	information = dia_lares_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_lares_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_HALTSMAUL(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_haltsmaul_condition;
	information = dia_addon_lares_haltsmaul_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_haltsmaul_condition()
{
	if((LARES_HALTSMAUL == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_haltsmaul_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_HaltsMaul_09_01");	//I'll see you later, down at the harbor.
	AI_StopProcessInfos(self);
};


instance DIA_LARES_PICKPOCKET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 900;
	condition = dia_lares_pickpocket_condition;
	information = dia_lares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_lares_pickpocket_condition()
{
	return c_beklauen(95,350);
};

func void dia_lares_pickpocket_info()
{
	Info_ClearChoices(dia_lares_pickpocket);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_BACK,dia_lares_pickpocket_back);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_PICKPOCKET,dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back()
{
	Info_ClearChoices(dia_lares_pickpocket);
};


instance DIA_LARES_HALLO(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_lares_hallo_condition;
	information = dia_lares_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_hallo_condition()
{
	if(RANGERMEETINGRUNNING == 0)
	{
		return TRUE;
	};
};

func void dia_lares_hallo_info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//I must be crazy, what are you doing here?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Did you SWIM here?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(laughs) That's one way to get past the guards at the city gate.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Have we met before?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Hey, Lares, you old scoundrel...",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Have we met before?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Man, don't you remember me? I used to hang around in the New Camp.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//The list for the mine... Man, we had a lot of fun. Do you remember Lee?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Of course I remember Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Hey, Lares, you old scoundrel, how did you get here?
	b_giveplayerxp(50);
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//I was able to escape the Valley of Mines just in time, together with Lee and some of the other boys.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//You remember Lee, don't you?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Of course I remember Lee!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Lee...?",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//I got out of the colony with him then. Just after the Barrier was destroyed.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//He and his boys are now on the farm of Onar the landowner.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//He made a deal with the farmer. He and his boys defend the farm, and Onar feeds them in return.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Of course I remember Lee!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
	b_giveplayerxp(50);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Lee...?
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//You've been through a lot, huh? Lee was the leader of the mercenaries in the New Camp.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_ADDON_LARES_VATRAS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_vatras_condition;
	information = dia_addon_lares_vatras_info;
	description = "Vatras sent me.";
};


func int dia_addon_lares_vatras_condition()
{
	if(VATRAS_GEHZULARES == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_lares_vatras_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Vatras_15_00");	//Vatras sent me. He told me to come to you when I needed help.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_01");	//(astonished) So you've already been to see Vatras. You must have made a lasting impression on him.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_02");	//Otherwise he certainly wouldn't have volunteered my name. Especially not since the matter with those missing people still hasn't been resolved.
	AI_Output(self,other,"DIA_Addon_Lares_Vatras_09_03");	//Tell me what you need.
	LARES_RANGERHELP = TRUE;
	if(GREGLOCATION == GREG_FARM1)
	{
		b_startotherroutine(bau_974_bauer,"GregInTaverne");
		GREGLOCATION = GREG_TAVERNE;
		b_startotherroutine(greg_nw,"Taverne");
	};
};


instance DIA_ADDON_LARES_WHATAREYOUGUYS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_addon_lares_whatareyouguys_condition;
	information = dia_addon_lares_whatareyouguys_info;
	description = "So what's your business with Vatras?";
};


func int dia_addon_lares_whatareyouguys_condition()
{
	if((LARES_RANGERHELP == TRUE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_whatareyouguys_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_00");	//So what's your business with Vatras?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_01");	//I've got this little agreement with the Water Mages, you see.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_02");	//What kind of an agreement?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_03");	//We work for them, and they see to it that our past in the penal colony doesn't get us into trouble.
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_04");	//You're talking about the 'Ring of Water'?
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_05");	//You've heard of it?
	AI_Output(other,self,"DIA_Addon_Lares_WhatAreYouGuys_15_06");	//Vatras told me about it.
	AI_Output(self,other,"DIA_Addon_Lares_WhatAreYouGuys_09_07");	//You might have mentioned that right away.
	Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares belongs to the 'Ring of Water'.");
};


instance DIA_ADDON_LARES_RANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ranger_condition;
	information = dia_addon_lares_ranger_info;
	description = "Tell me more about the 'Ring of Water'.";
};


func int dia_addon_lares_ranger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ranger_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_00");	//Tell me more about the 'Ring of Water'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_01");	//The 'Ring' is to the Water Mages what the paladins are to the Fire Magicians.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_02");	//But, unlike the paladins, we operate in the background.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_03");	//The 'Ring' is a mighty weapon in the battle against the dangers that threaten the people of Khorinis.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_04");	//But this only works as long as we keep the identity of all those secret who belong to the 'Ring of Water'.
	AI_Output(self,other,"DIA_Addon_Lares_Ranger_09_05");	//So keep this to yourself!
	AI_Output(other,self,"DIA_Addon_Lares_Ranger_15_06");	//Sure.
	b_logentry(TOPIC_ADDON_RINGOFWATER,"The 'Ring' is to the Water Mages what the paladins are to the Fire Magicians. But the 'Ring' operates in the background. Nobody must know WHO belongs to it, so that its strength remains a secret.");
};


instance DIA_ADDON_LARES_WANNABERANGER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_wannaberanger_condition;
	information = dia_addon_lares_wannaberanger_info;
	description = "I want to join the 'Ring of Water'...";
};


func int dia_addon_lares_wannaberanger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ranger) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_wannaberanger_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_15_00");	//I want to join the 'Ring of Water'...
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_09_01");	//That's fine with me. But the decision about whether you will be accepted or not lies with the Water Mages alone.
	b_logentry(TOPIC_ADDON_RINGOFWATER,LOGTEXT_ADDON_KDWRIGHT);
	Info_ClearChoices(dia_addon_lares_wannaberanger);
	Info_AddChoice(dia_addon_lares_wannaberanger,"I see.",dia_addon_lares_wannaberanger_back);
	Info_AddChoice(dia_addon_lares_wannaberanger,"What's it like to belong to the 'Ring'?",dia_addon_lares_wannaberanger_howisit);
	Info_AddChoice(dia_addon_lares_wannaberanger,"What did you do to impress the Water Mages?",dia_addon_lares_wannaberanger_aboutyou);
};

func void dia_addon_lares_wannaberanger_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_BACK_15_00");	//I see.
	Info_ClearChoices(dia_addon_lares_wannaberanger);
};

func void dia_addon_lares_wannaberanger_aboutyou()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_AboutYou_15_00");	//What did you do to impress the Water Mages?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_01");	//I protected them for a long time when we were still living with the Barrier.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_AboutYou_09_02");	//(smiles) And they have plenty of reason to be grateful to me.
};

func void dia_addon_lares_wannaberanger_howisit()
{
	AI_Output(other,self,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_15_00");	//What's it like to belong to the 'Ring'?
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_01");	//We are very different from the usual communities you can join here in Khorinis.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_02");	//Once you're one of us, we're not going to ask anything of you that you are not ready to do.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_03");	//The only thing we truly require of you is to keep quiet.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_04");	//We work in secret and do not want to let outsiders know who our members are.
	AI_Output(self,other,"DIA_Addon_Lares_WannaBeRanger_HowIsIt_09_05");	//We shall keep an eye on you. Everything else remains to be seen.
};

func void b_lares_geheimtreffen()
{
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_07");	//We are going to have a secret meeting soon in Orlan's tavern.
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_08");	//Meet us there as soon as you can. We'll give you your gear there.
};


instance DIA_ADDON_LARES_RINGBACK(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback_condition;
	information = dia_addon_lares_ringback_info;
	description = "I now belong to the 'Ring of Water'.";
};


func int dia_addon_lares_ringback_condition()
{
	if((SC_ISRANGER == TRUE) && (MIS_ADDON_LARES_COMETORANGERMEETING != LOG_SUCCESS) && ((Npc_GetDistToWP(self,"NW_CITY_HABOUR_02_B") < 1000) || (Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") < 1000)))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ringback_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_00");	//I now belong to the 'Ring of Water'.
	if((LARES_GOTRINGBACK == FALSE) && (SC_GOTLARESRING == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_01");	//Great. So can I have my aquamarine ring back?
		if(b_giveinvitems(other,self,itri_ranger_lares_addon,1))
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_02");	//Sure. Here it is.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_03");	//I hope it proved useful to you. I'm glad to know you're one of us now.
			LARES_GOTRINGBACK = TRUE;
			b_giveplayerxp(XP_AMBIENT);
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Lares_RingBack_15_04");	//Hmm. I don't have it on me right now.
			AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_05");	//Don't mess around with it! I still need it.
		};
	};
	AI_Output(self,other,"DIA_Addon_Lares_RingBack_09_06");	//I guess you want your gear now. So pay attention.
	b_lares_geheimtreffen();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares invited me to come to the secret meeting of the 'Ring' in Orlan's tavern.");
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_RUNNING;
};


instance DIA_ADDON_LARES_RINGBACK2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_ringback2_condition;
	information = dia_addon_lares_ringback2_info;
	description = "Here's your aquamarine ring.";
};


func int dia_addon_lares_ringback2_condition()
{
	if(Npc_HasItems(other,itri_ranger_lares_addon) && (LARES_GOTRINGBACK == FALSE) && (MIS_ADDON_LARES_COMETORANGERMEETING != 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ringback2_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RingBack2_15_00");	//Here's your aquamarine ring.
	b_giveinvitems(other,self,itri_ranger_lares_addon,1);
	AI_Output(self,other,"DIA_Addon_Lares_RingBack2_09_01");	//Good for you. I thought you'd lost it.
	b_giveplayerxp(XP_AMBIENT);
	LARES_GOTRINGBACK = TRUE;
};


instance DIA_ADDON_LARES_GEDULD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_geduld_condition;
	information = dia_addon_lares_geduld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_geduld_condition()
{
	if((RANGERMEETINGRUNNING == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") > 200) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_geduld_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Geduld_09_01");	//You need to wait a little longer. Everyone's not here yet.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_GETRANGERARMOR(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_getrangerarmor_condition;
	information = dia_addon_lares_getrangerarmor_info;
	important = TRUE;
};


func int dia_addon_lares_getrangerarmor_condition()
{
	if((MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TAVERNE_IN_RANGERMEETING_LARES") < 200) && (RANGERMEETINGRUNNING == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_lares_getrangerarmor_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_00");	//All right, my young friend. We have come together here to celebrate your admission to the 'Ring of Water'.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_01");	//The boys who are present here will keep an eye out for you from today on.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_02");	//Of course, there are others who also belong to the 'Ring of Water', so be careful.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_03");	//Whether you do us a service or mess things up - we are going to learn about it.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_04");	//Here, take the armor of our community.
	CreateInvItem(hero,itar_ranger_addon);
	AI_EquipArmor(hero,itar_ranger_addon);
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_05");	//Wear it with pride, but never in town or in other inhabited areas.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_06");	//Remember, we must not be exposed. Nobody must therefore be told who the members of the 'Ring of Water' are.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_07");	//Nobody talks about the 'Ring of Water'. That's our foremost rule. Stick to it.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_09_08");	//Any more questions?
	MIS_ADDON_LARES_COMETORANGERMEETING = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"I've got to go.",dia_addon_lares_getrangerarmor_end);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"What kind of help can I get from you?",dia_addon_lares_getrangerarmor_learn);
	Info_AddChoice(dia_addon_lares_getrangerarmor,"What about weapons, then?",dia_addon_lares_getrangerarmor_weapons);
};

func void dia_addon_lares_getrangerarmor_weapons()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_weapons_15_00");	//What about weapons, then?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_01");	//The weapon of the 'Ring' is the quarterstaff, but everyone uses whatever arms he is most comfortable with.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_weapons_09_02");	//Here's one of our staffs. I never really figured out how to use it, but maybe you can handle the thing.
	CreateInvItems(self,itmw_rangerstaff_addon,1);
	b_giveinvitems(self,other,itmw_rangerstaff_addon,1);
};

func void dia_addon_lares_getrangerarmor_end()
{
	b_makerangerreadytoleavemeetingall();
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_end_15_00");	//I've got to go.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_01");	//Fine, then don't let us keep you.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_02");	//Now go directly to Vatras and have him give you your first task.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_03");	//Brothers of the 'Ring'. Let us now return to our duties.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_04");	//The bandit attacks are still going on. We must see to it that this menace is stopped.
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_end_09_05");	//Adanos, preserve the balance of this world.
	LARES_TAKEFIRSTMISSIONFROMVATRAS = TRUE;
	Info_ClearChoices(dia_addon_lares_getrangerarmor);
	Info_AddChoice(dia_addon_lares_getrangerarmor,DIALOG_ENDE,dia_addon_lares_getrangerarmor_weiter);
};

func void dia_addon_lares_getrangerarmor_weiter()
{
	AI_StopProcessInfos(self);
	b_rangermeetingparking();
	b_logentry(TOPIC_ADDON_RINGOFWATER,"I was given my armor during the secret meeting in Orlan's tavern. Now I am supposed to go see Vatras who will set me my first task as a member of the 'Ring'.");
};

func void dia_addon_lares_getrangerarmor_learn()
{
	AI_Output(other,self,"DIA_Addon_Lares_GetRangerArmor_Learn_15_00");	//What kind of help can I get from you?
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_01");	//I can show you how to become more dexterous.
	if(Npc_IsDead(sld_805_cord) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_02");	//If you need help with wielding close-combat weapons, talk to Cord. He is a master of the blade.
	};
	if(Npc_IsDead(bau_961_gaan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_03");	//Gaan will gladly show you the proper way to gut animals.
	};
	if(Npc_IsDead(mil_350_addon_martin) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_04");	//Martin can tell you a lot about the paladins.
	};
	if(Npc_IsDead(bau_4300_addon_cavalorn) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_05");	//Cavalorn will teach you sneaking, one-handed combat and archery.
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_06");	//Orlan will always have a warm chamber and a bed waiting for you.
	};
	AI_Output(self,other,"DIA_Addon_Lares_GetRangerArmor_Learn_09_07");	//And for anything related to magic, talk to Vatras.
};


instance DIA_ADDON_LARES_TELEPORTSTATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_teleportstation_condition;
	information = dia_addon_lares_teleportstation_info;
	description = "Have you ever used a teleporter stone?";
};


func int dia_addon_lares_teleportstation_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS) && (SCUSED_TELEPORTER == TRUE) && (MIS_LARES_BRINGRANGERTOME != 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_teleportstation_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_00");	//Have you ever used a teleporter stone?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_01");	//No, but I've heard of them. The Water Mages aren't too sure about those things yet.
	AI_Output(other,self,"DIA_Addon_Lares_Teleportstation_15_02");	//I've given it a try.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_03");	//(laughs) Of course you have. You're not afraid of anything, are you?
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_04");	//Well. If you want to use the things, go ask Orlan the pub-owner whether he'll let you into his boarded-up cave.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_05");	//I think he has hidden one of the teleporter stones for the Water Mages near his tavern.
	AI_Output(self,other,"DIA_Addon_Lares_Teleportstation_09_06");	//Walk out of the eastern city gate and simply follow the path. You can't miss it.
	b_logentry(TOPIC_ADDON_TELEPORTSNW,"Lares told me that Orlan has hidden a teleporter stone near his tavern.");
	ORLAN_HINT_LARES = TRUE;
};


instance DIA_ADDON_LARES_ORNAMENT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornament_condition;
	information = dia_addon_lares_ornament_info;
	description = "Vatras gave me this ornament for you.";
};


func int dia_addon_lares_ornament_condition()
{
	if(Npc_HasItems(other,itmi_ornament_addon_vatras) && Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Ornament_15_00");	//Vatras gave me this ornament to bring to you. He said it is to be taken back.
	b_giveinvitems(other,self,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_01");	//(sighs) Of course. It's up to me, as usual. I might have known.
	AI_Output(self,other,"DIA_Addon_Lares_Ornament_09_02");	//I'll have to walk halfway across the island to take it back to the Water Mages.
};


instance DIA_ADDON_LARES_ORNAMENTBRINGJOB(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_ornamentbringjob_condition;
	information = dia_addon_lares_ornamentbringjob_info;
	description = "I can take the ornament there for you!";
};


func int dia_addon_lares_ornamentbringjob_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ornament) && (MIS_ADDON_LARES_ORNAMENT2SATURAS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_lares_ornamentbringjob_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_OrnamentBringJob_15_00");	//I can take the ornament there for you!
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_01");	//(pensively) Mmh. I think I had better take it there myself. But you could come with me.
	AI_Output(self,other,"DIA_Addon_Lares_OrnamentBringJob_09_02");	//Only, I can't leave here at the moment. I need to keep an eye on the harbor.
	b_logentry(TOPIC_ADDON_KDW,"I brought Lares the ornament from Vatras. He wants to take it to the Water Mages himself. I should accompany him.");
	MIS_ADDON_LARES_ORNAMENT2SATURAS = LOG_RUNNING;
};


instance DIA_ADDON_LARES_YOURMISSION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_yourmission_condition;
	information = dia_addon_lares_yourmission_info;
	permanent = TRUE;
	description = "What exactly do you do here at the harbor?";
};


func int dia_addon_lares_yourmission_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lares_ornament) && (MIS_LARES_BRINGRANGERTOME == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_yourmission_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_YourMission_15_00");	//What exactly do you do here at the harbor?
	if(!Npc_KnowsInfo(other,dia_addon_lares_whatareyouguys))
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_01");	//I can't talk about that.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_02");	//Vatras would have my head...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_03");	//I'm doing what we all do. I fulfill the tasks the Water Mages give me.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_04");	//Some of the missing people where fishermen. They disappeared along with their boats.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_05");	//That's why I'm standing here, watching the harbor. Maybe something will happen yet.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_06");	//But you could help me.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_07");	//Listen. I shall give you my aquamarine ring. It signifies that the bearer belongs to the 'Ring of Water'.
		CreateInvItems(self,itri_ranger_lares_addon,1);
		b_giveinvitems(self,other,itri_ranger_lares_addon,1);
		SC_GOTLARESRING = TRUE;
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_08");	//If you wear my ring, the rest of us will know that you're acting on my behalf.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_09");	//Get someone to take over my duties so that I can take the ornament back.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_10");	//One of us is always keeping an eye on the marketplace. But I don't know whose turn it is.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_11");	//You had better go talk to all those standing around there. Once the right man sees my aquamarine ring on you, he will let you know.
		AI_Output(self,other,"DIA_Addon_Lares_YourMission_09_12");	//Tell him to see to it that somebody else takes over here at the harbor.
		b_logentry(TOPIC_ADDON_RINGOFWATER,"Lares gave me his aquamarine ring - the secret sign of the 'Ring'. When I wear it, the other members of the 'Ring' will reveal themselves to me.");
		Log_CreateTopic(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_BRINGRANGERTOLARES,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Lares cannot leave the harbor. I am to show myself in the marketplace wearing his aquamarine ring to try and find someone who can take over his job.");
		MIS_LARES_BRINGRANGERTOME = LOG_RUNNING;
	};
};


instance DIA_ADDON_LARES_BALTRAMABLOESE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_baltramabloese_condition;
	information = dia_addon_lares_baltramabloese_info;
	description = "I have talked to Baltram.";
};


func int dia_addon_lares_baltramabloese_condition()
{
	if((MIS_LARES_BRINGRANGERTOME == LOG_RUNNING) && (BALTRAM_EXCHANGE4LARES == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_baltramabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_BaltramAbloese_15_00");	//I have talked to Baltram. He will find someone to relieve you.
	AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_01");	//Ah. Very good. Then we can finally leave here.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_02");	//You had better keep my aquamarine ring for now.
		if(Npc_KnowsInfo(other,dia_addon_lares_wannaberanger))
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_03");	//(smiles) I assume it will come in handy for you.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Lares_BaltramAbloese_09_04");	//(smiles) Who knows, you might want to join us...
		};
	};
	MIS_LARES_BRINGRANGERTOME = LOG_SUCCESS;
	LARES_CANBRINGSCTOPLACES = TRUE;
};


var int lares_peoplemissing_perm;

instance DIA_ADDON_LARES_PEOPLEMISSING(C_INFO)
{
	npc = vlk_449_lares;
	nr = 3;
	condition = dia_addon_lares_peoplemissing_condition;
	information = dia_addon_lares_peoplemissing_info;
	permanent = TRUE;
	description = "About those missing people...";
};


func int dia_addon_lares_peoplemissing_condition()
{
	if((LARES_RANGERHELP == TRUE) && (LARES_PEOPLEMISSING_PERM == FALSE) && ((SC_ISRANGER == FALSE) || (MISSINGPEOPLERETURNEDHOME == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_lares_peoplemissing_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_15_00");	//About those missing people...
	Info_ClearChoices(dia_addon_lares_peoplemissing);
	Info_AddChoice(dia_addon_lares_peoplemissing,DIALOG_BACK,dia_addon_lares_peoplemissing_back);
	if(MISSINGPEOPLERETURNEDHOME == TRUE)
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"I've been able to rescue some of the missing people.",dia_addon_lares_peoplemissing_saved);
	}
	else if((MIS_LARES_BRINGRANGERTOME != 0) && (SCKNOWSMISSINGPEOPLEAREINADDONWORLD == TRUE) && (MISSINGPEOPLERETURNEDHOME == FALSE))
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"I know what became of the missing people.",dia_addon_lares_peoplemissing_success);
	}
	else
	{
		Info_AddChoice(dia_addon_lares_peoplemissing,"Isn't this a case for the militia?",dia_addon_lares_peoplemissing_mil);
		Info_AddChoice(dia_addon_lares_peoplemissing,"Tell me what you know.",dia_addon_lares_peoplemissing_tellme);
	};
};

func void dia_addon_lares_peoplemissing_back()
{
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_tellme()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_TellMe_15_00");	//Tell me what you know.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_01");	//The first was William, one of the fishermen here in Khorinis. One day, he simply didn't return.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_02");	//At first we thought that one of those sea monsters out there had eaten him and his boat for breakfast.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_03");	//But not too long afterwards, other people started disappearing from the town and the surroundings. Pretty random events, though.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_TellMe_09_04");	//Everyone's at a loss so far. The way it looks, we'll just have to wait until we finally stumble across a clue.
	if(SC_HEAREDABOUTMISSINGPEOPLE == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,LOGTEXT_ADDON_SCKNOWSMISSPEAPL);
		Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
		SC_HEAREDABOUTMISSINGPEOPLE = TRUE;
	};
};

func void dia_addon_lares_peoplemissing_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_MIL_15_00");	//Isn't this a case for the militia?
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_01");	//The militia is pretty useless, if you ask me.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_MIL_09_02");	//They're never going to clear this up. The missing people have just vanished into thin air.
};

func void dia_addon_lares_peoplemissing_success()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_00");	//I know what has become of all the missing people!
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_01");	//(surprised) Really.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_02");	//The former ore baron Raven had them kidnapped.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_03");	//Are you sure? Then we need to get them out of there.
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_04");	//I'm working on it.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_Success_09_05");	//All right. But you know, whenever you need my help...
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_Success_15_06");	//... then I'll know where to find you. Understood.
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};

func void dia_addon_lares_peoplemissing_saved()
{
	AI_Output(other,self,"DIA_Addon_Lares_PeopleMissing_SAVED_15_00");	//I've been able to rescue some of the missing people.
	AI_Output(self,other,"DIA_Addon_Lares_PeopleMissing_SAVED_09_01");	//I knew you'd succeed. Then I can finally go about my own business now.
	b_giveplayerxp(XP_AMBIENT);
	LARES_PEOPLEMISSING_PERM = TRUE;
	LARES_CANBRINGSCTOPLACES = TRUE;
	Info_ClearChoices(dia_addon_lares_peoplemissing);
};


var int dia_addon_lares_rangerhelp_gilde_onetime_waffe;
var int dia_addon_lares_rangerhelp_gilde_onetime_geld;
var int dia_addon_lares_rangerhelp_gilde_onetime_ruestung;

instance DIA_ADDON_LARES_RANGERHELP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_addon_lares_rangerhelp_condition;
	information = dia_addon_lares_rangerhelp_info;
	permanent = TRUE;
	description = "I need your help.";
};


func int dia_addon_lares_rangerhelp_condition()
{
	if(((LARES_RANGERHELP == TRUE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE)) || Npc_IsInState(moe,zs_attack))
	{
		return TRUE;
	};
};

func void dia_addon_lares_rangerhelp_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_15_00");	//I need your help.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_09_01");	//And what exactly were you thinking of?
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	Info_AddChoice(dia_addon_lares_rangerhelp,DIALOG_BACK,dia_addon_lares_rangerhelp_nix);
	if(Npc_IsInState(moe,zs_attack))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"That guy is pestering me!",dia_addon_lares_rangerhelp_moe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"I need a better weapon.",dia_addon_lares_rangerhelp_waffe);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"What about some better armor?",dia_addon_lares_rangerhelp_ruestung);
	};
	if((DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD == FALSE) && (LARES_RANGERHELP == TRUE))
	{
		Info_AddChoice(dia_addon_lares_rangerhelp,"I need some money.",dia_addon_lares_rangerhelp_geld);
	};
};

func void dia_addon_lares_rangerhelp_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_00");	//What about some better armor?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_01");	//Mmh. Matteo sells armor. But he'll probably charge you an arm and a leg for it.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_02");	//There is a way you could get it cheaper, though, if you don't mind pulling a fast one on the militia...
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_ruestung_15_03");	//What do you mean?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_04");	//There's a storage area next to Matteo's house. But all the merchandise has been confiscated by the militia.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_05");	//Go to Zuris at the marketplace and get yourself a sleeping spell. Then you send the guards off to dreamland.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_ruestung_09_06");	//I'm sure you'll find some decent armor among Matteo's stock...
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_RUESTUNG = TRUE;
};

func void dia_addon_lares_rangerhelp_waffe()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_waffe_15_00");	//I need a better weapon.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_waffe_09_01");	//There's nothing I can do about that, I'm afraid. Have you tried the marketplace?
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_WAFFE = TRUE;
};

func void dia_addon_lares_rangerhelp_geld()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_geld_15_00");	//I need some money.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_01");	//Don't we all? Sorry, but I have none to give you. But Lehmar the moneylender still owes me a favor.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_geld_09_02");	//Go to him and borrow whatever money you need. I'll take care of the rest. You'll find Lehmar in the harbor district, where it borders on the lower part of town.
	DIA_ADDON_LARES_RANGERHELP_GILDE_ONETIME_GELD = TRUE;
	RANGERHELP_LEHMARKOHLE = TRUE;
	Info_ClearChoices(dia_addon_lares_rangerhelp);
};

func void dia_addon_lares_rangerhelp_nix()
{
	Info_ClearChoices(dia_addon_lares_rangerhelp);
};

func void dia_addon_lares_rangerhelp_moe()
{
	AI_Output(other,self,"DIA_Addon_Lares_Moe_15_00");	//That guy is pestering me...
	AI_Output(self,other,"DIA_Addon_Lares_Moe_09_01");	//Not for long...
	Info_ClearChoices(dia_addon_lares_rangerhelp);
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,moe,AR_GUARDSTOPSFIGHT,0);
};


instance DIA_LARES_PALADINE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_paladine_condition;
	information = dia_lares_paladine_info;
	permanent = FALSE;
	description = "I must talk to the paladins, by any means!";
};


func int dia_lares_paladine_condition()
{
	if((other.guild == GIL_NONE) && (RANGERHELP_GILDEMIL == FALSE) && (RANGERHELP_GILDESLD == FALSE) && (RANGERHELP_GILDEKDF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_paladine_info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//I must talk to the paladins, by all means!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//What do you want from THEM?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//They've got a powerful amulet, the Eye of Innos. I need to have it.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//And you think they'll give it to you? You'll never get into the upper end of town.
	if(!Npc_KnowsInfo(other,dia_addon_lares_vatras))
	{
		AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//I'll find a way somehow.
		AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Sure, if you want to ingratiate yourself with the citizens or play errand boy for the militia...
	};
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "Do you know why the paladins are here?";
};


func int dia_lares_whypalhere_condition()
{
	if(other.guild == GIL_NONE)
	{
		if(Npc_KnowsInfo(other,dia_lares_paladine) || (RANGERHELP_GILDEMIL == TRUE) || (RANGERHELP_GILDESLD == TRUE) || (RANGERHELP_GILDEKDF == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_lares_whypalhere_info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Do you know why the paladins are here?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Nobody knows for sure... Lots of people think it's because of the orcs, but I think there's another reason.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//It probably has something to do with the old penal colony.
};


instance DIA_ADDON_LARES_GILDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_gilde_condition;
	information = dia_addon_lares_gilde_info;
	permanent = TRUE;
	description = "Vatras said you could help me join a community.";
};


func int dia_addon_lares_gilde_condition()
{
	if((LARES_RANGERHELP == TRUE) && (other.guild == GIL_NONE) && (RANGERHELP_GILDEMIL == FALSE) && (RANGERHELP_GILDESLD == FALSE) && (RANGERHELP_GILDEKDF == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lares_gilde_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_15_00");	//Vatras said you could help me join a community.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_01");	//(laughs) Getting tired of being the underdog, are you?
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_02");	//All right. I see your point.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_03");	//I can exert my influence with the mercenaries if you want to join Lee.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_04");	//And I'm sure we can find a way to get you into the monastery soon.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_05");	//But the easiest thing would certainly be for you to join the militia.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_09_06");	//Which community do you prefer?
	Info_ClearChoices(dia_addon_lares_gilde);
	Info_AddChoice(dia_addon_lares_gilde,"I'll think about it...",dia_addon_lares_gilde_back);
	Info_AddChoice(dia_addon_lares_gilde,"The Fire Magicians.",dia_addon_lares_gilde_kdf);
	Info_AddChoice(dia_addon_lares_gilde,"The mercenaries.",dia_addon_lares_gilde_sld);
	Info_AddChoice(dia_addon_lares_gilde,"The militia.",dia_addon_lares_gilde_mil);
};

func void dia_addon_lares_gilde_back()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_BACK_15_00");	//I'll have to think about it...
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_sld()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_SLD_15_00");	//The mercenaries.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_01");	//I'm sure that Lee will accept you.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_01");	//But first you're going to have to pass a test.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_02");	//Go and talk to Cord on Onar's farm.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_Add_09_02");	//He can help you with your test.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_SLD_09_03");	//Tell him that you 'reside beneath my wing'. He'll understand.
	RANGERHELP_GILDESLD = TRUE;
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPSLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPSLD,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Lares said that Cord the mercenary could make life on the landowner's farm easier for me.");
	SC_KNOWSCORDASRANGERFROMLARES = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_mil()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_MIL_15_00");	//The militia.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_01");	//(amused) Yes. I can imagine you'd like that, eh? Read the law to other people while you're pocketing their purses.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_02");	//The paladins have set up their provisions store by the harbor. Their provisions master is a good friend of mine.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_MIL_09_03");	//Maybe he can do something for you. His name is Martin.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPMIL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPMIL,"Lares said that Martin the provision master will help me join the militia sooner. He is usually found at the harbor where the paladins have their provisions store.");
	RANGERHELP_GILDEMIL = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};

func void dia_addon_lares_gilde_kdf()
{
	AI_Output(other,self,"DIA_Addon_Lares_Gilde_KDF_15_00");	//The Fire Magicians.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_01");	//(laughs) I bet Vatras didn't foresee that, or he wouldn't have sent you to me.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_02");	//Joining the monastery is expensive.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_03");	//Those boys won't even let you in unless you pay them a tribute.
	AI_Output(self,other,"DIA_Addon_Lares_Gilde_KDF_09_04");	//And the only one who could do anything about that is Vatras himself. You had better talk to him again about this.
	Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Lares said that Vatras knows an easy way to get into the monastery.");
	RANGERHELP_GILDEKDF = TRUE;
	Info_ClearChoices(dia_addon_lares_gilde);
};


var int lares_workforlee;
var int lares_waytoonar;

instance DIA_LARES_ABOUTSLD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_aboutsld_condition;
	information = dia_lares_aboutsld_info;
	permanent = TRUE;
	description = "Tell me more about Lee and his mercenaries...";
};


func int dia_lares_aboutsld_condition()
{
	if((other.guild == GIL_NONE) && (LARES_WAYTOONAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_aboutsld_info()
{
	AI_Output(other,self,"DIA_ADDON_Lares_AboutSld_15_00");	//Tell me more about Lee and his mercenaries...
	AI_Output(self,other,"DIA_ADDON_Lares_AboutSld_09_01");	//What do you want to know?
	Info_ClearChoices(dia_lares_aboutsld);
	Info_AddChoice(dia_lares_aboutsld,DIALOG_BACK,dia_lares_aboutsld_back);
	Info_AddChoice(dia_lares_aboutsld,"Why aren't YOU with Lee and his mercenaries?",dia_lares_aboutsld_whynotyou);
	Info_AddChoice(dia_lares_aboutsld,"Tell me more about the mercenaries...",dia_lares_aboutsld_sld);
	Info_AddChoice(dia_lares_aboutsld,"How do I find the landowner's farm?",dia_lares_aboutsld_waytoonar);
};

func void dia_lares_aboutsld_back()
{
	Info_ClearChoices(dia_lares_aboutsld);
};

func void dia_lares_aboutsld_sld()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Tell me more about the mercenaries.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Well, if you're as tough as you were back then, you shouldn't have any problems with them.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Most of them are ruffians and if you can't stand up to them, you won't get far.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(laughs) If you're squeamish, you don't have a chance of landing with them...
};

func void dia_lares_aboutsld_whynotyou()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//Why aren't YOU with Lee and his mercenaries?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//But I am! Just not on the farm.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//You could say I'm our outpost in the city. We don't want the ship to sail without us.
	LARES_WORKFORLEE = TRUE;
	Info_AddChoice(dia_lares_aboutsld,"What ship were you talking about?",dia_lares_aboutsld_schiff);
};

func void dia_lares_aboutsld_schiff()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//What ship were you talking about?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//It's on the open sea harbor, behind the cliffs. Lee and a few of his people really want to get away from here.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//But that could take a while...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Why?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//You'd better ask Lee about that, if you meet him... He's got plans.
};

func void dia_lares_aboutsld_waytoonar()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//How do I find the landowner's farm?
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_00");	//It's quite simple. You leave the seaport by the east gate, and then follow the path towards the east.
	AI_Output(self,other,"DIA_Addon_Lares_WegZumHof_09_01");	//I can take you there if you want.
	LARES_WAYTOONAR = TRUE;
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 14;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "Do you know anything about a thieves' guild in town?";
};


func int dia_lares_guildofthieves_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Do you know anything about a thieves' guild in town?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//The questions you ask...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Of course, there's a thieves' guild here. Just like in every big city.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//And every petty pickpocket or fence is probably connected to it somehow.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 15;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "Do you know where I can find the thieves' guild?";
};


func int dia_lares_whereguildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_guildofthieves) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_whereguildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Do you know where I can find the thieves' guild?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(laughs) No offense, but even if I knew, I wouldn't tell you anything.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//These people usually react VERY sensitively to things like that.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//If you want to get involved with them, you should be very careful.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 16;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "I've got this key here. It's been corroded by sea salt...";
};


func int dia_lares_gotkey_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_whereguildofthieves) && Npc_HasItems(other,itke_thiefguildkey_mis) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_gotkey_info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//I've got this key here. It's been corroded by sea salt...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//So?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//I think it will lead me to the hideout of the thieves' guild...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Well, it could be the key to the sewers.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 17;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "Where can I find the sewers?";
};


func int dia_lares_kanalisation_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gotkey) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_kanalisation_info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Where can I find the sewers?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//What do I know... they usually empty into the ocean.
};


instance DIA_LARES_OTHERGUILD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_otherguild_condition;
	information = dia_lares_otherguild_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_otherguild_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild != GIL_NONE) && (SC_ISRANGER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_otherguild_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//You're in the militia now!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(laughs) I'm gonna laugh myself sick - a former convict in the militia...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//So now you're one of the King's paladins!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(mischievously) Only you could pull something like that...
		if(LARES_WORKFORLEE == TRUE)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(concerned) You won't blow the whistle on me about working for Lee, will you?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//But you know me...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//I don't get it. You entered the monastery. What's it like there?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//Different.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//I can imagine.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Addon_Lares_OtherGuild_09_00");	//I heard that you have been accepted to join Lee.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Congratulations.
	};
};


instance DIA_ADDON_LARES_FOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_addon_lares_forest_condition;
	information = dia_addon_lares_forest_info;
	description = "Can you help me get through the thick woods in the east?";
};


func int dia_addon_lares_forest_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lares_forest_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_00");	//Can you help me get through the thick woods in the east?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_01");	//Okay. But what do you want to go there for?
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_02");	//Nefarius ordered me to find more ornaments.
	AI_Output(other,self,"DIA_Addon_Lares_RangerHelp_Forest_15_03");	//One of the places where I'm supposed to look is in the middle of the woods.
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_04");	//I see. And that's still too dangerous for you alone, right?
	AI_Output(self,other,"DIA_Addon_Lares_RangerHelp_Forest_09_05");	//No problem. Let me know when you want to leave.
	RANGERHELP_ORNAMENTFOREST = TRUE;
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = TRUE;
	description = "OK, let's go.";
};


func int dia_lares_gonow_condition()
{
	if(((LARES_WAYTOONAR == TRUE) || (MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) || (RANGERHELP_ORNAMENTFOREST == TRUE)) && ((LARESGUIDE_ZUMPORTAL == 0) || (LARESGUIDE_ZUMPORTAL == 8)) && ((LARESGUIDE_ZUONAR == FALSE) || (LARESGUIDE_ZUONAR == LOG_SUCCESS)) && ((LARESGUIDE_ORNAMENTFOREST == 0) || (LARESGUIDE_ORNAMENTFOREST == 3)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lares_gonow_goingconditions()
{
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Then let's go... Follow me.
	AI_StopProcessInfos(self);
	LARES_GUIDE = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	if(Npc_KnowsInfo(other,dia_moe_hallo) == FALSE)
	{
		Npc_SetRefuseTalk(moe,30);
	};
};

func void dia_lares_gonow_info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Okay, let's go.
	if(LARES_CANBRINGSCTOPLACES == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_03");	//I cannot leave here until we know more about the missing people, or someone else takes over my duties.
	}
	else if(MIS_ADDON_LARES_COMETORANGERMEETING == LOG_RUNNING)
	{
		b_lares_geheimtreffen();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GoNow_09_04");	//Where?
		Info_ClearChoices(dia_lares_gonow);
		Info_AddChoice(dia_lares_gonow,DIALOG_BACK,dia_lares_gonow_warte);
		if((LARES_WAYTOONAR == TRUE) && (LARESGUIDE_ZUONAR != LOG_SUCCESS))
		{
			Info_AddChoice(dia_lares_gonow,"To Onar's farm.",dia_lares_gonow_onar);
		};
		if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (LARES_ANGEKOMMEN == FALSE))
		{
			Info_AddChoice(dia_lares_gonow,"Let us take Vatras' ornament back.",dia_lares_gonow_maya);
		};
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && (LARESGUIDE_ORNAMENTFOREST == 0) && (RANGERHELP_ORNAMENTFOREST == TRUE))
		{
			Info_AddChoice(dia_lares_gonow,"To the dense forest in the east.",dia_lares_gonow_forest);
		};
	};
};

func void dia_lares_gonow_maya()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Maya_15_00");	//Let us take Vatras' ornament back.
	LARESGUIDE_ZUMPORTAL = 1;
	Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_onar()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Onar_15_00");	//To Onar's farm.
	LARESGUIDE_ZUONAR = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_forest()
{
	AI_Output(other,self,"DIA_Addon_Lares_GoNow_Forest_15_00");	//To the dense forest in the east.
	LARESGUIDE_ORNAMENTFOREST = 1;
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD1");
	dia_lares_gonow_goingconditions();
};

func void dia_lares_gonow_warte()
{
	Info_ClearChoices(dia_lares_gonow);
};


instance DIA_LARES_GUIDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_guide_condition;
	information = dia_lares_guide_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_guide_condition()
{
	if((LARESGUIDE_ZUONAR == TRUE) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_BIGFARM_05"))
	{
		return TRUE;
	};
};

func void dia_lares_guide_info()
{
	if(LARES_GUIDE > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//So, here we are.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//So there you are. I was beginning to think you'd been eaten by wolves.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//So, the rest of the way you can manage alone. I have to get back to the city, I've got a few things to take care of...
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Just follow this road here, and remember - stand up for yourself and don't take any crap, and it'll be smooth sailing.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LARESGUIDE_ZUONAR = LOG_SUCCESS;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTER1(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportalinter1_condition;
	information = dia_addon_lares_arrivedportalinter1_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinter1_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FOREST_11") && (LARESGUIDE_ZUMPORTAL == 1))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinter1_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_00");	//Now that we're no longer in town and cannot be overheard, let me tell you a little more.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_09_01");	//We are now going to take this ornament that you brought me back to Saturas. You remember Saturas, don't you?
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Sure.",dia_addon_lares_arrivedportalinter1_ja);
	Info_AddChoice(dia_addon_lares_arrivedportalinter1,"Saturas? Who is that?",dia_addon_lares_arrivedportalinter1_wer);
	LARESGUIDE_ZUMPORTAL = 2;
};

func void dia_addon_lares_arrivedportalinter1_teil2()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_00");	//We lads from the former New Camp still have good relations with the Water Mages.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_01");	//Even Lee will still protect the Water Mages against any danger today if it is within his power.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_02");	//To keep up the contact with the Water Mages, I'm in town most of the time, working together with Vatras.
	b_makerangerreadyformeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_03");	//And this is the armor that is issued to each of us by the Water Mages. The members of the Ring of Water have been wearing such armor since before the orc wars.
	if(CAVALORN_RANGERHINT == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_15_04");	//What is Cavalorn's part in this? He wasn't a follower of the New Camp as far as I know.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_05");	//You are right, our community has grown. Even I do not know how many there are by now.
	};
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_teil2_09_06");	//But let us move on. I want to get further away from the city. We can talk more about it later.
	Info_ClearChoices(dia_addon_lares_arrivedportalinter1);
};

func void dia_addon_lares_arrivedportalinter1_wer()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_wer_15_00");	//Saturas? Who is that?
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_01");	//He was the head of the Water Mages in the New Camp, back in the Valley of Mines when the Barrier was still around us all.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter1_wer_09_02");	//Lee and I had made a pact with the Water Mages back then. Together, we were strong enough to hold up against the Old Camp.
	dia_addon_lares_arrivedportalinter1_teil2();
};

func void dia_addon_lares_arrivedportalinter1_ja()
{
	AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInter1_ja_15_00");	//Certainly. He was the leader of the Water Mages in the New Camp.
	b_giveplayerxp(50);
	dia_addon_lares_arrivedportalinter1_teil2();
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter_condition;
	information = dia_addon_lares_arrivedportalinterweiter_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERN_TO_FOREST_02") && (LARESGUIDE_ZUMPORTAL == 2))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_00");	//What's wrong? Are you still holding up?
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING) && (Npc_GetDistToWP(erol,"NW_TAVERN_TO_FOREST_03") < 1000) && (Npc_IsDead(erol) == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Lares_ArrivedPortalInterWeiter_15_01");	//That fellow over there has problems with bandits.
		AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter_09_02");	//(snidely) Too bad for him, but we don't have time for that now.
	};
	LARESGUIDE_ZUMPORTAL = 3;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter2_condition;
	information = dia_addon_lares_arrivedportalinterweiter2_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter2_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_TROLLAREA_14") && (LARESGUIDE_ZUMPORTAL == 3))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter2_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter2_09_00");	//Don't you break down on me now.
	LARESGUIDE_ZUMPORTAL = 4;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTER2(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportalinter2_condition;
	information = dia_addon_lares_arrivedportalinter2_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinter2_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_PATH_58") && (LARESGUIDE_ZUMPORTAL == 4))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinter2_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_00");	//The Water Mages are all beside themselves. They've been digging at an excavation site in the north-east for weeks. It's anybody's guess what they're trying to find there.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_01");	//It all started when the earth began trembling like it did in the worst times of the Barrier.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_02");	//Horrible stone creatures emerged from the ground, slaying everyone who went within 100 feet of them.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_03");	//The Water Mages took the matter in hand and destroyed those hostile invaders. And now they're digging down there, searching for an explanation for these strange events.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInter2_09_04");	//But you will soon see for yourself.
	LARESGUIDE_ZUMPORTAL = 5;
	b_logentry(TOPIC_ADDON_KDW,"Lares told me about the Water Mages' excavation site. They are investigating some peculiar events. There have been mysterious earthquakes, and strange stone creatures emerging from the ground.");
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER3(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter3_condition;
	information = dia_addon_lares_arrivedportalinterweiter3_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter3_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_47") < 200) && (LARESGUIDE_ZUMPORTAL == 5))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter3_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter3_09_00");	//Can you still go on?
	LARESGUIDE_ZUMPORTAL = 6;
};


instance DIA_ADDON_LARES_ARRIVEDPORTALINTERWEITER4(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_addon_lares_arrivedportalinterweiter4_condition;
	information = dia_addon_lares_arrivedportalinterweiter4_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportalinterweiter4_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_02") && (LARESGUIDE_ZUMPORTAL == 6))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportalinterweiter4_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortalInterWeiter4_09_00");	//Right. It could get dangerous here.
	LARESGUIDE_ZUMPORTAL = 7;
};


instance DIA_ADDON_LARES_ARRIVEDPORTAL(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_arrivedportal_condition;
	information = dia_addon_lares_arrivedportal_info;
	important = TRUE;
};


func int dia_addon_lares_arrivedportal_condition()
{
	if((MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_RUNNING) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TROLLAREA_RUINS_41") && (LARESGUIDE_ZUMPORTAL == 7))
	{
		return TRUE;
	};
};

func void dia_addon_lares_arrivedportal_info()
{
	b_makerangerreadytoleavemeeting(self);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_00");	//We're here.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_01");	//Here, take the ornament. The Water Mages must be in there somewhere. Take it to them.
	b_giveinvitems(self,other,itmi_ornament_addon_vatras,1);
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_02");	//If you should meet any beasts down in that hole in the ground that look like they're too much for you, flee forward to Saturas.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_03");	//He'll take care of the beasts for you. I need to go back.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_04");	//And one more thing: Don't even think about strolling around for long with this ornament. Go DIRECTLY to Saturas.
	AI_Output(self,other,"DIA_Addon_Lares_ArrivedPortal_09_05");	//See you.
	b_logentry(TOPIC_ADDON_KDW,"Lares handed me this ornament. He wants me to give it to Saturas the Water Mage.");
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
	LARESGUIDE_ZUMPORTAL = 8;
	LARES_ANGEKOMMEN = TRUE;
};


instance DIA_ADDON_LARES_ALBERN(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_albern_condition;
	information = dia_addon_lares_albern_info;
	important = TRUE;
};


func int dia_addon_lares_albern_condition()
{
	if((LARES_ANGEKOMMEN == TRUE) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RUINS_41") > 1000) && (MIS_ADDON_LARES_ORNAMENT2SATURAS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_lares_albern_info()
{
	AI_Output(self,other,"DIA_Addon_Lares_Albern_09_00");	//(strictly) Stop goofing off! Take that ornament to Saturas already!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LARES_GOFORESTPRE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_goforestpre_condition;
	information = dia_addon_lares_goforestpre_info;
	important = TRUE;
};


func int dia_addon_lares_goforestpre_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_TO_FARM2_04") && (LARESGUIDE_ORNAMENTFOREST == 1))
	{
		return TRUE;
	};
};

func void dia_addon_lares_goforestpre_ja()
{
	b_makerangerreadyformeeting(self);
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_ja_15_00");	//Yes.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_ja_09_01");	//All right, my friend. Then follow me. This is going to be gross.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEMEDIUMWALD2");
	LARESGUIDE_ORNAMENTFOREST = 2;
};

func void dia_addon_lares_goforestpre_nein()
{
	AI_Output(other,self,"DIA_Addon_Lares_GOFORESTPRE_nein_15_00");	//No. You can go.
	AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_nein_09_01");	//I guess the matter has taken care of itself? All right. See you.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	LARESGUIDE_ORNAMENTFOREST = 3;
};

func void dia_addon_lares_goforestpre_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_00");	//Do you still want to go into the woods with me?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFORESTPRE_09_01");	//Have you thought about going into the woods? Do you really want to do that?
	};
	Info_ClearChoices(dia_addon_lares_goforestpre);
	Info_AddChoice(dia_addon_lares_goforestpre,"No. You can go.",dia_addon_lares_goforestpre_nein);
	Info_AddChoice(dia_addon_lares_goforestpre,"Yes.",dia_addon_lares_goforestpre_ja);
};


instance DIA_ADDON_LARES_GOFOREST(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_goforest_condition;
	information = dia_addon_lares_goforest_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_lares_goforest_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_FOREST_PATH_62") && (LARESGUIDE_ORNAMENTFOREST == 2) && Npc_IsDead(stoneguardian_ornament))
	{
		if((ORNAMENT_SWITCHED_FOREST == FALSE) && Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
		if(ORNAMENT_SWITCHED_FOREST == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_addon_lares_goforest_info()
{
	if(ORNAMENT_SWITCHED_FOREST == TRUE)
	{
		b_makerangerreadytoleavemeeting(self);
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_00");	//There. You should be able to do the rest by yourself. I'm headed back, then.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
		LARESGUIDE_ORNAMENTFOREST = 3;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_GOFOREST_09_01");	//Hurry up. I don't want to stay here any longer than I have to.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_LARES_PORTALINTERWEITER(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_addon_lares_portalinterweiter_condition;
	information = dia_addon_lares_portalinterweiter_info;
	permanent = TRUE;
	description = "Let's move on.";
};


func int dia_addon_lares_portalinterweiter_condition()
{
	if((LARESGUIDE_ZUMPORTAL != 0) && (LARESGUIDE_ZUMPORTAL != 8))
	{
		return TRUE;
	};
};

func void dia_addon_lares_portalinterweiter_info()
{
	if(LARESGUIDE_ZUMPORTAL == 4)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_00");	//Stop blabbing.
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_01");	//(irritated) Yeah, yeah.
	};
	AI_Output(other,self,"DIA_Addon_Lares_PortalInterWEITER_15_02");	//Let's move on.
	if(LARESGUIDE_ZUMPORTAL == 7)
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_03");	//Keep back a little.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lares_PortalInterWEITER_09_04");	//Stay close behind me.
	};
	AI_StopProcessInfos(self);
	if(LARESGUIDE_ZUMPORTAL == 2)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL2");
	}
	else if(LARESGUIDE_ZUMPORTAL == 3)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL3");
	}
	else if(LARESGUIDE_ZUMPORTAL == 4)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL4");
	}
	else if(LARESGUIDE_ZUMPORTAL == 5)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL5");
	}
	else if(LARESGUIDE_ZUMPORTAL == 6)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPEL6");
	}
	else if(LARESGUIDE_ZUMPORTAL == 7)
	{
		Npc_ExchangeRoutine(self,"GUIDEPORTALTEMPELEND");
	};
};


instance DIA_LARES_DEX(C_INFO)
{
	npc = vlk_449_lares;
	nr = 20;
	condition = dia_lares_dex_condition;
	information = dia_lares_dex_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Lares_DEX_Add_09_01");	//Sure. I can help you become stronger and more dexterous if you like.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Lares can help me become stronger and more dextrous.");
};


var int lares_merkedex;
var int lares_merkestr;

instance DIA_LARES_TEACH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 20;
	condition = dia_lares_teach_condition;
	information = dia_lares_teach_info;
	permanent = TRUE;
	description = "Teach me something.";
};


func int dia_lares_teach_condition()
{
	if(LARES_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_lares_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Lares_Teach_15_00");	//Teach me something.
	LARES_MERKEDEX = other.attribute[ATR_DEXTERITY];
	LARES_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_lares_teachstr_5);
};

func void dia_lares_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > LARES_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//You've already gotten more dexterous.
	};
	if(other.attribute[ATR_STRENGTH] > LARES_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_Lares_TEACH_BACK_Add_09_00");	//(appraisingly). Good. Your strength has increased.
	};
	Info_ClearChoices(dia_lares_teach);
};

func void dia_lares_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_lares_teachstr_5);
};

func void dia_lares_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_lares_teachstr_5);
};

func void dia_lares_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_LOW);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_lares_teachstr_5);
};

func void dia_lares_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_LOW);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_lares_teach_5);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_lares_teachstr_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_lares_teachstr_5);
};


instance DIA_LARES_KAP2_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap2_exit_condition;
	information = dia_lares_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_lares_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP3_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap3_exit_condition;
	information = dia_lares_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_ANYNEWS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_anynews_condition;
	information = dia_lares_anynews_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_lares_anynews_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_anynews_info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Any news?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//You're responsible for the best news yourself. They've let Bennet go again, he's back at the farm.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Go to him, I think he'd like to thank you himself.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//You could say so. The paladins have arrested Bennet, our smith.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//So I've heard. That's a bad business.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//You can say that again.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//How did that happen?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Bennet went to town to buy supplies. Well, he never came back.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//If you want to learn more, you should ask Hodges, he was in the city with Bennet.
			MIS_RESCUEBENNET = LOG_RUNNING;
		};
	};
};


instance DIA_LARES_NEWSABOUTBENNET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_newsaboutbennet_condition;
	information = dia_lares_newsaboutbennet_info;
	permanent = FALSE;
	description = "Any news of Bennet?";
};


func int dia_lares_newsaboutbennet_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_newsaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Any news of Bennet?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//They seem to have taken him to the barracks and tossed him into the dungeon.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//How can we get him out of there?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//I don't have any ideas so far. I can't get to his cell to talk to him.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//All I can do is keep my ears open, but there isn't much to learn around here.
};


instance DIA_LARES_KAP4_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap4_exit_condition;
	information = dia_lares_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP4_PERM(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_kap4_perm_condition;
	information = dia_lares_kap4_perm_info;
	permanent = TRUE;
	description = "Why aren't you out hunting dragons?";
};


func int dia_lares_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Why aren't you out hunting dragons?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//That's not my kind of thing, I'll leave that to the others.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Nah, nah. Fresh sea air - that's what I need now.
};


instance DIA_LARES_KAP5_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap5_exit_condition;
	information = dia_lares_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lares_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_knowwhereenemy_condition;
	information = dia_lares_knowwhereenemy_info;
	permanent = TRUE;
	description = "Would you want to leave this island?";
};


func int dia_lares_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LARES_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Would you fancy leaving this island?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//More than anything. What have you got in mind?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//I found out where the leader of the dragons is hiding. He's on an island, not far from here.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//I intend to get rid of him for good.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Sounds like a blast. If you can use me, I'm in.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Couldn't you use a teacher for dexterity or combat with one-handed weapons on your journey?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//The ship's already full, but I'll get back to you if there is a change.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"I have no use for you.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"I knew I could rely on you.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//I knew I could rely on you.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//We're all going to meet at the ship.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//A man of action, that's what I like. See you later.
	LARES_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};

func void dia_lares_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//I appreciate your offer, but I have no use for you.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//You must know what you want. If you want to talk about it later, you know where to find me.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};


instance DIA_LARES_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_leavemyship_condition;
	information = dia_lares_leavemyship_info;
	permanent = TRUE;
	description = "It's better if you don't come along.";
};


func int dia_lares_leavemyship_condition()
{
	if((LARES_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//It's better if you don't come along.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//As you like, but in the future, think about what you promise to whom.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LARES_STILLNEEDYOU(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_stillneedyou_condition;
	information = dia_lares_stillneedyou_info;
	permanent = TRUE;
	description = "Are you still interested in the voyage?";
};


func int dia_lares_stillneedyou_condition()
{
	if(((LARES_ISONBOARD == LOG_OBSOLETE) || (LARES_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lares_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Are you still interested in the voyage?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Normally, I don't let people treat me like that, but since you're one of us, I'll let you get away with it this time.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//We'll meet on the ship.
		LARES_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Don't take it personally, but I think you were right.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//It's better if I stay here.
		AI_StopProcessInfos(self);
	};
};

