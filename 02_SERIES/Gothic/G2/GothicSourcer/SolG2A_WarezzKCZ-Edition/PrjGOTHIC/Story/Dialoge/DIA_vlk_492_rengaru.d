
instance DIA_RENGARU_EXIT(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 999;
	condition = dia_rengaru_exit_condition;
	information = dia_rengaru_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rengaru_exit_condition()
{
	return TRUE;
};

func void dia_rengaru_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_PICKPOCKET(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 900;
	condition = dia_rengaru_pickpocket_condition;
	information = dia_rengaru_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rengaru_pickpocket_condition()
{
	return c_beklauen(20,5);
};

func void dia_rengaru_pickpocket_info()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_BACK,dia_rengaru_pickpocket_back);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_PICKPOCKET,dia_rengaru_pickpocket_doit);
};

func void dia_rengaru_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rengaru_pickpocket);
};

func void dia_rengaru_pickpocket_back()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
};


instance DIA_RENGARU_HAUAB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hauab_condition;
	information = dia_rengaru_hauab_info;
	permanent = TRUE;
	description = "What are you doing here?";
};


func int dia_rengaru_hauab_condition()
{
	if((JORA_DIEB != LOG_RUNNING) && (Npc_KnowsInfo(other,dia_rengaru_gotyou) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rengaru_hauab_info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//I wouldn't know how that is any of your business. Get lost!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "Jora says you've got his money...";
};


func int dia_rengaru_hallodieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_rengaru_hallodieb_info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Jora says you've got his money...
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Damnit! I'm outta here!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_RENGARU_GOTYOU(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 3;
	condition = dia_rengaru_gotyou_condition;
	information = dia_rengaru_gotyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rengaru_gotyou_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_hallodieb) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_05_01") <= 500))
	{
		return TRUE;
	};
};

func void dia_rengaru_gotyou_info()
{
	b_giveplayerxp(XP_RENGARUGOTTHIEF);
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//What do you want from me?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//You stole from Jora in broad daylight, and he even saw you do it.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//So I've come to tell you that you're a lousy thief, and that...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"... I deserve a share of the loot.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"... you had better hand over Jora's gold now.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"... and now you tell me who you are.",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//... you had better hand over Jora's gold now.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Here's the dough, man! But now let me go, I'll never do it again.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//I haven't got the gold any more.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//But why am I telling you that? You've robbed me already!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//... I deserve a share of the loot.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//You already took everything I had after you knocked me to the ground! So let me go!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//All right, looks like I have no choice. I'll share half with you.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"No - you give me everything!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"All right, give me half, then.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//No - you give me everything!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//So you're plundering me. Well, take the gold, then. And now leave me alone.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//I would give you the gold, but I don't have it any more.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//All right, give me half, then.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Here's your half! And now let me go!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//I wouldn't mind giving you half of the gold, but I haven't got it any more.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//... and now you tell me who you are.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//I'm nothing but a poor wretch, trying to make ends meet one way or another.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//What else can I do? I can't find a job in town...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//... all right, I see. Spare me your whining.
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "I should turn you in to the militia.";
};


func int dia_rengaru_inknast_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_inknast_info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//I should turn you in to the militia.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//What else do you want? I've got nothing left! Let me go, man!
	Info_AddChoice(dia_rengaru_inknast,"Why would I want to do that?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"I'll see to it that you are put behind bars.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"Get lost! And don't show your face around here again!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Get lost! And don't show your face around here again!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//You won't regret this! Thanks, man!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//I'll see to it that you are put behind bars.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(tired) I don't want any more trouble. If you think that's what you should do, then be my guest.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(warning) Be careful, though - my friends are not going to like what you're pulling here...
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Why would I want to do that?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//In the city, it's always good to know the right people - and to stay on their good side.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//I could put in a good word for you. I can't and won't say more. The rest is up to you.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "So? Doing all right?";
};


func int dia_rengaru_lastinfokap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_inknast))
	{
		return TRUE;
	};
};

func void dia_rengaru_lastinfokap1_info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//So? Doing all right?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Go ahead, mock me. Eventually, you'll get what's due to you, I swear!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//What else do you want? I didn't steal anything else, honest, man!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(Show thieves' signal)";
};


func int dia_rengaru_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (RENGARU_INKNAST == FALSE) && Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Hey, you're one of us.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Let me tell you something. If you intend to empty some pockets in town, be especially careful with the merchants!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//They are pretty sharp at watching their stuff. But I can give you a tip.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Try to grab the desired object with one hand, and wave about with the other. That distracts them.
	b_raiseattribute(other,ATR_DEXTERITY,1);
	Snd_Play("LEVELUP");
};

