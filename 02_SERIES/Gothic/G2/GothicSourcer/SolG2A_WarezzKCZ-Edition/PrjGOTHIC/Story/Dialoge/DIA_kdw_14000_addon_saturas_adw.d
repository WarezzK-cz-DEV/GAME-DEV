
instance DIA_ADDON_SATURAS_ADW_EXIT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 999;
	condition = dia_addon_saturas_adw_exit_condition;
	information = dia_addon_saturas_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_saturas_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_saturas_adw_exit_info()
{
	AI_StopProcessInfos(self);
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXIT_14_00");	//May Adanos protect you.
};


instance DIA_ADDON_SATURAS_ADWSTART(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 1;
	condition = dia_addon_saturas_adwstart_condition;
	information = dia_addon_saturas_adwstart_info;
	important = TRUE;
};


func int dia_addon_saturas_adwstart_condition()
{
	return TRUE;
};

func void dia_addon_saturas_adwstart_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_00");	//Adanos be thanked. You are finally here. We thought you would not show up again.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_01");	//(confused) What? How are you already HERE?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_02");	//You went through the portal and we followed you. It did not take long before we arrived here.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_03");	//However, you were not there. We have been here for several days.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_15_04");	//(surprised) SEVERAL DAYS? How can that be?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_05");	//After we could not find you anywhere, Nefarius sought to ascertain what might have gone wrong. He seemed to be thoroughly baffeled until now.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_14_06");	//Well. Now you are here and can begin your work.
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(giant_rat,"ADW_PORTALTEMPEL_11");
	Info_ClearChoices(dia_addon_saturas_adwstart);
	Info_AddChoice(dia_addon_saturas_adwstart,"What happened in the meantime?",dia_addon_saturas_adwstart_was);
};

func void dia_addon_saturas_adwstart_was()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_was_15_00");	//What happened in the meantime?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_01");	//We have collected many new insights.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_02");	//The earthquakes do indeed appear to be STRONGER here. We are not very far from their center now.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_03");	//The builders of these old structures erected a city here in their day, so much we can already say.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_04");	//However, for some reason their culture came to an end.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_was_14_05");	//But so far, we can only speculate as to why.
	Info_AddChoice(dia_addon_saturas_adwstart,"Have you found a trace of the missing people?",dia_addon_saturas_adwstart_missingpeople);
	Info_AddChoice(dia_addon_saturas_adwstart,"What about Raven?",dia_addon_saturas_adwstart_raven);
};

func void dia_addon_saturas_adwstart_raven()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_Raven_15_00");	//What about Raven?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_01");	//In his letter, Raven spoke of a temple and that he was trying to get inside.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_02");	//We are unanimously of the opinion that it is a temple of Adanos that Raven seeks to desecrate.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_03");	//The earthquakes are obviously the result of unholy incantations which keep colliding with a powerful spell.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_04");	//The gates of the temple are magically sealed, and this is the very magic that makes the stone sentinels arise.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_Raven_14_05");	//The temple is defending itself. We must stop Raven before he can penetrate into the holy of holies.
	Info_AddChoice(dia_addon_saturas_adwstart,"What happens next?",dia_addon_saturas_adwstart_wastun);
	Info_AddChoice(dia_addon_saturas_adwstart,"Raven is only a former ore baron, not a magician.",dia_addon_saturas_adwstart_ravenonlybaron);
	Info_AddChoice(dia_addon_saturas_adwstart,"What does Raven want in the temple?",dia_addon_saturas_adwstart_ravenaim);
};

func void dia_addon_saturas_adwstart_ravenaim()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenAim_15_00");	//What does Raven want in the temple?
	AI_Output(self,other,"DIA_Addon_Bodo_14_01");	//We only know that it has to do with a powerful artifact that is somehow connected to Adanos and Beliar.
	AI_Output(self,other,"DIA_Addon_Bodo_14_02");	//(grimly) We can certainly assume that he is not up to anything good...
};

func void dia_addon_saturas_adwstart_ravenonlybaron()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00");	//Raven is only a former ore baron, not a magician. How can HE carry out an invocation like that?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01");	//Perhaps it is not he himself, but rather a renegade magician in his pay.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02");	//One way or another, we MUST avert the evil.
};

func void dia_addon_saturas_adwstart_missingpeople()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_missingPeople_15_00");	//Have you found a trace of the missing people?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_01");	//Only yesterday we found the body of a fisherman. He was lying under one of the ruins to the east.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_missingPeople_14_02");	//It looks as though the fisherman was from Khorinis. You should look into this.
	SATURAS_ABOUTWILLIAM = TRUE;
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
};

func void dia_addon_saturas_adwstart_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun_15_00");	//What happens next?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_01");	//WE shall remain here and continue studying the ancient culture.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_02");	//The old scripts of the builders conceal a great many secrets which we must reveal - if we want to understand what happened here back then.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun_14_03");	//Meanwhile, YOU must do a few things for us...
	Info_AddChoice(dia_addon_saturas_adwstart,"What should I do?",dia_addon_saturas_adwstart_wastun2);
};

