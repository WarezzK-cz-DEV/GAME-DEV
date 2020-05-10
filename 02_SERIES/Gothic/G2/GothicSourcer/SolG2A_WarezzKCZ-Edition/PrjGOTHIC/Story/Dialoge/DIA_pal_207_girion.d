
instance DIA_GIRION_EXIT(C_INFO)
{
	npc = pal_207_girion;
	nr = 999;
	condition = dia_girion_exit_condition;
	information = dia_girion_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_exit_condition()
{
	return TRUE;
};

func void dia_girion_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_HALLO(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_hallo_condition;
	information = dia_girion_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_girion_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SHIPISFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_girion_hallo_info()
{
	AI_Output(self,other,"DIA_Girion_Hallo_08_00");	//I am Girion, master of two-handed combat and paladin of the king. Why are you disturbing me?
};


instance DIA_GIRION_CANTEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_canteach_condition;
	information = dia_girion_canteach_info;
	permanent = TRUE;
	description = "Could you train me?";
};


func int dia_girion_canteach_condition()
{
	if(GIRION_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_canteach_info()
{
	AI_Output(other,self,"DIA_Girion_CanTeach_15_00");	//Can you train me?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_01");	//You do well to train in the noblest of all combat styles. As is proper for a warrior of Innos.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_02");	//I shall instruct you. Report to me when you are ready.
		GIRION_TEACH2H = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"Paladin Girion can teach me to fight with two-handed weapons.");
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CanTeach_08_03");	//If you wish to learn something, you must turn to a teacher from outside of our order.
		AI_Output(self,other,"DIA_Girion_CanTeach_08_04");	//I am a warrior, not a teacher.
	};
};


instance DIA_GIRION_TEACH(C_INFO)
{
	npc = pal_207_girion;
	nr = 100;
	condition = dia_girion_teach_condition;
	information = dia_girion_teach_info;
	permanent = TRUE;
	description = "I'm ready for training.";
};


var int dia_girion_teach_permanent;

func int dia_girion_teach_condition()
{
	if((GIRION_TEACH2H == TRUE) && (DIA_GIRION_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};


var int girion_merk2h;

func void dia_girion_teach_info()
{
	GIRION_MERK2H = other.hitchance[NPC_TALENT_2H];
	AI_Output(other,self,"DIA_Girion_Teach_15_00");	//I am ready to be trained.
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 90)
	{
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_00");	//Naturally, your education is not finished, but there is nothing more that I can teach you.
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_01");	//If you wish to improve your talent with the weapon further, you will have to seek out a true swordmaster.
		AI_Output(other,self,"DIA_DIA_Girion_Teach_15_02");	//Where can I find such a man?
		AI_Output(self,other,"DIA_DIA_Girion_Teach_08_03");	//Lord Hagen is a swordmaster. He will certainly instruct you.
		DIA_GIRION_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_girion_teach);
};

func void dia_girion_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_00");	//Fight with honor. Combat is our life - and what is your life without honor?
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_01");	//Be cautious and quick in combat. Surprise your opponent.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_02");	//Never go into combat unprepared. You can never know if it is your last.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_1_08_03");	//A paladin is always prepared for combat. But he never begins a fight he cannot win.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};

func void dia_girion_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	if(other.hitchance[NPC_TALENT_2H] > GIRION_MERK2H)
	{
		if(GIRION_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_00");	//A paladin fights not only with the sword, but also with his mind.
		};
		if(GIRION_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_01");	//You have to know the point up to which you can retreat.
		};
		if(GIRION_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_02");	//Remember, you fight well if you control your opponent and don't give him a chance to be in control himself.
		};
		if(GIRION_LABERCOUNT == 3)
		{
			AI_Output(self,other,"DIA_DIA_Girion_Teach_2H_5_08_03");	//You have only lost when you have given up.
		};
		GIRION_LABERCOUNT = GIRION_LABERCOUNT + 1;
		if(GIRION_LABERCOUNT >= 3)
		{
			GIRION_LABERCOUNT = 0;
		};
	};
	Info_ClearChoices(dia_girion_teach);
	Info_AddChoice(dia_girion_teach,DIALOG_BACK,dia_girion_teach_back);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_teach_2h_1);
	Info_AddChoice(dia_girion_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_teach_2h_5);
};


