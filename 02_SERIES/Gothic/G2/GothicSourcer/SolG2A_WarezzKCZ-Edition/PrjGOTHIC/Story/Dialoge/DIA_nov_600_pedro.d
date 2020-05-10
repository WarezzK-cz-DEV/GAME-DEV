
instance DIA_PEDRO_EXIT(C_INFO)
{
	npc = nov_600_pedro;
	nr = 999;
	condition = dia_pedro_exit_condition;
	information = dia_pedro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_exit_condition()
{
	return TRUE;
};

func void dia_pedro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_WELCOME(C_INFO)
{
	npc = nov_600_pedro;
	nr = 1;
	condition = dia_pedro_welcome_condition;
	information = dia_pedro_welcome_info;
	important = TRUE;
};


func int dia_pedro_welcome_condition()
{
	return TRUE;
};

func void dia_pedro_welcome_info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Welcome to the monastery of Innos, stranger.
	AI_PlayAni(self,"T_GREETNOV");
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//I am Brother Pedro, a humble servant of Innos and the warder of the gate to the holy monastery.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//What is it that you require?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "Here, have a sausage, Brother!";
};


func int dia_pedro_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_pedro_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Here, have a sausage, Brother!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Good of you to think of me. Usually, I am forgotten.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//You could let me have another sausage.
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Forget it, I won't have enough then.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//Hey, one sausage - nobody will notice that. You'll get something for it - I know a place where some fire nettles grow.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//If you take them to Neoras, he'll surely give you the key to the library. What do you say?
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_pedro_wurst);
	Info_AddChoice(dia_pedro_wurst,"OK, have another sausage.",dia_pedro_wurst_ja);
	Info_AddChoice(dia_pedro_wurst,"No, forget it.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//OK, have another sausage.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//All right. Some fire nettles are growing to the left and right on the other side of the bridge.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//No, forget it.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//You want to get in good with Gorax, huh? It's always the same with the new novices...
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "I want to enter the monastery.";
};


func int dia_pedro_einlass_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_welcome))
	{
		return TRUE;
	};
};

func void dia_pedro_einlass_info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//I want to enter the monastery.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Only the servants of Innos are allowed to enter the monastery.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//If you want to pray to Innos, go find one of the roadside shrines. You will find the tranquility to pray there.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "What do I have to do to be accepted in the monastery?";
};


func int dia_pedro_tempel_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_einlass) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pedro_tempel_info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//What do I have to do to be accepted in the monastery?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Acceptance into the monastery is denied to you - you have already chosen a path.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//If you want to be accepted into the Brotherhood of Innos, you must learn and obey the rules of the monastery.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_03");	//Also, we demand the gifts to Innos from each new novice.
		AI_Output(self,other,"DIA_ADDON_Pedro_TEMPEL_09_04");	//A sheep and 1000 gold pieces.
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//That's a whole lot of gold.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//It is a sign that you are beginning a new life as a servant of Innos. When you are accepted you will be forgiven all your previous transgressions.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//And consider - you cannot take back the decision to become a servant of Innos.
		SC_KNOWSKLOSTERTRIBUT = TRUE;
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"To become a novice at the monastery of Innos, I need a sheep and a huge sum of gold.");
	};
};


instance DIA_ADDON_PEDRO_STATUETTE(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_addon_pedro_statuette_condition;
	information = dia_addon_pedro_statuette_info;
	permanent = FALSE;
	description = "I've got this statuette...";
};


func int dia_addon_pedro_statuette_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && (MIS_ADDON_DARON_GETSTATUE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_pedro_rules) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_addon_pedro_statuette_info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_00");	//I've got this statuette here. I think they're missing it in the monastery.
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_15_01");	//Can I come in now?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_02");	//Well, under these truly exceptional circumstances you are free to become a novice.
		Log_CreateTopic(TOPIC_ADDON_RANGERHELPKDF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RANGERHELPKDF,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RANGERHELPKDF,"Pedro the novice let me into the monastery because I was carrying the missing stauette. I was supposed to give it to someone in the monastery.");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_03");	//I can't let you in even with this precious gem, I'm afraid.
		AI_Output(self,other,"DIA_Addon_Pedro_Statuette_09_04");	//You have already decided upon a different path. The way into the monastery is closed to you.
	};
};


instance DIA_ADDON_PEDRO_STATUETTE_ABGEBEN(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_addon_pedro_statuette_abgeben_condition;
	information = dia_addon_pedro_statuette_abgeben_info;
	permanent = FALSE;
	description = "Can I just hand the statuette over to you?";
};


