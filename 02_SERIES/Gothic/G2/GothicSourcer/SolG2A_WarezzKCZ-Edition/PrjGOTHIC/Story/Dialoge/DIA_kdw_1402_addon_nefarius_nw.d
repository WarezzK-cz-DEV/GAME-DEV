
instance DIA_ADDON_NEFARIUS_EXIT(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 999;
	condition = dia_addon_nefarius_exit_condition;
	information = dia_addon_nefarius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_nefarius_exit_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_NEFARIUS_HALLO(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_hallo_condition;
	information = dia_addon_nefarius_hallo_info;
	description = "How's it going?";
};


func int dia_addon_nefarius_hallo_condition()
{
	return TRUE;
};

func void dia_addon_nefarius_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_01");	//What are YOU doing here? This is certainly a surprise.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_02");	//I thought you had been killed.
	AI_Output(other,self,"DIA_Addon_Nefarius_Hallo_15_03");	//Almost.
	AI_Output(self,other,"DIA_Addon_Nefarius_Hallo_05_04");	//There was quite a fuss about you, you know that? I hardly recognized Saturas, he was so beside himself about that business back then.
};


instance DIA_ADDON_NEFARIUS_KEINEAHNUNG(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_keineahnung_condition;
	information = dia_addon_nefarius_keineahnung_info;
	description = "What sort of portal is that?";
};


func int dia_addon_nefarius_keineahnung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_keineahnung_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_keineahnung_15_00");	//What sort of portal is that?
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_01");	//We suspect that it leads to the lost valley where the ancient culture must have had their city.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_02");	//But the stone behind the portal is made of massive rock, yards thick.
	AI_Output(self,other,"DIA_Addon_Nefarius_keineahnung_05_03");	//Also, there are no signs of teleportation magic. Very mysterious...
};


instance DIA_ADDON_NEFARIUS_WIEMECHANIK(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_wiemechanik_condition;
	information = dia_addon_nefarius_wiemechanik_info;
	description = "Do you know how to activate it?";
};


func int dia_addon_nefarius_wiemechanik_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_keineahnung))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_wiemechanik_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WieMechanik_15_00");	//Do you know how to activate it?
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_01");	//One of the missing ornaments seems to be a sort of magical KEY.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_03");	//We'll need it to get any farther.
	AI_Output(self,other,"DIA_Addon_Nefarius_WieMechanik_05_02");	//It has to fit exactly into the ring-shaped hollow next to the portal.
};


instance DIA_ADDON_NEFARIUS_SCBRINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_scbringornaments_condition;
	information = dia_addon_nefarius_scbringornaments_info;
	description = "I brought a part of the ornament.";
};


func int dia_addon_nefarius_scbringornaments_condition()
{
	if(MIS_ADDON_LARES_ORNAMENT2SATURAS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_scbringornaments_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_00");	//I brought a part of the ornament.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_01");	//(excited) Really? That's terrific.
	AI_Output(other,self,"DIA_Addon_Nefarius_SCbringOrnaments_15_02");	//Do you have any idea where the other parts are?
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_03");	//According to the ancient inscriptions, it was broken into four pieces.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_04");	//And it looks as though the parts are still to be found on the island...
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_05");	//With Merdarion's help, I have translated some of the inscriptions.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_06");	//There are hints as to where the remaining pieces are.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_07");	//Here. I've marked some of the places on this map.
	CreateInvItems(self,itwr_map_newworld_ornaments_addon,1);
	b_giveinvitems(self,other,itwr_map_newworld_ornaments_addon,1);
	MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_ORNAMENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ORNAMENT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ORNAMENT,"The Water Mages have found a portal that is supposed to lead to an unexplored part of Khorinis.");
	b_logentry(TOPIC_ADDON_ORNAMENT,"Nefarius wants to activate the portal mechanism using an ornamental ring. He is still missing three fragments of the ring. I am supposed to get them for him. He gave me a map with the places where I should look for the fragments marked.");
	b_startotherroutine(bau_4300_addon_cavalorn,"OrnamentSteinring");
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_08");	//Look around there.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_09");	//You should pay attention to old structures. They might be somewhat deteriorated and no longer clearly recognizable.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_10");	//It could be almost anything. A large rock, a stone circle, a mausoleum or something similar.
	AI_Output(self,other,"DIA_Addon_Nefarius_SCbringOrnaments_05_11");	//But, what am I saying? You'll find it. Good luck.
};


instance DIA_ADDON_NEFARIUS_WHYPORTALCLOSED(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_whyportalclosed_condition;
	information = dia_addon_nefarius_whyportalclosed_info;
	description = "Why was the ornament broken?";
};


func int dia_addon_nefarius_whyportalclosed_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_nefarius_scbringornaments))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_whyportalclosed_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_WhyPortalClosed_15_00");	//Why was the ornament broken?
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_01");	//Whoever did it wanted to prevent the portal from ever being opened again.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_02");	//The longer I stare at the inscriptions, the more I realize that the priests of the ancient culture really were no fools.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_03");	//There was a good reason that they made the region back there inaccessible.
	AI_Output(self,other,"DIA_Addon_Nefarius_WhyPortalClosed_05_04");	//We don't know what awaits us there. But it certainly isn't anything good...
};


instance DIA_ADDON_NEFARIUS_MISSINGORNAMENTS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_missingornaments_condition;
	information = dia_addon_nefarius_missingornaments_info;
	permanent = TRUE;
	description = "About the missing ornaments...";
};


