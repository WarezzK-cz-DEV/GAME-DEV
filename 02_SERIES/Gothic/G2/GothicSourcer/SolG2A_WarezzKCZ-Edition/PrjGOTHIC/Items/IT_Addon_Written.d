
instance ITWR_ADDON_HINWEIS_02(C_ITEM)
{
	name = "Important Message";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_hinweis_02;
	scemename = "MAP";
	description = name;
	text[0] = "From the tavern in the ";
};


func void use_hinweis_02()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Hey people,");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Lou has disappeared in the swamp. He's probably been eaten by swampsharks.");
	Doc_PrintLines(ndocid,0,"Even worse - the key to the door disappeared with him.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Find it and you can keep Lou's stuff.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Snaf");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_HEALTH_04(C_ITEM)
{
	name = "Pure life potion recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_heilrezept_04;
	scemename = "MAP";
	description = name;
	text[2] = "Ability to create healing elixirs";
	text[3] = "is required to make this powerful potion";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_heilrezept_04()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_04] == FALSE))
		{
			PLAYER_TALENT_ALCHEMY[POTION_HEALTH_04] = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"To make a pure life potion, I need 1 king's sorrel and 3 essences of healing.");
		}
		else if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_04] == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Pure life potion");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"One meadow knotweed and three essences of healing are required.");
	Doc_PrintLines(ndocid,0,"Pour together and brew according to the recipe for healing elixirs.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"This potion can only be created by alchemists who know the recipe for healing elixirs.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_MANA_04(C_ITEM)
{
	name = "Pure mana potion recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1500;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept_04;
	scemename = "MAP";
	description = name;
	text[2] = "Ability to create mana elixirs";
	text[3] = "is required to make this powerful potion";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_manarezept_04()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_04] == FALSE))
		{
			PLAYER_TALENT_ALCHEMY[POTION_MANA_04] = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"To create a mana potion, I need 1 king's sorrel and 3 mana essences.");
		}
		else if(PLAYER_TALENT_ALCHEMY[POTION_MANA_04] == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLines(ndocid,0,"Pure mana potion");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"One meadow knotweed and three essences of magical power are required.");
	Doc_PrintLines(ndocid,0,"Pour together and brew according to the recipe for mana elixirs.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"This potion can only be created by alchemists who know the recipe for mana elixirs.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_BAPEHBE(C_ITEM)
{
	name = "Recipe of woodland berries broth";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 975;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_rezept_bapehb9i;
	scemename = "MAP";
	description = "Recipe of woodland berries broth";
	text[2] = "To prepare the broth you need";
	text[3] = "a handful of woodland berries and water";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_rezept_bapehb9i()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(KNOWS_BAPEHBE == FALSE)
		{
			KNOWS_BAPEHBE = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"For berry broth I need 10 woodland berries and a bottle of water.");
		}
		else
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Healing broth");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"A broth made of woodland berries:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"You need 10 woodland berries and a bottle of water.");
	Doc_PrintLines(ndocid,0,"Stir and cook until done.");
	Doc_Show(ndocid);
};


instance ITWR_PERM_MUSHROOMMP(C_ITEM)
{
	name = "Mana recipe from dark mushrooms";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1800;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_perm_mushroommp;
	scemename = "MAP";
	description = "Elixir of dark mushrooms";
	text[2] = "To make this powerful potion you need";
	text[3] = "a large amount of dark mushrooms";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_perm_mushroommp()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE) && (KNOWS_MUSHROOMMP == FALSE))
		{
			KNOWS_MUSHROOMMP = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"For the preparation of a special elixir of mana, you must have at least 50 dark mushrooms.");
		}
		else if(KNOWS_MUSHROOMMP)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Elixir of dark mushroom");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"It takes about fifty dark mushrooms.");
	Doc_PrintLines(ndocid,0,"Stir and cook until done.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"This potion can only be created by an alchemist who knows the recipe for the elixir of mana.");
	Doc_Show(ndocid);
};


