
instance DIA_JAN_EXIT(C_INFO)
{
	npc = djg_714_jan;
	nr = 999;
	condition = dia_jan_exit_condition;
	information = dia_jan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jan_exit_condition()
{
	return TRUE;
};

func void dia_jan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_HELLO(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_hello_condition;
	information = dia_jan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jan_hello_condition()
{
	if((KAPITEL >= 4) && Npc_IsInState(self,zs_talk) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_hello_info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//It was a really, really stupid idea to come here.
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//I thought there was something to be had here. But there's nothing here but a few arrogant paladins and orcs.
};


instance DIA_JAN_DRAGONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragons_condition;
	information = dia_jan_dragons_info;
	permanent = FALSE;
	description = "You forgot about the dragons!";
};


func int dia_jan_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (MIS_JANBECOMESSMITH == FALSE) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_dragons_info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//You forgot about the dragons!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(mockingly) How could I forget. I'll tell you what. I'm a blacksmith, not a warrior.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//I make weapons. The fighting I leave to others.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Then why aren't you standing behind an anvil?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//The paladins here won't let me into the smithy. I can't make anything unless I want to wind up in the dungeon.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//You're one of them, too. So how about putting in a good word for me?
	};
	Info_ClearChoices(dia_jan_dragons);
	Info_AddChoice(dia_jan_dragons,DIALOG_ENDE_V2,dia_jan_dragons_shithappen);
	Info_AddChoice(dia_jan_dragons,"What's in it for me if I help you?",dia_jan_dragons_reward);
	Info_AddChoice(dia_jan_dragons,"I'll try to help you.",dia_jan_dragons_helpyou);
};

func void dia_jan_dragons_helpyou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//I'll try to help you.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//How will you manage that? Parcival has ordered a watch kept on us.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//No one would dare to disregard it.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//I'll do whatever I can.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//I can't imagine that he would listen to you.
	Log_CreateTopic(TOPIC_JANBECOMESSMITH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JANBECOMESSMITH,LOG_RUNNING);
	b_logentry(TOPIC_JANBECOMESSMITH,"Jan, the Dragon hunter in the castle in the Valley of Mines, wants to work at the smithy. But Parcival forbids it.");
	MIS_JANBECOMESSMITH = LOG_RUNNING;
	Info_ClearChoices(dia_jan_dragons);
};

func void dia_jan_dragons_reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//What's in it for me if I help you?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//I don't have anything. At the most, I could teach you something.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//I know a method of making blades forged from magic ore even harder.
	};
	JAN_TEACHPLAYER = TRUE;
};

func void dia_jan_dragons_shithappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//I've got to be on my way.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//Terrific. I can't leave the castle now, and I can't forge anything either.
	Info_ClearChoices(dia_jan_dragons);
};


instance DIA_JAN_HOME(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_home_condition;
	information = dia_jan_home_info;
	permanent = FALSE;
	description = "Where do you come from?";
};


func int dia_jan_home_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL >= 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_home_info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Where do you come from?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//I've joined up with some men from the mountains. We were headed for the valley to make a real profit hunting dragons.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Their leader went by the name of Sylvio. Boy, what an ass. He treated me like I was his property.
};


instance DIA_JAN_OLDCAMP(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_oldcamp_condition;
	information = dia_jan_oldcamp_info;
	permanent = TRUE;
	description = "What happened in the castle?";
};


func int dia_jan_oldcamp_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_oldcamp_info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//What all happened in the castle?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Nothing that I've heard. Of course, I'm worried about what's happened OUTSIDE the castle.
};


instance DIA_JAN_PARCIVAL(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_parcival_condition;
	information = dia_jan_parcival_info;
	permanent = FALSE;
	description = "I talked to Parcival.";
};


