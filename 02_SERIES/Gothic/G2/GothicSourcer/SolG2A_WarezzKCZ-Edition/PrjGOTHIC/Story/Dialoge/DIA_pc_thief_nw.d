
instance DIA_DIEGONW_EXIT(C_INFO)
{
	npc = pc_thief_nw;
	nr = 999;
	condition = dia_diegonw_exit_condition;
	information = dia_diegonw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegonw_exit_condition()
{
	return TRUE;
};

func void dia_diegonw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGONW_PERM(C_INFO)
{
	npc = pc_thief_nw;
	nr = 998;
	condition = dia_diegonw_perm_condition;
	information = dia_diegonw_perm_info;
	permanent = TRUE;
	description = "How's business?";
};


func int dia_diegonw_perm_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (KAPITEL > 3))
	{
		return TRUE;
	};
};

func void dia_diegonw_perm_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_00");	//How's business?
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_01");	//Lousy. Somebody should have told me that Khorinis has gone to the dogs in the meantime.
	AI_Output(other,self,"DIA_DiegoNW_Perm_15_02");	//No idea. I've only known the city like this.
	AI_Output(self,other,"DIA_DiegoNW_Perm_11_03");	//You should have seen it a few years ago. You would have liked it then.
};


instance DIA_DIEGONW_NEEDHELP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 1;
	condition = dia_diegonw_needhelp_condition;
	information = dia_diegonw_needhelp_info;
	important = TRUE;
};


func int dia_diegonw_needhelp_condition()
{
	if(DIEGO_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_diegonw_needhelp_info()
{
	if(DIEGO_ISDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_01");	//Hey, you look completely flabbergasted!
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_02");	//(laughs) You thought I had bought it, didn't you?
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_03");	//I was unconscious for quite some time. But, as you can see, I'm still alive.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_04");	//The most important thing is that we're both here now.
		AI_Output(self,other,"DIA_Addon_DiegoNW_NeedHelp_11_05");	//You've got to help me.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_NeedHelp_11_00");	//Good thing you're here. You need to help me.
	};
	Info_ClearChoices(dia_diegonw_needhelp);
	if(!Npc_KnowsInfo(other,dia_diegoow_hallo))
	{
		Info_AddChoice(dia_diegonw_needhelp,"Who are you?",dia_diegonw_needhelp_whoareyou);
	};
	Info_AddChoice(dia_diegonw_needhelp,"What kind of clothes are these?",dia_diegonw_needhelp_clothes);
	Info_AddChoice(dia_diegonw_needhelp,"What are you doing here?",dia_diegonw_needhelp_plan);
	Info_AddChoice(dia_diegonw_needhelp,"What's this about?",dia_diegonw_needhelp_problem);
};

func void dia_diegonw_needhelp_plan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Plan_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_01");	//I've been observing the guards. They're constantly on their toes.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Plan_11_02");	//I don't think it will be easy for me to get through there.
};

func void dia_diegonw_needhelp_whoareyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_00");	//Who are you?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_01");	//I'm sure it's just my clothes. The guards won't let me into town.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_02");	//That's why I bought these togs from a trader outside of town. Now I hope you'll remember me. I am Diego.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_03");	//Back in the slammer, I taught you everything you needed to know to survive.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_04");	//You can't just have forgotten all that.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_WhoAreYou_15_05");	//Er... what exactly happened back then?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_06");	//Holy shit, you really don't remember a thing.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_07");	//Listen I really don't have time to explain everything to you now. Only this much: we used to be damn good friends, and I saved your life more than once.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_WhoAreYou_11_08");	//And now I need your help.
};

func void dia_diegonw_needhelp_clothes()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_00");	//What kind of clothes are these?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_01");	//I bought them from a trader outside of town. The guards wouldn't let me in at first.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_02");	//Also, there's no need to let the whole world know where I come from.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Clothes_15_03");	//You've got a point there.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_04");	//That's the way I see it. But even though I have doffed my Shadow garb, I'm still who I always was.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Clothes_11_05");	//And I have big plans for this city.
};