func void dia_addon_saturas_adwstart_wastun2()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_00");	//What should I do?
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_01");	//You must find Raven and prevent him from desecrating the temple of Adanos.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_02");	//You mean I should KILL him.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_03");	//If that is the only way to stop him, then in Adanos' name... YES!
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_04");	//On your way, collect all the ancient relics and inscriptions of the builders you can find and bring them to us.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_05");	//We must know more about these people and their demise.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_06");	//Only when we see through Raven's plans can we thwart them.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_07");	//Furthermore, you must find a way to free the slaves.
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_wastun2_15_08");	//(cynically) Is that all? I can do that left-handed.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_wastun2_14_09");	//(annoyed) I know that it is much to ask. Regard it as a chance to regain my trust.
	MIS_ADDON_SATURAS_GOTORAVEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven is desecrating the holy temple of Adanos. I must stop him. Even if it means that I have to kill him.");
	Log_CreateTopic(TOPIC_ADDON_SKLAVEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKLAVEN,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_SKLAVEN,"Saturas wants me to free the slaves.");
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,"Saturas wants me to bring him anything that could provide more information about the old people of the builders.");
	Info_AddChoice(dia_addon_saturas_adwstart,"I'll get going then.",dia_addon_saturas_adwstart_back);
};

func void dia_addon_saturas_adwstart_back()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADWStart_back_15_00");	//I'll get going then.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_01");	//One more thing... Raven has gathered a large number of bandits about him.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_02");	//In your abscence, we have fetched another member of the Ring of Water here.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_03");	//We sent him into the swamp. He did not come back.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_04");	//We suspect that the bandits attack everyone who does not look as they do.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_05");	//So, acquire some of the bandits' armor.
	AI_Output(self,other,"DIA_Addon_Saturas_ADWStart_back_14_06");	//That is the only way you will get close to them without being attacked right away.
	Log_CreateTopic(TOPIC_ADDON_BDTRUESTUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BDTRUESTUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"The bandits shoot at anything that doesn't look like they do. I need some bandit armor if I want to get close to them.");
	IntroduceChapter(KAPWECHSEL_2_3,KAPWECHSEL_2_3_TEXT,"InterMezzo1.tga","chapter_01.wav",6000);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SATURAS_POORRANGER(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_poorranger_condition;
	information = dia_addon_saturas_poorranger_info;
	description = "What poor swine did you send into the swamp?";
};


func int dia_addon_saturas_poorranger_condition()
{
	return TRUE;
};

func void dia_addon_saturas_poorranger_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PoorRanger_15_00");	//What poor swine did you send into the swamp?
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_01");	//His name was Lance.
	AI_Output(self,other,"DIA_Addon_Saturas_PoorRanger_14_02");	//I am afraid he did not get very far.
	Log_CreateTopic(TOPIC_ADDON_LANCE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_LANCE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_LANCE,"Saturas sent someone named Lance into the swamp. Saturas is afraid that Lance didn't get very far.");
};


instance DIA_ADDON_SATURAS_PIRATEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_piraten_condition;
	information = dia_addon_saturas_piraten_info;
	description = "Where will I find bandit armor that fits me?";
};


func int dia_addon_saturas_piraten_condition()
{
	if((alligatorjack.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (greg.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_piraten_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Piraten_15_00");	//Where will I find bandit armor that fits me?
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_01");	//There seems to be a camp of pirates to the west.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_02");	//As far as we know, they are in contact with the bandits.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_03");	//I do not think that they will attack you if you approach them.
	AI_Output(self,other,"DIA_Addon_Saturas_Piraten_14_04");	//Perhaps you can find some help with them...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Saturas says that the pirates could help me in my hunt for the armor.");
};


instance DIA_ADDON_SATURAS_LANCELEICHE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_lanceleiche_condition;
	information = dia_addon_saturas_lanceleiche_info;
	description = "I found Lance's body.";
};


func int dia_addon_saturas_lanceleiche_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_poorranger) && (Npc_HasItems(none_addon_114_lance_adw,itri_lancering) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lanceleiche_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceLeiche_15_00");	//I found Lance's body.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_01");	//May his soul enter the realm of Adanos.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceLeiche_14_02");	//Be careful, my son. I do not want to mourn another such loss.
	TOPIC_END_LANCE = TRUE;
	b_giveplayerxp(XP_ADDON_LANCELEICHE);
};


instance DIA_ADDON_SATURAS_LANCERING(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_lancering_condition;
	information = dia_addon_saturas_lancering_info;
	description = "I have Lance's aquamarine ring here.";
};


func int dia_addon_saturas_lancering_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_lanceleiche) && Npc_HasItems(other,itri_lancering))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_lancering_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//I have Lance's aquamarine ring here.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//You had better give it to me so that it does not fall into the wrong hands.
	b_giveinvitems(other,self,itri_lancering,1);
	b_giveplayerxp(XP_ADDON_LANCERING);
};


