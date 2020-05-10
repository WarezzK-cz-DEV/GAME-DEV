
instance DIA_BENNET_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_exit_condition;
	information = dia_bennet_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bennet_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_HALLO(C_INFO)
{
	npc = sld_809_bennet;
	nr = 1;
	condition = dia_bennet_hallo_condition;
	information = dia_bennet_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_hallo_condition()
{
	if((KAPITEL < 3) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bennet_hallo_info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//I do not sell any weapons. Khaled does. He is in the house with Onar.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Khaled is a weapons dealer.");
};


instance DIA_BENNET_TRADE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 700;
	condition = dia_bennet_trade_condition;
	information = dia_bennet_trade_info;
	permanent = TRUE;
	description = "What about forging equipment?";
	trade = TRUE;
};


func int dia_bennet_trade_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	if(BENNET_FLAG == 1)
	{
		b_clearsmithinv(self);
		if(BENNET_SWORDRAWS > 0)
		{
			CreateInvItems(self,itmiswordraw,BENNET_SWORDRAWS);
		};
		BENNET_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//What about forging equipment?
	b_clearsmithinv(self);
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//What do you need?
	if(BENNETLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Bennet sells smithery equipment.");
		BENNETLOG = TRUE;
	};
};


instance DIA_BENNET_WHICHWEAPONS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 2;
	condition = dia_bennet_whichweapons_condition;
	information = dia_bennet_whichweapons_info;
	permanent = FALSE;
	description = "What kinds of weapons do you make?";
};


