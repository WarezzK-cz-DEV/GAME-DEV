
instance DIA_RAOUL_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_exit_condition;
	information = dia_raoul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_raoul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_NOSENTENZA(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_nosentenza_condition;
	information = dia_raoul_nosentenza_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_raoul_nosentenza_condition()
{
	if(!Npc_KnowsInfo(other,dia_sentenza_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_raoul_nosentenza_info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//Wait a minute, pal!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//I didn't see Sentenza search you.
	if(Hlp_IsValidNpc(sentenza) && !c_npcisdown(sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//SENTENZA! Come here!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(feigned polite) One moment, he'll be right here!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//Then you're in for a nasty surprise!
		b_attack(sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Where is he, anyway? Well, doesn't matter, you got lucky...
	};
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_HELLO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_hello_condition;
	information = dia_raoul_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_raoul_hello_condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_raoul_hello_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(bored) What do you want?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(annoyed) What do you want this time?
	};
};


var int raoul_gesagt;

instance DIA_RAOUL_PERMNONE(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_permnone_condition;
	information = dia_raoul_permnone_info;
	permanent = TRUE;
	description = "I want to have a look around the farm!";
};


func int dia_raoul_permnone_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_permnone_info()
{
	AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//I want to have a look around the farm!
	if(RAOUL_GESAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Don't go into the building on the left. Sylvio's in there. He's not in a good mood right now.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//If he sees a weakling who doesn't belong on the farm, he might get the idea of venting his bad mood on him.
		RAOUL_GESAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Have fun!
		AI_StopProcessInfos(self);
	};
};


instance DIA_RAOUL_WANNAJOIN(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_wannajoin_condition;
	information = dia_raoul_wannajoin_info;
	permanent = FALSE;
	description = "I want to join up with Lee!";
};


func int dia_raoul_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_wannajoin_info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//I want to join up with Lee!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Lee won't have much to say around here if he keeps on this way!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//What do you mean?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//He wants us all to sit around here and twiddle our thumbs. Intimidate a few farmers now and then, and that's it.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Sylvio always says offense is the best defense, and damn right he is.
};


instance DIA_RAOUL_ABOUTSYLVIO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_aboutsylvio_condition;
	information = dia_raoul_aboutsylvio_info;
	permanent = FALSE;
	description = "Who is Sylvio?";
};


func int dia_raoul_aboutsylvio_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_wannajoin))
	{
		return TRUE;
	};
};

func void dia_raoul_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//Who is Sylvio?
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//Our next leader, if you ask me. If you plan on asking him if you can join us - forget it!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//You look like you're barely good for herding sheep.
};


instance DIA_RAOUL_STIMME(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_stimme_condition;
	information = dia_raoul_stimme_info;
	permanent = FALSE;
	description = "I'd like to become a mercenary here. Do you mind?";
};


func int dia_raoul_stimme_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_raoul_stimme_info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//I'd like to become a mercenary here. Do you mind?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//Aah, do whatever you want...
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Raoul doesn't mind my joining the mercenaries.");
};


instance DIA_RAOUL_DUELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_duell_condition;
	information = dia_raoul_duell_info;
	permanent = TRUE;
	description = "Methinks I'm going to punch you in the face...";
};


func int dia_raoul_duell_condition()
{
	if(((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_aboutsylvio) || Npc_KnowsInfo(other,dia_jarvis_missionko)) && (MIS_READYFORCHAPTER4 == FALSE))
	{
		return TRUE;
	};
};

func void dia_raoul_duell_info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//Methinks I'm going to punch you in the face...
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//What?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//That's exactly what you need right now...
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//I've been too nice to you so far, haven't I?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_RAOUL_PERM(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_perm_condition;
	information = dia_raoul_perm_info;
	permanent = TRUE;
	description = "Everything else all right?";
};


func int dia_raoul_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_perm_info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//Everything else all right?
	if(MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//Don't babble so much. Go and get me that black troll hide.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//Are you trying to get on my good side now, or what? Beat it!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//I haven't forgotten what you did to me.
		};
	};
};


instance DIA_RAOUL_TROLL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_troll_condition;
	information = dia_raoul_troll_info;
	important = TRUE;
};


func int dia_raoul_troll_condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_troll_info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(cynical) Will you look at that!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//What do you want?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//Have you joined the city beggars? Looks like it.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Don't think that I respect you now, just because you're one of us.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Playing the grand magician here, eh?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//I'll tell you something. No matter what you're wearing, I can see right through you.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//To me, you're just a greasy little idler, nothing more.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"I've got to go.",dia_raoul_troll_weg);
	Info_AddChoice(dia_raoul_troll,"What's your problem?",dia_raoul_troll_rechnung);
};

func void dia_raoul_troll_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//I've got to go.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Yeah. Beat it.
	AI_StopProcessInfos(self);
};

func void dia_raoul_troll_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//What's your problem?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//I know people of your sort. All talk, no guts.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//I detest somebody who dresses up all important and brags about his heroic deeds.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Just yesterday, I slugged one of the boys here in the mouth, because he claimed he could bring down a black troll with one hand tied behind his back.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//So what?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(tartly) What's that supposed to mean, 'so what'?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//Have you ever even seen a black troll, big mouth? Do you have any idea how big those monsters are, man?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//If you get just one step too close to them, they'll tear you to pieces.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"That doesn't concern me.",dia_raoul_troll_rechnung_hastrecht);
	if(Npc_IsDead(troll_black))
	{
		Info_AddChoice(dia_raoul_troll,"I've killed a black troll already.",dia_raoul_troll_rechnung_ich);
	}
	else
	{
		Info_AddChoice(dia_raoul_troll,"Black troll? No problem.",dia_raoul_troll_rechnung_noprob);
	};
};

