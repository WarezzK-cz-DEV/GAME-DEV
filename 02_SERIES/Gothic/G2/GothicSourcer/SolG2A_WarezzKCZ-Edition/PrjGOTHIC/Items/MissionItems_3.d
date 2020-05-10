
const int AM_EYEPROTEDGE = 10;
const int AM_EYEPROTPOINT = 10;
const int AM_EYEPROTMAGE = 20;
const int AM_EYEPROTFIRE = 30;

instance ITMI_INNOSEYE_MIS(C_ITEM)
{
	name = "Eye of Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_innoseye;
	on_unequip = unequip_innoseye;
	text[0] = "Energy pulses through the Eye.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_innoseye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_EDGE] += AM_EYEPROTEDGE;
	self.protection[PROT_BLUNT] += AM_EYEPROTEDGE;
	self.protection[PROT_POINT] += AM_EYEPROTPOINT;
	self.protection[PROT_FIRE] += AM_EYEPROTFIRE;
	self.protection[PROT_MAGIC] += AM_EYEPROTMAGE;
	STAT_SWORDDEF = STAT_SWORDDEF + (AM_EYEPROTEDGE * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	PrintScreen("Innos is watching over you",-1,-1,FONT_SCREEN,0);
};

func void unequip_innoseye()
{
	self.protection[PROT_EDGE] -= AM_EYEPROTEDGE;
	self.protection[PROT_BLUNT] -= AM_EYEPROTEDGE;
	self.protection[PROT_POINT] -= AM_EYEPROTPOINT;
	self.protection[PROT_FIRE] -= AM_EYEPROTFIRE;
	self.protection[PROT_MAGIC] -= AM_EYEPROTMAGE;
	STAT_SWORDDEF = STAT_SWORDDEF - (AM_EYEPROTEDGE * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITMI_INNOSEYE_DISCHARGED_MIS(C_ITEM)
{
	name = "Eye of Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_discharged_mis;
	text[0] = "The Eye is faded and does not shine.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_discharged_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITMI_INNOSEYE_BROKEN_MIS(C_ITEM)
{
	name = "Eye of Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_broken_mis;
	text[0] = TEXT_INNOSEYE_SETTING;
	text[1] = TEXT_INNOSEYE_GEM;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_broken_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITWR_PERMISSIONTOWEARINNOSEYE_MIS(C_ITEM)
{
	name = "Letter of authorization";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02_V3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = "Letter of authorization for Pyrokar";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void use_permissiontowearinnoseye()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,75,100,100,1);
	Doc_PrintLines(ndocid,0,"The bearer of this note is to be granted entry into the sacred halls of the monastery.");
	Doc_PrintLines(ndocid,0,"His wishes regarding the possession of the Eye of Innos are to be fulfilled immediately.");
	Doc_PrintLines(ndocid,0,"These orders are to be regarded as valid through the strength of my position as lord of the island and representative of the King, as well as through the treaty of the division of the Church of Innos in year 2 of the Fire.");
	Doc_PrintLines(ndocid,0,"I will make no further statements to this end and expect my instructions to be abided by.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Innos bless the King.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        Lord Hagen");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
{
	name = "The Halls of Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_xardasbookforpyrokar;
};


func void use_xardasbookforpyrokar()
{
	Print(PRINT_IRDORATHBOOKDOESNTOPEN);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITKE_CHEST_SEKOB_XARDASBOOK_MIS(C_ITEM)
{
	name = "Xardas' key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "For the chest on Sekob's farm.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_CORNELIUSTAGEBUCH_MIS(C_ITEM)
{
	name = "Diary";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "The diary of Cornelius.";
	on_state[0] = usecorneliustagebuch;
};


func void usecorneliustagebuch()
{
	var int ndocid;
	if(CORNELIUS_ISLIAR == FALSE)
	{
		b_logentry(TOPIC_RESCUEBENNET,"The diary is the evidence I need to prove Bennet's innocence.");
		CORNELIUS_ISLIAR = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"If Larius keeps on like that, I'm going to look out for another position.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Something strange happened to me last night. I was visited in my home by one of those guys in black hoods we hear so much about lately. I wasn't really nervous, even though they're supposed to be so evil. You could almost feel the power those men have. But the voice was calm and kind of made you want to trust the guy.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"He offered me 20,000 pieces of gold to make sure one of the mercenary's gets convicted. He said I'd know what he meant when it happened.");
	Doc_PrintLines(ndocid,1,"Of course I agreed right away, those mercenaries don't deserve any better anyway. If it weren't for them everything would be just fine for me here. And the gold will let me settle down to a comfortable retirement.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"It's happened, they've arrested one of those mercenaries. It should be easy to keep my word.");
	Doc_Show(ndocid);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "Almanac of the possessed";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_dementorobsessionbook;
};


func void use_dementorobsessionbook()
{
	var int ndocid;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_OBSESSIONCOUNTER = 100;
	b_scisobsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
		Doc_PrintLine(ndocid,0,"");
		Doc_SetFont(ndocid,0,FONT_BOOK);
		Doc_PrintLines(ndocid,0,"edef Kon dirandorix");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"in Sparady bell");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"el utoy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kho ray xaondron");
		Doc_PrintLines(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"em piratoram endro");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		if(KAPITEL >= 3)
		{
			Doc_PrintLine(ndocid,1,"           VINO");
			Doc_PrintLine(ndocid,1,"FERNANDO");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"        MALAK");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"BROMOR");
		};
		if(KAPITEL >= 4)
		{
			Doc_PrintLine(ndocid,1,"    ENGROM");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"        RANDOLPH");
			Doc_PrintLine(ndocid,1,"");
		};
		if(KAPITEL >= 5)
		{
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"          SEKOB");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"            BRUTUS");
			Doc_PrintLine(ndocid,1,"");
		};
		if((KAPITEL == 6) && (MARIO_ISONBOARD == LOG_SUCCESS) && (ORKSTURMDI == TRUE))
		{
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"MARIO");
		};
		Doc_Show(ndocid);
	};
};