func void dia_diegonw_needhelp_problem()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_00");	//What is this about?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_01");	//A lot of things have changed since I left here. I have to get back on my feet somehow.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_02");	//What's the problem?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_03");	//I have to get into the upper quarter.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_04");	//But I'm not a citizen of the town, and I don't have enough money to bribe the guards. That's where you come in!
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_15_05");	//So you want me to lend you some gold?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_06");	//Nonsense. I've got some gold - a whole lot of gold, even! Unfortunately, I don't have it with me.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_11_07");	//You need to go fetch my gold for me.
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"I've got no time for that.",dia_diegonw_needhelp_problem_notime);
	Info_AddChoice(dia_diegonw_needhelp,"What's in it for me?",dia_diegonw_needhelp_problem_reward);
	Info_AddChoice(dia_diegonw_needhelp,"OK, I'll help you.",dia_diegonw_needhelp_problem_willhelpyou);
};

func void dia_diegonw_needhelp_problem_notime()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_00");	//I've got no time for that.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_01");	//Hey, I thought we were buddies! It was me, after all, who saved your butt back when they tossed you into the colony.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_NoTime_15_02");	//You're exaggerating.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_03");	//Am I, really? Then think for a minute about what would have happened if I hadn't explained to you back then how to behave.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_NoTime_11_04");	//The ore barons would have had you for breakfast, and you would have died miserably down in the mine.
	MIS_HELPDIEGONW = LOG_FAILED;
	Info_ClearChoices(dia_diegonw_needhelp);
};

func void dia_diegonw_needhelp_problem_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_Reward_15_00");	//What's in it for me?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_Reward_11_01");	//Have I ever asked you what you could give me in return? We are friends, shouldn't that be enough?
};

func void dia_diegonw_needhelp_problem_willhelpyou()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_15_00");	//OK, I'll help you.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_01");	//Well. Listen. Back when the Barrier was still in place, I hid a small treasure.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_02");	//It's been quite a while. That's why I forgot to take it with me.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_11_03");	//And I can't leave here at all at the moment.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_11_03");	//To cut a long story short, you must go to the Valley of Mines for me and fetch my gold.
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Diego's gold is in the Valley of Mines. He needs it to get to the upper quarter and has sent me to get it.");
	Info_ClearChoices(dia_diegonw_needhelp);
	Info_AddChoice(dia_diegonw_needhelp,"What are you planning to do with the gold?",dia_diegonw_needhelp_problem_willhelpyou_yourplan);
	Info_AddChoice(dia_diegonw_needhelp,"Where did you get all that gold?",dia_diegonw_needhelp_problem_willhelpyou_howgold);
	Info_AddChoice(dia_diegonw_needhelp,"Where's the gold hidden?",dia_diegonw_needhelp_problem_willhelpyou_wheregold);
};

func void dia_diegonw_needhelp_problem_willhelpyou_yourplan()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_15_00");	//What are you planning to do with the gold?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_01");	//I still have an account to settle with one of the merchants in the upper quarter. I need to take care of that.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_YourPlan_11_02");	//And then I'll be all set for a new career!
};

func void dia_diegonw_needhelp_problem_willhelpyou_howgold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_15_00");	//Where did you get all that gold?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_01");	//Am I the only one, then, who put some gold aside for himself in the Valley of Mines?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_HowGold_11_02");	//Filching a few nuggets was a piece of cake. Just in case we ever got out of there.
	AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_HowGold_11_03");	//Everybody was so keen on that ore that no-one even cared for gold at the time...
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_00");	//Where's the gold hidden?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_01");	//Directly at the trading square. Above the abandoned mine. It's in a leather satchel.
	if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_01");	//Spare yourself that comment. I know myself that we must have walked right past it.
		AI_Output(self,other,"DIA_Addon_DiegoNW_WillHelpYou_WhereGold_11_02");	//Just bring me the bag.
	};
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_02");	//But don't forget to check that it's the right one so you don't walk all that way for nothing.
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_15_03");	//How can I recognize it?
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_WillHelpYou_WhereGold_11_04");	//It's full of gold. A whole lot of gold!
	Info_AddChoice(dia_diegonw_needhelp,"I will try to find your gold.",dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit);
	b_logentry(TOPIC_HELPDIEGONW,"Diego's gold is somewhere at the old trading square, where goods used to be sent into the colony by cable railway, above the abandoned mine.");
};

