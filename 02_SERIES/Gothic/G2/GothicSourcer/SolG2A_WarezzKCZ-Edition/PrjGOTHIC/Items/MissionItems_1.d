
instance ITKE_XARDAS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Chest key,";
	text[3] = "belonging to Xardas.";
};

instance ITWR_CANTHARS_KOMPROBRIEF_MIS(C_ITEM)
{
	name = "Letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_canthars_komprobrief;
	scemename = "MAP";
	description = "Canthar's letter to the merchant Sarah.";
};


func void use_canthars_komprobrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,55,50,100,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Last warning");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,65,50,100,50,1);
	Doc_PrintLine(ndocid,0,"I have already reminded you several");
	Doc_PrintLine(ndocid,0,"times in the friendliest");
	Doc_PrintLine(ndocid,0,"terms that I urgently require the");
	Doc_PrintLine(ndocid,0,"weapons I ordered from you a week");
	Doc_PrintLine(ndocid,0,"ago.");
	Doc_PrintLine(ndocid,0,"If I don't hear from you very soon,");
	Doc_PrintLine(ndocid,0,"Sarah, I will be forced to change my");
	Doc_PrintLine(ndocid,0,"attitude to you. I hope we understand");
	Doc_PrintLine(ndocid,0,"each other!!!!!!!!!!!!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            Onar");
	Doc_Show(ndocid);
};


instance ITMW_2H_ROD(C_ITEM)
{
	name = "Rod's two-hander";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SLD2HSCHWERT;
	damagetotal = DAMAGE_ROD;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HSCHWERT;
	on_equip = mw2h_minus_equip_10;
	on_unequip = mw2h_minus_unequip_10;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ROD;
	visual = "ItMw_035_2h_sld_sword_01.3DS";
	description = name;
	text[0] = NAME_TWOHANDED;
	text[1] = NAME_DAM_EDGE;
	count[1] = damagetotal;
	text[2] = NAME_RANGE;
	count[2] = range;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ADDON_MALUS_2H;
	count[4] = WAFFENBONUS_10;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_CORAGONSSILBER(C_ITEM)
{
	name = "Coragon's silver";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCUP;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_THEKLASPAKET(C_ITEM)
{
	name = "Thekla's parcel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_theklaspacket;
	description = name;
};


func void use_theklaspacket()
{
	CreateInvItems(hero,itpl_mana_herb_01,3);
	CreateInvItems(hero,itpl_health_herb_02,1);
	CreateInvItems(hero,itpl_speed_herb_01,1);
	CreateInvItems(hero,itpl_blueplant,2);
	Print(PRINT_GOTPLANTS);
};


instance ITMI_MARIASGOLDPLATE(C_ITEM)
{
	name = "Heavy gold plate";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "The plate is engraved with";
	text[3] = "the names Onar and Maria.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_VALENTINOSRING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTEDGE;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_valentinosring;
	on_unequip = unequip_valentinosring;
	description = "Valentino's ring";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_valentinosring()
{
	self.protection[PROT_EDGE] += RI_PROTEDGE;
	self.protection[PROT_BLUNT] += RI_PROTEDGE;
	STAT_SWORDDEF = STAT_SWORDDEF + (RI_PROTEDGE * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};

func void unequip_valentinosring()
{
	self.protection[PROT_EDGE] -= RI_PROTEDGE;
	self.protection[PROT_BLUNT] -= RI_PROTEDGE;
	STAT_SWORDDEF = STAT_SWORDDEF - (RI_PROTEDGE * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITKE_DEXTER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Chest key,";
	text[3] = "belonging to Dexter.";
};

instance ITWR_KRAEUTERLISTE(C_ITEM)
{
	name = "List";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_kraeuterliste;
	scemename = "MAP";
	description = "Constantino's list of herbs";
};


func void use_kraeuterliste()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," Alchemical herbs");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    Healing plant");
	Doc_PrintLine(ndocid,0,"    Healing herb");
	Doc_PrintLine(ndocid,0,"    Healing root");
	Doc_PrintLine(ndocid,0,"    Fire nettle");
	Doc_PrintLine(ndocid,0,"    Fireweed");
	Doc_PrintLine(ndocid,0,"    Fire root");
	Doc_PrintLine(ndocid,0,"    Goblin berry");
	Doc_PrintLine(ndocid,0,"    Dragonroot");
	Doc_PrintLine(ndocid,0,"    Snapperweed");
	Doc_PrintLine(ndocid,0,"    Meadow knotweed");
	Doc_PrintLine(ndocid,0,"    King's sorrel");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Note: let a potential apprentice fetch the plants for you. That way you'll know if he's any good.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            Regards, Zuris");
	Doc_Show(ndocid);
};


instance ITWR_MANAREZEPT(C_ITEM)
{
	name = "Recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept;
	scemename = "MAP";
	description = "Recipe for magical essence";
};


func void use_manarezept()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Magic potions");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"To brew magic potions, a skilled alchemist needs:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fire nettle");
	Doc_PrintLine(ndocid,0,"Fireweed");
	Doc_PrintLine(ndocid,0,"Fire root");
	Doc_PrintLine(ndocid,0,"King's sorrel");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Master Neoras");
	Doc_Show(ndocid);
};


instance ITWR_PASSIERSCHEIN(C_ITEM)
{
	name = "Pass";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02_V2.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassierschein;
	scemename = "MAP";
	description = name;
	text[3] = "This paper permits me";
	text[4] = "to pass the city guards.";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void usepassierschein()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,100,100,50,50,1);
	Doc_PrintLine(ndocid,0,"Pass");
	Doc_PrintLine(ndocid,0,"   for Khorinis");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"This document entitles");
	Doc_PrintLine(ndocid,0," the bearer to move freely");
	Doc_PrintLine(ndocid,0,"  in the lower areas of Khorinis");
	Doc_PrintLine(ndocid,0,"   for an unlimited time period.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        Larius,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            the King's governor");
	Doc_Show(ndocid);
};