instance DIA_ADDON_SATURAS_TOKENS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 10;
	condition = dia_addon_saturas_tokens_condition;
	information = dia_addon_saturas_tokens_info;
	permanent = TRUE;
	description = "About the relics...";
};


func int dia_addon_saturas_tokens_condition()
{
	if(SATURAS_SCBROUGHTALLTOKEN == FALSE)
	{
		return TRUE;
	};
};


var int dia_addon_saturas_tokens_onetime;
var int saturas_scbroughtalltoken;
var int saturas_broughttokenamount;
var int scbroughttoken;
var int saturas_scfound_itmi_addon_stone_01;
var int saturas_scfound_itmi_addon_stone_02;
var int saturas_scfound_itmi_addon_stone_03;
var int saturas_scfound_itmi_addon_stone_04;
var int saturas_scfound_itmi_addon_stone_05;

func void dia_addon_saturas_tokens_info()
{
	var int broughttoken;
	var int xp_broughttokens;
	var int kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//About the relics...
	if((DIA_ADDON_SATURAS_TOKENS_ONETIME == FALSE) && (c_schasmagicstoneplate() || Npc_HasItems(other,itwr_stoneplatecommon_addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//I think I have something here for you.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//We already know this sort of stone tablet. They will not get us any further now.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//There must be more than that.
		DIA_ADDON_SATURAS_TOKENS_ONETIME = TRUE;
	};
	broughttoken = 0;
	xp_broughttokens = 0;
	if((Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE)) || (Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//What about THIS?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//That looks good. Where did you find that?
		b_logentry(TOPIC_ADDON_RELICTS,"I have given Saturas the following relics:");
		if(Npc_HasItems(other,itmi_addon_stone_01) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_01 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_01,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_01 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_06");	//The bandits use these stone tablets as a sort of currency.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_07");	//The tablets bear the sign of Quahodron, a great warrior.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_08");	//He is the commander whose son Rhademes caused the downfall of the entire city.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_09");	//(contemptuously) Tsk. I bet the bandits don't even know what it is they are trading there.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"A red stone tablet that the bandits use as currency. It bears the name of the great warrior Quarhodron.");
		};
		if(Npc_HasItems(other,itmi_addon_stone_02) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_02,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_02 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_10");	//I found these tablets in a building to the south.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_11");	//Ah! A tablet of the guardians of the dead. It was they who summoned the spirits of their dead.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_12");	//The builders' connection to their ancestors was very strong.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"#NAME?");
		};
		if(Npc_HasItems(other,itmi_addon_stone_03) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_03,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_03 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_13");	//I found these tablets in a structure to the southwest.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_14");	//Judging from the tablet, it has something to do with the housing for the priests of the city.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_15");	//The name of the highest priest was KHARDIMON. We don't know much about him.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"#NAME?");
		};
		if(Npc_HasItems(other,itmi_addon_stone_04) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_04,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_04 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_15");	//This thing was lying in a building near the great swamp.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_16");	//That would have been the house of the healers.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_17");	//We don't know much about them. They seem to have been the first to disappear.
			Log_AddEntry(TOPIC_ADDON_RELICTS,"#NAME?");
		};
		if(Npc_HasItems(other,itmi_addon_stone_05) && (SATURAS_SCFOUND_ITMI_ADDON_STONE_05 == FALSE))
		{
			b_giveinvitems(other,self,itmi_addon_stone_05,1);
			SATURAS_SCFOUND_ITMI_ADDON_STONE_05 = TRUE;
			broughttoken = broughttoken + 1;
			AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_18");	//This piece was lying in a large building in a deep ravine.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_19");	//That was the library of the ancient people.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_20");	//Apparently a tablet of the scholars.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_80");	//Many of the scripts we have found can be traced to the leader of the 'Caste of Scholars'.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_81");	//Curiously enough, he did not leave his own name behind anywhere...
			Log_AddEntry(TOPIC_ADDON_RELICTS,"#NAME?");
		};
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == TRUE)
		{
		};
		xp_broughttokens = XP_ADDON_FORONETOKEN * broughttoken;
		b_giveplayerxp(xp_broughttokens);
		SATURAS_BROUGHTTOKENAMOUNT = SATURAS_BROUGHTTOKENAMOUNT + broughttoken;
		if(SATURAS_BROUGHTTOKENAMOUNT < 5)
		{
			if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_21");	//Very good. The image of this city is becoming clearer, but we still don't know enough.
			};
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_22");	//In all, there must be five of this sort of stone tablets hidden around here.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_23");	//Find them and bring them to me.
		};
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_24");	//Here is some gold as a reward.
		kohle = 200 * broughttoken;
		CreateInvItems(self,itmi_gold,kohle);
		b_giveinvitems(self,other,itmi_gold,kohle);
		SCBROUGHTTOKEN = TRUE;
	};
	if(SATURAS_BROUGHTTOKENAMOUNT == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_25");	//Now we have collected all of the relics we need.
		if(GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_26");	//You have done us a great service. I thank you.
			AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_27");	//This will bring us a crucial step forward in our studies.
		};
		MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_SUCCESS;
		SATURAS_SCBROUGHTALLTOKEN = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_28");	//I'll see whether I can find anything.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_29");	//Good. But hurry. Time is not our ally.
	};
};


