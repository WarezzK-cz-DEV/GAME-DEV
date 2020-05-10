
func void use_bookstand_addon_bl_s1()
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
		Doc_PrintLine(ndocid,0,"Mine");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Crimson: 79 gold nuggets received and melted down");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Scatty: goods received for 250 gold");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Garaz: 6 gold nuggets received");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"All guards: 9 gold nuggets received");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"Camp");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Raven's guards: 25 gold pieces");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Finn: 60 gold pieces");
		Doc_PrintLines(ndocid,1,"Lennar: 40 gold pieces");
		Doc_PrintLines(ndocid,1,"Emilio: 50 gold pieces");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Others: 20 gold pieces");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Huno, Fisk, Snaf: each according to goods");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Hunters: let the leader handle this! Franco received 7 gold pieces");
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


var int bookstandmayahierchary_1_permanent;
var int bookstandmayahierchary_2_permanent;
var int bookstandmayahierchary_3_permanent;
var int bookstandmayahierchary_4_permanent;
var int bookstandmayahierchary_5_permanent;
var int bookstandmayaart;

func int c_canreadbookstand()
{
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		return TRUE;
	};
};

func void use_bookstandmaya()
{
	if(BOOKSTANDMAYAART == 1)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"...because only the GUARDIANS OF THE DEAD could call the ancestors.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Their abscence hurts deeply. Without the counsel of the ancestors, we are at the mercy of our people.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"The HEALERS were sent to seal the portal and destroy the key. Only Adanos knows what happened to them or if they even achieved their goal.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"The WARRIOR CASTE has been destroyed by the wrath of Adanos. The heart of the old warrior prince is broken.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Only the remaining PRIESTS raise hopes and preach constantly of the rebirth of our once magnificent city.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"However, we SCHOLARS know the bitter truth. JHARKENDAR has fallen and will fade in the river of time.");
		Doc_PrintLines(STPL_NDOCID,1,"");
	}
	else if(BOOKSTANDMAYAART == 2)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES was imprisoned forever in the temple of ADANOS, but the power of the sword was not broken.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Its influence had become too great. The killings in the streets would not stop.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"The wrath of ADANOS ended everything. The sea raised itself over JHARKENDAR and flooded the whole city.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Only the temples and structures in higher places were left almost untouched.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"The few who survived this catastrophe no longer had the strength to rebuild the city.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"And thus the fate of JHARKENDAR was sealed.");
		if(SC_KNOWS_WEAPONINADANOSTEMPEL == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			SC_KNOWS_WEAPONINADANOSTEMPEL = TRUE;
		};
	}
	else if(BOOKSTANDMAYAART == 3)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON's age made it impossible for him to lead our army. And so the priests insisted on their right of command over him.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"They instructed him to resign his office and pass on the sword.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"The Council of Five was to determine his successor. However, the warrior caste denied the council a choice.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"The warriors would no longer submit to the Council of Five and selected his son RHADEMES as their new leader.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Out of pride and confidence in his own flesh and blood, QUARHODRON decided to give in to them.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"He delivered the sword to his son in the hope that he would wield it with the same strong hand that he had himself.");
	}
	else if(BOOKSTANDMAYAART == 4)
	{
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"RHADEMES was weak. The will of the sword overcame him and made him its tool.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Not even the healers could alleviate the suffering and the atrocities he brought upon our people in his blindness.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"The sword quickly recognized that the people were too weak to thwart its plans.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"Only the power of our ancestors could still withstand it.");
		Doc_PrintLine(STPL_NDOCID,0,"");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"And so it had RHADEMES banish or execute all of the guardians of the dead, thus shattering all hope of release from this Evil.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"Thus, not a single guardian of the dead was left when the remaining four disempowered leaders of our people made the bitter decision to surrender JHARKENDAR.");
		Doc_PrintLine(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"War raged in the streets as the healers set out to seal the only entrance to our valley forever.");
	}
	else if(BOOKSTANDMAYAART == 5)
	{
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"In these halls QUARHODRON, the high priest KHARDIMON and I myself discussed a way to defeat RHADEMES and the sword.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"QUARHODRON and KHARDIMON were of the opinion that RHADEMES could be defeated in battle with united strength. But I knew the power of the sword too well to believe that possible.");
		Doc_PrintLines(STPL_NDOCID,0,"");
		Doc_PrintLines(STPL_NDOCID,0,"So I made use of my right to veto the decision of the others. I decided instead to overcome RHADAMES with a ruse.");
		Doc_SetMargins(STPL_NDOCID,-1,30,20,275,20,1);
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON obeyed the decison of the Council. He proceeded to the temple of Adanos and sent for his son.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"His son's hatred had taken such form that RHADEMES stormed the temple in a wild frenzy to execute his father.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"He only recognized our plans when it was too late for him.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"QUARHODRON closed the holy chambers of the temple behind him and RHADEMES was trapped in the temple for all time.");
		Doc_PrintLines(STPL_NDOCID,1,"");
		Doc_PrintLines(STPL_NDOCID,1,"");
	};
};