instance ITWR_PYROKARSOBSESSIONLIST(C_ITEM)
{
	name = "Pyrokar's magic letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pyrokarsobsessionlist;
	scemename = "MAP";
	description = name;
	text[1] = "A magic letter";
	text[2] = "that shows the possessed";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void use_pyrokarsobsessionlist()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"The possessed");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,30,1);
	if(KAPITEL >= 3)
	{
		Doc_PrintLine(ndocid,0,"FERNANDO");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"VINO");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"MALAK");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"BROMOR");
	};
	if(KAPITEL >= 4)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ENGROM");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"RANDOLPH");
	};
	if(KAPITEL >= 5)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"SEKOB");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"BRUTUS");
	};
	if((KAPITEL == 6) && (MARIO_ISONBOARD == LOG_SUCCESS) && (ORKSTURMDI == TRUE))
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"MARIO");
	};
	Doc_Show(ndocid);
};


instance ITPO_HEALHILDA_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healhilda;
	scemename = "POTIONFAST";
	description = "Healing for the black fever";
	text[1] = NAME_BONUS_HPNP;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healhilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITMW_MALETHSGEHSTOCK_MIS(C_ITEM)
{
	name = "Walking stick";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = VALUE_VLKMACE;
	damagetotal = DAMAGE_VLKMACE;
	damagetype = DAM_BLUNT;
	range = RANGE_VLKMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKMACE;
	visual = "Itmw_008_1h_pole_01.3ds";
	description = name;
	text[0] = "The letter 'M' has been engraved at the top.";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_MALETHSBANDITGOLD(C_ITEM)
{
	name = "A bag full of gold";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_malethsbanditgold;
	description = name;
	text[2] = "Purse stuffed to the brim with gold!";
};


func void use_malethsbanditgold()
{
	b_playerfinditem(itmi_gold,300);
};


instance ITMI_MOLERATLUBRIC_MIS(C_ITEM)
{
	name = "Molerat fat";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PITCH;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_BABOSLETTER_MIS(C_ITEM)
{
	name = "Letter to Babo";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosletter;
	scemename = "MAP";
	description = name;
};


func void use_babosletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Dear Babo,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"no doubt you're wondering how we came to write you this letter. We took all our savings to Master Marlas and asked him to write these lines for you. We wish you all the best for the future and are sending you a picture as a farewell gift, so that you'll always remember us during those long nights at the monastery.");
	Doc_PrintLines(ndocid,0,"Good luck. Hope you like the picture.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fehta and Bonka");
	Doc_Show(ndocid);
};


instance ITWR_BABOSPINUP_MIS(C_ITEM)
{
	name = "Picture of woman";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_PinUp_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babospinup;
	scemename = "MAP";
	description = "A picture of a nude woman";
};