instance ITMI_HERBPAKET(C_ITEM)
{
	name = "Parcel of weed";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "A heavy, sticky package,";
	text[3] = "that stinks of swampweed.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_STORAGE(C_ITEM)
{
	name = "Storehouse key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Key to the port";
	text[3] = "warehouse.";
};


const int HP_HERING = 20;

instance ITFO_SMELLYFISH(C_ITEM)
{
	name = "Herring";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 15;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_smellyfish;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HERING;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_smellyfish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERING);
};


instance ITFO_HALVORFISH_MIS(C_ITEM)
{
	name = "Strange fish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_halvorfish;
	description = "A weird-looking fish";
	text[2] = "There's something wrong with this fish";
	text[3] = "looks like it's been sewn up...";
};


func void use_halvorfish()
{
	CreateInvItems(hero,itwr_halvormessage,1);
	Print(PRINT_FISHLETTER);
};


instance ITWR_HALVORMESSAGE(C_ITEM)
{
	name = "Stinking note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehalvormessage;
	scemename = "MAP";
	description = name;
	text[2] = "This note was hidden inside a fish.";
};


func void usehalvormessage()
{
	var int ndocid;
	KNOWS_HALVOR = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    Keep your heads low, guys! ");
	Doc_PrintLine(ndocid,0,"    The militia's getting suspicious.");
	Doc_PrintLines(ndocid,0,"    Don't do anything until you hear from me again!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    Halvor");
	Doc_Show(ndocid);
};


