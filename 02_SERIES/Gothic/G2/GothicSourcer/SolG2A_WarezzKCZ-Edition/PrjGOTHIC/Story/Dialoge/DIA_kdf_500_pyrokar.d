
instance DIA_PYROKAR_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_exit_condition;
	information = dia_pyrokar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_WELCOME(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_welcome_condition;
	information = dia_pyrokar_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_welcome_info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//So you're the new novice. Well, I assume you have already been given a task by Master Parlan.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(slightly reproachful) You know that everyone within the Community of the Fire must carry out his duty according to the will of Innos.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "I must talk to the paladins. It's urgent.";
};


func int dia_pyrokar_hagen_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_pyrokar_hagen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//I must talk to the paladins. It's urgent.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//And are you going to tell us why you want to talk to them?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//I've got an important message for them.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//What message would that be?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//An army of evil is assembling in the Valley of Mines, led by the dragons! We must stop them as long as we still can.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Hm. We shall ponder on your words, novice. When the time has come, we shall let you know what our council decided.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//In the meantime, you had better see to your duties as a novice.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Well, we don't want to keep you from your work any longer - you can go now.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_AUGE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_auge_condition;
	information = dia_pyrokar_auge_info;
	permanent = FALSE;
	description = "I'm looking for the Eye of Innos.";
};


func int dia_pyrokar_auge_condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_auge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//I'm looking for the Eye of Innos.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Anyone who thinks he could not only find the sacred amulet, but wear it as well, is a fool.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//The amulet itself chooses its bearer - no one save the one who is destined for it, will be able to wear it.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//I'd be willing to give it a try.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//The duty of a novice is to show humility - not desire.
	b_logentry(TOPIC_INNOSEYE,"I didn't think it would be quite so difficult, but Pyrokar won't hand over the Eye voluntarily and without the help of the paladins.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Well, we don't want to keep you from your work any longer - you may go now.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_PYROKAR_MISSINGPEOPLE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_addon_pyrokar_missingpeople_condition;
	information = dia_addon_pyrokar_missingpeople_info;
	description = "Some citizens of Khorinis have mysteriously disappeared.";
};


func int dia_addon_pyrokar_missingpeople_condition()
{
	if((SC_HEAREDABOUTMISSINGPEOPLE == TRUE) && (SKLAVEN_FLUCHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_pyrokar_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_00");	//Some citizens of Khorinis have mysteriously disappeared.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_01");	//That fact is known to me, and very regrettable. But we have agreed with the Water Mages that they shall handle this matter.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_02");	//The same is true for the investigation of the unusual earthquakes in the north-eastern regions of Khorinis.
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_03");	//So far, I have not received notice that our intervention would be required. Therefore, we are not going to take any steps in this matter.
	AI_Output(other,self,"DIA_Addon_Pyrokar_MissingPeople_15_04");	//Yes, but...
	AI_Output(self,other,"DIA_Addon_Pyrokar_MissingPeople_11_05");	//No buts! We shall proceed as we see fit, and I hope even YOU are going to respect that.
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"The Fire Magicians regret the loss of the citizens. However, they say that it is the task of the Water Mages. There's no help to be had here in the monastery.");
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_GOAWAY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_goaway_condition;
	information = dia_pyrokar_goaway_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_goaway_condition()
{
	if((Npc_KnowsInfo(hero,dia_addon_pyrokar_missingpeople) == FALSE) && (SC_HEAREDABOUTMISSINGPEOPLE == TRUE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_pyrokar_hagen) && Npc_KnowsInfo(hero,dia_pyrokar_auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_goaway_info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(annoyed) Obedience is a virtue you are still going to learn. One way or another.
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "I want to undergo the Test of Fire.";
};


func int dia_pyrokar_fire_condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_fire_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//I want to undergo the Test of Fire.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(surprised) So you know about... you want to pass the Test of Fire?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Yes, I refer to the Law of the Fire, which says...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(interrupts brusquely) We know the Law of the Fire. We have also seen many novices die during the test. You ought to reconsider this decision.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//Yes, I have. I want the test - and I am going to pass it.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(warning) If you absolutely insist, then the High Council will put you to the test.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//I insist on being given the Test of Fire.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//In that case - so be it. When you're ready, each magician from the High Council will give you a mission which you have to fulfill.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//May Innos have mercy on your soul.
	b_logentry(TOPIC_FIRECONTEST,"I demanded the Test of Fire from Pyrokar. Now I have to complete the three tasks the High Council sets for me.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "I am ready to face your test, Master.";
};


func int dia_pyrokar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_test_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//I am ready to face your test, Master.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//And only Innos alone knows whether you are going to pass it. You shall be put to the same test which is given to the chosen novices.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//The Test of Magic. (aloof) You probably know that only ONE of the novices can pass the test.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//I see. Who are my competitors, then?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//Innos in his wisdom has chosen three novices who are also going to be put through this test: Agon, Igaraz and Ulf. They have already started the search.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(curtly) But enough of that! Hear the words of the test: 'Follow the signs of Innos and bring us what the believer finds behind the path.'
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//You are going to need this key.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//That is all we have to say to you.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"Pyrokar is setting the Test of Magic for me. It's the same test that the chosen novices Ulf, Igaraz and Agon were set.");
	b_logentry(TOPIC_SCHNITZELJAGD,"I'm to follow the signs of Innos and 'bring what the believer finds behind the path'. He gave me a key too.");
	CreateInvItems(self,itke_magicchest,1);
	b_giveinvitems(self,other,itke_magicchest,1);
	b_startotherroutine(igaraz,"CONTEST");
	AI_Teleport(igaraz,"NW_LL_ADD_02");
	igaraz.aivar[AIV_DROPDEADANDKILL] = TRUE;
	igaraz.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(nov607,"EXCHANGE");
	b_startotherroutine(agon,"GOLEMDEAD");
	AI_Teleport(agon,"NW_MAGECAVE_RUNE");
	agon.aivar[AIV_DROPDEADANDKILL] = TRUE;
	agon.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(ulf,"SUCHE");
	AI_Teleport(ulf,"NW_TROLLAREA_PATH_42");
	ulf.aivar[AIV_DROPDEADANDKILL] = TRUE;
	ulf.aivar[AIV_NEWSOVERRIDE] = TRUE;
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNNING(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 20;
	condition = dia_pyrokar_running_condition;
	information = dia_pyrokar_running_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pyrokar_running_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",itmi_runeblank))
	{
		return TRUE;
	};
};

func void dia_pyrokar_running_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//As long as you are engaged with the test, we have nothing to tell you.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//What are you standing around here for? Go and face your test!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//The time has come to follow up your great words with deeds. Do you not think so, novice?
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_SUCCESS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_success_condition;
	information = dia_pyrokar_success_info;
	permanent = FALSE;
	description = "I found the runestone.";
};


func int dia_pyrokar_success_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",itmi_runeblank) && ((Npc_HasItems(other,itmi_runeblank) >= 1) || (Npc_HasItems(other,itru_firebolt) >= 1)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_success_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//I found the runestone.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(incredulously) You... did it?! You followed the signs and discovered the hidden portal...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... and I defeated all those monsters who had already marked me down as a snack.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//And the other novices, then? What about Agon? Did they not succeed before you?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//They have failed. I suppose they weren't destined to pass the test.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Well, then we declare that you have passed this test. And the runestone shall be yours to keep.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_SCHNITZELJAGD);
};


instance DIA_PYROKAR_TODO(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_todo_condition;
	information = dia_pyrokar_todo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_todo_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_todo_info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//You have passed the test which I set before you.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//But...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... you still have to pass Ulthar's test.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... you still have to complete the test for Serpentes.
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MAGICAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_magican_condition;
	information = dia_pyrokar_magican_info;
	permanent = FALSE;
	description = "Will I be accepted into the Magicians' Guild now?";
};


func int dia_pyrokar_magican_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_magican_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//Will I be accepted into the Magicians' Guild now?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//You did it. You have passed the Test of Fire. We were certain all along that you would succeed in doing this.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(insistent) Just as certain as we are that you will continue to give your best to become a WORTHY servant of Innos.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//So, if you are ready to swear the Oath of Fire, you shall be accepted into our ranks as a magician.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "I am ready to step into the Circle of Fire.";
};


