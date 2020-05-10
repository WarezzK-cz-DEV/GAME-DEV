
instance DIA_HOKURN_EXIT(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 999;
	condition = dia_hokurn_exit_condition;
	information = dia_hokurn_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hokurn_exit_condition()
{
	return TRUE;
};

func void dia_hokurn_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOKURN_HELLO(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 4;
	condition = dia_hokurn_hello_condition;
	information = dia_hokurn_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hokurn_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hokurn_hello_info()
{
	AI_Output(self,other,"DIA_Hokurn_Hello_01_00");	//Do you have anything to drink?
	AI_Output(other,self,"DIA_Hokurn_Hello_15_01");	//I assume that it's not water you want.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_02");	//No, damnit!! I need something alcoholic so I can finally get rid of these damned headaches.
	AI_Output(self,other,"DIA_Hokurn_Hello_01_03");	//When I haven't had anything to drink for a while, my skull feels like it's going to explode at any moment.
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,"There's nothing I can give you.",dia_hokurn_hello_no);
	if((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1))
	{
		Info_AddChoice(dia_hokurn_hello,"Here, take this.",dia_hokurn_hello_yes);
	};
};

func void dia_hokurn_hello_no()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_No_15_00");	//There's nothing I can give you.
	AI_Output(self,other,"DIA_Hokurn_Hello_No_01_01");	//Then scram!
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
	Info_AddChoice(dia_hokurn_hello,"One more thing...",dia_hokurn_hello_ask1);
};

func void dia_hokurn_hello_ask1()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK1_15_00");	//One more thing...
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK1_01_01");	//(bellows) Didn't you understand me? PISS OFF!!!
	Info_ClearChoices(dia_hokurn_hello);
	Info_AddChoice(dia_hokurn_hello,DIALOG_ENDE,dia_hokurn_hello_end);
	Info_AddChoice(dia_hokurn_hello,"It's important.",dia_hokurn_hello_ask2);
};

func void dia_hokurn_hello_ask2()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_ASK2_15_00");	//It's important.
	AI_Output(self,other,"DIA_Hokurn_Hello_ASK2_01_01");	//(bellows) You asked for it.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_hokurn_hello_end()
{
	AI_StopProcessInfos(self);
};

func void b_hokurn_sauf()
{
	AI_Output(self,other,"B_Hokurn_Sauf_01_00");	//(burps) Ha, that hit the spot.
	AI_Output(self,other,"B_Hokurn_Sauf_01_01");	//So, now I can think clearly again. What can I do for you?
};

func void dia_hokurn_hello_yes()
{
	AI_Output(other,self,"DIA_Hokurn_Hello_Yes_15_00");	//Here, take this.
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	HOKURNGETSDRINK = TRUE;
	b_hokurn_sauf();
	Info_ClearChoices(dia_hokurn_hello);
};


instance DIA_HOKURN_DRINK(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_drink_condition;
	information = dia_hokurn_drink_info;
	permanent = TRUE;
	description = "I brought you something to drink.";
};


func int dia_hokurn_drink_condition()
{
	if((HOKURNGETSDRINK == FALSE) && ((Npc_HasItems(other,itfo_beer) >= 1) || (Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1)))
	{
		return TRUE;
	};
};

func void dia_hokurn_drink_info()
{
	AI_Output(other,self,"DIA_Hokurn_Drink_15_00");	//I brought you something to drink.
	AI_Output(self,other,"DIA_Hokurn_Drink_01_01");	//(greedy) Gimme!!
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	HOKURNGETSDRINK = TRUE;
	b_hokurn_sauf();
};


instance DIA_HOKURN_QUESTION(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_question_condition;
	information = dia_hokurn_question_info;
	permanent = TRUE;
	description = "I need some information.";
};


func int dia_hokurn_question_condition()
{
	if(HOKURNGETSDRINK == FALSE)
	{
		return TRUE;
	};
};