func void b_raoul_blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//You're asking for it, huh? I ought to rip your head off. But I've got a better idea.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//If you're such a great fighter, then prove it.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//What's in it for me?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//Stupid question. Your honor and your jaw in one piece?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//That's not a whole lot, is it?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//Mmh. Shall we say, I'll pay you a ton of money if you bring me the hide of a black troll. How's that sound?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//Better.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Then what are you waiting for?
	Log_CreateTopic(TOPIC_KILLTROLLBLACK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTROLLBLACK,LOG_RUNNING);
	b_logentry(TOPIC_KILLTROLLBLACK,"Raoul wants me to bring him the hide of a black troll.");
	MIS_RAOUL_KILLTROLLBLACK = LOG_RUNNING;
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//I'm not interested.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//That's probably better for you.
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//I've killed a black troll already.
	b_raoul_blame();
};

func void dia_raoul_troll_rechnung_noprob()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//Black troll? No problem.
	b_raoul_blame();
};


instance DIA_RAOUL_TROPHYFUR(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trophyfur_condition;
	information = dia_raoul_trophyfur_info;
	permanent = TRUE;
	description = "First tell me how to get the hide off the troll.";
};


func int dia_raoul_trophyfur_condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE) && (MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_raoul_trophyfur_info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//First tell me how to get the hide off the troll.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//Then open your ears. This tip is for free.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//You grab the beast and cut a slit in each of his legs.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//Then you pull the thing's skin over its ears. Is that difficult or what?
	};
};


instance DIA_RAOUL_TROLLFELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trollfell_condition;
	information = dia_raoul_trollfell_info;
	description = "I've got the hide of a black troll.";
};


func int dia_raoul_trollfell_condition()
{
	if(Npc_HasItems(other,itat_trollblackfur) && Npc_KnowsInfo(other,dia_raoul_troll))
	{
		return TRUE;
	};
};

func void dia_raoul_trollfell_info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//I've got the hide of a black troll.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//Impossible. Show me.
	b_giveinvitems(other,self,itat_trollblackfur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//Incredible. What do you want for it?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Give me what you've got.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Okay. I'll give you 500 gold pieces and toss in three strong healing potions, what do you say?
	Info_ClearChoices(dia_raoul_trollfell);
	Info_AddChoice(dia_raoul_trollfell,"That's not enough.",dia_raoul_trollfell_nein);
	Info_AddChoice(dia_raoul_trollfell,"Done.",dia_raoul_trollfell_ja);
	MIS_RAOUL_KILLTROLLBLACK = LOG_SUCCESS;
	b_giveplayerxp(XP_RAOUL_KILLTROLLBLACK);
};

func void dia_raoul_trollfell_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Sold.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//It was a pleasure.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	Info_ClearChoices(dia_raoul_trollfell);
};

func void dia_raoul_trollfell_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//That's not enough.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Suit yourself. I'll keep the hide, anyway.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//I'm not going to let this chance slip through my fingers.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_FELLZURUECK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_fellzurueck_condition;
	information = dia_raoul_fellzurueck_info;
	permanent = TRUE;
	description = "Give me my troll hide back.";
};


func int dia_raoul_fellzurueck_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && Npc_HasItems(self,itat_trollblackfur))
	{
		return TRUE;
	};
};

func void dia_raoul_fellzurueck_info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Give me my troll hide back.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//No.
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_GOTTROLLFURBACK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_gottrollfurback_condition;
	information = dia_raoul_gottrollfurback_info;
	description = "Never try to fleece me again, understood?";
};


func int dia_raoul_gottrollfurback_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && (Npc_HasItems(self,itat_trollblackfur) == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_raoul_gottrollfurback_info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//Never try to fleece me again, understood?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//All right. You know how things work around here, don't you? So calm down.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP3_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap3_exit_condition;
	information = dia_raoul_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_raoul_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP4_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap4_exit_condition;
	information = dia_raoul_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_raoul_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP5_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap5_exit_condition;
	information = dia_raoul_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_raoul_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_SHIP(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_ship_condition;
	information = dia_raoul_ship_info;
	description = "Would you like an ocean cruise out of here?";
};


func int dia_raoul_ship_condition()
{
	if((KAPITEL >= 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_raoul_ship_info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//Would you fancy an ocean cruise out of here?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//What are you planning? Are you going to capture the paladins' ship? (laughs)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//And what if I am?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(serious) You are completely crazy. No, thanks. Not for me.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//I don't see any reason to leave Khorinis. Whether I earn my dough here or on the mainland - it's all the same to me.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Find somebody else.
	if(Npc_IsDead(torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Ask Torlof. He used to go to sea, as far as I know.
	};
};


instance DIA_RAOUL_KAP6_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap6_exit_condition;
	information = dia_raoul_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_raoul_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_PICKPOCKET(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_pickpocket_condition;
	information = dia_raoul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_raoul_pickpocket_condition()
{
	return c_beklauen(45,85);
};

func void dia_raoul_pickpocket_info()
{
	Info_ClearChoices(dia_raoul_pickpocket);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_BACK,dia_raoul_pickpocket_back);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_PICKPOCKET,dia_raoul_pickpocket_doit);
};

func void dia_raoul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_raoul_pickpocket);
};

func void dia_raoul_pickpocket_back()
{
	Info_ClearChoices(dia_raoul_pickpocket);
};

