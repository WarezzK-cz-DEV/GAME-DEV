
instance DIA_BOSPER_EXIT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 999;
	condition = dia_bosper_exit_condition;
	information = dia_bosper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bosper_exit_condition()
{
	return TRUE;
};

func void dia_bosper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOSPER_HALLO(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_hallo_condition;
	information = dia_bosper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bosper_hallo_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_IN_02") <= 500)
	{
		return TRUE;
	};
};

func void dia_bosper_hallo_info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//Welcome to my shop, stranger!
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//I am Bosper. I craft bows and trade in furs.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//What brings you to Khorinis?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Bosper makes bows and trades in hides. His shop's at the eastern gate, in the lower part of town.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "I need to get into the upper quarter...";
};


func int dia_bosper_intoov_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_intoov_info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//I need to get into the upper quarter...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//Where the paladins are? Forget it.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//You need to be a respected citizen here, or at least hold a decent job.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//As a stranger, you stand no chance of getting in.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//So I noticed...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"To gain access to the upper quarter, I must either become a respectable citizen or get a job.");
};


instance DIA_BOSPER_SEEKWORK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_seekwork_condition;
	information = dia_bosper_seekwork_info;
	permanent = FALSE;
	description = "I'm looking for work.";
};


func int dia_bosper_seekwork_condition()
{
	return TRUE;
};

func void dia_bosper_seekwork_info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//I'm looking for work!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//Mmh - I could use a new apprentice.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//The last one just gave up his job two days ago.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//Do you know anything about hunting, then?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//Weeell...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//I could teach you how to skin animals.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//I'll pay you well for every skin you bring me.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//I can get you some skins if that's what you mean.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//Excellent! Bring me as many animal skins as you can - I will buy them from you for a good price.
	};
	b_logentry(TOPIC_LEHRLING,"Bosper's looking for a new apprentice. I could start work with him.");
};


var int bosper_hinttojob;
var int bosper_startguild;

instance DIA_BOSPER_LEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_lehrling_condition;
	information = dia_bosper_lehrling_info;
	permanent = TRUE;
	description = "I want to start as your apprentice!";
};


func int dia_bosper_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//I want to start as your apprentice!
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(grins) Great! You seem to know the basics already.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//Harad thinks you're a good man.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//But Harad isn't convinced of your abilities.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//But Harad says he's never seen you.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//Thorben gave you his blessing. I'm not all that pious, but I'm fine with it.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//Thorben will only give you his approval with the blessing of the gods.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//Thorben has no idea who you are.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//Constantino says you can sign up wherever you want for all he cares.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//Constantino says you're being accused of a crime here in town - I hope that this is something trivial?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//See to it that the matter gets cleared up.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//Constantino has never even heard of you.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//And Matteo says you're worth your weight in gold.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//And Matteo mentioned some debts - whatever he meant by that, you had better talk to him.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//Matteo says he has not yet talked to you about this.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//Matteo says he has never seen you before in his life.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//This means you have the approval of all masters!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//You now have the approval of four masters. That will suffice for you to be accepted as an apprentice.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//You can work for me at any time if you want.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"Good - I'll think about it.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"I'm in!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//You need the approval of at least four masters in order to be able to start an apprenticeship in the lower part of town.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//This means that you should talk to all those who do not quite approve of you yet.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//Before I take you on I need to know, of course, whether you're any good at all.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//You brought me back my bow, but that doesn't say much about your talent as a hunter.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//I'm in!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//You aren't going to regret this! I think we'll be able to work together well.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	Npc_ExchangeRoutine(lothar,"START");
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	BOSPER_TEACHPLAYER = TRUE;
	b_logentry(TOPIC_BONUS,"Bosper has accepted me as his apprentice. I now have access to the upper quarter.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_addon_bosper_teach_meattrue()
{
	b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MEAT);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//Good - I'll think about it.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//Don't make the wrong decision! You'd be perfect for me.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "What if I want to sign on with one of the other masters?";
};


func int dia_bosper_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_othermasters_info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//What if I want to sign on with one of the other masters?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(grumpy) Balderdash!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//Harad and Matteo already have apprentices.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//Constantino the alchemist is a loner - and he hasn't taken an apprentice in years.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//And as for Thorben - everyone knows he's dead broke - he probably couldn't even pay you.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//I, on the other hand, am in urgent need of an apprentice - and I pay well, too.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//But no matter where you want to sign on - you need the approval of all other masters from the lower part of town...
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "Why did your apprentice give up his job?";
};


func int dia_bosper_bartok_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork))
	{
		return TRUE;
	};
};

