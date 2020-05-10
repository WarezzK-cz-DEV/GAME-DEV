
instance DIA_HARAD_EXIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 999;
	condition = dia_harad_exit_condition;
	information = dia_harad_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_harad_exit_condition()
{
	return TRUE;
};

func void dia_harad_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARAD_HALLO(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_hallo_condition;
	information = dia_harad_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_harad_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_hallo_info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(grumpy) What do you want?
};


instance DIA_HARAD_ARBEIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_arbeit_condition;
	information = dia_harad_arbeit_info;
	permanent = FALSE;
	description = "I'm looking for work.";
};


func int dia_harad_arbeit_condition()
{
	return TRUE;
};

func void dia_harad_arbeit_info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//I'm looking for work!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//Hm - I could use a new apprentice.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//Brian will have finished his apprenticeship soon, and then he'll leave the city.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//Are you good for anything?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//If you mean, do I know blacksmith's work...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//No. That's not what I meant.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//Sooner or later, the orcs are going to lay siege to the city, and then the only men who will count will be those who are in a position to defend our city.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//And I won't take on anyone as an apprentice who will disgrace me by fleeing the city with the women and the good-for-nothings, instead of holding the fort here with the men.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"If I can convince Harad that I'm not a good-for-nothing, he'll accept me as his apprentice.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "I'm not a good-for-nothing!";
};


func int dia_harad_taugenichts_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};

func void dia_harad_taugenichts_info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//I'm not a good-for-nothing!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//Those are big words! Can you back them up with big deeds?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//What are you getting at?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//Bring me an orc's weapon.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//Orcs have been seen near the city. With a bit of luck, you won't have to search for long.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//If you manage to bring one down, I'll take you on as an apprentice.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//Provided the other masters agree.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"An orc has been sited outside the city. The smith Harad wants me to kill it. An orc weapon will be evidence enough.");
};


instance DIA_HARAD_ORCRUNNING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcrunning_condition;
	information = dia_harad_orcrunning_info;
	permanent = FALSE;
	description = "Let's talk again about that orc thing...";
};


func int dia_harad_orcrunning_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && (HARAD_HAKONMISSION == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_orcrunning_info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//Let's talk again about that orc thing...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(brusque) What?
	Info_ClearChoices(dia_harad_orcrunning);
	Info_AddChoice(dia_harad_orcrunning,"Your orc is as good as dead!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"An orc is a damn tough opponent...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//But an orc is a damn tough opponent...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//Hm - looking at you, you might be right. You don't have much meat on your bones. But that can change.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//Nevertheless, you have to prove to me that you have the courage to fight.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//So couldn't it be something slightly smaller?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//Hm - (considering) Hakon, the weapons dealer in the marketplace, told me that he was attacked by bandits a few days ago.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//The bastards are said to be roaming around somewhere outside the east gate.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//Those cowardly rogues shouldn't be terribly bright.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//Hunt the bastards down! Every single one of them. Then I'll know that we can use you here in the city.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"Harad told me bandits robbed the merchant Hakon outside the city. If I can hunt them down, he'll be convinced that I'm good. I should have a word with Hakon. Maybe he knows a bit more about where those bandits hang out.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"Harad told me bandits robbed the merchant Hakon outside the city. If I can hunt them down, he'll be convinced that I'm good.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//Your orc is as good as dead!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//Good! Then stop wasting your breath and let your deeds speak for themselves.
	Info_ClearChoices(dia_harad_orcrunning);
};


instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "I've got the orc weapon you wanted.";
};


func int dia_harad_orcsuccess_condition()
{
	if(MIS_HARAD_ORC == LOG_RUNNING)
	{
		if((Npc_HasItems(other,itmw_2h_orcaxe_01) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_02) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_03) > 0) || (Npc_HasItems(other,itmw_2h_orcaxe_04) > 0) || (Npc_HasItems(other,itmw_2h_orcsword_01) > 0))
		{
			return TRUE;
		};
	};
};

