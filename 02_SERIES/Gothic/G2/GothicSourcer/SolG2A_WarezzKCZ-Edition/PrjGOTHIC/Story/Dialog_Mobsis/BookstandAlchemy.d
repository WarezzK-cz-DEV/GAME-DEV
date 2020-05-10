
var int alchemy_1_permanent;
var int alchemy_2_permanent;
var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Potions of magic power");
		Doc_PrintLine(ndocid,0,"and ingredients");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mana essence");
		Doc_PrintLine(ndocid,0,"2 fire nettles");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mana extract");
		Doc_PrintLine(ndocid,0,"2 fireweeds");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Mana elixir");
		Doc_PrintLine(ndocid,0,"2 fire roots");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"All work at the alchemist's bench requires a laboratory flask which is used up in the process.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To brew any healing potions or potions to strengthen magic power, you need a special ingredient and a plant:");
		Doc_PrintLines(ndocid,1,"king's sorrel");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_1_PERMANENT = TRUE;
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

func void use_bookstandalchemy2_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Healing potions");
		Doc_PrintLine(ndocid,0,"and ingredients");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Essence of healing");
		Doc_PrintLine(ndocid,0,"2 healing plants");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Extract of healing");
		Doc_PrintLine(ndocid,0,"2 healing herbs");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixir of healing");
		Doc_PrintLine(ndocid,0,"2 healing roots");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"All work at the alchemist's bench requires a laboratory flask which is used up in the process.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"To brew any healing potions or potions to strengthen magic power, you need a special ingredient and a plant:");
		Doc_PrintLines(ndocid,1,"king's sorrel.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_2_PERMANENT = TRUE;
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

func void use_bookstandalchemy3_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Potions for permanent");
		Doc_PrintLine(ndocid,0,"changes and ingredients");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixir of dexterity");
		Doc_PrintLine(ndocid,0,"1 goblin berry");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Speed potion");
		Doc_PrintLines(ndocid,0,"1 snapperweed - This potion requires not king's sorrel, but meadow knotweed.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Elixir of strength");
		Doc_PrintLine(ndocid,0,"1 dragonroot");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Elixir of life");
		Doc_PrintLine(ndocid,0,"3 pure life potion");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Elixir of spirit");
		Doc_PrintLine(ndocid,0,"3 pure mana potion");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Brewing these recipes is the highest art of alchemy. They all have the use of king's sorrel as an ingredient in common.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The potion of speed is much simpler to create which is also due to the fact that you do not need king's sorrel.");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ALCHEMY_3_PERMANENT = TRUE;
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