func void dia_bosper_bartok_info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//Why did your apprentice give up his job?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//All he said was that it had become too dangerous out there.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//If you're really interested, then you can ask him yourself.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//His name is Bartok. He's probably hanging out near Coragon's tavern.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//Go through the underpass from the smithy, then you're headed straight for it.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "Will I get your approval to sign up with a different master?";
};


func int dia_bosper_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_othermasters) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};


var int bosper_zustimmung_once;

func void dia_bosper_zustimmung_info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//Will I get your approval to sign up with a different master?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(disappointed) I had hoped you would choose me.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//But if that's the way you want it...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//Does that mean you'll vote for me?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//If none of the other masters objects - yes.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//You brought back my bow, after all.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//But you would certainly have made a good hunter.
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Bosper will give his approval if I want to start as an apprentice somewhere.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(sighs) All right! You shall have my approval - but on one condition.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//Work for me, at least for a short time.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//That way you can find out for yourself whether you like my craft or not.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//And who knows - maybe you'll end up liking it, and you'll stay with me.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//If you're good enough to sign on with ME, you're also good enough for all others here.
		BOSPER_HINTTOJOB = TRUE;
	};
};


instance DIA_BOSPER_JOB(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_job_condition;
	information = dia_bosper_job_info;
	permanent = FALSE;
	description = "What do you want me to do for you?";
};


func int dia_bosper_job_condition()
{
	if(BOSPER_HINTTOJOB == TRUE)
	{
		return TRUE;
	};
};

func void dia_bosper_job_info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//What do you want me to do for you?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//I will teach you how to skin an animal, and you will bring me - let's say - half a dozen wolf skins.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Bosper can teach me to skin animals.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//Bring me half a dozen wolf skins.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//Then I'll know that you have learned your trade.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//If it doesn't take you forever and if the skins are in acceptable condition, I will take you on if you like.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//Or (sighs) you can start with one of the other masters - if that's what you really want.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"I'm to bring Bosper six wolf skins. Then I can either work for him, or he'll give his approval so I can work for one of the other masters.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"I should get him to teach me how to skin animals.");
	};
};


instance DIA_BOSPER_BRINGFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 102;
	condition = dia_bosper_bringfur_condition;
	information = dia_bosper_bringfur_info;
	permanent = TRUE;
	description = "About the wolf skins...";
};


func int dia_bosper_bringfur_condition()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bringfur_info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//About the wolf skins...
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//You're already apprenticed to a different master now. I will buy the skins from you for the regular price.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//I've got them - here.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//Great! I knew you would be suitable for this job.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//Here's the pay I promised you.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//And? What do you think? Isn't this better work than banging away at swords all day, or filling little bottles in a dusty chamber?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"Bosper will accept me as his apprentice if the other masters approve.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//We had agreed on half a dozen - but you've still got time. Go and get those skins.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "Teach me how to skin animals! (5 LP)";
};


func int dia_bosper_teachfur_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_job) && (PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachfur_info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//Teach me how to skin animals!
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//You take a sharp blade and cut open the animal's belly. Then make a few small incisions on the inside of the legs, and you can peel off the skin.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Bring me the wolf's skins and we'll see...
			b_logentry(TOPIC_BOSPERWOLF,"Bosper has taught me to skin animals.");
		};
	};
};


instance DIA_BOSPER_LEATHERTEACH(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_leatherteach_condition;
	information = dia_bosper_leatherteach_info;
	permanent = TRUE;
	description = "Learn 'Leatherworking' (5 LP)";
};


func int dia_bosper_leatherteach_condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[3] == TRUE) && (PLAYER_TALENT_LEATHER == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_leatherteach_info()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//Bring me the wolf's skins and we'll see...
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
		if(b_teachplayertalentleather(self,other,LEATHERFASE_1))
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
			AI_PrintScreen(PRINT_LEARNLEATHER,-1,52,FONT_SCREENBRIGHTLARGE,3);
		};
	};
};