func void dia_harad_orcsuccess_info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//I've got the orc weapon you wanted.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//Show me...
	if(Npc_HasItems(other,itmw_2h_orcaxe_01) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_02) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_03) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_03,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_04) > 0)
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_04,1);
	}
	else
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_01,1);
	};
	if(HARAD_HAKONMISSION == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//You did it AFTER ALL? Good man!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//It's been a while since I've had a weapon like this in my hands - I was a soldier back in the Orc War.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//Those were tough times, I can tell you.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//I knew there was a reason I took you on as an apprentice. Well done!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//I didn't think you could do it. I'm impressed.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//Too bad you've decided on another path.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//I could have really used you.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"Harad will accept me as his apprentice if I can get the approval of the other masters.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "When can I start as your apprentice?";
};


func int dia_harad_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_harad_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//When can I start as your apprentice?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//We can really use a man around here who can beat an orc.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//Moreover, Hakon told me how you settled the business with the bandits. Good man!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//You didn't kill an orc, but Hakon told me how you settled the business with the bandits. Good man!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//As far as I am concerned, you can start here right away.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//As for the other masters...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//Thorben has given you his blessing.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//Good old Thorben just wants you to get the blessing of the gods. I think that's a good idea.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//Thorben says he's never spoken to you.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//Bosper tried to talk me out of it. He wants you as an apprentice for himself.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//I had a brief, but intense, discussion with him on this matter.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//In the end, he agreed.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//He asked me to at least give him the opportunity to interest you in his profession.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//Take a look at it - you can always decide afterwards. Unless you don't want his vote, that is.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//And Bosper doesn't know you yet.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//As usual, Constantino doesn't care about anything. He said that as far as he's concerned, you can start wherever you like.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//Constantino says you are accused of a crime here in the city - is that true?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//If so, then you should get that straightened out immediately!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//Constantino has never heard of you.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//And Matteo says you brought him back his gold. Seems to me, you're an honorable young man.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//And Matteo says you still owe him something. I don't know what there is between you, but you should get that straightened out.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//And Matteo says he's never talked about this with you.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//And Matteo says he's never seen you in his shop.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//That means you have the approval of all the masters!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//That means you have the approval of four masters. That's enough to be accepted as an apprentice.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//Are you ready to start your apprenticeship with me?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"Good - I'll think about it.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"I'm in!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//You need the approval of at least four masters in order to be accepted as an apprentice in the lower part of town.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//So you should talk to all of them who still aren't convinced about you.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//Not before you've proven to me that you're good for something.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//Count me in!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//Good! I'll teach you how to forge a decent sword.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//What are my tasks as an apprentice?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//Three guesses.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//Forge, forge, and forge?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//You aren't as dumb as you look. I pay per blade. If you don't work, there's no money. It's that simple.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//Furthermore, I'll teach you everything you need to know to make a plain sword.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//Making magic blades is only something for experienced smiths - and you're a long way from that...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//If you need a place to sleep, you can bunk down somewhere in my house. Everything clear so far?
	if(PLAYER_TALENT_SMITH[0] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//I already know how to do that!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//Well, all the better!
	};
	if(other.attribute[ATR_STRENGTH] < (T_MED - 60))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//Besides that, it's time you got a bit stronger. You're wasting away before my very eyes!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	Npc_ExchangeRoutine(lothar,"START");
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"Harad has accepted me as his apprentice. I now have access to the upper quarter.");
	b_logentry(TOPIC_BONUS,"Harad will buy the weapons I forge for a good price.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"Harad can teach me the art of smithery. He can also help me become stronger.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//Good - I'll think about it.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//Take your time. Brian will still be here for a while.
	};
	Info_ClearChoices(dia_harad_lehrling);
};


instance DIA_HARAD_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_zustimmung_condition;
	information = dia_harad_zustimmung_info;
	permanent = TRUE;
	description = "Can I sign on as an apprentice with a different master?";
};


func int dia_harad_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};


var int dia_harad_zustimmung_permanent;

func void dia_harad_zustimmung_info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//Can I sign on as an apprentice with a different master?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//You're a good man.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//Hakon told me how you handled the bandits.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//I'll give you my approval.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"Harad will give his approval if I want to start as an apprentice somewhere.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//Brian will still be here for a while. And a strong lad to take his place will turn up in time.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//The other masters may well approve. But I will only give you my approval when you first prove that you're good for something!
	};
};


