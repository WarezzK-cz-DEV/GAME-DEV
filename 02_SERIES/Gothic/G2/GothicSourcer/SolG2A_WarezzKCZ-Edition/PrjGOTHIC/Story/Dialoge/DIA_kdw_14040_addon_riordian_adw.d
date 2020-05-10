
instance DIA_ADDON_RIORDIAN_ADW_EXIT(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 999;
	condition = dia_addon_riordian_adw_exit_condition;
	information = dia_addon_riordian_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_riordian_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_RIORDIAN_HELLOADW(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_helloadw_condition;
	information = dia_addon_riordian_helloadw_info;
	description = "Did you expect THIS here?";
};


func int dia_addon_riordian_helloadw_condition()
{
	return TRUE;
};

func void dia_addon_riordian_helloadw_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HelloADW_15_00");	//Did you expect THIS here?
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_01");	//Not at all. I am awestruck at how large the city must have been.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_02");	//Most of the buildings are buried under stone and earth, but the ruins that have survived the ages are spread all over the land.
	AI_Output(self,other,"DIA_Addon_Riordian_HelloADW_10_03");	//There must have been thousands living here.
};


instance DIA_ADDON_RIORDIAN_WHATTOFIND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_whattofind_condition;
	information = dia_addon_riordian_whattofind_info;
	description = "What will I find out there?";
};


func int dia_addon_riordian_whattofind_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_helloadw))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_whattofind_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhatToFind_15_00");	//What will I find out there?
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_01");	//In the east, there is a large fortress in a gigantic swamp.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_02");	//As far as we can judge from here, the bandits have taken refuge there.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_03");	//If I were you, I wouldn't go down there. They have set up many outposts and guards.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_04");	//You had better avoid the swamp until you have more experience, or find a way to go around the bandits.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_05");	//In the west we have discovered some pirates.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_06");	//I'm not sure, but I believe they have also discovered us.
	AI_Output(self,other,"DIA_Addon_Riordian_WhatToFind_10_07");	//They don't seem too perturbed by our presence, though.
};


instance DIA_ADDON_RIORDIAN_GEGEND(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_gegend_condition;
	information = dia_addon_riordian_gegend_info;
	permanent = TRUE;
	description = "Tell me more about the area.";
};


func int dia_addon_riordian_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_riordian_whattofind) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};


var int dia_addon_riordian_gegend_info_onetime;

func void dia_addon_riordian_gegend_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_15_00");	//Tell me more about the area.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_10_01");	//What do you want to know?
	Info_ClearChoices(dia_addon_riordian_gegend);
	Info_AddChoice(dia_addon_riordian_gegend,DIALOG_BACK,dia_addon_riordian_gegend_back);
	if((dia_addon_riordian_gegend_info_onetime == FALSE) && (Npc_HasItems(other,itwr_map_addonworld) == FALSE))
	{
		Info_AddChoice(dia_addon_riordian_gegend,"Is there a map of this area?",dia_addon_riordian_gegend_map);
		dia_addon_riordian_gegend_info_onetime = TRUE;
	};
	Info_AddChoice(dia_addon_riordian_gegend,"Where did you see the pirates?",dia_addon_riordian_gegend_piraten);
	Info_AddChoice(dia_addon_riordian_gegend,"Where were the bandits again?",dia_addon_riordian_gegend_bandits);
	Info_AddChoice(dia_addon_riordian_gegend,"Were you ever in the west?",dia_addon_riordian_gegend_west);
	Info_AddChoice(dia_addon_riordian_gegend,"What was in the east again?",dia_addon_riordian_gegend_ost);
	Info_AddChoice(dia_addon_riordian_gegend,"What will I find I go to the south?",dia_addon_riordian_gegend_sued);
	Info_AddChoice(dia_addon_riordian_gegend,"What is in the north?",dia_addon_riordian_gegend_nord);
};

func void dia_addon_riordian_gegend_back()
{
	Info_ClearChoices(dia_addon_riordian_gegend);
};

func void dia_addon_riordian_gegend_map()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_map_15_00");	//Is there a map of this area?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_map_10_01");	//Cronos has made one. He will surely let you have it.
};

func void dia_addon_riordian_gegend_bandits()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_bandits_15_00");	//Where were the bandits again?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_01");	//They have a sort of fortress with many outposts in the east.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_bandits_10_02");	//To get to them you will have to cross the large swamp.
};