instance DIA_ADDON_SATURAS_STONEPLATEHINT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_stoneplatehint_condition;
	information = dia_addon_saturas_stoneplatehint_info;
	important = TRUE;
};


func int dia_addon_saturas_stoneplatehint_condition()
{
	if(((MERDARION_GOTFOCUSCOUNT >= 2) || (RAVENISINTEMPEL == TRUE)) && (SATURAS_SCBROUGHTALLTOKEN == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_stoneplatehint_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_00");	//It is good that you came. We have new discoveries that we must share with you.
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_15_01");	//Then let's hear it.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_02");	//The sunken city once bore the name of Jharkendar. There were 5 rulers in the city who shared the power over their people.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_03");	//Each of these rulers had a mansion where he lived and kept his belongings.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_14_04");	//Therefore, in your search for the relics of the ancient culture, it is crucial that you should search through these mansions.
	MIS_SATURAS_LOOKINGFORHOUSESOFRULERS = LOG_RUNNING;
	Info_ClearChoices(dia_addon_saturas_stoneplatehint);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"What if these mansions no longer exist?",dia_addon_saturas_stoneplatehint_unter);
	Info_AddChoice(dia_addon_saturas_stoneplatehint,"Where should I look for these mansions?",dia_addon_saturas_stoneplatehint_wo);
};

func void dia_addon_saturas_stoneplatehint_wo()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_wo_15_00");	//Where should I look for these mansions?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_01");	//Riordian has studied the structure of the buildings in Jharkendar.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_wo_14_02");	//He will tell you where you should look for the mansions.
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"Saturas wants me to search the mansions of the builders for something useful. Riordian will tell me where I can find these buildings.");
};

func void dia_addon_saturas_stoneplatehint_unter()
{
	AI_Output(other,self,"DIA_Addon_Saturas_StonePlateHint_unter_15_00");	//What if these mansions no longer exist?
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_01");	//If you cannot find the houses, then they presumably sank with the city.
	AI_Output(self,other,"DIA_Addon_Saturas_StonePlateHint_unter_14_02");	//However, should they still exist, they would be of inestimable value for our studies.
};


instance DIA_ADDON_SATURAS_SCBROUGHTALLTOKEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_scbroughtalltoken_condition;
	information = dia_addon_saturas_scbroughtalltoken_info;
	description = "Why do you need these five stone tablets?";
};


func int dia_addon_saturas_scbroughtalltoken_condition()
{
	if((SCBROUGHTTOKEN == TRUE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_scbroughtalltoken_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_SCBroughtAllToken_15_00");	//Why do you need these five stone tablets?
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_01");	//The records which we have been able to find in these ruin are incomplete.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_02");	//But the writings of the builders speak of five rulers who ruled this city.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_03");	//Each of these rulers had one of these tablets as a symbol of his power.
	AI_Output(self,other,"DIA_Addon_Saturas_SCBroughtAllToken_14_04");	//I think these tablets are the key to our questions.
};


instance DIA_ADDON_SATURAS_FLUT(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_flut_condition;
	information = dia_addon_saturas_flut_info;
	description = "Nefarius told me about a flood...";
};


func int dia_addon_saturas_flut_condition()
{
	if((NEFARIUSADW_TALK2SATURAS == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_flut_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Nefarius told me about a flood...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//It is written that Adanos himself descended from heaven to punish the unbelievers and banish them to the realm of the dead.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Aroused by his holy wrath, he let the sea fall upon the builders of this city and swept them away.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_04");	//The swamp to the east still bears witness to these events of the past.
	TOPIC_END_FLUT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_SATURAS_ADANOSZORN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_adanoszorn_condition;
	information = dia_addon_saturas_adanoszorn_info;
	description = "What could have made Adanos so angry?";
};


func int dia_addon_saturas_adanoszorn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_flut) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adanoszorn_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_AdanosZorn_15_00");	//What could have made Adanos so angry?
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_01");	//The temple of this city was once a great, glorious structure.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_02");	//Everyone honored it and prayed to our god Adanos.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_03");	//Rhademes, the son of the commander Quahodron, desecrated the temple.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_04");	//As a result, one after another fell victim to evil.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_05");	//I suspect that Adanos could not forgive this and his revenge fell upon the land.
	AI_Output(self,other,"DIA_Addon_Saturas_AdanosZorn_14_06");	//This makes it even more important that we stop Raven. He is about to do exactly the same thing...
};


instance DIA_ADDON_SATURAS_RAVENINFOS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 9;
	condition = dia_addon_saturas_raveninfos_condition;
	information = dia_addon_saturas_raveninfos_info;
	permanent = TRUE;
	description = "About Raven...";
};


