
instance DIA_GEROLD_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_exit_condition;
	information = dia_gerold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_gerold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_HALLO(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_hallo_condition;
	information = dia_gerold_hallo_info;
	permanent = FALSE;
	description = "What are you guarding?";
};


func int dia_gerold_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gerold_hallo_info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//What are you guarding?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//The prisoners.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//And who is that?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//A few convicts and the mercenary Gorn. A tough guy - strong as an ox.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//It took four men to bring him into custody.
};


instance DIA_GEROLD_JAIL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_jail_condition;
	information = dia_gerold_jail_info;
	permanent = FALSE;
	description = "Can you let me into the dungeon?";
};


func int dia_gerold_jail_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_gerold_hallo) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_jail_info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//Can you let me into the dungeon?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//No. NO ONE may enter the dungeon. That goes for EVERYONE. For you, for Milten and for everybody else.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//This isn't some tavern where you can go in and out as you please. Remember that.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_GEROLD_AUSNAHME(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_ausnahme_condition;
	information = dia_gerold_ausnahme_info;
	permanent = FALSE;
	description = "Can't you make an exception for me?";
};


func int dia_gerold_ausnahme_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_jail) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_ausnahme_info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//Can't you make an exception for me?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//No.
};


instance DIA_GEROLD_GOLD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_gold_condition;
	information = dia_gerold_gold_info;
	permanent = FALSE;
	description = "And what if I pay you gold?";
};


func int dia_gerold_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_ausnahme) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_gold_info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//And what if I pay you gold?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//... hm...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//No.
};


instance DIA_GEROLD_DEAL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_deal_condition;
	information = dia_gerold_deal_info;
	permanent = FALSE;
	description = "I have a note here for one of the prisoners...";
};


func int dia_gerold_deal_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_deal_info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//I have a note here for one of the prisoners. Can you pass it on?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//Hm... in principle, I don't see why not. Who's this message for then?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//For Gorn.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//A very important prisoner. I don't think Garond would agree to that. But if it's important to you, we can certainly come to an agreement.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//What do you want?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//Our food rations are being reduced steadily. I want something decent to eat for a change.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//Get me a tasty sausage and a fresh loaf of bread - and some sweet honey.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//And a bottle of wine to go with it... Yeah, that should do. You should be able to manage that. So, come back when you have the stuff.
	b_logentry(TOPIC_RESCUEGORN,"If I bring Gerold a sausage, bread, wine and honey, he'll pass the message on to Gorn.");
};


instance DIA_GEROLD_STUFF(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_stuff_condition;
	information = dia_gerold_stuff_info;
	permanent = TRUE;
	description = "I've got something for you...";
};


var int dia_gerold_stuff_permanent;

