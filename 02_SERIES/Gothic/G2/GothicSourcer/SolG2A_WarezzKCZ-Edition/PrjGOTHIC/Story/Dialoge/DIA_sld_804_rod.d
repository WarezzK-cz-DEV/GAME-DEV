
instance DIA_ROD_EXIT(C_INFO)
{
	npc = sld_804_rod;
	nr = 999;
	condition = dia_rod_exit_condition;
	information = dia_rod_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rod_exit_condition()
{
	return TRUE;
};

func void dia_rod_exit_info()
{
	AI_EquipBestMeleeWeapon(self);
	AI_StopProcessInfos(self);
};


instance DIA_ROD_HELLO(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_hello_condition;
	information = dia_rod_hello_info;
	permanent = FALSE;
	description = "Everything all right?";
};


func int dia_rod_hello_condition()
{
	return TRUE;
};

func void dia_rod_hello_info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//How are things?
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//(dismissively) What do YOU want from me, weenie?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//Couldn't they find room for you in a monastery?
		};
	};
};


var int rod_schwachgesagt;

instance DIA_ROD_WANNALEARN(C_INFO)
{
	npc = sld_804_rod;
	nr = 2;
	condition = dia_rod_wannalearn_condition;
	information = dia_rod_wannalearn_info;
	permanent = TRUE;
	description = "Can you teach me how to handle two-handed weapons?";
};


func int dia_rod_wannalearn_condition()
{
	if(ROD_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_rod_wannalearn_info()
{
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//Can you teach me how to handle two-handed weapons?
	if((ROD_WETTEGEWONNEN == TRUE) || (self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//I'm not a bad fighter, but that doesn't mean I'm a good teacher.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//Still, I think I can show you the basics of two-handed combat anyway.
		if(Npc_HasItems(self,itmw_2h_rod) == 0)
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//That is, if you give me back my sword.
		}
		else
		{
			ROD_TEACH2H = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//Listen, boy. It takes a lot of strength to wield a two-handed weapon.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//Why don't you slink off to the pasture for a game of ring-around-a-rosy with the sheep?
		ROD_SCHWACHGESAGT = TRUE;
	};
};


var int rod_merke_2h;

instance DIA_ROD_TEACH(C_INFO)
{
	npc = sld_804_rod;
	nr = 3;
	condition = dia_rod_teach_condition;
	information = dia_rod_teach_info;
	permanent = TRUE;
	description = "I want to improve my two-handed fighting skills!";
};


func int dia_rod_teach_condition()
{
	if(ROD_TEACH2H == TRUE)
	{
		return TRUE;
	};
};

func void dia_rod_teach_info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//I want to improve my two-handed fighting skills!
	ROD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_back()
{
	if(ROD_MERKE_2H < other.hitchance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//You're getting better already.
	};
	Info_ClearChoices(dia_rod_teach);
};

func void dia_rod_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};

func void dia_rod_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_rod_teach_2h_5);
};


instance DIA_ROD_WANNAJOIN(C_INFO)
{
	npc = sld_804_rod;
	nr = 4;
	condition = dia_rod_wannajoin_condition;
	information = dia_rod_wannajoin_info;
	permanent = TRUE;
	description = "I want to join the mercenaries!";
};


func int dia_rod_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rod_wannajoin_info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//I want to join the mercenaries!
	if(Npc_HasItems(self,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//So what about handing me my sword back first, eh?
	}
	else if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//OK. I don't carry grudges.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//You can fight, and that's what counts.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//Most of the lads here think nothing of a little brawl among friends. You'll get used to that.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//Oh well, you wield a decent sword. You'll learn the rest.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//As far as I'm concerned, you're in.
		b_logentry(TOPIC_SLDRESPEKT,"I'll get Rod's vote if I want to join the mercenaries.");
		dia_rod_wannajoin.permanent = FALSE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//There's no place for wimps around here!
		ROD_SCHWACHGESAGT = TRUE;
	};
};


instance DIA_ROD_DUELL(C_INFO)
{
	npc = sld_804_rod;
	nr = 6;
	condition = dia_rod_duell_condition;
	information = dia_rod_duell_info;
	permanent = TRUE;
	description = "Looks like I'll have to teach you some manners, doesn't it?";
};


func int dia_rod_duell_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
		{
			return TRUE;
		};
		if(MIS_JARVIS_SLDKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};

func void dia_rod_duell_info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//Looks like I'll have to teach you some manners, doesn't it?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//Go ahead, give it a try!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//You're just not going to learn this!
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ROD_STARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_starkgenug_condition;
	information = dia_rod_starkgenug_info;
	permanent = FALSE;
	description = "I am strong enough!";
};


func int dia_rod_starkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rod_starkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//I am strong enough!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//Nonsense! You couldn't even LIFT a decent sword like mine!
	Log_CreateTopic(TOPIC_RODWETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RODWETTE,LOG_RUNNING);
	b_logentry(TOPIC_RODWETTE,"The mercenary Rod doesn't think I can hold up his sword.");
};


