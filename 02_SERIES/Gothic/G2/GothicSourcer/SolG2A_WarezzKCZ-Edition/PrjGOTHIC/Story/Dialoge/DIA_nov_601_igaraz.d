
instance DIA_IGARANZ_KAP1_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap1_exit_condition;
	information = dia_igaraz_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_HELLO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_hello_condition;
	information = dia_igaraz_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_igaraz_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_igaraz_hello_info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//What can I do for you, Brother?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//What can I do for you?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "I'm busy distributing sausages.";
};


func int dia_igaraz_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//I'm busy distributing sausages.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//So you work for Gorax, huh? All right, pass the sausage, then.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_IGARANZ_NOTWORK(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 3;
	condition = dia_igaraz_notwork_condition;
	information = dia_igaraz_notwork_info;
	permanent = FALSE;
	description = "Why aren't you working?";
};


func int dia_igaraz_notwork_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_notwork_info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Why aren't you working?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//I am permitted to study the teachings of Innos. I seek wisdom in his words.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//One day he will choose me - and then I shall take the test of magic and enter the Circle of Fire.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "Who are the Chosen?";
};


func int dia_igaraz_choosen_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_choosen_info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Who are the Chosen?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//The novices whom Innos has ordained to take the test of magic.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//He who passes it is accepted into the ranks of the Magicians of Fire.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"What is the Test of Magic?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"How can I be chosen?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//What is the Test of Magic?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//A test which is announced by the high council to all chosen novices.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//It is an assignment in which faith and cleverness are put to the test.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//All the chosen novices take part - but it is only possible for one of them to complete it successfully.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//How can I be chosen?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//You have no influence on that. Innos alone chooses his novices, and the High Council announces his will.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "How can I study the scriptures?";
};


func int dia_igaraz_studyinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (PARLAN_ERLAUBNIS == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_studyinnos_info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//How can I study the scriptures?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//You must gain access to the library.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//However, Master Parlan will only give you the key if you have first finished your duties.
};


instance DIA_IGARAZ_IMTHEMAN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_imtheman_condition;
	information = dia_igaraz_imtheman_info;
	important = TRUE;
};


func int dia_igaraz_imtheman_condition()
{
	if((Npc_GetDistToWP(self,"NW_LL_ADD_01") <= 3500) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_imtheman_info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(proudly) It has happened. Innos has chosen me and I shall take part in the test of magic.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "I'm in it, too...";
};


var int dia_igaraz_metoo_noperm;

func int dia_igaraz_metoo_condition()
{
	if((Npc_GetDistToWP(self,"NW_LL_ADD_01") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_metoo_info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//I'm in it, too - I demanded the Test of Fire.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//You did WHAT? So either you are a favorite of Innos, or completely crazy.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//I've already done a lot of crazy things, so I'm positive I can pull this off, too...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Innos holds his hand over me - therefore I shall pass this test.
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"Maybe we could work together...",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"So, found anything out yet?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"Have you seen Agon or Ulf?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//And, found out anything yet?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Since you stand no chance anyway, I may as well tell you:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Don't bother looking near the farms - there is nothing there that will get you anywhere.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Maybe we could work together...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Forget it. I'll accomplish this mission alone. You would just be a hindrance to me.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Have you seen Agon or Ulf?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//We split up at the inn. I went to the farms and those two set out together - but where to, I don't know.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "Do you know anything about a 'living rock'?";
};


func int dia_igaraz_add_condition()
{
	if(((Npc_GetDistToWP(self,"NW_LL_ADD_01") <= 3500) || (Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_06") <= 3500)) && (MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE) && (Npc_KnowsInfo(other,dia_igaraz_stein) == FALSE) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_add_info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Do you know anything about a 'living rock'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(cackling) No! Did Serpentes give you this test?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Yes, why?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//I think I can imagine what he means...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//You wouldn't be the first person to fail this test...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Where exactly can I find this living rock?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Just keep following this path. After quite a while, you'll come to a river.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Just continue to follow the path up the mountain. It's got to be up there someplace.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//When you come to a bridge, you've gone too far.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(laughs) IF you get that far in the first place...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//That's all I'm going to tell you...(sarcastic) It's supposed to be your TEST after all!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "Have you found out anything new?";
};


func int dia_igaraz_pruefung_condition()
{
	if((other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) < 1) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_pruefung_info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Have you found out anything new?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Not yet, but I'm still searching.
	AI_StopProcessInfos(self);
	if(IGARAZ_WAIT == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		IGARAZ_WAIT = TRUE;
	};
};


instance DIA_IGARAZ_STEIN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 1;
	condition = dia_igaraz_stein_condition;
	information = dia_igaraz_stein_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_igaraz_stein_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_stein_info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Hey, wait. We need to talk...
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//Actually, I don't think so...
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//I've waited years for this test. Innos is with me and I MUST pass this test.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//That sounds familiar.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//You're not the only one who says that.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Enough chatter. I need what you found. So, time for you to die!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_IGARANZ_KAP2_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap2_exit_condition;
	information = dia_igaraz_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP3_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap3_exit_condition;
	information = dia_igaraz_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_TALKABOUTBABO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_talkaboutbabo_condition;
	information = dia_igaraz_talkaboutbabo_info;
	permanent = FALSE;
	description = "We need to talk about Babo.";
};


func int dia_igaraz_talkaboutbabo_condition()
{
	if(MIS_BABOSDOCS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_igaraz_talkaboutbabo_info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//We need to talk about Babo.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(reserved) Yes, what's wrong?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "You've got something which belongs to Babo.";
};


func int dia_igaraz_babosbelongings_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_talkaboutbabo))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosbelongings_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//You've got something which belongs to Babo.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//What might that be?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//A few papers. Babo would like them back.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(mocking) He would, wouldn't he. I can imagine. Unfortunately, I prefer to keep them, which brings us to a bit of a dilemma.
};


instance DIA_IGARANZ_WHEREDOCS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_wheredocs_condition;
	information = dia_igaraz_wheredocs_info;
	permanent = FALSE;
	description = "Where have you got the papers?";
};


func int dia_igaraz_wheredocs_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_wheredocs_info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Where have you got the papers?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(smugly) Well, of course I don't have them on me. I'm afraid I can't help you further.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Where are they?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//I have them safely locked up. And you will never get the key from me.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "What was Babo supposed to do for you?";
};


func int dia_igaraz_babosjob_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosjob_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//What was Babo supposed to do for you?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//If I had known the baby would do it in his pants over a few swampweeds, then I would have seen to it that someone else took care of the monastery garden.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//He's supposed to grow swampweed?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Of course. Since none of that stuff comes out from behind the barrier anymore, the price in the city has tripled.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//It could have been a good bargain for everyone involved. But Babo didn't want to play along.
};


