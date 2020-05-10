
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "Stone of knowledge";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITWR_PALADINLETTER_MIS(C_ITEM)
{
	name = "A letter to Lord Hagen";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02_Old.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepaladinletter;
	scemename = "MAP";
	description = name;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void usepaladinletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"Lord Hagen!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"The expedition to the Valley of Mines failed. We suffered many losses. The survivors are trapped in the castle, surrounded by orcs.");
	Doc_PrintLines(ndocid,0,"We have been attacked by dragons many times. They have devastated the lands around the castle. With Innos' help we shall prevail until reinforcements arrive. A sortie is impossible.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"May Innos keep us all.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Garond");
	Doc_Show(ndocid);
};


instance ITWR_LETTERFORGORN_MIS(C_ITEM)
{
	name = "Letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useletterforgorn;
	scemename = "MAP";
	description = "Milten's note to Gorn";
};


func void useletterforgorn()
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
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Gorn!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Garond has agreed to set you free - for 1000 pieces of gold.");
	Doc_PrintLines(ndocid,0,"So, if you have any gold stacked away somewhere, now would be a good time to reveal it.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Milten");
	Doc_Show(ndocid);
};


instance ITKE_PRISONKEY_MIS(C_ITEM)
{
	name = "Dungeon key";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the dungeon";
	text[3] = "in the castle.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_OC_STORE(C_ITEM)
{
	name = "Store key";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the store room";
	text[3] = "in the castle.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_ERZBARONFLUR(C_ITEM)
{
	name = "Door key";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "For the first door";
	text[2] = "There is a name engraved on it:";
	text[3] = "Gomez.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_ERZBARONRAUM(C_ITEM)
{
	name = "Door key";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "For the second door";
	text[2] = "There is a name engraved on it:";
	text[3] = "Gomez.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 250;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = usegornstreasure;
	description = "Gorn's leather bag";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usegornstreasure()
{
	b_playerfinditem(itmi_gold,250);
	GORNS_BEUTEL = TRUE;
};


instance ITWR_SILVESTRO_MIS(C_ITEM)
{
	name = "Note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "Silvestro's note";
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"From the King's paladin Silvestro");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Another day of scraping awaits. Today we intend to break through the wall and dig deeper into the rock.");
	Doc_PrintLines(ndocid,0,"I've got a bad feeling about this, so I'm going to have the ore hidden away.");
	Doc_PrintLines(ndocid,0,"Diego's the only one of us who knows his way round here. I have to trust him. He'll take the chests to safety - but I'm not letting him go alone.");
	Doc_PrintLines(ndocid,0,"The ore must be protected at all costs, so");
	Doc_PrintLine(ndocid,0,"I'm sending two knights to go with Diego.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Long live the King.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Silvestro");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "Snapper claw";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_Claw.3DS";
	material = MAT_LEATHER;
	description = "Leader of the pack's claws";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = useolav;
	description = "Olav's bag";
	text[2] = "There are a few coins jingling inside.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useolav()
{
	b_playerfinditem(itmi_gold,25);
};


instance ITMI_GOLDPLATE_MIS(C_ITEM)
{
	name = "Gold plate";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_PASS_MIS(C_ITEM)
{
	name = "Pass key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = "A small key";
	text[1] = "Opens the gate to the pass.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_BROMOR(C_ITEM)
{
	name = "Bromor's key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "Room key of the brothel owner's room.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_RUNE_MIS(C_ITEM)
{
	name = "Key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = "A small chest key";
	text[1] = "The chest this key belongs to";
	text[2] = "is under a bridge.";
	text[3] = "It contains a runestone.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITWR_BLOODY_MIS(C_ITEM)
{
	name = "Note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebloodmis;
	scemename = "MAP";
	description = "Bloodfly's venom";
};


func void usebloodmis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"The stinger of a bloodfly contains a deadly venom that no person of sane mind would ever take.");
	Doc_PrintLines(ndocid,0,"Unless he knows the art of removing the stinger and the following rule.");
	Doc_PrintLines(ndocid,0,"The stinger is cut open tidily by running a sharp blade from the tip to the shaft.");
	Doc_PrintLines(ndocid,0,"The upper skin layer is removed. The exposed tissue is cut open around the glands.");
	Doc_PrintLines(ndocid,0,"The special juice of the tissue has healing properties.");
	Doc_PrintLines(ndocid,0,"However, the human body grows immune to the healing potion in time.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Damarok");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"Now I know what to do in order to extract healing juices from the stingers of bloodflies.");
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
};


instance ITWR_PFANDBRIEF_MIS(C_ITEM)
{
	name = "Note of Debenture";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02_Old.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepfandbrief;
	scemename = "MAP";
	description = name;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void usepfandbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLines(ndocid,0,"For payment of outstanding debts a pawned item shall be accepted, whose value equals that of the debts.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Pawned: a decorated gold chalice of the Blood Chalice collection.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Lutero, merchant");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Lehmar, pawnbroker");
	Doc_Show(ndocid);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS(C_ITEM)
{
	name = "Garond's mine map";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld_oremines;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void use_map_oldworld_oremines()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_oldworld_oremines_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


instance ITWR_MANOWAR(C_ITEM)
{
	name = "Dominique's Cry";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemanowar;
	scemename = "MAP";
	description = name;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void usemanowar()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Dominique's cry");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"We shall reap His glory.");
	Doc_PrintLines(ndocid,0,"Innos stands by me and my brothers.");
	Doc_PrintLines(ndocid,0,"I will slay all who would stop me like sheep");
	Doc_PrintLines(ndocid,0,"for He is the fire inside my heart.");
	Doc_PrintLines(ndocid,0,"My blade serves Him alone.");
	Doc_PrintLines(ndocid,0,"On this day His name will echo forth.");
	Doc_PrintLines(ndocid,0,"Any man who opposes me");
	Doc_PrintLines(ndocid,0,"will die at my hand");
	Doc_PrintLines(ndocid,0,"for I am a warrior of Innos.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "Message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02_Old.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = name;
	text[1] = "Saturas message";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void usekdwletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLines(ndocid,0,"We have left the camp. Now that the Barrier has fallen, we will seek out the center of the destruction. Maybe we will find there the answers we have sought for so many years. Adanos alone knows where our journey will take us.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Adanos is with us.");
	Doc_PrintLine(ndocid,0,"Saturas");
	Doc_Show(ndocid);
};


instance ITWR_GILBERTLETTER(C_ITEM)
{
	name = "Note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ITWR_SCROLL_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usegilbertletter;
	scemename = "MAP";
	description = name;
};


func void usegilbertletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLines(ndocid,0,"I'm fed up. I've been hiding here long enough. And if I heard rightly, the Barrier's finally fallen.");
	Doc_PrintLines(ndocid,0,"It seems unlikely anyone will look for me now. I've had enough of this cave and the whole damn valley. It's time I went home.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Gilbert");
	Doc_Show(ndocid);
};


instance ITRI_TENGRON(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HP;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_tengron;
	on_unequip = unequip_itri_tengron;
	description = NAME_ADDON_TENGRONSRING;
	text[2] = NAME_BONUS_HP;
	count[2] = RI_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + RI_HP;
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + RI_HP;
};

func void unequip_itri_tengron()
{
	self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - RI_HP;
	if(self.attribute[ATR_HITPOINTS] > (RI_HP + 1))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - RI_HP;
	}
	else
	{
		self.attribute[ATR_HITPOINTS] = 2;
	};
};