func int dia_pyrokar_oath_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_magican) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_oath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//I am ready to step into the Circle of Fire.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Right, then swear the sacred Oath of Fire.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(solemnly) Do you swear, before Lord Innos the Almighty, his servants and the Holy Flame...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... that henceforth and forever, your very life shall be united with the fire...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... until your body and soul find rest in its sacred halls and the flame of your life dies away?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//I swear.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//By speaking the words of the oath, you have entered the pact with the fire.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Wear this robe as a token of the eternal bond.
	CreateInvItems(hero,itar_kdf_l,1);
	AI_EquipArmor(hero,itar_kdf_l);
	Mdl_ApplyOverlayMds(other,"Humans_Mage.mds");
	other.guild = GIL_KDF;
	Npc_ExchangeRoutine(lothar,"START");
	Npc_SetTrueGuild(other,GIL_KDF);
	FIRE_CONTEST = TRUE;
	Snd_Play("LEVELUP");
	KDF_AUFNAHME = LOG_SUCCESS;
	SLD_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_OBSOLETE;
	b_giveplayerxp(XP_BECOMEMAGE);
	b_startotherroutine(igaraz,"Start");
	b_startotherroutine(agon,"Start");
	b_startotherroutine(ulf,"Start");
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Now that you have been accepted into our ranks, you can talk to Lord Hagen, the high commander of the paladins.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//We are also very interested to hear how he assesses the situation. So you are free now to go to Khorinis.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//We expect you to bring us his answer immediately.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "What can I learn now?";
};


func int dia_pyrokar_lernen_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_pyrokar_lernen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//What all can I learn now?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//First of all, you are now entitled to learn about the Circles of Magic. They will give you the power to use the runes.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//The higher you rise through the six Circles of Magic, the stronger the spells become that you can work.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//You can learn the formulae from the brothers in the monastery. Each of them has specialized in a certain area which he will teach you.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//Karras, for example, is a master of invocation and summoning, and Hyglas will teach you the magic of fire.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//Nobody knows more about the powers of ice and thunder than Marduk. Parlan can teach you various other incantations - and he will initiate you into the first circles.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//But each of them will only teach you the formula - the runes you will have to create for yourself.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Master Parlan will ordain me to the first Circles of Magic.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brother Karras teaches formulas for invocations and summonings.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brother Hyglas can teach me the mysteries of the fire.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brother Marduk can teach me the powers of ice and thunder.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Brother Parlan teaches various other formulas.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "I'd like to express a wish...";
};


