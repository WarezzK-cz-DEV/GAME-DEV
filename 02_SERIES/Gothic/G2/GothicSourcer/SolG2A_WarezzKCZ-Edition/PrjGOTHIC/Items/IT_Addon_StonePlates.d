
const int STR_STPLLEVEL1 = 2;
const int STR_STPLLEVEL2 = 4;
const int STR_STPLLEVEL3 = 6;
const int DEX_STPLLEVEL1 = 2;
const int DEX_STPLLEVEL2 = 4;
const int DEX_STPLLEVEL3 = 6;
const int HPMAX_STPLLEVEL1 = 5;
const int HPMAX_STPLLEVEL2 = 10;
const int HPMAX_STPLLEVEL3 = 15;
const int MANAMAX_STPLLEVEL1 = 2;
const int MANAMAX_STPLLEVEL2 = 4;
const int MANAMAX_STPLLEVEL3 = 6;
const int ONEH_STPLLEVEL1 = 2;
const int ONEH_STPLLEVEL2 = 4;
const int ONEH_STPLLEVEL3 = 6;
const int TWOH_STPLLEVEL1 = 2;
const int TWOH_STPLLEVEL2 = 4;
const int TWOH_STPLLEVEL3 = 6;
const int BOW_STPLLEVEL1 = 2;
const int BOW_STPLLEVEL2 = 4;
const int BOW_STPLLEVEL3 = 6;
const int CRSBOW_STPLLEVEL1 = 2;
const int CRSBOW_STPLLEVEL2 = 4;
const int CRSBOW_STPLLEVEL3 = 6;
const int VALUE_STONEPLATEMAGIC = 100;
const int VALUE_STONEPLATECOMMON = 5;
var int stoneplateitem;
var int stoneplatelevel;
const int STRSTONEPLATE = 2;
const int DEXSTONEPLATE = 3;
const int HITPOINTSTONEPLATE = 4;
const int MANASTONEPLATE = 5;
const int ONEHSTONEPLATE = 6;
const int TWOHSTONEPLATE = 7;
const int BOWSTONEPLATE = 8;
const int CRSBOWSTONEPLATE = 9;

const string STPL_MAGICAURATEXT = "The stone tablet has a magical aura.";
const string STPL_STANDARDTEXT = "";

func int c_schasstplskill()
{
	if(KNOW_FOREIGNLANGUAGE == FALSE)
	{
		return FALSE;
	};
	if(STONEPLATELEVEL == 1)
	{
		if(KNOW_FOREIGNLANGUAGE == TRUE)
		{
			return TRUE;
		};
	}
	else if(STONEPLATELEVEL == 2)
	{
		if(KNOW_FOREIGNLANGUAGE == TRUE)
		{
			return TRUE;
		};
	}
	else if(STONEPLATELEVEL == 3)
	{
		if(KNOW_FOREIGNLANGUAGE == TRUE)
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void use_stoneplate()
{
	var string concattext;
	if(c_schasstplskill() == FALSE)
	{
		b_say(self,self,"$CANTREADTHIS");
	}
	else
	{
		if(STONEPLATEITEM == STRSTONEPLATE)
		{
			concattext = PRINT_LEARNSTR;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_STRENGTH,STR_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(STR_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_STRENGTH,STR_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(STR_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_STRENGTH,STR_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(STR_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == DEXSTONEPLATE)
		{
			concattext = PRINT_LEARNDEX;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_DEXTERITY,DEX_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(DEX_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_DEXTERITY,DEX_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(DEX_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_DEXTERITY,DEX_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(DEX_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == HITPOINTSTONEPLATE)
		{
			concattext = PRINT_LEARNHITPOINTS_MAX;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_STPLLEVEL1);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(HPMAX_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_STPLLEVEL2);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(HPMAX_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_STPLLEVEL3);
				Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(HPMAX_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == MANASTONEPLATE)
		{
			concattext = PRINT_LEARNMANA_MAX;
			if(STONEPLATELEVEL == 1)
			{
				b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_STPLLEVEL1);
				Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_STPLLEVEL1);
				concattext = ConcatStrings(concattext,IntToString(MANAMAX_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_STPLLEVEL2);
				Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_STPLLEVEL2);
				concattext = ConcatStrings(concattext,IntToString(MANAMAX_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_STPLLEVEL3);
				Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_STPLLEVEL3);
				concattext = ConcatStrings(concattext,IntToString(MANAMAX_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == ONEHSTONEPLATE)
		{
			concattext = PRINT_LEARN1H;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_1H,ONEH_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(ONEH_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_1H,ONEH_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(ONEH_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_1H,ONEH_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(ONEH_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == TWOHSTONEPLATE)
		{
			concattext = PRINT_LEARN2H;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_2H,TWOH_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(TWOH_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_2H,TWOH_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(TWOH_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_2H,TWOH_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(TWOH_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == BOWSTONEPLATE)
		{
			concattext = PRINT_LEARNBOW;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_BOW,BOW_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(BOW_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_BOW,BOW_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(BOW_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_BOW,BOW_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(BOW_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		}
		else if(STONEPLATEITEM == CRSBOWSTONEPLATE)
		{
			concattext = PRINT_LEARNCROSSBOW;
			if(STONEPLATELEVEL == 1)
			{
				b_raisefighttalent(self,NPC_TALENT_CROSSBOW,CRSBOW_STPLLEVEL1);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(CRSBOW_STPLLEVEL1));
				b_say(self,self,"STONEPLATE_1");
			}
			else if(STONEPLATELEVEL == 2)
			{
				b_raisefighttalent(self,NPC_TALENT_CROSSBOW,CRSBOW_STPLLEVEL2);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(CRSBOW_STPLLEVEL2));
				b_say(self,self,"STONEPLATE_2");
			}
			else if(STONEPLATELEVEL == 3)
			{
				b_raisefighttalent(self,NPC_TALENT_CROSSBOW,CRSBOW_STPLLEVEL3);
				concattext = ConcatStrings(concattext," + ");
				concattext = ConcatStrings(concattext,IntToString(CRSBOW_STPLLEVEL3));
				b_say(self,self,"STONEPLATE_3");
			};
		};
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		Wld_PlayEffect("spellFX_LIGHTSTAR_ORANGE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
	};
	STONEPLATEITEM = 0;
	STONEPLATELEVEL = 0;
};


prototype PROTOTYPE_STONEPLATE(C_ITEM)
{
	name = "Stone tablet";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_STONEPLATEMAGIC;
	visual = "ItMi_StonePlate_PowerUp_01.3DS";
	material = MAT_STONE;
	scemename = "MAPSEALED";
	inv_rotx = -90;
	inv_roty = 0;
	inv_rotz = 0;
	text[2] = STPL_MAGICAURATEXT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

func int c_schasmagicstoneplate()
{
	return FALSE;
};

