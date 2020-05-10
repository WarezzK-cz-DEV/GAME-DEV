
instance DIA_ONAR_EXIT(C_INFO)
{
	npc = bau_900_onar;
	nr = 999;
	condition = dia_onar_exit_condition;
	information = dia_onar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_onar_exit_condition()
{
	return TRUE;
};

func void dia_onar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ONAR_HALLO(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_hallo_condition;
	information = dia_onar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_onar_hallo_condition()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_onar_hallo_info()
{
	AI_Output(self,other,"DIA_Onar_Hallo_14_00");	//Who let you in here?!
	AI_Output(self,other,"DIA_Onar_Hallo_14_01");	//What are you doing here on my farm?!
};


instance DIA_ONAR_PERM(C_INFO)
{
	npc = bau_900_onar;
	nr = 1;
	condition = dia_onar_perm_condition;
	information = dia_onar_perm_info;
	permanent = TRUE;
	description = "Everything all right here on the farm?";
};


func int dia_onar_perm_condition()
{
	return TRUE;
};

func void dia_onar_perm_info()
{
	AI_Output(other,self,"DIA_Onar_PERM_15_00");	//Everything all right here on the farm?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_01");	//I don't see how that's any of your business. You don't belong on the farm!
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_02");	//I certainly hope so! That's what I'm paying you for after all!
		AI_Output(self,other,"DIA_Onar_PERM_14_03");	//You had better go to Torlof and ask him if he has work for you.
	};
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_04");	//Yeah, sure. You just go and hunt your dragons.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_05");	//You sanctimonious bastards from the monastery aren't welcome here!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Onar_PERM_14_06");	//Our hospitality does not extend to the troops of the king.
	};
};


instance DIA_ONAR_WORK(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_work_condition;
	information = dia_onar_work_info;
	permanent = FALSE;
	description = "I want to work for you!";
};


func int dia_onar_work_condition()
{
	if(LEE_SENDTOONAR == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_work_info()
{
	AI_Output(other,self,"DIA_Onar_Work_15_00");	//I want to work for you!
	AI_Output(self,other,"DIA_Onar_Work_14_01");	//I don't need a farmhand right now.
	AI_Output(self,other,"DIA_Onar_Work_14_02");	//My people see to everything else.
	AI_Output(self,other,"DIA_Onar_Work_14_03");	//You have no business here in the house, so get out!
};


instance DIA_ONAR_WORKASSLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 2;
	condition = dia_onar_workassld_condition;
	information = dia_onar_workassld_info;
	permanent = FALSE;
	description = "I want to work here as a mercenary!";
};


func int dia_onar_workassld_condition()
{
	if((LEE_SENDTOONAR == FALSE) && (ONAR_WEGENSLDWERDEN == FALSE) && Npc_KnowsInfo(other,dia_onar_work))
	{
		return TRUE;
	};
};

func void dia_onar_workassld_info()
{
	AI_Output(other,self,"DIA_Onar_WorkAsSld_15_00");	//I want to work here as a mercenary!
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_01");	//You? A mercenary? Don't make me laugh! If you were any good as a mercenary, Lee would have told me about you.
	AI_Output(self,other,"DIA_Onar_WorkAsSld_14_02");	//Now get yourself out of here, pronto!
	ONAR_WEGENSLDWERDEN = TRUE;
};


instance DIA_ONAR_AUFSTAND(C_INFO)
{
	npc = bau_900_onar;
	nr = 3;
	condition = dia_onar_aufstand_condition;
	information = dia_onar_aufstand_info;
	permanent = FALSE;
	description = "You're revolting against the city, or so I've heard.";
};


func int dia_onar_aufstand_condition()
{
	return TRUE;
};

func void dia_onar_aufstand_info()
{
	AI_Output(other,self,"DIA_Onar_Aufstand_15_00");	//You're revolting against the city, or so I've heard?
	AI_Output(self,other,"DIA_Onar_Aufstand_14_01");	//Now listen up. I inherited this farm and this land from my father.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_02");	//And he inherited it from HIS father.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_03");	//I'm not going to allow that greedy imbecile of a king to make off with all that just in order to feed his useless armies.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_04");	//The war with the orcs has been going on forever. And where do we stand? On the edge of defeat.
	AI_Output(self,other,"DIA_Onar_Aufstand_14_05");	//No - I prefer to defend my farm myself! The money that I save this way can pay for my own army.
};


instance DIA_ONAR_WEGENPEPE(C_INFO)
{
	npc = bau_900_onar;
	nr = 4;
	condition = dia_onar_wegenpepe_condition;
	information = dia_onar_wegenpepe_info;
	permanent = FALSE;
	description = "Thanks to Bullco, you now have a few sheep less.";
};


func int dia_onar_wegenpepe_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_onar_wegenpepe_info()
{
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_00");	//Thanks to Bullco, you now have a few sheep less.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_01");	//What are you talking about? Who is Bullco?
	AI_Output(other,self,"DIA_Onar_WegenPepe_15_02");	//One of the mercenaries.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_03");	//How would that interest me? If he's been after my sheep, he'll have to answer to Lee.
	AI_Output(self,other,"DIA_Onar_WegenPepe_14_04");	//So why are you bugging me with such trivial details?
	ONAR_WEGENPEPE = TRUE;
};


