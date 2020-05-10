
instance DIA_ADDON_FINN_EXIT(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 999;
	condition = dia_addon_finn_exit_condition;
	information = dia_addon_finn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_finn_exit_condition()
{
	return TRUE;
};

func void dia_addon_finn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FINN_PICKPOCKET(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 900;
	condition = dia_addon_finn_pickpocket_condition;
	information = dia_addon_finn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_finn_pickpocket_condition()
{
	return c_beklauen(35,50);
};

func void dia_addon_finn_pickpocket_info()
{
	Info_ClearChoices(dia_addon_finn_pickpocket);
	Info_AddChoice(dia_addon_finn_pickpocket,DIALOG_BACK,dia_addon_finn_pickpocket_back);
	Info_AddChoice(dia_addon_finn_pickpocket,DIALOG_PICKPOCKET,dia_addon_finn_pickpocket_doit);
};

func void dia_addon_finn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_finn_pickpocket);
};

func void dia_addon_finn_pickpocket_back()
{
	Info_ClearChoices(dia_addon_finn_pickpocket);
};


instance DIA_ADDON_FINN_HACKER(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_hacker_condition;
	information = dia_addon_finn_hacker_info;
	permanent = TRUE;
	description = "Back at work?";
};


func int dia_addon_finn_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_06") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_finn_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hacker_15_00");	//Back at work?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hacker_07_01");	//Yeah, now I'm getting the very last piece of gold out of this mine.
};


instance DIA_ADDON_FINN_HI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 1;
	condition = dia_addon_finn_hi_condition;
	information = dia_addon_finn_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_finn_hi_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_finn_hi_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Finn_Hi_15_00");	//Hi!
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Hi_07_01");	//(grumpily) What do you want?
};


instance DIA_ADDON_FINN_HACKE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 2;
	condition = dia_addon_finn_hacke_condition;
	information = dia_addon_finn_hacke_info;
	permanent = FALSE;
	description = "Where do I get a pickaxe?";
};


func int dia_addon_finn_hacke_condition()
{
	return TRUE;
};

func void dia_addon_finn_hacke_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Hacke_15_00");	//Where do I get a pickaxe?
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_01");	//Go to Huno the smith. But even if you have a pick, that doesn't mean that you can get into the mine.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_02");	//If you want to get in, you have to talk to Esteban.
	AI_Output(self,other,"DIA_Addon_Finn_Hacke_07_03");	//Don't even bother going to Thorus - he'll only let you in if you have a red stone.
};


instance DIA_ADDON_FINN_ESTEBAN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 3;
	condition = dia_addon_finn_esteban_condition;
	information = dia_addon_finn_esteban_info;
	permanent = FALSE;
	description = "Tell me, what do you think of Esteban?";
};


func int dia_addon_finn_esteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_hacke))
	{
		return TRUE;
	};
};

func void dia_addon_finn_esteban_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Esteban_15_00");	//Tell me, what do you think of Esteban?
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_01");	//(carefully) He's the boss here... he's... all right, I think.
	AI_Output(self,other,"DIA_Addon_Finn_Esteban_07_02");	//(hesitantly) He always lets the good boys into the mine. The ones who know something about mining, I mean.
};


instance DIA_ADDON_FINN_PROFI(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 4;
	condition = dia_addon_finn_profi_condition;
	information = dia_addon_finn_profi_info;
	permanent = FALSE;
	description = "And you know something about mining?";
};


func int dia_addon_finn_profi_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_esteban))
	{
		return TRUE;
	};
};

func void dia_addon_finn_profi_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Profi_15_00");	//And you know something about mining?
	AI_Output(self,other,"DIA_Addon_Finn_Profi_07_01");	//I'm the best!
};


instance DIA_ADDON_BDT_10004_FINN_MINE(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 5;
	condition = dia_addon_finn_mine_condition;
	information = dia_addon_finn_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_finn_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_finn_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_00");	//Sure thing, boss. You want to see the best in the mine? Then I'll get back to it...
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_01");	//Oh, something else. I'll let you in on a digger's secret.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_02");	//Now and then it's a good idea to give it a really good whack.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_03");	//If you've hacked a couple of times and nothing has come out, then drag the point of the pick sideways across the rock.
	AI_Output(self,other,"DIA_Addon_BDT_10004_Finn_Mine_07_04");	//With a little luck, you'll get several chunks at once that way.
	b_upgrade_hero_hackchance(10);
	KNOWS_TRUEMMERSCHLAG = TRUE;
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_FINN_GOLD(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 6;
	condition = dia_addon_finn_gold_condition;
	information = dia_addon_finn_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_finn_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_profi))
	{
		return TRUE;
	};
};

