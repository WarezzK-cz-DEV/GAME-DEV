
instance DIA_BUSTER_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_exit_condition;
	information = dia_buster_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_HELLO(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_hello_condition;
	information = dia_buster_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_hello_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_hello_info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//Who do we have here? Don't I know you from somewhere?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"If you say so. I'm on my way to see the landowner.",dia_buster_hello_goingtofarm);
	Info_AddChoice(dia_buster_hello,"Who wants to know?",dia_buster_hello_whoareyou);
};

func void dia_buster_hello_whoareyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//Who wants to know?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//I'm Buster, one of Lee's mercenaries!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//And YOU had better be a little nicer to me, or I'll have your hide!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//All right, what do you want here?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"That's none of your business.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"I know Lee!",dia_buster_hello_iknowlee);
	Info_AddChoice(dia_buster_hello,"I'm just a traveler on his way to see the landlord.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_iknowlee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//I know Lee!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//Everyone knows Lee! That doesn't mean a thing, pal. Right now, you're talking to ME!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//So, where are you headed?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"That's none of your business.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"I'm just a traveler on his way to see the landlord.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//That's none of your business.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//Nobody talks to me like that, you worm! I think it's time for a sound thrashing.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_goingtofarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//If you say so. I'm on my way to see the landowner.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//Indeed... Hm - you don't look all that dangerous to me.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Want to find out?",dia_buster_hello_wannatestit);
	Info_AddChoice(dia_buster_hello,"I've killed a beast or two on occasion.",dia_buster_hello_slewbeasts);
	Info_AddChoice(dia_buster_hello,"You've got that right.",dia_buster_hello_imnodanger);
};

func void dia_buster_hello_imnodanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//You've got that right.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(smugly) Yep, over the years you learn to spot these things, buddy.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//We get to fight orcs here more often than not. Or the guards from town. Persistent little buggers, they are. (laughs)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Do you mean REAL orcs? Those big things?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"So?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Impressive.",dia_buster_hello_impressive);
};

func void dia_buster_hello_slewbeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//I've killed a beast or two on occasion.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//Ha! (laughs) You probably flattened a few weevils in the fields and chased a couple of rats from their holes.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//We're dealing with orcs here! Well, yeah, and with those scummy city guards. (derisive laugh)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Do you mean REAL orcs? Those big things?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"So?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"Impressive.",dia_buster_hello_impressive);
};

func void dia_buster_hello_wannatestit()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//Want to find out?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//Oh my! I picked on the wrong fella, didn't I?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//You could say so.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//Then come on, show me what you've got.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//Impressive.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(laughs) That's our business, kid! We even produce our own weapons and armor!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//We defy death every day. But a country bumpkin like you wouldn't know about that.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"I guess I'll have to show you how much I know about that!",dia_buster_hello_letmeshowyou);
	Info_AddChoice(dia_buster_hello,"Whatever you say.",dia_buster_hello_ifyousayso);
};

func void dia_buster_hello_ifyousayso()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//Whatever you say.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(with a bored grunt) Get a move on, you wimp!
	AI_StopProcessInfos(self);
};

func void dia_buster_hello_letmeshowyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//I guess I'll have to show you how much I know about that!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//Are you having a peasants' uprising all by yourself, then?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//All right then, show me what you've got.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_sowhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//So?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(snorts) As if you knew what I'm talking about. You think you're mighty strong, don't you?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(angry) Maybe it's about time that somebody taught you a lesson!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Any time!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Only kidding...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_realorcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//Do you mean REAL orcs? Those big things?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(sighs) I mean... Just a moment! Are you trying to pull my leg?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(smiling) Far be that from me.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//You worm! (stupidly aggressive) You're really asking for it, huh?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//Then come and show me what you've got, you hero!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"Any time!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"Only kidding...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//Any time!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//Come closer, then, buddy!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_justjoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//Only kidding...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//Yeah, right, draw in your horns! Just get out of my sight!
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_FIGHTNONE(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_fightnone_condition;
	information = dia_buster_fightnone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_fightnone_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_hello) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_buster_fightnone_info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//What do you want, you wimp?
};


instance DIA_BUSTER_DUELL(C_INFO)
{
	npc = sld_802_buster;
	nr = 3;
	condition = dia_buster_duell_condition;
	information = dia_buster_duell_info;
	permanent = TRUE;
	description = "I challenge you to a duel!";
};