instance ITWR_PERM_PDEFMOSS(C_ITEM)
{
	name = "The Power of the Dead";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1100;
	visual = "ItWr_Book_02_01_2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_perm_pdefmoss;
	scemename = "MAP";
	description = name;
	text[2] = "Contains informations";
	text[3] = "of an unknown potion.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_perm_pdefmoss()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(((PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE)) && (KNOWS_PDEFMOSS == FALSE))
		{
			KNOWS_PDEFMOSS = TRUE;
			Snd_Play("LevelUP");
			b_logentry(TOPIC_TALENTALCHEMY,"To prepare a special potion of protection, I need a grave moss and several skeleton bones.");
		}
		else if(KNOWS_PDEFMOSS == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		}
		else
		{
			Print("Missing Skill: Brewing permanent potions");
			b_say(hero,hero,"$BEZI_GOTOWY");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"The Power of the Dead");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Skeletons are enchanted with some magical power that strengthens them... examining their remains, I've discovered that after death they don't lose their power. It is contained in their bones for a long time, slowly fading away.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Experiments revealed that this energy can be used to strengthen our skeleton. If the bones are grind and mixed with the grave moss powder and cooked according to the permanent potions recipe, a substance is created containing a part of this energy.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"Kolgrimm the hermit");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_HINWEIS_01(C_ITEM)
{
	name = "Important hint";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_hinweis_01;
	scemename = "MAP";
	description = name;
	text[0] = "Hanging on a hut in the swamp";
};


func void use_hinweis_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Hey people,");
	Doc_PrintLines(ndocid,0,"the stuff in the chests is for emergencies.");
	Doc_PrintLines(ndocid,0,"And it's for EVERYONE. So only take something if you need it.");
	Doc_PrintLines(ndocid,0,"And only take as much as you need.");
	Doc_PrintLines(ndocid,0,"If everybody sticks to this, it will work.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Fletcher");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_WILLIAM_01(C_ITEM)
{
	name = "Note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_william_01;
	scemename = "MAP";
	description = name;
	text[0] = "The fisherman William had this on him";
};


