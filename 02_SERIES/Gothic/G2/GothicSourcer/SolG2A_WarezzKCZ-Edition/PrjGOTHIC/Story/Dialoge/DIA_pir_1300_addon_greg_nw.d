
instance DIA_ADDON_GREG_NW_EXIT(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 999;
	condition = dia_addon_greg_nw_exit_condition;
	information = dia_addon_greg_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_greg_nw_exit_condition()
{
	return TRUE;
};

func void dia_addon_greg_nw_exit_info()
{
	AI_StopProcessInfos(self);
	PLAYERTALKEDTOGREGNW = TRUE;
};


instance DIA_ADDON_GREG_NW_HALLO(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_hallo_condition;
	information = dia_addon_greg_nw_hallo_info;
	important = TRUE;
};


func int dia_addon_greg_nw_hallo_condition()
{
	if(GREGLOCATION == GREG_FARM1)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_hallo_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_00");	//Psst. Hey, you. Come here.
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_15_01");	//What is it?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_02");	//On your way to the city? And really busy, too.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_03");	//(slimily) Listen. You look like a smart guy to me. I bet you'll go far in life.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_04");	//You're certainly nobody's fool. I could see that right away.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_01_05");	//Say, you'd probably like to earn a couple of gold coins, wouldn't you?
	PLAYERTALKEDTOGREGNW = TRUE;
	SC_MEETSGREGTIME = 1;
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Info_AddChoice(dia_addon_greg_nw_hallo,"I've got to go.",dia_addon_greg_nw_hallo_weg);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Cut the crap. Tell me what you want.",dia_addon_greg_nw_hallo_schleim);
	Info_AddChoice(dia_addon_greg_nw_hallo,"You don't look like someone who has gold.",dia_addon_greg_nw_hallo_vorsicht);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Are you hiding from someone?",dia_addon_greg_nw_hallo_hide);
	Info_AddChoice(dia_addon_greg_nw_hallo,"Why not?",dia_addon_greg_nw_hallo_ja);
};

func void dia_addon_greg_nw_hallo_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_weg_15_00");	//I've got to be going.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_weg_01_01");	//(annoyed) So you won't help me. I'll remember that, pal. We'll meet again.
	AI_StopProcessInfos(self);
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_FAILED;
};

func void dia_addon_greg_nw_hallo_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_ja_15_00");	//Why not?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_01");	//You'll have to forgive an ignorant old seaman, I'm a stranger in these parts and I don't really know all the rules.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_02");	//So I had to find out the hard way that traveling strangers aren't welcome in the harbor city.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_03");	//(exaggerated self pity) Now I'm standing here with no idea how I'm supposed to get into the city.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_04");	//I have some extremely important business to conduct and my client won't tolerate a delay, you see?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_ja_01_05");	//You'll help me find a way to get past the city guard, won't you?
	Info_ClearChoices(dia_addon_greg_nw_hallo);
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"The strange fellow with the eyepatch wants to get into the harbor city. I'm supposed to find a way for him to get past the city guards.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_RUNNING;
};

func void dia_addon_greg_nw_hallo_vorsicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_vorsicht_15_00");	//You don't look like someone who has gold.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_01");	//(exaggerated modesty) Well, I certainly don't move in the same circles as a gentleman like you.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_02");	//But you won't refuse my small contribution to your surely considerable fortune, will you?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_vorsicht_01_03");	//Well, what do you say? Can I count on you?
};

func void dia_addon_greg_nw_hallo_schleim()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_schleim_15_00");	//Cut the crap. Tell me what you want.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_01");	//You see? That's exactly what I mean.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_02");	//Nobody gets anywhere with you just by using pretty words.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_03");	//I knew it. I'm dealing with a tough businessman here.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_schleim_01_04");	//You're a businessman, and certainly interested in a small addition to your purse, aren't you?
};

func void dia_addon_greg_nw_hallo_hide()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Hallo_hide_15_00");	//Are you hiding from someone?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_01");	//Of course not. What nonsense. I just enjoy standing among the trees so the wind won't blow right into my face.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Hallo_hide_01_02");	//But what about you, now? Do you want the job?
};


instance DIA_ADDON_GREG_NW_STADTWACHEN(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_stadtwachen_condition;
	information = dia_addon_greg_nw_stadtwachen_info;
	permanent = TRUE;
	description = "About the city guards...";
};


func int dia_addon_greg_nw_stadtwachen_condition()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};


