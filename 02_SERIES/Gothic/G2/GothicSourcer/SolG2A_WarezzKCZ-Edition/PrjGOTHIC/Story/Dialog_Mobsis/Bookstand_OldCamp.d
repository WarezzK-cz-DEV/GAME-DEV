
var int bezi_bookstand_milten_03_s1;

func void bookstand_milten_03_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"It's late.");
		Doc_PrintLines(ndocid,0,"The collapse of the old mine brought about the downfall of the ore barons' mood.");
		Doc_PrintLines(ndocid,0,"Gomez is like a powder keg about to explode.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"He thinks the new guy's to blame for the collapse of the mine. That man sure is strange. But he'd better not show his face round here again.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Corristo");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Gomez' temper is hotter than ever, and I think I can guess what he's planning. We must warn the Water Mages, before it's too late.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Corristo");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Maybe we can ward off a disaster. It doesn't bear thinking about what would happen if the free mine...");
		Doc_Show(ndocid);
		if(bezi_bookstand_milten_03_s1 == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		}
		else
		{
			bezi_bookstand_milten_03_s1 = TRUE;
		};
	};
};


var int bezi_bookstand_milten_02_s1;

func void bookstand_milten_02_s1()
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
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"I've taken the liberty of making myself more comfortable. Who'd have thought I would someday be the only mage in the camp?");
		Doc_PrintLines(ndocid,0,"Well, I can't really say I'm glad to be back. In fact, I should be seeing about clearing out of here.");
		Doc_PrintLines(ndocid,0,"This expedition just isn't having any success.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The scrapers left yesterday. They took Diego with them - wouldn't surprise me if he did a runner.");
		Doc_PrintLines(ndocid,1,"He's not likely to swing a pickaxe anyhow.");
		Doc_PrintLines(ndocid,1,"Well, I'll use the time to learn a bit about the art of alchemy.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Milten");
		Doc_Show(ndocid);
		if(bezi_bookstand_milten_02_s1 == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		}
		else
		{
			bezi_bookstand_milten_02_s1 = TRUE;
		};
	};
};

func void bookstand_milten_01_s1()
{
	var int document;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Stock");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"We found some stuff - nothing much usable. Remainder as follows:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 crates of old rags");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 crates of rusty iron");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 crates of broken armor");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 crates of (stinking) leather and pelts");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 crates of pickaxes");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 crates of tools");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 crates of rocks (ore virtually nil)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 crate of rusty razor blades");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 crates of broken crockery");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 water barrels");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 crate of something swampy (whatever it was, it's rotted)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Engor");
		Doc_Show(ndocid);
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