var int harad_milkommentar;
var int harad_palkommentar;
var int harad_innoskommentar;

instance DIA_HARAD_ALSLEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_alslehrling_condition;
	information = dia_harad_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_harad_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_HARAD) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_harad_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (HARAD_STARTGUILD != GIL_MIL) && (HARAD_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//You're with the militia now? I'm proud of you!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//As long as you're in the army, naturally I won't expect you to fulfill your duties as an apprentice as well.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//But if you need anything, you can come to me any time.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//You managed to get accepted with the paladins!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//I'm glad I took you on as an apprentice. Even if you didn't spend a lot of time behind the anvil.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//So you've entered the monastery. I'd have preferred it if you'd stayed in the city. We need every good man.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//But if you had to follow the call of Innos, then that's the way it is.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//If you need anything from me, I'm here for you.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//It's been a while since the last time you were here. Where have you been hanging around, hm?
		HARAD_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//There you are again...
		HARAD_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_HARAD_WAFFEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_waffen_condition;
	information = dia_harad_waffen_info;
	permanent = FALSE;
	description = "Do you sell weapons, too?";
};


func int dia_harad_waffen_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_harad_waffen_info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//Do you sell weapons, too?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//Forget it. Everything I make goes to the paladins or the militia.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//I have a commission for 100 swords from Lord Hagen. He wants to equip the city guard.
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "Sale forged weapons.";
};