func int dia_bennet_whichweapons_condition()
{
	if(((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && (MIS_BENNET_BRINGORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_whichweapons_info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//What kinds of weapons do you make?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//Plain swords at the moment, not much else.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//But if I had some magic ore I could forge weapons that are better than all comparable weapons made from regular old steel.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//You wouldn't happen to know where to find some around here? (laughs) Besides in the Valley of Mines, I mean.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//No.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//Of course not.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "Are you with the farmers or the mercenaries?";
};


func int dia_bennet_bauorsld_condition()
{
	return TRUE;
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//Are you with the farmers or the mercenaries?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//You're pulling my leg, aren't you?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//I was just curious.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//Have you ever seen a farmer who also forges weapons?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//No.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//Then why do you ask such stupid questions?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "I want to join the mercenaries!";
};


func int dia_bennet_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_bauorsld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_bennet_wannajoin_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//I want to join the mercenaries!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//Stop blabbering then, go to Torlof and let him put you to the test.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//I have passed the test.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//Good, I'll vote for you, then.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "Can you teach me how to forge a sword?";
};


func int dia_bennet_wannasmith_condition()
{
	if(((PLAYER_TALENT_SMITH[0] || PLAYER_TALENT_SMITH[13]) == FALSE) && (BENNET_TEACHCOMMON == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmith_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//Can you teach me how to forge a sword?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//Sure.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//That will cost you a bit, though. Let's say 30 gold pieces.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"Maybe later.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"Fine. Here's 30 for you.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//Fine. Here's 30 for you.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//And that was a damn good price, too! We can start as soon as you're ready.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Bennet can teach me a blacksmith's craft.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//Stop playing me for a sucker. 30 and not a coin less.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//Maybe later.
	Info_ClearChoices(dia_bennet_wannasmith);
};


instance DIA_BENNET_TEACHCOMMON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 6;
	condition = dia_bennet_teachcommon_condition;
	information = dia_bennet_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("Learn to forge",b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_FIRSTBLADE));
};


func int dia_bennet_teachcommon_condition()
{
	if(((PLAYER_TALENT_SMITH[0] || PLAYER_TALENT_SMITH[13]) == FALSE) && (BENNET_TEACHCOMMON == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachcommon_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//Teach me how to forge a sword!
	if(b_teachplayertalentsmith(self,other,WEAPON_FIRSTBLADE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//It's quite simple: get yourself a piece of raw steel and hold it into the fire until it glows.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//Then put it on the anvil and hammer the blade into shape.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//Most important, watch out that the blade doesn't get too cold. You only have a few minutes at a time to work on your weapon...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//The rest you can find out for yourself - it's merely a matter of practice.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "Teach me how to forge magic ore weapons!";
};


func int dia_bennet_wannasmithore_condition()
{
	if((BENNET_TEACHSMITH == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmithore_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//Teach me how to forge magic ore weapons!
	if((PLAYER_TALENT_SMITH[0] || PLAYER_TALENT_SMITH[13]) == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//But you don't even know the basics.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//First you need to learn how to forge a decent sword. Then we'll see.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//As long as you aren't one of us, I'll be damned if I tell you the secret of the magic ore weapons.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//Only very few blacksmiths know it at all, and I believe that not even the smiths in town know anything about it.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//And that's a good thing, too. Otherwise, those boozers of the city guard would all be wielding magic swords next.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//Nothing against you. (grins) You seem to be OK.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//If I had magic ore, I might even do just that.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//Aw, come on - I'm with the mercenaries, and I can forge - what else do you want?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//Can you tell me, then, how I am supposed to forge a magic ore weapon without any magic ore?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//Weeell...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//That's what I thought. I need at least 5 lumps of that ore - or you can forget it,
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//Great, you brought me the ore, and you also know how to forge a decent sword.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//Well, fire away, then...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//And since the blasted stuff is so expensive, you just grab a steel billet and a few lumps of ore.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//Everything else depends on the weapon you would like to produce.
		BENNET_TEACHSMITH = TRUE;
	};
};


instance DIA_BENNET_WHEREORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whereore_condition;
	information = dia_bennet_whereore_info;
	permanent = FALSE;
	description = "Where can I find magic ore?";
};


func int dia_bennet_whereore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_whereore_info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//Where can I find magic ore?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//Well, if only I knew that. There must surely be some in the mining colony.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//But maybe you'll luck out and find a few leftover morsels somewhere around here you can scrape together.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//I think there are some mining tunnels in the mountains south of here. Maybe you'll get lucky there.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//But watch out, I have heard it's teeming with bandits up there.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "Here you are - 5 ore nuggets.";
};


func int dia_bennet_bringore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && (Npc_HasItems(other,itmi_nugget) >= 5))
	{
		return TRUE;
	};
};

func void dia_bennet_bringore_info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//Here you are - 5 ore nuggets.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(laughs) Show me!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//Really! Knock me down with a feather!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//You can keep two of these things. You'll need them in order to forge your own weapon.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//No, not yet. Come back later.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "I want to know more about forging magic ore weapons.";
};


func int dia_bennet_teachsmith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//I want to know more about forging magic ore weapons.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//I can teach you how to forge magic ore swords, or even two-handed blades.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//I have improved my technique. Now I can teach you how to make bastard swords or heavy two-handed swords with ore.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//I think I have outdone myself this time. I have designed two battle blades. That's the best thing I have seen so far.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//Listen. I think I just had an ingenious inspiration. Magic ore weapons, coated with dragon blood. And I know exactly how I'll go about it!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(grins) Do you want to know?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//What kind of weapon would you like to make?
	};
	Info_ClearChoices(dia_bennet_teachsmith);
	Info_AddChoice(dia_bennet_teachsmith,DIALOG_BACK,dia_bennet_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_01)),dia_bennet_teachsmith_1hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_01)),dia_bennet_teachsmith_2hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_02)),dia_bennet_teachsmith_1hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_02)),dia_bennet_teachsmith_2hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_SPECIAL_03)),dia_bennet_teachsmith_1hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_SPECIAL_03)),dia_bennet_teachsmith_2hspecial3);
	};
	if((PLAYER_TALENT_SMITH[18] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_DEATHBRINGER,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1H_DEATHBRINGER)),dia_bennet_teachsmith_1hdeathbringer);
	};
	if((PLAYER_TALENT_SMITH[19] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_DEATHBRINGER,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2H_DEATHBRINGER)),dia_bennet_teachsmith_2hdeathbringer);
	};
};


instance DIA_BENNET_TEACHSMITH_SHIELDS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 31;
	condition = dia_bennet_teachsmith_shields_condition;
	information = dia_bennet_teachsmith_shields_info;
	permanent = TRUE;
	description = "Learn how to forge shields";
};


