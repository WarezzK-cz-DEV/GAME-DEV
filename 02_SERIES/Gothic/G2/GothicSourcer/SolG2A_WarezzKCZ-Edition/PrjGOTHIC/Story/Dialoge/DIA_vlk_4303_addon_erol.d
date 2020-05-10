
instance DIA_ADDON_EROL_EXIT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 999;
	condition = dia_addon_erol_exit_condition;
	information = dia_addon_erol_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_erol_exit_condition()
{
	return TRUE;
};

func void dia_addon_erol_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_EROL_PICKPOCKET(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 900;
	condition = dia_addon_erol_pickpocket_condition;
	information = dia_addon_erol_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_erol_pickpocket_condition()
{
	return c_beklauen(43,42);
};

func void dia_addon_erol_pickpocket_info()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_BACK,dia_addon_erol_pickpocket_back);
	Info_AddChoice(dia_addon_erol_pickpocket,DIALOG_PICKPOCKET,dia_addon_erol_pickpocket_doit);
};

func void dia_addon_erol_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_erol_pickpocket);
};

func void dia_addon_erol_pickpocket_back()
{
	Info_ClearChoices(dia_addon_erol_pickpocket);
};


instance DIA_ADDON_EROL_HALLO(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_hallo_condition;
	information = dia_addon_erol_hallo_info;
	description = "What's the matter?";
};


func int dia_addon_erol_hallo_condition()
{
	return TRUE;
};

func void dia_addon_erol_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Hallo_15_00");	//What's the matter?
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_01");	//(angrily) What's the matter? Just look at that mess under the bridge over there.
	AI_Output(self,other,"DIA_Addon_Erol_Hallo_10_02");	//(angrily) I haven't seen anything like it in my entire life. Those swine should be exterminated, I tell you.
};


instance DIA_ADDON_EROL_WHAT(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_what_condition;
	information = dia_addon_erol_what_info;
	description = "What happened?";
};


func int dia_addon_erol_what_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_what_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_15_00");	//What happened?
	AI_Output(self,other,"DIA_Addon_Erol_what_10_01");	//I was traveling with my helpers when those horrible brutes came jumping on my cart from out of the blue and butchered everybody.
	AI_Output(self,other,"DIA_Addon_Erol_what_10_02");	//I'm lucky that I still know how to dish out a decent right hook, or they would have killed me, too.
	Log_CreateTopic(TOPIC_ADDON_EROL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_EROL,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_EROL,"The trader Erol was attacked by several bandits. They stole all his goods. The bandits on the bridge near the 'Dead Harpy' tavern still have his valuable stone tablets. Erol wants them back.");
	MIS_ADDON_EROL_BANDITSTUFF = LOG_RUNNING;
	Info_ClearChoices(dia_addon_erol_what);
	Info_AddChoice(dia_addon_erol_what,"That stuff there under the bridge is yours?",dia_addon_erol_what_dein);
	Info_AddChoice(dia_addon_erol_what,"Who were those people?",dia_addon_erol_what_wer);
};

func void dia_addon_erol_what_back()
{
	Info_ClearChoices(dia_addon_erol_what);
};

func void dia_addon_erol_what_dein()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_dein_15_00");	//That stuff there under the bridge is yours?
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_01");	//The cart, the goods, everything.
	if(Npc_HasItems(other,itmi_erolskelch) > 0)
	{
		AI_Output(other,self,"DIA_Addon_Erol_what_dein_Add_15_00");	//Look, I collected some of your stuff for you...
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_01");	//You can keep it. None of it is really of any value to me.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_what_dein_Add_10_02");	//But none of it is really of any value to me.
	};
	AI_Output(self,other,"DIA_Addon_Erol_what_dein_10_02");	//The only thing that's irreplaceable are the three stone tablets they stole from me.
	Info_AddChoice(dia_addon_erol_what,DIALOG_BACK,dia_addon_erol_what_back);
	Info_AddChoice(dia_addon_erol_what,"Stone tablets?",dia_addon_erol_what_was);
};

func void dia_addon_erol_what_was()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_Was_15_00");	//Stone tablets?
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_01");	//The Water Mage in town wants to buy them from me, and I promised he'd get them.
	AI_Output(self,other,"DIA_Addon_Erol_what_Was_10_02");	//I must have them back at any cost, or my reputation will be tarnished.
	Info_AddChoice(dia_addon_erol_what,"Where did you get those stone tablets?",dia_addon_erol_what_woher);
	Info_AddChoice(dia_addon_erol_what,"What would a Water Mage want with them?",dia_addon_erol_what_kdw);
};