var int dia_addon_greg_nw_stadtwachen_choiceclose_geld;
var int dia_addon_greg_nw_stadtwachen_choiceclose_schein;
var int dia_addon_greg_nw_stadtwachen_choiceclose_constantino;

func void dia_addon_greg_nw_stadtwachen_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_15_00");	//About the city guards...
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_01_01");	//Yes? Got an idea?
	Info_ClearChoices(dia_addon_greg_nw_stadtwachen);
	Info_AddChoice(dia_addon_greg_nw_stadtwachen,"I'll have to think about it first.",dia_addon_greg_nw_stadtwachen_nochnicht);
	if(DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD == FALSE)
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"What about bribery?",dia_addon_greg_nw_stadtwachen_geld);
	};
	if((DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN == FALSE) && Npc_HasItems(other,itwr_passierschein))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"I have a pass for the city.",dia_addon_greg_nw_stadtwachen_schein);
	};
	if((MIS_ADDON_LESTER_PICKFORCONSTANTINO != 0) && (DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO == FALSE))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"You could get into the city as a herb gatherer.",dia_addon_greg_nw_stadtwachen_constantino);
	};
	if(Npc_HasItems(other,itar_bau_l) || Npc_HasItems(other,itar_bau_m))
	{
		Info_AddChoice(dia_addon_greg_nw_stadtwachen,"They should let you pass if you're wearing these farmer's clothes.",dia_addon_greg_nw_stadtwachen_klamotten);
	};
};

func void dia_addon_greg_nw_stadtwachen_klamotten()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_00");	//They should let you pass if you're wearing these farmer's clothes.
	if(Npc_HasItems(other,itar_bau_l))
	{
		b_giveinvitems(other,self,itar_bau_l,1);
	}
	else
	{
		b_giveinvitems(other,self,itar_bau_m,1);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_01");	//That's just what I need. Man, I knew I could count on you.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_02");	//(maliciously) Nobody will bother me disguised as a local yokel. Ha ha.
	if(Npc_HasItems(self,itar_bau_l))
	{
		AI_EquipArmor(self,itar_bau_l);
	}
	else
	{
		AI_EquipArmor(self,itar_bau_m);
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_03");	//Excellent. You did really well. Here's your promised reward.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	b_giveplayerxp(XP_GREG_NW_GIVEBAUARMOR);
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_15_04");	//(annoyed) What? 50 measly gold coins? You can't be serious.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_05");	//(patronizingly) Gold isn't everything, my friend. Take them for now.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_06");	//I have the feeling that we'll be seeing one another soon.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_klamotten_01_07");	//And who knows? Maybe I'll return the favor. Look after yourself.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Markt");
	b_logentry(TOPIC_ADDON_GREG_NW,"I gave him some farmer's clothes. He can get past the city guards with those.");
	MIS_ADDON_GREG_BRINGMETOTHECITY = LOG_SUCCESS;
};

func void dia_addon_greg_nw_stadtwachen_nochnicht()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_15_00");	//I'll have to think about it first.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_nochnicht_01_01");	//(seriously) All right. But hurry up about it. I've got no time to lose.
	AI_StopProcessInfos(self);
};

func void dia_addon_greg_nw_stadtwachen_schein()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_Schein_15_00");	//I have a pass for the city.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_01");	//(cynically) Oh, I see. I'm supposed to act like I'm a citizen of the town, or what?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_Schein_01_02");	//(annoyed) Take a look at me, boy. Nobody is going to believe that.
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_SCHEIN = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_constantino()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_constantino_15_00");	//You could get into the city as a herb gatherer.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_constantino_01_01");	//(annoyed) What? Do I look like I'd be picking flowers in the woods?
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_CONSTANTINO = TRUE;
};

func void dia_addon_greg_nw_stadtwachen_geld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_Stadtwachen_geld_15_00");	//What about bribery?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Stadtwachen_geld_01_01");	//(roguishly) Well, if that worked for me, I'd have tried it already.
	DIA_ADDON_GREG_NW_STADTWACHEN_CHOICECLOSE_GELD = TRUE;
};


instance DIA_ADDON_GREG_NW_PERM(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_perm_condition;
	information = dia_addon_greg_nw_perm_info;
	permanent = TRUE;
	description = "One more thing...";
};