func int dia_pyrokar_wunsch_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wunsch_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//I'd like to express a wish...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//After he has been accepted, each magician has the right to his first act.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//So, what will your first act as a magician be?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"None.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Let Babo be the new monastery gardener.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Let the novice Opolos have access to the library.",dia_pyrokar_wunsch_opolos);
	};
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Let Dyrian stay in the monastery.",dia_pyrokar_wunsch_dyrian);
	};
};

func void dia_pyrokar_wunsch_nothing()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//None.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(astonished) So be it. The new magician foregoes his act.
	b_startotherroutine(dyrian,"NOFAVOUR");
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//Let the novice Dyrian stay in the monastery.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//So be it.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//The novice will be allowed to remain in the monastery, and he will fill the position of gardener which is now vacant.
	b_giveplayerxp(XP_HELPDYRIAN);
	b_startotherroutine(dyrian,"FAVOUR");
	MIS_HELPDYRIAN = LOG_SUCCESS;
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_babo()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//Let the novice Babo be head of the monastery gardens.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//So be it.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//Effective immediately, the novice Babo will be in charge of the monastery gardens.
	b_giveplayerxp(XP_HELPBABO);
	b_startotherroutine(babo,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPBABO = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_opolos()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//Let the novice Opolos have access to the library.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//So be it.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//From now on, the novice Opolos will study the scriptures of Innos.
	b_giveplayerxp(XP_HELPOPOLOS);
	b_startotherroutine(opolos,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPOPOLOS = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};


instance DIA_PYROKAR_NACHRICHT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_nachricht_condition;
	information = dia_pyrokar_nachricht_info;
	permanent = FALSE;
	description = "I carry news of Lord Hagen...";
};


func int dia_pyrokar_nachricht_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pyrokar_nachricht_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//I carry news of Lord Hagen. He wants proof for the presence of the dragons and the army of evil.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//So I shall go down to the Valley of Mines and get him his proof.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Good. You will follow this order, then. The paladin Sergio is to escort you to the pass.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//May Innos protect you.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//So I headed right down to the Valley of Mines.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Good. Since you already know the way to the valley, you are not going to need an escort.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Take care of this matter for Lord Hagen - may Innos protect you.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me the last Circle of Magic.",b_getlearncosttalent(other,NPC_TALENT_MAGE,6));
};


func int dia_pyrokar_teach_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Teach me the last Circle of Magic.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//A lot of time has passed since you have entered the bond with the fire. Much has happened, and we find no rest.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//You are the Chosen of Innos. Therefore you will need all your strength to prevail in your battles.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//I shall now consecrate you, Chosen One. You are entering the sixth Circle - may you bring light and disperse the darkness.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//You can now learn the magic formulae for the last circle from me, if you so desire.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Oh - and one more thing. It took me a while to recognize you.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//You got that letter from me back when they threw you into the Barrier.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Yes, you spared me the judge's blathering that way.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//And you are the Chosen of Innos.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Receive now my blessing, oh Chosen One!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Innos, light of the sun and fire of the world, bless this man, your chosen servant.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Give him courage, strength, and wisdom to follow the path which you have ordained for him.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//The time for this has not yet come. Once you have walked a little farther on the path that Innos will show you, I shall instruct you.
	};
};


instance DIA_PYROKAR_SPELLS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_spells_condition;
	information = dia_pyrokar_spells_info;
	permanent = TRUE;
	description = "Instruct me (create runes)";
};


func int dia_pyrokar_spells_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_spells_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Instruct me.
	Info_ClearChoices(dia_pyrokar_spells);
	Info_AddChoice(dia_pyrokar_spells,DIALOG_BACK,dia_pyrokar_spells_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_FIRERAIN)),dia_pyrokar_spells_firerain);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_BREATHOFDEATH)),dia_pyrokar_spells_breathofdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_MASSDEATH)),dia_pyrokar_spells_massdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_SHRINK)),dia_pyrokar_spells_shrink);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//There is nothing more that I could teach you.
	};
};

func void dia_pyrokar_spells_back()
{
	Info_ClearChoices(dia_pyrokar_spells);
};

func void dia_pyrokar_spells_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_pyrokar_spells_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_pyrokar_spells_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_pyrokar_spells_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


instance DIA_PYROKAR_PARLAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_parlan_condition;
	information = dia_pyrokar_parlan_info;
	permanent = FALSE;
	description = "Parlan sent me...";
};


func int dia_pyrokar_parlan_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && (PARLAN_SENDS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_parlan_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Parlan sent me. I want to increase my magic powers.
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Well, you have learned a lot, and your strength has grown. From now on, you will learn from me.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "I want to increase my magic powers.";
};


func int dia_pyrokar_teach_mana_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && Npc_KnowsInfo(hero,dia_pyrokar_parlan))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//I want to increase my magic powers.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//I can feel that the magic power flows through you well and truly. Even I cannot show you how you could increase it further.
	};
	Info_ClearChoices(dia_pyrokar_teach_mana);
};