func void dia_addon_riordian_gegend_piraten()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_Piraten_15_00");	//Where did you see the pirates?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_01");	//They were running around not far to the west of here.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_Piraten_10_02");	//I think they were hunting.
};

func void dia_addon_riordian_gegend_nord()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_nord_15_00");	//What is in the north?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_01");	//If the records of the builders are to be believed, then you will find a large valley encircled by cliffs.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_nord_10_02");	//Drought and desert sand dominate the landscape there.
};

func void dia_addon_riordian_gegend_sued()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_sued_15_00");	//What will I find I go to the south?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_01");	//The land in the south is very rugged.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_sued_10_02");	//You will find serpentine paths, waterfalls and ruins carved out of the rock there.
};

func void dia_addon_riordian_gegend_ost()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_ost_15_00");	//What was in the east again?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_01");	//The great swamp. The area is very dangerous.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_02");	//Not only are the bandits lurking there, but also extremely dangerous animals.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_ost_10_03");	//You should be careful.
};


var int dia_addon_riordian_gegend_west_onetime;

func void dia_addon_riordian_gegend_west()
{
	AI_Output(other,self,"DIA_Addon_Riordian_Gegend_west_15_00");	//Were you ever in the west?
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_01");	//No. But the coast must be there somewhere.
	AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_02");	//That's probably where the pirates have their camp.
	if((dia_addon_riordian_gegend_west_onetime == FALSE) && Npc_HasItems(vlk_4304_addon_william,itwr_addon_william_01))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_03");	//To the east, not far from here, we found the body of a fisherman.
		AI_Output(self,other,"DIA_Addon_Riordian_Gegend_west_10_04");	//You should take a look at it.
		b_logentry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMLEICHE);
		dia_addon_riordian_gegend_west_onetime = TRUE;
	};
};


instance DIA_ADDON_RIORDIAN_HOUSESOFRULERS(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_housesofrulers_condition;
	information = dia_addon_riordian_housesofrulers_info;
	description = "Saturas sent me. I'm supposed to search through the five mansions of Jharkendar..";
};


func int dia_addon_riordian_housesofrulers_condition()
{
	if(MIS_SATURAS_LOOKINGFORHOUSESOFRULERS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_riordian_housesofrulers_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_HousesOfRulers_15_00");	//Saturas sent me. I'm supposed to search through the five mansions of Jharkendar.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_01");	//It took me a long time to find the location of the mansions in the writings of the builders.
	AI_Output(self,other,"DIA_Addon_Riordian_HousesOfRulers_10_02");	//But now I can tell you exactly.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_RUNNING;
};


instance DIA_ADDON_RIORDIAN_WHEREAREHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_wherearehouses_condition;
	information = dia_addon_riordian_wherearehouses_info;
	description = "Where do I find the 5 mansions?";
};


func int dia_addon_riordian_wherearehouses_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && (SATURAS_SCBROUGHTALLTOKEN == FALSE))
	{
		return TRUE;
	};
};


var int b_whrearehousesofrulersonetime;

func void b_whrearehousesofrulers()
{
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_00");	//The house of the scholars is a large library. It must be somewhere far to the north.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_01");	//The house of the warriors was a fortress ringed by rocks in the east.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_02");	//The priests and guardians of the dead had their dwellings near each other. You should find them in the southwest.
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_03");	//And the healers had their house of convalescence in the southeast.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_04");	//If these houses are still standing, then you will recognize them from their method of construction.
		b_whrearehousesofrulersonetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_05");	//They are elevated. A steep stairway leads to the entrance covered by high columns.
	if(b_whrearehousesofrulersonetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Riordian_WhereAreHouses_10_06");	//I hope that helps you.
	};
	Log_CreateTopic(TOPIC_ADDON_HOUSESOFRULERS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HOUSESOFRULERS,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HOUSESOFRULERS,"The mansion of the scholars is a large library. It must be somewhere in the north.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"The mansion of the warriors was a fortress surrounded by cliffs in the east.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"The priests and guardians of the dead had their quarters close to each other. I should be able to find them in the southwest.");
	Log_AddEntry(TOPIC_ADDON_HOUSESOFRULERS,"The healers had their house of convalescence in the southeast.");
};