func int dia_addon_greg_nw_perm_condition()
{
	if(((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)) && (GREGLOCATION == GREG_FARM1))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PERM_15_00");	//One more thing...
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_01");	//(arrogantly) Listen, kid. I've got important things to do right now.
	AI_Output(self,other,"DIA_Addon_Greg_NW_PERM_01_02");	//(threatening) We'll talk again later. Got it?
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_MEETGREGSECONDTIME(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_meetgregsecondtime_condition;
	information = dia_addon_greg_nw_meetgregsecondtime_info;
	important = TRUE;
};


func int dia_addon_greg_nw_meetgregsecondtime_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_meetgregsecondtime_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_00");	//Look who just turned up.
	if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_01");	//The farmer boy.
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_02");	//The fellow who brushed me off so blatantly. So we meet again, eh?
	}
	else if(MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_03");	//(angry) I thought you wanted to help me. Instead, you just slipped away.
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_04");	//You thought I'd be stuck there forever, didn't you?
		AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_05");	//It just goes to show. Help yourself or no one else will help you. But I won't let you get away with it again.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_MeetGregSecondTime_01_06");	//You're just in time.
	SC_SAWGREGINTAVERNE = TRUE;
};


instance DIA_ADDON_GREG_NW_WER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wer_condition;
	information = dia_addon_greg_nw_wer_info;
	description = "Who are you, anyway?";
};


func int dia_addon_greg_nw_wer_condition()
{
	if(GREGLOCATION >= GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wer_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_wer_15_00");	//Who are you, anyway?
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_01");	//That's none of your business.
	AI_Output(self,other,"DIA_Addon_Greg_NW_wer_01_02");	//If I wanted to tell you who I am, I'd have done it already, got it?
};


instance DIA_ADDON_GREG_NW_WAS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_was_condition;
	information = dia_addon_greg_nw_was_info;
	description = "What do you want from me?";
};


func int dia_addon_greg_nw_was_condition()
{
	if(GREGLOCATION == GREG_TAVERNE)
	{
		return TRUE;
	};
};

func void b_greg_search_dexter()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_00");	//I'm looking for a fellow. He isn't anywhere to be found in the city, and these losers here don't have a clue either.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_01");	//He's thin, dark-haired and usually wears red armor.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Search_Dexter_01_02");	//As far as I know, he used to be a prisoner in the colony. I think his name starts with a 'D'.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"The man with the eyepatch is looking for someone whose name starts with 'D'.");
	SC_KNOWSGREGSSEARCHSDEXTER = TRUE;
};

func void dia_addon_greg_nw_was_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_00");	//What do you want from me?
	if(MIS_ADDON_GREG_BRINGMETOTHECITY != 0)
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_was_15_01");	//Are you still having problems with the city guards?
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_01_02");	//(threatening) I'll GIVE you problems, you punk.
	};
	b_greg_search_dexter();
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"You're talking about Diego.",dia_addon_greg_nw_was_diego);
	if((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE))
	{
		Info_AddChoice(dia_addon_greg_nw_was,"Is his name maybe Dexter?",dia_addon_greg_nw_was_dexter);
	};
	Info_AddChoice(dia_addon_greg_nw_was,"I don't know anyone who meets that description.",dia_addon_greg_nw_was_no);
};

func void dia_addon_greg_nw_was_gregunsicher()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_00");	//It could be that that's his name. I'm not sure.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_GregUnsicher_01_01");	//I'll probably only know when I see him.
};

func void dia_addon_greg_nw_was_unnun()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_UnNun_15_00");	//Anything else?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_01");	//(angry) Yeah, you big mouth. There is something else.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_UnNun_01_02");	//I need weapons. I need provisions. Gold wouldn't be bad either.
	Info_ClearChoices(dia_addon_greg_nw_was);
	Info_AddChoice(dia_addon_greg_nw_was,"I can't help you.",dia_addon_greg_nw_was_nohelp);
	Info_AddChoice(dia_addon_greg_nw_was,"Provisions? You're in a tavern.",dia_addon_greg_nw_was_orlan);
	Info_AddChoice(dia_addon_greg_nw_was,"Weapons? The mercenaries have weapons.",dia_addon_greg_nw_was_sld);
	Info_AddChoice(dia_addon_greg_nw_was,"Here's 10 gold coins.",dia_addon_greg_nw_was_hiergold);
	Info_AddChoice(dia_addon_greg_nw_was,"Didn't you find a weapons dealer in the city?",dia_addon_greg_nw_was_waffenhaendler);
	Info_AddChoice(dia_addon_greg_nw_was,"Gold? We all want gold.",dia_addon_greg_nw_was_gold);
};

