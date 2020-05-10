
func void use_bookstand_rune_01_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Page 1");
		Doc_PrintLine(ndocid,0,"The runestones");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Page 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_rune_02_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Page 1");
		Doc_PrintLine(ndocid,0,"The runes and their ingredients");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Page 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_01_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Page 1");
		Doc_PrintLine(ndocid,0,"Teachings of Innos");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Page 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

func void use_bookstand_innos_02_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Page 1");
		Doc_PrintLine(ndocid,0,"Commandments of Innos");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Page 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};


var int bezi_use_bookstand_kreise_01_s1;

func void use_bookstand_kreise_01_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"THE FIRST CIRCLE");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of the 1st Circle and the ingredients required to create them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Light");
		Doc_PrintLine(ndocid,0,"- Gold coin");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Fire arrow");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Small lightning");
		Doc_PrintLine(ndocid,0,"- Rock crystal");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Summon goblin skeleton");
		Doc_PrintLine(ndocid,0,"- Goblin's bone");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Heal light wounds");
		Doc_PrintLine(ndocid,0,"- Healing plant");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To create a rune you always require ONE of the ingredients listed.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The user must know the formula for the spell and he must have a blank runestone and a spell scroll for the desired spell.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Only when these prerequisites are fulfilled can he set to work on the rune table.");
		Doc_Show(ndocid);
		if(bezi_use_bookstand_kreise_01_s1 == FALSE)
		{
			bezi_use_bookstand_kreise_01_s1 = TRUE;
		}
		else
		{
			bezi_random = Hlp_Random(29);
			if(bezi_random <= 9)
			{
				b_say(hero,hero,"$BEZI_NIC_CIEKAWEGO");
			}
			else if(bezi_random <= 19)
			{
				b_say(hero,hero,"$BEZI_NIECIEKAWE");
			}
			else if(bezi_random <= 29)
			{
				b_say(hero,hero,"$BEZI_TO_WIE");
			};
		};
	};
};


var int bezi_use_bookstand_kreise_02_s1;

func void use_bookstand_kreise_02_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"THE SECOND CIRCLE");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of the 2nd Circle and the ingredients required to create them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Fireball");
		Doc_PrintLine(ndocid,0,"- Pitch");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ice arrow");
		Doc_PrintLine(ndocid,0,"- Glacier quartz");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Summon wolf");
		Doc_PrintLine(ndocid,0,"- Wolf skin");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Wind fist");
		Doc_PrintLine(ndocid,0,"- Coal");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Sleep");
		Doc_PrintLine(ndocid,0,"- Swampweed");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To create a rune you always require ONE of the ingredients listed.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The user must know the formula for the spell and he must have a blank runestone and a spell scroll for the desired spell.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Only when these prerequisites are fulfilled can he set to work on the rune table.");
		Doc_Show(ndocid);
		if(bezi_use_bookstand_kreise_02_s1 == FALSE)
		{
			bezi_use_bookstand_kreise_02_s1 = TRUE;
		}
		else
		{
			bezi_random = Hlp_Random(29);
			if(bezi_random <= 9)
			{
				b_say(hero,hero,"$BEZI_NIC_CIEKAWEGO");
			}
			else if(bezi_random <= 19)
			{
				b_say(hero,hero,"$BEZI_NIECIEKAWE");
			}
			else if(bezi_random <= 29)
			{
				b_say(hero,hero,"$BEZI_TO_WIE");
			};
		};
	};
};


var int bezi_use_bookstand_kreise_03_s1;

func void use_bookstand_kreise_03_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"THE THIRD CIRCLE");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of the 3rd Circle and the ingredients required to create them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Heal medium wounds");
		Doc_PrintLine(ndocid,0,"- Healing herb");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Small fire storm");
		Doc_PrintLine(ndocid,0,"- Pitch");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Summon skeleton");
		Doc_PrintLine(ndocid,0,"- Skeleton's bone");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Fear");
		Doc_PrintLine(ndocid,0,"- Black pearl");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ice block");
		Doc_PrintLine(ndocid,0,"- Glacier quartz");
		Doc_PrintLine(ndocid,0,"- Aquamarine");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ball lightning");
		Doc_PrintLine(ndocid,0,"- Rock crystal");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,0,"Fireball");
		Doc_PrintLine(ndocid,0,"- Pitch");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"To create a rune you always require ONE of the ingredients listed.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The user must know the formula for the spell and he must have a blank runestone and a spell scroll for the desired spell.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Only when these prerequisites are fulfilled can he set to work on the rune table.");
		Doc_Show(ndocid);
		if(bezi_use_bookstand_kreise_03_s1 == FALSE)
		{
			bezi_use_bookstand_kreise_03_s1 = TRUE;
		}
		else
		{
			bezi_random = Hlp_Random(29);
			if(bezi_random <= 9)
			{
				b_say(hero,hero,"$BEZI_NIC_CIEKAWEGO");
			}
			else if(bezi_random <= 19)
			{
				b_say(hero,hero,"$BEZI_NIECIEKAWE");
			}
			else if(bezi_random <= 29)
			{
				b_say(hero,hero,"$BEZI_TO_WIE");
			};
		};
	};
};