func int dia_harad_sellblades_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_sellblades_info()
{
	var C_ITEM equipweap;
	var int anzahl_firstblade;
	var int anzahl_firstblade2h;
	var int anzahl_1hfinesword;
	var int anzahl_2hfinesword;
	var int anzahl_sot;
	var int anzahl_claymore;
	var int anzahl_finebastard;
	var int anzahl_flameberge;
	var int anzahl_anduril;
	var int anzahl_demonslayer;
	var int gesamt;
	var string concattext;
	var int lohn;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//I want to sell the weapons I forged.
	equipweap = Npc_GetEquippedMeleeWeapon(other);
	anzahl_firstblade = Npc_HasItems(other,itmw_firstblade);
	if(Hlp_IsItem(equipweap,itmw_firstblade) == TRUE)
	{
		if(anzahl_firstblade > 1)
		{
			Npc_RemoveInvItems(other,itmw_firstblade,anzahl_firstblade);
		};
		anzahl_firstblade -= 1;
	};
	anzahl_firstblade2h = Npc_HasItems(other,itmw_firstblade2h);
	if(Hlp_IsItem(equipweap,itmw_firstblade2h) == TRUE)
	{
		if(anzahl_firstblade2h > 1)
		{
			Npc_RemoveInvItems(other,itmw_firstblade2h,anzahl_firstblade2h);
		};
		anzahl_firstblade2h -= 1;
	};
	anzahl_1hfinesword = Npc_HasItems(other,itmw_1hfinesword);
	if(Hlp_IsItem(equipweap,itmw_1hfinesword) == TRUE)
	{
		if(anzahl_1hfinesword > 1)
		{
			Npc_RemoveInvItems(other,itmw_1hfinesword,anzahl_1hfinesword);
		};
		anzahl_1hfinesword = anzahl_1hfinesword - 1;
	};
	anzahl_2hfinesword = Npc_HasItems(other,itmw_2hfinesword);
	if(Hlp_IsItem(equipweap,itmw_2hfinesword) == TRUE)
	{
		if(anzahl_2hfinesword > 1)
		{
			Npc_RemoveInvItems(other,itmw_2hfinesword,anzahl_2hfinesword);
		};
		anzahl_2hfinesword = anzahl_2hfinesword - 1;
	};
	anzahl_sot = Npc_HasItems(other,itmw_sot);
	if(Hlp_IsItem(equipweap,itmw_sot) == TRUE)
	{
		if(anzahl_sot > 1)
		{
			Npc_RemoveInvItems(other,itmw_sot,anzahl_sot);
		};
		anzahl_sot = anzahl_sot - 1;
	};
	anzahl_claymore = Npc_HasItems(other,itmw_claymore);
	if(Hlp_IsItem(equipweap,itmw_claymore) == TRUE)
	{
		if(anzahl_claymore > 1)
		{
			Npc_RemoveInvItems(other,itmw_claymore,anzahl_claymore);
		};
		anzahl_claymore = anzahl_claymore - 1;
	};
	anzahl_finebastard = Npc_HasItems(other,itmw_finebastard);
	if(Hlp_IsItem(equipweap,itmw_finebastard) == TRUE)
	{
		if(anzahl_finebastard > 1)
		{
			Npc_RemoveInvItems(other,itmw_finebastard,anzahl_finebastard);
		};
		anzahl_finebastard = anzahl_finebastard - 1;
	};
	anzahl_flameberge = Npc_HasItems(other,itmw_flameberge);
	if(Hlp_IsItem(equipweap,itmw_flameberge) == TRUE)
	{
		if(anzahl_flameberge > 1)
		{
			Npc_RemoveInvItems(other,itmw_flameberge,anzahl_flameberge);
		};
		anzahl_flameberge = anzahl_flameberge - 1;
	};
	anzahl_anduril = Npc_HasItems(other,itmw_anduril);
	if(Hlp_IsItem(equipweap,itmw_anduril) == TRUE)
	{
		if(anzahl_anduril > 1)
		{
			Npc_RemoveInvItems(other,itmw_anduril,anzahl_anduril);
		};
		anzahl_anduril = anzahl_anduril - 1;
	};
	anzahl_demonslayer = Npc_HasItems(other,itmw_demonslayer);
	if(Hlp_IsItem(equipweap,itmw_demonslayer) == TRUE)
	{
		if(anzahl_demonslayer > 1)
		{
			Npc_RemoveInvItems(other,itmw_demonslayer,anzahl_demonslayer);
		};
		anzahl_demonslayer = anzahl_demonslayer - 1;
	};
	gesamt = anzahl_firstblade + anzahl_firstblade2h + anzahl_1hfinesword + anzahl_2hfinesword + anzahl_sot + anzahl_claymore + anzahl_finebastard + anzahl_flameberge + anzahl_anduril + anzahl_demonslayer;
	if(gesamt == 0)
	{
		if((Hlp_IsItem(equipweap,itmw_firstblade) == TRUE) || (Hlp_IsItem(equipweap,itmw_firstblade2h) == TRUE) || (Hlp_IsItem(equipweap,itmw_1hfinesword) == TRUE) || (Hlp_IsItem(equipweap,itmw_2hfinesword) == TRUE) || (Hlp_IsItem(equipweap,itmw_sot) == TRUE) || (Hlp_IsItem(equipweap,itmw_claymore) == TRUE) || (Hlp_IsItem(equipweap,itmw_finebastard) == TRUE) || (Hlp_IsItem(equipweap,itmw_flameberge) == TRUE) || (Hlp_IsItem(equipweap,itmw_anduril) == TRUE) || (Hlp_IsItem(equipweap,itmw_demonslayer) == TRUE))
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//All you have is the one on your belt. You'd better keep it.
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//Then make some! I'll only accept plain swords.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//Good - give it here.
		if(Hlp_IsItem(equipweap,itmw_firstblade) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_firstblade,anzahl_firstblade);
		};
		if(Hlp_IsItem(equipweap,itmw_firstblade2h) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_firstblade2h,anzahl_firstblade2h);
		};
		if(Hlp_IsItem(equipweap,itmw_1hfinesword) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_1hfinesword,anzahl_1hfinesword);
		};
		if(Hlp_IsItem(equipweap,itmw_2hfinesword) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_2hfinesword,anzahl_2hfinesword);
		};
		if(Hlp_IsItem(equipweap,itmw_sot) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_sot,anzahl_sot);
		};
		if(Hlp_IsItem(equipweap,itmw_claymore) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_claymore,anzahl_claymore);
		};
		if(Hlp_IsItem(equipweap,itmw_finebastard) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_finebastard,anzahl_finebastard);
		};
		if(Hlp_IsItem(equipweap,itmw_flameberge) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_flameberge,anzahl_flameberge);
		};
		if(Hlp_IsItem(equipweap,itmw_anduril) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_anduril,anzahl_anduril);
		};
		if(Hlp_IsItem(equipweap,itmw_demonslayer) != TRUE)
		{
			Npc_RemoveInvItems(other,itmw_demonslayer,anzahl_demonslayer);
		};
		concattext = ConcatStrings(IntToString(gesamt),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//Fine, and here's your pay.
		lohn = (anzahl_firstblade * VALUE_FIRSTBLADE) + (anzahl_firstblade2h * VALUE_FIRSTBLADE2H) + (anzahl_1hfinesword * VALUE_1HFINESWORD) + (anzahl_2hfinesword * VALUE_2HFINESWORD) + (anzahl_sot * VALUE_SOT) + (anzahl_claymore * VALUE_CLAYMORE) + (anzahl_finebastard * VALUE_FINEBASTARD) + (anzahl_flameberge * VALUE_FLAMEBERGE) + (anzahl_anduril * VALUE_ANDURIL) + (anzahl_demonslayer * VALUE_DEMONSLAYER);
		lohn = lohn / 3;
		b_giveinvitems(self,other,itmi_gold,lohn);
	};
};

