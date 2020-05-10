
instance DIA_ADDON_ROASTPIRATE_EXIT(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 999;
	condition = dia_addon_roastpirate_exit_condition;
	information = dia_addon_roastpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_roastpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


var int pir_1364_grog;

instance DIA_ADDON_ROASTPIRATE_GIMMEGROG(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 1;
	condition = dia_addon_roastpirate_gimmegrog_condition;
	information = dia_addon_roastpirate_gimmegrog_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_roastpirate_gimmegrog_condition()
{
	if((Npc_IsInState(self,zs_talk) == TRUE) && (Npc_WasInState(self,zs_roast_scavenger) == TRUE) && (PIR_1364_GROG == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_gimmegrog_info()
{
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_00");	//Ugh, this heat by the fire makes a body thirsty.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_06_01");	//Say, have you got some grog for me?
	Log_CreateTopic(TOPIC_ADDON_ROASTGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_ROASTGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_ROASTGROG,"The pirate at the fire needs a grog very badly.");
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	Info_AddChoice(dia_addon_roastpirate_gimmegrog,"No, I haven't got any.",dia_addon_roastpirate_gimmegrog_donthaveany);
	if(Npc_HasItems(other,itfo_addon_grog) >= 1)
	{
		Info_AddChoice(dia_addon_roastpirate_gimmegrog,"Here, take a sip.",dia_addon_roastpirate_gimmegrog_hereisgrog);
	};
};

func void dia_addon_roastpirate_gimmegrog_donthaveany()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_15_00");	//No, I haven't got any.
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_DontHaveAny_06_00");	//Rats, I guess I'll die of thirst then.
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	AI_StopProcessInfos(self);
};

func void dia_addon_roastpirate_gimmegrog_hereisgrog()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_15_00");	//Here, take a sip.
	b_giveinvitems(other,self,itfo_addon_grog,1);
	AI_Output(self,other,"DIA_Addon_PIR_6_GimmeGrog_HereIsGrog_06_01");	//Thanks, man!
	b_useitem(self,itfo_addon_grog);
	PIR_1364_GROG = TRUE;
	Info_ClearChoices(dia_addon_roastpirate_gimmegrog);
	b_logentry(TOPIC_ADDON_ROASTGROG,"The grog seems to have saved him from dying of thirst.");
	Npc_ExchangeRoutine(self,"START");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_ROASTPIRATE_SEICHTESWASSER(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 2;
	condition = dia_addon_roastpirate_seichteswasser_condition;
	information = dia_addon_roastpirate_seichteswasser_info;
	description = "What's up?";
};


func int dia_addon_roastpirate_seichteswasser_condition()
{
	return TRUE;
};

func void dia_addon_roastpirate_seichteswasser_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_SeichtesWasser_15_00");	//What's up?
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_01");	//I have to take care of this gluttonous crew here.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_02");	//That's why I'm standing here day and night, slaving over a hot frying pan.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_03");	//I'd much rather be combing the beach and the shallows for washed-up flotsam.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_04");	//Last week, a fat merchant vessel hit a reef right off the coast.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_05");	//And all that good stuff is washing up on the beach now.
	AI_Output(self,other,"DIA_Addon_PIR_6_SeichtesWasser_06_06");	//I really hope somebody's going to take over my duties soon.
};


instance DIA_ADDON_ROASTPIRATE_FRANCIS(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 3;
	condition = dia_addon_roastpirate_francis_condition;
	information = dia_addon_roastpirate_francis_info;
	permanent = FALSE;
	description = "What can you tell me about Francis?";
};


func int dia_addon_roastpirate_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_roastpirate_francis_info()
{
	AI_Output(other,self,"DIA_Addon_PIR_6_FRANCIS_15_00");	//What can you tell me about Francis?
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_01");	//Francis? He's acting up like he's our captain. But just wait until Greg comes back.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_02");	//Then he'll crawl back under his rock and shrivel like a worm.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_04");	//He's pulling a fast one on everybody, if you ask me. I bet he's lining his own pockets.
	AI_Output(self,other,"DIA_Addon_PIR_6_Francis_06_05");	//I didn't tell you this. And as long as there is no proof, you had better not repeat this to anybody.
};


instance DIA_ADDON_ROASTPIRATE_PERM(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 99;
	condition = dia_addon_roastpirate_perm_condition;
	information = dia_addon_roastpirate_perm_info;
	permanent = TRUE;
	description = "Anything else?";
};


func int dia_addon_roastpirate_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_roastpirate_seichteswasser))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_perm_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Matt_Job_15_00");	//Anything else?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if((randy == 0) && !Npc_IsDead(francis))
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_02");	//If I were Greg, I'd send Francis to the swamp.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_03");	//Now that Greg is back, the bandits are bound to think twice before they attack us.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_01");	//There's more work now that Greg is back, but at least we get paid for it properly.
		};
	}
	else if((randy == 0) && !Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_06");	//Francis is a total loser. Everything's been going to shambles here since he's been the camp leader.
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_05");	//Let those bandits go ahead and attack. They'll never know what hit them.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_PIR_6_Chef_06_04");	//Just as long as Greg comes back soon. I want to go back out, to the open sea.
	};
};


instance DIA_ADDON_ROASTPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 11;
	condition = dia_addon_roastpirate_anheuern_condition;
	information = dia_addon_roastpirate_anheuern_info;
	permanent = FALSE;
	description = "You're supposed to help me.";
};


func int dia_addon_roastpirate_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_01");	//You're supposed to help me.
	AI_Output(other,self,"DIA_Addon_Matt_FollowMe_15_03");	//Orders from Greg.
	b_say(self,other,"$ABS_GOOD");
};


instance DIA_ADDON_ROASTPIRATE_COMEON(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 12;
	condition = dia_addon_roastpirate_comeon_condition;
	information = dia_addon_roastpirate_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_roastpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_roastpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_ComeOn_15_00");	//Come with me.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$RUNAWAY");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ROASTPIRATE_GOHOME(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 13;
	condition = dia_addon_roastpirate_gohome_condition;
	information = dia_addon_roastpirate_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_roastpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_RoastPirate_GoHome_15_00");	//I no longer need you.
	b_say(self,other,"$ABS_GOOD");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ROASTPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1364_addon_pirat;
	nr = 14;
	condition = dia_addon_roastpirate_toofar_condition;
	information = dia_addon_roastpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_roastpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_roastpirate_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

