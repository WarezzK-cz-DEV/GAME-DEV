
instance DIA_VATRAS_DI_EXIT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 999;
	condition = dia_vatras_di_exit_condition;
	information = dia_vatras_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_di_exit_condition()
{
	return TRUE;
};

func void dia_vatras_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_HEAL(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_heal_condition;
	information = dia_vatras_di_heal_info;
	permanent = TRUE;
	description = "Heal me.";
};


func int dia_vatras_di_heal_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//Heal me.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//(devout) Adanos bless this body. It is destined to restore the balance of the world.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//Your body is undamaged at the moment.
	};
};


instance DIA_VATRAS_DI_TRADE(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 12;
	condition = dia_vatras_di_trade_condition;
	information = dia_vatras_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Can you sell me something?";
};


func int dia_vatras_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_trade_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//Can you sell me something?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//What do you need, then?
};


instance DIA_VATRAS_DI_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 35;
	condition = dia_vatras_di_obsession_condition;
	information = dia_vatras_di_obsession_info;
	permanent = TRUE;
	description = "Help me. I am possessed!";
};


func int dia_vatras_di_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vatras_di_obsession_info_onetime;

func void dia_vatras_di_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//Help me. I am possessed!
	if(GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2))
	{
		if(dia_vatras_di_obsession_info_onetime <= 1)
		{
			CreateInvItems(self,itpo_healobsession_mis,1);
			dia_vatras_di_obsession_info_onetime = dia_vatras_di_obsession_info_onetime + 1;
		};
		if(Npc_HasItems(self,itpo_healobsession_mis))
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//Take this Potion of Deliverance. Pyrokar has given me some of the healing elixirs at my request.
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//However, always remember: my means of ridding you of your nightmares are limited.
			b_giveinvitems(self,other,itpo_healobsession_mis,1);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//Pyrokar's supplies are exhausted. I am very sorry, my friend. I cannot help you any more.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//I shall not take the risk of giving you another phial after so short a time. Come back later, my friend.
	};
};


instance DIA_VATRAS_DI_RAT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_rat_condition;
	information = dia_vatras_di_rat_info;
	description = "What advice can you give me?";
};


func int dia_vatras_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && (SC_ISOBSESSED == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_rat_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//What advice can you give me?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//Stay away from the Seekers. Remember that their black look can do you great damage here, far away from the monastery.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//Don't worry, I've got the soul summoning amulet.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//Should something happen to you nevertheless, come to me. I shall see what I can do.
};


instance DIA_VATRAS_DI_PEDROTOT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 3;
	condition = dia_vatras_di_pedrotot_condition;
	information = dia_vatras_di_pedrotot_info;
	description = "I have found the traitor Pedro.";
};


func int dia_vatras_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};


var int dia_vatras_di_pedrotot_vatrassucked;

func void dia_vatras_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//I have found the traitor Pedro.
	b_giveplayerxp(XP_AMBIENT);
	self.flags = 0;
	if((MIS_GORAX_KILLPEDRO == LOG_SUCCESS) && Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//He's dead.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//I am extremely disappointed. I had not thought it of you.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//What do you mean?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//I know about your repugnant agreement with Serpentes. I am deeply shaken that I should be proven wrong in the end after all.
		DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//Then bring him here to the ship. We shall hand him over to the legal authorities of Khorinis.
		if(Npc_IsDead(pedro_di))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//It's kind of too late for that. He's dead.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//(surprised) Oh. That is very regrettable. I shall pray for his poor soul.
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_VATRAS_DI_VATRASSUCKED(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_vatras_di_vatrassucked_condition;
	information = dia_vatras_di_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vatras_di_vatrassucked_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_vatrassucked_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//Get out of my sight, you murderer. You can expect no help from me whatsoever.
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_TALENTE(C_INFO)
{
	npc = vlk_439_vatras_di;
	condition = dia_vatras_di_talente_condition;
	information = dia_vatras_di_talente_info;
	permanent = TRUE;
	description = "Teach me your abilities.";
};


func int dia_vatras_di_talente_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_talente_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//Teach me your abilities.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//I shall do what is in my power.
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_vatras_di_talente,"Circles of Magic",dia_vatras_di_talente_circles);
	};
	Info_AddChoice(dia_vatras_di_talente,"Alchemy - The Art of Brewing Potions",dia_vatras_di_talente_alchimie);
};

