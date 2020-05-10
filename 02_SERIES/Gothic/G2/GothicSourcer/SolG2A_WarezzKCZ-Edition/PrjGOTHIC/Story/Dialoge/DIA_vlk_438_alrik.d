
instance DIA_ALRIK_EXIT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 999;
	condition = dia_alrik_exit_condition;
	information = dia_alrik_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alrik_exit_condition()
{
	return TRUE;
};

func void dia_alrik_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALRIK_PICKPOCKET(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 900;
	condition = dia_alrik_pickpocket_condition;
	information = dia_alrik_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_alrik_pickpocket_condition()
{
	return c_beklauen(55,50);
};

func void dia_alrik_pickpocket_info()
{
	Info_ClearChoices(dia_alrik_pickpocket);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_BACK,dia_alrik_pickpocket_back);
	Info_AddChoice(dia_alrik_pickpocket,DIALOG_PICKPOCKET,dia_alrik_pickpocket_doit);
};

func void dia_alrik_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alrik_pickpocket);
};

func void dia_alrik_pickpocket_back()
{
	Info_ClearChoices(dia_alrik_pickpocket);
};


instance DIA_ALRIK_HALLO(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_hallo_condition;
	information = dia_alrik_hallo_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_alrik_hallo_condition()
{
	return TRUE;
};

func void dia_alrik_hallo_info()
{
	AI_Output(other,self,"DIA_Alrik_Hallo_15_00");	//What are you doing here?
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_01");	//(laughs) This is my home!
	}
	else if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_02");	//What am I supposed to do here? I'm drinking.
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_Hallo_09_03");	//I'm going for a little walk.
	};
	AI_Output(self,other,"DIA_Alrik_Hallo_09_04");	//But if you mean, what do I do all day - I arrange fights.
};


instance DIA_ALRIK_YOUFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_youfight_condition;
	information = dia_alrik_youfight_info;
	permanent = FALSE;
	description = "You arrange fights?";
};


func int dia_alrik_youfight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_hallo))
	{
		return TRUE;
	};
};

func void dia_alrik_youfight_info()
{
	AI_Output(other,self,"DIA_Alrik_YouFight_15_00");	//You arrange fights?
	AI_Output(self,other,"DIA_Alrik_YouFight_09_01");	//Every day, from noon until evening.
	if(Npc_GetDistToWP(self,"NW_CITY_PATH_HABOUR_16_01") <= 500)
	{
		AI_Output(self,other,"DIA_Alrik_YouFight_09_02");	//And right here!
	};
	AI_Output(self,other,"DIA_Alrik_YouFight_09_03");	//Behind the warehouse in the harbor district - home, sweet home!
};


instance DIA_ALRIK_REGELN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_regeln_condition;
	information = dia_alrik_regeln_info;
	permanent = FALSE;
	description = "What are the rules for the fight?";
};


func int dia_alrik_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_regeln_info()
{
	AI_Output(other,self,"DIA_Alrik_Regeln_15_00");	//What are the rules for the fight?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_01");	//Quite simple: All regular weapons are allowed. No bows or crossbows and NO magic!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_02");	//We fight until one of us drops. And as soon as one of us is flat on his back, it's over, got it?
	AI_Output(self,other,"DIA_Alrik_Regeln_09_03");	//Whoever leaves the (laughs) ring is out! So if you quit, I win!
	AI_Output(self,other,"DIA_Alrik_Regeln_09_04");	//The stake is 50 gold coins. If you win, you get 100 back. If not - well - then your money is down the drain. (grins)
	AI_Output(self,other,"DIA_Alrik_Regeln_09_05");	//Got it?
	AI_Output(other,self,"DIA_Alrik_Regeln_15_06");	//Yep!
};

func void b_alrik_again()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_03");	//How's it going? Do you want to go up against me again? I think I've gotten better in the meantime...
};


instance DIA_ALRIK_NEWFIGHTS3(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights3_condition;
	information = dia_alrik_newfights3_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights3_condition()
{
	if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN <= 6))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights3_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,4);
	b_alrik_again();
};


instance DIA_ALRIK_NEWFIGHTS5(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_newfights5_condition;
	information = dia_alrik_newfights5_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alrik_newfights5_condition()
{
	if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN <= 9))
	{
		return TRUE;
	};
};

func void dia_alrik_newfights5_info()
{
	b_addfightskill(self,NPC_TALENT_1H,20);
	b_setattributestochapter(self,6);
	b_alrik_again();
};

func void b_alrik_enough()
{
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_05");	//I think you've won often enough.
	AI_Output(self,other,"DIA_Alrik_WannaFight_09_06");	//Don't get me wrong, but my skull's still buzzing from the last time...
};

func void b_alrik_comebacklater()
{
	AI_Output(self,other,"DIA_Alrik_Add_09_02");	//Come back again later. In the meantime, I'll train...
};