instance ITMW_ALRIKSSWORD_MIS(C_ITEM)
{
	name = "Alrik's sword";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = VALUE_ALRIK;
	damagetotal = DAMAGE_ALRIK;
	damagetype = DAM_EDGE;
	range = RANGE_ALRIK;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_ALRIK;
	visual = "ItMw_025_1h_Sld_Sword_01.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_VATRASMESSAGE(C_ITEM)
{
	name = "Sealed message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessage;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "A message from Vatras";
	text[3] = "for the Fire Mages.";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void usevatrasmessage()
{
	var int ndocid;
	CreateInvItems(self,itwr_vatrasmessage_open,1);
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Dear Isgaroth,");
	Doc_PrintLines(ndocid,0,"I sense the ever-growing presence of another force.");
	Doc_PrintLines(ndocid,0,"It's a force so far unknown to us. Can it be that there are vassals of Beliar near?");
	Doc_PrintLines(ndocid,0,"I could be mistaken, but I believe father Pyrokar would be wise to take the matter in hand.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"May our prayers be answered.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Vatras");
	Doc_Show(ndocid);
};


instance ITWR_VATRASMESSAGE_OPEN(C_ITEM)
{
	name = "Message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessageopen;
	scemename = "MAP";
	description = name;
	text[2] = "A message from Vatras";
	text[3] = "for the Fire Mages.";
	text[4] = "The seal has been broken.";
};


func void usevatrasmessageopen()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Dear Isgaroth,");
	Doc_PrintLines(ndocid,0,"I sense the ever-growing presence of another force.");
	Doc_PrintLines(ndocid,0,"It's a force so far unknown to us. Can it be that there are vassals of Beliar near?");
	Doc_PrintLines(ndocid,0,"I could be mistaken, but I believe father Pyrokar would be wise to take the matter in hand.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"May our prayers be answered.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Vatras");
	Doc_Show(ndocid);
};


instance ITKE_HOTEL(C_ITEM)
{
	name = "Room key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Room key";
	text[3] = "of the hotel.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_THIEFGUILDKEY_MIS(C_ITEM)
{
	name = "Rusty key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "This key has been damaged by salty seawater.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_THIEFGUILDKEY_HOTEL_MIS(C_ITEM)
{
	name = "Rusty key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the hotel cellar.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_INNOS_MIS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the entrance";
	text[3] = "of the monastery of Innos.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_KLOSTERSCHATZ(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the monastery's";
	text[3] = "treasury.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_KLOSTERSTORE(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the monastery's";
	text[3] = "larder.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_KDFPLAYER(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the monastery's";
	text[3] = "cell.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_KLOSTERBIBLIOTHEK(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key to the monastery's";
	text[3] = "library.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITFO_SCHAFSWURST(C_ITEM)
{
	name = "Sheep sausage";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SAUSAGE;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_schafswurst;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SAUSAGE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SAUSAGE;
};


func void use_schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SAUSAGE);
};


instance ITPO_PERM_LITTLEMANA(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_littlemana;
	scemename = "POTIONFAST";
	description = "Essence of spirit";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_littlemana()
{
	b_raiseattribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance HOLY_HAMMER_MIS(C_ITEM)
{
	name = "Sacred hammer";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_HOLYHAMMER;
	owner = nov_608_garwig;
	damagetotal = DAMAGE_HOLYHAMMER;
	damagetype = DAM_BLUNT;
	range = RANGE_HOLYHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HOLYHAMMER;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "Damage:                    ??";
	text[3] = "Strength required:          ??";
	text[4] = "Two-handed weapon";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_MAGICCHEST(C_ITEM)
{
	name = "Old key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Old iron key.";
	text[3] = "Perhaps, this is the key";
	text[4] = "which belong to a padlock.";
};

instance ITWR_PASSAGE_MIS(C_ITEM)
{
	name = "Peace offer for the paladins";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassage;
	scemename = "MAP";
	description = name;
	text[3] = "This note should help me";
	text[4] = "to meet lord Hagen.";
};


func void usepassage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Honored Lord Hagen,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"we are both aware of your situation. I therefore propose the following arrangement: grant my men and myself total absolution before Innos and before the King.");
	Doc_PrintLines(ndocid,0,"In return, we offer to assist you in the defense of the town and the surrounding lands.");
	Doc_PrintLines(ndocid,0,"Moreover, I personally shall see to it that my men steer clear of the surrounding farms, except, of course, that of Onar, where we will continue to be stationed.");
	Doc_PrintLines(ndocid,0,"I am aware that there is enough room for myself and some of my men on the ship aboard which you will depart to the mainland. When you set sail, I want to be on board.");
	Doc_PrintLines(ndocid,0,"I beseech you: make your decision with all the wisdom given to you.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Signed General Lee");
	Doc_Show(ndocid);
};


instance ITWR_BANDITLETTER_MIS(C_ITEM)
{
	name = "Message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebanditletter;
	scemename = "MAP";
	description = name;
};


func void usebanditletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Stop all men who come");
	Doc_PrintLine(ndocid,0," from the mountains.");
	Doc_PrintLine(ndocid,0,"If someone comes along the pass,");
	Doc_PrintLine(ndocid,0," it will probably be an old man.");
	Doc_PrintLine(ndocid,0,"Don't let him fool you -");
	Doc_PrintLine(ndocid,0,"    he is a dangerous sorcerer.");
	Doc_PrintLine(ndocid,0,"Keep an eye on him.");
	Doc_PrintLine(ndocid,0,"     ");
	Doc_PrintLine(ndocid,0,"It's possible the guy we're looking for");
	Doc_PrintLine(ndocid,0,"    will contact him.");
	Doc_PrintLine(ndocid,0,"With this letter I'm sending you");
	Doc_PrintLine(ndocid,0,"    thirty pieces of gold.");
	Doc_PrintLine(ndocid,0,"I will give another thirty to anyone");
	Doc_PrintLine(ndocid,0,"    who kills the man.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Bring his head to the");
	Doc_PrintLine(ndocid,0,"    old mine near the landowner.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"D.");
	Doc_Show(ndocid);
};


instance ITWR_POSTER_MIS(C_ITEM)
{
	name = "Wanted note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Gesucht_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useposter;
	scemename = "MAP";
	description = name;
	text[3] = "A picture of me!";
};


func void useposter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Gesucht.TGA",0);
	Doc_Show(ndocid);
};


instance ITKE_BANDIT(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "This key belonged to";
	text[3] = "a bandit.";
};

instance ITRW_BOW_L_03_MIS(C_ITEM)
{
	name = "Hunting bow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGEN;
	damagetotal = DAMAGE_JAGDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGEN;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = "Bosper's hunting bow.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_PROT_POINT_01_MIS(C_ITEM)
{
	name = "Constantino's ring";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_PROTPOINT;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_point_01_mis;
	on_unequip = unequip_itri_prot_point_01_mis;
	description = "Ring of wooden skin";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] += RI_PROTPOINT;
};

func void unequip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] -= RI_PROTPOINT;
};


instance ITMI_EDDASSTATUE(C_ITEM)
{
	name = "Statue of Innos";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Innos, Lord of Justice,";
	text[3] = "bless and guard me,";
	text[4] = "and spare me from harm.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_CRYPT_01(C_ITEM)
{
	name = "Old brass key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key from the skeleton in room 1.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_EVT_CRYPT_02(C_ITEM)
{
	name = "Old brass key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key from the skeleton in room 2.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_EVT_CRYPT_03(C_ITEM)
{
	name = "Old brass key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "The key from the skeleton in room 3.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_ITEM)
{
	name = "Old knight's armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_KDF_SKEL(C_ITEM)
{
	name = "Old fire mage's robe";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 50;
	protection[PROT_BLUNT] = 50;
	protection[PROT_POINT] = 50;
	protection[PROT_FIRE] = 50;
	protection[PROT_MAGIC] = 50;
	value = VALUE_ITAR_PAL_SKEL;
	wear = WEAR_TORSO;
	visual = "ItAr_KdF_L.3ds";
	visual_change = "Armor_KDF_L_SKE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAR_BM_SKEL(C_ITEM)
{
	name = "Old battle-mage armor";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 60;
	protection[PROT_BLUNT] = 60;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 20;
	protection[PROT_MAGIC] = 70;
	value = VALUE_ITAR_PAL_SKEL;
	wear = WEAR_TORSO;
	visual = "ItAr_BM_L.3ds";
	visual_change = "Armor_BM_SKE.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_VALENTINO(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Belonging to Valentino.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_BUERGER(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "It was lying around on a windowsill.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_RICHTER(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Belonging to the Judge.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_SALANDRIL(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "belonging to the Alchemist Salandril.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_PALADINTRUHE(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "A small brass key from";
	text[3] = "the house of the paladins.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_THIEFTREASURE(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "A small key.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITKE_FINGERS(C_ITEM)
{
	name = NAME_KEY;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Rusty door key";
	text[3] = "for the sewers.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITWR_SCHULDENBUCH(C_ITEM)
{
	name = "Book of debts";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Lehmar's book of debts";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useschuldbuch;
};


func void useschuldbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Deals and debts");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I, Master Thorben, carpenter of Khorinis, owe to the honorable Lehmar a debt of 200 gold coins.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             Thorben");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I, Coragon, innkeeper of Khorinis, owe the honorable Lehmar a debt of 150 in gold.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             Coragon");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"I, Hanna, hotelier of Khorinis, owe the honorable Lehmar a debt of 250 gold coins.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"               Hanna");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITPL_SAGITTA_HERB_MIS(C_ITEM)
{
	name = "Sun aloe";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_WOOD;
	scemename = "FOOD";
	description = name;
	text[1] = "It only grows on the excrements of a black troll";
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRENGTH_HERB_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_ITEM)
{
	name = "Room key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "From the tavern 'The Dead Harpy'.";
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITRW_DRAGOMIRSARMBRUST_MIS(C_ITEM)
{
	name = "Dragomir's crossbow";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