func int dia_buster_duell_condition()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void dia_buster_duell_info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//I challenge you to a duel!
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//Ah-ha! You won't take this sitting down, huh? All right - come here!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//You want to try again? Pesky little bugger - all right, come here!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//But don't run off again!
		};
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BUSTER_WANNAJOIN(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_wannajoin_condition;
	information = dia_buster_wannajoin_info;
	permanent = TRUE;
	description = "I want to join the mercenaries!";
};


func int dia_buster_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && (BUSTER_DUELL == FALSE))
	{
		return TRUE;
	};
};

func void dia_buster_wannajoin_info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//I want to join the mercenaries!
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//Anyone who can whack as hard as you shouldn't have too much trouble around here.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//You're not the best of fighters, but a coward you're not.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//My vote doesn't count much since I haven't been here for long, but when Lee asks me I'll vote for you.
		BUSTER_DUELL = TRUE;
		Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
		b_logentry(TOPIC_SLDRESPEKT,"Since I've defeated Buster, he doesn't mind my joining the mercenaries.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//You? I don't recall that they ever let a coward join the mercenaries...
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//Running away in a duel - that won't get you far around here!
		};
	};
};


var int buster_sentenzatip;

instance DIA_BUSTER_OTHERSLD(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_othersld_condition;
	information = dia_buster_othersld_info;
	permanent = FALSE;
	description = "I want to find out more about the mercenaries and this region.";
};


func int dia_buster_othersld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_buster_othersld_info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//I want to find out more about the mercenaries and this region.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//I can't tell you much about this region. You had better ask the farmers.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//And as for us mercenaries - we have a very simple rule: If you can stand your ground, you're in.
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//I think you're made of the right stuff to be one of us.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//But you shouldn't let it get to your head that you lucked out during our last fight.
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//There are plenty of lads on the farm who are quite a bit better than I am...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//Sentenza, for one. He guards the entry to the farm. Whatever you do, don't pick a fight with him.
		BUSTER_SENTENZATIP = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//But why am I telling that to YOU, you wuss!
		AI_StopProcessInfos(self);
	};
};


var int buster_goldzumbrennen;
var int buster_bonus;

instance DIA_BUSTER_ABOUTSENTENZA(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_aboutsentenza_condition;
	information = dia_buster_aboutsentenza_info;
	permanent = FALSE;
	description = "What about this Sentenza?";
};


func int dia_buster_aboutsentenza_condition()
{
	if(BUSTER_SENTENZATIP == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_aboutsentenza_info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//What about this Sentenza?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//He'll try to squeeze some gold out of you when you come to the farm - he does that to all newcomers.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//And if I were you, I'd pay up. That's what I did back then. And the good thing was that he voted for me afterwards.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//One good turn deserves another, he said. I lost all my gold in the bargain, but it wasn't much to begin with. And I was glad of it in the end.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//I once watched him beat up a fellow who had decided NOT to pay him.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//Thanks for the hint.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//Indeed. Could it be worth anything to you?
	Info_ClearChoices(dia_buster_aboutsentenza);
	Info_AddChoice(dia_buster_aboutsentenza,"No.",dia_buster_aboutsentenza_no);
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		Info_AddChoice(dia_buster_aboutsentenza,"Here you are - 5 gold pieces.",dia_buster_aboutsentenza_give);
	};
};

func void dia_buster_aboutsentenza_give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//Here you are - 5 gold pieces.
	b_giveinvitems(other,self,itmi_gold,5);
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//Thanks, man. Looks like I can take a few tonight after all. I won't forget this.
	BUSTER_GOLDZUMBRENNEN = TRUE;
	BUSTER_BONUS = 50;
	Info_ClearChoices(dia_buster_aboutsentenza);
};

func void dia_buster_aboutsentenza_no()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//No.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//That's what I thought.
	Info_ClearChoices(dia_buster_aboutsentenza);
};


instance DIA_BUSTER_LEELEADER(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_leeleader_condition;
	information = dia_buster_leeleader_info;
	permanent = FALSE;
	description = "Lee is the leader of the mercenaries, isn't he?";
};


