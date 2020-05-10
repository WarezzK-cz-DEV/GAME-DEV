
func void use_bookstand_01_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if(KNOWS_FIRE_CONTEST == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		};
		if(hero.guild == GIL_NOV)
		{
			KNOWS_FIRE_CONTEST = TRUE;
			Log_CreateTopic(TOPIC_FIRECONTEST,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_FIRECONTEST,LOG_RUNNING);
			b_say(hero,hero,"$BEZI_INTERES");
			b_logentry(TOPIC_FIRECONTEST,"As a novice, I have a right to demand the Test of Fire. This entails each of the three magicians from the High Council setting me a test. If I pass these trials, I will be accepted into the Circle of Fire.");
		};
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"The Test of Fire");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"Though a novice may feel ready to submit to the Test of Magic, he may not necessarily be chosen. If, however, he has given his decision ample consideration and if he insists, he is accorded the right to demand the Test and no magician may deny it to him. But not only must he pass the Test of Magic, he must also find enlightenment through the fire. If he insists before the High Council, he shall be submitted to the TEST OF FIRE,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"the Test should challenge the wisdom, strength and dexterity of the novice. Therefore he must pass three trials, each of which is set before him by a magician of the High Council, before taking the Oath of the Fire to join the pact with the fire.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"Such is the will of Innos and so it shall be done.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"The High Council");
		Doc_Show(ndocid);
	};
};


var int finaldragonequipment_once;

func void use_finaldragonequipment_s1()
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
		Doc_PrintLines(ndocid,0,"...I hope the dome may protect the ore from the menace of Beliar. The King is naive enough to believe that we built the dome as protection against breakouts. Well, as long as such ruses enable us to fulfill our higher goals, let it be so. I can only hope we have enough time left to prepare for the fight. As soon as the dome around the Valley of Mines has been erected, I will use all the power at my disposal to intervene in the impeding fight.");
		Doc_PrintLines(ndocid,0,"");
		if(hero.guild == GIL_KDF)
		{
			PLAYERGETSAMULETTOFDEATH = TRUE;
			PLAYER_TALENT_RUNES[SPL_MASTEROFDISASTER] = TRUE;
			b_logentry(TOPIC_TALENTRUNES,"Ingredients for the rune 'Holy bolt': 1 holy water, no spell scroll");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"...I followed the instructions and simply poured Innos' holy water over a blank runestone on a rune table. The runestone was destroyed. I suspect this spell really is accessible only to the One.");
			Doc_PrintLines(ndocid,1,"I have left the holy aura of Innos in the protection of the monastery. The abbot will take care of it until the One reveals himself.");
			Doc_PrintLines(ndocid,1,"The Tears of Innos may have a vital part to play in the fight ahead. But it's too dangerous to keep them where all can see. I'd better leave them here in the library.");
			Doc_Show(ndocid);
		}
		else if(hero.guild == GIL_PAL)
		{
			PAL_KNOWSABOUT_FINAL_BLESSING = TRUE;
			PLAYER_TALENT_RUNES[SPL_PALTELEPORTSECRET] = TRUE;
			PrintScreen(PRINT_LEARNPALTELEPORTSECRET,-1,-1,FONT_SCREEN,2);
			Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
			b_logentry(TOPIC_TALENTRUNES,"To create a rune I need certain ingredients for each one. Using those ingredients and a blank runestone I can create the desired rune at a rune table.");
			b_logentry(TOPIC_TALENTRUNES,"Ingredients for the rune 'Secret teleport': 1 holy water");
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"You have to create a teleportation rune to reach the secret place. For that you need a blank runestone and a small bottle of holy water. You can use the rune to teleport into the room.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"I am now reasonably certain that the Tears of Innos are what the paladins of old used in the long forgotten ritual Consecration of the Sword. That means I should be able to use the little bottle I found to give additional strength to a consecrated weapon.");
			Doc_PrintLine(ndocid,1,"");
			Doc_Show(ndocid);
		}
		else
		{
			PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
			PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
			PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
			Npc_SetTalentSkill(self,NPC_TALENT_SMITH,1);
			Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
			b_logentry(TOPIC_TALENTSMITH,"To forge a weapon, first of all I need a piece of raw steel. This I must heat in the fire of a smithy until it glows red-hot and then shape it on an anvil. Special weapons often require the use of certain substances that give them special characteristics.");
			b_logentry(TOPIC_TALENTSMITH,"If I add 4 units of ore and 5 of dragon's blood, I can forge an ORE DRAGONSLAYER, and");
			b_logentry(TOPIC_TALENTSMITH,"if I add 5 units of ore and 5 of dragon's blood, I can forge a LARGE ORE DRAGONSLAYER.");
			PLAYERGETSFINALDJGARMOR = TRUE;
			Doc_SetMargins(ndocid,-1,30,20,275,20,1);
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"From 'Weapons of the dragon lord'.");
			Doc_PrintLines(ndocid,1,"To make an armor of dragon scales as hard as possible, the scales may be coated with the ore mined in the valley on the isle of Karynis.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"To make a blade worthy of a dragon lord, the blade should be steeped in dragon's blood. Even 5 phials of the blood can give the steel unequalled sharpness and strength.");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLines(ndocid,1,"Note: 'Karynis' probably refers to what is now known as Khorinis.");
			Doc_Show(ndocid);
		};
		if(FINALDRAGONEQUIPMENT_ONCE == TRUE)
		{
			b_say(hero,hero,"$BEZI_TO_WIE");
		}
		else
		{
			b_giveplayerxp(XP_FINALDRAGONEQUIPMENT);
			FINALDRAGONEQUIPMENT_ONCE = TRUE;
			b_say(hero,hero,"$BEZI_INTERES");
		};
	};
};

