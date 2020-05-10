
instance DIA_ORIC_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_exit_condition;
	information = dia_oric_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_oric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_HALLO(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_hallo_condition;
	information = dia_oric_hallo_info;
	permanent = FALSE;
	description = "What's your job?";
};


func int dia_oric_hallo_condition()
{
	return TRUE;
};

func void dia_oric_hallo_info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//What is your task?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//I am a strategic officer of the king, and I currently answer to the honorable commander Garond.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//We are the last of the paladins here in the castle. All the others have left or fallen.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//It is now our responsibility to bring a good end to this expedition. And that we shall do. By Innos - that we shall do.
};


instance DIA_ORIC_BRUDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_bruder_condition;
	information = dia_oric_bruder_info;
	permanent = FALSE;
	description = "I have a message for you.";
};


func int dia_oric_bruder_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_bruder_info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//I have a message for you.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//What is it?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//Your brother is dead. He got as far as the pass.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//(murmurs)... my brother...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//Innos puts me to a severe test. But he died as his servant...
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//This news is like an arrow which pierces my heart. I shall seek new strength in prayer.
	ORICBRUDER = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORIC_SCOUTMINE(C_INFO)
{
	npc = pal_251_oric;
	nr = 1;
	condition = dia_oric_scoutmine_condition;
	information = dia_oric_scoutmine_info;
	permanent = FALSE;
	description = "I am to go to the mining sites.";
};


func int dia_oric_scoutmine_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL < 3) && Npc_KnowsInfo(other,dia_oric_hallo) && (FAJETH_ORE == FALSE) && (MARCOS_ORE == FALSE) && (SILVESTRO_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_scoutmine_info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//I am to go to the mining sites.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//This isn't going to be child's play, beware. First of all, seek out the paladins. They are leading the three groups.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//If you want to know more about it, speak to Parcival.
};


instance DIA_ORIC_PERM(C_INFO)
{
	npc = pal_251_oric;
	nr = 99;
	condition = dia_oric_perm_condition;
	information = dia_oric_perm_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_oric_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_oric_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_oric_perm_info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//How's the situation?
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//You need to find all scrapers, plus the ore. Then we will figure out how we can leave this valley.
	}
	else if(MIS_SCOUTMINE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//The expedition has hit rock bottom. But we won't give up, for Innos is with us. He will lead us safely from the valley.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//Your appearance here is a sign of hope to us.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//We need you. Go talk to Garond - he will explain everything to you.
	};
};


instance DIA_ORIC_KAP3_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap3_exit_condition;
	information = dia_oric_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_oric_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP4_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap4_exit_condition;
	information = dia_oric_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_oric_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_IAMBACK(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_iamback_condition;
	information = dia_oric_iamback_info;
	description = "I'm back already.";
};


func int dia_oric_iamback_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_iamback_info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//I'm back already.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//I never thought we would see you here again, after that scene when you were here a few days ago.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//I bid you welcome in the name of our order.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//I can see that you have been made a magician. My respects.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//Maybe your appearance is a good omen.
};


instance DIA_ORIC_CANHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_canhelp_condition;
	information = dia_oric_canhelp_info;
	description = "Can I help?";
};


func int dia_oric_canhelp_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_canhelp_info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//Can I help?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//At the moment, we seem to have done everything which is possible from here.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//There is something, however. Something very important which you could do for us outside of these walls.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//We are planning to cut off the serpent's head.
	Info_ClearChoices(dia_oric_canhelp);
	Info_AddChoice(dia_oric_canhelp,"I think you should find somebody else. ",dia_oric_canhelp_notyourman);
	Info_AddChoice(dia_oric_canhelp,"What do you mean by that?",dia_oric_canhelp_whatyoumean);
};

func void dia_oric_canhelp_notyourman()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//I think you should find somebody else.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//I cannot spare a single man - you are our only hope.
};

func void dia_oric_canhelp_whatyoumean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//What do you mean by that?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//We know one of their leaders. His name is Hosh-Pak.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//He is one of the most influential shamans among the orcs.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//And what is my role?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Kill him.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//That's a joke!?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//You are the only one that we can spare. All the other knights are needed here.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//It is not easy for me to ask this of you, Master. But you would be the best choice for this assignment.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//You want to help us, don't you? Well, then...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//Hosh-Pak's tent is situated outside of the siege circle, on a cliff to the south of here.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//You can almost see it from one of the windows there.
	Info_ClearChoices(dia_oric_canhelp);
	ORIKTOLDMISSIONCHAPTER4 = TRUE;
};