func void dia_addon_finn_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_00");	//Well, there's something you should know. Gold isn't ore. There's one damn important difference.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_01");	//I mean, what woman would hang a chain of ore around her neck? (laughs)
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_02");	//When picking, work from top to bottom. You can work the nuggets loose best that way.
	AI_Output(self,other,"DIA_Addon_Finn_Gold_07_03");	//There are also diggers who do it the other way around - but that's far more difficult.
	b_upgrade_hero_hackchance(10);
};


instance DIA_ADDON_FINN_EIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 7;
	condition = dia_addon_finn_ein_condition;
	information = dia_addon_finn_ein_info;
	permanent = TRUE;
	description = "Can you judge my gold-digging abilities?";
};


func int dia_addon_finn_ein_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_profi))
	{
		return TRUE;
	};
};


var int finn_einmal;
var int finn_gratulation;

func void dia_addon_finn_ein_info()
{
	var string concattext;
	AI_Output(other,self,"DIA_Addon_Finn_ein_15_00");	//Can you judge my gold-digging abilities?
	if(FINN_EINMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_01");	//Sure. I've been at this for over 35 years. There's nothing I can't assess!
		FINN_EINMAL = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Finn_ein_07_02");	//For you, I'd say you're...
	if(HERO_HACKCHANCE < 20)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_03");	//an absolute beginner.
	}
	else if(HERO_HACKCHANCE < 40)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_04");	//a quite passable scraper.
	}
	else if(HERO_HACKCHANCE < 55)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_05");	//an experienced gold scraper.
	}
	else if(HERO_HACKCHANCE < 75)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_06");	//a genuine digger.
	}
	else if(HERO_HACKCHANCE < 90)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_07");	//a damned good digger.
	}
	else if(HERO_HACKCHANCE < 98)
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_08");	//a master digger.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_ein_07_09");	//a guru among diggers.
		if(FINN_GRATULATION == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Finn_ein_07_10");	//So now you're as good as I am. Congratulations, partner.
			b_giveplayerxp(XP_AMBIENT * 2);
			Snd_Play("LevelUP");
			FINN_GRATULATION = TRUE;
		};
	};
	concattext = ConcatStrings("Goldminer: ",IntToString(HERO_HACKCHANCE));
	concattext = ConcatStrings(concattext," Percent");
	PrintScreen(concattext,-1,-1,FONT_SCREENSMALL,2);
};


instance DIA_ADDON_FINN_ATTENTAT(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 8;
	condition = dia_addon_finn_attentat_condition;
	information = dia_addon_finn_attentat_info;
	permanent = FALSE;
	description = "About the attempted murder of Esteban...";
};


func int dia_addon_finn_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_finn_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_00");	//(warily) Yes?
	AI_Output(other,self,"DIA_Addon_Finn_Attentat_15_01");	//Do you have any idea who's behind this?
	AI_Output(self,other,"DIA_Addon_Finn_Attentat_07_02");	//Why do you want to know?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"I want to talk to the guy...",dia_addon_finn_attentat_wannatalk);
	Info_AddChoice(dia_addon_finn_attentat,"Esteban wants to see him dead!",dia_addon_finn_attentat_fortheboss);
};

func void b_addon_finn_tellall()
{
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_00");	//(narrating) When the attack took place, I was trying to get my pickaxe from Huno the smith.
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_01");	//But he wasn't there.
	AI_Output(other,self,"DIA_Addon_Finn_TellAll_15_02");	//And?
	AI_Output(self,other,"DIA_Addon_Finn_TellAll_07_03");	//Usually, he's ALWAYS there. VERY suspicious if you ask me.
	FINN_TELLALL = TRUE;
	b_logentry(TOPIC_ADDON_ESTEBAN,"Finn says that Huno was not present during the attack.");
};