instance DIA_BOSPER_TRADE(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 700;
	condition = dia_bosper_trade_condition;
	information = dia_bosper_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_bosper_trade_condition()
{
	if(MIS_BOSPER_WOLFFURS != LOG_RUNNING)
	{
		dia_bosper_trade.trade = TRUE;
	};
	return TRUE;
};

func void dia_bosper_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//Show me your wares.
	if(dia_bosper_trade.trade == TRUE)
	{
		b_givetradeinv(self);
		Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
		mcbolzenamount = KAPITEL * 50;
		CreateInvItems(self,itrw_bolt,mcbolzenamount);
		Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
		mcarrowamount = KAPITEL * 50;
		CreateInvItems(self,itrw_arrow,mcarrowamount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//You're not here to browse through my wares, you're supposed to get me those skins!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//So get going!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "I've heard that someone stole from you.";
};


func int dia_bosper_bogenrunning_condition()
{
	if(MIS_BOSPER_BOGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bogenrunning_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//I've heard that someone stole from you.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//Who told you that? Probably Bartok, huh? Didn't he have anything better to tell you? Oh well.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//Let me tell you, if I get hold of this bastard he can say his prayers!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//I left the shop only for a moment. When I came back, I could only just see him leave - with my bow on his shoulder.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//I called the guards right away, but the lowlife ran towards the harbor. And they lost him there.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//I lit a bonfire under their asses then, and they searched the entire harbor district. But they didn't find a thing.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//Those bumbling lackeys!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//I bet my bow is still in town somewhere. I informed the guards on both city gates, and they haven't seen anyone leave with my bow.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//When I get my hands on that bastard...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"Bosper had a bow stolen from him. The thief ran off to the harbor, but then he got away. The militia searched the harbor district, but they couldn't find anything, even though the bow must still be in town.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "I think this bow belongs to you...";
};


func int dia_bosper_bogensuccess_condition()
{
	if(Npc_HasItems(other,itrw_bow_l_03_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_bosper_bogensuccess_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//I think this bow belongs to you...
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//My bow! Where did you find it?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//In a dark hole full of rats.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//I hope you didn't get into trouble...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//No - I've done this kind of thing before.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//Hm - thank you anyway. I owe you for this!
	MIS_BOSPER_BOGEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BOSPER_BOGEN);
	Npc_RemoveInvItems(self,itrw_bow_l_03_mis,1);
	Npc_ExchangeRoutine(self,"CITYREST");
};


var int bosper_island;

instance DIA_BOSPER_PERM(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 10;
	condition = dia_bosper_perm_condition;
	information = dia_bosper_perm_info;
	permanent = TRUE;
	description = "How are things in town?";
};


func int dia_bosper_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_bosper_perm_info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//How are things in town?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//If the orcs really show up to besiege us, it's going to get unpleasant around here.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//There's only one ship - and the paladins are guarding it. And I don't think they'll use it to rescue the citizens.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//Is there no other way of getting out of here?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//No, none of us can leave this island without a ship.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//There's nothing new so far. Drop in again later.
	};
};


var int bosper_milkommentar;
var int bosper_palkommentar;
var int bosper_innoskommentar;

instance DIA_BOSPER_ALSLEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_alslehrling_condition;
	information = dia_bosper_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bosper_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (BOSPER_STARTGUILD != GIL_MIL) && (BOSPER_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//You up and joined the militia, eh?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//Not that I care. Just as long as, besides orcs and bandits, you hunt a few wolves as well. (grins)
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//Looks like your career took off like a rocket. Paladin of the King!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//Wherever you go from here, don't forget your old master...
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//You went and entered the monastery, huh? I hope they let you out often enough so you can keep me supplied with skins...
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//Where have you been gadding about for so long?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//I need more skins, did you bring any?
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//There you are again...
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_BOSPER_AUFGABEN(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_aufgaben_condition;
	information = dia_bosper_aufgaben_info;
	permanent = FALSE;
	description = "What are my tasks as an apprentice?";
};


func int dia_bosper_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_aufgaben_info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//What are my tasks as an apprentice?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//That's easy. Bring me as many pelts as you can get.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//I'll pay you a better price for them than any of the other traders would give you.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//Apart from that, you needn't show up here in the shop. I can get along just fine by myself.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//And where am I supposed to sleep?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//I don't have any room for you here. They're bound to have a bed for you in the hotel at the marketplace.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Bosper will pay an extremely good price for animal hides.");
};


var int bosper_trollfursold;
var int bosper_merkedex;

instance DIA_ADDON_BOSPER_TEACH(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 12;
	condition = dia_addon_bosper_teach_condition;
	information = dia_addon_bosper_teach_info;
	permanent = TRUE;
	description = "i want to become more dexterous.";
};


func int dia_addon_bosper_teach_condition()
{
	if(BOSPER_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bosper_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//I want to become more dexterous.
	BOSPER_MERKEDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_addon_bosper_teach);
	Info_AddChoice(dia_addon_bosper_teach,DIALOG_BACK,dia_addon_bosper_teach_back);
	Info_AddChoice(dia_addon_bosper_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_bosper_teach_1);
	Info_AddChoice(dia_addon_bosper_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_bosper_teach_5);
};

func void dia_addon_bosper_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > BOSPER_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(grins) Great! You seem to know the basics already.
	};
	Info_ClearChoices(dia_addon_bosper_teach);
};