func void b_harad_teachsmith()
{
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//It's quite simple, boy. Get a piece of raw steel and hold it in the fire until it glows.
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//Then you pound the blade into shape on the anvil.
};

func void b_haradsmithchoices()
{
	Info_ClearChoices(dia_harad_teachsmith);
	Info_AddChoice(dia_harad_teachsmith,DIALOG_BACK,dia_harad_teachsmith_back);
	if((PLAYER_TALENT_SMITH[12] == FALSE) && (PLAYER_TALENT_SMITH[11] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ITMW_ANDURIL,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_ANDURIL)),dia_harad_teachsmith_anduril);
	};
	if((PLAYER_TALENT_SMITH[11] == FALSE) && (PLAYER_TALENT_SMITH[10] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ITMW_FINEBASTARD,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_FINEBASTARD)),dia_harad_teachsmith_finebastard);
	};
	if((PLAYER_TALENT_SMITH[10] == FALSE) && (PLAYER_TALENT_SMITH[9] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ITMW_SOT,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SOT)),dia_harad_teachsmith_sot);
	};
	if((PLAYER_TALENT_SMITH[9] == FALSE) && (PLAYER_TALENT_SMITH[0] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ITMW_1HFINESWORD,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_1HFINESWORD)),dia_harad_teachsmith_1hfinesword);
	};
	if(PLAYER_TALENT_SMITH[0] == FALSE)
	{
		Info_AddChoice(dia_harad_teachsmith,b_buildlearnstring(NAME_ITMW_FIRSTBLADE,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_FIRSTBLADE)),dia_harad_teachsmith_firstblade);
	};
};

func void b_haradsmithchoicesheavy()
{
	Info_ClearChoices(dia_harad_teachsmithheavy);
	Info_AddChoice(dia_harad_teachsmithheavy,DIALOG_BACK,dia_harad_teachsmithheavy_back);
	if((PLAYER_TALENT_SMITH[17] == FALSE) && (PLAYER_TALENT_SMITH[16] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithheavy,b_buildlearnstring(NAME_ITMW_FLAMEBERGE,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_FLAMEBERGE)),dia_harad_teachsmith_flameberge);
	};
	if((PLAYER_TALENT_SMITH[16] == FALSE) && (PLAYER_TALENT_SMITH[14] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithheavy,b_buildlearnstring(NAME_ITMW_DEMONSLAYER,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_DEMONSLAYER)),dia_harad_teachsmith_demonslayer);
	};
	if((PLAYER_TALENT_SMITH[14] == FALSE) && (PLAYER_TALENT_SMITH[15] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithheavy,b_buildlearnstring(NAME_ITMW_CLAYMORE,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_CLAYMORE)),dia_harad_teachsmith_claymore);
	};
	if((PLAYER_TALENT_SMITH[15] == FALSE) && (PLAYER_TALENT_SMITH[13] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithheavy,b_buildlearnstring(NAME_ITMW_2HFINESWORD,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_2HFINESWORD)),dia_harad_teachsmith_2hfinesword);
	};
	if(PLAYER_TALENT_SMITH[13] == FALSE)
	{
		Info_AddChoice(dia_harad_teachsmithheavy,b_buildlearnstring(NAME_ITMW_FIRSTBLADE2H,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_FIRSTBLADE2H)),dia_harad_teachsmith_firstblade2h);
	};
};