func void use_babospinup()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_Pinup.TGA",0);
	Doc_Show(ndocid);
};


instance ITWR_BABOSDOCS_MIS(C_ITEM)
{
	name = "Bundle of papers";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02_V2b.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosdocs;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Several documents,";
	text[3] = "rolled together.";
};


func void use_babosdocs()
{
	BABOSDOCSOPEN = TRUE;
	CreateInvItems(self,itwr_babosletter_mis,1);
	CreateInvItems(self,itwr_babospinup_mis,1);
};


instance ITKE_IGARAZCHEST_MIS(C_ITEM)
{
	name = "Chest key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "belonging to Igaraz.";
};

instance ITWR_ASTRONOMY_MIS(C_ITEM)
{
	name = "The divine power of the stars";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_astronomy;
};


var int astronomy_once;

func void use_astronomy()
{
	var int ndocid;
	if(ASTRONOMY_ONCE == FALSE)
	{
		b_raiseattribute(self,ATR_MANA_MAX,2);
		Npc_ChangeAttribute(self,ATR_MANA,2);
		Print(PRINT_READASTRONOMY);
		ASTRONOMY_ONCE = TRUE;
		b_say(hero,hero,"$BEZI_INTERES");
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... but when the strength of an ox is combined with the principles of a warrior, then beware of the events that may come to pass.");
	Doc_PrintLines(ndocid,0,"The unbound strength of the ox and the perseverance of the warrior can topple the ancient balance of the powers. The cosmic boundary between the dimensions grows weak - so weak that it becomes easy for the shadow creatures of Beliar to enter our world.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"What would ensue from this is shown to us by the wars of ancient times, when the link between the worlds was still strong. The henchmen of Evil brought death and destruction to the world, and only the help of Innos and the Chosen One could ward off Evil from mankind.");
	Doc_PrintLines(ndocid,1,"If such a threat should ever exist again, then may Innos protect us, for there has not been another Chosen of Innos for over a hundred years.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


var int sc_obsessiontimes;

instance ITPO_HEALOBSESSION_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healobsession;
	scemename = "POTIONFAST";
	description = "Healing of possession";
	text[1] = NAME_BONUS_HPNP;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healobsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	SC_OBSESSIONTIMES = SC_OBSESSIONTIMES + 1;
	b_clearscobsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ITSE_GOLEMCHEST_MIS(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_golemchest;
	description = name;
	text[2] = "The bag is full of coins.";
	text[5] = NAME_VALUE;
};


func void use_golemchest()
{
	CreateInvItems(hero,itmi_gold,50);
	Print(PRINT_FOUNDGOLD50);
	Print(PRINT_FOUNDRING);
	CreateInvItems(hero,itri_prot_total_02,1);
	Snd_Play("Geldbeutel");
};


instance ITWR_SHATTEREDGOLEM_MIS(C_ITEM)
{
	name = "A very old map";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_shatteredgolem_mis;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_shatteredgolem_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_shatteredgolem_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_DIEGOSLETTER_MIS(C_ITEM)
{
	name = "Letter from Diego";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_diegosletter_mis;
	scemename = "MAP";
	description = "Diego's letter to Gerbrandt";
};


func void use_diegosletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Gerbrandt,");
	Doc_PrintLine(ndocid,0,"you know, you should have killed me.");
	Doc_PrintLines(ndocid,0,"I'm back in town and looking for you. And when I find you, I'm gonna slice you like a pudding. You've known me long enough to be sure I won't be fooled lightly.");
	Doc_PrintLines(ndocid,0,"I guess when you had me thrown in the Barrier, you never dreamed I might come back. Well, you were wrong.");
	Doc_PrintLine(ndocid,0,"I've come for what's owed to me.");
	Doc_PrintLines(ndocid,0,"Your only chance to stay alive is to beat it fast and leave your business to me. That'd make us quits.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Diego");
	Doc_Show(ndocid);
};


instance ITSE_DIEGOSTREASURE_MIS(C_ITEM)
{
	name = "Full leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_METAL;
	on_state[0] = use_diegostreasure;
	description = "Diego's old leather bag";
};


func void use_diegostreasure()
{
	OPENEDDIEGOSBAG = TRUE;
	b_playerfinditem(itmi_gold,DIEGOSTREASURE);
};


instance ITMI_ULTHARSHOLYWATER_MIS(C_ITEM)
{
	name = "Ulthar's holy water";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HOLYWATER;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_WOOD;
	description = name;
	text[3] = "Ulthar's water for the Purification of the Altars";
	text[5] = NAME_VALUE;
	count[5] = value;
};


var int itwr_minenanteil_mis_onetime;

instance ITWR_MINENANTEIL_MIS(C_ITEM)
{
	name = "Khorinis ore mine share";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_minenanteil_mis;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_minenanteil_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," Ore Mine Share");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"By the King's Bill of Property gained from Royal Lands, the bearer of this document is granted prospecting rights on the King's land.");
	Doc_PrintLines(ndocid,0,"He must limit his scraping to the area of one small royal realmlot.");
	Doc_PrintLines(ndocid,0,"According to the Bill of Scrapeland Size, small royal realmlots measure 16 paces in horizontal and 3 paces in vertical extension.");
	Doc_PrintLines(ndocid,0,"The Prospector of the Realm is unbound by any duties of free access and protection of scraping cells.");
	Doc_PrintLines(ndocid,0,"If the tenant is unable to pay the rent due, all rights to the land are returned to the Realm.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            Signed");
	Doc_PrintLine(ndocid,0,"          The royal prospector");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                    Salandril");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"The guy who sold the mine shares to the merchants is called Salandril. I'll probably find him in the upper quarter of Khorinis, unless he's already running away from justice.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"Salandril is dead. I'm going to have to tell Serpentes.");
		};
		ITWR_MINENANTEIL_MIS_ONETIME = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
};