func int dia_addon_nefarius_missingornaments_condition()
{
	if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int missingornamentscounter;
const int ADDON_NEFARIUSSMISSINGORNAMENTSOFFER = 100;

func void dia_addon_nefarius_missingornaments_info()
{
	var int missingornamentscount;
	var int xp_addon_bringmissingornaments;
	var int missingornamentsgeld;
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_00");	//About the missing ornaments...
	AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_01");	//(expectant) Yes?
	if(Npc_HasItems(other,itmi_ornament_addon) >= 1)
	{
		missingornamentscount = Npc_HasItems(other,itmi_ornament_addon);
		if(missingornamentscount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_02");	//Here. I have another.
			b_giveplayerxp(XP_ADDON_BRINGMISSINGORNAMENT);
			Npc_RemoveInvItems(other,itmi_ornament_addon,1);
			AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_03");	//I found them.
			Npc_RemoveInvItems(other,itmi_ornament_addon,missingornamentscount);
			concattext = ConcatStrings(IntToString(missingornamentscount),PRINT_ITEMSGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
			xp_addon_bringmissingornaments = missingornamentscount * XP_ADDON_BRINGMISSINGORNAMENT;
			MISSINGORNAMENTSCOUNTER = MISSINGORNAMENTSCOUNTER + missingornamentscount;
			b_giveplayerxp(xp_addon_bringmissingornaments);
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_04");	//That's terrific.
		if(MISSINGORNAMENTSCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_05");	//Now only two more are missing. Maybe you can find them, too.
		}
		else if(MISSINGORNAMENTSCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_06");	//Now only one is missing, then we'll have them all together.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_07");	//Now I have them all. Now all we have to do is put them together.
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_08");	//We will have to use our combined powers to fit the ornament back into a ring.
			MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS = LOG_SUCCESS;
		};
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_09");	//Here. I can give you some gold coins for your trouble.
		missingornamentsgeld = missingornamentscount * ADDON_NEFARIUSSMISSINGORNAMENTSOFFER;
		CreateInvItems(self,itmi_gold,missingornamentsgeld);
		b_giveinvitems(self,other,itmi_gold,missingornamentsgeld);
		if(MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_10");	//Follow me!
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"PreRingritual");
			b_startotherroutine(kdw_1400_addon_saturas_nw,"PreRingritual");
			b_startotherroutine(kdw_1401_addon_cronos_nw,"PreRingritual");
			b_startotherroutine(kdw_1403_addon_myxir_nw,"PreRingritual");
			b_startotherroutine(kdw_1404_addon_riordian_nw,"PreRingritual");
			b_startotherroutine(kdw_1405_addon_merdarion_nw,"PreRingritual");
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Nefarius_MissingOrnaments_15_11");	//How many were there again?
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_12");	//There are four in all...
		AI_Output(self,other,"DIA_Addon_Nefarius_MissingOrnaments_05_13");	//You should find the others where I have marked the map.
	};
};


instance DIA_ADDON_NEFARIUS_RINGRITUAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_ringritual_condition;
	information = dia_addon_nefarius_ringritual_info;
	important = TRUE;
};


func int dia_addon_nefarius_ringritual_condition()
{
	if((MIS_ADDON_NEFARIUS_BRINGMISSINGORNAMENTS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PORTALTEMPEL_42") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_ringritual_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_Ringritual_05_00");	//There. And now step aside.
	Npc_SetRefuseTalk(self,60);
	RITUALRINGRUNS = LOG_RUNNING;
	b_logentry(TOPIC_ADDON_ORNAMENT,"I have brought all the fragments of the ornamental ring to Nefarius. The Water Mages now want to weld the ring back together.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ringritual");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Ringritual");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Ringritual");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Ringritual");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Ringritual");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Ringritual");
};


instance DIA_ADDON_NEFARIUS_RINGRITUALENDS(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_ringritualends_condition;
	information = dia_addon_nefarius_ringritualends_info;
	important = TRUE;
};


func int dia_addon_nefarius_ringritualends_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (RITUALRINGRUNS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_ringritualends_info()
{
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_00");	//The ornament has been put back together.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_01");	//Since you brought us the necessary fragments, you should also set them into the portal.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_02");	//Go to Saturas and let him give you the reassembled ring.
	AI_Output(self,other,"DIA_Addon_Nefarius_RingRitualEnds_05_03");	//Hopefully, the portal will then open.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(kdw_1400_addon_saturas_nw,"Start");
	b_startotherroutine(kdw_1401_addon_cronos_nw,"Start");
	b_startotherroutine(kdw_1403_addon_myxir_nw,"Start");
	b_startotherroutine(kdw_1404_addon_riordian_nw,"Start");
	b_startotherroutine(kdw_1405_addon_merdarion_nw,"Start");
	RITUALRINGRUNS = LOG_SUCCESS;
	b_logentry(TOPIC_ADDON_ORNAMENT,"The ornamental ring has been put back together. I am to get it from Saturas.");
};


instance DIA_ADDON_NEFARIUS_OPENEDPORTAL(C_INFO)
{
	npc = kdw_1402_addon_nefarius_nw;
	nr = 5;
	condition = dia_addon_nefarius_openedportal_condition;
	information = dia_addon_nefarius_openedportal_info;
	description = "What now?";
};


func int dia_addon_nefarius_openedportal_condition()
{
	if(RITUALRINGRUNS == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_nefarius_openedportal_info()
{
	AI_Output(other,self,"DIA_Addon_Nefarius_OpenedPortal_15_00");	//What now?
	AI_Output(self,other,"DIA_Addon_Nefarius_OpenedPortal_05_01");	//What are you waiting for? Go and get out of our way.
};