func void dia_addon_bosper_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_addon_bosper_teach);
	Info_AddChoice(dia_addon_bosper_teach,DIALOG_BACK,dia_addon_bosper_teach_back);
	Info_AddChoice(dia_addon_bosper_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_bosper_teach_1);
	Info_AddChoice(dia_addon_bosper_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_bosper_teach_5);
};

func void dia_addon_bosper_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_addon_bosper_teach);
	Info_AddChoice(dia_addon_bosper_teach,DIALOG_BACK,dia_addon_bosper_teach_back);
	Info_AddChoice(dia_addon_bosper_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_addon_bosper_teach_1);
	Info_AddChoice(dia_addon_bosper_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_addon_bosper_teach_5);
};


instance DIA_BOSPER_TEACHMEAT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_teachmeat_condition;
	information = dia_bosper_teachmeat_info;
	permanent = TRUE;
	description = b_buildlearnstring("Gutting animals",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MEAT));
};


func int dia_bosper_teachmeat_condition()
{
	if((BOSPER_TEACHPLAYER == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[1] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachmeat_info()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MEAT))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
	};
};


instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "I've got a few skins for you...";
};


func int dia_bosper_sellfur_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur_info()
{
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//I've got a few skins for you...
	if((Npc_HasItems(other,itat_sheepfur) > 0) || (Npc_HasItems(other,itat_wolffur) > 0) || (Npc_HasItems(other,itat_wargfur) > 0) || (Npc_HasItems(other,itat_shadowfur) > 0) || (Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0) || (Npc_HasItems(other,itat_addon_keilerfur) > 0) || (Npc_HasItems(other,itat_lurkerskin) > 0) || (Npc_HasItems(other,itat_sharkskin) > 0))
	{
		if(Npc_HasItems(other,itat_sharkskin) > 0)
		{
			AI_Wait(self,3);
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sharkskin) * VALUE_SHARKSKIN);
			b_giveinvitems(other,self,itat_sharkskin,Npc_HasItems(other,itat_sharkskin));
		};
		if(Npc_HasItems(other,itat_lurkerskin) > 0)
		{
			AI_Wait(self,3);
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_lurkerskin) * VALUE_REPTILESKIN);
			b_giveinvitems(other,self,itat_lurkerskin,Npc_HasItems(other,itat_lurkerskin));
		};
		if(Npc_HasItems(other,itat_addon_keilerfur) > 0)
		{
			AI_Wait(self,3);
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_addon_keilerfur) * VALUE_KEILERFUR);
			b_giveinvitems(other,self,itat_addon_keilerfur,Npc_HasItems(other,itat_addon_keilerfur));
		};
		if(Npc_HasItems(other,itat_sheepfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//A sheep skin? You didn't go slaughter some farmer's sheep in the pasture, did you?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//I wouldn't dream of doing that...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//Wolf skin, that's good...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//A warg skin? Those beasts are tough...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//Ah, even a shadowbeast skin - those are worth a lot.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//What the hell is THIS skin?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//I ripped a troll off for that one.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//That... that is worth a small fortune.
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//Another huge troll hide... are you hunting those things down?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//Whenever I stumble upon one, I seize the opportunity...
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//And the hide of a black troll, at that!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//Good work. Come see me again when you have more...
	}
	else
	{
		AI_PrintScreen("No skins to sell",-1,52,FONT_SCREENBRIGHTLARGE,2);
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "I see that you have mining shares for sale.";
};


func int dia_bosper_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bosper_minenanteil_info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//I see that you have mining shares for sale.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//Ahem. I know nothing about that. You can have them if you want.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BOSPER_TEACH_BOW(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_teach_bow_condition;
	information = dia_bosper_teach_bow_info;
	permanent = TRUE;
	description = "Learn how to make bows.";
};


func int dia_bosper_teach_bow_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && ((PLAYER_TALENT_BOWMAKE[0] == FALSE) || (PLAYER_TALENT_BOWMAKE[1] == FALSE) || (PLAYER_TALENT_BOWMAKE[2] == FALSE) || (PLAYER_TALENT_BOWMAKE[3] == FALSE) || (PLAYER_TALENT_BOWMAKE[4] == FALSE)))
	{
		return TRUE;
	};
};