func void dia_hokurn_question_info()
{
	AI_Output(other,self,"DIA_Hokurn_Question_15_00");	//I need some information.
	AI_Output(self,other,"DIA_Hokurn_Question_01_01");	//(annoyed) I thought you understood me. I only talk to friends.
	AI_Output(self,other,"DIA_Hokurn_Question_01_02");	//And friends offer you something to drink. Got it? Now scram!
};


instance DIA_HOKURN_LEARN(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 6;
	condition = dia_hokurn_learn_condition;
	information = dia_hokurn_learn_info;
	permanent = FALSE;
	description = "I'm looking for someone who can teach me something.";
};


func int dia_hokurn_learn_condition()
{
	if(HOKURNGETSDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_learn_info()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_15_00");	//I'm looking for someone who can teach me something.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_01");	//I could teach you a few things. I'm the best fighter for miles around.
	AI_Output(self,other,"DIA_Hokurn_Learn_01_02");	//Since we're friends, I'll give you a special price. 300 gold pieces.
	Info_ClearChoices(dia_hokurn_learn);
	Info_AddChoice(dia_hokurn_learn,"That's too expensive for me.",dia_hokurn_learn_tooexpensive);
	if(Npc_HasItems(other,itmi_gold) >= 300)
	{
		Info_AddChoice(dia_hokurn_learn,"All right, here's the money.",dia_hokurn_learn_ok);
	};
};

func void dia_hokurn_learn_tooexpensive()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_TooExpensive_15_00");	//That's too expensive for me.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_01");	//Too expensive? That's less than anyone else in my place would charge.
	AI_Output(self,other,"DIA_Hokurn_Learn_TooExpensive_01_02");	//Think about it.
	Info_ClearChoices(dia_hokurn_learn);
};

func void dia_hokurn_learn_ok()
{
	AI_Output(other,self,"DIA_Hokurn_Learn_OK_15_00");	//All right, here's the money.
	b_giveinvitems(other,self,itmi_gold,300);
	HOKURN_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_hokurn_learn);
};


instance DIA_HOKURN_PAYTEACHER(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 6;
	condition = dia_hokurn_payteacher_condition;
	information = dia_hokurn_payteacher_info;
	permanent = TRUE;
	description = "Here's your money. I want to be trained.";
};


func int dia_hokurn_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_hokurn_learn) && (Npc_HasItems(other,itmi_gold) >= 300) && (HOKURN_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_hokurn_payteacher_info()
{
	AI_Output(other,self,"DIA_Hokurn_PayTeacher_15_00");	//Here's your money. I want to be trained.
	AI_Output(self,other,"DIA_Hokurn_PayTeacher_01_01");	//You won't be sorry!
	b_giveinvitems(other,self,itmi_gold,300);
	HOKURN_TEACHPLAYER = TRUE;
};


instance DIA_HOKURN_DRINKANDLEARN(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 7;
	condition = dia_hokurn_drinkandlearn_condition;
	information = dia_hokurn_drinkandlearn_info;
	permanent = TRUE;
	description = "Here's something to drink for you.";
};


func int dia_hokurn_drinkandlearn_condition()
{
	if((HOKURNGETSDRINK == TRUE) && ((Npc_HasItems(other,itfo_booze) >= 1) || (Npc_HasItems(other,itfo_wine) >= 1) || (Npc_HasItems(other,itfo_beer) >= 1)))
	{
		return TRUE;
	};
};

func void dia_hokurn_drinkandlearn_info()
{
	AI_Output(other,self,"DIA_Hokurn_DrinkAndLearn_15_00");	//Here's something to drink for you.
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		b_giveinvitems(other,self,itfo_booze,1);
		b_useitem(self,itfo_booze);
	}
	else if(Npc_HasItems(other,itfo_wine) >= 1)
	{
		b_giveinvitems(other,self,itfo_wine,1);
		b_useitem(self,itfo_wine);
	}
	else if(Npc_HasItems(other,itfo_beer) >= 1)
	{
		b_giveinvitems(other,self,itfo_beer,1);
		b_useitem(self,itfo_beer);
	};
	HOKURNLASTDRINK = Wld_GetDay();
	AI_Output(self,other,"DIA_Hokurn_DrinkAndLearn_01_01");	//I'm feeling a lot better. I'm ready for anything.
};


