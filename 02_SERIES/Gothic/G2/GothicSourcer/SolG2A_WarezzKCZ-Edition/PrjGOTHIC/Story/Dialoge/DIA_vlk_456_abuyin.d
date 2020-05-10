
instance DIA_ABUYIN_EXIT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 999;
	condition = dia_abuyin_exit_condition;
	information = dia_abuyin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_abuyin_exit_condition()
{
	return TRUE;
};

func void dia_abuyin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ABUYIN_PICKPOCKET(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 900;
	condition = dia_abuyin_pickpocket_condition;
	information = dia_abuyin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_abuyin_pickpocket_condition()
{
	return c_beklauen(75,200);
};

func void dia_abuyin_pickpocket_info()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_BACK,dia_abuyin_pickpocket_back);
	Info_AddChoice(dia_abuyin_pickpocket,DIALOG_PICKPOCKET,dia_abuyin_pickpocket_doit);
};

func void dia_abuyin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_abuyin_pickpocket);
};

func void dia_abuyin_pickpocket_back()
{
	Info_ClearChoices(dia_abuyin_pickpocket);
};


instance DIA_ABUYIN_HALLO(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_hallo_condition;
	information = dia_abuyin_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_abuyin_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_abuyin_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_00");	//(thinking)... How strange. It seems to me that I have met you before, traveler...
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_01");	//Well... great are the mysteries of time and space... Oh, please forgive my rudeness, son of patience. I have not even greeted you yet.
	AI_Output(self,other,"DIA_Addon_Abuyin_Hallo_13_02");	//Welcome, friend, take a seat on my humble rugs and enjoy a pipe in peace.
};


instance DIA_ABUYIN_DU(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_du_condition;
	information = dia_abuyin_du_info;
	permanent = FALSE;
	description = "Who are you?";
};


func int dia_abuyin_du_condition()
{
	return TRUE;
};

func void dia_abuyin_du_info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Abuyin_du_13_01");	//My name is Abuyin ibn Djadir ibn Omar Kalid ben Hadji al Sharidi. I am a seer and a prophet, an astrologer, and a purveyor of tobacco.
};


instance DIA_ABUYIN_KRAUT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_kraut_condition;
	information = dia_abuyin_kraut_info;
	permanent = FALSE;
	description = "What kind of tobacco do you offer?";
};


func int dia_abuyin_kraut_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du))
	{
		return TRUE;
	};
};

func void dia_abuyin_kraut_info()
{
	AI_Output(other,self,"DIA_Abuyin_Kraut_15_00");	//What kind of tobacco do you offer?
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_01");	//My pipes are filled with spicy, refreshing apple tobacco.
	AI_Output(self,other,"DIA_Abuyin_Kraut_13_02");	//Help yourself whenever you want, Son of Adventure.
};


instance DIA_ABUYIN_ANDEREN(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_anderen_condition;
	information = dia_abuyin_anderen_info;
	permanent = FALSE;
	description = "Do you have other tobacco as well?";
};


func int dia_abuyin_anderen_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_kraut))
	{
		return TRUE;
	};
};

func void dia_abuyin_anderen_info()
{
	AI_Output(other,self,"DIA_Abuyin_anderen_15_00");	//Do you have other tobacco as well?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_01");	//I offer only the very best tobacco. This apple blend is a symphony from my homeland, the Southern Isles.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_02");	//But, of course, I'm always open to trying a different sort of tobacco - if somebody should succeed in producing a really good tobacco.
	AI_Output(other,self,"DIA_Abuyin_anderen_15_03");	//How is that done?
	AI_Output(self,other,"DIA_Abuyin_anderen_13_04");	//Start with my apple tobacco as a basis. And then try combining it with another ingredient.
	AI_Output(self,other,"DIA_Abuyin_anderen_13_05");	//This is done at an alchemist's bench, provided you know the essentials of alchemy.
};


instance DIA_ABUYIN_WOHER(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_woher_condition;
	information = dia_abuyin_woher_info;
	permanent = FALSE;
	description = "Where can I get apple tobacco?";
};


func int dia_abuyin_woher_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen))
	{
		return TRUE;
	};
};

