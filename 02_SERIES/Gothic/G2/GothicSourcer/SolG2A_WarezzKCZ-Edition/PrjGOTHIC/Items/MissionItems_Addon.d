
instance ITWR_SATURASFIRSTMESSAGE_ADDON_SEALED(C_ITEM)
{
	name = "Sealed message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "This message was carefully sealed";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


var int use_saturasfirstmessage_onetime;
var int bezi_use_saturasfirstmessage;

func void use_saturasfirstmessage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Dear Vatras,");
	Doc_PrintLines(ndocid,0,"we have adanced to the portal. You were correct.");
	Doc_PrintLines(ndocid,0,"It indeed appears that they were believers in Adanos. I ask you to verify this once again with the help of my notes.");
	Doc_PrintLines(ndocid,0,"We have not spotted any of those curious stone beings for days.");
	Doc_PrintLines(ndocid,0,"Nevertheless, the earth continues to quake for no apparent reason.");
	Doc_PrintLines(ndocid,0,"I suspect that our studies will soon bring us more enlightenment.");
	Doc_PrintLines(ndocid,0,"The ornament which we found has a far more important significance than we first thought. It seems to be a crucial key artifact. Alas, it is not complete. We must study it further.");
	Doc_PrintLines(ndocid,0,"Dispatch one of our children from the 'Ring of Water' to bring it back to us. If possible, do not send Cavalorn.");
	Doc_PrintLines(ndocid,0,"I have assigned him to deliver this letter to you. I think that is enough for him to do.");
	Doc_PrintLine(ndocid,0,"I hope we are doing the right thing.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                                 Saturas");
	Doc_Show(ndocid);
	if((use_saturasfirstmessage_onetime == FALSE) && (MIS_ADDON_CAVALORN_LETTER2VATRAS != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_ADDON_KDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_KDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_KDW,"I took a message that Cavalorn was supposed to deliver to the Water Mage Vatras from a bandit. Now it is my task.");
		use_saturasfirstmessage_onetime = TRUE;
	};
	if(SC_KNOWSRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"There is a community that calls itself the 'Ring of Water'. The Water Mages seem to be the commanders of this community.");
	};
	if(SC_ISRANGER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_RINGOFWATER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RINGOFWATER,LOG_RUNNING);
		Log_AddEntry(TOPIC_ADDON_RINGOFWATER,"Cavalorn belongs to the 'Ring of Water'.");
	};
	if(!bezi_use_saturasfirstmessage)
	{
		bezi_use_saturasfirstmessage = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	SC_KNOWSRANGER = TRUE;
};

func void use_saturasfirstmessage_sealed()
{
	CreateInvItems(self,itwr_saturasfirstmessage_addon,1);
	SATURASFIRSTMESSAGEOPENED = TRUE;
	use_saturasfirstmessage();
};


instance ITWR_SATURASFIRSTMESSAGE_ADDON(C_ITEM)
{
	name = "Opened message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_V3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_saturasfirstmessage;
	scemename = "MAP";
	description = name;
	text[2] = "Saturas' letter to Vatras";
};

instance ITMI_ORNAMENT_ADDON(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment of a large ornamental ring";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITMI_ORNAMENT_ADDON_VATRAS(C_ITEM)
{
	name = "Ornament";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_PortalRing_05.3DS";
	material = MAT_METAL;
	description = name;
	text[0] = "Fragment of a large ornamental ring";
	inv_zbias = INVCAM_ENTF_MISC5_STANDARD;
};

instance ITWR_MAP_NEWWORLD_ORNAMENTS_ADDON(C_ITEM)
{
	name = "Nefarius' map";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_ornaments;
	description = name;
	text[0] = "The places where Nefarius assumes the missing";
	text[1] = "ornaments can be found are marked on this map.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_ornaments()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_ornaments_addon);
	};
	SC_SAW_ORNAMENT_MAP = TRUE;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Ornaments.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50000,120000,-75000);
	Doc_Show(document);
};


