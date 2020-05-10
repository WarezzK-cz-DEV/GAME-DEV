
func void b_kommmit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Come with me!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//I don't need you to make a fool out of myself.
};

func void b_biffsanteil_berechnung()
{
	var int momentankohle;
	var int ueberschusskohle;
	momentankohle = Npc_HasItems(hero,itmi_gold);
	ueberschusskohle = momentankohle - DJG_BIFF_SCGOLD;
	BIFFSANTEIL = ueberschusskohle / 2;
};

func void b_biffsanteil_printscreen()
{
	var string biffsanteiltext_teil;
	var string biffsanteiltext;
	var string anteil;
	anteil = IntToString(BIFFSANTEIL);
	biffsanteiltext_teil = ConcatStrings(PRINT_BIFFSANTEIL,anteil);
	biffsanteiltext = ConcatStrings(biffsanteiltext_teil,PRINT_BIFFGOLD);
	AI_PrintScreen(biffsanteiltext,-1,45,FONT_SCREENSMALL,4);
};

func void b_biff_setrefusetalk()
{
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		Npc_SetRefuseTalk(biff,1000);
	}
	else
	{
		Npc_SetRefuseTalk(biff,600);
	};
};


instance DIA_BIFF_EXIT(C_INFO)
{
	npc = djg_713_biff;
	nr = 999;
	condition = dia_biff_exit_condition;
	information = dia_biff_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_exit_condition()
{
	return TRUE;
};

func void dia_biff_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_HALLO(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_hallo_condition;
	information = dia_biff_hallo_info;
	description = "What are you doing here?";
};


func int dia_biff_hallo_condition()
{
	return TRUE;
};

func void dia_biff_hallo_info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//That is truly the stupidest question I have heard in a long time. What does it look like?
	Info_AddChoice(dia_biff_hallo,"I can't tell anything from that idiotic face you're making.",dia_biff_hallo_spott);
	Info_AddChoice(dia_biff_hallo,"I haven't a clue.",dia_biff_hallo_keineahnung);
	Info_AddChoice(dia_biff_hallo,"Never mind!",dia_biff_hallo_doof);
};

func void dia_biff_hallo_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//Never mind.
	Info_ClearChoices(dia_biff_hallo);
};

func void dia_biff_hallo_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//I can't tell anything from that idiotic face you're making. That's why I have to ask.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//You're mouth is too big for my taste. It's time somebody shut it for you.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};

func void dia_biff_hallo_keineahnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//I haven't a clue.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//I'm waiting for something to finally happen here.
	Info_AddChoice(dia_biff_hallo,"What do you expect to happen?",dia_biff_hallo_keineahnung_was);
};

func void dia_biff_hallo_keineahnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//What do you expect to happen?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Oh, man, you are really not the sharpest knife in the drawer. If I knew that, I wouldn't have to wait.
	Info_AddChoice(dia_biff_hallo,"What could happen, then?",dia_biff_hallo_keineahnung_was_was2);
};

func void dia_biff_hallo_keineahnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//What could happen, then?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//You're getting on my nerves. Look, I don't care what happens. Just as long as something does happen.
	Info_AddChoice(dia_biff_hallo,"Why don't you do something, then?",dia_biff_hallo_keineahnung_was_was2_was3);
};

func void dia_biff_hallo_keineahnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//Why don't you do something, then?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//If you don't stop asking stupid questions right now, I'm going to shut your dirty mouth.
	Info_AddChoice(dia_biff_hallo,"If you just wait around here, nothing will ever happen!",dia_biff_hallo_keineahnung_was_was2_was3_was4);
};

func void dia_biff_hallo_keineahnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//If you just wait around here, nothing will ever happen!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//That's it!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_WASHIERIMTAL(C_INFO)
{
	npc = djg_713_biff;
	nr = 7;
	condition = dia_biff_washierimtal_condition;
	information = dia_biff_washierimtal_info;
	description = "What are you hoping to find here in the Valley of Mines?";
};


func int dia_biff_washierimtal_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_hallo))
	{
		return TRUE;
	};
};

func void dia_biff_washierimtal_info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//What are you hoping to find here in the Valley of Mines?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Gold and honor. What else? When I'm finished with the dragon, I'll be swimming in gold.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//Enough to spend the rest of my life frequenting every tavern and cathouse in the country.
	Info_AddChoice(dia_biff_washierimtal,"Well then, I wish you luck.",dia_biff_washierimtal_vielglueck);
	Info_AddChoice(dia_biff_washierimtal,"Either that or you'll be dead!",dia_biff_washierimtal_ihrtot);
};

func void dia_biff_washierimtal_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Either that, or you'll be dead!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//So what? That's part of it. If you want to get rich, you've got to take a few risks.
	Info_ClearChoices(dia_biff_washierimtal);
};

