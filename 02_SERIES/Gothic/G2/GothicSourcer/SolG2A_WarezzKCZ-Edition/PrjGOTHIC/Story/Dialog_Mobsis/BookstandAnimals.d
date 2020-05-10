
var int animals_1_permanent;
var int animals_2_permanent;
var int animals_3_permanent;

func void use_bookstandanimals1_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Hunt and prey I");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Every beast or creature has certain trophies that improve the wealth and glory of experienced hunters.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"An experienced hunter knows all about the trophies of the prey and how to gut them.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Extract teeth");
		Doc_PrintLines(ndocid,0,"Teeth are the weapons of many beasts and creatures. If you know how to extract them from your prey, wolves, snappers, shadowbeasts, swampsharks and trolls are the best targets.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Skinning");
		Doc_PrintLines(ndocid,1,"A talent experienced hunters value greatly, for many animals have pelts - sheep, wolves and shadowbeats, for example.");
		Doc_PrintLines(ndocid,1,"A hunter with this skill can also skin swampsharks and lurkers.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Extract claws");
		Doc_PrintLines(ndocid,1,"An art to be used on all kinds of lizards, snappers, lurkers and shadowbeats.");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_1_PERMANENT = TRUE;
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

func void use_bookstandanimals2_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Hunt and prey II");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Every beast or creature has certain trophies that improve the wealth and glory of experienced hunters.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Bloodflies");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Two special skills are required to gut these flying devils.");
		Doc_PrintLines(ndocid,0,"Their wings can be removed and their stingers extracted.");
		Doc_PrintLines(ndocid,0,"Both arts should be used by experienced hunters to claim their trophies.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Field raiders and minecrawlers");
		Doc_PrintLines(ndocid,1,"They use mandibles to attack which are particularly valuable, as they contain a secretion that increases magic powers.");
		Doc_PrintLines(ndocid,1,"However, it should be used sparingly, as the human body ceases to react to it over time.");
		Doc_PrintLines(ndocid,1,"Minecrawler plates are also popular. They can be used to make armor.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_2_PERMANENT = TRUE;
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

func void use_bookstandanimals3_s1()
{
	var int ndocid;
	var int bezi_random;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"Hunt and prey III");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Every beast or creature has certain trophies that improve the wealth and glory of experience hunters.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Fire lizard");
		Doc_PrintLines(ndocid,0,"This beast is a lizard, but it can spit fire that will kill anyone venturing within a few paces of it.");
		Doc_PrintLines(ndocid,0,"Only those who have protection from fire can fight these beasts and take their valued tongues.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"Shadowbeast");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The shadowbeast is an ancient loner and lives hidden in the woods.");
		Doc_PrintLines(ndocid,1,"There are very few of these creatures left, therefore they are no danger to humans unless they venture into their hunting grounds.");
		Doc_PrintLines(ndocid,1,"The horn on a shadowbeast's head is regarded as a valuable hunting trophy. A hunter must learn how to remove it properly");
		Doc_PrintLines(ndocid,1,"in order to claim this prize.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_BOOKSTAND);
			ANIMALS_3_PERMANENT = TRUE;
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