func int dia_bennet_teachsmith_shields_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && ((PLAYER_TALENT_SMITH[25] == FALSE) || (PLAYER_TALENT_SMITH[26] == FALSE) || (PLAYER_TALENT_SMITH[27] == FALSE) || (PLAYER_TALENT_SMITH[28] == FALSE) || (PLAYER_TALENT_SMITH[29] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_shields_info()
{
	Info_ClearChoices(dia_bennet_teachsmith_shields);
	Info_AddChoice(dia_bennet_teachsmith_shields,DIALOG_BACK,dia_bennet_teachsmith_shields_back);
	if((PLAYER_TALENT_SMITH[25] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith_shields,b_buildlearnstring(NAME_ITSH_BENNET_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_BENNET_01)),dia_bennet_teachsmith_sh_01);
	};
	if((PLAYER_TALENT_SMITH[26] == FALSE) && (PLAYER_TALENT_SMITH[25] == TRUE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith_shields,b_buildlearnstring(NAME_ITSH_BENNET_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_BENNET_02)),dia_bennet_teachsmith_sh_02);
	};
	if((PLAYER_TALENT_SMITH[27] == FALSE) && (PLAYER_TALENT_SMITH[26] == TRUE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith_shields,b_buildlearnstring(NAME_ITSH_BENNET_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_BENNET_03)),dia_bennet_teachsmith_sh_03);
	};
	if((PLAYER_TALENT_SMITH[28] == FALSE) && (PLAYER_TALENT_SMITH[27] == TRUE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith_shields,b_buildlearnstring(NAME_ITSH_BENNET_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_BENNET_04)),dia_bennet_teachsmith_sh_04);
	};
	if((PLAYER_TALENT_SMITH[29] == FALSE) && (PLAYER_TALENT_SMITH[28] == TRUE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith_shields,b_buildlearnstring(NAME_ITSH_BENNET_05,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_BENNET_05)),dia_bennet_teachsmith_sh_05);
	};
};

func void dia_bennet_teachsmith_back()
{
	Info_ClearChoices(dia_bennet_teachsmith);
};

func void dia_bennet_teachsmith_shields_back()
{
	Info_ClearChoices(dia_bennet_teachsmith_shields);
};

func void dia_bennet_teachsmith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
	Info_ClearChoices(dia_bennet_teachsmith);
	CMPLT1HSPECSWORD_01 = FALSE;
};

func void dia_bennet_teachsmith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
	Info_ClearChoices(dia_bennet_teachsmith);
	CMPLT2HSPECSWORD_01 = FALSE;
};

func void dia_bennet_teachsmith_1hspecial2()
{
	if(CMPLT1HSPECSWORD_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
		Info_ClearChoices(dia_bennet_teachsmith);
	};
};

func void dia_bennet_teachsmith_2hspecial2()
{
	if(CMPLT2HSPECSWORD_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
		Info_ClearChoices(dia_bennet_teachsmith);
	};
};

func void dia_bennet_teachsmith_1hspecial3()
{
	if(CMPLT1HSPECSWORD_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
		Info_ClearChoices(dia_bennet_teachsmith);
	};
};

func void dia_bennet_teachsmith_2hspecial3()
{
	if(CMPLT2HSPECSWORD_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
		Info_ClearChoices(dia_bennet_teachsmith);
	};
};

func void dia_bennet_teachsmith_1hdeathbringer()
{
	if(CMPLT1HSPECSWORD_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		b_teachplayertalentsmith(self,other,WEAPON_1H_DEATHBRINGER);
		Info_ClearChoices(dia_bennet_teachsmith);
	};
	b_teachplayertalentsmith(self,other,WEAPON_1H_DEATHBRINGER);
};

func void dia_bennet_teachsmith_2hdeathbringer()
{
	if(CMPLT2HSPECSWORD_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//The most important thing is: It doesn't matter at all whether your weapon is made of magic ore throughout, or if you have only coated a simple steel blade with a layer of ore. The surface is all that matters.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//Naturally, it won't do to just coat a finished sword with magic ore. You'll have to forge the weapon yourself from scratch.
		b_teachplayertalentsmith(self,other,WEAPON_2H_DEATHBRINGER);
		Info_ClearChoices(dia_bennet_teachsmith);
	};
};

func void dia_bennet_teachsmith_sh_01()
{
	b_teachplayertalentsmith(self,other,WEAPON_SH_BENNET_01);
	Info_ClearChoices(dia_bennet_teachsmith_shields);
};

func void dia_bennet_teachsmith_sh_02()
{
	if(CMPLTBENSH_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_BENNET_02);
		Info_ClearChoices(dia_bennet_teachsmith_shields);
	};
};

