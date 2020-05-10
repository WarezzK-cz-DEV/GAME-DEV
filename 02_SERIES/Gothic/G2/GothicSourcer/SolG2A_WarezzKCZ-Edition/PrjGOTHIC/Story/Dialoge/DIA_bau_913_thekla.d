
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//What are you doing here in my kitchen?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "Something smells delicious here!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Something smells delicious here!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//Oh yes! I know the likes of you! They're swarming all over the place.
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//First they try to get on your good side, and then, when you need them, they're nowhere to be seen!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "I'm hungry!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//I'm hungry!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//I don't dish out food to tramps. I only feed people who work.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(contemptuously) And that mercenary riffraff, of course.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Here, your grub.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//We don't serve militiamen here.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//How could I refuse the request of a representative of Innos?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "I'm looking for work...";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//I'm looking for work...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//You want to work here on the farm?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//Only Onar can decide that. The farm is his, and so's the entire valley.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "Actually, I was planning to join the mercenaries...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//Actually, I was planning to join the mercenaries...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//So you're another of those felons from the penal colony?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//I might have known! Just leave me alone! There's already enough of your kind around here!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "I need a place to sleep.";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//I need a place to sleep.
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Don't even think about sleeping in my kitchen. Go find yourself a place in the barn.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "What's your problem with the mercenaries?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//What's your problem with the mercenaries?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ah, those morons really get on my nerves! Especially Sylvio and his fat buddy Bullco.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//The two of them have been sitting in their corner for days now, making life miserable for me.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//The soup is too hot, the meat is too tough, et cetera and so forth.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//Then why don't you do anything about it?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//And what am I to do, Mr. Smartypants? Whack them with my rolling pin? I can do that to the farmers, but these lowly bastards just hit back.
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "Want me to teach the two of them some manners?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Want me to teach the two of them some manners?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//You had better not try that, honey. As far as I know, Sylvio has magic armor. He can't be defeated.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//And what about Bullco?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//That guy is strong as an ox. So far, he has flattened anyone who tried to mess with him or Sylvio.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//You really let Bullco have it, honey.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//Must have been an exhausting job to thrash that fat swine.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//That's quite a licking you took there, honey.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//Didn't I tell you? Now you know what I mean.
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//I'm happy to see you're having fun.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//Now don't you pull a face like that. You're not the first one who got beaten up by that scum.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Here, have a bite to eat so you'll gain back your strength.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "Here's the package from Sagitta.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Here's the package from Sagitta.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Thanks a lot. So you can make yourself useful after all.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "Can I have some more of your stew?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Can I have some more of your stew?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//I haven't got any now.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Not even a tiny bowl?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//No.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//Can I lick the pot, then?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Will you cut it out!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//If you're so keen on my stew, you'll have to do something to get it.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//What?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Go see Sagitta, the healer who lives behind Sekob's farm, and bring me a package of her herbs.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//If you bring me the herbs, I'll make you some stew.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		CreateInvItems(sagitta,itmi_theklaspaket,1);
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"If I bring Thekla the herbs from Sagitta the healer, she'll cook another stew for me. Sagitta lives behind Sekob's farm.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//All right. I'll be nice, then. Here. So you won't starve before my very eyes.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Hey, hey, hey, not so greedy! I'll let you know when I have anything else for you to do.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//And THEN you can have more stew, got it?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//I heard you helped Bennet get out of jail. Good job, kid.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//These militia bastards threw Bennet in the hole.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Do me a favor and get him out of there, will you? In the meantime, I'll cook you some yummy stew.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//I've got nothing left. Come back later.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//You're always hungry, aren't you? Just what is it you do all the time?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//I've done in a few dragons.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Oh! I guess it's time for a hearty bowl of stew, then.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//That was it. No more stew left over.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//No herbs, no stew - understood?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};