func void dia_addon_greg_nw_was_nohelp()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_NoHelp_15_00");	//I can't help you.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_01");	//(angry) Oh. You don't WANT to.
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_RUNNING) || (MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_02");	//This is the second time you've left me hanging.
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_03");	//Let me give you some good advice: Be careful that we don't meet again.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_was_NoHelp_01_04");	//I'll remember that. You can count on it.
	};
	MIS_ADDON_GREG_RAKECAVE = LOG_OBSOLETE;
	GREGLOCATION = GREG_BIGCROSS;
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};

func void dia_addon_greg_nw_was_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_00");	//Gold? We all want gold.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_01");	//Could be. And what would you do with it? Drink your way through it in the tavern or blow it in the brothel if I'm any judge.
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Gold_15_02");	//And you have a better plan, eh?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_03");	//(angry) You would crawl under a rock if you knew all I've done.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Gold_01_04");	//So none of that cheek, or I'll shut your big mouth for you.
};

func void dia_addon_greg_nw_was_waffenhaendler()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Waffenhaendler_15_00");	//Didn't you find a weapons dealer in the city?
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Waffenhaendler_01_01");	//You can't be serious! They only have junk.
};

func void dia_addon_greg_nw_was_hiergold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_HierGold_15_00");	//Here's 10 gold coins.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_01");	//(laughs) You poor sucker, you can keep your dough. I have a better idea.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_02");	//There's a cave not far from here! I've been around here before, and I buried my stuff in a few places.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_HierGold_01_03");	//The cave is too dangerous for me alone. I want you to help me with it.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"I offered gold to the man with the eyepatch but he doesn't want it. I'm supposed to follow him to his cave.");
	MIS_ADDON_GREG_RAKECAVE = LOG_RUNNING;
	Info_ClearChoices(dia_addon_greg_nw_was);
};

func void dia_addon_greg_nw_was_sld()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_SLD_15_00");	//Weapons? The mercenaries have weapons.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_01");	//Interesting. I heard that the fat farmer Onar had hired the boys.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_02");	//(laughs) Not too bad for a landlubber.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_SLD_01_03");	//Not a bad idea. Maybe I really should pay them a visit.
};

func void dia_addon_greg_nw_was_orlan()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Orlan_15_00");	//Provisions? You're in a tavern.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_Orlan_01_01");	//The stupid barman won't hand anything over unless you pay him for it.
};

func void dia_addon_greg_nw_was_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_no_15_00");	//I don't know anyone who meets that description.
	AI_Output(self,other,"DIA_Addon_Greg_NW_was_no_01_01");	//I might have known.
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_diego()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Diego_15_00");	//You're talking about Diego.
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};

func void dia_addon_greg_nw_was_dexter()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_was_Dexter_15_00");	//Is his name maybe Dexter?
	dia_addon_greg_nw_was_gregunsicher();
	dia_addon_greg_nw_was_unnun();
};


instance DIA_ADDON_GREG_NW_RAKECAVELOS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavelos_condition;
	information = dia_addon_greg_nw_rakecavelos_info;
	description = "Let's visit the cave.";
};


func int dia_addon_greg_nw_rakecavelos_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavelos_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveLos_15_00");	//Let's visit the cave.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveLos_01_01");	//Come with me.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"BENCH",-1);
	Npc_ExchangeRoutine(self,"RakeCave");
};

func void b_greg_gonow()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_03");	//(commanding) What are you waiting for? Go inside and get the stuff.
};


instance DIA_ADDON_GREG_NW_RAKECAVETHERE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecavethere_condition;
	information = dia_addon_greg_nw_rakecavethere_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecavethere_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecavethere_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_00");	//All right, friend. Here's the cave.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_01");	//And here's a pick for you.
	b_giveinvitems(self,other,itmw_2h_axe_l_01,1);
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_02");	//I buried the stuff somewhere in there. X marks the spot.
	b_greg_gonow();
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCaveThere_15_04");	//What about you, then?
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCaveThere_01_05");	//Someone has to guard our backs. And now, in you go.
	Log_CreateTopic(TOPIC_ADDON_GREG_NW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_GREG_NW,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_GREG_NW,"The fellow wants me to search the cave for his stuff. He buried it and marked the spot with a cross. He gave me a pick for my search.");
	MIS_ADDON_GREG_RAKECAVE_DAY = Wld_GetDay();
};