func int dia_buster_leeleader_condition()
{
	if(BUSTER_DUELL == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_leeleader_info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//Lee is the leader of the mercenaries, isn't he?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//Right - hey, now I remember where I know you from! You were in the colony, too.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(sighs) So I was.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//I didn't see you when the big bang happened. Not for a while before that, either.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//I had other problems.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//You've missed out on quite a lot then - things have changed since we were in the slammer together.
};


instance DIA_BUSTER_WHATHAPPENED(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_whathappened_condition;
	information = dia_buster_whathappened_info;
	permanent = FALSE;
	description = "What became of the mercenaries in the colony?";
};


func int dia_buster_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_leeleader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_whathappened_info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//What became of the mercenaries in the colony?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//Once the Barrier was gone, Lee led us out of the colony. He said that nothing could happen to us if we all stuck together. And he was right.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//It wasn't too long before we found ourselves a cozy spot right here. The landowner pays us to beat up the militia from the city.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//And most of us would have volunteered to do that even without pay.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//But Onar feeds us all and we can bide our time until we see a good opportunity to get away from this blasted island.
};


instance DIA_BUSTER_TEACH(C_INFO)
{
	npc = sld_802_buster;
	nr = 8;
	condition = dia_buster_teach_condition;
	information = dia_buster_teach_info;
	permanent = TRUE;
	description = "Can you teach me how to fight better?";
};


func int dia_buster_teach_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 60)
	{
		return TRUE;
	};
};

func void dia_buster_teach_info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//Can you teach me how to fight better?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//I might well be able to give you a hint or two...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//You're not nearly as dumb as you look. All right, I'll teach you what I know. Then maybe you'll even stand a fair chance against me...
	};
	if(BUSTERLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Buster can teach me one-handed combat.");
		BUSTERLOG = TRUE;
	};
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_back()
{
	Info_ClearChoices(dia_buster_teach);
};

func void dia_buster_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};

func void dia_buster_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_buster_teach_1h_5);
};


instance DIA_BUSTER_KAP3_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap3_exit_condition;
	information = dia_buster_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_buster_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_SHADOWBEASTS(C_INFO)
{
	npc = sld_802_buster;
	nr = 30;
	condition = dia_buster_shadowbeasts_condition;
	information = dia_buster_shadowbeasts_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_shadowbeasts_condition()
{
	if(((KAPITEL == 3) || (KAPITEL == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void b_dia_buster_shadowbeasts_ok()
{
	AI_StopProcessInfos(self);
};

func void dia_buster_shadowbeasts_info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//Hey, you, buddy!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//What do you want?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//These last few days, I've been thinking about how we could make some quick money in this dump.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//And?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//I think I've stumbled across a possibility to make money fast.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//A merchant from town would shell out a lot of dough for a certain thing.
	Info_ClearChoices(dia_buster_shadowbeasts);
	Info_AddChoice(dia_buster_shadowbeasts,"Who is this merchant you're talking about?",dia_buster_shadowbeasts_wer);
	Info_AddChoice(dia_buster_shadowbeasts,"What's this about?",dia_buster_shadowbeasts_was);
	Info_AddChoice(dia_buster_shadowbeasts,"Why are you telling me this?",dia_buster_shadowbeasts_ich);
};

func void dia_buster_shadowbeasts_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//Why are you telling me this?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//I can't do it myself. I need to stay here and watch those stupid sheep.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//You mean, the farmers.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//That's what I'm saying.
};

func void dia_buster_shadowbeasts_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//What's this about?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//The merchant claims that he could market shadowbeast horns very profitably.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//Someone would have to go to the woods and harvest those beasts. And that's where you come in.
	Info_AddChoice(dia_buster_shadowbeasts,"How much is to be gained there?",dia_buster_shadowbeasts_was_wieviel);
};

func void dia_buster_shadowbeasts_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//How much is to be gained there?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//A bunch of money, I tell you. There will be enough for the two of us.
	if(BUSTER_GOLDZUMBRENNEN == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//And since you gave me that gold back then, I'll make you a special price.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//Sounds good! I'll let you know when I manage to get some horns.
	MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_RUNNING);
	b_logentry(TOPIC_BUSTER_KILLSHADOWBEASTS,"Buster will offer a good price for every horn of a shadowbeast that I bring him.");
	Info_ClearChoices(dia_buster_shadowbeasts);
};

func void dia_buster_shadowbeasts_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//Who is this merchant you're talking about?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//No can do, pal. I'd have to be really stupid to tell you my source. Were you trying to pull a fast one on me?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//Either you make the deal with ME, or not at all, capisce?
};


instance DIA_BUSTER_BRINGTROPHYSHADOWBEAST(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_bringtrophyshadowbeast_condition;
	information = dia_buster_bringtrophyshadowbeast_info;
	permanent = TRUE;
	description = "About the shadowbeast horns...";
};