instance DIA_HOKURN_TEACH(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 7;
	condition = dia_hokurn_teach_condition;
	information = dia_hokurn_teach_info;
	permanent = TRUE;
	description = "Let's start with the training.";
};


func int dia_hokurn_teach_condition()
{
	if(HOKURN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_teach_info()
{
	AI_Output(other,self,"DIA_Hokurn_Teach_15_00");	//Let's start with the training.
	if(HOKURNLASTDRINK < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Hokurn_Teach_01_01");	//First bring me something to drink!
	}
	else
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_02");	//Then we'll see what we can get out of your rusty paladin bones, hey?
		}
		else if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Hokurn_Teach_01_03");	//What do you know. Even magicians use close combat weapons.
		};
		Info_ClearChoices(dia_hokurn_teach);
		Info_AddChoice(dia_hokurn_teach,DIALOG_BACK,dia_hokurn_teach_back);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hokurn_teach_2h_1);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hokurn_teach_2h_5);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_hokurn_teach_1h_1);
		Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_hokurn_teach_1h_5);
	};
};

func void dia_hokurn_teach_back()
{
	Info_ClearChoices(dia_hokurn_teach);
};

func void b_hokurn_teachedenough()
{
	AI_Output(self,other,"B_Hokurn_TeachedEnough_01_00");	//You don't need a teacher for this discipline any more.
};

func void dia_hokurn_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hokurn_teach_2h_1);
};

func void dia_hokurn_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hokurn_teach_2h_5);
};

func void dia_hokurn_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100);
	if(other.hitchance[NPC_TALENT_1H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_hokurn_teach_1h_1);
};

func void dia_hokurn_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100);
	if(other.hitchance[NPC_TALENT_1H] >= 100)
	{
		b_hokurn_teachedenough();
	};
	Info_AddChoice(dia_hokurn_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_hokurn_teach_1h_5);
};


instance DIA_HOKURN_STAYHERE(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_stayhere_condition;
	information = dia_hokurn_stayhere_info;
	permanent = FALSE;
	description = "What are you doing here anyway?";
};


func int dia_hokurn_stayhere_condition()
{
	if(HOKURNGETSDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_stayhere_info()
{
	AI_Output(other,self,"DIA_Hokurn_StayHere_15_00");	//What are you doing here anyway?
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_01");	//I don't have any idea what we're doing here or when it'll start.
	AI_Output(self,other,"DIA_Hokurn_StayHere_01_02");	//And I don't care as long as I have enough to drink.
};


instance DIA_HOKURN_WHEREDRAGON(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_wheredragon_condition;
	information = dia_hokurn_wheredragon_info;
	permanent = TRUE;
	description = "Do you know where the dragons are then?";
};


func int dia_hokurn_wheredragon_condition()
{
	if((HOKURNGETSDRINK == TRUE) && (HOKURNTELLSDRAGON == FALSE) && Npc_KnowsInfo(other,dia_hokurn_stayhere))
	{
		return TRUE;
	};
};

func void dia_hokurn_wheredragon_info()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_15_00");	//Do you know where the dragons are then?
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_01_01");	//What's in it for me, if I tell you?
	Info_ClearChoices(dia_hokurn_wheredragon);
	Info_AddChoice(dia_hokurn_wheredragon,"Nothing, I'm looking for them myself.",dia_hokurn_wheredragon_findmyself);
	Info_AddChoice(dia_hokurn_wheredragon,"I'd be willing to pay you for that information.",dia_hokurn_wheredragon_gold);
	if(Npc_HasItems(other,itfo_booze) >= 1)
	{
		Info_AddChoice(dia_hokurn_wheredragon,"I've still got a bottle of gin!",dia_hokurn_wheredragon_booze);
	};
};

func void dia_hokurn_wheredragon_findmyself()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_FindMyself_15_00");	//Nothing, I'm looking for them myself.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_FindMyself_01_01");	//You'd better watch out. You've got a hell of a fight in front of you.
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_gold()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Gold_15_00");	//I'd be willing to pay you for that information.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Gold_01_01");	//Pay me? Hmm. I'll give you the information for 200 gold pieces.
	Info_ClearChoices(dia_hokurn_wheredragon);
	Info_AddChoice(dia_hokurn_wheredragon,"Too much!",dia_hokurn_wheredragon_toomuch);
	if(Npc_HasItems(other,itmi_gold) >= 200)
	{
		Info_AddChoice(dia_hokurn_wheredragon,"Deal. Here's the money!",dia_hokurn_wheredragon_ok);
	};
};