instance DIA_ONAR_WEGENSEKOB(C_INFO)
{
	npc = bau_900_onar;
	nr = 5;
	condition = dia_onar_wegensekob_condition;
	information = dia_onar_wegensekob_info;
	permanent = FALSE;
	description = "I've come about Sekob's rent...";
};


func int dia_onar_wegensekob_condition()
{
	if(MIS_SEKOB_REDEMITONAR == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_onar_wegensekob_info()
{
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_00");	//I've come about Sekob's rent...
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_01");	//What the hell do you want here? Take the money to Torlof.
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_WegenSekob_14_02");	//How the devil would that be YOUR business?
		AI_Output(other,self,"DIA_Onar_WegenSekob_15_03");	//I want to become a mercenary. Collecting the rent is my test.
		ONAR_WEGENSLDWERDEN = TRUE;
	};
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_04");	//But Sekob has no money. I even beat him up.
	AI_Output(other,self,"DIA_Onar_WegenSekob_15_05");	//He said it was because of the poor harvest...
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_06");	//(yelling) You nitwit! Did you think he just carries that money around? He's hidden it somewhere!
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_07");	//Do you know how much rain we have here? Bad harvest my ass.
	AI_Output(self,other,"DIA_Onar_WegenSekob_14_08");	//Go and beat that money out of him somehow.
	ONAR_WEGENSEKOB = TRUE;
};


instance DIA_ONAR_LEESENTME(C_INFO)
{
	npc = bau_900_onar;
	nr = 6;
	condition = dia_onar_leesentme_condition;
	information = dia_onar_leesentme_info;
	permanent = FALSE;
	description = "Lee sent me. I want to work here as a mercenary!";
};


func int dia_onar_leesentme_condition()
{
	if((LEE_SENDTOONAR == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_onar_leesentme_info()
{
	AI_Output(other,self,"DIA_Onar_LeeSentMe_15_00");	//Lee sent me. I want to work here as a mercenary!
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_01");	//He has already talked to me.
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_02");	//I already didn't think much of you the first time you asked me.
		AI_Output(self,other,"DIA_Onar_LeeSentMe_14_03");	//But if Lee thinks you'll do, then I'm willing to give you a chance.
	};
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_04");	//He's the one responsible for you. So, suit yourself.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_05");	//But no fooling around here! Leave the farmers and the maids alone and, above all, don't nab anything, capisce?
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_06");	//For everything else, talk to Lee.
	AI_Output(self,other,"DIA_Onar_LeeSentMe_14_07");	//All WE need to discuss now is your pay.
	ONAR_APPROVED = TRUE;
	b_logentry(TOPIC_BECOMESLD,"Onar has given me his approval. Now nothing can stop me joining the mercenaries.");
};


var int onar_sold_day;
var int onar_sold_xp;

instance DIA_ONAR_HOWMUCH(C_INFO)
{
	npc = bau_900_onar;
	nr = 7;
	condition = dia_onar_howmuch_condition;
	information = dia_onar_howmuch_info;
	permanent = FALSE;
	description = "So how about my pay?";
};


func int dia_onar_howmuch_condition()
{
	if(ONAR_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_howmuch_info()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_15_00");	//So how about my pay?
	AI_Output(self,other,"DIA_Onar_HowMuch_14_01");	//Well, let's see...
	SOLD = 50;
	if(ONAR_WEGENSLDWERDEN == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_02");	//I don't think too much of you.
	};
	if(ONAR_WEGENSEKOB == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_03");	//You're not the sharpest knife in the drawer. That's obvious from that thing with Sekob.
		SOLD = SOLD - 10;
	};
	if((ABSOLUTIONLEVEL_FARM > 1) || ((b_getgreatestpetzcrime(self) > CRIME_NONE) && (ABSOLUTIONLEVEL_FARM > 0)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_04");	//You've already caused trouble here on the farm more than once.
		SOLD = SOLD - 10;
	};
	if((ONAR_WEGENPEPE == TRUE) && ((ONAR_WEGENSEKOB == TRUE) || (ONAR_WEGENSLDWERDEN == TRUE)))
	{
		AI_Output(self,other,"DIA_Onar_HowMuch_14_05");	//And you're constantly after me with all kinds of bullshit.
		SOLD = SOLD - 10;
	};
	AI_Output(self,other,"DIA_Onar_HowMuch_14_06");	//Let me think...
	b_say_gold(self,other,SOLD);
	ONAR_SOLD_DAY = Wld_GetDay();
	ONAR_SOLD_XP = other.exp;
	AI_Output(self,other,"DIA_Onar_HowMuch_14_07");	//What do you say?
	Info_ClearChoices(dia_onar_howmuch);
	Info_AddChoice(dia_onar_howmuch,"Sounds all right!",dia_onar_howmuch_ok);
	Info_AddChoice(dia_onar_howmuch,"That's not a whole lot...",dia_onar_howmuch_more);
	Info_AddChoice(dia_onar_howmuch,"Per day?",dia_onar_howmuch_perday);
};

func void dia_onar_howmuch_perday()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_PerDay_15_00");	//Per day?
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_01");	//What did you think? Per week? You're really none too bright.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_02");	//So move your butt over here and come get your money.
	AI_Output(self,other,"DIA_Onar_HowMuch_PerDay_14_03");	//I'm not going to carry it after you.
};

func void dia_onar_howmuch_more()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_More_15_00");	//That's not a whole lot...
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_01");	//Of course, you're welcome to work for me for free instead.
	AI_Output(self,other,"DIA_Onar_HowMuch_More_14_02");	//Anyway, this is all you'll get!
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"I can collect my pay from Onar every day.");
	Info_ClearChoices(dia_onar_howmuch);
};