func void dia_pyrokar_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_ULTRA);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_ULTRA);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_pyrokar_teach_mana_5);
};


instance DIA_PYROKAR_PERM(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_perm_condition;
	information = dia_pyrokar_perm_info;
	permanent = TRUE;
	description = "(Blessing)";
};


func int dia_pyrokar_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pyrokar_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Bless me, Master.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//What about a little blessing? I could surely use it.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//May your final battle against our archenemy be crowned with success. Innos be with you.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//May Innos stand between you and harm on all the unholy paths you will have to walk.
	};
};


instance DIA_PYROKAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap3_exit_condition;
	information = dia_pyrokar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_BACKFROMOW(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_backfromow_condition;
	information = dia_pyrokar_backfromow_info;
	description = "I've come from the old Valley of Mines.";
};


func int dia_pyrokar_backfromow_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_backfromow_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//I've come from the old Valley of Mines.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//What do you have to report?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//The enemy has formed up there with an army of orcs and dragons.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//We have already learned that from Milten - but what about the king's shipment of ore?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//The mine they are digging for Garond in the valley cannot satisfy the demands of the king.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//The days are becoming grayer, and the light of the sun is ever weaker.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//I was attacked by men in black robes.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//I know. Those are the Seekers. Henchmen from the nether realms of Beliar. Beware of them. They will try to take possession of you.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Once possessed, you will no longer be yourself. Only here in the monastery could you find help then. So be careful.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar told me about the Seekers, men in black robes who are henchmen of Beliar. He warned me that they can possess you. I'm to go straight back to the monastery if that should ever happen to me.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//I have asked Karras to look into this matter. He will certainly win some further insights soon which can make us see clearer.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar has instructed Karras to deal with the threat of the Seekers.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//Here - this rune will bring you directly back to the monastery if you need our help.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Remember, we must offer resistance, or we shall all be doomed.
};


instance DIA_PYROKAR_GIVEINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 31;
	condition = dia_pyrokar_giveinnoseye_condition;
	information = dia_pyrokar_giveinnoseye_info;
	description = "I have come to take the Eye of Innos.";
};


func int dia_pyrokar_giveinnoseye_condition()
{
	if((KAPITEL == 3) && Npc_HasItems(other,itwr_permissiontowearinnoseye_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//I have come to take the Eye of Innos.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//I see that you have received an authorization from Lord Hagen himself to bear the Eye of Innos.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//I am afraid that I have to disappoint you. We have fallen victim to a treacherous plot of the enemy.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//The Eye of Innos has been violently taken from these sacred walls.
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Who could be so impudent, Master?",dia_pyrokar_giveinnoseye_wer);
	}
	else
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Who did this?",dia_pyrokar_giveinnoseye_wer);
	};
};

func void dia_pyrokar_giveinnoseye_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Who could be so impudent, Master?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Who did this?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Evil is cunning and usually works in secret. Only rarely do you see it emerge to pursue its evil machinations in broad daylight.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//But these days, it's a different matter. The enemy now shows himself openly in the street, in every home and every public square.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//This can only mean that he no longer fears any adversary, and is not going to shrink back from anything.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//One of our most faithful followers, a candidate for the high robe of the Magicians of Fire, has changed his allegiance unexpectedly, and in an alarmingly evil manner. Pedro.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//The enemy has taken possession of him, thus inflicting a terrible defeat upon us.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Pedro has forced his way into our most sacred halls, and stolen the Eye.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//I fear that he simply spent too much time by himself, outside of the gates and thus beyond the protective walls of the monastery, exposed to all lurking dangers.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"Great. I might have known. I'm too late, those numskulls at the monastery let some novice steal the Eye from them, and now I can go running after the traitor Pedro and just hope he doesn't go and sell it to someone.");
	b_logentry(TOPIC_TRAITORPEDRO,"The traitor Pedro stole the Eye of Innos from the monastery. I reckon the Fire Magicians would be only too happy to get their hands on him.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "Where did the thief flee to?";
};


func int dia_pyrokar_novizenchase_condition()
{
	if((KAPITEL == 3) && (PEDRO_TRAITOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_novizenchase_info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Where did the thief flee to?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Pedro knocked down some of the other novices who tried to stop him, and disappeared into the morning mist.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//Many novices have gone after him to bring the Eye back to its place unharmed.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//If you want to catch up to them, you need to hurry before Pedro disappears out of your reach.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "I have found the Eye of Innos.";
};


func int dia_pyrokar_foundinnoseye_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_foundinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//I have found the Eye of Innos. It's broken.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//But... that cannot be. What happened?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Some really nasty customers had it. Anyway, I came too late.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//They were performing a strange incantation on a crescent-shaped ritual site up in those woods.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Innos be with us. They have desecrated our Circle of the Sun.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//Even in my worst nightmares I could never have imagined they would possess this kind of power.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"What can we do now?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//What can we do now?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//The enemy has become very strong. Still, this ancient artifact meant a powerful threat to him.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//We must heal the Eye and restore its old power. But time works against us.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//I cannot begin to imagine what is now going to become of us all. Without the protection of the Eye, we are helplessly at the mercy of the enemy.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Go to Vatras, the Water Mage in town. In this terrible situation, only he will know what is to be done. Take the Eye to him, and hurry.
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"Why Vatras?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"What is the Circle of the Sun?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"Pyrokar wants me to ask the Water Mage Vatras in town for advice on what to do with the damaged Eye.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Why Vatras?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//The privilege of the robe does not authorize you to question my instructions, Brother.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Vatras is a servant of Adanos. The knowledge of the Water Mages alone will bring us clarity in this dark hour.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//That is all you need to know.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//What is the Circle of the Sun?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Every year, all the magicians and novices of the monastery travel to this place at the time of the solstice to mark the beginning of a new cycle.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//The place is filled with the immeasurable power of the sun.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//Never have I entertained the slightest notion that its power could be reversed. And yet that is what happened.
};

func void dia_pyrokar_foundinnoseye_weiter()
{
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
};


instance DIA_PYROKAR_SPOKETOVATRAS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_spoketovatras_condition;
	information = dia_pyrokar_spoketovatras_info;
	description = "I have talked to Vatras.";
};