func void use_william_01()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"William,");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"when the moon is full, the watch will be distracted.");
	Doc_PrintLines(ndocid,0,"Sneak out - but be careful!");
	Doc_PrintLines(ndocid,0,"If you follow the log road, you can leave the swamp.");
	Doc_PrintLines(ndocid,0,"The pirate camp is on the other side of the valley far to the west.");
	Doc_PrintLines(ndocid,0,"From there it should be easy to get away with the boat.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"A well-wisher");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_MCELIXIER_01(C_ITEM)
{
	name = "Recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mcelixier_01;
	scemename = "MAP";
	description = name;
	text[0] = "Recipe for the elixir of mental alteration";
	text[1] = "This potion helps restore lost memories";
};


func void use_mcelixier_01()
{
	var int ndocid;
	if(!KNOWS_MCELIXIER)
	{
		KNOWS_MCELIXIER = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Elixir of mental alteration");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"The secretion from two bloodfly stingers is required to create this potion.");
	Doc_PrintLines(ndocid,0,"Add to that one mana extract and one essence of healing.");
	Doc_PrintLines(ndocid,0,"Finally, stir a bag of red tear-pepper into the boiling decoction.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Only an expert alchemist who knows how to extract the secretion from the stingers should try this potion.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_PIRATES_01(C_ITEM)
{
	name = "Greasy note";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pirates_01;
	scemename = "MAP";
	description = name;
	text[0] = "Angus had this note in his pocket";
};


func void use_pirates_01()
{
	var int ndocid;
	if(!READ_JUANSTEXT)
	{
		READ_JUANSTEXT = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Pirates,");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"get the last delivery meant for us.");
	Doc_PrintLines(ndocid,0,"Then bring it to your cave. We'll meet there.");
	Doc_PrintLines(ndocid,0,"I will pay double the value in gold.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"That's the way to do it.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Tom");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_JOINT_01(C_ITEM)
{
	name = "The green novice";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_joint_rezept_01;
	scemename = "MAP";
	description = name;
	text[0] = "From Fortuno's chest";
};


func void use_joint_rezept_01()
{
	var int ndocid;
	if(!GREEN_EXTREM)
	{
		GREEN_EXTREM = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"The green novice");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"(...) The reefers roll really well, but what we had in the Swamp Camp was of a whole different caliber.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"If I use the essence of two swampweed plants and add a meadow knotweed, then I have a reefer with the effect of the green novice.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"The green novice helps against all sorts of pain and clears the head.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_LOU_REZEPT(C_ITEM)
{
	name = "Lou's Hammer";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 70;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = uselourezept;
	scemename = "MAP";
	description = name;
	text[0] = "Recipe for making Lou's Hammer";
};


func void uselourezept()
{
	var int ndocid;
	if(!KNOWS_LOUSHAMMER)
	{
		KNOWS_LOUSHAMMER = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Lou's Hammer");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ingredients for brewing a Hammer:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Take a water bottle, two turnips and a decent portion of swampweed.");
	Doc_PrintLines(ndocid,0,"Add the ground teeth of a swampshark.");
	Doc_PrintLines(ndocid,0,"Put it all in the bottle and boil with a shot of rum.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Cheers!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"According to the old blind man, it is healthier not to breathe the steam!");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_LOU_REZEPT2(C_ITEM)
{
	name = "Lou's Double Hammer";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 140;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = uselourezept2;
	scemename = "MAP";
	description = name;
	text[0] = "Recipe for making Lou's Double Hammer";
};


func void uselourezept2()
{
	var int ndocid;
	if(!KNOWS_SCHLAFHAMMER)
	{
		KNOWS_SCHLAFHAMMER = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Take a good old Lou's Hammer and distill it again.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"This mixture should only be made by experienced boozemakers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"If a layman tries it, he won't only be blind,");
	Doc_PrintLine(ndocid,0,"but also dead.");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_PIRATENTOD(C_ITEM)
{
	name = "Hasty herring";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 250;
	visual = "ItWr_Scroll_01_v4.3DS";
	material = MAT_LEATHER;
	on_state[0] = userezeptpiratentod;
	scemename = "MAP";
	description = name;
	text[0] = "Recipe for making a hasty herring";
};


func void userezeptpiratentod()
{
	var int ndocid;
	if(!KNOWS_SCHNELLERHERING)
	{
		KNOWS_SCHNELLERHERING = TRUE;
	}
	else
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Hasty herring (by me)");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Small pick-me-up for real men");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"As usual, you need a water bottle. Fill this with a measure of rum and add a fresh fish.");
	Doc_PrintLines(ndocid,0,"As soon as the liquid begins to turn yellow, take out the fish and add a bundle of freshly picked snapperweed for flavor.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Careful. The stuff has a powerful kick.");
	Doc_Show(ndocid);
};


instance FAKESCROLL_ADDON(C_ITEM)
{
	name = "A piece of paper";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	hp = 5;
	hp_max = 5;
	weight = 1;
	value = 0;
	visual = "Fakescroll.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
};

instance ITWR_ADDON_SUMMONANCIENTGHOST(C_ITEM)
{
	name = "Call of Quarhodron";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = usesummonancientghost;
	scemename = "MAP";
	description = name;
	text[0] = "With the help of this scroll you can call Quarhodron";
};


func void usesummonancientghost()
{
	if(SC_SUMMONEDANCIENTGHOST == FALSE)
	{
		b_say(self,self,"$ADDON_SUMMONANCIENTGHOST");
		if(Npc_GetDistToWP(self,"ADW_QUARHODRONGHOST") < 1000)
		{
			Wld_InsertNpc(none_addon_111_quarhodron,"ADW_QUARHODRONGHOST");
			Wld_PlayEffect("spellFX_Maya_Ghost",none_addon_111_quarhodron,none_addon_111_quarhodron,0,0,0,FALSE);
			Wld_PlayEffect("SPELLFX_LIGHTSTAR_WHITE",none_addon_111_quarhodron,none_addon_111_quarhodron,0,0,0,FALSE);
			Snd_Play("MFX_GhostVoice");
			Snd_Play("MFX_Firestorm_Cast");
			Snd_Play("MFX_Lightning_Origin");
			SC_SUMMONEDANCIENTGHOST = TRUE;
		}
		else
		{
			b_say(self,self,"$ADDON_ANCIENTGHOST_NOTNEAR");
		};
	};
};


instance ITWR_MAP_ADDONWORLD(C_ITEM)
{
	name = "The forgotten valley of the builders";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 250;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_addonworld;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_map_addonworld()
{
	var int document;
	if(Npc_IsPlayer(self))
	{
		b_setplayermap(itwr_map_addonworld);
	};
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_AddonWorld.tga",TRUE);
	Doc_SetLevel(document,"Addon\AddonWorld.zen");
	Doc_SetLevelCoords(document,-47783,36300,43949,-32300);
	Doc_Show(document);
};


instance ITWR_ADDON_BMCRFT_01(C_ITEM)
{
	name = "Sketch of old armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1000;
	visual = "ArmorCrft_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_bmcrft_01;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to forge";
	text[3] = "an old armor.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_bmcrft_01()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_BATTLEMAGE == FALSE) && (PLAYER_TALENT_ARMOR[1] == TRUE))
		{
			KNOWS_BATTLEMAGE = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"I have found some old sketch of an armor, I should try to forge it.");
		}
		else if(KNOWS_BATTLEMAGE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_BATTLEMAGE == FALSE) && (PLAYER_TALENT_ARMOR[1] == FALSE))
		{
			b_say(hero,hero,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"ArmorCrft_01.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_TACRFT_01(C_ITEM)
{
	name = "Sketch of troll hide armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 400;
	visual = "ArmorCrft_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_tacrft_01;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to forge";
	text[3] = "an armor from the troll hide";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_tacrft_01()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_TROLLARCRFT == FALSE) && (PLAYER_TALENT_ARMOR[0] == TRUE))
		{
			KNOWS_TROLLARCRFT = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can forge the troll hide armor.");
		}
		else if(KNOWS_TROLLARCRFT)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_TROLLARCRFT == FALSE) && (PLAYER_TALENT_ARMOR[0] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"ArmorCrft_02.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_SLDBOCRFT_01(C_ITEM)
{
	name = "Sketch of black ore armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 6500;
	visual = "ArmorCrft_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_sldbocrft_01;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to forge";
	text[3] = "the black ore armor";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sldbocrft_01()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_SLDBLACKORE == FALSE) && (PLAYER_TALENT_ARMOR[2] == TRUE))
		{
			KNOWS_SLDBLACKORE = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can forge the black ore armor.");
		}
		else if(KNOWS_SLDBLACKORE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_SLDBLACKORE == FALSE) && (PLAYER_TALENT_ARMOR[2] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"ArmorCrft_03.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_SLDG3CRFT_01(C_ITEM)
{
	name = "Sketch of Myrtana mercenary armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 540;
	visual = "ArmorCrft_04.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_sldg3crft_01;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to forge";
	text[3] = "the Myrtana mercenary armor.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sldg3crft_01()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_SLDG3 == FALSE) && (PLAYER_TALENT_ARMOR[0] == TRUE))
		{
			KNOWS_SLDG3 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can forge the Myrtana mercenary armor.");
		}
		else if(KNOWS_SLDG3)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_SLDG3 == FALSE) && (PLAYER_TALENT_ARMOR[0] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"ArmorCrft_04.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_G3SLDCRFT_GRD1TO3(C_ITEM)
{
	name = "Manual for improving the Myrtana mercenary armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_sldg3_grd1to3;
	scemename = "MAP";
	description = name;
	text[2] = "Allows to improve the protective qualities of the armor.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sldg3_grd1to3()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_SLDG3_GRD1TO3 == FALSE) && (KNOWS_SLDG3 == TRUE) && (PLAYER_TALENT_ARMOR[0] == TRUE))
		{
			KNOWS_SLDG3_GRD1TO3 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can improve the Myrtana mercenary armor, adding extra protection to hands and feet.");
		}
		else if(KNOWS_SLDG3_GRD1TO3)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_SLDG3_GRD1TO3 == FALSE) || (KNOWS_SLDG3 == FALSE) || (PLAYER_TALENT_ARMOR[0] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"       Myrtana mercenary armor");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Leather boots:");
	Doc_PrintLine(ndocid,0,"         requires 3 leathers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     Leather gloves:");
	Doc_PrintLine(ndocid,0,"          requires 2 leathers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_G3SLDCRFT_GRD4TO5(C_ITEM)
{
	name = "Manual for improving the Myrtana mercenary armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 600;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_sldg3_grd4to5;
	scemename = "MAP";
	description = name;
	text[2] = "Allows you to further improve the protective qualities of the armor.";
	text[3] = "              Requires knowledge of previous improvements and apprentice skills.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sldg3_grd4to5()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_SLDG3_GRD4TO5 == FALSE) && (KNOWS_SLDG3_GRD1TO3 == TRUE) && (PLAYER_TALENT_ARMOR[1] == TRUE))
		{
			KNOWS_SLDG3_GRD4TO5 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can seriously improve the Myrtana mercenary armor, adding extra protection to body and legs.");
		}
		else if(KNOWS_SLDG3_GRD4TO5)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_SLDG3_GRD4TO5 == FALSE) || (KNOWS_SLDG3_GRD1TO3 == FALSE) || (PLAYER_TALENT_ARMOR[1] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"       Myrtana mercenary armor");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel plates for shoulders protection:");
	Doc_PrintLine(ndocid,0,"     requires 2 steel ingots and a leather.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel plates to protect the chest and legs,");
	Doc_PrintLine(ndocid,0,"   as well as heavy duty shoulder pads:");
	Doc_PrintLine(ndocid,0,"        requires 7 steel ingots and 2 leathers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_G3SLDCRFT_GRD6TO7(C_ITEM)
{
	name = "Manual for improving the Myrtana mercenary armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1200;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_sldg3_grd6to7;
	scemename = "MAP";
	description = name;
	text[2] = "Allows you to maximize the protective qualities of the armor.";
	text[3] = "               Requires knowledge of previous improvements and mastery skills.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sldg3_grd6to7()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_SLDG3_GRD6TO7 == FALSE) && (KNOWS_SLDG3_GRD4TO5 == TRUE) && (PLAYER_TALENT_ARMOR[2] == TRUE))
		{
			KNOWS_SLDG3_GRD6TO7 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can maximally improve the Myrtana mercenary armor, adding additional protection to hands and feet.");
		}
		else if(KNOWS_SLDG3_GRD6TO7)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_SLDG3_GRD6TO7 == FALSE) || (KNOWS_SLDG3_GRD4TO5 == FALSE) || (PLAYER_TALENT_ARMOR[2] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"       Myrtana mercenary armor");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel greaves for leg protection:");
	Doc_PrintLine(ndocid,0,"     requires 2 steel ingots and a leather.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel-reinforced gloves and bracers:");
	Doc_PrintLine(ndocid,0,"     requires 2 steel ingots and a leather.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_W2KNIGHTCRFT_01(C_ITEM)
{
	name = "Instructions for improving royal Vengardian armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 3950;
	visual = "ArmorCrft_05.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_w2knightcrft_01;
	scemename = "MAP";
	description = "Sketch of heavy Vengardian armor";
	text[2] = "Scheme of Heavy royal Vengardian armor";
	text[3] = "         from one of Vengard's best engineers";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_w2knightcrft_01()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_W2KNIGHT == FALSE) && (PLAYER_TALENT_ARMOR[1] == TRUE))
		{
			KNOWS_W2KNIGHT = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can forge the royal Vengardian armor.");
		}
		else if(KNOWS_W2KNIGHT)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_W2KNIGHT == FALSE) && (PLAYER_TALENT_ARMOR[1] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"ArmorCrft_05.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_W2KNIGHTCRFT_GRD1TO2(C_ITEM)
{
	name = "Instructions for improving royal Vengardian armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 1150;
	visual = "ItWr_Scroll_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_w2_grd1to2;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to improve the armor's defensive properties.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_w2_grd1to2()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_W2KNIGHT_GRD1TO2 == FALSE) && (KNOWS_W2KNIGHT == TRUE) && (PLAYER_TALENT_ARMOR[1] == TRUE))
		{
			KNOWS_W2KNIGHT_GRD1TO2 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can improve the royal cuirass, by adding additional protection for shoulders and legs.");
		}
		else if(KNOWS_W2KNIGHT_GRD1TO2)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_W2KNIGHT_GRD1TO2 == FALSE) || (KNOWS_W2KNIGHT == FALSE) || (PLAYER_TALENT_ARMOR[1] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Royal Vengardian armor");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Steel shoulder plates:");
	Doc_PrintLines(ndocid,0,"    requires 2 steel bar and a lether.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel leggings plates:");
	Doc_PrintLine(ndocid,0,"    requires 2 steel bar and a lether.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_W2KNIGHTCRFT_GRD3TO4(C_ITEM)
{
	name = "Instructions for improving royal Vengardian armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 2300;
	visual = "ItWr_Scroll_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_w2_grd3to4;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to further improve the armor's defensive properties.";
	text[3] = "              Requires skill mastery and knowledge of previous improvement.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_w2_grd3to4()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_W2KNIGHT_GRD3TO4 == FALSE) && (KNOWS_W2KNIGHT_GRD1TO2 == TRUE) && (PLAYER_TALENT_ARMOR[2] == TRUE))
		{
			KNOWS_W2KNIGHT_GRD3TO4 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can seriously improve the royal armor, by adding extra protection for hands and feet.");
		}
		else if(KNOWS_W2KNIGHT_GRD3TO4)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_W2KNIGHT_GRD3TO4 == FALSE) || (KNOWS_W2KNIGHT_GRD1TO2 == FALSE) || (PLAYER_TALENT_ARMOR[2] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Royal Vengardian armor");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"A large steel plate on the chest to protect the throat and heart, as well as a patchwork of boots for the protection of feet:");
	Doc_PrintLine(ndocid,0,"    requires 4 steel ingots and a leather.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Plated gloves protection:");
	Doc_PrintLine(ndocid,0,"    requires 4 steel ingots and 3 leathers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_W2KNIGHTCRFT_GRD5TO7(C_ITEM)
{
	name = "Instructions for improving royal Vengardian armor";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 3450;
	visual = "ItWr_Scroll_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_w2_grd5to7;
	scemename = "MAP";
	description = name;
	text[2] = "Shows how to fully improve the armor's protection";
	text[3] = "                requires skill mastery and knowledge of previous improvement.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_w2_grd5to7()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if((KNOWS_W2KNIGHT_GRD5TO7 == FALSE) && (KNOWS_W2KNIGHT_GRD3TO4 == TRUE) && (PLAYER_TALENT_ARMOR[2] == TRUE))
		{
			KNOWS_W2KNIGHT_GRD5TO7 = TRUE;
			b_say(self,self,"$BEZI_INTERES");
			b_logentry(TOPIC_TALENTSMITH,"Now I can maximize the efficiency of the royal armor, by adding supplementary protection to shoulders, elbows and legs.");
		}
		else if(KNOWS_W2KNIGHT_GRD5TO7)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if((KNOWS_W2KNIGHT_GRD5TO7 == FALSE) || (KNOWS_W2KNIGHT_GRD3TO4 == FALSE) || (PLAYER_TALENT_ARMOR[2] == FALSE))
		{
			b_say(self,self,"$BEZI_GOTOWY");
			Print(PRINT_NOPICKLOCKTALENT);
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Royal Vengardian armor");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel elbow pads:");
	Doc_PrintLine(ndocid,0,"    requires 3 steel ingots.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Steel greaves and leg protection:");
	Doc_PrintLine(ndocid,0,"    requires 4 steel ingots and 2 leathers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Shoulder plates for neck and collarbone protection:");
	Doc_PrintLine(ndocid,0,"    requires 5 steel ingots and 2 leathers.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_PINUP_OC(C_ITEM)
{
	name = "Drawing";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_PinUp_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pinup_oc;
	scemename = "MAP";
	description = name;
};


func void use_pinup_oc()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_Pinup_V2.TGA",0);
	Doc_Show(ndocid);
};


instance ITWR_ADDON_FISHSOUP(C_ITEM)
{
	name = "Fish soup recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_cook_fishsoup;
	scemename = "MAP";
	description = name;
	text[2] = "Instructions for cooking a fish soup.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cook_fishsoup()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_FOOD[0] == FALSE)
		{
			PLAYER_TALENT_FOOD[0] = TRUE;
			Snd_Play("LevelUP");
			Log_CreateTopic(TOPIC_TALENTFOOD,LOG_NOTE);
			b_logentry(TOPIC_TALENTFOOD,"To make a 'Fish soup' i need a fish and a bottle of water");
		}
		else if(PLAYER_TALENT_FOOD[0] == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Fish Soup");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"To make a Fish soup you need a fish and some water.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Put some water in the cauldron and when it boils throw in a fish and mix it well with a spoon.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"-Edda");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_STEW(C_ITEM)
{
	name = "Stew recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 50;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_cook_stew;
	scemename = "MAP";
	description = name;
	text[2] = "Instructions for cooking a stew.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cook_stew()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_FOOD[1] == FALSE)
		{
			PLAYER_TALENT_FOOD[1] = TRUE;
			Snd_Play("LevelUP");
			Log_CreateTopic(TOPIC_TALENTFOOD,LOG_NOTE);
			b_logentry(TOPIC_TALENTFOOD,"To make a 'Stew' i need 1 raw meat and 1 turnip");
		}
		else if(PLAYER_TALENT_FOOD[1] == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Stew");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"The Boss said we needed more stew so i went to Thekla in the Mercenary camp and she said this:");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Take a turnip and throw it into the boiling water then add a piece of raw meat and mix it with a spoon.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Now, i have no idea how to do that so it's your turn Jon, move your ass or the Boss is gonna get mad to both of us!");
	Doc_PrintLines(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_MANTISOUP(C_ITEM)
{
	name = "Mantis' head soup recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 300;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_cook_mantisoup;
	scemename = "MAP";
	description = name;
	text[2] = "Instructions for cooking a soup ";
	text[3] = "using an head of a mantis and some herbs.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cook_mantisoup()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_FOOD[2] == FALSE)
		{
			PLAYER_TALENT_FOOD[2] = TRUE;
			Snd_Play("LevelUP");
			Log_CreateTopic(TOPIC_TALENTFOOD,LOG_NOTE);
			b_logentry(TOPIC_TALENTFOOD,"To make a 'Mantis' head soup' i need 1 mantis' head and 1 fire root");
		}
		else if(PLAYER_TALENT_FOOD[2] == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Mantis' head soup");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"I've found an old recipe of something that's like a soup, unfortunately my knowledge of the ancient language is not good enough to understand eveything, but i think i've found which ingredients you need to make it.");
	Doc_PrintLines(ndocid,0,"..");
	Doc_PrintLines(ndocid,0,"..");
	Doc_PrintLines(ndocid,0,"..");
	Doc_PrintLines(ndocid,0,"Yes, I was right! All you need is a Mantis' head and some magic herb, I used a fire root and it worked but i'm not sure if that's the right one.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"All i did was throwing a mantis' head together with a fire root and mix it with a spoon.");
	Doc_PrintLines(ndocid,0,"..");
	Doc_PrintLine(ndocid,0,"..");
	Doc_PrintLines(ndocid,0,"This soup is amazing, i feel like a new person!");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_ADDON_MEATBUG_STEW(C_ITEM)
{
	name = "Meatbug Ragout recipe";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Scroll_01_v2.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_cook_meatbug_stew;
	scemename = "MAP";
	description = name;
	text[1] = "Instructions for cooking a Meatbug Ragout.";
	text[2] = "Judging by the name does not seem very good..";
	text[3] = "But maybe I am wrong";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_cook_meatbug_stew()
{
	var int ndocid;
	if(Npc_IsPlayer(self))
	{
		if(PLAYER_TALENT_FOOD[3] == FALSE)
		{
			PLAYER_TALENT_FOOD[3] = TRUE;
			Snd_Play("LevelUP");
			Log_CreateTopic(TOPIC_TALENTFOOD,LOG_NOTE);
			b_logentry(TOPIC_TALENTFOOD,"To make a 'Meatbug Ragout' i need 3 meatbugs and 2 digger's meat");
		}
		else if(PLAYER_TALENT_FOOD[3] == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"Meatbug Ragout");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,75,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Three meatbugs");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Two digger's meat");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"    -Snaf");
	Doc_Show(ndocid);
};

