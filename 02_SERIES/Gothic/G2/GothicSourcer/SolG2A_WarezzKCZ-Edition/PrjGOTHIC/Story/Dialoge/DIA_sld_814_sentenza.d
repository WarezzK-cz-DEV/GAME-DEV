
instance DIA_SENTENZA_EXIT(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 999;
	condition = dia_sentenza_exit_condition;
	information = dia_sentenza_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sentenza_exit_condition()
{
	return TRUE;
};

func void dia_sentenza_exit_info()
{
	AI_StopProcessInfos(self);
};


var int sentenza_wants50;
var int sentenza_searchday;

instance DIA_SENTENZA_HELLO(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_hello_condition;
	information = dia_sentenza_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_hello_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_sentenza_hello_info()
{
	AI_Output(self,other,"DIA_Sentenza_Hello_09_00");	//Where do you think you're going?!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"How would that be any concern of yours?",dia_sentenza_hello_notyourbusiness);
	Info_AddChoice(dia_sentenza_hello,"I wanted to have a look around, that's all.",dia_sentenza_hello_justlooking);
};

func void dia_sentenza_hello_justlooking()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_JustLooking_15_00");	//I wanted to have a look around, that's all.
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_01");	//(laughs) There's a heap of trouble here for men like you! Are you telling me you just want to look around?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_02");	//Ha! You're headed for the court! Why else would you have trudged all the way here, hm?
	AI_Output(self,other,"DIA_Sentenza_Hello_JustLooking_09_03");	//So don't give me any of that bullshit and let me search you, and you can go on your way.
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Just keep your fingers to yourself!",dia_sentenza_hello_handsoff);
	Info_AddChoice(dia_sentenza_hello,"Suit yourself. Search me, then!",dia_sentenza_hello_searchme);
};

func void dia_sentenza_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_NotYourBusiness_15_00");	//How would that be any concern of yours?
	AI_Output(self,other,"DIA_Sentenza_Hello_NotYourBusiness_09_01");	//(sighs) Then I'll have to explain it to you carefully.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_sentenza_searchme()
{
	var int playergold;
	playergold = Npc_HasItems(other,itmi_gold);
	AI_Output(other,self,"DIA_Sentenza_Hello_SearchMe_15_00");	//Suit yourself. Search me, then!
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_01");	//Now then, let's see what we have here...
	if(playergold >= 50)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_02");	//Ah! Gold! It can be very dangerous carrying so much gold around.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_03");	//A lot of mercenaries are real cutthroats. Not honest fellows, like me.
		b_giveinvitems(other,self,itmi_gold,50);
		SENTENZA_GOLDTAKEN = TRUE;
	}
	else if(playergold > 0)
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_04");	//Well, that isn't much that you have there.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_05");	//I'll come back to you later.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_06");	//You came all this way without any gold?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_07");	//It doesn't look to me like you're starving. You must have hidden the dough somewhere, right?
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_08");	//Anyway, you aren't stupid. I'm sure we'll meet again. Watch out for yourself until then.
		AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_09");	//You're probably the only one who knows where all your gold is!
	};
	SENTENZA_WANTS50 = TRUE;
	AI_Output(self,other,"DIA_Sentenza_Hello_SearchMe_09_10");	//I only want 50 gold pieces from you - that's the toll here. And you only need to pay once. That's fair, isn't it?
};

func void dia_sentenza_hello_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_hello_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_HandsOff_15_00");	//Just keep your fingers to yourself!
	AI_Output(self,other,"DIA_Sentenza_Hello_HandsOff_09_01");	//(threatening) Or what?
	Info_ClearChoices(dia_sentenza_hello);
	Info_AddChoice(dia_sentenza_hello,"Or nothing. Search me, then!",dia_sentenza_hello_searchme);
	Info_AddChoice(dia_sentenza_hello,"Or you won't be able to search anyone for quite a while!",dia_sentenza_hello_orelse);
};