instance DIA_ALRIK_WANNAFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_wannafight_condition;
	information = dia_alrik_wannafight_info;
	permanent = TRUE;
	description = "I want to fight against you!";
};


func int dia_alrik_wannafight_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_regeln) && (self.aivar[AIV_ARENAFIGHT] == AF_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_wannafight_info()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_15_00");	//I want to fight against you!
	Info_ClearChoices(dia_alrik_wannafight);
	if(((ALRIK_ARENAKAMPFVERLOREN > 0) && (Npc_HasItems(self,itmw_alrikssword_mis) == 0)) || (Npc_HasEquippedMeleeWeapon(self) == FALSE))
	{
		if(MIS_ALRIK_SWORD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_01");	//First give me back my sword. Then we'll see...
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_02");	//Nah, nah. Before I go up against you again, I need a better weapon!
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_03");	//I had to sell my sword a few days ago.
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_04");	//With that baby, I'm unbeatable! If you get it back for me, I'll take you on again!
			ALRIK_VOMSCHWERTERZAEHLT = TRUE;
			Log_CreateTopic(TOPIC_ALRIKSCHWERT,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_ALRIKSCHWERT,LOG_RUNNING);
			b_logentry(TOPIC_ALRIKSCHWERT,"Alrik sold his sword to the merchant Jora. He'll only fight me if I bring it back to him.");
		};
	}
	else if((KAPITEL <= 2) && (ALRIK_ARENAKAMPFVERLOREN > 3))
	{
		AI_Output(self,other,"DIA_Alrik_Add_09_00");	//I think that should be enough for now...
		AI_Output(self,other,"DIA_Alrik_Add_09_01");	//Let me have a short break.
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 3) && (KAPITEL <= 4) && (ALRIK_ARENAKAMPFVERLOREN > 6))
	{
		b_alrik_enough();
		b_alrik_comebacklater();
	}
	else if((KAPITEL >= 5) && (ALRIK_ARENAKAMPFVERLOREN > 9))
	{
		b_alrik_enough();
		AI_Output(self,other,"DIA_Alrik_Add_09_04");	//Besides, I've scraped enough gold together by now.
		AI_Output(self,other,"DIA_Alrik_Add_09_05");	//I'm quitting, and I'm going to find me a place to stay somewhere in the city...
		AI_Output(self,other,"DIA_Alrik_Add_09_06");	//Who knows, maybe I'll open a weapons shop...
	}
	else if(Wld_IsTime(11,0,19,0))
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_07");	//Do you have 50 gold pieces?
		Info_ClearChoices(dia_alrik_wannafight);
		Info_AddChoice(dia_alrik_wannafight,"Nope...",dia_alrik_wannafight_nogold);
		if(Npc_HasItems(other,itmi_gold) >= 50)
		{
			Info_AddChoice(dia_alrik_wannafight,"Here you are...",dia_alrik_wannafight_gold);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_08");	//I only fight from noon until evening.
		AI_Output(self,other,"DIA_Alrik_WannaFight_09_09");	//The fighting is only worth it if there are enough viewers to make bets!
		if(Wld_IsTime(19,0,3,30))
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_10");	//It's much too late now. Come back tomorrow at noon!
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_WannaFight_09_11");	//It's still too early, come back later!
		};
	};
};

func void dia_alrik_wannafight_gold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Gold_15_00");	//Here you are...
	b_giveinvitems(other,self,itmi_gold,50);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_01");	//(loudly) We have a new challenger!
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_02");	//The bets are placed...
	Npc_RemoveInvItems(self,itmi_gold,Npc_HasItems(self,itmi_gold));
	CreateInvItems(self,itmi_gold,100);
	AI_Output(self,other,"DIA_Alrik_WannaFight_Gold_09_03");	//Are you ready?
	self.aivar[AIV_ARENAFIGHT] = AF_RUNNING;
	ALRIK_KAEMPFE = ALRIK_KAEMPFE + 1;
	Info_ClearChoices(dia_alrik_wannafight);
	Info_AddChoice(dia_alrik_wannafight,"Just a second...",dia_alrik_wannafight_moment);
	Info_AddChoice(dia_alrik_wannafight,"Come here!",dia_alrik_wannafight_now);
};

func void dia_alrik_wannafight_nogold()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NoGold_15_00");	//Nope...
	AI_Output(self,other,"DIA_Alrik_WannaFight_NoGold_09_01");	//Then go get them! No fighting without a stake!
	Info_ClearChoices(dia_alrik_wannafight);
};