instance ITWR_MAP_NEWWORLD_DEXTER(C_ITEM)
{
	name = "Land map of Khorinis";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 210;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_dexter;
	description = name;
	text[0] = "The pirate Skip has marked the place";
	text[1] = "where I can find Dexter,";
	text[2] = "the leader of the bandits.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_dexter()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_newworld_dexter);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Dexter.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


prototype RANGERRING_PROTOTYPE(C_ITEM)
{
	name = "Aquamarine ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_HPMANA;
	visual = "ItRi_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_ranger_addon;
	on_unequip = unequip_itri_ranger_addon;
	description = "Recognition sign of the 'Ring of Water'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

func void equip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(ENTERED_ADDONWORLD == FALSE)
		{
			if(Npc_HasItems(hero,itri_ranger_addon) == FALSE)
			{
				RANGERRINGISLARESRING = TRUE;
			};
		};
		SCISWEARINGRANGERRING = TRUE;
		Print(PRINT_ADDON_SCISWEARINGRANGERRING);
	};
};

func void unequip_itri_ranger_addon()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(SC_ISRANGER == FALSE)
		{
			SCISWEARINGRANGERRING = FALSE;
		};
		RANGERRINGISLARESRING = FALSE;
	};
};


instance ITRI_RANGER_LARES_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "This ring belongs to Lares";
};

instance ITRI_RANGER_ADDON(RANGERRING_PROTOTYPE)
{
	text[1] = "This ring belongs to me";
};

instance ITRI_LANCERING(RANGERRING_PROTOTYPE)
{
	text[1] = "This ring belongs to Lance";
};

instance ITMI_PORTALRING_ADDON(C_ITEM)
{
	name = "Ornamental ring";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_PortalRing_01.3DS";
	material = MAT_STONE;
	description = name;
	text[0] = "This ring opens the portal";
	inv_zbias = INVCAM_ENTF_MISC3_STANDARD;
};

instance ITWR_MARTIN_MILIZEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "Martin's letter of recommendation";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_martinmilizempfehlung_addon;
	scemename = "MAP";
	description = "Letter of recommendation for Lord Andre";
	text[2] = "This letter should help me";
	text[3] = "to be accepted in the militia.";
};


func void use_martinmilizempfehlung_addon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Honored Lord Andre,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"with this letter I send a new recruit for our militia to you.");
	Doc_PrintLine(ndocid,0,"He has already been of service to me in some difficult and important matters.");
	Doc_PrintLines(ndocid,0,"I am sure that he is very well suited to protect the King and the welfare of the citizens of this city.");
	Doc_PrintLine(ndocid,0,"Innos bless the King.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Provisions master Martin");
	Doc_Show(ndocid);
};


instance ITWR_RAVENSKIDNAPPERMISSION_ADDON(C_ITEM)
{
	name = "Orders";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_ravenskidnappermission_addon;
	scemename = "MAP";
	description = name;
	text[2] = "I took this letter";
	text[3] = "from the bandit Dexter.";
};


var int use_ravenskidnappermission_addon_onetime;

func void use_ravenskidnappermission_addon()
{
	var int ndocid;
	if((use_ravenskidnappermission_addon_onetime == FALSE) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE != 0))
	{
		Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"Now I have it in writing. Raven, the former ore baron, is behind the kidnapping of the citizens of Khorinis. Raven's hideout is somewhere behind the mountains in the northeast of Khorinis. Vatras should see this document.");
		use_ravenskidnappermission_addon_onetime = TRUE;
	};
	if(SCKNOWSMISSINGPEOPLEAREINADDONWORLD == FALSE)
	{
		SCKNOWSMISSINGPEOPLEAREINADDONWORLD = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLines(ndocid,0,"Dexter, you bastard!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"You weren't so unreliable when I was still an ore baron.");
	Doc_PrintLines(ndocid,0,"If you can't manage to kidnap more citizens from the city and send them to me, then we will soon have a serious problem with the boys in our hideout.");
	Doc_PrintLines(ndocid,0,"I need more slaves here or the boys will start a revolt. And I don't have to tell you what that means, do I?");
	Doc_PrintLines(ndocid,0,"I am about to get inside the temple. With that, I can't afford disturbances of this sort.");
	Doc_PrintLines(ndocid,0,"And one more problem: sooner or later we have to find a way over the high mountains in the northeast of Khorinis. The pirates won't handle the transport much longer if we don't pay them any more.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                 Raven");
	Doc_Show(ndocid);
};


instance ITWR_VATRAS_KDFEMPFEHLUNG_ADDON(C_ITEM)
{
	name = "Vatras' letter of recommendation";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatraskdfempfehlung_addon;
	scemename = "MAP";
	description = name;
	text[2] = "This letter should help me";
	text[3] = "get into the monastery of the Fire Magicians,";
	text[4] = "without paying for entrance.";
};


func void use_vatraskdfempfehlung_addon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Brothers of the Fire,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"it has just been reported to me that you require a tribute for admission into your realm.");
	Doc_PrintLines(ndocid,0,"I send along with this letter a devout man who wishes to become a novice in your ranks.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                                   Vatras");
	Doc_Show(ndocid);
};