func int dia_pyrokar_spoketovatras_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_spoketovatras_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//I have talked to Vatras.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//Ah, good. Where is he?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//He's preparing a ritual at the Circle of the Sun in order to heal the Eye of Innos.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//If that is true, then maybe there is hope after all.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Vatras wants Xardas and you to help him with that.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//WHAT? Xardas will be there, too? You cannot be serious.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//Hey. This wasn't my decision. Vatras insists.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//It is always that Xardas. I am tired of it. Things could hardly get any worse.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//So how do I know that Xardas is not in league with the enemy?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//I cannot trust Xardas, no matter how much we may need him.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//I am sorry, but I cannot help Vatras under these circumstances.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PYROKAR_XARDASVERTRAUEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_xardasvertrauen_condition;
	information = dia_pyrokar_xardasvertrauen_info;
	description = "It can't be done without you...";
};


func int dia_pyrokar_xardasvertrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_spoketovatras) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_xardasvertrauen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//It can't be done without you. Vatras wouldn't be able to perform the ritual otherwise.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//You will have to trust Xardas.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//There is nothing that I have to do, you hear? I do not have the slightest proof that Xardas is not working against us. I cannot do this.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//What if I could bring you some proof?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//That is impossible, I fear. It would really have to impress me.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//As far as Xardas is concerned, I have my doubts whether he can still impress me at all.
	b_logentry(TOPIC_INNOSEYE,"Pyrokar gets cold feet when he thinks of Xardas. I'm going to have to discuss with Xardas how to get him to come to the ritual at the Circle of the Sun.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "I brought this book from Xardas.";
};


func int dia_pyrokar_buchzurueck_condition()
{
	if(Npc_HasItems(other,itwr_xardasbookforpyrokar_mis) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchzurueck_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//I brought this book from Xardas.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//It's a token of his trust.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Show me.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(amazed) But this is incredible. Do you have even the slightest notion what it is that you just gave me?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Ehm. No.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(irritated) This is an ancient, long-lost tome from days gone by.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//We all thought that it was lost for good, and now I learn that Xardas knew all along what had become of it.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//So will you be there for the ritual?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Yes, I shall depart for the Circle of the Sun, but certainly not because I am convinced of Xardas' good intentions.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//In fact, I am going to make this jackal explain where he has kept the book hidden for so many years. He has definitely gone too far this time.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//I shall see you at the Circle of the Sun.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"Pyrokar has finally agreed to go to the Circle of the Sun.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "Do you think you can patch up the Eye again?";
};


func int dia_pyrokar_preritual_condition()
{
	if((PYROKAR_GOESTORITUALINNOSEYE == TRUE) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_preritual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Do you think you can patch the Eye up again?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Hard to say. Let us wait and see.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "You did it. The Eye of Innos is healed.";
};


func int dia_pyrokar_augegeheilt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_augegeheilt_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//You did it. The Eye of Innos is healed.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//I would hardly have believed it possible.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//Yes, Master.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//You have proven many times over that you are ready for the High Order of the Fire Magicians.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//As of today, you are a member of the Council and will represent our order in the world. You are now one of the high Fire Magicians.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//Wear the high robe with dignity and bring the order honor and wealth, my brother.
		CreateInvItem(hero,itar_kdf_h);
		AI_EquipArmor(hero,itar_kdf_h);
		HEROGIL_KDF2 = TRUE;
	};
};


instance DIA_PYROKAR_KAP3_READY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_kap3_ready_condition;
	information = dia_pyrokar_kap3_ready_info;
	description = "What remains to be done here?";
};


func int dia_pyrokar_kap3_ready_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_pyrokar_augegeheilt))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_ready_info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//What remains for me to do here?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Do not waste your time on trivial things. Go and vanquish the dragons. Here, take the Eye.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Bear in mind that you need to talk to a dragon first before you can attack it.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//The power of the Eye will force the dragons to speak to you and tell the truth.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Furthermore, it offers protection against their attacks when you wear it.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//However, its power does not last. You will have to fill it up again with magical energy.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//To do that, you need the essence of a dragon's heart which you join with the Eye at an alchemist's bench.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Only then can you dare face another dragon.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Thanks. I'll remember that.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//You now have everything you need. Go, then. You do not have much time left.
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"I am now ready to face the dragons. The Eye of Innos will aid me to destroy them. But I must not forget to wear it when entering into battle with the beasts. I must speak to the dragons before I stand a chance against them. The trouble is that the Eye loses power every time I speak to one of them. I need the heart of a dragon and an empty laboratory flask to bring the weakened stone of the amulet and the extract of a dragon's heart together on an alchemist's bench before facing another dragon.");
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PYROKAR_BUCHDERBESSENEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 39;
	condition = dia_pyrokar_buchderbessenen_condition;
	information = dia_pyrokar_buchderbessenen_info;
	description = "I have found a strange almanac.";
};