func void dia_hokurn_wheredragon_toomuch()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_TooMuch_15_00");	//Too much!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_TooMuch_01_01");	//Then forget it.
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_ok()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_OK_15_00");	//Deal. Here's the money!
	b_giveinvitems(other,self,itmi_gold,200);
	HOKURNTELLSDRAGON = TRUE;
	Info_ClearChoices(dia_hokurn_wheredragon);
};

func void dia_hokurn_wheredragon_booze()
{
	AI_Output(other,self,"DIA_Hokurn_WhereDragon_Booze_15_00");	//I've still got a bottle of gin!
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_01");	//I'd fight every dragon in the world for a fine vintage.
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_02");	//Agreed. Give me the bottle!
	b_giveinvitems(other,self,itfo_booze,1);
	AI_Output(self,other,"DIA_Hokurn_WhereDragon_Booze_01_03");	//I'll keep that for a rainy day.
	HOKURNTELLSDRAGON = TRUE;
	Info_ClearChoices(dia_hokurn_wheredragon);
};


instance DIA_HOKURN_DRAGON(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_dragon_condition;
	information = dia_hokurn_dragon_info;
	permanent = TRUE;
	description = "All right, now, where are those dragons?";
};


func int dia_hokurn_dragon_condition()
{
	if(HOKURNTELLSDRAGON == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_dragon_info()
{
	AI_Output(other,self,"DIA_Hokurn_Dragon_15_00");	//All right, now, where are those dragons?
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_01");	//Naturally, I can't tell you anything precise, but I've heard that there are supposed to be four dragons.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_02");	//We've seen a red glow over the highest mountain at night.
	AI_Output(self,other,"DIA_Hokurn_Dragon_01_03");	//I swear by my mother, if you're looking for a dragon, then you'll definitely find one there.
};


instance DIA_HOKURN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 5;
	condition = dia_hokurn_alldragonsdead_condition;
	information = dia_hokurn_alldragonsdead_info;
	permanent = TRUE;
	description = "I've killed all the dragons.";
};


func int dia_hokurn_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_hokurn_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Hokurn_AllDragonsDead_15_00");	//I've killed all the dragons.
	AI_Output(self,other,"DIA_Hokurn_AllDragonsDead_01_01");	//Take a hike and tell your fairy tales to someone else.
};


instance DIA_HOKURN_PICKPOCKET(C_INFO)
{
	npc = djg_712_hokurn;
	nr = 900;
	condition = dia_hokurn_pickpocket_condition;
	information = dia_hokurn_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hokurn_pickpocket_condition()
{
	return c_beklauen(69,210);
};

func void dia_hokurn_pickpocket_info()
{
	Info_ClearChoices(dia_hokurn_pickpocket);
	Info_AddChoice(dia_hokurn_pickpocket,DIALOG_BACK,dia_hokurn_pickpocket_back);
	Info_AddChoice(dia_hokurn_pickpocket,DIALOG_PICKPOCKET,dia_hokurn_pickpocket_doit);
};

func void dia_hokurn_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hokurn_pickpocket);
};

func void dia_hokurn_pickpocket_back()
{
	Info_ClearChoices(dia_hokurn_pickpocket);
};