func void dia_alrik_wannafight_now()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_NOW_15_00");	//Come here!
	AI_Output(self,other,"DIA_Alrik_WannaFight_NOW_09_01");	//Then let's see what you can do!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_alrik_wannafight_moment()
{
	AI_Output(other,self,"DIA_Alrik_WannaFight_Moment_15_00");	//Just a second...
	AI_Output(self,other,"DIA_Alrik_WannaFight_Moment_09_01");	//Take your time... I'm starting now!
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX])
	{
		CreateInvItems(self,itpo_health_03,1);
		b_useitem(self,itpo_health_03);
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ALRIK_AFTERFIGHT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_afterfight_condition;
	information = dia_alrik_afterfight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_alrik_afterfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		if(self.aivar[AIV_ARENAFIGHT] != AF_NONE)
		{
			return TRUE;
		}
		else if(Npc_IsInState(self,zs_talk))
		{
			return TRUE;
		};
	};
};

func void dia_alrik_afterfight_info()
{
	if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_NONE) && (self.aivar[AIV_ARENAFIGHT] != AF_AFTER_PLUS_DAMAGE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_00");	//Oh man! You pack quite a punch.
			if(Npc_HasItems(self,itmi_gold) >= 100)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_01");	//Here's your 100 gold pieces! You've earned them!
				b_giveinvitems(self,other,itmi_gold,100);
			}
			else if(Npc_HasItems(self,itmi_gold) == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_02");	//I see you already took your gold.
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_03");	//You could have waited until I gave it to you - I keep my word!
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_04");	//You went through my pockets while I was unconscious!
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_05");	//That's bad form, man! No matter, the money was yours anyway! Here's the rest.
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
			};
			ALRIK_ARENAKAMPFVERLOREN = ALRIK_ARENAKAMPFVERLOREN + 1;
		}
		else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_06");	//It was a good fight. Your stake is gone - don't make too much of it, it was for a good cause! (grins)
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_07");	//Hey, like I said, whoever leaves the corner loses the fight! If you want to try again, I'm at your service!
		};
		if(ALRIK_KAEMPFE == 1)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_08");	//And one more thing: No one talks about what goes on behind the warehouse.
			if((other.guild != GIL_MIL) && (other.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_09");	//The militia puts everyone who does the slightest thing here behind bars. And those boys don't like to see betting on fights.
			};
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	}
	else
	{
		if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER_PLUS_DAMAGE)
		{
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_10");	//The fight was over, you bum!
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_11");	//I don't like it when people don't obey the rules.
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_12");	//Get out of here!
		}
		else
		{
			if(ALRIK_KAEMPFE == 0)
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_13");	//If you wanted to fight me, you only needed to challenge me.
			}
			else
			{
				AI_Output(self,other,"DIA_Alrik_AfterFight_09_14");	//If you wanted another fight, all you needed to do was challenge me!
			};
			AI_Output(self,other,"DIA_Alrik_AfterFight_09_15");	//I don't want anything to do with lowlifes like you! Beat it!
		};
		self.aivar[AIV_ARENAFIGHT] = AF_NONE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ALRIK_DUWOHNST(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_duwohnst_condition;
	information = dia_alrik_duwohnst_info;
	permanent = FALSE;
	description = "You 'live' behind the warehouse?";
};


func int dia_alrik_duwohnst_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_youfight))
	{
		return TRUE;
	};
};

func void dia_alrik_duwohnst_info()
{
	AI_Output(other,self,"DIA_Alrik_DuWohnst_15_00");	//(surprised) You 'live' behind the warehouse?
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_01");	//It's only temporary. (grins) When you have as much gold as I do, you can afford a bit of luxury!
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_02");	//I was a drill instructor in the army, but I left that bunch to seek my fortune in adventure.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_03");	//Now I've wound up in this shithole. My last 100 gold pieces went to the guards at the city gate.
	AI_Output(self,other,"DIA_Alrik_DuWohnst_09_04");	//So, I'm seeing to it that I come into money again. I even had to sell my sword.
	ALRIK_VOMSCHWERTERZAEHLT = TRUE;
};


instance DIA_ALRIK_WERSCHWERT(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_werschwert_condition;
	information = dia_alrik_werschwert_info;
	permanent = FALSE;
	description = "To whom did you sell the sword?";
};