func void dia_abuyin_woher_info()
{
	AI_Output(other,self,"DIA_Abuyin_Woher_15_00");	//Where can I get apple tobacco?
	AI_Output(self,other,"DIA_Abuyin_Woher_13_01");	//I shall give you two portions. It is up to you in your wisdom to do with them whatever you want.
	AI_Output(self,other,"DIA_Abuyin_Woher_13_02");	//If you crave more, then direct your steps towards Zuris, the Master of Potions. He produces this tobacco and he sells it, too.
	b_giveinvitems(self,other,itmi_apfeltabak,2);
};

func void b_tabakprobieren()
{
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_00");	//Let me try your tobacco.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Nichts_13_01");	//No, I'm afraid this mixture does not agree with me. But maybe you'll find somebody else who really appreciates this... er... delicacy.
};


instance DIA_ABUYIN_MISCHUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 10;
	condition = dia_abuyin_mischung_condition;
	information = dia_abuyin_mischung_info;
	permanent = TRUE;
	description = "I've got a new tobacco blend...";
};


func int dia_abuyin_mischung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_anderen) && (ABUYIN_HONIGTABAK == FALSE) && ((Npc_HasItems(other,itmi_sumpftabak) >= 1) || (Npc_HasItems(other,itmi_pilztabak) >= 1) || (Npc_HasItems(other,itmi_doppeltabak) >= 1) || (Npc_HasItems(other,itmi_honigtabak) >= 1)))
	{
		return TRUE;
	};
};

func void dia_abuyin_mischung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Mischung_15_00");	//I've got a new tobacco blend...
	Info_ClearChoices(dia_abuyin_mischung);
	Info_AddChoice(dia_abuyin_mischung,DIALOG_BACK,dia_abuyin_mischung_back);
	if(Npc_HasItems(other,itmi_sumpftabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_KRAUT,dia_abuyin_mischung_sumpf);
	};
	if(Npc_HasItems(other,itmi_pilztabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_PILZ,dia_abuyin_mischung_pilz);
	};
	if(Npc_HasItems(other,itmi_doppeltabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_DOPPEL,dia_abuyin_mischung_doppel);
	};
	if(Npc_HasItems(other,itmi_honigtabak) >= 1)
	{
		Info_AddChoice(dia_abuyin_mischung,PRINT_HONIG,dia_abuyin_mischung_super);
	};
};