func int dia_jan_parcival_condition()
{
	if((MIS_JANBECOMESSMITH != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_parcival_info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//I talked to Parcival.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//So?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//He doesn't trust us Dragon hunters.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//He doesn't trust you Dragon hunters.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Damn. I just want to work.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Then I might as well give up. Only Garond could help me now.
};


instance DIA_JAN_JANISSMITH(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_janissmith_condition;
	information = dia_jan_janissmith_info;
	permanent = FALSE;
	description = "Go get your hammer, there's work for you.";
};


func int dia_jan_janissmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_janissmith_info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Go get your hammer, there's work for you.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//You did it? How did you manage that?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//I had to vouch for you, so don't disappoint me.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Don't worry. I'm glad that I can work at all.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SELLWEAPONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellweapons_condition;
	information = dia_jan_sellweapons_info;
	permanent = FALSE;
	description = "Are you selling any weapons?";
};


func int dia_jan_sellweapons_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (JAN_TEACHPLAYER == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void dia_jan_sellweapons_info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Are you selling any weapons?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//No way. And then your colleagues here will stick me in jail for black-marketing, huh? Nah, forget about it.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//I would if I could. But first I have to provide the paladins here in the castle with weapons.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//But I can show you how to forge your own weapon.
	JAN_TEACHPLAYER = TRUE;
};


instance JAN_TRAINING_TALENTE(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = jan_training_talente_condition;
	information = jan_training_talente_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Teach me how to be a smith.";
};


func int jan_training_talente_condition()
{
	if((JAN_TEACHPLAYER == TRUE) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE))
	{
		return 1;
	};
};

func void jan_training_talente_info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Teach me how to be a smith.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//What exactly do you plan to make?
	b_clearsmithinv(self);
	b_givetradeinv(self);
};


var int dia_jan_sellarmor_permanent;

instance DIA_JAN_SELLARMOR(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellarmor_condition;
	information = dia_jan_sellarmor_info;
	permanent = TRUE;
	description = "Can I buy some armor from you?";
};


func int dia_jan_sellarmor_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == FALSE))
	{
		return 1;
	};
};

func void dia_jan_sellarmor_info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Can I buy some armor from you?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Nothing that would be better than your armor. We should forget it.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//A mage who wants armor? Forget it - go see a tailor. I can't make armor for you.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//If I had any, I'd sell it to you. Unfortunately, I don't have any.
		Info_ClearChoices(dia_jan_sellarmor);
		Info_AddChoice(dia_jan_sellarmor,"I guess there's nothing to be done.",dia_jan_sellarmor_sorry);
		Info_AddChoice(dia_jan_sellarmor,"Can you make one for me, then?",dia_jan_sellarmor_buildone);
	};
};

func void dia_jan_sellarmor_sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//I guess there's nothing to be done.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Once you've got something after all, just let me know.
	Info_ClearChoices(dia_jan_sellarmor);
};

func void dia_jan_sellarmor_buildone()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//Can you make one for me, then?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Well, if you want something better, you'll have to get me the materials.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//What is it you need?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//You want to fight the dragons, don't you? Bring me some dragon scales - with those, I should be able to cobble something together for you.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 scales should be enough.
	DIA_JAN_SELLARMOR_PERMANENT = TRUE;
	Info_ClearChoices(dia_jan_sellarmor);
};


var int jan_sells_armor;

instance DIA_JAN_DRAGONSCALES(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragonscales_condition;
	information = dia_jan_dragonscales_info;
	permanent = TRUE;
	description = "I've got the dragon scales for you.";
};


func int dia_jan_dragonscales_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == TRUE) && (JAN_SELLS_ARMOR == FALSE) && (Npc_HasItems(other,itat_dragonscale) >= 1))
	{
		return 1;
	};
};


var int dia_jan_dragonscales_onetime;

func void dia_jan_dragonscales_info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//I've got the dragon scales for you.
	if(Npc_HasItems(other,itat_dragonscale) >= 20)
	{
		b_giveinvitems(other,self,itat_dragonscale,20);
		Npc_RemoveInvItems(self,itat_dragonscale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Good, something can be done with that.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Come back tomorrow, the part should be finished then.
		if(DIA_JAN_DRAGONSCALES_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_ADDON_JANSELLSARMOR);
			DIA_JAN_DRAGONSCALES_ONETIME = TRUE;
		};
		JAN_SELLS_ARMOR = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//I need 20 dragon scales, otherwise I can't make you any armor.
	};
};


var int djg_armor_is_offered;
var int dia_jan_armorready_noperm;

instance DIA_JAN_ARMORREADY(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_armorready_condition;
	information = dia_jan_armorready_info;
	permanent = TRUE;
	description = "Is the armor ready?";
};


func int dia_jan_armorready_condition()
{
	if((MIS_OCGATEOPEN == FALSE) && (JAN_SELLS_ARMOR != FALSE) && (DIA_JAN_ARMORREADY_NOPERM == FALSE))
	{
		return 1;
	};
};