instance DIA_ORIC_NEEDSTUFF(C_INFO)
{
	npc = pal_251_oric;
	nr = 6;
	condition = dia_oric_needstuff_condition;
	information = dia_oric_needstuff_info;
	description = "I still need some equipment.";
};


func int dia_oric_needstuff_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_needstuff_info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//I still need some equipment.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//We don't have much left that we could give you.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//Well, I can offer you this.
	Info_ClearChoices(dia_oric_needstuff);
	Info_AddChoice(dia_oric_needstuff,"or 1 elixir of dexterity",dia_oric_needstuff_dexterity);
	Info_AddChoice(dia_oric_needstuff,"or 1 elixir of strength",dia_oric_needstuff_strength);
	Info_AddChoice(dia_oric_needstuff,"or 3 mana elixirs",dia_oric_needstuff_mana);
	Info_AddChoice(dia_oric_needstuff,"3 elixirs of Healing",dia_oric_needstuff_health);
};

func void dia_oric_needstuff_health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//I'll take the healing potions.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//A good choice. May it be of benefit to you.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//I'll take the mana potions.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//I hope you can use them. May Innos protect you.
	CreateInvItems(self,itpo_mana_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//I'll take the elixir of strength.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//Here, this will certainly come in useful. I wish you luck.
	CreateInvItems(self,itpo_perm_str,1);
	b_giveinvitems(self,other,itpo_perm_str,1);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//I'll take the elixir of dexterity.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//May your arrows never fail to hit their target. Here you are.
	CreateInvItems(self,itpo_perm_dex,1);
	b_giveinvitems(self,other,itpo_perm_dex,1);
	Info_ClearChoices(dia_oric_needstuff);
};


instance DIA_ORIC_NOMURDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 7;
	condition = dia_oric_nomurder_condition;
	information = dia_oric_nomurder_info;
	description = "I shall not murder Hosh-Pak in such a cowardly fashion.";
};


func int dia_oric_nomurder_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_nomurder_info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//I shall not murder Hosh-Pak in such a cowardly fashion.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//Can you even begin to imagine how bad our situation is?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//We are under siege by a superior army of orcs. Our supplies are nearly used up.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//If we do not succeed in getting the ore to the ship, the orcs are going to lay waste to the entire kingdom.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//Everything we stand for will be forgotten.
};


instance DIA_ORIC_WILLHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 5;
	condition = dia_oric_willhelp_condition;
	information = dia_oric_willhelp_info;
	permanent = FALSE;
	description = "All right. I shall kill Hosh-Pak.";
};


func int dia_oric_willhelp_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_willhelp_info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//All right. I shall kill Hosh-Pak.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//I'm glad to hear that.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//Hosh-Pak's tent stands on a small cliff. You must have seen it before.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//It is not far from the path to our mine. Directly in the shadow of the big mountain.
	Log_CreateTopic(TOPIC_KILLHOSHPAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLHOSHPAK,LOG_RUNNING);
	b_logentry(TOPIC_KILLHOSHPAK,"Oric wants me to eliminate the orc shaman Hosh-Pak. His tent is on a small clif not far from the back of the castle.");
	MIS_KILLHOSHPAK = LOG_RUNNING;
};


instance DIA_ORIC_HOSHDEAD(C_INFO)
{
	npc = pal_251_oric;
	nr = 8;
	condition = dia_oric_hoshdead_condition;
	information = dia_oric_hoshdead_info;
	permanent = FALSE;
	description = "Hosh-Pak is dead!";
};


func int dia_oric_hoshdead_condition()
{
	if(Npc_IsDead(hosh_pak) && (MIS_KILLHOSHPAK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_oric_hoshdead_info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//Hosh-Pak is dead!
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//Great, this is bound to unsettle the orcs. Maybe we do stand a chance after all.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//I think this is going to win us a reprieve of at least a week.
	MIS_KILLHOSHPAK = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLHOSH_PAK);
};


instance DIA_ORIC_ANYNEWS(C_INFO)
{
	npc = pal_251_oric;
	nr = 9;
	condition = dia_oric_anynews_condition;
	information = dia_oric_anynews_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_oric_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback))
	{
		return TRUE;
	};
};