instance DIA_ADDON_GREG_NW_RAKECAVEPLUNDERED(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_rakecaveplundered_condition;
	information = dia_addon_greg_nw_rakecaveplundered_info;
	important = TRUE;
};


func int dia_addon_greg_nw_rakecaveplundered_condition()
{
	if(((MIS_ADDON_GREG_RAKECAVE_DAY <= (Wld_GetDay() - 2)) || (RAKEPLACE[1] == TRUE)) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_01_00");	//What took you so long? Found anything yet?
	if(RAKEPLACE[1] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"Yes. I dug up a small bag of gold.",dia_addon_greg_nw_rakecaveplundered_gold);
	};
	Info_AddChoice(dia_addon_greg_nw_rakecaveplundered,"No.",dia_addon_greg_nw_rakecaveplundered_no);
};

func void dia_addon_greg_nw_rakecaveplundered_no()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_00");	//No.
	if(RAKEPLACE[1] == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_01");	//Trying to yank my chain, are you?
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_No_15_02");	//(acting innocent) There was nothing THERE.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_03");	//Damnit. I knew it. Those vultures were faster than me - again.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_No_01_04");	//Oh well. Never mind, kiddo. Gotta go. Catch you later.
	AI_StopProcessInfos(self);
	MIS_ADDON_GREG_RAKECAVE = LOG_OBSOLETE;
	GREGLOCATION = GREG_BIGCROSS;
	Npc_ExchangeRoutine(self,"Bigcross");
	b_startotherroutine(bau_974_bauer,"Start");
};


var int b_greg_rakeplacebriefing_onetime;

func void b_greg_rakeplacebriefing()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_00");	//Let's see. There's an islet in the small lake with the two waterfalls. One of my caches should be there.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_01");	//There are two more spots where I buried something further up, in the high pastures.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_02");	//One spot is behind the farm up there, and the other one's next to the entrance to the pass by the waterfalls.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_03");	//There are stairs leading down from the fields of the farmer up there to those of the landowner.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakePlaceBriefing_01_04");	//There's another cache in the hollow where the stairs end.
	if(b_greg_rakeplacebriefing_onetime == FALSE)
	{
		b_logentry(TOPIC_ADDON_GREG_NW,"There is more than one place where he buried something. 1) On the small island in the lake with the two waterfalls. 2) Up on the high pastures behind the farm. 3) Next to the entrance to the pass by the waterfalls. 4) In the hollow below the stairs from that lead from the farmer's fields on the high pastures to those of the landowner. I'm supposed to get the buried stuff for him. He will wait for me at the crossroads between the fields.");
		b_greg_rakeplacebriefing_onetime = TRUE;
	};
};

func void dia_addon_greg_nw_rakecaveplundered_gold()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_00");	//Yes. I dug up a small bag of gold.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_01");	//(greedily) Give it here.
	if(Npc_HasItems(other,itse_goldpocket25) || (Npc_HasItems(other,itmi_gold) >= 25))
	{
		if(b_giveinvitems(other,self,itse_goldpocket25,1))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_02");	//Here you are.
		}
		else if(b_giveinvitems(other,self,itmi_gold,25))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_03");	//There were 25 gold pieces in it. Here, take them.
		};
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_04");	//Great. So they're still there.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_05");	//You're not all that useless after all.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_06");	//Okay, listen. I've buried even more. And I want you to get it for me.
		b_greg_rakeplacebriefing();
		GREG_SUCHWEITER = TRUE;
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_07");	//I'll wait for you at the crossroads by the landowner's fields. Don't fail me. You'd regret that, buster.
		AI_StopProcessInfos(self);
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_giveplayerxp(XP_ADDON_RAKECAVEPLUNDERED);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_15_08");	//I don't have it any more.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RakeCavePlundered_gold_01_09");	//Bullshit. Do I have to beat it out of you, then?
		AI_StopProcessInfos(self);
		MIS_ADDON_GREG_RAKECAVE = LOG_FAILED;
		GREGLOCATION = GREG_BIGCROSS;
		Npc_ExchangeRoutine(self,"Bigcross");
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_ADDON_GREG_NW_LAKECAVE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 100;
	condition = dia_addon_greg_nw_lakecave_condition;
	information = dia_addon_greg_nw_lakecave_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_greg_nw_lakecave_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREGLOCATION >= GREG_TAVERNE) && (GREGLOCATION < GREG_DEXTER) && (Npc_GetDistToWP(self,"NW_BIGFARM_LAKE_CAVE_01") < 1000) && (GREG_SUCHWEITER == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_lakecave_info()
{
	b_greg_gonow();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_WHERETREASURES(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 10;
	condition = dia_addon_greg_nw_wheretreasures_condition;
	information = dia_addon_greg_nw_wheretreasures_info;
	permanent = TRUE;
	description = "Where exactly did you bury your stuff again?";
};


func int dia_addon_greg_nw_wheretreasures_condition()
{
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wheretreasures_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhereTreasures_15_00");	//Where exactly did you bury your stuff again?
	b_greg_rakeplacebriefing();
};


instance DIA_ADDON_GREG_NW_PERMTAVERNE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 99;
	condition = dia_addon_greg_nw_permtaverne_condition;
	information = dia_addon_greg_nw_permtaverne_info;
	permanent = TRUE;
	description = "One more thing...";
};


func int dia_addon_greg_nw_permtaverne_condition()
{
	if(((GREGLOCATION == GREG_BIGCROSS) && (Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) == FALSE) && (((Npc_GetDistToWP(self,"BIGCROSS") < 1000) == FALSE) || (MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS))) || ((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_waswillstdu)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_permtaverne_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_PermTaverne_15_00");	//One more thing...
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_01");	//First, get me the stuff I buried. Then we can talk.
	}
	else if(MIS_ADDON_GREG_RAKECAVE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_02");	//I'm grateful that you helped me. But that doesn't make us friends, if you get my drift.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_PermTaverne_01_03");	//We've been gabbing too much already.
	};
};