func int dia_addon_pedro_statuette_abgeben_condition()
{
	if(Npc_HasItems(other,itmi_lostinnosstatue_daron) && Npc_KnowsInfo(other,dia_addon_pedro_statuette) && (hero.guild != GIL_NONE) && (hero.guild != GIL_NOV) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_addon_pedro_statuette_abgeben_info()
{
	AI_Output(other,self,"DIA_Addon_Pedro_Statuette_Abgeben_15_00");	//Can I just hand the statuette over to you?
	AI_Output(self,other,"DIA_Addon_Pedro_Statuette_Abgeben_09_01");	//Of course, I shall take care of it. Thank you for this unselfish deed.
	MIS_ADDON_DARON_GETSTATUE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_REPORTLOSTINNOSSTATUE2DARON);
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "What are the rules you live by?";
};


func int dia_pedro_rules_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_tempel))
	{
		return TRUE;
	};
};

func void dia_pedro_rules_info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//What are the rules you live by?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Innos is the god of truth and law and thus we may NEVER lie or commit a crime.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Should you transgress against a brother of the community or steal our property, you will pay a penalty for it.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Innos is also the god of rule and fire.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//As a novice you must show OBEDIENCE and RESPECT to all Magicians of Fire.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//I see.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Furthermore, it is the DUTY of a novice to carry out all the work in the monastery for the good of the community.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//If you are prepared to follow these rules and have the offering to Innos, we are willing to accept you into our monastery as a novice.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "I want to become a novice.";
};


var int dia_pedro_aufnahme_noperm;

func int dia_pedro_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_rules) && (DIA_PEDRO_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void b_dia_pedro_aufnahme_choice()
{
	Info_ClearChoices(dia_pedro_aufnahme);
	Info_AddChoice(dia_pedro_aufnahme,"I'll think about it some more.",dia_pedro_aufnahme_no);
	Info_AddChoice(dia_pedro_aufnahme,"Yes, I want to dedicate my life to the service of Innos.",dia_pedro_aufnahme_yes);
};

func void dia_pedro_aufnahme_info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//I want to become a novice.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//You have already chosen your path. The path of magic is closed to you.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_addon_pedro_statuette))
	{
		AI_Output(self,other,"DIA_Addon_Pedro_AUFNAHME_09_02");	//Is that really what you wish to do? For you must know that there will be no turning back for you then.
		b_dia_pedro_aufnahme_choice();
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//I see that you have brought the required offering. If you are truly willing, you are now free to become a novice.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//However, if you make this decision there is no going back - consider well if this is your path!
		b_dia_pedro_aufnahme_choice();
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//You did not bring the required offering with you.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Yes, I want to dedicate my life to the service of Innos.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//Then be welcome, Brother. I give to you the key to the monastery gate.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//As a sign of your free decision, it is up to you to open the gate and step through.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//You are now a novice. Wear this robe as a sign that you are now a member of this brotherhood.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//When you are in the monastery, go to Parlan. He'll see to your needs from now on.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Will my transgressions be forgiven now?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Not yet. Speak to Master Parlan. He will bless you and wash you clean of your sins.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,hero,itke_innos_mis,1);
	CreateInvItems(other,itar_nov_l,1);
	AI_EquipArmor(other,itar_nov_l);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	NOV_AUFNAHME = TRUE;
	b_giveplayerxp(XP_AUFNAHMENOVIZE);
	if(Npc_KnowsInfo(other,dia_addon_pedro_statuette))
	{
		PEDRO_NOV_AUFNAHME_LOSTINNOSSTATUE_DARON = TRUE;
		LIESEL_GIVEAWAY = LOG_OBSOLETE;
	};
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void dia_pedro_aufnahme_no()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//I'll think about it some more.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Come back when you are ready.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "Tell me about life in the monastery.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Tell me about life in the monastery.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//We live in the monastery in order to serve Innos. We novices perform the work and study the scriptures when we have the opportunity.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//The magicians watch over us, and they explore the arts of magic.
};


instance DIA_PEDRO_PICKPOCKET(C_INFO)
{
	npc = nov_600_pedro;
	nr = 900;
	condition = dia_pedro_pickpocket_condition;
	information = dia_pedro_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_pedro_pickpocket_condition()
{
	return c_beklauen(45,60);
};

func void dia_pedro_pickpocket_info()
{
	Info_ClearChoices(dia_pedro_pickpocket);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_BACK,dia_pedro_pickpocket_back);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_PICKPOCKET,dia_pedro_pickpocket_doit);
};

func void dia_pedro_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pedro_pickpocket);
};

func void dia_pedro_pickpocket_back()
{
	Info_ClearChoices(dia_pedro_pickpocket);
};