func void dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit()
{
	AI_Output(other,self,"DIA_DiegoNW_NeedHelp_Problem_TryIt_15_00");	//I will try to find your gold.
	AI_Output(self,other,"DIA_DiegoNW_NeedHelp_Problem_TryIt_11_01");	//(grins) Just do it. That's enough for me.
	Info_ClearChoices(dia_diegonw_needhelp);
};


instance DIA_DIEGONW_HELPYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_helpyou_condition;
	information = dia_diegonw_helpyou_info;
	permanent = FALSE;
	description = "OK, I'll help you after all.";
};


func int dia_diegonw_helpyou_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_HELPDIEGONW == LOG_FAILED) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_helpyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_00");	//OK, I'll help you after all.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_01");	//I knew it.
	AI_Output(other,self,"DIA_DiegoNW_HelpYou_15_02");	//OK, let's get straight down to business.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_03");	//All right. I have hidden a treasure in the Valley of Mines, and you are to go and get it for me.
	AI_Output(self,other,"DIA_DiegoNW_HelpYou_11_06");	//I'll stay here in the meantime and prepare everything.
	dia_diegonw_needhelp_problem_willhelpyou_wheregold();
	dia_diegonw_needhelp_problem_willhelpyou_wheregold_end_tryit();
	MIS_HELPDIEGONW = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HELPDIEGONW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HELPDIEGONW,LOG_RUNNING);
	b_logentry(TOPIC_HELPDIEGONW,"Diego's gold is in the Valley of Mines. He needs it to get to the upper quarter and has sent me to get it.");
};


instance DIA_DIEGONW_HAVEYOURGOLD(C_INFO)
{
	npc = pc_thief_nw;
	nr = 31;
	condition = dia_diegonw_haveyourgold_condition;
	information = dia_diegonw_haveyourgold_info;
	permanent = TRUE;
	description = "I found your gold!";
};