instance DIA_ADDON_GREG_NW_BIGCROSS(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_bigcross_condition;
	information = dia_addon_greg_nw_bigcross_info;
	description = "How are things?";
};


func int dia_addon_greg_nw_bigcross_condition()
{
	if((GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_bigcross_info()
{
	if((MIS_ADDON_GREG_BRINGMETOTHECITY == LOG_FAILED) || (MIS_ADDON_GREG_RAKECAVE == LOG_FAILED))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_00");	//Look, if it ain't Mr. Unreliable.
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_01");	//How are things?
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_02");	//So-so. Those mercenaries aren't much help, really.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_03");	//I had expected them to have a little more guts at least.
	AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_04");	//But they're just a bunch of braggarts and loudmouths, if you ask me.
	if((MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_05");	//So what about those things I buried? Have you found them yet?
		if((RAKEPLACE[1] == FALSE) || (RAKEPLACE[2] == FALSE) || (RAKEPLACE[3] == FALSE) || (RAKEPLACE[4] == FALSE) || (RAKEPLACE[5] == FALSE))
		{
			AI_Output(other,self,"DIA_Addon_Greg_NW_Bigcross_15_06");	//No, not all of them.
			AI_Output(self,other,"DIA_Addon_Greg_NW_Bigcross_01_07");	//Then hurry up, will you? It can't be all that difficult.
		};
	};
};


instance DIA_ADDON_GREG_NW_WHATWANTFROMSLD(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_whatwantfromsld_condition;
	information = dia_addon_greg_nw_whatwantfromsld_info;
	description = "What was your business with the mercenaries?";
};


func int dia_addon_greg_nw_whatwantfromsld_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && (Npc_GetDistToWP(self,"BIGCROSS") < 1000))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_whatwantfromsld_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WhatWantFromSLD_15_00");	//What was your business with the mercenaries?
	if(SC_KNOWSGREGSSEARCHSDEXTER == FALSE)
	{
		b_greg_search_dexter();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_01");	//I already told you. I'm looking for this fellow in red armor.
		AI_Output(self,other,"DIA_Addon_Greg_NW_WhatWantFromSLD_01_02");	//But the idiots here have no idea what I'm talking about.
	};
};


instance DIA_ADDON_GREG_NW_DEXTERFOUND(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_dexterfound_condition;
	information = dia_addon_greg_nw_dexterfound_info;
	description = "I take it you're looking for someone named Dexter.";
};


func int dia_addon_greg_nw_dexterfound_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_greg_nw_bigcross) && (GREGLOCATION == GREG_BIGCROSS) && ((BDT13_DEXTER_VERRATEN == TRUE) || (RANGER_SCKNOWSDEXTER == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_dexterfound_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_15_00");	//I take it you're looking for someone named Dexter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_01_01");	//Damnit. How would I know the fellow's name?
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"It was just a thought.",dia_addon_greg_nw_dexterfound_weg);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"Maybe we should go see him together?",dia_addon_greg_nw_dexterfound_together);
	Info_AddChoice(dia_addon_greg_nw_dexterfound,"I know where you can find him.",dia_addon_greg_nw_dexterfound_wo);
};