func void dia_jan_armorready_info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Is the armor ready?
	if(JAN_SELLS_ARMOR == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//No, not yet. Come back tomorrow.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Yes, a real masterpiece. You can buy it if you want.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//What? After all I've done for you?
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Don't be like that. I've got to make a living here. Take it or leave it.
		DJG_ARMOR_IS_OFFERED = TRUE;
		DIA_JAN_ARMORREADY_NOPERM = TRUE;
	};
};


var int jan_dia_jan_djg_armor_m_permanent;

instance DIA_JAN_DJG_ARMOR_M(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_djg_armor_m_condition;
	information = dia_jan_djg_armor_m_info;
	permanent = TRUE;
	description = "Buy medium Dragon hunter's armor. Protection: B.+70/B.+90/P.+85/Df.+70/M.+15 (7000 gold).";
};


func int dia_jan_djg_armor_m_condition()
{
	if((JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (DJG_ARMOR_IS_OFFERED == TRUE))
	{
		return TRUE;
	};
};

func void dia_jan_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//I want to buy the armor.
	if(Npc_HasItems(other,itmi_gold) >= 7000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//You can see that it's worth every gold piece.
		b_giveinvitems(other,self,itmi_gold,7000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//You don't have enough gold.
	};
};


instance DIA_JAN_DRAGONPLETTBERICHT(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonplettbericht_condition;
	information = dia_jan_dragonplettbericht_info;
	description = "About the dragons...";
};


var int dia_jan_dragonplettbericht_noperm;

func int dia_jan_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jan_dragons) && (DIA_JAN_DRAGONPLETTBERICHT_NOPERM == FALSE) && (MIS_OCGATEOPEN == FALSE) && (MIS_KILLEDDRAGONS != 0))
	{
		return TRUE;
	};
};

func void dia_jan_dragonplettbericht_info()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//I've killed a dragon.
	}
	else if((MIS_KILLEDDRAGONS == 2) || (MIS_KILLEDDRAGONS == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//I've killed a few dragons.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//I've killed all the dragons.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//So what? You are a Dragon hunter, aren't you?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//Aren't you one, too?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//That's nice. But to be honest, I'm not particularly interested.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//I already told you, I'd rather make weapons than set out myself to kill dragons.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//There is one thing, however, that could interest me.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//If you could get me some dragon blood, I would pay a high price for it.
		JAN_WANTSDRAGONBLOOD = TRUE;
	};
};


instance DIA_JAN_DRAGONBLOOD(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonblood_condition;
	information = dia_jan_dragonblood_info;
	permanent = TRUE;
	description = "I've got some dragon blood for you.";
};


func int dia_jan_dragonblood_condition()
{
	if((JAN_WANTSDRAGONBLOOD == TRUE) && (MIS_OCGATEOPEN == FALSE) && Npc_HasItems(other,itat_dragonblood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_jan_dragonblood_info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//I've got some dragon blood for you.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//That's great. Sell me everything you have.
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(Everything)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(One phial)",dia_jan_dragonblood_1);
	};
};

func void dia_jan_dragonblood_back()
{
	Info_ClearChoices(dia_jan_dragonblood);
};

func void dia_jan_dragonblood_1()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = 1;
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Npc_RemoveInvItem(self,itat_dragonblood);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(Everything)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(One phial)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,2);
};

func void dia_jan_dragonblood_all()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = Npc_HasItems(other,itat_dragonblood);
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Npc_RemoveInvItems(self,itat_dragonblood,dragonbloodcount);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(Everything)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(One phial)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_JAN_NACHOCGATEOPEN(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_nachocgateopen_condition;
	information = dia_jan_nachocgateopen_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_jan_nachocgateopen_condition()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_jan_nachocgateopen_info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Everything all right?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//Absolutely nothing is clear!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Why did you idiots open the gate? You paladins are a few beans short of a fart!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//So they just go ahead and open the gate. Dimwits! I just can't get over it.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JAN_PICKPOCKET(C_INFO)
{
	npc = djg_714_jan;
	nr = 900;
	condition = dia_jan_pickpocket_condition;
	information = dia_jan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jan_pickpocket_condition()
{
	return c_beklauen(37,95);
};

func void dia_jan_pickpocket_info()
{
	Info_ClearChoices(dia_jan_pickpocket);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_BACK,dia_jan_pickpocket_back);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_PICKPOCKET,dia_jan_pickpocket_doit);
};

func void dia_jan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jan_pickpocket);
};

func void dia_jan_pickpocket_back()
{
	Info_ClearChoices(dia_jan_pickpocket);
};