func int dia_gerold_stuff_condition()
{
	if((Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && Npc_KnowsInfo(other,dia_gerold_deal) && (KAPITEL == 2) && (DIA_GEROLD_STUFF_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_stuff_info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//I've got something for you. The food you wanted.
	if((Npc_HasItems(other,itfo_honey) >= 1) && (Npc_HasItems(other,itfo_bread) >= 1) && (Npc_HasItems(other,itfo_wine) >= 1) && (Npc_HasItems(other,itfo_sausage) >= 1))
	{
		AI_PrintScreen("Honey given",-1,34,FONT_SCREENSMALL,2);
		AI_PrintScreen("Bread given",-1,37,FONT_SCREENSMALL,2);
		AI_PrintScreen("Wine given",-1,40,FONT_SCREENSMALL,2);
		AI_PrintScreen("Sausage gegeben",-1,43,FONT_SCREENSMALL,2);
		Npc_RemoveInvItems(other,itfo_honey,1);
		Npc_RemoveInvItems(other,itfo_bread,1);
		Npc_RemoveInvItems(other,itfo_wine,1);
		Npc_RemoveInvItems(other,itfo_sausage,1);
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//Good, give me the grub. Do you have the message?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//Yes, here. Remember, it's for Gorn.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//Come back tomorrow, he'll have received the message by then.
		b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
		DAYCONTACTGORN = Wld_GetDay();
		DIA_GEROLD_STUFF_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gerold's gotten what he wanted and will take care of the message.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//Come back when you have the stuff I want.
	};
};


instance DIA_GEROLD_ANTWORT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_antwort_condition;
	information = dia_gerold_antwort_info;
	permanent = TRUE;
	description = "Did Gorn receive the message?";
};


var int dia_gerold_antwort_permanent;

func int dia_gerold_antwort_condition()
{
	if((DIA_GEROLD_STUFF_PERMANENT == TRUE) && (KAPITEL == 2) && (DIA_GEROLD_ANTWORT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_antwort_info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//Did Gorn receive the message?
	if(DAYCONTACTGORN < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//Yeah, I'm supposed to tell you from him:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//And?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//It's at the south gate.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//Did he say anything else?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//No. No idea what that's supposed to mean. Do you know what it means?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//Perhaps. But you shouldn't think about it too much.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//Yes, that may be better.
		GORNSTREASURE = TRUE;
		DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"Gorn says his gold is at the south gate.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//No, not yet. Come back later.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_SETGORNFREE(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_setgornfree_condition;
	information = dia_gerold_setgornfree_info;
	permanent = FALSE;
	description = "Set Gorn free.";
};


func int dia_gerold_setgornfree_condition()
{
	if((GAROND_KERKERAUF == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gerold_setgornfree_info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//Set Gorn free. That's an order from Commander Garond.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//I've already been informed. Here's the key, you can go in.
	CreateInvItems(self,itke_prisonkey_mis,1);
	b_giveinvitems(self,other,itke_prisonkey_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Gerold gave me the key for the jail.");
};


instance DIA_GEROLD_PERM(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_perm_condition;
	information = dia_gerold_perm_info;
	permanent = TRUE;
	description = "Don't you ever sleep?";
};


func int dia_gerold_perm_condition()
{
	if((KAPITEL < 4) && Npc_KnowsInfo(other,dia_gerold_gold))
	{
		return TRUE;
	};
};

func void dia_gerold_perm_info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//Don't you ever sleep?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//No. Innos himself grants me the strength never to need sleep.
};


instance DIA_GEROLD_KAP4_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap4_exit_condition;
	information = dia_gerold_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP4_ALLESRUHIG(C_INFO)
{
	npc = pal_261_gerold;
	nr = 30;
	condition = dia_gerold_kap4_allesruhig_condition;
	information = dia_gerold_kap4_allesruhig_info;
	description = "All quiet?";
};


func int dia_gerold_kap4_allesruhig_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_allesruhig_info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//All quiet?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//Quiet, yes.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//But?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//My navel's rubbing against my backbone, man. Garond cut the food rations again.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//If I don't get a decent meal down my throat, then I'm going to bite Garond's fat ass.
	Info_ClearChoices(dia_gerold_kap4_allesruhig);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"Not my problem.",dia_gerold_kap4_allesruhig_nein);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"Maybe I could give you something.",dia_gerold_kap4_allesruhig_geben);
};

func void dia_gerold_kap4_allesruhig_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//Maybe I could give you something.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//Are you crazy? Certainly not here. If one of the others sees, I'll have a ton of new friends, if you know what I mean.
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//You can find me in the magician's temple when everyone else has retired.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//Quick, follow me to the magician's temple before the others come out of their holes. I don't want to wait until tomorrow.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//There's hardly anyone in the temple at this time anyway. I'll wait for you there.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//But just don't show up with dry bread or some raw hunk of meat, got it?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
	b_logentry(TOPIC_GEROLDGIVEFOOD,"Garond has cut down the food rations again. I'd better give Gerold something to eat before his hunger leads him to do something really stupid. I'm to meet him at the magicians' house of the castle, when everyone's asleep.");
	MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};

func void dia_gerold_kap4_allesruhig_nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//Not my problem.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//You can talk. Garond certainly won't cut your rations.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//Even if he won't admit it, he's scared shitless and he sees you as his only salvation.
	AI_StopProcessInfos(self);
};


var int gerold_foodcounter;

instance DIA_GEROLD_FOOD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 31;
	condition = dia_gerold_food_condition;
	information = dia_gerold_food_info;
	important = TRUE;
};


func int dia_gerold_food_condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_gerold_morefood()
{
	Info_ClearChoices(dia_gerold_food);
	if(GEROLD_FOODCOUNTER > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//That's enough. That's enough. With that I'll be fine for a while.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//Here's my gold. I can't buy anything for it out here in any case, so you might as well have it.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//I'd better go then, before somebody sees us.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GEROLDGIVEFOOD = LOG_SUCCESS;
		b_giveplayerxp(XP_GEROLDGIVEFOOD);
		CreateInvItems(self,itmi_gold,450);
		b_giveinvitems(self,other,itmi_gold,450);
	}
	else
	{
		if(GEROLD_FOODCOUNTER == 0)
		{
			Info_AddChoice(dia_gerold_food,"I don't have anything right now.",dia_gerold_food_nichts);
		}
		else
		{
			Info_AddChoice(dia_gerold_food,"That's all I have.",dia_gerold_food_kaese_nichtmehr);
			if(GEROLD_FOODCOUNTER < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//Sure. Give it here. Do you have more?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//Yeah. More, more!
			};
		};
		if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
		{
			Info_AddChoice(dia_gerold_food,"(Give soup)",dia_gerold_food_suppe);
		};
		if(Npc_HasItems(other,itfomutton))
		{
			Info_AddChoice(dia_gerold_food,"(Give meat)",dia_gerold_food_fleisch);
		};
		if(Npc_HasItems(other,itfo_bacon))
		{
			Info_AddChoice(dia_gerold_food,"(Give ham)",dia_gerold_food_schinken);
		};
		if(Npc_HasItems(other,itfo_cheese))
		{
			Info_AddChoice(dia_gerold_food,"Give cheese)",dia_gerold_food_kaese);
		};
		if(Npc_HasItems(other,itfo_sausage))
		{
			Info_AddChoice(dia_gerold_food,"Give sausage)",dia_gerold_food_wurst);
		};
		GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
	};
};

func void dia_gerold_food_info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//There you are. So, what is it now? Do you have anything to eat for me?
	dia_gerold_morefood();
};

