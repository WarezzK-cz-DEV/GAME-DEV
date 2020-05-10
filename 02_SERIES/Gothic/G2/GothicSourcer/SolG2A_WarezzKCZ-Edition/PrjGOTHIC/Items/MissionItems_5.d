
instance ITWR_XARDASLETTERTOOPENBOOK_MIS(C_ITEM)
{
	name = "Xardas' letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v3.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardaslettertoopenbook;
	scemename = "MAP";
	description = name;
};


func void use_xardaslettertoopenbook()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I suspected one of the dragons in the Valley of Mines was the source of Evil.");
	Doc_PrintLines(ndocid,0,"I was wrong.");
	Doc_PrintLines(ndocid,0,"If everything has come to pass as I expect, you should now be seeking the Halls of Irdorath.");
	Doc_PrintLines(ndocid,0,"The book you gave to Pyrokar contains all the clues you need.");
	Doc_PrintLines(ndocid,0,"I should have known why the Seekers wanted it so badly.");
	Doc_PrintLines(ndocid,0,"You must get it back!");
	Doc_PrintLines(ndocid,0,"The words 'XARAK BENDARDO' open it. Don't tell anyone about this!");
	Doc_PrintLines(ndocid,0,"I will attend to more important things now.");
	Doc_PrintLines(ndocid,0,"I can't help you with your last task. Only you can defeat the source of Evil.");
	Doc_PrintLines(ndocid,0,"We shall meet again!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                             Xardas");
	Doc_Show(ndocid);
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == FALSE)
	{
		MIS_XARDAS_SCCANOPENIRDORATHBOOK = TRUE;
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"In his letter, Xardas informed me what words to speak to open the book THE HALLS OF IRDORATH.");
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
};


instance ITKE_MONASTARYSECRETLIBRARY_MIS(C_ITEM)
{
	name = "Key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "From the book 'The Halls of Irdorath'";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_HALLSOFIRDORATH_MIS(C_ITEM)
{
	name = "The Halls of Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	on_state[0] = use_hallsofirdorath;
};


func void use_hallsofirdorath()
{
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == TRUE)
	{
		b_say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,itwr_hallsofirdorath_open_mis,1);
		CreateInvItems(hero,itke_monastarysecretlibrary_mis,1);
		CreateInvItems(hero,itwr_uselampidiot_mis,1);
		Print(PRINT_IRDORATHBOOKHIDDENKEY);
		b_giveplayerxp(XP_HALLSOFIRDORATHISOPEN);
		ITWR_HALLSOFIRDORATHISOPEN = TRUE;
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"I was able to open Xardas' book. It contained a secret message and a strange key. Who knows what else I might find in the monastery's cellar.");
	}
	else
	{
		CreateInvItems(hero,itwr_hallsofirdorath_mis,1);
		Print(PRINT_IRDORATHBOOKDOESNTOPEN);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ITWR_HALLSOFIRDORATH_OPEN_MIS(C_ITEM)
{
	name = "The Halls of Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_hallsofirdorath_open;
};


func void use_hallsofirdorath_open()
{
	var int ndocid;
	if(ITWR_SCREADSHALLSOFIRDORATH == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"I have read Xardas' book. It mentions a secret library. It must be somewhere here in the cellar of the monastery.");
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ITWR_SCREADSHALLSOFIRDORATH = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...and so I concealed the entrance to the library behind a secret door, to protect my records of Beliar's temples.");
	Doc_PrintLines(ndocid,0,"If my brothers had known of these records, those fools would probably have destroyed them all.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Now, all they know is that these temples used to exist.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Just to be sure, I have sworn some servants to protect the library.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"The key opens the last door.");
	Doc_Show(ndocid);
};


instance ITWR_XARDASSEAMAPBOOK_MIS(C_ITEM)
{
	name = "Dusty book";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_xardasseamapbook_mis;
};


func void use_xardasseamapbook_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"...I am now certain that the building is the Halls of Irdorath. They are located on an island quite near the harbor of Khorinis. Beliar's interest in the ore mines is obvious...");
	Doc_PrintLines(ndocid,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(ndocid,0,"...The stronger they are, the more valuable they seem to be to him as undead servants. These converted paladins are very hard for any warrior to defeat. One of them has fallen into my hands. I only hope the others won't notice his presence down here...");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...the converted paladin no longer seems to react to any stimuli. I have stored his armor and the rest of his belongings in the back room. The door can only be opened from inside. I have built a teleport rune to get into the room. I have placed the instructions for it in the almanac so that the One can find them...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(ndocid,0,"...The signs are unmistakable! When the One comes, he will need all the help we can give him. Beliar is already too strong. If have succeeded in obtaining some valuable artifacts which I will keep down here just in case. I suspect the Chosen One will come from among our ranks,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"so I have written instructions in the almanac for him.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...I am now certain. We cannot stay the hand of fate. As soon as Beliar feels strong enough, he will arise and seek to rule the world. I must find the One, else we are all doomed.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(ndocid,0,"...There will be war, a war for the fate of the world. I seem to be the only one capable of interpreting the signs. All around me seem to ignore them. The One will come, and his coming will herald the beginning of the war. It is a war as old as time itself, but the end appears to be coming into view.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"I will not stand idly by and watch as others take the fate of the world into their hands.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"...I have studied the ancient writings and I have found out how to create the legendary weapons of the ancient Dragon Lords. However, I have no idea how to obtain the ingredients. I have entered the recipe in the almanac just in case. Who knows what terrors the future may bring - maybe even dragons.");
	};
	Doc_Show(ndocid);
};


instance ITWR_USELAMPIDIOT_MIS(C_ITEM)
{
	name = "Crumpled letter";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_uselampidiot_mis;
	scemename = "MAP";
	description = name;
	text[1] = "From the book 'The Halls of Irdorath'";
};


func void useitwr_uselampidiot_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"               The lamp carries light");
	Doc_PrintLine(ndocid,0,"               into the lower regions");
	Doc_Show(ndocid);
};