func void dia_addon_riordian_wherearehouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_WhereAreHouses_15_00");	//Where do I find the 5 mansions?
	b_whrearehousesofrulers();
};


instance DIA_ADDON_RIORDIAN_FOUNDHOUSE(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundhouse_condition;
	information = dia_addon_riordian_foundhouse_info;
	permanent = TRUE;
	description = "About the mansions...";
};


func int dia_addon_riordian_foundhouse_condition()
{
	if((MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_riordian_wherearehouses) && (RIORDIANHOUSESFOUNDCOUNT < 5))
	{
		return TRUE;
	};
};



var int foundhouseinfo[6];
const int LIBRARY = 1;
const int HEILER = 2;
const int WARRIOR = 3;
const int PRIEST = 4;
const int TOTENW = 5;
var int riordianhouseneuigkeit;
var int riordianhousesfoundcount;

func void dia_addon_riordian_foundhouse_info()
{
	var int riordianhousexps;
	RIORDIANHOUSENEUIGKEIT = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_00");	//Eh, about the mansions...
	AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_01");	//Yes?
	if((SC_COMESINTO_CANYONLIBRARY_FUNC_ONETIME == TRUE) && (FOUNDHOUSEINFO[1] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_02");	//The orcs seem to be interested in the library of the scholars.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_03");	//Do you think they can read the ancient language?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_04");	//I don't think so, but who knows.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_05");	//Perhaps you should make sure that they go away, nevertheless.
		FOUNDHOUSEINFO[1] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
		Log_CreateTopic(TOPIC_ADDON_CANYONORCS,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_CANYONORCS,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_CANYONORCS,"The Water Mage Riordian would prefer it if the orcs disappeared from the canyon.");
	};
	if((Npc_IsDead(stoneguardian_heiler) || Npc_HasItems(other,itmi_addon_stone_04) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_04 == TRUE)) && (FOUNDHOUSEINFO[2] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_06");	//The house of the healers is in the middle of the swampy area and is defended by many stone sentinels.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_07");	//So it is still standing?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_08");	//Yes, but I wonder for how much longer...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_09");	//It pains my soul to see the witnesses of the past in this dilapidated condition.
		FOUNDHOUSEINFO[2] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((RAVENISINTEMPEL == TRUE) && (FOUNDHOUSEINFO[3] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_10");	//The mansion of the warriors is being used by Raven as a hide-out.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_11");	//(cynically) He made a good choice.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_12");	//It is probably the most secure fortress still to be found in this region.
		FOUNDHOUSEINFO[3] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(minecrawler_priest) || Npc_HasItems(other,itmi_addon_stone_03) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_03 == TRUE)) && (FOUNDHOUSEINFO[4] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_13");	//There were a lot of minecrawlers in the house of the priests...
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_14");	//Aren't these animals very uncommon for the area?
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_15");	//They certainly are.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_16");	//By Adanos. Curious things are happening in this area.
		FOUNDHOUSEINFO[4] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if((Npc_IsDead(mayazombie04_totenw) || Npc_HasItems(other,itmi_addon_stone_02) || (SATURAS_SCFOUND_ITMI_ADDON_STONE_02 == TRUE)) && (FOUNDHOUSEINFO[5] == FALSE))
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_17");	//The house of the guardians of the dead is dominated by the power of Evil.
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_18");	//I think I have rarely seen so many zombies in one place.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_19");	//That is unfortunate. The guardians of the dead were obviously the victims of their special skills.
		AI_Output(self,other,"DIA_Addon_Riordian_FoundHouse_10_20");	//Their connection to the world of the dead damaged them greatly. I hope you were able to free them from their suffering.
		FOUNDHOUSEINFO[5] = TRUE;
		RIORDIANHOUSENEUIGKEIT = RIORDIANHOUSENEUIGKEIT + 1;
	};
	if(RIORDIANHOUSENEUIGKEIT > 0)
	{
		riordianhousexps = XP_ADDON_RIORDIAN_FOUNDHOUSE * RIORDIANHOUSENEUIGKEIT;
		b_giveplayerxp(riordianhousexps);
		RIORDIANHOUSESFOUNDCOUNT = RIORDIANHOUSESFOUNDCOUNT + RIORDIANHOUSENEUIGKEIT;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_FoundHouse_15_21");	//Tell me again where each one is located.
		b_whrearehousesofrulers();
	};
};


