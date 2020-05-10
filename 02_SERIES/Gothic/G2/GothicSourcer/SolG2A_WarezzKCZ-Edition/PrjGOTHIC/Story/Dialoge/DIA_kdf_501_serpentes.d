
instance DIA_SERPENTES_KAP1_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap1_exit_condition;
	information = dia_serpentes_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOTALK(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_notalk_condition;
	information = dia_serpentes_notalk_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_serpentes_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_notalk_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(scolding) You dare to address me, novice? Return to your work.
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,DIALOG_ENDE_V1,dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"I've got one more question...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//I've got one more question...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(furiously) You do not seem to want to understand. I decide when I see fit to talk to you. Who do you think you are?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//And now get back to work!
	AI_StopProcessInfos(self);
};

func void dia_serpentes_notalk_exit()
{
	AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_00");	//I've got to go!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_GOAWAY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_goaway_condition;
	information = dia_serpentes_goaway_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_goaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_notalk) && Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_goaway_info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//Your presence here demonstrates not only your lack of respect, but also your stupidity, novice!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "I heard that you passed the Test of Fire.";
};


func int dia_serpentes_yourstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_test) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,dia_pyrokar_magican) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_serpentes_yourstory_info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//I heard that you passed the Test of Fire.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//(smugly) In all humility, I can tell you this. Everyone else who has attempted this is dead.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(condescendingly) You really should not attempt to take this test. Your spirit is weak. Better to serve in the monastery and perhaps you will be chosen in a few years.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//I am going to pass the test.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//If it is the will of Innos, then you shall. But if not - then you will fail.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "I am ready to face your test, Master.";
};


func int dia_serpentes_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_test_info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//I am ready to face your test, Master.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//So, you want to put yourself to the test. Only a courageous novice demands the test. But courage is not all that you need.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//Are you clever enough to pass the test? Are you strong enough to meet the dangers that await you?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//If not, you will pay for it with your life.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//And now hear your test: In the Place of Stones, seek the one who was never born - find him who once was summoned.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//Overcome the one who cannot be overcome - measure yourself against the living rock, fight with the undying stone - and destroy it.
	Wld_InsertNpc(magicgolem,"FP_MAGICGOLEM");
	MAGIC_GOLEM = Hlp_GetNpc(magicgolem);
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"Serpentes has put me to the test. He wants me to 'find him who once was summoned', the living rock, and defeat it.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "What kind of a creature would that be?";
};


func int dia_serpentes_noidea_condition()
{
	if((MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_noidea_info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//Living rock...? What kind of a creature would that be?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//I have told you everything. (mockingly) Or do you find this test too difficult?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//Now you will learn what it means to take the Test of Fire - I will answer no more of your questions.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOHELP(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_nohelp_condition;
	information = dia_serpentes_nohelp_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_nohelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_noidea) && (Npc_IsDead(magic_golem) == FALSE) && (MIS_GOLEM == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,dia_ulthar_test) == FALSE) || Npc_KnowsInfo(other,dia_serpentes_yourstory)))
	{
		return TRUE;
	};
};

func void dia_serpentes_nohelp_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(contemptibly) Go and carry out your task, novice!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "I have defeated the golem.";
};


func int dia_serpentes_success_condition()
{
	if(Npc_IsDead(magicgolem) && (MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_success_info()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc(nov_608_garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//I have defeated the golem.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//What? You have actually done it? But without the hammer of Innos, you would never have been able to destroy the golem.
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(triumphantly) But now you have betrayed yourself! It was you who killed Garwig!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//RECEIVE THE PUNISHMENT FOR THE MURDER OF A SERVANT OF INNOS!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(regretfully) Nevertheless, I must admit that you have fulfilled the task I have given you.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//And I had best take the hammer myself.
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
		Wld_InsertItem(holy_hammer_mis,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_GOLEM);
};


instance DIA_SERPENTES_PERM(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 99;
	condition = dia_serpentes_perm_condition;
	information = dia_serpentes_perm_info;
	permanent = TRUE;
	description = "Is there anything else you want to tell me?";
};


func int dia_serpentes_perm_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_serpentes_success))
	{
		return TRUE;
	};
};