func void dia_addon_finn_attentat_fortheboss()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForTheBoss_15_00");	//Esteban wants to see him dead!
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_01");	//Oh! You work for the boss?
	AI_Output(self,other,"DIA_Addon_Finn_ForTheBoss_07_02");	//Then I'll tell you what I know.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_wannatalk()
{
	AI_Output(other,self,"DIA_Addon_Finn_WannaTalk_15_00");	//I want to talk to the guy...
	AI_Output(self,other,"DIA_Addon_Finn_WannaTalk_07_01");	//(warily) So? And what do you want from him.
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"That's none of your business!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"I have some interesting information for him!",dia_addon_finn_attentat_haveinfos);
	Info_AddChoice(dia_addon_finn_attentat,"I want to bump off Esteban and I'm looking for an ally!",dia_addon_finn_attentat_killesteban);
};

func void dia_addon_finn_attentat_killesteban()
{
	AI_Output(other,self,"DIA_Addon_Finn_KillEsteban_15_00");	//I want to bump off Esteban and I'm looking for an ally!
	AI_Output(self,other,"DIA_Addon_Finn_KillEsteban_07_01");	//I won't have anything to do with that!
	FINN_PETZT = TRUE;
	Info_ClearChoices(dia_addon_finn_attentat);
	AI_StopProcessInfos(self);
};

func void dia_addon_finn_attentat_haveinfos()
{
	AI_Output(other,self,"DIA_Addon_Finn_HaveInfos_15_00");	//I have some interesting information for him!
	AI_Output(self,other,"DIA_Addon_Finn_HaveInfos_07_01");	//You're in cahoots with the guy who ordered it, aren't you?
	Info_ClearChoices(dia_addon_finn_attentat);
	Info_AddChoice(dia_addon_finn_attentat,"I want to bump off Esteban and I'm looking for an ally!",dia_addon_finn_attentat_killesteban);
	Info_AddChoice(dia_addon_finn_attentat,"That's none of your business!",dia_addon_finn_attentat_forgetit);
	Info_AddChoice(dia_addon_finn_attentat,"Absolutely not!",dia_addon_finn_attentat_nono);
};

func void dia_addon_finn_attentat_nono()
{
	AI_Output(other,self,"DIA_Addon_Finn_NoNo_15_00");	//Absolutely not!
	AI_Output(self,other,"DIA_Addon_Finn_NoNo_07_01");	//(appraisingly) Good! I'll tell you what I know.
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_attentat);
};

func void dia_addon_finn_attentat_forgetit()
{
	AI_Output(other,self,"DIA_Addon_Finn_ForgetIt_15_00");	//That's none of your business!
	AI_Output(self,other,"DIA_Addon_Finn_ForgetIt_07_01");	//So? Well, then I don't know anything about the business.
	Info_ClearChoices(dia_addon_finn_attentat);
};


instance DIA_ADDON_FINN_AGAIN(C_INFO)
{
	npc = bdt_10004_addon_finn;
	nr = 9;
	condition = dia_addon_finn_again_condition;
	information = dia_addon_finn_again_info;
	permanent = TRUE;
	description = "About the attack again...";
};


func int dia_addon_finn_again_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_finn_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_finn_again_info()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_15_00");	//About the attack again...
	if(FINN_TELLALL == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_01");	//I already told you everything I know.
		Info_ClearChoices(dia_addon_finn_again);
		Info_AddChoice(dia_addon_finn_again,"OK...(back)",dia_addon_finn_again_exit);
		Info_AddChoice(dia_addon_finn_again,"Then tell me again!",dia_addon_finn_again_nochmal);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Finn_Again_07_02");	//Just leave me alone with that crap!
		AI_StopProcessInfos(self);
	};
};

func void dia_addon_finn_again_exit()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Exit_15_00");	//(appraisingly) Okay...
	Info_ClearChoices(dia_addon_finn_again);
};

func void dia_addon_finn_again_nochmal()
{
	AI_Output(other,self,"DIA_Addon_Finn_Again_Nochmal_15_00");	//Then tell me again!
	b_addon_finn_tellall();
	Info_ClearChoices(dia_addon_finn_again);
};