func void b_haradsmithchoicesshields()
{
	Info_ClearChoices(dia_harad_teachsmithshields);
	Info_AddChoice(dia_harad_teachsmithshields,DIALOG_BACK,dia_harad_teachsmithshields_back);
	if((PLAYER_TALENT_SMITH[24] == FALSE) && (PLAYER_TALENT_SMITH[23] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithshields,b_buildlearnstring(NAME_ITSH_HARAD_05,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_HARAD_05)),dia_harad_teachsmith_sh_05);
	};
	if((PLAYER_TALENT_SMITH[23] == FALSE) && (PLAYER_TALENT_SMITH[22] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithshields,b_buildlearnstring(NAME_ITSH_HARAD_04,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_HARAD_04)),dia_harad_teachsmith_sh_04);
	};
	if((PLAYER_TALENT_SMITH[22] == FALSE) && (PLAYER_TALENT_SMITH[21] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithshields,b_buildlearnstring(NAME_ITSH_HARAD_03,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_HARAD_03)),dia_harad_teachsmith_sh_03);
	};
	if((PLAYER_TALENT_SMITH[21] == FALSE) && (PLAYER_TALENT_SMITH[20] == TRUE))
	{
		Info_AddChoice(dia_harad_teachsmithshields,b_buildlearnstring(NAME_ITSH_HARAD_02,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_HARAD_02)),dia_harad_teachsmith_sh_02);
	};
	if(PLAYER_TALENT_SMITH[20] == FALSE)
	{
		Info_AddChoice(dia_harad_teachsmithshields,b_buildlearnstring(NAME_ITSH_HARAD_01,b_getlearncosttalent(other,NPC_TALENT_SMITH,WEAPON_SH_HARAD_01)),dia_harad_teachsmith_sh_01);
	};
};


instance DIA_HARAD_TEACHSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachsmith_condition;
	information = dia_harad_teachsmith_info;
	permanent = TRUE;
	description = "Teach me how to forge one-handed sword!";
};


func int dia_harad_teachsmith_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		if((PLAYER_TALENT_SMITH[0] == FALSE) || (PLAYER_TALENT_SMITH[9] == FALSE) || (PLAYER_TALENT_SMITH[10] == FALSE) || (PLAYER_TALENT_SMITH[11] == FALSE) || (PLAYER_TALENT_SMITH[12] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_teachsmith_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Teach me how to forge a decent sword!
	b_haradsmithchoices();
};


instance DIA_HARAD_TEACHSMITHHEAVY(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachsmithheavy_condition;
	information = dia_harad_teachsmithheavy_info;
	permanent = TRUE;
	description = "Teach me how to forge two-handed sword!";
};


func int dia_harad_teachsmithheavy_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		if((PLAYER_TALENT_SMITH[13] == FALSE) || (PLAYER_TALENT_SMITH[15] == FALSE) || (PLAYER_TALENT_SMITH[14] == FALSE) || (PLAYER_TALENT_SMITH[16] == FALSE) || (PLAYER_TALENT_SMITH[17] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_teachsmithheavy_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//Teach me how to forge a decent sword!
	b_haradsmithchoicesheavy();
};


instance DIA_HARAD_TEACHSMITHSHIELDS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachsmithshields_condition;
	information = dia_harad_teachsmithshields_info;
	permanent = TRUE;
	description = "Learn how to forge shields";
};


func int dia_harad_teachsmithshields_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		if((PLAYER_TALENT_SMITH[20] == FALSE) || (PLAYER_TALENT_SMITH[21] == FALSE) || (PLAYER_TALENT_SMITH[22] == FALSE) || (PLAYER_TALENT_SMITH[23] == FALSE) || (PLAYER_TALENT_SMITH[24] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_harad_teachsmithshields_info()
{
	b_haradsmithchoicesshields();
};

func void dia_harad_teachsmith_back()
{
	Info_ClearChoices(dia_harad_teachsmith);
};

func void dia_harad_teachsmithheavy_back()
{
	Info_ClearChoices(dia_harad_teachsmithheavy);
};

func void dia_harad_teachsmithshields_back()
{
	Info_ClearChoices(dia_harad_teachsmithshields);
};

func void dia_harad_teachsmith_firstblade()
{
	b_harad_teachsmith();
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Your first swords won't be masterpieces, but you can learn everything else later.
	b_teachplayertalentsmith(self,other,WEAPON_FIRSTBLADE);
	b_haradsmithchoices();
	CMPLT1HSWORD_01 = FALSE;
};

func void dia_harad_teachsmith_1hfinesword()
{
	if(CMPLT1HSWORD_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_1HFINESWORD);
		b_haradsmithchoices();
	};
};

func void dia_harad_teachsmith_sot()
{
	if(CMPLT1HSWORD_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_SOT);
		b_haradsmithchoices();
	};
};

func void dia_harad_teachsmith_finebastard()
{
	if(CMPLT1HSWORD_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_FINEBASTARD);
		b_haradsmithchoices();
	};
};