instance DIA_ROD_BINSTARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_binstarkgenug_condition;
	information = dia_rod_binstarkgenug_info;
	permanent = FALSE;
	description = "I said I AM strong enough!";
};


func int dia_rod_binstarkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_starkgenug))
	{
		return TRUE;
	};
};

func void dia_rod_binstarkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//I said I AM strong enough!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//Ooh, you're killing me. Want to risk a little bet?
};


var int rod_wettegewonnen;
var int rod_wetteangenommen;

instance DIA_ROD_WETTE(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_wette_condition;
	information = dia_rod_wette_info;
	permanent = TRUE;
	description = "I bet I can handle your sword!";
};


func int dia_rod_wette_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_binstarkgenug) && (Npc_HasItems(self,itmw_2h_rod) > 0) && (ROD_WETTEANGENOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_rod_wette_info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//I bet I can handle your sword!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//Really? Hmm...(thinking) How much should I relieve you of?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//Well, you look like a poor sucker. Let's make it 30 gold pieces! Do you even have that much?
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"No.",dia_rod_wette_no);
	Info_AddChoice(dia_rod_wette,"Sure.",dia_rod_wette_yes);
	b_logentry(TOPIC_RODWETTE,"Rod's wagering 30 pieces of gold that I can't hold up his sword.");
};

func void dia_rod_wette_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//No.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//Oh, just go away.
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//Sure.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//Let me see, then...
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		ROD_WETTEANGENOMMEN = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//Here!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//(gloating) All right, let's see then how strong you are...
		b_giveinvitems(self,other,itmw_2h_rod,1);
		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			AI_UnequipWeapons(other);
			AI_EquipBestMeleeWeapon(other);
			AI_ReadyMeleeWeapon(other);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//About this strong?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//(perplexed) Looks like you got me there.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//I never expected that. You really don't look like you have that much strength in you.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//Well - I guess I just lost 30 gold pieces. Here you are.
			b_giveinvitems(self,other,itmi_gold,60);
			ROD_WETTEGEWONNEN = TRUE;
			b_giveplayerxp(XP_ROD);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//I can't wield this weapon.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//(laughs) That's what I'm saying!
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//And now give me back my weapon.
		Info_ClearChoices(dia_rod_wette);
		Info_AddChoice(dia_rod_wette,"I think not...",dia_rod_wette_keepit);
		Info_AddChoice(dia_rod_wette,"Here you are.",dia_rod_wette_giveback);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//Now where did I put it...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//That figures. Come back when you have gold to bet with.
		Info_ClearChoices(dia_rod_wette);
	};
};

func void dia_rod_wette_giveback()
{
	AI_RemoveWeapon(other);
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//Here you are.
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"(hand him the weapon)",dia_rod_wette_giveback2);
};

func void dia_rod_wette_giveback2()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	if(ROD_WETTEGEWONNEN == FALSE)
	{
		AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//You're nothing but a wimp after all!
	};
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_keepit()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//I think not...
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(threatening) What was that?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//I think I'm going to keep it a little longer.
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//Just you wait, you bastard!
	Info_ClearChoices(dia_rod_wette);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


var int rod_schwertxpgiven;

instance DIA_ROD_GIVEITBACK(C_INFO)
{
	npc = sld_804_rod;
	nr = 7;
	condition = dia_rod_giveitback_condition;
	information = dia_rod_giveitback_info;
	permanent = TRUE;
	description = "Here's your sword back!";
};


func int dia_rod_giveitback_condition()
{
	if(Npc_HasItems(other,itmw_2h_rod) > 0)
	{
		return TRUE;
	};
};

func void dia_rod_giveitback_info()
{
	b_giveinvitems(other,self,itmw_2h_rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Here's your sword back!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//High time, too!
	if(ROD_SCHWERTXPGIVEN == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		ROD_SCHWERTXPGIVEN = TRUE;
	};
};


instance DIA_ROD_PERM(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_perm_condition;
	information = dia_rod_perm_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_rod_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rod_hello))
	{
		return TRUE;
	};
};

func void dia_rod_perm_info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//How's it going?
	if(KAPITEL <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//That's none of your business, weakling.
				ROD_SCHWACHGESAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//I'm curious to see whether they'll let you join.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//You're one of us now, kid. We'll get that settled somehow.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//You don't belong here, you'd better go hang out somewhere else!
		};
	};
	if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//If all those stories about dragons are actually true, we should get a few people together and go flatten those beasts!
	};
};


instance DIA_RODSLD_PICKPOCKET(C_INFO)
{
	npc = sld_804_rod;
	nr = 900;
	condition = dia_rodsld_pickpocket_condition;
	information = dia_rodsld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rodsld_pickpocket_condition()
{
	return c_beklauen(15,35);
};

func void dia_rodsld_pickpocket_info()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_BACK,dia_rodsld_pickpocket_back);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_PICKPOCKET,dia_rodsld_pickpocket_doit);
};

func void dia_rodsld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rodsld_pickpocket);
};

func void dia_rodsld_pickpocket_back()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
};