var int dia_addon_saturas_raveninfos_onetime1;
var int dia_addon_saturas_raveninfos_onetime2;
var int dia_addon_saturas_raveninfos_onetime3;
var int dia_addon_saturas_raveninfos_onetime4;
var int dia_addon_saturas_raveninfos_onetime5;
var int addon_saturas_fortuno;

func int dia_addon_saturas_raveninfos_condition()
{
	if((MIS_ADDON_SATURAS_GOTORAVEN == LOG_RUNNING) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_raveninfos_info()
{
	var int ravenneuigkeit;
	var int xp_ravenneuigkeit;
	AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_00");	//About Raven...
	ravenneuigkeit = 0;
	if((thorus.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 == FALSE) && (RAVENISINTEMPEL == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_01");	//I was in the bandit camp to the east. Raven is their leader.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_02");	//But in order to get to Raven, I have to get some of the bandits out of the way first.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_03");	//Fine. Then good luck. But do not forget that it must happen quickly.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_04");	//Raven must not reach his goal under any circumstances.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME1 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSRAVENSGOLDMINE == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_05");	//He has a gold mine and has the prisoners digging for gold.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_06");	//That sounds like him. You must get the prisoners out of there.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_07");	//(sighs) Yes, of course. I'm working on it.
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME2 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((SC_KNOWSFORTUNOINFOS == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_08");	//There is even a fellow with the bandits who claims to know Raven's plans.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_09");	//His name is Fortuno. He says that Raven wants to get into the temple to get a powerful artifact.
		AI_Output(self,other,"DIA_Addon_Bodo_14_03");	//And? Did he know more about this artifact?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_11");	//He could only tell me that Raven has had the grave of a priest of Adanos opened.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_12");	//This grave may contain the key to the temple. You should take a look around there.
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_13");	//Raven has forced the prisoners to excavate the grave of the priest.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_14");	//That is not good. You must hurry and stop Raven.
		ADDON_SATURAS_FORTUNO = TRUE;
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME3 = TRUE;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_15");	//I made my way into Raven's quarters.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//And? What about Raven?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//I came too late. He disappeared into the Adanos temple right before my eyes.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(agitated) What?! That is a CATASTROPHE! Why didn't you follow him?!
		DIA_ADDON_SATURAS_RAVENINFOS_ONETIME4 = TRUE;
		MIS_ADDON_SATURAS_GOTORAVEN = LOG_SUCCESS;
		ravenneuigkeit = ravenneuigkeit + 1;
	};
	if(ravenneuigkeit != 0)
	{
		xp_ravenneuigkeit = ravenneuigkeit * XP_AMBIENT;
		b_giveplayerxp(xp_ravenneuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Do you have anything new to report?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Nothing so far.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//I advise you not to underestimate this Raven, do you hear me?
	};
};


instance DIA_ADDON_SATURAS_TUERZU(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_tuerzu_condition;
	information = dia_addon_saturas_tuerzu_info;
	description = "I wasn't able to follow Raven!";
};


func int dia_addon_saturas_tuerzu_condition()
{
	if((MIS_ADDON_SATURAS_GOTORAVEN == LOG_SUCCESS) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_tuerzu_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//I couldn't follow Raven. He blocked the entrance from inside.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//(hurriedly) I must think...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//The question is how did Raven get into the temple...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//What did he do before he passed through the portal?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//He spoke an incantation at the gate.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//And before that?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//He opened a burial chamber.
	if(ADDON_SATURAS_FORTUNO == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//I already told you about that...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Right!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//I only know that he must have performed some sort of ritual there...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//(considering) A ritual...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//(figuring it out) Yes! That's it!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//I fear that Raven has made the power of the guardians of the dead his own.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//He got his knowledge of the temple from a spirit!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//You must go to Myxir and tell him about this!
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Raven has gained the power of the guardians of the dead. He got his knowledge of the temple of Adanos from a ghost. I must go to Myxir and tell him about it.");
	SATURAS_RIESENPLAN = TRUE;
};


instance DIA_ADDON_SATURAS_GHOSTQUESTIONS(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_ghostquestions_condition;
	information = dia_addon_saturas_ghostquestions_info;
	description = "I talked to Quarhodron.";
};


func int dia_addon_saturas_ghostquestions_condition()
{
	if((Npc_IsDead(quarhodron) == FALSE) && (SC_TALKEDTOGHOST == TRUE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ghostquestions_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//I talked to Quarhodron.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//And? What did he say?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//He will only help me if I answer some questions.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//What is the problem?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//I'm not sure what I should answer.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Mmh... we know that the scholars of this city built a library to the north.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//They made great efforts to record the events of the past.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Perhaps you will find the answers that Quarhodron demands of you there.
	b_logentry(TOPIC_ADDON_QUARHODRON,"Saturas suspects that I can find the answers to Quarhodron's questions in the library of the scholars. The library is far to the north.");
};


instance DIA_ADDON_SATURAS_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_talkedtoghost_condition;
	information = dia_addon_saturas_talkedtoghost_info;
	description = "The problem with the temple gate is solved.";
};


func int dia_addon_saturas_talkedtoghost_condition()
{
	if((GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//The problem with the temple gate is solved.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Has the spirit spoken?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Yes, he has.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Then you know how to get into the temple.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Correct. And he also told me what is in the temple.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//He spoke of a mighty sword and the chambers of Adanos.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//(despairing) By Adanos. What fools we are. How could we be so innocent.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//(shaken) The hints in the records...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//(excited) This sword can only be the 'Claw of Beliar'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_09");	//We must get through those chambers as soon as possible and take possession of the weapon.
	Info_ClearChoices(dia_addon_saturas_talkedtoghost);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"What is the 'Claw of Beliar'?",dia_addon_saturas_talkedtoghost_wasistdas);
	Info_AddChoice(dia_addon_saturas_talkedtoghost,"What are the chambers of Adanos?",dia_addon_saturas_talkedtoghost_kammern);
};

func void dia_addon_saturas_talkedtoghost_wasistdas()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00");	//What is the 'Claw of Beliar'?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01");	//It is the incarnation of Evil. Beliar HIMSELF created it.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02");	//Whoever bears it possesses a terrible tool of destruction.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03");	//The more powerful the bearer is, the mightier the power of the 'Claw'.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04");	//Only someone who is strong of spirit and steadfast in his faith can withstand its spell.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05");	//Now it is clear to me why the builders sealed off this valley.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06");	//They brought this weapon of Evil into their city and fell under its power.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07");	//Those arrogant fools destroyed one another out of greed.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08");	//The cruelty knew no end until Adanos' wrath swept across the land and sank everything into the sea.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09");	//Indeed. The creators of the portal did well to hide these things from the rest of the world.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10");	//What a tragic end for such a wonderful culture.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11");	//Do you realize the urgency of our mission now?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12");	//Raven is a strong fighter and is blinded by his lust for power.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13");	//In his hand, the Claw will be an instrument of destruction.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14");	//He must not get the weapon or we shall all be lost.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"There is a powerful weapon in the temple of Adanos. It is called the 'Claw of Beliar'. Raven cannot be allowed to get his hands on this weapon.");
};

func void dia_addon_saturas_talkedtoghost_kammern()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_kammern_15_00");	//What are the chambers of Adanos?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_01");	//We now know that the entrance is not the only obstacle that prevents us from entering the depths of the temple.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_02");	//In the temple itself, there are three chambers which are meant to deter all intruders.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_03");	//The colored relics of the builders are the key.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_04");	//Only if we gather all of the relics and solve their riddles will we enter the inner sanctum of the temple.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_kammern_14_05");	//I don't know whether Raven was able decipher the riddles of the temple, but if that is the case, we have a big problem.
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,LOGTEXT_ADDON_RELICTS);
	Log_CreateTopic(TOPIC_ADDON_RELICTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RELICTS,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_RELICTS,LOGTEXT_ADDON_RELICTS);
	SATURAS_KNOWSHOW2GETINTEMPEL = TRUE;
};


instance DIA_ADDON_SATURAS_RELICTSBACK(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_relictsback_condition;
	information = dia_addon_saturas_relictsback_info;
	description = "What exactly should I do with the relics in the temple?";
};


func int dia_addon_saturas_relictsback_condition()
{
	if((SATURAS_SCBROUGHTALLTOKEN == TRUE) && (SATURAS_KNOWSHOW2GETINTEMPEL == TRUE) && (RAVENISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_relictsback_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_RelictsBack_15_00");	//What exactly should I do with the relics in the temple?
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_03");	//We know too little. However, it is to be hoped that you will recognize their significance once you are in the temple.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_05");	//I am sorry that I cannot tell you more. It is all up to you now.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_06");	//Take the relics and make your way immediately to the temple.
	CreateInvItems(hero,itmi_addon_stone_01,1);
	CreateInvItems(hero,itmi_addon_stone_02,1);
	CreateInvItems(hero,itmi_addon_stone_03,1);
	CreateInvItems(hero,itmi_addon_stone_04,1);
	CreateInvItems(hero,itmi_addon_stone_05,1);
	AI_PrintScreen(PRINT_ITEMSERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	b_logentry(TOPIC_ADDON_KAMMERN,"Saturas has sent me to the temple of Adanos with the five relics of the builders to get past the chambers and stop Raven.");
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_07");	//May Adanos be merciful and protect us all.
	AI_Output(self,other,"DIA_Addon_Saturas_RelictsBack_14_08");	//Perhaps it is not yet too late.
};


instance DIA_ADDON_SATURAS_RAVENSDEAD(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_ravensdead_condition;
	information = dia_addon_saturas_ravensdead_info;
	important = TRUE;
};


func int dia_addon_saturas_ravensdead_condition()
{
	if(RAVENISDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_ravensdead_info()
{
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_00");	//The earthquakes have stopped and, as I see, you are still among the living.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Does this mean that your mission was successful?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Yes. Raven is dead.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Then it is over. Thank Adanos.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//You have done well, my son. We are deep in your debt.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//You have snatched a powerful weapon away from Evil and restored the balance in this part of the world.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//When the earthquakes died away, we discussed what should happen now and we have reached a conclusion.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Go and take the 'Claw of Beliar'. May it be yours to bear from now on.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//In your hand, it may prove a mighty ally for us.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Use it wisely, my son. May Adanos help you.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//We shall remain here and see to it that the temple is restored to its old brilliance.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_12");	//Only Myxir is already on his way to Khorinis to support Vatras.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_13");	//Vatras has been alone in the city for too long.
	Log_CreateTopic(TOPIC_ADDON_VATRASABLOESUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_VATRASABLOESUNG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_VATRASABLOESUNG,"Myxir has been sent to support Vatras in the seaport.");
	b_giveplayerxp(XP_ADDON_SATURAS_RAVENSDEAD);
};


instance DIA_ADDON_SATURAS_FREEDMISSINGPEOPLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 2;
	condition = dia_addon_saturas_freedmissingpeople_condition;
	information = dia_addon_saturas_freedmissingpeople_info;
	description = "I have freed the prisoners.";
};


func int dia_addon_saturas_freedmissingpeople_condition()
{
	if(SKLAVEN_FLUCHT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_freedmissingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_FreedMissingPeople_15_00");	//I have freed the prisoners.
	AI_Output(self,other,"DIA_Addon_Saturas_FreedMissingPeople_14_01");	//Very good. May they return safe and sound to their homeland.
	b_giveplayerxp(XP_ADDON_SATURAS_FREEDMISSINGPEOPLE);
};


instance DIA_ADDON_SATURAS_BELIARSWEAPON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarsweapon_condition;
	information = dia_addon_saturas_beliarsweapon_info;
	description = "I have taken the 'Claw of Beliar'.";
};


func int dia_addon_saturas_beliarsweapon_condition()
{
	if(c_schasbeliarsweapon() && (RAVENISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarsweapon_info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_00");	//I have taken the 'Claw of Beliar'.
	if(Npc_HasItems(hero,itmw_beliarweapon_raven) && (SC_FAILEDTOEQUIPBELIARSWEAPON == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_15_01");	//But I am unable to wear it.
	};
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_02");	//The 'Claw of Beliar' is a very SPECIAL weapon.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_03");	//It has its own will and consciousness.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_04");	//You, who now possess this mighty weapon, are its lord and master.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_05");	//It is a part of you and will adapt itself to your capabilities.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_06");	//However, it will not do that of its own free will.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_14_07");	//Only Beliar HIMSELF can force it to obey you.
	Info_ClearChoices(dia_addon_saturas_beliarsweapon);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"And why should Beliar help me?",dia_addon_saturas_beliarsweapon_besser);
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"What can I do with the weapon?",dia_addon_saturas_beliarsweapon_wastun);
};

func void dia_addon_saturas_beliarsweapon_wastun()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00");	//What can I do with the weapon?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01");	//That lies in your hands. You have conquered the weapon and are now its master.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02");	//I can only recommend to you what you can do with it.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03");	//Either you give it to ME and I shall see to it that it can do no further harm...
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04");	//... or you put its power to use and wield it in battle.
	Info_AddChoice(dia_addon_saturas_beliarsweapon,"Couldn't you keep the weapon safe?",dia_addon_saturas_beliarsweapon_geben);
};

func void dia_addon_saturas_beliarsweapon_geben()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_geben_15_00");	//Couldn't you keep the weapon safe?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_03");	//If you give it to me, then I shall render it harmless, so that it can no longer be misused.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_geben_14_04");	//So consider well what you will do.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KLAUE,"I can give the Claw of Beliar to Saturas, or keep it for myself.");
};