func void dia_abuyin_mischung_back()
{
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_sumpf()
{
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_pilz()
{
	b_giveinvitems(other,self,itmi_pilztabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_doppel()
{
	b_giveinvitems(other,self,itmi_doppeltabak,1);
	b_tabakprobieren();
	Info_ClearChoices(dia_abuyin_mischung);
};

func void dia_abuyin_mischung_super()
{
	b_giveinvitems(other,self,itmi_honigtabak,1);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_00");	//Let me try your tobacco.
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_01");	//This tastes incredible! I've never had a better smoke in my life!
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_02");	//How did you prepare this blend?
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_03");	//I mixed the tobacco with honey.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_04");	//You have done well, Father of the Art of Blending. I would be delighted to fill my miserable pipes with this.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Fill 'er up, then.
	AI_Output(self,other,"DIA_Abuyin_Mischung_Super_13_06");	//Thank you, Son of Generosity. No other blend could be as good as this one. I shall buy every bit you can bring me of this.
	ABUYIN_HONIGTABAK = TRUE;
	b_giveplayerxp(XP_AMBIENT * 2);
	Info_ClearChoices(dia_abuyin_mischung);
};


instance DIA_ABUYIN_TRADE(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_trade_condition;
	information = dia_abuyin_trade_info;
	permanent = TRUE;
	description = "I've got some honey tobacco for you.";
};


func int dia_abuyin_trade_condition()
{
	if((ABUYIN_HONIGTABAK == TRUE) && (Npc_HasItems(other,itmi_honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_trade_info()
{
	ABUYIN_SCORE = 0;
	ABUYIN_SCORE = Npc_HasItems(other,itmi_honigtabak) * VALUE_ITMI_HONIGTABAK;
	AI_Output(other,self,"DIA_Abuyin_Trade_15_00");	//I've got some honey tobacco for you.
	b_giveinvitems(other,self,itmi_honigtabak,Npc_HasItems(other,itmi_honigtabak));
	Npc_RemoveInvItems(self,itmi_honigtabak,Npc_HasItems(self,itmi_honigtabak));
	b_giveinvitems(self,other,itmi_gold,ABUYIN_SCORE);
	AI_Output(self,other,"DIA_Abuyin_Trade_13_01");	//It is a great pleasure doing business with you.
};


instance DIA_ABUYIN_HERB(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_herb_condition;
	information = dia_abuyin_herb_info;
	permanent = FALSE;
	description = "Are you interested in this package of weeds?";
};


func int dia_abuyin_herb_condition()
{
	if(Npc_HasItems(other,itmi_herbpaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_abuyin_herb_info()
{
	AI_Output(other,self,"DIA_Abuyin_Herb_15_00");	//Are you interested in this package of weeds?
	AI_Output(self,other,"DIA_Abuyin_Herb_13_01");	//A package of herbs - that's not swampweed, is it? Oh, take it away, Son of Improvidence.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_02");	//If the city guards catch me with that, they'll throw me into jail - and you will fare no better!
	AI_Output(self,other,"DIA_Abuyin_Herb_13_03");	//If you're planning to sell this stuff, I advise you - leave this town.
	AI_Output(self,other,"DIA_Abuyin_Herb_13_04");	//Try and get rid of it somewhere outside of the city walls. In here, all you can get for it is trouble galore.
};


instance DIA_ABUYIN_WEISSAGUNG(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung_condition;
	information = dia_abuyin_weissagung_info;
	permanent = FALSE;
	description = "Can you make me a prophecy?";
};


func int dia_abuyin_weissagung_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung_info()
{
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_00");	//Can you make me a prophecy?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_01");	//My services are yours for a modest fee, oh Father of Generosity.
	AI_Output(other,self,"DIA_Abuyin_Weissagung_15_02");	//How much do you want?
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_03");	//For a paltry 25 coins, I shall risk a glance through time for you.
	AI_Output(self,other,"DIA_Abuyin_Weissagung_13_04");	//But remember - the future is always uncertain. All I can do is glimpse some fragments of time.
};


instance DIA_ABUYIN_ZUKUNFT(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft_condition;
	information = dia_abuyin_zukunft_info;
	permanent = TRUE;
	description = "Tell me about the future (pay 25 gold).";
};


var int dia_abuyin_zukunft_permanent;

func int dia_abuyin_zukunft_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung) && (DIA_ABUYIN_ZUKUNFT_PERMANENT == FALSE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft_15_00");	//Tell me about the future.
	if(b_giveinvitems(other,self,itmi_gold,25))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_01");	//All right, Seeker of Knowledge. I shall now enter a state of trance. Are you ready?
		Info_ClearChoices(dia_abuyin_zukunft);
		Info_AddChoice(dia_abuyin_zukunft,"I am ready!",dia_abuyin_zukunft_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft_13_02");	//Oh Father of Coins, I ask you for 25 gold pieces in return for a glimpse into the future.
	};
};

func void dia_abuyin_zukunft_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_00");	//(Trance)... Orcs... they are guarding an entry... an old tunnel... the Valley of Mines...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_01");	//(Trance)... Men in shining armor... a magician... your friend is with them... he is waiting for you...
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_02");	//(Trance)... Fire! An attack... a mighty creature... the flames... many... shall die...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_00");	//(Trance)... what is that...? A city... Ruins... Quarhodron in Jharkendar...
	AI_Output(self,other,"DIA_Addon_Abuyin_Zukunft_Trance_13_01");	//(Trance)... he is summoned... Quarhodron in Jharkendar!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft_Trance_13_03");	//... I'm sorry - the vision is over. There's nothing more I can see.
	DIA_ABUYIN_ZUKUNFT_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 1;
	Info_ClearChoices(dia_abuyin_zukunft);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_NOCHMAL(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_nochmal_condition;
	information = dia_abuyin_nochmal_info;
	permanent = TRUE;
	description = "Could you make me another prophecy?";
};


func int dia_abuyin_nochmal_condition()
{
	if(KAPITEL == ABUYIN_ZUKUNFT)
	{
		return TRUE;
	};
};

func void dia_abuyin_nochmal_info()
{
	AI_Output(other,self,"DIA_Abuyin_Nochmal_15_00");	//Can you make me another prophecy?
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_01");	//Oh Son of the Mysterious Future, it is not within my power to lift the veil of time.
	AI_Output(self,other,"DIA_Abuyin_Nochmal_13_02");	//Only when time sends me another omen shall I be able to see for you again.
	if(ABUYIN_ERZAEHLT == FALSE)
	{
		AI_Output(other,self,"DIA_Abuyin_Nochmal_15_03");	//When will that be?
		AI_Output(self,other,"DIA_Abuyin_Nochmal_13_04");	//When the future has become present and you have continued your journey.
		ABUYIN_ERZAEHLT = TRUE;
	};
};

func void b_abuyin_weissagung()
{
	AI_Output(other,self,"B_Abuyin_Weissagung_15_00");	//Can you make me a prophecy?
	AI_Output(self,other,"B_Abuyin_Weissagung_13_01");	//Yes, time has progressed and I shall give you a prophecy in return for a few coins.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//How much?
};


instance DIA_ABUYIN_WEISSAGUNG2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung2_condition;
	information = dia_abuyin_weissagung2_info;
	permanent = FALSE;
	description = "Can you make me a prophecy?";
};


func int dia_abuyin_weissagung2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung2_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung2_13_00");	//For a paltry 100 coins, I shall risk a glance through time for you.
};


instance DIA_ABUYIN_ZUKUNFT2(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft2_condition;
	information = dia_abuyin_zukunft2_info;
	permanent = TRUE;
	description = "Tell me about the future (pay 100 gold).";
};


var int dia_abuyin_zukunft2_permanent;

func int dia_abuyin_zukunft2_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung2) && (DIA_ABUYIN_ZUKUNFT2_PERMANENT == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft2_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft2_15_00");	//Tell me about the future.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_01");	//All right, Son of Bravery. I shall now enter a state of trance. Are you ready?
		Info_ClearChoices(dia_abuyin_zukunft2);
		Info_AddChoice(dia_abuyin_zukunft2,"I am ready!",dia_abuyin_zukunft2_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft2_13_02");	//Oh Father of Coins, I ask you for 100 gold pieces in return for a glimpse into the future.
	};
};

func void dia_abuyin_zukunft2_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_00");	//(Trance)... A mercenary... he will need you... a terrible murder... the Eye...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_01");	//(Trance)... the sinister henchmen... they are coming... searching for you... a guardian will fall...
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_02");	//(Trance)... but the three shall unite... only then shall you receive what is yours...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft2_Trance_13_03");	//That's all. There's nothing more I can see.
	DIA_ABUYIN_ZUKUNFT2_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 2;
	Info_ClearChoices(dia_abuyin_zukunft2);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung3_condition;
	information = dia_abuyin_weissagung3_info;
	permanent = FALSE;
	description = "Can you make me a prophecy?";
};


