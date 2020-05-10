
var int bezi_use_runemaking_kdw;

func void use_runemaking_kdw_circ1_s1()
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
		Doc_PrintLine(ndocid,0,"The Circles of Water");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"The runes of Water and the ingredients necessary for their creation.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Whirlwind");
		Doc_PrintLine(ndocid,0,"- Wings of a bloodfly");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Ice lance");
		Doc_PrintLine(ndocid,0,"- Glacier quartz");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Geyser");
		Doc_PrintLine(ndocid,0,"- Aquamarine");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Storm");
		Doc_PrintLine(ndocid,0,"- Glacier quartz");
		Doc_PrintLine(ndocid,0,"- Wings of a bloodfly");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Waterfist");
		Doc_PrintLine(ndocid,0,"- Aquamarine");
		Doc_PrintLine(ndocid,0,"- Rock crystal");
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
		if(BEZI_USE_RUNEMAKING_KDW == FALSE)
		{
			BEZI_USE_RUNEMAKING_KDW = TRUE;
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

func void use_runemaking_kdw_circ2_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ3_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ4_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ5_s1()
{
	use_runemaking_kdw_circ1_s1();
};

func void use_runemaking_kdw_circ6_s1()
{
	use_runemaking_kdw_circ1_s1();
};