func void dia_sentenza_hello_orelse()
{
	AI_Output(other,self,"DIA_Sentenza_Hello_OrElse_15_00");	//Or you won't be able to search anyone for quite a while!
	AI_Output(self,other,"DIA_Sentenza_Hello_OrElse_09_01");	//We'll see about that!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_VZWEI(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 2;
	condition = dia_sentenza_vzwei_condition;
	information = dia_sentenza_vzwei_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sentenza_vzwei_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (SENTENZA_GOLDTAKEN == FALSE) && (SENTENZA_SEARCHDAY < Wld_GetDay()))
	{
		return TRUE;
	};
};

func void dia_sentenza_vzwei_info()
{
	AI_Output(self,other,"DIA_Sentenza_Vzwei_09_00");	//Here you are again. Let's see what you have on you this time!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	SENTENZA_SEARCHDAY = b_getdayplus();
	Info_ClearChoices(dia_sentenza_vzwei);
	Info_AddChoice(dia_sentenza_vzwei,"Take your grubby paws off of me!",dia_sentenza_vzwei_handsoff);
	Info_AddChoice(dia_sentenza_vzwei,"Suit yourself. Search me, then!",dia_sentenza_vzwei_searchme);
};

func void dia_sentenza_vzwei_searchme()
{
	b_sentenza_searchme();
	AI_StopProcessInfos(self);
};

func void dia_sentenza_vzwei_handsoff()
{
	AI_Output(other,self,"DIA_Sentenza_Vzwei_HandsOff_15_00");	//Take your grubby paws off of me!
	AI_Output(self,other,"DIA_Sentenza_Vzwei_HandsOff_09_01");	//(menacing) So? Apparently you've got a bit more on you this time!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_WANNAJOIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 3;
	condition = dia_sentenza_wannajoin_condition;
	information = dia_sentenza_wannajoin_info;
	permanent = FALSE;
	description = "I have come to join you!";
};


func int dia_sentenza_wannajoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sentenza_wannajoin_info()
{
	AI_Output(other,self,"DIA_Sentenza_WannaJoin_15_00");	//I have come to join you!
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_01");	//Nice for you.
	AI_Output(self,other,"DIA_Sentenza_WannaJoin_09_02");	//(casual) Do you understand that the mercenaries are going to vote whether you get to join them or not?
};


instance DIA_SENTENZA_VOTE(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 4;
	condition = dia_sentenza_vote_condition;
	information = dia_sentenza_vote_info;
	permanent = TRUE;
	description = "Will you vote for me?";
};


func int dia_sentenza_vote_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_vote_info()
{
	AI_Output(other,self,"DIA_Sentenza_Vote_15_00");	//Will you vote for me?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_01");	//Just because you beat me? (laughs) No.
	}
	else if((Npc_HasItems(self,itmi_gold) >= 50) && ((SENTENZA_GOLDTAKEN == TRUE) || (SENTENZA_GOLDGIVEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_02");	//But then, why not? 50 gold pieces is a fair price for a vote, don't you think?
		SENTENZA_STIMME = TRUE;
		b_logentry(TOPIC_SLDRESPEKT,"Sentenza doesn't mind if I join the mercenaries.");
	}
	else if((SENTENZA_STIMME == TRUE) && (Npc_HasItems(self,itmi_gold) < 50))
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_03");	//After you took my gold away again? I don't think so, my boy.
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Vote_09_04");	//It doesn't work that way, boy! If I'm expected to vote for you, you're going to have to send some gold my way.
		AI_Output(other,self,"DIA_Sentenza_Vote_15_05");	//How much?
		AI_Output(self,other,"DIA_Sentenza_Vote_09_06");	//50 gold pieces. That's the toll you would have paid anyway.
		SENTENZA_WANTS50 = TRUE;
	};
};


var int sentenza_goldgiven;

instance DIA_SENTENZA_PAY50(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 5;
	condition = dia_sentenza_pay50_condition;
	information = dia_sentenza_pay50_info;
	permanent = TRUE;
	description = "Here's your 50 gold pieces.";
};