instance ITAM_PROT_BLACKEYE_MIS(C_ITEM)
{
	name = "Soul summoning amulet";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = VALUE_AM_HPMANA;
	visual = "ItAm_Hp_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = name;
	text[3] = "Protects from Seekers' black look";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_KARRASBLESSEDSTONE_MIS(C_ITEM)
{
	name = "Stone from blessed soil";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Rockcrystal.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
};

instance ITWR_RICHTERKOMPROBRIEF_MIS(C_ITEM)
{
	name = "Judge's assignment";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02_Old.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_richterkomprobrief;
	scemename = "MAP";
	description = name;
	text[1] = "Judge's letter to Morgahard";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void use_richterkomprobrief()
{
	var int ndocid;
	if(!SCKNOWSRICHTERKOMPROBRIEF)
	{
		SCKNOWSRICHTERKOMPROBRIEF = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"Morgahard");
	Doc_PrintLines(ndocid,0,"you good-for-nothing wretch. Carry out my orders, or I'll have to change my tune and arrest the lot of you.");
	Doc_PrintLines(ndocid,0,"It's gotta happen tomorrow night. Larius is getting suspicious.");
	Doc_PrintLines(ndocid,0,"If we don't drag the money out of his pockets now, it may be too late. I'll make sure you meet him on the marketplace this evening.");
	Doc_PrintLines(ndocid,0,"But don't make a show of it, or you'll have the militia down on you before you know what's happening.");
	Doc_PrintLines(ndocid,0,"By the way: if he happens to peg out in the process, that's fine by me.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Chief Judge and");
	Doc_PrintLine(ndocid,0,"          King's Secretary");
	Doc_Show(ndocid);
};


instance ITWR_MORGAHARDTIP(C_ITEM)
{
	name = "Letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_morgahardtip;
	scemename = "MAP";
	description = name;
	text[1] = "Morgahard letter";
};


func void use_morgahardtip()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I've gone on ahead. I hope we'll all meet again when things have calmed down a mite.");
	Doc_PrintLines(ndocid,0,"Don't worry, boys. If all else fails, I'll ask Onar to see to it for us.");
	Doc_PrintLine(ndocid,0,"It'll be all right.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                           M.");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "Map of the holy shrines";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_shrine_mis;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_newworld_shrine_mis()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_shrine_mis);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_VINOSKELLERGEISTER_MIS(C_ITEM)
{
	name = "The spirit of the wine";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_vinoskellergeister_mis;
};


func void use_vinoskellergeister_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Power of the grape");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... I've tried a lot in my time, but this fruit that was brought to me from abroad last week has exceeded all expectations...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... the juice of this grape is fruitier than any you'll find in this part of the country...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... so far so good. But it still makes me nervous to think what might happen if I'm caught in my secret still. I've no idea what the militia will do to me if they find me here. They might even throw me through the Barrier...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... They've gotten suspicious. I'm going to go and leave all this until things have calmed down a bit and get back to work when I can be sure they're not onto me any more...");
	Doc_Show(ndocid);
};