func int dia_abuyin_weissagung3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung3_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung3_13_00");	//For a paltry 250 coins, I shall risk a glance through time for you.
};


instance DIA_ABUYIN_ZUKUNFT3(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft3_condition;
	information = dia_abuyin_zukunft3_info;
	permanent = TRUE;
	description = "Tell me about the future (pay 250 gold).";
};


var int dia_abuyin_zukunft3_permanent;

func int dia_abuyin_zukunft3_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung3) && (DIA_ABUYIN_ZUKUNFT3_PERMANENT == FALSE) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft3_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft3_15_00");	//Tell me about the future.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_01");	//All right, Son of Knowledge. I shall now enter a state of trance. Are you ready?
		Info_ClearChoices(dia_abuyin_zukunft3);
		Info_AddChoice(dia_abuyin_zukunft3,"I am ready!",dia_abuyin_zukunft3_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft3_13_02");	//Oh Father of Coins, I ask you for 250 gold pieces in return for a glimpse into the future.
	};
};

func void dia_abuyin_zukunft3_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_00");	//(Trance)... you shall force... what is nobody's destiny but yours...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_01");	//(Trance)... through fire and snow... through ice and flames...
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_02");	//(Trance)... Men in foreign armor... a swamp... lizards... they await you...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft3_Trance_13_03");	//That's all. There's nothing more I can see.
	DIA_ABUYIN_ZUKUNFT3_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 3;
	Info_ClearChoices(dia_abuyin_zukunft3);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung4_condition;
	information = dia_abuyin_weissagung4_info;
	permanent = FALSE;
	description = "Can you make me a prophecy?";
};