func void dia_gerold_food_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//I don't have anything right now.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//First you make such a big deal out of it and now you want to trick me?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_gerold_food_kaese_nichtmehr()
{
	var int xp_geroldgivefoodlow;
	var int teiler;
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//That's all I have.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//And I'm supposed to believe that? All right, better than nothing. Here's a bit of gold for it.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//Well. I need to get back to my post.
	AI_StopProcessInfos(self);
	if(GEROLD_FOODCOUNTER < 4)
	{
		teiler = 3;
	}
	else
	{
		teiler = 2;
	};
	xp_geroldgivefoodlow = XP_GEROLDGIVEFOOD / teiler;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_OBSOLETE;
	b_giveplayerxp(xp_geroldgivefoodlow);
};

func void dia_gerold_food_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//What about a juicy hunk of cheese?
	b_giveinvitems(other,self,itfo_cheese,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//A piece of sausage?
	b_giveinvitems(other,self,itfo_sausage,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//I could give you this ham.
	b_giveinvitems(other,self,itfo_bacon,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//A chunk of meat?
	b_giveinvitems(other,self,itfomutton,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//A good soup would hit the spot, don't you think?
	if(b_giveinvitems(other,self,itfo_fishsoup,1))
	{
	}
	else
	{
		b_giveinvitems(other,self,itfo_stew,1);
	};
	dia_gerold_morefood();
};


instance DIA_GEROLD_PERM4(C_INFO)
{
	npc = pal_261_gerold;
	nr = 41;
	condition = dia_gerold_perm4_condition;
	information = dia_gerold_perm4_info;
	permanent = TRUE;
	description = "Still hungry?";
};


func int dia_gerold_perm4_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_kap4_allesruhig))
	{
		return TRUE;
	};
};

func void dia_gerold_perm4_info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//Still hungry?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//If the orcs attack again, not even a full belly will help me.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//That must be a joke. I'm stuffed. Thanks again.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//Yeah. But thanks for your help anyway.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//It's all right, Master.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//Beat it!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP5_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap5_exit_condition;
	information = dia_gerold_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gerold_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP6_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap6_exit_condition;
	information = dia_gerold_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_gerold_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_PICKPOCKET(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_pickpocket_condition;
	information = dia_gerold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_gerold_pickpocket_condition()
{
	return c_beklauen(71,170);
};

func void dia_gerold_pickpocket_info()
{
	Info_ClearChoices(dia_gerold_pickpocket);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_BACK,dia_gerold_pickpocket_back);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_PICKPOCKET,dia_gerold_pickpocket_doit);
};

func void dia_gerold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gerold_pickpocket);
};

func void dia_gerold_pickpocket_back()
{
	Info_ClearChoices(dia_gerold_pickpocket);
};