func void inituse_bookstandmaya()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(c_canreadbookstand() == FALSE)
		{
			STPL_NDOCID = Doc_Create();
			Doc_SetPages(STPL_NDOCID,2);
			Doc_SetPage(STPL_NDOCID,0,"Book_MayaGlyph_L.tga",0);
			Doc_SetPage(STPL_NDOCID,1,"Book_MayaGlyph_R.tga",0);
			Doc_SetFont(STPL_NDOCID,-1,FONT_BOOK);
			Doc_SetMargins(STPL_NDOCID,0,275,20,30,20,1);
			Doc_Show(STPL_NDOCID);
			b_say(self,self,"$CANTREADTHIS");
		}
		else if(c_canreadbookstand())
		{
			STPL_NDOCID = Doc_Create();
			Doc_SetPages(STPL_NDOCID,2);
			Doc_SetPage(STPL_NDOCID,0,"Book_MayaRead_L.tga",0);
			Doc_SetPage(STPL_NDOCID,1,"Book_MayaRead_R.tga",0);
			Doc_SetFont(STPL_NDOCID,-1,FONT_BOOK);
			Doc_SetMargins(STPL_NDOCID,0,275,20,30,20,1);
			use_bookstandmaya();
			Doc_Show(STPL_NDOCID);
		};
	};
	BOOKSTANDMAYAART = 0;
};

func void use_bookstandmayahierchary_01_s1()
{
	var int bezi_random;
	BOOKSTANDMAYAART = 1;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_1_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_1_PERMANENT = TRUE;
	}
	else if(BOOKSTANDMAYAHIERCHARY_1_PERMANENT == TRUE)
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

func void use_bookstandmayahierchary_02_s1()
{
	BOOKSTANDMAYAART = 2;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_2_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_2_PERMANENT = TRUE;
	}
	else if(BOOKSTANDMAYAHIERCHARY_2_PERMANENT == TRUE)
	{
		b_say(hero,hero,"$BEZI_TO_WIE");
	};
};

func void use_bookstandmayahierchary_03_s1()
{
	var int bezi_random;
	BOOKSTANDMAYAART = 3;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_3_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_3_PERMANENT = TRUE;
	}
	else if(BOOKSTANDMAYAHIERCHARY_3_PERMANENT == TRUE)
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

func void use_bookstandmayahierchary_04_s1()
{
	var int bezi_random;
	BOOKSTANDMAYAART = 4;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_4_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_4_PERMANENT = TRUE;
	}
	else if(BOOKSTANDMAYAHIERCHARY_4_PERMANENT == TRUE)
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

func void use_bookstandmayahierchary_05_s1()
{
	var int bezi_random;
	BOOKSTANDMAYAART = 5;
	inituse_bookstandmaya();
	if((BOOKSTANDMAYAHIERCHARY_5_PERMANENT == FALSE) && c_canreadbookstand())
	{
		b_giveplayerxp(XP_AMBIENT);
		BOOKSTANDMAYAHIERCHARY_5_PERMANENT = TRUE;
	}
	else if(BOOKSTANDMAYAHIERCHARY_5_PERMANENT == TRUE)
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