instance ITWR_SEAMAP_IRDORATH(C_ITEM)
{
	name = "Sea chart to Isle of Irdorath";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_seamap_irdorath;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_seamap_irdorath()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(ndocid);
	if((MIS_SHIPISFREE == FALSE) && (KAPITEL < 6))
	{
		b_say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKNOWSWAYTOIRDORATH == FALSE)
	{
		MIS_SCKNOWSWAYTOIRDORATH = TRUE;
		Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
		b_logentry(TOPIC_SHIP,"It appears I must reach the enemy's strange island. But for that I need a ship, a crew and a captain.");
		b_giveplayerxp(XP_SCKNOWSWAYTOIRDORATH);
	};
};


instance ITWR_FORGEDSHIPLETTER_MIS(C_ITEM)
{
	name = "Ship bill";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02_V2p.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_forgedshipletter_mis;
	scemename = "MAP";
	description = name;
	text[3] = "Letter of Confirmation of Authority";
	text[4] = "for the disposal of the ship of paladins.";
	inv_rotx = INVCAM_X_KEY_STANDARD;
};


func void useitwr_forgedshipletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Scroll_01.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"Letter");
	Doc_PrintLine(ndocid,0,"   of authorization");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,100,100,100,100,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"This document entitles the");
	Doc_PrintLines(ndocid,0," bearer to move freely on Lord Hagen's");
	Doc_PrintLines(ndocid,0,"  royal war galley and to guide the ship");
	Doc_PrintLines(ndocid,0,"   for an unlimited time period.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Royal Seal");
	Doc_Show(ndocid);
};


instance ITKE_OC_MAINGATE_MIS(C_ITEM)
{
	name = "Main gate guard's tower key";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_SHIP_LEVELCHANGE_MIS(C_ITEM)
{
	name = "Key to captain's quarters";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITPO_POTIONOFDEATH_01_MIS(C_ITEM)
{
	name = "The Tears of Innos";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	description = name;
	text[1] = "Unknows effects";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_potionofdeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		PrintScreen(PRINT_LEARNSTR5,-1,45,FONT_SCREEN,2);
		PrintScreen(PRINT_LEARNDEX5,-1,55,FONT_SCREEN,2);
		PrintScreen(PRINT_FULLYHEALED,-1,65,FONT_SCREEN,2);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_SPEED);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		b_say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ITPO_POTIONOFDEATH_02_MIS(C_ITEM)
{
	name = "The Tears of Innos";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	description = name;
	text[1] = "The potion lends Fire Mages special powers";
	text[2] = "Any other user will find his death in it";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAM_AMULETTOFDEATH_MIS(C_ITEM)
{
	name = "Divine aura of Innos";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_amulettofdeath_mis;
	on_unequip = unequip_itam_amulettofdeath_mis;
	description = name;
	text[2] = "The divine aura of Innos";
	text[3] = "This amulet protects the bearer from all forms of damage";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] += 30;
	self.protection[PROT_BLUNT] += 30;
	self.protection[PROT_POINT] += 30;
	self.protection[PROT_FIRE] += 30;
	self.protection[PROT_MAGIC] += 30;
	STAT_SWORDDEF = STAT_SWORDDEF + (30 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void unequip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] -= 30;
	self.protection[PROT_BLUNT] -= 30;
	self.protection[PROT_POINT] -= 30;
	self.protection[PROT_FIRE] -= 30;
	self.protection[PROT_MAGIC] -= 30;
	STAT_SWORDDEF = STAT_SWORDDEF - (30 * 1);
	Npc_SetTalentSkill(hero,NPC_TALENT_SWORDDEF,STAT_SWORDDEF);
};


instance ITPO_HEALRANDOLPH_MIS(C_ITEM)
{
	name = "Healing of addiction";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healrandolph;
	scemename = "POTIONFAST";
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = 50;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healrandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,50);
};