func void dia_addon_saturas_beliarsweapon_besser()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarsWeapon_besser_15_00");	//And why should Beliar help me?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_01");	//Only a prayer to Beliar can achieve that.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_02");	//But be careful. Beliar is malicious.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarsWeapon_besser_14_03");	//If you arouse his wrath, then he will let you feel it.
	Log_CreateTopic(TOPIC_ADDON_KLAUE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KLAUE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_KLAUE,"In order to subjugate the Claw to my will, I must pray to Beliar.");
	b_say(other,self,"$VERSTEHE");
};


instance DIA_ADDON_SATURAS_PERMENDE_ADDON(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_permende_addon_condition;
	information = dia_addon_saturas_permende_addon_info;
	permanent = TRUE;
	description = "What will you do now?";
};


func int dia_addon_saturas_permende_addon_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_ravensdead))
	{
		return TRUE;
	};
};


var int dia_addon_saturas_permende_addon_onetime;

func void dia_addon_saturas_permende_addon_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_PermENDE_ADDON_15_00");	//What will you do now?
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_01");	//We shall stay here and help the temple regain its former glory.
	AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_02");	//All too long have its walls been in this lamentable condition.
	if(DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_03");	//As far as you are concerned, my son...
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_04");	//I am glad to see that I was not mistaken about you. You are the Preserver of the Balance. There is no longer any doubt about that.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_05");	//Without your courage and strength, the island of Khorinis would have drowned. We thank you and will honor you in our thoughts.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_06");	//Devote yourself now to the other tasks that lie before you and return this world to balance and peace.
		AI_Output(self,other,"DIA_Addon_Saturas_PermENDE_ADDON_14_07");	//No go and fulfill your destiny, Preserver. Our prayers will go with you.
		DIA_ADDON_SATURAS_PERMENDE_ADDON_ONETIME = TRUE;
	};
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBEN(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgeben_condition;
	information = dia_addon_saturas_beliarweapgeben_info;
	description = "Take the 'Claw of Beliar' and destroy it.";
};