func int dia_abuyin_weissagung4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung4_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung4_13_00");	//For a paltry 500 coins, I shall risk a glance through time for you.
};


instance DIA_ABUYIN_ZUKUNFT4(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft4_condition;
	information = dia_abuyin_zukunft4_info;
	permanent = TRUE;
	description = "Tell me about the future (pay 500 gold).";
};


var int dia_abuyin_zukunft4_permanent;

func int dia_abuyin_zukunft4_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung4) && (DIA_ABUYIN_ZUKUNFT4_PERMANENT == FALSE) && (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft4_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft4_15_00");	//Tell me about the future.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_01");	//All right, Son of Knowledge. I shall now enter a state of trance. Are you ready?
		Info_ClearChoices(dia_abuyin_zukunft4);
		Info_AddChoice(dia_abuyin_zukunft4,"I am ready!",dia_abuyin_zukunft4_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft4_13_02");	//Oh Father of Coins, I ask you for 500 gold pieces in return for a glimpse into the future.
	};
};

func void dia_abuyin_zukunft4_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_00");	//(Trance)... the place of knowledge... another country... a dark place far away...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_01");	//(Trance)... brave companions... you shall make your choice...
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_02");	//(Trance)... a temple... lies lonely in the realm of Adanos... hidden in the fog...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft4_Trance_13_03");	//That's all. There's nothing more I can see.
	DIA_ABUYIN_ZUKUNFT4_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 4;
	Info_ClearChoices(dia_abuyin_zukunft4);
	b_giveplayerxp(XP_AMBIENT * 4);
};


instance DIA_ABUYIN_WEISSAGUNG5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_weissagung5_condition;
	information = dia_abuyin_weissagung5_info;
	permanent = FALSE;
	description = "Can you make me a prophecy?";
};


func int dia_abuyin_weissagung5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_du) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_weissagung5_info()
{
	b_abuyin_weissagung();
	AI_Output(self,other,"DIA_Abuyin_Weissagung5_13_00");	//For a paltry 1000 coins, I shall risk a glance through time for you.
};


instance DIA_ABUYIN_ZUKUNFT5(C_INFO)
{
	npc = vlk_456_abuyin;
	nr = 2;
	condition = dia_abuyin_zukunft5_condition;
	information = dia_abuyin_zukunft5_info;
	permanent = TRUE;
	description = "Tell me about the future (pay 1000 gold).";
};


var int dia_abuyin_zukunft5_permanent;

func int dia_abuyin_zukunft5_condition()
{
	if(Npc_KnowsInfo(other,dia_abuyin_weissagung5) && (DIA_ABUYIN_ZUKUNFT5_PERMANENT == FALSE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_abuyin_zukunft5_info()
{
	AI_Output(other,self,"DIA_Abuyin_Zukunft5_15_00");	//Tell me about the future.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_01");	//All right, Son of Knowledge. I shall now enter a state of trance. Are you ready?
		Info_ClearChoices(dia_abuyin_zukunft5);
		Info_AddChoice(dia_abuyin_zukunft5,"I am ready!",dia_abuyin_zukunft5_trance);
	}
	else
	{
		AI_Output(self,other,"DIA_Abuyin_Zukunft5_13_02");	//Oh Father of Coins, I ask you for 1000 gold pieces in return for a glimpse into the future.
	};
};

func void dia_abuyin_zukunft5_trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_00");	//(Trance)... Darkness pervades the land... evil will triumph...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_01");	//(Trance)... the King shall lose his war against the orcs...
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_02");	//(Trance)... you shall return, but you shall not find peace...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Abuyin_Zukunft5_Trance_13_03");	//That's all. There's nothing more I can see.
	DIA_ABUYIN_ZUKUNFT5_PERMANENT = TRUE;
	ABUYIN_ZUKUNFT = 5;
	Info_ClearChoices(dia_abuyin_zukunft5);
	b_giveplayerxp(XP_AMBIENT * 4);
};