func void dia_onar_howmuch_ok()
{
	AI_Output(other,self,"DIA_Onar_HowMuch_Ok_15_00");	//Sounds all right!
	AI_Output(self,other,"DIA_Onar_HowMuch_Ok_14_01");	//I think so too. Now go see Lee.
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"I can collect my pay from Onar every day.");
	Info_ClearChoices(dia_onar_howmuch);
};


instance DIA_ONAR_COLLECTGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 8;
	condition = dia_onar_collectgold_condition;
	information = dia_onar_collectgold_info;
	permanent = TRUE;
	description = "Pay me my wages!";
};


func int dia_onar_collectgold_condition()
{
	if(Npc_KnowsInfo(other,dia_onar_howmuch) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_onar_collectgold_info()
{
	AI_Output(other,self,"DIA_Onar_CollectGold_15_00");	//Pay me my wages!
	if(other.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_01");	//I pay for mercenaries, not Dragon hunters.
	}
	else if(TORLOF_THEOTHERMISSION_TOOLATE == TRUE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_02");	//You don't take care of the assignments given to you!
		AI_Output(self,other,"DIA_Onar_CollectGold_14_03");	//I have asked Torlof how you're doing. And he says that it takes you forever to complete a job.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_04");	//I don't waste money on layabouts.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_05");	//You'll go a few weeks without pay for now! Maybe you'll learn your lesson then.
	}
	else if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_06");	//I've heard that you messed up. First go to Lee and settle the matter.
	}
	else if(Wld_GetDay() <= ONAR_SOLD_DAY)
	{
		AI_Output(self,other,"DIA_Onar_CollectGold_14_07");	//Are you out of your mind?
		AI_Output(self,other,"DIA_Onar_CollectGold_14_08");	//First work for me for a day. You'll get your next pay tomorrow then.
	}
	else if((Wld_GetDay() - 2) >= ONAR_SOLD_DAY)
	{
		if((Wld_GetDay() - 2) == ONAR_SOLD_DAY)
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_09");	//Where were you yesterday?
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_10");	//Where have you been for the last couple of days?
		};
		AI_Output(self,other,"DIA_Onar_CollectGold_14_11");	//You never showed up here.
		AI_Output(self,other,"DIA_Onar_CollectGold_14_12");	//Who knows where you've been hanging out.
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	}
	else
	{
		if(other.exp > (ONAR_SOLD_XP + 200))
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_13");	//(contritely) Oh well. Here's your pay.
			b_giveinvitems(self,other,itmi_gold,SOLD);
			b_say_gold(self,other,SOLD);
		}
		else
		{
			AI_Output(self,other,"DIA_Onar_CollectGold_14_14");	//What? You've done nothing but hang around all day when you didn't sleep!
			AI_Output(self,other,"DIA_Onar_CollectGold_14_15");	//I'm not paying you for that!
		};
		ONAR_SOLD_DAY = Wld_GetDay();
		ONAR_SOLD_XP = other.exp;
	};
};