func void dia_bennet_teachsmith_sh_03()
{
	if(CMPLTBENSH_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_BENNET_03);
		Info_ClearChoices(dia_bennet_teachsmith_shields);
	};
};

func void dia_bennet_teachsmith_sh_04()
{
	if(CMPLTBENSH_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_BENNET_04);
		Info_ClearChoices(dia_bennet_teachsmith_shields);
	};
};

func void dia_bennet_teachsmith_sh_05()
{
	if(CMPLTBENSH_04 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_BENNET_05);
		Info_ClearChoices(dia_bennet_teachsmith_shields);
	};
};


instance DIA_BENNET_KAP3_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap3_exit_condition;
	information = dia_bennet_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bennet_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_WHYPRISON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whyprison_condition;
	information = dia_bennet_whyprison_info;
	permanent = FALSE;
	description = "How come you're in the slammer?";
};


func int dia_bennet_whyprison_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_whyprison_info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//How come you're in the slammer?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//Those swine have thrown me in the hole. I'm supposed to have murdered a paladin.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//But I didn't do it, they're only trying to frame me.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//Why would they do that?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//How would I know? You've got to get me out of here.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//Talk to Lord Hagen, tear down the wall, who cares - just do something!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Bennet's in a real fix. He'd do anything to get out of the slammer.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "What happened?";
};


func int dia_bennet_whathappened_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_whathappened_info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//What happened?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//I went downtown with Hodges to buy some supplies for our boys.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//Suddenly we heard a loud scream and the sound of running feet.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//Get to the point.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//We knew at once that something had happened and that they would grab us at once if they saw us there.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//We ran like hell. Then, just before we got to the city gate, I tripped and sprained my ankle.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//The rest is soon told. The militia was on me at once, and they threw me straight into this hole.
};


instance DIA_BENNET_VICTIM(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_victim_condition;
	information = dia_bennet_victim_info;
	permanent = FALSE;
	description = "Who was murdered?";
};


func int dia_bennet_victim_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_victim_info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//Who was murdered?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//I have no idea - one of the paladins, I don't know them.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//Have you got a name?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//Some Lothar, I think. Well, I don't know, I'm not really sure.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//You had better ask Lord Hagen, he knows all the details.
	b_logentry(TOPIC_RESCUEBENNET,"Lothar, one of the paladins, was murdered. Lord Hagen should be able to tell me more, he's in charge of the investigations.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "Do they have any evidence against you?";
};


func int dia_bennet_evidence_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_evidence_info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//Do they have any evidence against you?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//They say they have a witness who recognized me.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//Do you know who the witness is?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//No. All I know is that he's lying.
	b_logentry(TOPIC_RESCUEBENNET,"There's a witness who claims to have seen Bennet. I'll have to find him if I want to discover the truth.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "Who is leading the investigation?";
};


func int dia_bennet_investigation_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_evidence))
	{
		return TRUE;
	};
};

func void dia_bennet_investigation_info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//Who leads the investigation?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//Lord Hagen himself. Since the victim was one of the paladins, this falls under martial law.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//What does that mean?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//That's easy to guess. If I don't get out of here, they're going to let me swing without further ado.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//You've got to help me, or there'll be a war. Lee's not going to take this lying down.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//You can figure out for yourself what that means.
};


instance DIA_BENNET_THANKYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_thankyou_condition;
	information = dia_bennet_thankyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_thankyou_condition()
{
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_bennet_thankyou_info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//Man, and here I was thinking they'd really hang me!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//Well, it worked out all right in the end.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//You can say that again. You should have seen the face of the soldier when he had to let me out!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(laughs) He was so scared he almost did it in his pants.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//Which reminds me, I've got something for you.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//What do you mean?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(grins) A present.
};


instance DIA_BENNET_PRESENT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_present_condition;
	information = dia_bennet_present_info;
	permanent = FALSE;
	description = "What present?";
};


func int dia_bennet_present_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_thankyou))
	{
		return TRUE;
	};
};