func int dia_pyrokar_buchderbessenen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_backfromow) && Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};


var int almanachcounter;

func void dia_pyrokar_buchderbessenen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//I have found a strange almanac.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Really? What kind of an almanac is that?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//I'm not sure. I thought you would know what to do with it.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//Forsooth, that is very disquieting. I am glad that you brought it to me. That was very wise.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//I assume that there are more of these. Go and find more of these books of damnation.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//I suspect that it is an instrument of the Seekers' power.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//They use it to control the lost souls of their victims.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//They obviously write down the names of those whom they are planning to possess in these books.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//Listen. I am giving you this magical letter. It will show you the names which are written in the books.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Find those victims and bring me their books. I shall dispose of them.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//But first, you ought to show at least one of them to Karras. Maybe that will help him in his studies.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//Do not make the mistake to try and destroy them yourself. You are not yet ready to withstand their power.
		b_logentry(TOPIC_DEMENTOREN,"Pyrokar wants to render the Almanacs of the Possessed harmless. He has given me a list of all those the Seekers plan to possess. There may be more names on Pyrokar's list later on.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Do not get to close to the Seekers, or they will take possession of you.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//If you still find yourself unable to resist their call, come back to me as fast as you can.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Only here in the monastery can your soul be saved.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//Is there no protection against their mental attacks?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//That is possible. Karras could know something about that.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Karras is supposed to help me find a protection against the Seekers' mental assaults.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(Heal possession)";
};


func int dia_pyrokar_scobsessed_condition()
{
	if(SC_ISOBSESSED == TRUE)
	{
		return TRUE;
	};
};


var int got_healobsession_day;

func void dia_pyrokar_scobsessed_info()
{
	if(((GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2)) || (GOT_HEALOBSESSION_DAY == 0)) && (Npc_HasItems(other,itpo_healobsession_mis) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Heal me, Master, for I am possessed.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//So be it! Take this potion. It will relieve you of your nightmares.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//May the mercy of Innos be your salvation.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Act on his behalf and beware of the evil eye of the enemy.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//But be forewarned - if you expose yourself to their power too often, at some point there will be no turning back for you. Always remember that.
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//I think I am possessed. Can you heal me?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//Not without a token of your respect for this monastery, my son. 300 gold coins.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"That's too much.",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"Great. Here's the money.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//But you only just had your healing potion. Don't come back to me until you really need my help.
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Great. Here's the money.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Here, drink this. May the mercy of Innos be your salvation.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Bring me the money, and you will be helped.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//That's too much.
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "I can tell you even more about those possessed.";
};


func int dia_pyrokar_almanachbringen_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pyrokar_buchderbessenen))
	{
		return TRUE;
	};
};


var int dia_pyrokar_almanachbringen_onetime;

func void dia_pyrokar_almanachbringen_info()
{
	var int almanachcount;
	var int xp_kdf_bringalmanachs;
	var int almanachgeld;
	var int pyrokarsalmanachoffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//I can tell you even more about those possessed.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Speak, Brother.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//I have found another almanac.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//I've got even more books of the Seekers for you.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//That is good. I am afraid, however, that there are more of these to find. Go on searching.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Many have been found already. But I do not think that we have all of them.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//You have already brought me a great number of the enemy's books.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//I should be surprised if they had many more in circulation.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Take this. It is a gift from the monastery which will help you when you face evil.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//And remember to have a look in my magic letter once in a while.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//It is possible that they may try the same on others whose names were not yet found in the almanacs.
		DIA_PYROKAR_ALMANACHBRINGEN_ONETIME = TRUE;
	};
	almanachgeld = almanachcount * pyrokarsalmanachoffer;
	CreateInvItems(self,itmi_gold,almanachgeld);
	b_giveinvitems(self,other,itmi_gold,almanachgeld);
};


instance DIA_PYROKAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap4_exit_condition;
	information = dia_pyrokar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap5_exit_condition;
	information = dia_pyrokar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_DRACHENTOT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_drachentot_condition;
	information = dia_pyrokar_drachentot_info;
	description = "All the dragons are dead.";
};


func int dia_pyrokar_drachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_drachentot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//All the dragons are dead.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//That is good news indeed. But it does nothing to change our situation, which seems hopeless.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//The Seekers still have not left. On the contrary. I hear more and more reports that, during these last few days, their numbers have even increased.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Killing off the dragons has dealt the enemy a blow, but it did not suffice. We need to dig this evil out by the roots.
};


instance DIA_PYROKAR_DERMEISTER(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_dermeister_condition;
	information = dia_pyrokar_dermeister_info;
	description = "I talked to the dragons.";
};