func void dia_vatras_di_talente_circles()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("1st Circle of Magic",b_getlearncosttalent(other,NPC_TALENT_MAGE,1)),dia_vatras_di_talente_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("2nd Circle of Magic",b_getlearncosttalent(other,NPC_TALENT_MAGE,2)),dia_vatras_di_talente_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("3rd Circle of Magic",b_getlearncosttalent(other,NPC_TALENT_MAGE,3)),dia_vatras_di_talente_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("4th Circle of Magic",b_getlearncosttalent(other,NPC_TALENT_MAGE,4)),dia_vatras_di_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("5th Circle of Magic",b_getlearncosttalent(other,NPC_TALENT_MAGE,5)),dia_vatras_di_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("6th Circle of Magic",b_getlearncosttalent(other,NPC_TALENT_MAGE,6)),dia_vatras_di_talente_circle_6);
	};
};

func void dia_vatras_di_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Essence of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_01)),dia_vatras_di_talente_potion_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Extract of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_02)),dia_vatras_di_talente_potion_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixir of Healing",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_HEALTH_03)),dia_vatras_di_talente_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Mana Essence",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_01)),dia_vatras_di_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Mana Extract",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_02)),dia_vatras_di_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Mana Elixir",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_MANA_03)),dia_vatras_di_talente_potion_mana_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Speed Potion",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_SPEED)),dia_vatras_di_talente_potion_speed);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixir of Strength",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_STR)),dia_vatras_di_talente_potion_perm_str);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixir of Dexterity",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_DEX)),dia_vatras_di_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixir of Spirit",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_MANA)),dia_vatras_di_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("Elixir of Life",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY,POTION_PERM_HEALTH)),dia_vatras_di_talente_potion_perm_health);
	};
};

func void dia_vatras_di_talente_circle_1()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,1);
};

func void dia_vatras_di_talente_circle_2()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,2);
};

func void dia_vatras_di_talente_circle_3()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,3);
};

func void dia_vatras_di_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,4);
};

func void dia_vatras_di_talente_circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//You are now a magician of the fifth Circle. Use the magic spells you have learned prudently.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,5);
};

func void dia_vatras_di_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//You now have access to the highest knowledge of magic.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//Be guided by reason and control your human weaknesses. They can cloud your sight.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,6);
};

func void dia_vatras_di_talente_potion_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_vatras_di_talente_potion_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_vatras_di_talente_potion_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_vatras_di_talente_potion_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_vatras_di_talente_potion_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_vatras_di_talente_potion_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_vatras_di_talente_potion_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
};

func void dia_vatras_di_talente_potion_perm_str()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_STR);
};

func void dia_vatras_di_talente_potion_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
};

func void dia_vatras_di_talente_potion_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};

func void dia_vatras_di_talente_potion_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_vatras_di_talente_back()
{
	Info_ClearChoices(dia_vatras_di_talente);
};


instance DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_dementorobsessionbook_condition;
	information = dia_vatras_di_dementorobsessionbook_info;
	permanent = TRUE;
	description = "I've got an almanac of the Possessed here.";
};


func int dia_vatras_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};


var int dia_vatras_di_dementorobsessionbook_onetime;

func void dia_vatras_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//I've got an Almanac of the Possessed here
	if(DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//Hm. I think it would be best if I take it to Pyrokar in the monastery, if we get away from here again.
		DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//Do you have more of them? Bring me all that you can find.
	};
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	Npc_RemoveInvItems(self,itwr_dementorobsessionbook_mis,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_undeaddragondead_condition;
	information = dia_vatras_di_undeaddragondead_info;
	permanent = TRUE;
	description = "I did it.";
};


func int dia_vatras_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_vatras_di_undeaddragondead_onetime;

func void dia_vatras_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//I did it.
	if(DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//I know, I can feel it.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//You have dealt a blow to Beliar which will keep him busy for some time.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//Can I retire now, or do you magicians have another skeleton in the closet which needs to be driven from this world?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//But bear in mind that this was only an episode in the eternal battle between Good and Evil.
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//Evil always finds a way to enter this world. The war will never end.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//As a warrior for the good cause you should know that.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//Only Adanos alone stands between the warring gods in order to preserve the balance!
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//He should have helped me instead.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//(mischievously) But he did - of that you can be certain.
		DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//Tell the captain that he should weigh anchor as soon as possible. The momentary peace may be deceptive.
};


instance DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_addon_vatras_pissoffforevver_di_condition;
	information = dia_addon_vatras_pissoffforevver_di_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_vatras_pissoffforevver_di_condition()
{
	if(((VATRASPISSEDOFFFOREVER == TRUE) || ((MADKILLERCOUNT >= 7) && (VATRASMADKILLERCOUNT != MADKILLERCOUNT))) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};


var int dia_addon_vatras_pissoffforevver_di_onetime;

func void dia_addon_vatras_pissoffforevver_di_info()
{
	if(DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI_ONETIME == FALSE)
	{
		b_lastwarningvatras();
		DIA_ADDON_VATRAS_PISSOFFFOREVVER_DI_ONETIME = TRUE;
	};
	b_vatraspissedoff();
	AI_StopProcessInfos(self);
};