func int dia_sentenza_pay50_condition()
{
	if((SENTENZA_WANTS50 == TRUE) && (Npc_HasItems(self,itmi_gold) < 50) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_sentenza_pay50_info()
{
	AI_Output(other,self,"DIA_Sentenza_Pay50_15_00");	//Here's your 50 gold pieces.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_01");	//Well thanks, that'll do.
		SENTENZA_GOLDGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_Pay50_09_02");	//Don't mess with me. 50 and not one piece less, got it?
	};
};


var int sentenza_einmal;

instance DIA_SENTENZA_GOLDBACK(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 6;
	condition = dia_sentenza_goldback_condition;
	information = dia_sentenza_goldback_info;
	permanent = TRUE;
	description = "Gimme back my gold!";
};


func int dia_sentenza_goldback_condition()
{
	if(Npc_HasItems(self,itmi_gold) >= 50)
	{
		if((SENTENZA_GOLDGIVEN == FALSE) || (other.guild == GIL_SLD))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_goldback_info()
{
	AI_Output(other,self,"DIA_Sentenza_GoldBack_15_00");	//Gimme back my gold!
	if((other.guild == GIL_SLD) && (TORLOF_SENTENZACOUNTED == TRUE) && (SENTENZA_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_01");	//Now that I've given you my vote?
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_02");	//You rotten little beggar!
		SENTENZA_EINMAL = TRUE;
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Sentenza_GoldBack_09_03");	//Relax! I'll only keep an eye on it for a while...
	};
};


instance DIA_SENTENZA_AUFSMAUL(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 7;
	condition = dia_sentenza_aufsmaul_condition;
	information = dia_sentenza_aufsmaul_info;
	permanent = FALSE;
	description = "Say, is that a face you have at the front of your head, or is it a butt? ";
};


func int dia_sentenza_aufsmaul_condition()
{
	if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_sentenza_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaul_15_00");	//Say, is that a face you have at the front of your head, or is it a butt?
	AI_Output(self,other,"DIA_Sentenza_AufsMaul_09_01");	//(laughs angrily) Okay, that's the way you want it...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_AUFSMAULAGAIN(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 8;
	condition = dia_sentenza_aufsmaulagain_condition;
	information = dia_sentenza_aufsmaulagain_info;
	permanent = TRUE;
	description = "It's thrashing time once again!";
};


func int dia_sentenza_aufsmaulagain_condition()
{
	if(Npc_KnowsInfo(other,dia_sentenza_aufsmaul) && (MIS_READYFORCHAPTER4 == FALSE))
	{
		if((Npc_HasItems(self,itmi_gold) >= 50) || Npc_KnowsInfo(other,dia_jarvis_missionko))
		{
			return TRUE;
		};
	};
};

func void dia_sentenza_aufsmaulagain_info()
{
	AI_Output(other,self,"DIA_Sentenza_AufsMaulAgain_15_00");	//It's thrashing time once again!
	AI_Output(self,other,"DIA_Sentenza_AufsMaulAgain_09_01");	//If you say so...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SENTENZA_PERM(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 1;
	condition = dia_sentenza_perm_condition;
	information = dia_sentenza_perm_info;
	permanent = TRUE;
	description = "And, how are things?";
};


func int dia_sentenza_perm_condition()
{
	return TRUE;
};

func void dia_sentenza_perm_info()
{
	AI_Output(other,self,"DIA_Sentenza_PERM_15_00");	//And, how are things?
	AI_Output(self,other,"DIA_Sentenza_PERM_09_01");	//Not many people come this way, but up to now every one of them has paid my toll.
	if(Npc_HasItems(self,itmi_gold) < 50)
	{
		AI_Output(self,other,"DIA_Sentenza_PERM_09_02");	//Except you. (grins)
	};
};


instance DIA_SENTENZA_PICKPOCKET(C_INFO)
{
	npc = sld_814_sentenza;
	nr = 900;
	condition = dia_sentenza_pickpocket_condition;
	information = dia_sentenza_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_sentenza_pickpocket_condition()
{
	return c_beklauen(56,65);
};

func void dia_sentenza_pickpocket_info()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_BACK,dia_sentenza_pickpocket_back);
	Info_AddChoice(dia_sentenza_pickpocket,DIALOG_PICKPOCKET,dia_sentenza_pickpocket_doit);
};

func void dia_sentenza_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sentenza_pickpocket);
};

func void dia_sentenza_pickpocket_back()
{
	Info_ClearChoices(dia_sentenza_pickpocket);
};