func void dia_bennet_present_info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//What present?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//We have heard of the dragons that are said to be in the valley.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//They're really there!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//All right, I believe you.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//At any rate, some of the boys have decided to go into the valley as well.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(grins) They are planning to tidy up in there.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//What's that got to do with me?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(proudly) I have developed a new type of armor. Dragon hunter's armor!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//It is sturdier and lighter than traditional armor.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//Since you're the one who saved me, I want you to have the first piece. It's a gift!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//I thought you might want to be in on the fun. You're going to need the right equipment when you go down to that valley.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//Also, I am interested in dragon scales. Genuine dragon scales. I shall pay you a good price for them.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//How much do I get per scale?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//Anyway, I thought you would surely want to participate in the upcoming dragon hunt.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//And?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//Here, take this amulet. I think you'll need it more than I do.
		CreateInvItems(self,itam_hp_01,1);
		b_giveinvitems(self,other,itam_hp_01,1);
	};
};


var int bennet_dragonscale_counter;
var int show_djg_armor_m;

instance DIA_BENNET_DRAGONSCALE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_dragonscale_condition;
	information = dia_bennet_dragonscale_info;
	permanent = TRUE;
	description = "I've got a few dragon scales for you.";
};


func int dia_bennet_dragonscale_condition()
{
	if((Npc_HasItems(other,itat_dragonscale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_dragonscale_info()
{
	var int dragonscalecount;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//I've got a few dragon scales for you.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//Genuine dragon scales!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//Here's your gold!
	dragonscalecount = Npc_HasItems(other,itat_dragonscale);
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + dragonscalecount;
	b_giveinvitems(self,other,itmi_gold,dragonscalecount * VALUE_DRAGONSCALE);
	Npc_RemoveInvItems(other,itat_dragonscale,dragonscalecount);
	concattext = ConcatStrings(IntToString(dragonscalecount),PRINT_ITEMSGEGEBEN);
	AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//All right, that should be enough. I could sell you new, improved armor if you want.
		SHOW_DJG_ARMOR_M = TRUE;
	};
};


var int bennet_dia_bennet_djg_armor_m_permanent;

instance DIA_BENNET_DJG_ARMOR_M(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_m_condition;
	information = dia_bennet_djg_armor_m_info;
	permanent = TRUE;
	description = "Buy medium Dragon hunter's armor. Protection: B.+70/B.+90/P.+85/Df.+70/M.+15 (12000 gold)";
};


func int dia_bennet_djg_armor_m_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (SHOW_DJG_ARMOR_M == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//I want to buy the armor.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//Very good. You'll be delighted with it.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//I should certainly expect that at this price.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//You'll find that it is worth every single gold piece.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//You don't have enough gold.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "I know how the armor can be improved even further.";
};


func int dia_bennet_betterarmor_condition()
{
	if((PLAYERGETSFINALDJGARMOR == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_betterarmor_info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//I know how the armor can be improved even further.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(smiling to himself) Tell me, then.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//You could coat the dragon scales with magic ore.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(laughs) That thought has already occurred to me, too. And you're right.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//My newest armor beats everything you've ever seen. It is lightweight yet sturdy.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//It is PERFECT.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//You can buy it if you want. I don't make this offer to just anybody, and the price only just covers the manufacturing costs.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "Buy heavy Dragon hunter's armor. Protection: B.+75/B.+100/P.+95/Df.+85/M.+20 (20000 gold)";
};


func int dia_bennet_djg_armor_h_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_bennet_betterarmor))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_h_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//Give me the armor.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//This is the best armor I have ever made.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//A true masterpiece.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//You don't have enough gold.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "Can you repair jewelry?";
};


func int dia_bennet_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bennet_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//Can you repair jewelry?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//That depends. You would have to show me the piece first.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//Also, I need to get out of here first.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//Before that, I can't do a thing, obviously.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


var int bennet_showeye;

instance DIA_BENNET_SHOWINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseye_condition;
	information = dia_bennet_showinnoseye_info;
	permanent = FALSE;
	description = "Can you have a look at this amulet?";
};


func int dia_bennet_showinnoseye_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bennet_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Can you have a look at this amulet?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//Well, I'm stuck here for now. Or do you see a forge in this place?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//If I were in my smithy I could do it all in one day. But, of course, first I'll need to get out of here.
		BENNET_SHOWEYE = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Sure, let me see.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmm, that is a beautiful piece of work. The setting is shot. I think I can fix it, though.
		AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//How long will it take you?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//If you leave it here with me, it will be done by the time you come back tomorrow.
		BENNET_SHOWEYE = TRUE;
	};
	b_logentry(TOPIC_INNOSEYE,"Bennet is the smith I need to repair the amulet.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_SHOWINNOSEYEAGAIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseyeagain_condition;
	information = dia_bennet_showinnoseyeagain_info;
	permanent = FALSE;
	description = "Can you have a look at this amulet?";
};