func int dia_addon_saturas_beliarweapgeben_condition()
{
	if(c_schasbeliarsweapon() && (RAVENISDEAD == TRUE) && Npc_KnowsInfo(other,dia_addon_saturas_beliarsweapon))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarweapgeben_info()
{
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Take the 'Claw of Beliar' and destroy it.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//As you wish, my son. Give it to me.
	b_clearbeliarsweapon();
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//So that it can do no more harm, I shall sink it in the depths of the sea.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Adanos' wisdom will watch over it.
	TOPIC_END_KLAUE = TRUE;
	other.lp = other.lp + 10;
	concattext = ConcatStrings(PRINT_LEARNLP,IntToString(10));
	PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	SATURAS_KLAUEINSMEER = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_PRETEACHCIRCLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 10;
	condition = dia_addon_saturas_adw_preteachcircle_condition;
	information = dia_addon_saturas_adw_preteachcircle_info;
	description = "Can you teach me the Circles of Magic?";
};


func int dia_addon_saturas_adw_preteachcircle_condition()
{
	if((hero.guild == GIL_KDF) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_preteachcircle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Can you teach me the Circles of Magic?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_01");	//You are a Magician of Fire. What would Pyrokar say abot that?
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_02");	//No one needs to know.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_03");	//(sighs) I see that you are serious, so I shall comply with your request.
	if(RAVENISDEAD == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_04");	//However, should I get the impression that our knowledge is in the wrong hands, you will no longer be able to count on my help.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_05");	//So you had better not disappoint me.
	};
	SATURAS_ADDON_TEACHCIRCLE = TRUE;
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_SATURASTEACH);
};