func void dia_addon_erol_what_kdw()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_KDW_15_00");	//What would a Water Mage want with them?
	AI_Output(self,other,"DIA_Addon_Erol_what_KDW_10_01");	//He said he was going to study them and asked me to bring him more.
};

func void dia_addon_erol_what_woher()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_woher_15_00");	//Where did you get those stone tablets?
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_01");	//I found them near old buildings such as mausoleums, or sometimes in caves.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_02");	//I've already sold a whole bunch of them to the Water Mage in town.
	AI_Output(self,other,"DIA_Addon_Erol_what_woher_10_03");	//They're pretty rare down here, though. I found most of them north-east of Khorinis.
	Info_AddChoice(dia_addon_erol_what,"Why don't you simply go looking for new ones?",dia_addon_erol_what_neue);
};

func void dia_addon_erol_what_neue()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_neue_15_00");	//Why don't you simply go looking for new ones?
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_01");	//During that melee with the bandits, I sprained my ankle.
	AI_Output(self,other,"DIA_Addon_Erol_what_neue_10_02");	//I can still hobble along, but I don't want to walk very far on this foot.
};

func void dia_addon_erol_what_wer()
{
	AI_Output(other,self,"DIA_Addon_Erol_what_wer_15_00");	//Who were those people?
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_01");	//The bandits. Who else? They took over the bridge up there.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_02");	//They rob everybody who tries to pass the bridge.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_03");	//I knew they were lurking up there, so I passed under the bridge instead.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_04");	//But my cart and my goods must have been too tempting for them.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_05");	//Those scumbags simply jumped from the bridge - directly onto my cart.
	AI_Output(self,other,"DIA_Addon_Erol_what_wer_10_06");	//I should have tried to steal past in the night...
};


instance DIA_ADDON_EROL_FERNANDOSWEAPONS(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_fernandosweapons_condition;
	information = dia_addon_erol_fernandosweapons_info;
	description = "I need information about a weapons delivery for the bandits.";
};


func int dia_addon_erol_fernandosweapons_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_erol_fernandosweapons_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_15_00");	//I need information about a weapons delivery for the bandits.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_01");	//Weapons delivery? Yes, I know about that. Some swine from the city sold them so many weapons that they could barely carry them all.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_02");	//Some of them are kept on the bridge where those bastards attacked me.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_03");	//The rest of them were probably hauled past Bengar's farm on the high pastures.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_10_04");	//Maybe the bandits wanted to take them across the pass.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
	Info_AddChoice(dia_addon_erol_fernandosweapons,DIALOG_BACK,dia_addon_erol_fernandosweapons_back);
	Info_AddChoice(dia_addon_erol_fernandosweapons,"Where are those high pastures?",dia_addon_erol_fernandosweapons_bengar);
};

func void dia_addon_erol_fernandosweapons_bengar()
{
	AI_Output(other,self,"DIA_Addon_Erol_FernandosWeapons_bengar_15_00");	//Where are those high pastures?
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_01");	//Orlan's tavern is located just about in the center of the island of Khorinis. It's called 'The Dead Harpy'.
	AI_Output(self,other,"DIA_Addon_Erol_FernandosWeapons_bengar_10_02");	//There's a way south from there. It leads to the high pastures and the entrance to the pass to the Valley of Mines.
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};

func void dia_addon_erol_fernandosweapons_back()
{
	Info_ClearChoices(dia_addon_erol_fernandosweapons);
};


instance DIA_ADDON_EROL_STONEPLATES(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_stoneplates_condition;
	information = dia_addon_erol_stoneplates_info;
	permanent = TRUE;
	description = "About those stone tablets...";
};