func void dia_biff_washierimtal_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Well, then, I wish you luck.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//I don't need luck. Just my axe.
	Info_ClearChoices(dia_biff_washierimtal);
};


instance DIA_BIFF_ARBEITEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 8;
	condition = dia_biff_arbeiten_condition;
	information = dia_biff_arbeiten_info;
	permanent = TRUE;
	description = "How would you like to work for me from now on?";
};


func int dia_biff_arbeiten_condition()
{
	if((DJG_BIFFPARTY == FALSE) && Npc_KnowsInfo(other,dia_biff_hallo) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_arbeiten_info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//How would you like to work for me from now on?
	b_logentry(TOPIC_DRAGONHUNTER,"The Dragon hunter Biff is a typical mercenary. If I pay him, he'll fight for me.");
	if(DJG_BIFFPARTY_NOMORE >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//We tried that once. Didn't work very well. Thanks, not interested.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Mmh. Why not? What are you paying?
	};
	Info_ClearChoices(dia_biff_arbeiten);
	Info_AddChoice(dia_biff_arbeiten,"Count yourself lucky if I spare your life.",dia_biff_arbeiten_lebenlassen);
	Info_AddChoice(dia_biff_arbeiten,"You'll get half of the booty.",dia_biff_arbeiten_halbehalbe);
	Info_AddChoice(dia_biff_arbeiten,"I'll pay you 100 gold coins for now.",dia_biff_arbeiten_100);
};

func void dia_biff_arbeiten_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//I'll pay you 100 gold coins for now.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//All right then. It's a start, anyway. Go ahead. I'll follow you.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Follow");
		b_biff_setrefusetalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BIFFPARTY = TRUE;
	}
	else
	{
		b_biff_verarschen();
		AI_StopProcessInfos(self);
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
	};
};

func void dia_biff_arbeiten_halbehalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//You'll get half of the booty.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//That sounds good. But I'm warning you, don't try ticking me, or you'll regret it.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//And one more thing, I don't want any weapons or other junk you collect here. I'm only interested in gold, got it?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BIFFPARTY = TRUE;
	DJG_BIFF_HALBEHALBE = TRUE;
	b_biff_setrefusetalk();
	if(DJG_BIFF_HALBEHALBE_AGAIN == FALSE)
	{
		DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		DJG_BIFF_HALBEHALBE_AGAIN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//But, what am I saying. You already know all that.
	};
};

func void dia_biff_arbeiten_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Count yourself lucky if I spare your life.
	b_biff_verarschen();
	AI_StopProcessInfos(self);
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_GELDEINTREIBEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 9;
	condition = dia_biff_geldeintreiben_condition;
	information = dia_biff_geldeintreiben_info;
	important = TRUE;
	permanent = TRUE;
};


var int biff_labert_geldeintreiben;