instance DIA_ADDON_RIORDIAN_ORKSWEG(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_orksweg_condition;
	information = dia_addon_riordian_orksweg_info;
	description = "The orcs will soon lose interest in this area.";
};


func int dia_addon_riordian_orksweg_condition()
{
	if(Npc_IsDead(orcshaman_sit_canyonlibrarykey) && (FOUNDHOUSEINFO[1] == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_orksweg_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_00");	//The orcs will soon lose interest in this area.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_01");	//What makes you say that?
	if(orcshaman_sit_canyonlibrarykey.aivar[AIV_KILLEDBYPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_02");	//I killed their leader.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Riordian_OrksWeg_15_03");	//Their leader is dead.
	};
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_04");	//Let's just hope you are right.
	AI_Output(self,other,"DIA_Addon_Riordian_OrksWeg_10_05");	//We really don't need disturbances of that sort right now.
	TOPIC_END_CANYONORCS = TRUE;
	b_giveplayerxp(XP_ADDON_RIORDIAN_ORKSWEG);
};


instance DIA_ADDON_RIORDIAN_FOUNDALLHOUSES(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_foundallhouses_condition;
	information = dia_addon_riordian_foundallhouses_info;
	description = "I found all of the mansions.";
};


func int dia_addon_riordian_foundallhouses_condition()
{
	if((RIORDIANHOUSESFOUNDCOUNT >= 5) && (MIS_RIORDIAN_HOUSESOFRULERS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_foundallhouses_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_00");	//I found all of the mansions.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_01");	//Were they all where I said they would be?
	AI_Output(other,self,"DIA_Addon_Riordian_FoundAllHouses_15_02");	//More or less.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_03");	//Very good. Then my work WAS worth it.
	AI_Output(self,other,"DIA_Addon_Riordian_FoundAllHouses_10_04");	//Thank you.
	MIS_RIORDIAN_HOUSESOFRULERS = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FOUNDALLHOUSES);
};


instance DIA_ADDON_RIORDIAN_ADW_PRETEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 5;
	condition = dia_addon_riordian_adw_preteach_condition;
	information = dia_addon_riordian_adw_preteach_info;
	description = "Can you teach me your skills?";
};


func int dia_addon_riordian_adw_preteach_condition()
{
	return TRUE;
};

func void dia_addon_riordian_adw_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_PreTeach_15_00");	//Can you teach me your skills?
	AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_01");	//I can instruct you in the art of alchemy.
	if(Npc_HasItems(other,itam_addon_wispdetector) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_PreTeach_10_02");	//And I can show you how to teach your will-o'-the-wisp to search for objects.
		Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
		Log_AddEntry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACH);
	};
	Log_CreateTopic(TOPIC_ADDON_KDWTEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_KDWTEACHER,LOGTEXT_ADDON_RIORDIANTEACHALCHEMY);
	RIORDIAN_ADW_ADDON_TEACHWISP = TRUE;
	RIORDIAN_ADW_ADDON_TEACHALCHEMY = TRUE;
};


instance DIA_ADDON_RIORDIAN_ADW_TEACH(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 90;
	condition = dia_addon_riordian_adw_teach_condition;
	information = dia_addon_riordian_adw_teach_info;
	permanent = TRUE;
	description = "Show me how to train my will-o'-the-wisp.";
};


var int dia_addon_riordian_adw_teach_noperm;

func int dia_addon_riordian_adw_teach_condition()
{
	if((DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_RIORDIAN_TEACH_NOPERM == FALSE) && (RIORDIAN_ADW_ADDON_TEACHWISP == TRUE) && Npc_HasItems(other,itam_addon_wispdetector))
	{
		return TRUE;
	};
};