func int dia_alrik_werschwert_condition()
{
	if((ALRIK_VOMSCHWERTERZAEHLT == TRUE) && (MIS_ALRIK_SWORD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_alrik_werschwert_info()
{
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_00");	//To whom did you sell the sword?
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_01");	//I swapped it to a trader in the marketplace for some stuff.
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_02");	//The guy's called Jora. The torches and the bit of meat that he gave me are long used up.
	AI_Output(other,self,"DIA_Alrik_WerSchwert_15_03");	//He isn't likely to give me the sword for nothing...
	AI_Output(self,other,"DIA_Alrik_WerSchwert_09_04");	//It's an old sword. He won't want much for it. Just think of the money as an extra stake for the fight. (grins)
	MIS_ALRIK_SWORD = LOG_RUNNING;
};


var int alrik_einmalschwertbonus;

instance DIA_ALRIK_HAVESWORD(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_havesword_condition;
	information = dia_alrik_havesword_info;
	permanent = TRUE;
	description = "I've got your sword!";
};


func int dia_alrik_havesword_condition()
{
	if(Npc_HasItems(other,itmw_alrikssword_mis) > 0)
	{
		return TRUE;
	};
};

func void dia_alrik_havesword_info()
{
	AI_Output(other,self,"DIA_Alrik_HaveSword_15_00");	//I've got your sword!
	b_giveinvitems(other,self,itmw_alrikssword_mis,1);
	if(MIS_ALRIK_SWORD != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_01");	//Ah! That's much better than fighting with an old stick!
		MIS_ALRIK_SWORD = LOG_SUCCESS;
		b_giveplayerxp(XP_ALRIKSSWORD);
	}
	else
	{
		AI_Output(self,other,"DIA_Alrik_HaveSword_09_02");	//Good! I'm curious whether you'll dare to challenge me again!
	};
	if(ALRIK_EINMALSCHWERTBONUS == FALSE)
	{
		b_addfightskill(self,NPC_TALENT_1H,20);
		ALRIK_EINMALSCHWERTBONUS = TRUE;
	};
	AI_EquipBestMeleeWeapon(self);
};


instance DIA_ALRIK_KRIEG(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_krieg_condition;
	information = dia_alrik_krieg_info;
	permanent = FALSE;
	description = "What do you know about the war against the orcs?";
};


func int dia_alrik_krieg_condition()
{
	if(Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_alrik_krieg_info()
{
	AI_Output(other,self,"DIA_Alrik_Krieg_15_00");	//What do you know about the war against the orcs?
	AI_Output(self,other,"DIA_Alrik_Krieg_09_01");	//There's not much to tell. The war has been going on for too long.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_02");	//The country people are starving. Everywhere there are peasant revolts that are put down mercilessly by the King.
	AI_Output(self,other,"DIA_Alrik_Krieg_09_03");	//But there's just too many of them. If the war doesn't end soon, the realm will fall apart.
};


var int alrik_vorauserzaehlt;

instance DIA_ALRIK_AUSBILDEN(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_ausbilden_condition;
	information = dia_alrik_ausbilden_info;
	permanent = TRUE;
	description = "Can you train me?";
};


func int dia_alrik_ausbilden_condition()
{
	if((Npc_KnowsInfo(other,dia_alrik_duwohnst) || (hero.guild != GIL_NONE)) && (ALRIK_TEACH1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_alrik_ausbilden_info()
{
	AI_Output(other,self,"DIA_Alrik_Ausbilden_15_00");	//Can you train me?
	if((ALRIK_KAEMPFE == 0) && (hero.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Alrik_Ausbilden_09_01");	//If you really want to learn how to fight, then go up against me. (smirks) The lesson is no extra charge.
		ALRIK_VORAUSERZAEHLT = TRUE;
	}
	else
	{
		if(ALRIK_VORAUSERZAEHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_02");	//I keep my word. I'll teach you everything I know - provided you have the necessary experience.
		}
		else
		{
			AI_Output(self,other,"DIA_Alrik_Ausbilden_09_03");	//As long as you have the necessary experience - sure.
		};
		ALRIK_TEACH1H = TRUE;
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Alrik can train me to fight with one-handed weapons. He hangs round behind the storehouse in the harbor district.");
	};
};


var int alrik_merke_1h;

instance DIA_ALRIK_TEACH(C_INFO)
{
	npc = vlk_438_alrik;
	nr = 1;
	condition = dia_alrik_teach_condition;
	information = dia_alrik_teach_info;
	permanent = TRUE;
	description = "Train me as a swordfighter!";
};


func int dia_alrik_teach_condition()
{
	if(ALRIK_TEACH1H == TRUE)
	{
		return TRUE;
	};
};

func void dia_alrik_teach_info()
{
	AI_Output(other,self,"DIA_Alrik_Teach_15_00");	//Train me as a swordfighter!
	ALRIK_MERKE_1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] >= (60 - 30))
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_00");	//You're no longer a beginner!
	}
	else if(other.hitchance[NPC_TALENT_1H] > ALRIK_MERKE_1H)
	{
		AI_Output(self,other,"DIA_Alrik_Teach_Back_09_01");	//You're already better. Soon you'll be a regular fighter!
	};
	Info_ClearChoices(dia_alrik_teach);
};

func void dia_alrik_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

func void dia_alrik_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_alrik_teach);
	Info_AddChoice(dia_alrik_teach,DIALOG_BACK,dia_alrik_teach_back);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_alrik_teach_1h_1);
	Info_AddChoice(dia_alrik_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_alrik_teach_1h_5);
};