func int dia_addon_erol_stoneplates_condition()
{
	if(MIS_ADDON_EROL_BANDITSTUFF == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int stoneplatescounter;
const int ADDON_EROLSSTONEPLATESOFFER = 10;

func void dia_addon_erol_stoneplates_info()
{
	var int stoneplatescount;
	var int xp_addon_bringstoneplates;
	var int stoneplatesgeld;
	AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_00");	//About those stone tablets...
	if(Npc_HasItems(other,itwr_stoneplatecommon_addon) >= 1)
	{
		stoneplatescount = Npc_HasItems(other,itwr_stoneplatecommon_addon);
		if(stoneplatescount == 1)
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_01");	//I've got one here.
			b_giveplayerxp(XP_ADDON_BRINGSTONEPLATE);
			b_giveinvitems(other,self,itwr_stoneplatecommon_addon,1);
			STONEPLATESCOUNTER = STONEPLATESCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_02");	//I've got some.
			if((stoneplatescount + STONEPLATESCOUNTER) >= 3)
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,3 - STONEPLATESCOUNTER);
				xp_addon_bringstoneplates = (3 - STONEPLATESCOUNTER) * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = 3;
			}
			else
			{
				b_giveinvitems(other,self,itwr_stoneplatecommon_addon,stoneplatescount);
				xp_addon_bringstoneplates = stoneplatescount * XP_ADDON_BRINGSTONEPLATE;
				STONEPLATESCOUNTER = STONEPLATESCOUNTER + stoneplatescount;
			};
			b_giveplayerxp(xp_addon_bringstoneplates);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_03");	//Thank you.
		if(STONEPLATESCOUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_04");	//Now I'm still missing two.
		}
		else if(STONEPLATESCOUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_05");	//I'm missing only one now.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_06");	//That's enough. Now I can keep my promise to the Water Mage in town, and then go home at last.
			MIS_ADDON_EROL_BANDITSTUFF = LOG_SUCCESS;
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_07");	//I'll pay you for them, of course.
		stoneplatesgeld = ADDON_EROLSSTONEPLATESOFFER * Npc_HasItems(self,itwr_stoneplatecommon_addon);
		CreateInvItems(self,itmi_gold,stoneplatesgeld);
		b_giveinvitems(self,other,itmi_gold,stoneplatesgeld);
		Npc_RemoveInvItems(self,itwr_stoneplatecommon_addon,Npc_HasItems(self,itwr_stoneplatecommon_addon));
		if(MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_08");	//I'm going home now. Come with me if you like.
			AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_09");	//Maybe I can sell you a few things that might interest you when we get there.
			AI_StopProcessInfos(self);
			AI_UseMob(self,"BENCH",-1);
			AI_GotoWP(self,"NW_TAVERN_TO_FOREST_03");
			Npc_ExchangeRoutine(self,"Start");
			Wld_AssignRoomToGuild("grpwaldhuette01",GIL_PUBLIC);
		};
	}
	else if(c_schasmagicstoneplate() == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_10");	//What about this one, then?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_11");	//No. This kind of stone tablet is magically charged.
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_12");	//Alas, the Water Mage won't buy this kind of tablet.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Erol_Stoneplates_15_13");	//How many were there?
		AI_Output(self,other,"DIA_Addon_Erol_Stoneplates_10_14");	//To save my reputation with the Water Mage in town, I need 3 tablets.
	};
};


instance DIA_ADDON_EROL_BUERGER(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_buerger_condition;
	information = dia_addon_erol_buerger_info;
	description = "Are you a citizen of the town?";
};


func int dia_addon_erol_buerger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_erol_buerger_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Buerger_15_00");	//Are you a citizen of the town?
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_01");	//Haven't been in ages, boy. There's no love lost between me and the corrupt swine in the upper quarter of Khorinis.
	AI_Output(self,other,"DIA_Addon_Erol_Buerger_10_02");	//I used to have quite a bit of influence there, you know. But that was months ago.
};


instance DIA_ADDON_EROL_PRETEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_preteach_condition;
	information = dia_addon_erol_preteach_info;
	description = "You managed to drive back the bandits?";
};


func int dia_addon_erol_preteach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what))
	{
		return TRUE;
	};
};

func void dia_addon_erol_preteach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_00");	//You managed to drive back the bandits?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_01");	//Yes. But I'm sure they're still up there on the bridge.
	AI_Output(other,self,"DIA_Addon_Erol_PreTeach_15_02");	//Can you teach me how to hit hard like that?
	AI_Output(self,other,"DIA_Addon_Erol_PreTeach_10_03");	//Of course I can.
	EROL_ADDON_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_OUTTEACHER,LOG_NOTE);
	b_logentry(TOPIC_OUTTEACHER,LOGTEXT_ADDON_EROL_TEACH);
};


instance DIA_ADDON_EROL_PRETRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_pretrade_condition;
	information = dia_addon_erol_pretrade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V2;
};