func void dia_addon_riordian_adw_teach_info()
{
	b_dia_addon_riordian_teach_15_00();
	if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) || (PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE))
	{
		Info_ClearChoices(dia_addon_riordian_adw_teach);
		Info_AddChoice(dia_addon_riordian_adw_teach,DIALOG_BACK,dia_addon_riordian_adw_teach_back);
		b_dia_addon_riordian_teach_10_01();
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FF] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FF,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FF)),dia_addon_riordian_adw_teach_wispskill_ff);
		};
		if(PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NONE] == FALSE)
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_NONE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_NONE)),dia_addon_riordian_adw_teach_wispskill_none);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_RUNE] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_RUNE,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_RUNE)),dia_addon_riordian_adw_teach_wispskill_rune);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_MAGIC] == FALSE) && (WISPSKILL_LEVEL >= 2))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_MAGIC,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_MAGIC)),dia_addon_riordian_adw_teach_wispskill_magic);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_FOOD] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_FOOD,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_FOOD)),dia_addon_riordian_adw_teach_wispskill_food);
		};
		if((PLAYER_TALENT_WISPDETECTOR[WISPSKILL_POTIONS] == FALSE) && (WISPSKILL_LEVEL >= 3))
		{
			Info_AddChoice(dia_addon_riordian_adw_teach,b_buildlearnstring(NAME_ADDON_WISPSKILL_POTIONS,b_getlearncosttalent(other,NPC_TALENT_WISPDETECTOR,WISPSKILL_POTIONS)),dia_addon_riordian_adw_teach_wispskill_potions);
		};
	}
	else
	{
		b_dia_addon_riordian_teach_10_08();
		DIA_ADDON_RIORDIAN_ADW_TEACH_NOPERM = TRUE;
	};
};

func void dia_addon_riordian_adw_teach_wispskill_x()
{
	b_dia_addon_riordian_teach_wispskill_x_10_00();
};

func void dia_addon_riordian_adw_teach_back()
{
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_ff()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FF))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_none()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_NONE))
	{
		if(WISPSKILL_LEVEL < 2)
		{
			WISPSKILL_LEVEL = 2;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_rune()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_RUNE))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_magic()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_MAGIC))
	{
		if(WISPSKILL_LEVEL < 3)
		{
			WISPSKILL_LEVEL = 3;
		};
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_food()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_FOOD))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};

func void dia_addon_riordian_adw_teach_wispskill_potions()
{
	if(b_teachplayertalentwispdetector(self,other,WISPSKILL_POTIONS))
	{
		dia_addon_riordian_adw_teach_wispskill_x();
	};
	Info_ClearChoices(dia_addon_riordian_adw_teach);
};


instance DIA_RIORDIAN_ADW_TEACHALCHEMY(C_INFO)
{
	npc = kdw_14040_addon_riordian_adw;
	nr = 2;
	condition = dia_riordian_adw_teachalchemy_condition;
	information = dia_riordian_adw_teachalchemy_info;
	permanent = TRUE;
	description = "Teach me the art of brewing potions.";
};


var int dia_riordian_adw_teachalchemy_permanent;

func int dia_riordian_adw_teachalchemy_condition()
{
	if((DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT == FALSE) && (RIORDIAN_ADW_ADDON_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Addon_Riordian_ADW_TeachAlchemy_15_00");	//Teach me the art of brewing potions.
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE))
	{
		Info_ClearChoices(dia_riordian_adw_teachalchemy);
		Info_AddChoice(dia_riordian_adw_teachalchemy,DIALOG_BACK,dia_riordian_adw_teachalchemy_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Essence of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_riordian_adw_teachalchemy_health_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Extract of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_riordian_adw_teachalchemy_health_02);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Mana Essence",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_riordian_adw_teachalchemy_mana_01);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Mana Extract",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_riordian_adw_teachalchemy_mana_02);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Mana Elixir",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_riordian_adw_teachalchemy_mana_03);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elixir of Spirit",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_riordian_adw_teachalchemy_perm_mana);
		talente = talente + 1;
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE)))
	{
		Info_AddChoice(dia_riordian_adw_teachalchemy,b_buildlearnstring("Elixir of Dexterity",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_riordian_adw_teachalchemy_perm_dex);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_01");	//Magical potions are brewed on an alchemist's bench. We have one up here in our dwelling.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_02");	//You need an empty laboratory flask, the necessary ingredients and the knowledge of how the potion is created.
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_03");	//You can get that knowledge from me. The other things you will have to find for yourself.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_04");	//What do you want to brew?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Riordian_ADW_TeachAlchemy_10_05");	//I can't show you anything else that you don't already know.
		DIA_RIORDIAN_ADW_TEACHALCHEMY_PERMANENT = TRUE;
	};
};

func void dia_riordian_adw_teachalchemy_back()
{
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

func void dia_riordian_adw_teachalchemy_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
	Info_ClearChoices(dia_riordian_adw_teachalchemy);
};