func int dia_biff_geldeintreiben_condition()
{
	if((DJG_BIFF_SCGOLD < (Npc_HasItems(hero,itmi_gold) - 1)) && (Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void dia_biff_geldeintreiben_info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Wait a minute! Didn't you say half the booty belonged to me? Give it here!
	b_biffsanteil_berechnung();
	b_biffsanteil_printscreen();
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"I can't afford you.",dia_biff_geldeintreiben_zuteuer);
	Info_AddChoice(dia_biff_geldeintreiben,"Here's your share.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Here's your share.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//All right. Let's get going.
	AI_StopProcessInfos(self);
	b_giveinvitems(other,self,itmi_gold,BIFFSANTEIL);
	b_biff_setrefusetalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};

func void dia_biff_geldeintreiben_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//I can't afford you.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//Stop whining at me. We agreed on half.
	Info_ClearChoices(dia_biff_geldeintreiben);
	Info_AddChoice(dia_biff_geldeintreiben,"We must part ways now, I'm afraid.",dia_biff_geldeintreiben_zuteuer_trennen);
	Info_AddChoice(dia_biff_geldeintreiben,"Here's your share.",dia_biff_geldeintreiben_geben);
};

func void dia_biff_geldeintreiben_zuteuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//We must part ways now... I'm afraid.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//If you say so. Then I'll just have to take my share.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_ICHBLEIBHIER(C_INFO)
{
	npc = djg_713_biff;
	nr = 6;
	condition = dia_biff_ichbleibhier_condition;
	information = dia_biff_ichbleibhier_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_ichbleibhier_condition()
{
	if((Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE) && (((((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(swampdragon) == FALSE) && (swampdragon.flags != 0)) || ((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(rockdragon) == FALSE) && (rockdragon.flags != 0)) || ((Npc_GetDistToWP(self,"CASTLE_36") < 4000) && (Npc_IsDead(firedragon) == FALSE) && (firedragon.flags != 0)) || ((Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(icedragon) == FALSE) && (icedragon.flags != 0))) && (Npc_HasItems(hero,itmi_innoseye_mis) >= 1)) || (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 4500)))
	{
		return TRUE;
	};
};

func void dia_biff_ichbleibhier_info()
{
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//Really dicey area here. You go in front. I'll keep in the background.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	};
	if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	};
	if(Npc_GetDistToWP(self,"CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	};
	if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	};
	DJG_BIFF_STAY = TRUE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_STAY_AWAYFROMOC(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_stay_awayfromoc_condition;
	information = dia_biff_stay_awayfromoc_info;
	nr = 3;
	permanent = TRUE;
	description = "(Take Biff along again)";
};


func int dia_biff_stay_awayfromoc_condition()
{
	if(((Npc_GetDistToWP(self,"OW_PATH_298") < 500) || (Npc_GetDistToWP(self,"LOCATION_19_01") < 500)) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_biff_stay_awayfromoc_info()
{
	b_kommmit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_BIFF_STAY = FALSE;
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_KOHLEWEGGEBEN(C_INFO)
{
	npc = djg_713_biff;
	condition = dia_biff_kohleweggeben_condition;
	information = dia_biff_kohleweggeben_info;
	nr = 10;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_kohleweggeben_condition()
{
	if((DJG_BIFF_SCGOLD > Npc_HasItems(hero,itmi_gold)) && (DJG_BIFF_HALBEHALBE == TRUE) && (DJG_BIFFPARTY == TRUE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_kohleweggeben_info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Don't scatter your gold all over the place.
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Better give it to me, then.
	AI_StopProcessInfos(self);
	DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
};


instance DIA_BIFF_BIFFLOSWERDEN(C_INFO)
{
	npc = djg_713_biff;
	nr = 11;
	condition = dia_biff_biffloswerden_condition;
	information = dia_biff_biffloswerden_info;
	permanent = TRUE;
	description = "This is where our collaboration should end, I think.";
};


func int dia_biff_biffloswerden_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_biffloswerden_info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//This is where our collaboration should end, I think.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//Suit yourself. I can think of better things, too. So long.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFF_HALBEHALBE = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 1;
};


instance DIA_BIFF_MEHRGELD(C_INFO)
{
	npc = djg_713_biff;
	nr = 12;
	condition = dia_biff_mehrgeld_condition;
	information = dia_biff_mehrgeld_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_biff_mehrgeld_condition()
{
	if((DJG_BIFFPARTY == TRUE) && (Npc_RefuseTalk(self) == FALSE) && (DJG_BIFF_STAY == FALSE))
	{
		return TRUE;
	};
};


var int dia_biff_mehrgeld_info_onetime;

func void dia_biff_mehrgeld_info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//I'm starting to get the feeling that I should get more money from you.
	if(DJG_BIFF_HALBEHALBE == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//100 gold coins should do it.
		if(dia_biff_mehrgeld_info_onetime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//No sweat. Of course, I haven't forgotten that we're splitting the booty.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//That's why I won't bug you so often about giving me more money.
			dia_biff_mehrgeld_info_onetime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//I want another 100 gold coins.
	};
	Info_ClearChoices(dia_biff_mehrgeld);
	Info_AddChoice(dia_biff_mehrgeld,"I can't afford you.",dia_biff_mehrgeld_zuteuer);
	Info_AddChoice(dia_biff_mehrgeld,"All right. You're worth it.",dia_biff_mehrgeld_ok);
};

func void dia_biff_mehrgeld_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//All right. You're worth it.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//I should say so. Then let's get going.
		AI_StopProcessInfos(self);
		if(DJG_BIFF_HALBEHALBE == TRUE)
		{
			DJG_BIFF_SCGOLD = Npc_HasItems(hero,itmi_gold);
		};
		b_biff_setrefusetalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//You poor sucker, you can't even pay a man-at-arms.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//I think I'll find another business partner.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_BIFF_HALBEHALBE = FALSE;
		DJG_BIFFPARTY = FALSE;
		DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
	};
};

func void dia_biff_mehrgeld_zuteuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//I can't afford you.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//Then you can just do your crap alone from now on.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BIFFPARTY = FALSE;
	DJG_BIFFPARTY_NOMORE = DJG_BIFFPARTY_NOMORE + 2;
};


instance DIA_BIFF_HEILUNG(C_INFO)
{
	npc = djg_713_biff;
	nr = 4;
	condition = dia_biff_heilung_condition;
	information = dia_biff_heilung_info;
	permanent = TRUE;
	description = "Do you need a healing potion?";
};


func int dia_biff_heilung_condition()
{
	if(DJG_BIFFPARTY == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_heilung_info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Do you need a healing potion?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Sure. It can't hurt.
	Info_ClearChoices(dia_biff_heilung);
	Info_AddChoice(dia_biff_heilung,"I'll give you something later.",dia_biff_heilung_spaeter);
	if(Npc_HasItems(other,itpo_health_03) >= 1)
	{
		Info_AddChoice(dia_biff_heilung,"(the best healing potion)",dia_biff_heilung_heiltrankhigh);
	};
	if(Npc_HasItems(other,itpo_health_02) >= 1)
	{
		Info_AddChoice(dia_biff_heilung,"(the medium healing potion)",dia_biff_heilung_heiltrankmed);
	};
	if(Npc_HasItems(other,itpo_health_01) >= 1)
	{
		Info_AddChoice(dia_biff_heilung,"(the smallest healing potion)",dia_biff_heilung_heiltranklow);
	};
};

func void dia_biff_heilung_heiltrankhigh()
{
	if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			b_useitem(self,itpo_health_03);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_HeilTrank_07_00");	//I guess I need to wait until you've got one for me.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_heiltrankmed()
{
	if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			b_useitem(self,itpo_health_02);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_HeilTrank_07_00");	//I guess I need to wait until you've got one for me.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_heiltranklow()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
		{
			b_useitem(self,itpo_health_01);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_HeilTrankLow_07_00");	//Unfortunately, you don't have any at the moment. I'll get back to you later on that.
	};
	AI_StopProcessInfos(self);
};

func void dia_biff_heilung_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_Spaeter_15_00");	//I'll give you something later.
	AI_Output(self,other,"DIA_Biff_HEILUNG_Spaeter_07_01");	//But don't forget!
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DRACHENTOT(C_INFO)
{
	npc = djg_713_biff;
	nr = 5;
	condition = dia_biff_drachentot_condition;
	information = dia_biff_drachentot_info;
	description = "That's it. All the dragons are dead.";
};


func int dia_biff_drachentot_condition()
{
	if(DJG_BIFFSURVIVEDLASTDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_biff_drachentot_info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//That's it. All the dragons are dead.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Yeah. And I'm still standing.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Are you sure that was the last one?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//I should think so.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//Too bad. I was just getting warmed up.
	b_giveplayerxp(XP_BIFFSURVIVEDLASTDRAGON);
};


instance DIA_BIFF_KNOWWHEREENEMY(C_INFO)
{
	npc = djg_713_biff;
	nr = 2;
	condition = dia_biff_knowwhereenemy_condition;
	information = dia_biff_knowwhereenemy_info;
	permanent = TRUE;
	description = "Would you fancy a little trip around the world?";
};


func int dia_biff_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BIFF_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Would you fancy a little trip around the world?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//What?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Never mind. My ship is full anyway.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Quit yanking my chain, man.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//I'm going to leave Khorinis and go to an island to look for new opponents.
		Info_ClearChoices(dia_biff_knowwhereenemy);
		Info_AddChoice(dia_biff_knowwhereenemy,"I just thought I'd mention it.",dia_biff_knowwhereenemy_no);
		Info_AddChoice(dia_biff_knowwhereenemy,"Won't you come along?",dia_biff_knowwhereenemy_yes);
	};
};

func void dia_biff_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Won't you come along?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//I don' t care about more opponents. I want...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Where we're going, there will be more gold than you can carry.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//If that's the case, I'm in. Where are we going?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//But first we need to get you out of the Valley of Mines.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//No problem. I'm on my way. Meet me at the pass.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"The prospect of rich pickings has persuaded Biff to accompany me. As long as he gets enough gold, I can count on him.");
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BIFF_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	BIFF_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunsToPass");
	Info_ClearChoices(dia_biff_knowwhereenemy);
};

func void dia_biff_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//I just thought I'd mention it.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Well, well. Have fun, then.
	BIFF_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_biff_knowwhereenemy);
};


instance DIA_BIFF_PASS(C_INFO)
{
	npc = djg_713_biff;
	nr = 55;
	condition = dia_biff_pass_condition;
	information = dia_biff_pass_info;
	permanent = TRUE;
	description = "Will you make it across the pass?";
};


func int dia_biff_pass_condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (BIFF_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_biff_pass_info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Will you make it across the pass?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Quit babbling. Go on. I want to finally get over the top.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff;
	nr = 900;
	condition = dia_biff_pickpocket_condition;
	information = dia_biff_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_pickpocket_condition()
{
	return c_beklauen(92,320);
};

func void dia_biff_pickpocket_info()
{
	Info_ClearChoices(dia_biff_pickpocket);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_BACK,dia_biff_pickpocket_back);
	Info_AddChoice(dia_biff_pickpocket,DIALOG_PICKPOCKET,dia_biff_pickpocket_doit);
};

func void dia_biff_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_pickpocket);
};

func void dia_biff_pickpocket_back()
{
	Info_ClearChoices(dia_biff_pickpocket);
};