var int bezi_use_bookstand_kreise_04_s1;

func void use_bookstand_kreise_04_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"THE FOURTH CIRCLE");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of the 4th Circle and the ingredients required to create them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Large fireball");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"- Pitch");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Lightning");
		Doc_PrintLine(ndocid,0,"- Rock crystal");
		Doc_PrintLine(ndocid,0,"- Glacier quartz");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Summon golem");
		Doc_PrintLine(ndocid,0,"- Heart of a stone golem");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Destroy undead");
		Doc_PrintLine(ndocid,1,"- Holy water");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To create a rune you always require ONE of the ingredients listed.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The user must know the formula for the spell and he must have a blank runestone and a spell scroll for the desired spell.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Only when these prerequisites are fulfilled can he set to work on the rune table.");
		Doc_Show(ndocid);
		if(bezi_use_bookstand_kreise_04_s1 == FALSE)
		{
			bezi_use_bookstand_kreise_04_s1 = TRUE;
		}
		else
		{
			bezi_random = Hlp_Random(29);
			if(bezi_random <= 9)
			{
				b_say(hero,hero,"$BEZI_NIC_CIEKAWEGO");
			}
			else if(bezi_random <= 19)
			{
				b_say(hero,hero,"$BEZI_NIECIEKAWE");
			}
			else if(bezi_random <= 29)
			{
				b_say(hero,hero,"$BEZI_TO_WIE");
			};
		};
	};
};


var int bezi_use_bookstand_kreise_05_s1;

func void use_bookstand_kreise_05_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"THE FIFTH CIRCLE");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of the 5th Circle and the ingredients required to create them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ice wave");
		Doc_PrintLine(ndocid,0,"- Glacier quartz");
		Doc_PrintLine(ndocid,0,"- Aquamarine");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Large fire storm");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"- Tongue of fire");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Summon demon");
		Doc_PrintLine(ndocid,0,"- Heart of a demon");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Heal heavy wounds");
		Doc_PrintLine(ndocid,1,"- Healing root");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To create a rune you always require ONE of the ingredients listed.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The user must know the formula for the spell and he must have a blank runestone and a spell scroll for the desired spell.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Only when these prerequisites are fulfilled can he set to work on the rune table.");
		Doc_Show(ndocid);
		if(bezi_use_bookstand_kreise_05_s1 == FALSE)
		{
			bezi_use_bookstand_kreise_05_s1 = TRUE;
		}
		else
		{
			bezi_random = Hlp_Random(29);
			if(bezi_random <= 9)
			{
				b_say(hero,hero,"$BEZI_NIC_CIEKAWEGO");
			}
			else if(bezi_random <= 19)
			{
				b_say(hero,hero,"$BEZI_NIECIEKAWE");
			}
			else if(bezi_random <= 29)
			{
				b_say(hero,hero,"$BEZI_TO_WIE");
			};
		};
	};
};


var int bezi_use_bookstand_kreise_06_s1;

func void use_bookstand_kreise_06_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"THE SIXTH CIRCLE");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of the 6th Circle and the ingredients required to create them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Fire rain");
		Doc_PrintLine(ndocid,0,"- Pitch");
		Doc_PrintLine(ndocid,0,"- Sulfur");
		Doc_PrintLine(ndocid,0,"- Tongue of fire");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Breath of death");
		Doc_PrintLine(ndocid,0,"- Coal");
		Doc_PrintLine(ndocid,0,"- Black pearl");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Wave of death");
		Doc_PrintLine(ndocid,0,"- Skeleton's bone");
		Doc_PrintLine(ndocid,0,"- Black pearl");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Army of darkness");
		Doc_PrintLine(ndocid,1,"- Skeleton's bone");
		Doc_PrintLine(ndocid,1,"- Black pearl");
		Doc_PrintLine(ndocid,1,"- Heart of a stone golem");
		Doc_PrintLine(ndocid,1,"- Heart of a demon");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Shrink monster");
		Doc_PrintLine(ndocid,1,"- Goblin's bone");
		Doc_PrintLine(ndocid,1,"- Troll tusk");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To create a rune you always require ONE of the ingredients listed.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The user must know the formula for the spell and he must have a blank runestone and a spell scroll for the desired spell.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Only when these prerequisites are fulfilled can he set to work on the rune table.");
		Doc_Show(ndocid);
		if(bezi_use_bookstand_kreise_06_s1 == FALSE)
		{
			bezi_use_bookstand_kreise_06_s1 = TRUE;
		}
		else
		{
			bezi_random = Hlp_Random(29);
			if(bezi_random <= 9)
			{
				b_say(hero,hero,"$BEZI_NIC_CIEKAWEGO");
			}
			else if(bezi_random <= 19)
			{
				b_say(hero,hero,"$BEZI_NIECIEKAWE");
			}
			else if(bezi_random <= 29)
			{
				b_say(hero,hero,"$BEZI_TO_WIE");
			};
		};
	};
};

func void use_bookstand_rules_01_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Page 1");
		Doc_PrintLine(ndocid,0,"Rules");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Page 2");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
	};
};