instance DIA_ONAR_MARIAGOLD(C_INFO)
{
	npc = bau_900_onar;
	nr = 9;
	condition = dia_onar_mariagold_condition;
	information = dia_onar_mariagold_info;
	permanent = FALSE;
	description = "Maria thinks I'm not getting enough.";
};


func int dia_onar_mariagold_condition()
{
	if(MARIA_MEHRGOLD == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_mariagold_info()
{
	AI_Output(other,self,"DIA_Onar_MariaGold_15_00");	//Maria thinks that I'm not getting enough.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_01");	//What?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_02");	//She said you should pay me better.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_03");	//(griping) That woman has to stick her nose into everything.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_04");	//Did she say how much?
	AI_Output(other,self,"DIA_Onar_MariaGold_15_05");	//No.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_06");	//All right, beginning with your next pay you'll get an extra 10 gold pieces.
	AI_Output(self,other,"DIA_Onar_MariaGold_14_07");	//But not a coin more, understood?
	SOLD = SOLD + 10;
};


var int onar_sellsheep;

instance DIA_ONAR_WANNASHEEP(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_wannasheep_condition;
	information = dia_onar_wannasheep_info;
	permanent = TRUE;
	description = "I want to buy a sheep!";
};


func int dia_onar_wannasheep_condition()
{
	if(ONAR_SELLSHEEP == FALSE)
	{
		return TRUE;
	};
};

func void dia_onar_wannasheep_info()
{
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_00");	//I want to buy a sheep!
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_01");	//What are you doing here then? See a sheep anywhere?
	AI_Output(other,self,"DIA_Onar_WannaSheep_15_02");	//I...
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_03");	//If you want to buy a sheep, go out the pasture. It's to the right of my house.
	AI_Output(self,other,"DIA_Onar_WannaSheep_14_04");	//Have Pepe sell you one.
	if(Npc_IsDead(pepe))
	{
		AI_Output(other,self,"DIA_Onar_WannaSheep_15_05");	//Pepe is dead, I'm afraid.
		AI_Output(self,other,"DIA_Onar_WannaSheep_14_06");	//Oh! In that case... leave 200 gold pieces here with me, and go get yourself a sheep from the pasture.
		ONAR_SELLSHEEP = TRUE;
	};
};


instance DIA_ONAR_BUYLIESEL(C_INFO)
{
	npc = bau_900_onar;
	nr = 10;
	condition = dia_onar_buyliesel_condition;
	information = dia_onar_buyliesel_info;
	permanent = TRUE;
	description = "Here you are, 200 gold pieces. Give me a sheep.";
};


func int dia_onar_buyliesel_condition()
{
	if(ONAR_SELLSHEEP == TRUE)
	{
		return TRUE;
	};
};

func void dia_onar_buyliesel_info()
{
	AI_Output(other,self,"DIA_Onar_BuyLiesel_15_00");	//Here you are, 200 gold pieces. Give me a sheep.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_01");	//You can get yourself one from the pasture.
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_02");	//One or the other of those sheep is bound to follow you. Most of them answer to the name of Betsy.
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Onar_BuyLiesel_14_03");	//You don't even have that much gold. Don't waste my precious time.
	};
};