func void dia_harad_teachsmith_anduril()
{
	if(CMPLT1HSWORD_04 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_ANDURIL);
		b_haradsmithchoices();
	};
};

func void dia_harad_teachsmith_firstblade2h()
{
	b_harad_teachsmith();
	AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//Your first swords won't be masterpieces, but you can learn everything else later.
	b_teachplayertalentsmith(self,other,WEAPON_FIRSTBLADE2H);
	b_haradsmithchoicesheavy();
	CMPLT2HSWORD_01 = FALSE;
};

func void dia_harad_teachsmith_2hfinesword()
{
	if(CMPLT2HSWORD_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_2HFINESWORD);
		b_haradsmithchoicesheavy();
	};
};

func void dia_harad_teachsmith_claymore()
{
	if(CMPLT2HSWORD_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_CLAYMORE);
		b_haradsmithchoicesheavy();
	};
};

func void dia_harad_teachsmith_demonslayer()
{
	if(CMPLT2HSWORD_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_DEMONSLAYER);
		b_haradsmithchoicesheavy();
	};
};

func void dia_harad_teachsmith_flameberge()
{
	if(CMPLT2HSWORD_04 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_harad_teachsmith();
		b_teachplayertalentsmith(self,other,WEAPON_FLAMEBERGE);
		b_haradsmithchoicesheavy();
	};
};

func void dia_harad_teachsmith_sh_01()
{
	b_teachplayertalentsmith(self,other,WEAPON_SH_HARAD_01);
	b_haradsmithchoicesshields();
};

func void dia_harad_teachsmith_sh_02()
{
	if(CMPLTHARSH_01 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_HARAD_02);
		b_haradsmithchoicesshields();
	};
};

func void dia_harad_teachsmith_sh_03()
{
	if(CMPLTHARSH_02 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_HARAD_03);
		b_haradsmithchoicesshields();
	};
};

func void dia_harad_teachsmith_sh_04()
{
	if(CMPLTHARSH_03 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_HARAD_04);
		b_haradsmithchoicesshields();
	};
};

func void dia_harad_teachsmith_sh_05()
{
	if(CMPLTHARSH_04 == FALSE)
	{
		AI_PrintScreen(PRINT_NMPREBOW,-1,52,FONT_SCREENBRIGHTLARGE,3);
		AI_StopProcessInfos(self);
	}
	else
	{
		b_teachplayertalentsmith(self,other,WEAPON_SH_HARAD_05);
		b_haradsmithchoicesshields();
	};
};


var int harad_merke_str;