instance DIA_ADDON_SATURAS_ADW_CIRCLE(C_INFO)
{
	npc = kdw_14000_addon_saturas_adw;
	nr = 99;
	condition = dia_addon_saturas_adw_circle_condition;
	information = dia_addon_saturas_adw_circle_info;
	permanent = TRUE;
	description = "I want to learn a higher level of magic.";
};


var int dia_addon_saturas_adw_circle_noperm;

func int dia_addon_saturas_adw_circle_condition()
{
	var int circle;
	var int kosten;
	circle = Npc_GetTalentSkill(other,NPC_TALENT_MAGE) + 1;
	kosten = b_getlearncosttalent(other,NPC_TALENT_MAGE,circle);
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 1) && (Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) < 6) && (SATURAS_ADDON_TEACHCIRCLE == TRUE) && (DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM == FALSE))
	{
		dia_addon_saturas_adw_circle.description = b_buildlearnstring("I want to learn a higher level of magic.",kosten);
		return TRUE;
	};
};

func void dia_addon_saturas_adw_circle_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_CIRCLE_15_00");	//I want to learn a higher level of magic.
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 1) && (KAPITEL >= 2))
	{
		if(b_teachmagiccircle(self,other,2))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_01");	//Yes, you are ready to increase your knowledge.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Enter now the second Circle of Magic. May Adanos give you the strength to use the power now granted to you wisely.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (KAPITEL >= 3))
	{
		if(b_teachmagiccircle(self,other,3))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Yes, the time is right. Enter now the third Circle of Magic.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Your knowledge will now allow you to effect new, more powerful magic. Use it with care.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//The time has come. You are ready to enter the fourth Circle of Magic.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Mighty now are your words and deeds. Always choose your new spells with care and reason.
		};
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (KAPITEL >= 5))
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_07");	//You will now be granted the privilege of entering the fifth Circle of Magic
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_08");	//The spells which you will now learn can be truly devastating.
			AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_09");	//So be aware of your power and do not succumb to delusions of grandeur.
		};
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_10");	//That is no longer my task now.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_11");	//In order to learn the sixth and final Circle of Magic, you had best go to the monastery of the Fire Magicians.
		DIA_ADDON_SATURAS_ADW_CIRCLE_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_12");	//It is still too soon for you. Come back later.
	};
};