func int dia_diegonw_haveyourgold_condition()
{
	if(((OPENEDDIEGOSBAG == TRUE) || (Npc_HasItems(other,itse_diegostreasure_mis) >= 1)) && (MIS_HELPDIEGONW == LOG_RUNNING) && (DIEGO_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void b_diegonw_diegosrevenge()
{
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_05");	//Very good. Gerbrandt had better watch out now.
};


var int diegosrevenge;

func void dia_diegonw_haveyourgold_info()
{
	AI_Output(other,self,"DIA_DiegoNW_HaveYourGold_15_00");	//I found your gold!
	AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_01");	//Great. Show me.
	if(Npc_HasItems(other,itse_diegostreasure_mis) >= 1)
	{
		b_giveinvitems(other,self,itse_diegostreasure_mis,1);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	}
	else if(Npc_HasItems(other,itmi_gold) < DIEGOSTREASURE)
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_02");	//But that's not all of it! Don't you trust me? I need the entire sum.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_03");	//If my plan works out, there will be enough left over for you.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_04");	//So make sure that I get the whole amount. It's important!
	}
	else
	{
		b_giveinvitems(other,self,itmi_gold,DIEGOSTREASURE);
		b_diegonw_diegosrevenge();
		DIEGOSREVENGE = TRUE;
	};
	if((Npc_IsDead(gerbrandt) == FALSE) && (DIEGOSREVENGE == TRUE))
	{
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_06");	//Listen, I still need to take care of the guards.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_07");	//I want you to take this letter to Gerbrandt. He is one of the fat merchants in the upper quarter.
		AI_Output(self,other,"DIA_DiegoNW_HaveYourGold_11_08");	//Give him my regards. I'll meet you in front of Gerbrandt's house, then.
		CreateInvItems(self,itwr_diegosletter_mis,1);
		b_giveinvitems(self,other,itwr_diegosletter_mis,1);
		b_startotherroutine(gerbrandt,"WaitForDiego");
		b_startotherroutine(diegonw,"PreGerbrandt");
		MIS_HELPDIEGONW = LOG_SUCCESS;
		MIS_DIEGOSRESIDENCE = LOG_RUNNING;
		b_giveplayerxp(XP_HELPDIEGONW);
		Log_CreateTopic(TOPIC_DIEGOSRESIDENCE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DIEGOSRESIDENCE,LOG_RUNNING);
		b_logentry(TOPIC_DIEGOSRESIDENCE,"Diego gave me a letter for the merchant Gerbrandt.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_DIEGONW_DELIVEREDLETTER(C_INFO)
{
	npc = pc_thief_nw;
	nr = 30;
	condition = dia_diegonw_deliveredletter_condition;
	information = dia_diegonw_deliveredletter_info;
	permanent = FALSE;
	description = "I delivered the letter.";
};


func int dia_diegonw_deliveredletter_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (MIS_DIEGOSRESIDENCE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_diegonw_deliveredletter_info()
{
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_00");	//I delivered the letter.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_01");	//Very good. How did Gerbrandt take it?
	AI_Output(other,self,"DIA_DiegoNW_DeliveredLetter_15_02");	//He was rather shocked and made himself scarce right away.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_03");	//(satisfied) I should think so.
	AI_Output(self,other,"DIA_DiegoNW_DeliveredLetter_11_04");	//I'm afraid that, first of all, I need to attend to furnishing my new house. If I remember correctly, Gerbrandt's taste is horrible.
	b_giveplayerxp(XP_DIEGOHASANEWHOME);
	Wld_AssignRoomToGuild("reich01",GIL_PUBLIC);
	b_startotherroutine(gerbrandt,"NEWLIFE");
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,"So how did you pull this off?",dia_diegonw_deliveredletter_yourtrick);
	Info_AddChoice(dia_diegonw_deliveredletter,"The house is yours, then?",dia_diegonw_deliveredletter_yourhouse);
};

func void dia_diegonw_deliveredletter_gerbrandt()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_15_00");	//What about Gerbrandt?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_01");	//He has enjoyed the good life for far too long.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_02");	//He was living here, in the lap of luxury, while I was forcing down meatbug stew.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_03");	//I have no idea where he went from here, but he'll never get a foothold in Khorinis again - I'll see to that.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_Gerbrandt_11_04");	//If you're looking for him, you should try the harbor district.
};

func void dia_diegonw_deliveredletter_yourhouse()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_00");	//The house is yours, then?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_01");	//Yes, from cellar to attic, with all the furnishings.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_02");	//Having spent several years in less-than-befitting quarters, I'm looking forward to sleeping in a soft four-poster bed.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_03");	//And then, for breakfast, I'll have a fine wine and some excellent ham.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourHouse_15_04");	//You don't miss any chances, do you?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourHouse_11_05");	//You betcha.
};

func void dia_diegonw_deliveredletter_yourtrick()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_00");	//So how did you pull this off?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_01");	//Did you think that Gerbrandt came by his fortune through honest business?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_02");	//Of course he never got his fingers dirty when it came to really shady deals. He had a helper for that.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_03");	//Of course, I caught on to a lot back then. Gerbrandt finally got rid of me. He was probably afraid that I knew too much.
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_15_04");	//You never told me about that.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_11_05");	//You never asked me.
	Info_ClearChoices(dia_diegonw_deliveredletter);
	Info_AddChoice(dia_diegonw_deliveredletter,DIALOG_BACK,dia_diegonw_deliveredletter_yourtrick_back);
	Info_AddChoice(dia_diegonw_deliveredletter,"What about my share?",dia_diegonw_deliveredletter_yourtrick_reward);
	Info_AddChoice(dia_diegonw_deliveredletter,"What about Gerbrandt?",dia_diegonw_deliveredletter_gerbrandt);
};