func void dia_oric_anynews_info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//Any news?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//You mean, apart from the fact that the orcs have invaded us?
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//Yes. You're our hero. Getting rid of all the dragons at once is no mean feat, I should say.
	}
	else if(MIS_KILLHOSHPAK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//The orcs seem to be unsettled by Hosh-Pak's death.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//The orcs are becoming more and more numerous. This is not good.
	};
};


instance DIA_ORIC_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_251_oric;
	nr = 3;
	condition = dia_oric_dragonplettbericht_condition;
	information = dia_oric_dragonplettbericht_info;
	permanent = TRUE;
	description = "I need more information about the dragons.";
};


func int dia_oric_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		return TRUE;
	};
};


var int oric_swampdragoninfo_onetime;
var int oric_rockdragoninfo_onetime;
var int oric_firedragoninfo_onetime;
var int oric_icedragoninfo_onetime;
var int oric_dragoncounter;
var int oric_firstquestion;

func void dia_oric_dragonplettbericht_info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//I need more information about the dragons.
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//I've already killed one of them. Can you tell me where to look for the others?
	}
	else if(MIS_KILLEDDRAGONS != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//I have this feeling that I didn't get to all the dragons yet. Maybe I overlooked something?
	};
	if(((ORIC_DRAGONCOUNTER < MIS_KILLEDDRAGONS) || (ORIC_FIRSTQUESTION == FALSE)) && ((ORIC_SWAMPDRAGONINFO_ONETIME == FALSE) || (ORIC_ROCKDRAGONINFO_ONETIME == FALSE) || (ORIC_FIREDRAGONINFO_ONETIME == FALSE) || (ORIC_ICEDRAGONINFO_ONETIME == FALSE)))
	{
		if((Npc_IsDead(swampdragon) == FALSE) && (ORIC_SWAMPDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//A rather large swamp has developed in the last couple of days to the west of the old castle. That's rather suspicious, wouldn't you say?
			b_logentry(TOPIC_DRACHENJAGD,"Oric gave me a clue: A pretty large swamp has formed west of the castle in the past few days. He thinks it's very suspicious.");
			ORIC_SWAMPDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(rockdragon) == FALSE) && (ORIC_ROCKDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//There is a rock fortress to the south, far behind the volcano.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//Our spies have reported that the fortress is heavily guarded. Maybe one of them is hiding out there.
			b_logentry(TOPIC_DRACHENJAGD,"The paladins' scouts told Oric that the rock fortress beyond the volcano in the south is heavily guarded. Oric suspects there's a dragon there.");
			ORIC_ROCKDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(firedragon) == FALSE) && (ORIC_FIREDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//Following the last attack by the dragons, one of them is said to have disappeared near the volcano in the south. You should look for it there.
			b_logentry(TOPIC_DRACHENJAGD,"Apparently, the last dragon that attacked the castle in the Valley of Mines was seen near the volcano afterwards.");
			ORIC_FIREDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(icedragon) == FALSE) && (ORIC_ICEDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//There is a vast region of ice to the west. It wouldn't surprise me if one of the dragons were hiding out there.
			b_logentry(TOPIC_DRACHENJAGD,"According to Oric, the ice region in the west could be the home of a dragon.");
			ORIC_ICEDRAGONINFO_ONETIME = TRUE;
		};
		ORIC_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		ORIC_FIRSTQUESTION = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//At the moment, alas, I've got nothing for you.
	};
};


instance DIA_ORIC_KAP5_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap5_exit_condition;
	information = dia_oric_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_oric_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP6_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap6_exit_condition;
	information = dia_oric_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_oric_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_PICKPOCKET(C_INFO)
{
	npc = pal_251_oric;
	nr = 900;
	condition = dia_oric_pickpocket_condition;
	information = dia_oric_pickpocket_info;
	permanent = TRUE;
	description = "(It would be damned difficult to steal his spell scroll)";
};


func int dia_oric_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (85 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_oric_pickpocket_info()
{
	Info_ClearChoices(dia_oric_pickpocket);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_BACK,dia_oric_pickpocket_back);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_PICKPOCKET,dia_oric_pickpocket_doit);
};

func void dia_oric_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 85)
	{
		b_giveinvitems(self,other,itsc_palrepelevil,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_oric_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_oric_pickpocket_back()
{
	Info_ClearChoices(dia_oric_pickpocket);
};