instance ITMI_LOSTINNOSSTATUE_DARON(C_ITEM)
{
	name = "Valuable statue of Innos";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LUCIASLOVELETTER_ADDON(C_ITEM)
{
	name = "Lucia's farewell letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_luciasloveletter_addon;
	scemename = "MAP";
	description = name;
};


func void use_luciasloveletter_addon()
{
	var int ndocid;
	if(MIS_LUCIASLETTER == FALSE)
	{
		Log_CreateTopic(TOPIC_ADDON_LUCIA,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_LUCIA,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_LUCIA,"Lucia wrote a farewell letter to Elvrich. That should interest him.");
		MIS_LUCIASLETTER = LOG_RUNNING;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Dearest Elvrich,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I cannot find the words to describe how sorry I am.");
	Doc_PrintLine(ndocid,0,"I know that you will not understand but I have come to the conclusion that it is better for both of us if you find a more respectable girl than I am.");
	Doc_PrintLines(ndocid,0,"I won't be coming back from where I am going now. Forget me. A wench like me isn't right for an upright fellow like you. Farewell.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                               Lucia");
	Doc_Show(ndocid);
};


prototype EFFECTITEMPROTOTYPE_ADDON(C_ITEM)
{
	name = "Stone";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_COAL;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_AMBOSSEFFEKT_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_FOREST_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_ORNAMENTEFFEKT_BIGFARM_ADDON(EFFECTITEMPROTOTYPE_ADDON)
{
};

instance ITMI_RAKE(C_ITEM)
{
	name = "Pick";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAKE;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemename = "RAKE";
	on_state[1] = use_rake;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void use_rake()
{
};


instance ITRI_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Guild ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = 5;
	visual = "ItRi_Prot_Point_02.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Engraved ring";
	text[2] = "Overseas-trader guild, Araxos.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITWR_ADDON_BANDITTRADER(C_ITEM)
{
	name = "Delivery";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_addon_bandittrader;
	scemename = "MAP";
	description = name;
	text[2] = "I found this letter from bandits";
	text[3] = "behind the Sekob's farm.";
};


var int use_itwr_addon_bandittrader_onetime;

func void use_itwr_addon_bandittrader()
{
	var int ndocid;
	if(!BANDITTRADER_LIEFERUNG_GELESEN)
	{
		BANDITTRADER_LIEFERUNG_GELESEN = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"Requested furniture:");
	Doc_PrintLines(ndocid,0,"- 15 short swords");
	Doc_PrintLines(ndocid,0,"- 20 rapiers");
	Doc_PrintLines(ndocid,0,"- 25 loaves of bread");
	Doc_PrintLines(ndocid,0,"- 15 bottles of wine");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"That was the last time,");
	Doc_PrintLines(ndocid,0,"this thing is getting too hot.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"FERNANDO");
	Doc_Show(ndocid);
	if((MIS_VATRAS_FINDTHEBANDITTRADER != 0) && (use_itwr_addon_bandittrader_onetime == FALSE))
	{
		b_logentry(TOPIC_ADDON_BANDITTRADER,"I found a document that can prove that Fernando is the weapons dealer I am looking for.");
		use_itwr_addon_bandittrader_onetime = TRUE;
	};
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN(C_ITEM)
{
	name = "Message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven_sealed;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Vatras' letter for Saturas.";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void use_vatras2saturas_findraven()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Dear Saturas,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I hope that you will soon reach your goal.");
	Doc_PrintLines(ndocid,0,"Our situation here in the city appears to have relaxed somewhat at the moment. But I fear that the quiet is deceptive. You should hurry. I need you here.");
	Doc_PrintLines(ndocid,0,"I have studied your records and can confirm your suspicion. The writing does indeed point to an Adanos-worshipping culture. Be careful and do not allow yourselves to be blinded by false prophets.");
	Doc_PrintLines(ndocid,0,"The missing citizens of Khorinis were dragged by the former ore baron Raven to the region where the portal obviously leads.");
	Doc_PrintLines(ndocid,0,"One more thing: I have sent you help. The bearer of this message is somebody very special. He has such a remarkable gleam in his eyes. I am not certain, but it could be");
	Doc_PrintLines(ndocid,0,"HE, even if we had imagined him differently.");
	Doc_PrintLines(ndocid,0,"Test him. I think I am right.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            Vatras");
	Doc_Show(ndocid);
};

func void use_vatras2saturas_findraven_sealed()
{
	CreateInvItems(self,itwr_vatras2saturas_findraven_opened,1);
	VATRAS2SATURAS_FINDRAVEN_OPEN = TRUE;
	use_vatras2saturas_findraven();
};


instance ITWR_VATRAS2SATURAS_FINDRAVEN_OPENED(C_ITEM)
{
	name = "Opened message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_vatras2saturas_findraven;
	scemename = "MAP";
	description = name;
	text[2] = "Vatras' letter for Saturas.";
};

instance ITAM_ADDON_WISPDETECTOR(C_ITEM)
{
	name = "Ore amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 100;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_wispdetector;
	on_unequip = unequip_wispdetector;
	description = "Ore amulet of the searching will-o'-the-wisp";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


var int equip_wispdetector_onetime;

func void equip_wispdetector()
{
	var C_NPC detwsp;
	if(equip_wispdetector_onetime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE;
		WISPSEARCHING = WISPSEARCH_NF;
		equip_wispdetector_onetime = TRUE;
	};
	detwsp = Hlp_GetNpc(wisp_detector);
	AI_Teleport(detwsp,"TOT");
	Wld_SpawnNpcRange(self,wisp_detector,1,500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",wisp_detector,wisp_detector,0,0,0,FALSE);
	Snd_Play("MFX_Transform_Cast");
};

func void unequip_wispdetector()
{
	var C_NPC detwsp;
	detwsp = Hlp_GetNpc(wisp_detector);
	if(Npc_IsDead(detwsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};
	AI_Teleport(detwsp,"TOT");
	b_removenpc(detwsp);
	AI_Teleport(detwsp,"TOT");
};


instance ITFO_ADDON_KROKOFLEISCH_MISSION(C_ITEM)
{
	name = "Swamprat meat";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	description = name;
	text[1] = "Smells fishy somehow!";
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};

instance ITRI_ADDON_MORGANSRING_MISSION(C_ITEM)
{
	name = "Morgan's ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = 500;
	visual = "ItRi_Prot_Total_02.3DS";
	material = MAT_METAL;
	on_equip = morgan_equip_10;
	on_unequip = morgan_unequip_10;
	description = name;
	text[1] = "The ring is decorated with many fine runes.";
	text[4] = NAME_ADDON_BONUS_1H;
	count[4] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITMI_FOCUS(C_ITEM)
{
	name = "Focus stone";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_Focus.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITMI_ADDON_STEEL_PAKET(C_ITEM)
{
	name = "Steel package";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "This package is REALLY heavy.";
	text[3] = "It contains a fat lump of steel.";
};

instance ITWR_STONEPLATECOMMON_ADDON(C_ITEM)
{
	name = "Old stone tablet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_STONEPLATECOMMON;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_stoneplatecommon;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "A grey stone tablet.";
	count[5] = VALUE_STONEPLATECOMMON;
};


func void use_stoneplatecommon()
{
	var int ndocid;
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,-1,70,50,90,50,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The caste of the warriors called down the wrath of our god.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"RHADEMES, the successor of Quarhodron, was banished. But his evil power reached us even from the place of his exile.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"We were powerless against it.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"ADANOS' wrath struck JHERENDAR!");
	}
	else
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,1);
		Doc_SetPage(ndocid,0,"Maya_Stoneplate_02.TGA",0);
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_01(C_ITEM)
{
	name = "Red stone tablet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_03.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_01;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Red stone tablet.";
};


func void use_addon_stone_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_02.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		Doc_PrintLines(ndocid,0,"We, the last three leaders of the Council of Five, have provided the chambers of the temple with traps and hidden the entrance so that the sword will never again see the light of day.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_05(C_ITEM)
{
	name = "Yellow stone tablet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_04.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_05;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Yellow stone tablet.";
};


func void use_addon_stone_05()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		Doc_PrintLines(ndocid,0,"I, who was against the decision of the Three, built the first trap. And only I know the correct doorway.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_03(C_ITEM)
{
	name = "Blue stone tablet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_05.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_03;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Blue stone tablet.";
};


func void use_addon_stone_03()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON devised the second trap. And only he who follows the way of Light to the end will reach the third chamber.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_04(C_ITEM)
{
	name = "Green stone tablet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_01.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_04;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Green stone tablet.";
};


func void use_addon_stone_04()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_04.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		Doc_PrintLines(ndocid,0,"The third trap was built by QUARHODRON and only he knows how to open the portal.");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_STONE_02(C_ITEM)
{
	name = "Purple stone tablet";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StonePlate_Read_02.3ds";
	material = MAT_STONE;
	on_state[0] = use_addon_stone_02;
	scemename = "MAP";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	description = name;
	text[2] = "Purple stone tablet";
};


func void use_addon_stone_02()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Adanos_Stoneplate_05.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,70,50,90,50,1);
	Doc_PrintLine(ndocid,0,"");
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		Doc_PrintLines(ndocid,0,"It was also Quarhodron who sealed the outer gate of the temple with the help of KHARDIMON. Neither of them survived the ritual.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Only I remain to tell the tale.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"I hope that RHADEMES rots for eternity in the temple!");
	}
	else
	{
		Doc_PrintLines(ndocid,0,"QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!");
		b_say(self,self,"$CANTREADTHIS");
	};
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_KOMPASS_MIS(C_ITEM)
{
	name = "Golden compass";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 500;
	visual = "ItMi_Compass_01.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITSE_ADDON_FRANCISCHEST(C_ITEM)
{
	name = "Treasure chest";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_GoldChest.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = francischest;
	description = name;
	text[0] = "The chest is very heavy.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void francischest()
{
	CreateInvItems(hero,itmi_goldchest,1);
	CreateInvItems(hero,itmw_francisdagger_mis,1);
	CreateInvItems(hero,itmi_gold,153);
	CreateInvItems(hero,itmi_goldcup,1);
	CreateInvItems(hero,itmi_silvernecklace,1);
	CreateInvItems(hero,itwr_addon_francisabrechnung_mis,1);
	Snd_Play("Geldbeutel");
	Print("Received a pile of stuff!");
};


instance ITWR_ADDON_FRANCISABRECHNUNG_MIS(C_ITEM)
{
	name = "Paybook";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usefrancisabrechnung_mis;
};


func void usefrancisabrechnung_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Merchantman 'Mermaid'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Total booty: 14560 gold");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Crew: 9840");
	Doc_PrintLine(ndocid,0,"Officers: 2500");
	Doc_PrintLine(ndocid,0,"Captain: 1000");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Personal share: 2220");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Merchant vessel 'Miriam'");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Total booty: 4890 gold");
	Doc_PrintLine(ndocid,0,"-----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Crew: 2390");
	Doc_PrintLine(ndocid,0,"Officers: 500");
	Doc_PrintLine(ndocid,0,"Captain: 500");
	Doc_PrintLine(ndocid,0,"----------------------");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Personal share: 1000");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Merchant ship 'Nico'");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Total booty: 9970");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Crew: 5610");
	Doc_PrintLine(ndocid,1,"Officers: 1500");
	Doc_PrintLine(ndocid,1,"Captain: 1000");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Personal share: 1860");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Merchantman 'Maria'");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Total booty: 7851 gold");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Crew: 4400");
	Doc_PrintLine(ndocid,1,"Officers: 750");
	Doc_PrintLine(ndocid,1,"Captain: 1000");
	Doc_PrintLine(ndocid,1,"----------------------");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Personal share: 1701");
	Doc_Show(ndocid);
	if(!FRANCIS_HASPROOF)
	{
		FRANCIS_HASPROOF = TRUE;
		b_say(self,self,"$ADDON_THISLITTLEBASTARD");
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
};


instance ITWR_ADDON_GREGSLOGBUCH_MIS(C_ITEM)
{
	name = "Log book";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Greg's log book";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = usegregslogbuch;
};


func void usegregslogbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLines(ndocid,0,"I've seen more than enough of this beach. Sand everywhere. I can't even sleep right any more because everything itches. It's time that Raven forked over the gold for the prisoners and we put to sea again. I'll have to have a word with the puffed-up jerk.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"How dare that ass? He made his stinking henchmen at the gate send me away. He'll have me to reckon with! I'll turn his bootlicker Bloodwyn into fish food with my own hands.");
	Doc_PrintLines(ndocid,0,"If he doesn't pay soon, I'll have to get tough.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLines(ndocid,1,"The bandits are getting brazen. They still haven't paid for the last delivery. We just don't have enough information. I have to find out what Raven wants here.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"I'll take the majority of the crew to the mainland and secure the ore. Francis will stay behind with a few people and fortify the camp.");
	Doc_PrintLines(ndocid,1,"So the time doesn't go to waste, I gave Bones the armor. He'll sneak into the bandit camp for me and find out what Raven is planning there.");
	if(!GREG_GAVEARMORTOBONES)
	{
		GREG_GAVEARMORTOBONES = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	Doc_Show(ndocid);
};


instance ITKE_ADDON_BLOODWYN_01(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "Bloodwyn's key";
	text[2] = "Opens a chest in the temple.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ADDON_HEILER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "A stone sentinel's key";
	text[2] = "Chest key,";
	text[3] = "located in an old building in the swamp.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_TEMPELTORKEY(C_ITEM)
{
	name = "Stone tablet of Quarhodron";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_StonePlate_Read_06.3ds";
	material = MAT_STONE;
	scemename = "MAP";
	on_state[0] = use_tempeltorkey;
	text[2] = "The key to the temple of Adanos";
};


func void use_tempeltorkey()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Maya_Stoneplate_03.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"  Jhehedra Akhantar");
	Doc_Show(ndocid);
};


instance ITMI_ADDON_BLOODWYN_KOPF(C_ITEM)
{
	name = "Bloodwyn's head";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Head_Bloodwyn_01.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ITWR_ADDON_TREASUREMAP(C_ITEM)
{
	name = "Treasure map";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_treasuremap;
	description = name;
	text[1] = "Some places are marked on the map";
};


func void use_treasuremap()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_addon_treasuremap);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_AddonWorld_Treasures.tga",TRUE);
	Doc_SetLevel(document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(document,-47783,36300,43949,-32300);
	Doc_Show(document);
};


instance ITMI_ADDON_GREGSTREASUREBOTTLE_MIS(C_ITEM)
{
	name = "Message in a bottle";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Water.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_gregsbottle;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "There is a piece of paper in the bottle";
};


func void use_gregsbottle()
{
	b_playerfinditem(itwr_addon_treasuremap,1);
};


instance ITMI_EROLSKELCH(C_ITEM)
{
	name = "Scratched silver bowl";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 125;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