func void dia_diegonw_deliveredletter_yourtrick_reward()
{
	AI_Output(other,self,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_15_00");	//What about my share?
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_01");	//Looks like you haven't forgotten everything I've taught you after all.
	AI_Output(self,other,"DIA_DiegoNW_TalkedToJudge_YourTrick_REWARD_11_02");	//But you're right, I couldn't have done it without you. Here's your share.
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
};

func void dia_diegonw_deliveredletter_yourtrick_back()
{
	Info_ClearChoices(dia_diegonw_deliveredletter);
};


var int diego_teach;

instance DIA_DIEGONW_CANYOUTEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_canyouteach_condition;
	information = dia_diegonw_canyouteach_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_diegonw_canyouteach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_canyouteach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_CanYouTeach_15_00");	//Can you teach me something?
	if(Npc_KnowsInfo(other,dia_diegonw_deliveredletter))
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_01");	//Yeah, sure. Just let me know when you're ready.
		DIEGO_TEACH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoNW_CanYouTeach_11_02");	//I have to attend to my business first.
	};
};


var int diegonw_merke_dex;
var int diegonw_merke_str;

instance DIA_DIEGONW_TEACH(C_INFO)
{
	npc = pc_thief_nw;
	nr = 995;
	condition = dia_diegonw_teach_condition;
	information = dia_diegonw_teach_info;
	permanent = TRUE;
	description = "Teach me something.";
};


func int dia_diegonw_teach_condition()
{
	if((DIEGO_ISONBOARD == FALSE) && (DIEGO_TEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_diegonw_teach_info()
{
	AI_Output(other,self,"DIA_DiegoNW_Teach_15_00");	//Teach me.
	AI_Output(self,other,"DIA_DiegoNW_Teach_11_01");	//I can teach you to become more dexterous.
	DIEGONW_MERKE_DEX = other.attribute[ATR_DEXTERITY];
	DIEGONW_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegonw_teachdex_5);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegonw_teachstr_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegonw_teachstr_5);
};

func void dia_diegonw_teach_back()
{
	if(DIEGONW_MERKE_DEX < other.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,other,"DIA_DiegoNW_Teach_BACK_11_00");	//You've become more dexterous already. Keep it up!
	};
	if(DIEGONW_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(appraisingly) Good. Your strength has increased.
	};
	Info_ClearChoices(dia_diegonw_teach);
};

func void dia_diegonw_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegonw_teachdex_5);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegonw_teachstr_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegonw_teachstr_5);
};

func void dia_diegonw_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegonw_teachdex_5);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegonw_teachstr_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegonw_teachstr_5);
};

func void dia_diegonw_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegonw_teachdex_5);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegonw_teachstr_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegonw_teachstr_5);
};

func void dia_diegonw_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_ClearChoices(dia_diegonw_teach);
	Info_AddChoice(dia_diegonw_teach,DIALOG_BACK,dia_diegonw_teach_back);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegonw_teachdex_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegonw_teachdex_5);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegonw_teachstr_1);
	Info_AddChoice(dia_diegonw_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegonw_teachstr_5);
};


instance DIA_DIEGONW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_knowwhereenemy_condition;
	information = dia_diegonw_knowwhereenemy_info;
	permanent = TRUE;
	description = "I'm going to leave Khorinis.";
};