func void dia_serpentes_perm_info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//Is there anything else you want to tell me?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//No. Not at the moment, Brother.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//Dismissed. You know what you have to do.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP2_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap2_exit_condition;
	information = dia_serpentes_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP3_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap3_exit_condition;
	information = dia_serpentes_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_MINENANTEILE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 30;
	condition = dia_serpentes_minenanteile_condition;
	information = dia_serpentes_minenanteile_info;
	important = TRUE;
};


func int dia_serpentes_minenanteile_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_serpentes_minenanteile_info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//Not so fast. I have another task for you.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(sighs) And that is?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//Now that you belong to the Brotherhood of Fire, you must also fulfill the duties that come with being one of us.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//The church is not only concerned with the affairs of magic - it is also the final authority in the administration of justice, as you know.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//The latest case brought before opens up a bottomless abyss and must be dealt with once and for all.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"I've got enough on my plate as it is. Go find somebody else.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"What's this about?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"Isn't that the militia's business?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//A mercenary for hire of your stripe could be of use to us in this matter.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"I've got enough on my plate as it is. Go find somebody else.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"Whom should I kill?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//Isn't that the militia's business?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//The militia is responsible for the city alone. This affair has farther-reaching consequences.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//I've got enough on my plate as it is. Go find somebody else.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(angrily) That is outrageous. You will never reach the upper circles of magic if you are not willing to do the Brotherhood a service.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//I hereby reprimand you. I hope this will not happen again - else it will go badly with you.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//What's this about?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//There is someone in the city who has sold falsified shares in the ore mines of the former penal colony.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//These papers are utterly worthless and of no importance, really. Still, they have the potential of stirring up trouble among the people, which we cannot afford to happen right now.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//The swindler is supposed to have approached all the most reputable traders in the city and the country, and has evidently even managed to sell his counterfeit mining shares to some of them.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//Find this evildoer and bring him before this panel. In such hard times we must not suffer swindlers and plunderers.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//We must make an example of him in order to deter the rest of the mob.
	Info_AddChoice(dia_serpentes_minenanteile,"I shall try to clear up the matter.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//I shall try to clear up the matter.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//One thing more. When you visit those traders, do not let them know that you are looking for mining shares.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//I think they probably want to sell them on and certainly would no longer offer them to you if they realized that you are dealing with them on behalf of the church, you see?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//Yes.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//Then get to work. I wish you much success, Brother.
	Info_ClearChoices(dia_serpentes_minenanteile);
	MIS_SERPENTES_MINENANTEIL_KDF = LOG_RUNNING;
	if(Npc_IsDead(salandril) == FALSE)
	{
		CreateInvItems(salandril,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(vlk_416_matteo) == FALSE)
	{
		CreateInvItems(vlk_416_matteo,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_413_bosper) == FALSE)
	{
		CreateInvItems(vlk_413_bosper,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_409_zuris) == FALSE)
	{
		CreateInvItems(vlk_409_zuris,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_911_elena) == FALSE)
	{
		CreateInvItems(bau_911_elena,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		CreateInvItems(bau_970_orlan,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_407_hakon) == FALSE)
	{
		CreateInvItems(vlk_407_hakon,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_936_rosi) == FALSE)
	{
		CreateInvItems(bau_936_rosi,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_468_canthar) == FALSE)
	{
		CreateInvItems(vlk_468_canthar,itwr_minenanteil_mis,3);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 3;
	};
	SALANDRILVERTEILTEMINENANTEIL = SALANDRILMINENANTEIL_MAINCOUNTER;
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"Someone's selling illegal ore mine shares and enriching himself that way. I must find out who's been selling them to the merchants round here. Serpentes wants all those forged papers.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//Whom should I kill?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//For Innos' sake. No one, of course. This business demands a bit more finesse, you rude lout.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//Salandril, the alchemist from the upper end of town, is guilty of a serious crime and must be punished for it.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//However, he has refused to come to the monastery to be judged. Bring him here.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//How you accomplish this does not matter to us. You will, of course, be rewarded.
	Info_AddChoice(dia_serpentes_minenanteile,"Isn't that the militia's business?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"No problem. I'll take care of it.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//No problem. I'll take care of it.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//Good. We expect to hear from you in a few days.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"I'm to take Salandril, an alchemist from the upper quarter of Khorinis, to the monastery to be judged. I don't really care what he's supposed to have done, as long as I get paid.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "About the forged mine shares...";
};


func int dia_serpentes_minenanteilebringen_condition()
{
	if((MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_HasItems(other,itwr_minenanteil_mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int serpentesminenanteilcounter;

func void dia_serpentes_minenanteilebringen_info()
{
	var int serpentesminenanteilcount;
	var int xp_bringserpentesminenanteils;
	var int serpentesminenanteiloffer;
	var int serpentesminenanteilgeld;
	var string minenanteiltext;
	var string minenanteilleft;
	serpentesminenanteilcount = Npc_HasItems(other,itwr_minenanteil_mis);
	serpentesminenanteiloffer = 200;
	if(serpentesminenanteilcount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//I've been able to retrieve a mining share.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//I've been able to retrieve a few mining shares.
		b_giveinvitems(other,self,itwr_minenanteil_mis,serpentesminenanteilcount);
		xp_bringserpentesminenanteils = serpentesminenanteilcount * XP_BRINGSERPENTESMINENANTEIL;
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + serpentesminenanteilcount;
		b_giveplayerxp(xp_bringserpentesminenanteils);
	};
	SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER - serpentesminenanteilcount;
	minenanteilleft = IntToString(SALANDRILMINENANTEIL_MAINCOUNTER);
	minenanteiltext = ConcatStrings(minenanteilleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(minenanteiltext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	if(SERPENTESMINENANTEILCOUNTER < SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//Very good. You must remove them all from circulation. This is poison for the people. Bring them all to me.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//Here. I will give you the necessary means.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//Those were all, I think.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//Well done. You have earned a reward.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//Take this protective amulet. It will help you along the paths you have yet to tread.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//This is really the last one now, right?
	};
	serpentesminenanteilgeld = serpentesminenanteilcount * serpentesminenanteiloffer;
	CreateInvItems(self,itmi_gold,serpentesminenanteilgeld);
	b_giveinvitems(self,other,itmi_gold,serpentesminenanteilgeld);
};


instance DIA_SERPENTES_GOTSALANDRIL(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 32;
	condition = dia_serpentes_gotsalandril_condition;
	information = dia_serpentes_gotsalandril_info;
	description = "I know who brought those mining shares into circulation.";
};


func int dia_serpentes_gotsalandril_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_serpentes_gotsalandril_info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//I know who brought those mining shares into circulation. Salandril did, the alchemist from the upper quarter of town.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//Then bring him here. We have things to discuss with him.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_SALANDRILHERE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrilhere_condition;
	information = dia_serpentes_salandrilhere_info;
	description = "Salandril is here, in the monastery.";
};


func int dia_serpentes_salandrilhere_condition()
{
	if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,dia_serpentes_gotsalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
};

func void dia_serpentes_salandrilhere_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//Salandril is here, in the monastery.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//Well done. We shall deal with him later.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//Here is your reward. And not another word about this, understood?
		CreateInvItems(self,itmi_gold,400);
		b_giveinvitems(self,other,itmi_gold,400);
	};
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_SALANDRILINKLOSTER);
};


instance DIA_SERPENTES_SALANDRILDEAD(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrildead_condition;
	information = dia_serpentes_salandrildead_info;
	description = "Salandril is dead.";
};


func int dia_serpentes_salandrildead_condition()
{
	if((Npc_KnowsInfo(other,dia_serpentes_gotsalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))) && Npc_IsDead(salandril))
	{
		return TRUE;
	};
};

func void dia_serpentes_salandrildead_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//Salandril is dead.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//Well, then his deed has not gone unpunished. May Innos have mercy on his poor soul.
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_KAP4_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap4_exit_condition;
	information = dia_serpentes_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP5_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap5_exit_condition;
	information = dia_serpentes_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_PICKPOCKET(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 900;
	condition = dia_serpentes_pickpocket_condition;
	information = dia_serpentes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_serpentes_pickpocket_condition()
{
	return c_beklauen(86,380);
};

func void dia_serpentes_pickpocket_info()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_BACK,dia_serpentes_pickpocket_back);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_PICKPOCKET,dia_serpentes_pickpocket_doit);
};

func void dia_serpentes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_serpentes_pickpocket);
};

func void dia_serpentes_pickpocket_back()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
};