func void dia_addon_greg_nw_dexterfound_weg()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_weg_15_00");	//It was just a thought.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
};

func void dia_addon_greg_nw_dexterfound_wo()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_00");	//I know where you can find him.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_01");	//(surprised) Really? TELL ME!
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_02");	//Not far from here.
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_wo_15_03");	//He seems to be the leader of an evil gang of bandits.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_04");	//(sneering) HAH. Yep. That's him.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_05");	//I knew the old landlubber had holed up here somewhere.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_06");	//Now all I need to do is scour all the hideouts and ratholes around here.
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_wo_01_07");	//I'll find that bastard - don't need your help for that.
	Info_ClearChoices(dia_addon_greg_nw_dexterfound);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_greg_nw_dexterfound_together()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_DexterFound_together_15_00");	//Maybe we should go see him together?
	AI_Output(self,other,"DIA_Addon_Greg_NW_DexterFound_together_01_01");	//I've still got a bone to pick with him. I can handle that by myself.
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter_condition;
	information = dia_addon_greg_nw_caughtdexter_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_00");	//(loudly) Where is that swine?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter_15_01");	//Who? The captain? He's right here.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter_01_02");	//(loudly) Then get out of my way.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"DexterHouseRun");
};


instance DIA_ADDON_GREG_NW_WODENNNU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_wodennnu_condition;
	information = dia_addon_greg_nw_wodennnu_info;
	important = TRUE;
};


func int dia_addon_greg_nw_wodennnu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && (Npc_IsDead(dexter) == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_HUT_10") < 500))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_wodennnu_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_00");	//(angrily) Now where did he go?
	AI_Output(other,self,"DIA_Addon_Greg_NW_WodennNu_15_01");	//He was here.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WodennNu_01_02");	//(commanding) Well, go and find him then!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GREG_NW_CAUGHTDEXTER2(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_caughtdexter2_condition;
	information = dia_addon_greg_nw_caughtdexter2_info;
	important = TRUE;
};


func int dia_addon_greg_nw_caughtdexter2_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_caughtdexter2_info()
{
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_00");	//Ah. Dexter has bought it, right?
	AI_Output(other,self,"DIA_Addon_Greg_NW_CaughtDexter2_15_01");	//Looks like he's dead.
	AI_Output(self,other,"DIA_Addon_Greg_NW_CaughtDexter2_01_02");	//None too soon, either. Go check out what he's got on him.
	Npc_ExchangeRoutine(self,"DexterHouseWalk");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_RAVENSLETTER(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_ravensletter_condition;
	information = dia_addon_greg_nw_ravensletter_info;
	description = "Dexter carried nothing but this letter.";
};


func int dia_addon_greg_nw_ravensletter_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_caughtdexter2) && Npc_HasItems(other,itwr_ravenskidnappermission_addon) && Npc_IsDead(dexter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_ravensletter_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_00");	//Dexter carried nothing but this letter.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_01");	//Show me that thing.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_02");	//Aw, damnit. That doesn't help me at all.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_03");	//We shouldn't have just let him croak like that.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_04");	//You wouldn't happen to know how to cross those mountains in the north-east of Khorinis?
	if((nefarius_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (saturas_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_05");	//Maybe through an underground tunnel. The Water Mages are currently studying a portal which leads to the mountains in the north-east.
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_06");	//(angrily) What's this nonsense?
		AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_07");	//(mockingly) Bah. Water Mages. Can't you come up with something better?
	};
	AI_Output(other,self,"DIA_Addon_Greg_NW_RavensLetter_15_08");	//No.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_09");	//(with a resigned sigh) So I'm stranded here.
	AI_Output(self,other,"DIA_Addon_Greg_NW_RavensLetter_01_10");	//Dexter was my last hope.
};


instance DIA_ADDON_GREG_NW_WASWILLSTDU(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_waswillstdu_condition;
	information = dia_addon_greg_nw_waswillstdu_info;
	description = "What did you want from Dexter?";
};


func int dia_addon_greg_nw_waswillstdu_condition()
{
	if((GREGLOCATION == GREG_DEXTER) && Npc_KnowsInfo(other,dia_addon_greg_nw_ravensletter))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_waswillstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_15_00");	//What did you want from Dexter?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_01");	//I've come from beyond the mountains in the north-east of this island. And I want to go back.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_01_02");	//I had hoped that the bastard would know how to get there without a ship.
	Npc_ExchangeRoutine(self,"DexterThrone");
	Info_ClearChoices(dia_addon_greg_nw_waswillstdu);
	Info_AddChoice(dia_addon_greg_nw_waswillstdu,"What is there beyond those mountains?",dia_addon_greg_nw_waswillstdu_da);
	if(skip_nw.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		Info_AddChoice(dia_addon_greg_nw_waswillstdu,"I saw a pirate named Skip near the port.",dia_addon_greg_nw_waswillstdu_skip);
	};
};