instance DIA_IGARANZ_PRICE(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_price_condition;
	information = dia_igaraz_price_info;
	permanent = FALSE;
	description = "How much do you want for the papers?";
};


func int dia_igaraz_price_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_price_info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//How much do you want for the papers?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(laughs) Ha, actually they're almost priceless. You very rarely see something like that here.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//But I have no desire to wager my future against a few gold pieces.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 gold pieces and you can do what you like with the papers.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "I want to buy those papers.";
};


func int dia_igaraz_buyit_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_price) && (Npc_HasItems(other,itmi_gold) >= 300))
	{
		return TRUE;
	};
};

func void dia_igaraz_buyit_info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//I want to buy those papers.
	if(Npc_HasItems(self,itke_igarazchest_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Look, I can't leave here right now. I'll give you the key to my chest, there's nothing else in there anyway.
		b_giveinvitems(other,self,itmi_gold,300);
		b_giveinvitems(self,other,itke_igarazchest_mis,1);
	}
	else
	{
		b_say(self,other,"$SpareMe");
		AI_StopProcessInfos(self);
	};
};


instance DIA_IGARAZ_PICKPOCKET(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 900;
	condition = dia_igaraz_pickpocket_condition;
	information = dia_igaraz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_KEY;
};


func int dia_igaraz_pickpocket_condition()
{
	if((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_igarazchest_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_igaraz_pickpocket_info()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_BACK,dia_igaraz_pickpocket_back);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_PICKPOCKET,dia_igaraz_pickpocket_doit);
};

func void dia_igaraz_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_igarazchest_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_igaraz_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_igaraz_pickpocket_back()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
};


instance DIA_IGARANZ_KAP4_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap4_exit_condition;
	information = dia_igaraz_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP5_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap5_exit_condition;
	information = dia_igaraz_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_PERM(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_perm_condition;
	information = dia_igaraz_perm_info;
	permanent = FALSE;
	description = "Have you got anything interesting for me?";
};


func int dia_igaraz_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF) && (MIS_BABOSDOCS != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_igaraz_perm_info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//Have you got anything interesting for me?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Ehm... no.
	AI_StopProcessInfos(self);
};