func int dia_addon_erol_pretrade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_erol_what) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") > 2000) && (MIS_ADDON_EROL_BANDITSTUFF != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_addon_erol_pretrade_info()
{
	b_say(other,self,"$TRADE_2");
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_00");	//I can't sell you anything. All my stuff lies over there, under the bridge, lad.
	AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_01");	//I can only sell you something once I get home.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_PreTrade_10_02");	//But I won't leave here until I have my stone tablets back.
	};
};


instance DIA_ADDON_EROL_SLD(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 5;
	condition = dia_addon_erol_sld_condition;
	information = dia_addon_erol_sld_info;
	description = "This here is YOUR hut?";
};


func int dia_addon_erol_sld_condition()
{
	if(Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 2000)
	{
		return TRUE;
	};
};


var int erol_isathome;

func void dia_addon_erol_sld_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_00");	//(surprised) This here is YOUR hut?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_01");	//Yes. Why? Anything wrong with it?
	AI_Output(other,self,"DIA_Addon_Erol_SLD_15_02");	//Don't you have any problems with the mercenaries?
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_03");	//As long as I don't interfere with their business, they'll leave me alone, too.
	AI_Output(self,other,"DIA_Addon_Erol_SLD_10_04");	//Moreover, they're good customers, and I pay them to keep an eye on my house when I'm not home.
	b_giveplayerxp(XP_AMBIENT);
	if(EROL_ISATHOME == FALSE)
	{
		Npc_ExchangeRoutine(self,"HOME");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TRADE(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 100;
	condition = dia_addon_erol_trade_condition;
	information = dia_addon_erol_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = DIALOG_TRADE_V2;
};


func int dia_addon_erol_trade_condition()
{
	if((MIS_ADDON_EROL_BANDITSTUFF == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_BIGFARM_HUT_IN_01") < 3000))
	{
		return TRUE;
	};
};


var int dia_addon_erol_trade_onetime;

func void dia_addon_erol_trade_info()
{
	b_say(other,self,"$TRADE_2");
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Addon_Erol_Trade_10_00");	//There isn't much choice, I'm afraid.
	if(EROL_ISATHOME == FALSE)
	{
		Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
		b_logentry(TOPIC_OUTTRADER,LOGTEXT_ADDON_EROLTRADE);
		Npc_ExchangeRoutine(self,"Home");
		EROL_ISATHOME = TRUE;
	};
};


instance DIA_ADDON_EROL_TEACH(C_INFO)
{
	npc = vlk_4303_addon_erol;
	nr = 99;
	condition = dia_addon_erol_teach_condition;
	information = dia_addon_erol_teach_info;
	permanent = TRUE;
	description = "Show me how I can hit harder.";
};


func int dia_addon_erol_teach_condition()
{
	if((EROL_ADDON_TEACHPLAYER == TRUE) && (MIS_ADDON_EROL_BANDITSTUFF != LOG_FAILED))
	{
		return TRUE;
	};
};

func void dia_addon_erol_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Erol_Teach_15_00");	//Show me how I can hit harder.
	if(MIS_ADDON_EROL_BANDITSTUFF != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_01");	//All right, but you'll owe me for that.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_02");	//Help me save my reputation, and bring me back my stone tablets.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_10_03");	//Then I can show you how to make better use of your strength in combat.
	}
	else if(EROL_BONUS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_00");	//Right. Pay attention. There's a simple trick.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_01");	//When you hit, you don't take the strength from your arm, but from your entire body.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_02");	//Turn your hip, bring your shoulder to the front, and stretch out your arm at the same time.
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_03");	//(laughs) If you hit right, you'll notice the difference!
		b_raiseattribute(other,ATR_STRENGTH,1);
		EROL_BONUS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Erol_Teach_Add_10_04");	//If you want to learn more, you'll need to train hard...
		Info_ClearChoices(dia_addon_erol_teach);
		Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_erol_teach_str_1);
		Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_erol_teach_str_5);
	};
};

func void dia_addon_erol_teach_back()
{
	Info_ClearChoices(dia_addon_erol_teach);
};

func void dia_addon_erol_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_erol_teach_str_5);
};

func void dia_addon_erol_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_addon_erol_teach);
	Info_AddChoice(dia_addon_erol_teach,DIALOG_BACK,dia_addon_erol_teach_back);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_addon_erol_teach_str_1);
	Info_AddChoice(dia_addon_erol_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_addon_erol_teach_str_5);
};