func int dia_buster_bringtrophyshadowbeast_condition()
{
	if((MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING) && (Npc_HasItems(other,itat_shadowhorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[5] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int bustertrophyshadowbeastcounter;

func void dia_buster_bringtrophyshadowbeast_info()
{
	var int bustertrophyshadowbeastcount;
	var int xp_bringbustertrophyshadowbeast;
	var int xp_bringbustertrophyshadowbeasts;
	var int bustersbustertrophyshadowbeastoffer;
	var int bustertrophyshadowbeastgeld;
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//My city merchant has made his farewells.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//What is that supposed to mean?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//He's dead. You can keep the horns. I wouldn't know what to do with them now.
		MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(Npc_HasItems(other,itat_shadowhorn) >= 1)
	{
		bustertrophyshadowbeastcount = Npc_HasItems(other,itat_shadowhorn);
		xp_bringbustertrophyshadowbeast = 30 * XP_PER_VICTORY;
		bustersbustertrophyshadowbeastoffer = VALUE_SHADOWHORN + BUSTER_BONUS;
		if(bustertrophyshadowbeastcount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//I've got a shadowbeast horn for you.
			b_giveplayerxp(xp_bringbustertrophyshadowbeast);
			b_giveinvitems(other,self,itat_shadowhorn,1);
			Npc_RemoveInvItem(self,itat_shadowhorn);
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//I've got some more shadowbeast horns for your merchant.
			b_giveinvitems(other,self,itat_shadowhorn,bustertrophyshadowbeastcount);
			Npc_RemoveInvItems(self,itat_shadowhorn,bustertrophyshadowbeastcount);
			xp_bringbustertrophyshadowbeasts = bustertrophyshadowbeastcount * xp_bringbustertrophyshadowbeast;
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + bustertrophyshadowbeastcount;
			b_giveplayerxp(xp_bringbustertrophyshadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//Great. Give here. And get me more. Who knows for how long that merchant will still want these things.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//Here's your share.
		bustertrophyshadowbeastgeld = bustertrophyshadowbeastcount * bustersbustertrophyshadowbeastoffer;
		CreateInvItems(self,itmi_gold,bustertrophyshadowbeastgeld);
		b_giveinvitems(self,other,itmi_gold,bustertrophyshadowbeastgeld);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[5] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//How do you gut a shadowbeast?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//You don't know that? Oh man, I'd have expected more of you.
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"I'll get back to you with horns.",dia_buster_bringtrophyshadowbeast_back);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,b_buildlearnstring("Teach me.",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_buster_bringtrophyshadowbeast_teach);
	}
	else
	{
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"I'll get back to you with horns.",dia_buster_bringtrophyshadowbeast_back);
	};
};

func void dia_buster_bringtrophyshadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//Teach me.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//Listen up, then. You do in that shadowbeast, and then you hold its horn with your right hand as tight as you can.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//Then you stick your knife in its forehead and cut a furrow in the flesh around the horn.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//Then you use your knife to lever the horn from the skull, and you put it in your pocket.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//Well. And then you bring it to me. That shouldn't be too hard for you to do.
	};
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};

func void dia_buster_bringtrophyshadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//I'll get back to you about that.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//I hope so.
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};


instance DIA_BUSTER_KAP4_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap4_exit_condition;
	information = dia_buster_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_buster_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PERM4(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_perm4_condition;
	information = dia_buster_perm4_info;
	permanent = TRUE;
	description = "What do you think of this Dragon hunter thing?";
};


func int dia_buster_perm4_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_buster_perm4_info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//What do you think of this Dragon hunter thing?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//The boys could come away with a lot of gold - if they don't kick the bucket first.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//Myself, I prefer sticking with Lee.
};


instance DIA_BUSTER_KAP5_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap5_exit_condition;
	information = dia_buster_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_buster_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_KAP6_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap6_exit_condition;
	information = dia_buster_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_buster_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PICKPOCKET(C_INFO)
{
	npc = sld_802_buster;
	nr = 900;
	condition = dia_buster_pickpocket_condition;
	information = dia_buster_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_buster_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_buster_pickpocket_info()
{
	Info_ClearChoices(dia_buster_pickpocket);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_BACK,dia_buster_pickpocket_back);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_PICKPOCKET,dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back()
{
	Info_ClearChoices(dia_buster_pickpocket);
};