func int dia_pyrokar_dermeister_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_dermeister_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//I talked to the dragons.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//What did they say?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//They kept talking about the power of their master, and how he settled in the Halls of Irdorath.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Innos be with us. The Black Temple has regained its power and is now sending its henchmen into our world.
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "What are these halls of Irdorath?";
};


func int dia_pyrokar_wasistirdorath_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(other,dia_pyrokar_dermeister))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wasistirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//What are these halls of Irdorath?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//The eastern invocation temple of the god Beliar. There are four of them in the land of Myrtana. But this one is probably the most terrifying temple of all.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//About 40 years ago, the northern and western temples of this horrible deity were destroyed.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//The brave knights of that time gave their all to raze those mighty constructions to the ground.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Back then, the black hordes of the enemy were helpless against the superior numbers and the heroic courage of the knights and paladins.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//It would have been easy to destroy the other two temples as well and rid the land of evil forever...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... but after the second temple fell, they simply disappeared.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(mocking) Disappeared. An entire temple. Yeah, right.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Do not mock me. The situation is serious. If the Halls of Irdorath have indeed regained their power, then it will not be easy to defeat the enemy.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//For that, you would have to find it first, and I think that this will be your next, and hardest, task.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//We shall see.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"According to Pyrokar, the Halls of Irdorath are a lost invocation temple of the god Beliar. I must find that temple.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "Xardas' book which was believed to be lost - where is it?";
};


func int dia_pyrokar_buchirdorath_condition()
{
	if((KAPITEL == 5) && (ITWR_HALLSOFIRDORATHISOPEN == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_wasistirdorath))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Xardas' book which was believed to be lost - where is it?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//I have been expecting you would ask that. But I fear that it will be of no help to you.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//It has been magically sealed. I took it to one of our lower vaults, and even we have so far tried in vain to open it.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//That accursed Xardas has played a dirty trick on us.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Can I see the book?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Be my guest. I cannot imagine you being successful where the greatest masters of our monastery have failed.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//But go ahead and give it a try, Talamon is not going to stop you.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Xardas' book THE HALLS OF IRDORATH is in the lower vaults of the monastery. Talamon is guarding it. The magicians could not open it. It's been magically sealed and Xardas is said to be responsible.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "I've been able to open Xardas' book.";
};


func int dia_pyrokar_irdorathbookopen_condition()
{
	if((ITWR_HALLSOFIRDORATHISOPEN == TRUE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_irdorathbookopen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//I've been able to open Xardas' book.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//What? How did you do that? It well-nigh drove me to despair.
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Xardas told me the trick.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Just dumb luck, I suppose.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Just dumb luck, I suppose.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Don't talk nonsense. Luck!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//When not even I succeed in opening the book, and then someone like you comes waltzing in...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... that gives me something to ponder about.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//Anyway. Since you were obviously the only one who was able to open the book, then may it be granted unto you to carry it. At least until we have weathered this crisis.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Xardas told me the trick.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Ah, is that it. How interesting. I can only hope for you that Xardas' bad influence is not going to spoil you.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//I am warning you. Do not fall for the tricks of that old devil. You might come to regret it.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "The book mentions a secret library.";
};


func int dia_pyrokar_geheimebibliothek_condition()
{
	if((ITWR_SCREADSHALLSOFIRDORATH == TRUE) && (KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_geheimebibliothek_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//The book mentions a secret library.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//Whatever are you talking about?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//A library beneath these walls here. Does that ring a bell?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//No. Where is that library supposed to be, did you say?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//I see. You have no idea. Mmh.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Pyrokar doesn't know anything about the secret library. It seems only Xardas ever had access to it.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "I know where to find the Halls of Irdorath.";
};


func int dia_pyrokar_scknowswaytoirdorath_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scknowswaytoirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//I know where to find the Halls of Irdorath.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//The temple is on an island. I've found a nautical chart which shows the way.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//That is great. Then you will need a ship and a crew in order to face the enemy.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//But remember you need to be well prepared if you want to vanquish the Master of Irdorath.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Where can I find a crew?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Your crew should consist of men you can trust.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Talk to your friends and think about who could be useful to you once you are on the island.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//You are going to need a magician as well. But alas, I cannot spare a single man from the monastery.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//You will have to ask a magician who is not working within the monastery.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "Jorgen is an experienced sailor.";
};


func int dia_pyrokar_scwilljorgen_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_pyrokar_scknowswaytoirdorath) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scwilljorgen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Jorgen is an experienced sailor. He could help me get to the Isle of Irdorath.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//That will not be so easy, I fear.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//He has signed on to work for the brotherhood. He has neither paid the tribute, nor brought us a sheep.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Jorgen must finish his work first, then you can take him if you like.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//How long will it take?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//He used up the provisions which would have lasted a novice three weeks, and all on the first day.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//So I cannot let him go before he has worked hard in our gardens for three months.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "What do I have to do so I can take Jorgen with me NOW?";
};


func int dia_pyrokar_machdtfrei_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_scwilljorgen) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_machdtfrei_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//What do I have to do so I can take Jorgen with me NOW?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Mmh. There is indeed one thing you could do for me. Your good rapport with Xardas could help you with that.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//It has come to my attention that, during these last few days, strange things have been going on in his tower.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Many of the town people hear loud screams at night coming from there, and see strange lights dancing over his tower.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//As if we didn't have our plate full already. Go check what is going on there, and make it stop.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Then you can have Jorgen.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"Strange things happen in Xardas' tower. If I take care of it, I can take Jorgen with me.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "The thing with Xardas' tower has resolved itself.";
};