func int dia_diegonw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (DIEGO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_00");	//I'm going to leave Khorinis.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_01");	//A wise decision. I wish I could come with you. This town has changed too fast - the times where you could get rich fast are over.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_02");	//I could instruct you in archery, lock picking, and dexterity.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_03");	//Also, I'm sure you can use a decent thief.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Of course, Diego wants to come along. The way he sees it, the sooner he leaves Khorinis, the better. He could show me how to become more dexterous, and train me to be a good archer. He can also teach me how to pick locks.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_15_04");	//I'll think about it. At the moment, my crew is already complete.
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_11_05");	//Take your time. I'm not going anywhere.
	}
	else
	{
		Info_ClearChoices(dia_diegonw_knowwhereenemy);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Maybe I'll let you know when the time comes.",dia_diegonw_knowwhereenemy_no);
		Info_AddChoice(dia_diegonw_knowwhereenemy,"Won't you come along?",dia_diegonw_knowwhereenemy_yes);
	};
};

func void dia_diegonw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_Yes_15_00");	//Why don't you come with me? We'll meet at the harbor.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_01");	//Mmh. You're right, Khorinis is a dump. I'm coming with you.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_02");	//Wait, I'll be ready in a second.
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_Wait(self,1);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_Yes_11_03");	//Well, I'm ready. I'll see you at the ship.
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};

func void dia_diegonw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_DiegoNW_KnowWhereEnemy_No_15_00");	//Maybe I'll let you know when the time has come.
	AI_Output(self,other,"DIA_DiegoNW_KnowWhereEnemy_No_11_01");	//You do that. And maybe I'll even go with you. Who knows?
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_diegonw_knowwhereenemy);
};


instance DIA_DIEGONW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_leavemyship_condition;
	information = dia_diegonw_leavemyship_info;
	permanent = TRUE;
	description = "You take care of the city.";
};


func int dia_diegonw_leavemyship_condition()
{
	if((DIEGO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_diegonw_leavemyship_info()
{
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_00");	//You take care of the city.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_01");	//Really? You don't need me any more? Oh well. Don't forget to drop by when you're back in town.
	AI_Output(other,self,"DIA_DiegoNW_LeaveMyShip_15_02");	//You think we'll meet again?
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_03");	//I shall never forget the look on your face when you lay on the ground after Bullit knocked you down and we met for the first time.
	AI_Output(self,other,"DIA_DiegoNW_LeaveMyShip_11_04");	//They can't get the better of someone like you. We SHALL meet again. Take care.
	DIEGO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_DIEGONW_STILLNEEDYOU(C_INFO)
{
	npc = pc_thief_nw;
	nr = 55;
	condition = dia_diegonw_stillneedyou_condition;
	information = dia_diegonw_stillneedyou_info;
	permanent = TRUE;
	description = "Come back. I want you to accompany me.";
};


func int dia_diegonw_stillneedyou_condition()
{
	if(((DIEGO_ISONBOARD == LOG_OBSOLETE) || (DIEGO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_diegonw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_DiegoNW_StillNeedYou_15_00");	//Come back. I want you to accompany me.
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_01");	//What has become of your determination, my friend? Sure I'll go with you - just make up your mind.
	self.flags = NPC_FLAG_IMMORTAL;
	DIEGO_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"NW_CITY_UPTOWN_PATH_23") == 1)
	{
		AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_02");	//Wait, I'll be ready in a second.
		AI_GotoWP(self,"NW_CITY_UPTOWN_HUT_01_01");
		CreateInvItems(self,itar_diego,1);
		AI_EquipArmor(self,itar_diego);
		AI_GotoWP(self,self.wp);
	};
	AI_Output(self,other,"DIA_DiegoNW_StillNeedYou_11_03");	//All right, we can go.
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_THIEF_NW_PICKPOCKET(C_INFO)
{
	npc = pc_thief_nw;
	nr = 900;
	condition = dia_thief_nw_pickpocket_condition;
	information = dia_thief_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_nw_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_nw_pickpocket_info()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_BACK,dia_thief_nw_pickpocket_back);
	Info_AddChoice(dia_thief_nw_pickpocket,DIALOG_PICKPOCKET,dia_thief_nw_pickpocket_doit);
};

func void dia_thief_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

func void dia_thief_nw_pickpocket_back()
{
	Info_ClearChoices(dia_thief_nw_pickpocket);
};