func void dia_bosper_teach_bow_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	if((PLAYER_TALENT_BOWMAKE[0] == FALSE) || (PLAYER_TALENT_BOWMAKE[1] == FALSE) || (PLAYER_TALENT_BOWMAKE[2] == FALSE) || (PLAYER_TALENT_BOWMAKE[3] == FALSE) || (PLAYER_TALENT_BOWMAKE[4] == FALSE))
	{
		Info_ClearChoices(dia_bosper_teach_bow);
		Info_AddChoice(dia_bosper_teach_bow,DIALOG_BACK,dia_bosper_teach_bow_back);
	};
	if(PLAYER_TALENT_BOWMAKE[0] == FALSE)
	{
		Info_AddChoice(dia_bosper_teach_bow,b_buildlearnstring("Fine longbow (Damage: 60, Dexterity required: 30)",b_getlearncosttalent(other,NPC_TALENT_BOWMAKE,BOW_BSPR_1)),dia_bosper_teach_bow_1);
	}
	else if((PLAYER_TALENT_BOWMAKE[1] == FALSE) && (PLAYER_TALENT_BOWMAKE[0] == TRUE))
	{
		Info_AddChoice(dia_bosper_teach_bow,b_buildlearnstring("Assassin's bow (Damage: 90, Dexterity required: 60)",b_getlearncosttalent(other,NPC_TALENT_BOWMAKE,BOW_BSPR_2)),dia_bosper_teach_bow_2);
	}
	else if((PLAYER_TALENT_BOWMAKE[2] == FALSE) && (PLAYER_TALENT_BOWMAKE[1] == TRUE))
	{
		Info_AddChoice(dia_bosper_teach_bow,b_buildlearnstring("Combat bow (Damage: 120, Dexterity required: 90)",b_getlearncosttalent(other,NPC_TALENT_BOWMAKE,BOW_BSPR_3)),dia_bosper_teach_bow_3);
	}
	else if((PLAYER_TALENT_BOWMAKE[3] == FALSE) && (PLAYER_TALENT_BOWMAKE[2] == TRUE))
	{
		Info_AddChoice(dia_bosper_teach_bow,b_buildlearnstring("Fine oak bow (Damage: 150, Dexterity required: 120)",b_getlearncosttalent(other,NPC_TALENT_BOWMAKE,BOW_BSPR_4)),dia_bosper_teach_bow_4);
	}
	else if((PLAYER_TALENT_BOWMAKE[4] == FALSE) && (PLAYER_TALENT_BOWMAKE[3] == TRUE))
	{
		Info_AddChoice(dia_bosper_teach_bow,b_buildlearnstring("Heavy steel bow (Damage: 180, Dexterity required: 150, Strength required: 50)",b_getlearncosttalent(other,NPC_TALENT_BOWMAKE,BOW_BSPR_5)),dia_bosper_teach_bow_5);
	};
};

func void dia_bosper_teach_bow_back()
{
	Info_ClearChoices(dia_bosper_teach_bow);
};

func void dia_bosper_teach_bow_1()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
	b_teachplayertalentbowmake(self,other,BOW_BSPR_1);
	Info_ClearChoices(dia_bosper_teach_bow);
	CMPLTBOW_01 = FALSE;
};

func void dia_bosper_teach_bow_2()
{
	if(CMPLTBOW_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
		b_teachplayertalentbowmake(self,other,BOW_BSPR_2);
		Info_ClearChoices(dia_bosper_teach_bow);
	};
};

func void dia_bosper_teach_bow_3()
{
	if(CMPLTBOW_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
		b_teachplayertalentbowmake(self,other,BOW_BSPR_3);
		Info_ClearChoices(dia_bosper_teach_bow);
	};
};

func void dia_bosper_teach_bow_4()
{
	if(CMPLTBOW_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
		b_teachplayertalentbowmake(self,other,BOW_BSPR_4);
		Info_ClearChoices(dia_bosper_teach_bow);
	};
};

func void dia_bosper_teach_bow_5()
{
	if(CMPLTBOW_04 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//Okay. Listen, it's easy.
		b_teachplayertalentbowmake(self,other,BOW_BSPR_5);
		Info_ClearChoices(dia_bosper_teach_bow);
	};
};


instance DIA_BOSPER_PICKPOCKET(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 900;
	condition = dia_bosper_pickpocket_condition;
	information = dia_bosper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_bosper_pickpocket_condition()
{
	return c_beklauen(67,120);
};

func void dia_bosper_pickpocket_info()
{
	Info_ClearChoices(dia_bosper_pickpocket);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_BACK,dia_bosper_pickpocket_back);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_PICKPOCKET,dia_bosper_pickpocket_doit);
};

func void dia_bosper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bosper_pickpocket);
};

func void dia_bosper_pickpocket_back()
{
	Info_ClearChoices(dia_bosper_pickpocket);
};