func int dia_bennet_showinnoseyeagain_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bennet_repairnecklace) && (BENNET_SHOWEYE == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseyeagain_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//Can you have a look at this amulet?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//Sure, let me see.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//Hmm, that is a beautiful piece of work. The setting is shot. I think I can fix it, though.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//How long will it take you?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//If you leave it here with me, it will be done by the time you come back tomorrow.
	BENNET_SHOWEYE = TRUE;
	MIS_SCKNOWSINNOSEYEISBROKEN = FALSE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "Here's the amulet, please repair it for me.";
};


func int dia_bennet_giveinnoseye_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) >= 1) && (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE) && (MIS_RESCUEBENNET == LOG_SUCCESS) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (BENNET_SHOWEYE == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//Here's the amulet, please repair it for me.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//All right. I'll have finished the new setting by tomorrow.
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//And I won't even charge you for it. You got me out of the slammer, after all.
	Npc_RemoveInvItems(other,itmi_innoseye_broken_mis,1);
	AI_PrintScreen(PRINT_INNOSEYEGIVEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	BENNET_REPAIRDAY = Wld_GetDay();
};


instance DIA_BENNET_GETINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_getinnoseye_condition;
	information = dia_bennet_getinnoseye_info;
	permanent = TRUE;
	description = "Is the amulet ready?";
};


func int dia_bennet_getinnoseye_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_giveinnoseye) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_getinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//Is the amulet ready?
	if(BENNET_REPAIRDAY < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//Yes, here.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//I had to make a new setting for the stone.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//I worked on it all night, and now it's as good as new.
		b_logentry(TOPIC_INNOSEYE,"The amulet's setting is whole again. Bennet's done a good job.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//If you keep interrupting my work, it will take even longer.
		AI_StopProcessInfos(self);
	};
};


instance DIA_BENNET_KAP4_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap4_exit_condition;
	information = dia_bennet_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bennet_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DRACHENEIER(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_dracheneier_condition;
	information = dia_bennet_dracheneier_info;
	permanent = TRUE;
	description = "Is there anything you can do with dragon eggs?";
};


func int dia_bennet_dracheneier_condition()
{
	if((KAPITEL >= 4) && (BENNETSDRAGONEGGOFFER == 0) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int bennetsdragoneggoffer;
var int dracheneier_angebotenxp_onetime;

func void dia_bennet_dracheneier_info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//Is there anything you can do with dragon eggs?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//Dragon eggs? How the heck did you come by these?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//I took them from some lizard people.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//Let me see.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//Mmh. Very sturdy material. Ideal for finishing armor. If one can manage to get them open, that is.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//What about it, then? Do you want it?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//Sure! Give it here.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//How many more times are you going to shove that blasted thing at me? Do you want me to buy it or not?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//I'll pay you, mmh, let's say 300 gold coins for each egg you can bring me.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"Save your gold, then. I think I'll keep it.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"These are dragon eggs, not paltry chicken eggs.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"It's a deal.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"Bennet is willing to buy all the dragon eggs I can find for a good price.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//It's a deal.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//Right-o.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//Then keep those things coming if you can get them.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//Ehmm. You say you took it from lizard people?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//Right.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//Most lizard people dwell in caves, as far as I know.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//It wouldn't surprise me if you found more of these things in the caves around here.
	b_logentry(TOPIC_DRACHENEIER,"Bennet thinks I should look for the eggs in the caves of Khorinis. There are supposed to be lizard people in many caves.");
	if(Npc_HasItems(other,itwr_map_caves_mis) == FALSE)
	{
		if(Npc_IsDead(brahim) == FALSE)
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//But first you need to get a map of the caves from a cartographer in town. It would be a pity if you couldn't find them all.
			b_logentry(TOPIC_DRACHENEIER,"I should get a map of the caves from a cartographer in the city, just to make sure I don't miss any eggs.");
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//Here. Take this map. It'll help you find the caves.
			CreateInvItems(self,itwr_map_caves_mis,1);
			b_giveinvitems(self,other,itwr_map_caves_mis,1);
			b_logentry(TOPIC_DRACHENEIER,"He's given me a cave map to help me.");
		};
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//These are dragon eggs, not paltry chicken eggs.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(exasperated) All right. 350 it is. But I can't give you more than that - or it just won't pay for me.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//Save your gold, then. I think I'll keep it.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//Let me know when you change your mind.
	CreateInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	BENNETSDRAGONEGGOFFER = 0;
	Info_ClearChoices(dia_bennet_dracheneier);
};


instance DIA_BENNET_EIERBRINGEN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_eierbringen_condition;
	information = dia_bennet_eierbringen_info;
	permanent = TRUE;
	description = "Interested in some more dragon eggs?";
};