func int dia_pyrokar_dtcleared_condition()
{
	if(Npc_IsDead(xardas_dt_demon1) && Npc_IsDead(xardas_dt_demon2) && Npc_IsDead(xardas_dt_demon3) && Npc_IsDead(xardas_dt_demon4) && Npc_IsDead(xardas_dt_demon5) && Npc_IsDead(xardas_dt_demonlord) && (MIS_PYROKARCLEARDEMONTOWER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pyrokar_dtcleared_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//The thing with Xardas' tower has resolved itself.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//So what was going on... no, wait, I do not even want to know.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//If you still want Jorgen, then go ahead and take him on your journey.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//May Innos protect you.
	MIS_PYROKARCLEARDEMONTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_PYROKARCLEARDEMONTOWER);
};


var int pyro_gives_aura;

instance DIA_PYROKAR_AMULETTOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_amulettofdeath_condition;
	information = dia_pyrokar_amulettofdeath_info;
	permanent = TRUE;
	description = "The prophesy mentions the sacred Aura of Innos.";
};


func int dia_pyrokar_amulettofdeath_condition()
{
	if((PLAYERGETSAMULETTOFDEATH == TRUE) && (PYRO_GIVES_AURA == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_amulettofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//The prophesy mentions the sacred Aura of Innos.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//The Aura of Innos is an amulet which only the greatest magicians of an era are destined to wear.
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
	Info_AddChoice(dia_pyrokar_amulettofdeath,DIALOG_BACK,dia_pyrokar_amulettofdeath_back);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Can I have it?",dia_pyrokar_amulettofdeath_canhaveit);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"What sort of amulet is that?",dia_pyrokar_amulettofdeath_amulett);
};

func void dia_pyrokar_amulettofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
};

func void dia_pyrokar_amulettofdeath_canhaveit()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Can I have it?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//What? What do you want to do with that?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Go up against the dragon.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Yes, of course. I shall give you the amulet, but handle it with care.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Yeah, sure.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//I do not wish to have to buy it back from a merchant later.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//Use it well, and may Innos guard you at all times.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//What sort of amulet is that?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//They say that Innos himself forged it and gave it as a present to humankind.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//It protects the one who wears it from all kinds of damage.
};


instance DIA_PYROKAR_POTIONOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_potionofdeath_condition;
	information = dia_pyrokar_potionofdeath_info;
	permanent = TRUE;
	description = "What are the Tears of Innos?";
};


func int dia_pyrokar_potionofdeath_condition()
{
	if(Npc_HasItems(other,itpo_potionofdeath_01_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_potionofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//What are the Tears of Innos?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//The Tears of Innos are nothing but an old children's story. It tells of how the battle between Innos and Beliar started at the beginning of time.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"I see.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"I found this potion.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//I see.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//I do not know whether you are fully aware of our situation, but I hardly believe that our enemy can be vanquished through an old children's tale.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//I found this potion.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//That cannot be. I cannot believe it.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//What's the matter?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//If these are really the genuine Tears of Innos, then...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(interrupts) Hardly.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Do not interrupt me. If these are the real Tears of Innos, then we have a powerful weapon against the enemy.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"So what are the Tears of Innos?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"What do you mean by 'weapon'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//So what are the Tears of Innos?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//When Innos realized that he had to fight Beliar, his own brother, in order to preserve creation, his sorrow was great.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//He started to weep, and his tears fell down onto the world. There were many of them, for his heart was so full of grief that he wept for 13 years.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Get to the point.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//The people who found his tears and tasted them were filled with supernatural strength and clarity. They recognized the wisdom of Innos' creation and began to serve him.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//They were the first members of the Community of the Fire. The tears gave them strength, courage and wisdom. But that is all very long ago, and it has been more than 250 years since anyone last set eyes on a Tear of Innos.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//What do you mean by 'weapon'?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Legend has it that, under the influence of this substance, the warriors of Innos were able to perform almost superhuman deeds.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//They were immune to all kinds of exhaustion and had the strength of two bears.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//The greatest heroic feats of the olden days were only made possible by the Tears of Innos.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//I understand.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//But the tears can bring suffering and death as well. Only the members of our order may drink this draught.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Anyone else - even the paladins of our Lord - would face a cruel death.
	Npc_RemoveInvItems(hero,itpo_potionofdeath_01_mis,1);
	CreateInvItems(hero,itpo_potionofdeath_02_mis,1);
};


instance DIA_PYROKAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap6_exit_condition;
	information = dia_pyrokar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_PICKPOCKET(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_pickpocket_condition;
	information = dia_pyrokar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_pyrokar_pickpocket_condition()
{
	return c_beklauen(108,550);
};

func void dia_pyrokar_pickpocket_info()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_BACK,dia_pyrokar_pickpocket_back);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_PICKPOCKET,dia_pyrokar_pickpocket_doit);
};

func void dia_pyrokar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

func void dia_pyrokar_pickpocket_back()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