func void dia_addon_greg_nw_waswillstdu_da()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_da_15_00");	//What is there beyond those mountains?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_01");	//You had better not try to go there.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_da_01_02");	//Those are rough lands. A wimp like you wouldn't last long.
};

func void dia_addon_greg_nw_waswillstdu_skip()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_WasWillstDu_Skip_15_00");	//I saw a pirate named Skip near the port.
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_01");	//That moron. I waited there for 3 days. So why's he coming so late?
	AI_Output(self,other,"DIA_Addon_Greg_NW_WasWillstDu_Skip_01_02");	//Once I get my strength back, I'll give him what for.
	SC_KNOWSCONNECTIONSKIPGREG = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ADDON_GREG_NW_FOUNDTREASURE(C_INFO)
{
	npc = pir_1300_addon_greg_nw;
	nr = 5;
	condition = dia_addon_greg_nw_foundtreasure_condition;
	information = dia_addon_greg_nw_foundtreasure_info;
	permanent = TRUE;
	description = "I found your buried things.";
};


func int dia_addon_greg_nw_foundtreasure_condition()
{
	if((RAKEPLACE[1] == TRUE) && (RAKEPLACE[2] == TRUE) && (RAKEPLACE[3] == TRUE) && (RAKEPLACE[4] == TRUE) && (RAKEPLACE[5] == TRUE) && (MIS_ADDON_GREG_RAKECAVE == LOG_RUNNING) && (GREG_SUCHWEITER == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_greg_nw_foundtreasure_info()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_15_00");	//I found your buried things.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_01_01");	//Then you should be carrying about 100 gold coins, a golden chalice, a silver dish and an amulet, and they're all mine. Give them here.
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	Info_AddChoice(dia_addon_greg_nw_foundtreasure,"I don't happen to have it on me.",dia_addon_greg_nw_foundtreasure_not);
	if((Npc_HasItems(other,itse_goldpocket100) || (Npc_HasItems(other,itmi_gold) >= 100)) && Npc_HasItems(other,itmi_goldcup) && Npc_HasItems(other,itmi_silverchalice) && Npc_HasItems(other,itam_prot_point_01))
	{
		Info_AddChoice(dia_addon_greg_nw_foundtreasure,"Here's your stuff.",dia_addon_greg_nw_foundtreasure_ja);
	};
};

func void dia_addon_greg_nw_foundtreasure_ja()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_00");	//Here's your stuff.
	if(b_giveinvitems(other,self,itse_goldpocket100,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_01");	//A bag with 100 gold coins.
	}
	else if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_02");	//100 gold coins.
	};
	if(b_giveinvitems(other,self,itmi_goldcup,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_03");	//A golden chalice.
	};
	if(b_giveinvitems(other,self,itmi_silverchalice,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_04");	//A silver dish.
	};
	if(b_giveinvitems(other,self,itam_prot_point_01,1))
	{
		AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_ja_15_05");	//And an amulet.
	};
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_06");	//Very good. You're lucky that you weren't dumb enough to simply take the stuff and run.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_ja_01_07");	//Here's your share of the booty.
	b_giveinvitems(self,other,itmi_gold,30);
	Info_ClearChoices(dia_addon_greg_nw_foundtreasure);
	MIS_ADDON_GREG_RAKECAVE = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_GREG_RAKECAVE);
};

func void dia_addon_greg_nw_foundtreasure_not()
{
	AI_Output(other,self,"DIA_Addon_Greg_NW_FoundTreasure_not_15_00");	//I don't happen to have it on me.
	AI_Output(self,other,"DIA_Addon_Greg_NW_FoundTreasure_not_01_01");	//Then get me those things before I get mad.
	AI_StopProcessInfos(self);
};