func int dia_bennet_eierbringen_condition()
{
	if((BENNETSDRAGONEGGOFFER > 0) && (KAPITEL >= 4) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int dragoneggcounter;

func void dia_bennet_eierbringen_info()
{
	var int dragoneggcount;
	var int xp_djg_bringdragoneggs;
	var int dragonegggeld;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//Interested in some more dragon eggs?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//Sure!
	dragoneggcount = Npc_HasItems(other,itat_dragonegg_mis);
	if(dragoneggcount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//Here. I've got another.
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
		AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//I've got some more here.
		Npc_RemoveInvItems(other,itat_dragonegg_mis,dragoneggcount);
		concattext = ConcatStrings(IntToString(dragoneggcount),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		xp_djg_bringdragoneggs = dragoneggcount * XP_DJG_BRINGDRAGONEGG;
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + dragoneggcount;
		b_giveplayerxp(xp_djg_bringdragoneggs);
	};
	if(DRAGONEGGCOUNTER <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//Great. Give here. Have you looked everywhere, then? Surely there must be more.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//Just where do you dig up those things? There can't be many more now.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//I don't think you'll find many more now. And I've got so many already, I hardly know what to do with them.
		TOPIC_END_DRACHENEIER = TRUE;
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//Oh, right. Here's your money.
	dragonegggeld = dragoneggcount * BENNETSDRAGONEGGOFFER;
	CreateInvItems(self,itmi_gold,dragonegggeld);
	b_giveinvitems(self,other,itmi_gold,dragonegggeld);
};


instance DIA_BENNET_KAP5_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap5_exit_condition;
	information = dia_bennet_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bennet_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_knowwhereenemy_condition;
	information = dia_bennet_knowwhereenemy_info;
	permanent = TRUE;
	description = "I need to go to an island. I could use a smith.";
};


func int dia_bennet_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BENNET_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//I need to go to an island. I could use a smith.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//And so you thought of me?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//Yes. What do you say? At any rate, that would get you out of here.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//Better than Onar's farm. Boy, even hell can't be THAT bad. Count me in.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Bennet could leave at once. His skill as a smith is unrivalled. I'm sure I could learn a few things from him.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//My crew is already complete at the moment.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//Then make sure to send one of them away again.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"I'm going to let you know when I need you.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"Be my smith, then. See you at the harbor. ",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//Be my smith, then. See you at the harbor.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//All right. See you later.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};

func void dia_bennet_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//I'm going to let you know when I need you.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//Fine. I'm here.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};


instance DIA_BENNET_LEAVEMYSHIP(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_leavemyship_condition;
	information = dia_bennet_leavemyship_info;
	permanent = TRUE;
	description = "I'm going to find myself a different smith.";
};


func int dia_bennet_leavemyship_condition()
{
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_leavemyship_info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//I'm going to find myself a different smith.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//It's this one minute, and that the next. Make up your mind, will you? Once you've figured out what you want, let me know.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BENNET_STILLNEEDYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_stillneedyou_condition;
	information = dia_bennet_stillneedyou_info;
	permanent = TRUE;
	description = "Come back. I can't find another smith.";
};


func int dia_bennet_stillneedyou_condition()
{
	if(((BENNET_ISONBOARD == LOG_OBSOLETE) || (BENNET_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_bennet_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//Come back. I can't find another smith.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(irritated) Right! It's only me, so who cares. See you later at the dock.
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_BENNET_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet;
	nr = 900;
	condition = dia_bennet_pickpocket_condition;
	information = dia_bennet_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_pickpocket_condition()
{
	return c_beklauen(35,45);
};

func void dia_bennet_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_pickpocket);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_BACK,dia_bennet_pickpocket_back);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_PICKPOCKET,dia_bennet_pickpocket_doit);
};

func void dia_bennet_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_pickpocket);
};

func void dia_bennet_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_pickpocket);
};