instance DIA_HARAD_TEACHSTR(C_INFO)
{
	npc = vlk_412_harad;
	nr = 100;
	condition = dia_harad_teachstr_condition;
	information = dia_harad_teachstr_info;
	permanent = 1;
	description = "I want to become stronger!";
};


func int dia_harad_teachstr_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_teachstr_info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//I want to become stronger!
	HARAD_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_back()
{
	if(HARAD_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//You've already put on a bit of muscle.
	};
	if(other.attribute[ATR_STRENGTH] < T_MEGA)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//Come back if you want to learn more.
	};
	Info_ClearChoices(dia_harad_teachstr);
};

func void dia_harad_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_harad_teachstr_5);
};


instance DIA_HARAD_IMMERNOCH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_immernoch_condition;
	information = dia_harad_immernoch_info;
	permanent = FALSE;
	description = "Are you still working for the paladins?";
};


func int dia_harad_immernoch_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_harad_immernoch_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//Are you still working for the paladins?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//I finished the commission from Lord Hagen.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//Now I'm making magic ore blades for him - but for pay this time.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//But I also have the time again to make a few weapons on the side for the merchants in the marketplace.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//So, if you're looking for a good blade, you should try with them.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "Tell me more about magic ore blades!";
};


func int dia_harad_abouterzklingen_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_immernoch))
	{
		return TRUE;
	};
};

func void dia_harad_abouterzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//Tell me more about magic ore blades!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//Creating a magic blade is a very complicated and expensive process, but the result is a blade that's easy to handle and practically indestructible.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//The blade is certainly of good quality, but it will only show its true power in the hands of a paladin.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//A paladin's sword is consecrated by Innos. As a result, the magic blade becomes an enchanted weapon that does incomparable damage!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "I want to buy a magic ore blade.";
};


func int dia_harad_erzklingen_condition()
{
	if((OREBLADEBOUGHT == FALSE) && Npc_KnowsInfo(other,dia_harad_abouterzklingen))
	{
		return TRUE;
	};
};


var int orebladebought;

func void dia_harad_erzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//I want to buy a magic ore blade.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//I can only sell magic blades to the paladins. And even then only one each.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//You paladins can count yourselves lucky to be allowed to wield such excellent blades.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//By decree of Lord Hagen, I may only sell you a single magic weapon.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//So, what can I offer you?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Two-handed sword (2000 gold)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"One-handed sword (2000 gold)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//You don't have enough gold.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//Take good care of your new weapon. It's worth a fortune.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//I'll take the two-handed sword!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_2H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_2H_1);
		CreateInvItems(self,itmw_2h_blessed_01,1);
		b_giveinvitems(self,other,itmw_2h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Two-handed sword (2000 gold)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"One-handed sword (2000 gold)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//I'll take the one-handed sword!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_1H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_1H_1);
		CreateInvItems(self,itmw_1h_blessed_01,1);
		b_giveinvitems(self,other,itmw_1h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"Two-handed sword (2000 gold)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"One-handed sword (2000 gold)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "Can you repair jewelry?";
};


func int dia_harad_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_harad_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//Can you repair jewelry?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//I'm a weapon smith, not a goldsmith. You probably won't find anyone here in the city who can help you.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//People don't have money in their pockets any more, and nobody's gotten rich here in quite a while.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//Most of them are just glad if they have enough to eat.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "Where can I find a goldsmith?";
};


func int dia_harad_goldsmith_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_harad_goldsmith_info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//Where can I find a goldsmith?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//There's supposed to be a good smith with the mercenaries on Onar's farm.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//Maybe you should look there.
};


instance DIA_HARAD_PICKPOCKET(C_INFO)
{
	npc = vlk_412_harad;
	nr = 900;
	condition = dia_harad_pickpocket_condition;
	information = dia_harad_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_harad_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_harad_pickpocket_info()
{
	Info_ClearChoices(dia_harad_pickpocket);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_BACK,dia_harad_pickpocket_back);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_PICKPOCKET,dia_harad_pickpocket_doit);
};

func void dia_harad_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_harad_pickpocket);
};

func void dia_harad_pickpocket_back()
{
	Info_ClearChoices(dia_harad_pickpocket);
};