instance DIA_GIRION_CATCHPLAYERSTOLENSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 5;
	condition = dia_girion_catchplayerstolenship_condition;
	information = dia_girion_catchplayerstolenship_info;
	important = TRUE;
};


func int dia_girion_catchplayerstolenship_condition()
{
	if((KAPITEL >= 5) && (MIS_SHIPISFREE == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_25") < 1000))
	{
		return TRUE;
	};
};

func void dia_girion_catchplayerstolenship_info()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_08_00");	//Hey! Can you tell me what you are doing here?
	Info_ClearChoices(dia_girion_catchplayerstolenship);
	Info_AddChoice(dia_girion_catchplayerstolenship,"I don't know what you're talking about.",dia_girion_catchplayerstolenship_no);
	Info_AddChoice(dia_girion_catchplayerstolenship,"Get out of my way, or I'll have to kill you.",dia_girion_catchplayerstolenship_weg);
	Info_AddChoice(dia_girion_catchplayerstolenship,"I need the ship.",dia_girion_catchplayerstolenship_ship);
};

func void dia_girion_catchplayerstolenship_no()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_15_00");	//I don't know what you're talking about.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_01");	//I am talking about what you have worked out with the ship's guards up there. That stinks to high heaven.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_no_08_02");	//Even if you are a magician, I still don't trust you.
	};
};


var int girion_wantstokillsc;

func void dia_girion_catchplayerstolenship_weg()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_15_00");	//Get out of my way, or I'll have to kill you.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_01");	//You may be able to deceive the ship's guard, but you will find me a tough nut to crack, my little friend.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_weg_08_02");	//Even if you are one of us, that does not give you the right to steal the king's property. Die, you damned traitor.
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	GIRION_WANTSTOKILLSC = TRUE;
};

func void b_girionstayonship()
{
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_09");	//When we have finished this business, you will turn the ship back over to me, understood?
};

func void dia_girion_catchplayerstolenship_ship()
{
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_00");	//I need the ship. So I will take it.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_01");	//You cannot do that. The ore transport...
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_02");	//How dare you, you stinking son of a...
	};
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_03");	//The ore in the Valley of Mines is not enough to satisfy the king. I was there. There's nothing more to be had there. Hagen's mission is a farce.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_04");	//The real threat has its roots on an offshore island not far from here. I shall sail there and put an end to it.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_05");	//Either you join me, or I'll have to do away with you. It's your choice.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_06");	//Mmh. It sounds as though I have no choice.
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_07");	//Correct.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_08");	//Well, all right. I shall join you, but only under one condition.
	b_girionstayonship();
	AI_Output(other,self,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_15_10");	//I can live with that.
	AI_Output(self,other,"DIA_Girion_CATCHPLAYERSTOLENSHIP_ship_08_11");	//Then do what you must do. I shall wait here for you.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	GIRION_ISONBOARD = LOG_SUCCESS;
};


instance DIA_GIRION_VERRAT(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_verrat_condition;
	information = dia_girion_verrat_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_verrat_condition()
{
	if(GIRION_WANTSTOKILLSC == TRUE)
	{
		return TRUE;
	};
};

func void dia_girion_verrat_info()
{
	AI_Output(self,other,"DIA_Girion_Verrat_08_00");	//Traitor!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GIRION_ONSHIP(C_INFO)
{
	npc = pal_207_girion;
	nr = 2;
	condition = dia_girion_onship_condition;
	information = dia_girion_onship_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_girion_onship_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GIRION_ISONBOARD == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_girion_onship_info()
{
	b_girionstayonship();
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion;
	nr = 900;
	condition = dia_girion_pickpocket_condition;
	information = dia_girion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_pickpocket_condition()
{
	return c_beklauen(73,280);
};

func void dia_girion_pickpocket_info()
{
	Info_ClearChoices(dia_girion_pickpocket);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_BACK,dia_girion_pickpocket_back);
	Info_AddChoice(dia_girion_pickpocket,DIALOG_PICKPOCKET,dia_girion_pickpocket_doit);
};

func void dia_girion_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_pickpocket);
};

func void dia_girion_pickpocket_back()
{
	Info_ClearChoices(dia_girion_pickpocket);
};

