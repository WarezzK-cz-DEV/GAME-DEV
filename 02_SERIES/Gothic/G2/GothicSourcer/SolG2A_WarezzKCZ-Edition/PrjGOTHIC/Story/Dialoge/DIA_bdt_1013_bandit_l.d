
instance DIA_BDT_1013_BANDIT_FIRSTEXIT(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 999;
	condition = dia_bdt_1013_bandit_firstexit_condition;
	information = dia_bdt_1013_bandit_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1013_bandit_firstexit_condition()
{
	return TRUE;
};

func void dia_bdt_1013_bandit_firstexit_info()
{
	if((BDT13_FRIEND == TRUE) && !Npc_IsDead(ambusher_1014) && !Npc_IsDead(ambusher_1015))
	{
		AI_Output(self,other,"DIA_BDT_1013_BANDIT_FIRSTEXIT_01_00");	//I wouldn't go into the cave up here if I were you - my buddies in there will tan your hide. And they know something about fighting.
	};
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 999;
	condition = dia_bdt_1013_bandit_exit_condition;
	information = dia_bdt_1013_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1013_bandit_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_firstexit))
	{
		return TRUE;
	};
};

func void dia_bdt_1013_bandit_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1013_BANDIT_WHERE(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_bdt_1013_bandit_where_condition;
	information = dia_bdt_1013_bandit_where_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bdt_1013_bandit_where_condition()
{
	return TRUE;
};

func void dia_bdt_1013_bandit_where_info()
{
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_01_00");	//Hey - where do you come from, hm?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"I've come from the mountains.",dia_bdt_1013_bandit_where_mountain);
	Info_AddChoice(dia_bdt_1013_bandit_where,"I've come from Xardas...",dia_bdt_1013_bandit_where_xardas);
};

func void dia_bdt_1013_bandit_where_mountain()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_15_00");	//I've come from the mountains.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_01");	//Exactly. You come from the mountains. And that is bad for you.
	b_usefakescroll();
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_02");	//Very bad.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_03");	//They're looking for you - a whole bunch of evil guys.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_MOUNTAIN_01_04");	//There's someone here you absolutely have to talk to. Follow me!
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Maybe later...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Who's looking for me?",dia_bdt_1013_bandit_where_who);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fine! You go first!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_xardas()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_15_00");	//I've come from Xardas...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_XARDAS_01_01");	//Is that the old sorcerer? He's called Xardas... Brago will be interested...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_bdt_1013_bandit_where_yes()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_YES_15_00");	//Fine! You go first!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_YES_01_01");	//Then just follow me, the cave is right up here.
	Npc_ExchangeRoutine(self,"AMBUSH");
	AI_StopProcessInfos(self);
};

func void dia_bdt_1013_bandit_where_who()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_WHO_15_00");	//Who's looking for me?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_01");	//Half of Khorinis is after you, and you're trying to tell me that you don't know anything about it?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_02");	//Ah! I see! You just don't want to talk to me about it, hm? All right - it's your business.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_WHO_01_03");	//So, you coming or not?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Maybe later...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Who should I talk to?",dia_bdt_1013_bandit_where_talkpartner);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fine! You go first!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_talkpartner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_15_00");	//Who should I talk to?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_01");	//To my leader. His name is Brago. He can explain everything to you better than I can.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_TALKPARTNER_01_02");	//So, what about it - are we going?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Maybe later...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"How do I know this isn't a trap?",dia_bdt_1013_bandit_where_notrap);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fine! You go first!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_notrap()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_15_00");	//How do I know this isn't a trap?
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_01");	//You know, I'm getting tired of you. If you don't want my help, then just go to the city and let them put you behind bars!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTRAP_01_02");	//You come with me NOW or you forget about it, see?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Maybe later...",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Someone else has already tried to trick me...",dia_bdt_1013_bandit_where_damals);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fine! You go first!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_damals()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_00");	//Easy, my friend! Someone has already tried to trick me...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_01");	//Oh?
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_02");	//This guy suggested that we should get an amulet together, and share the profit.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_15_03");	//Once we had reached our goal, he and his friends attacked me.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_DAMALS_01_04");	//It sounds as though you got involved with the wrong people - where was that?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"That's not important.",dia_bdt_1013_bandit_where_notimportant);
	Info_AddChoice(dia_bdt_1013_bandit_where,"I was a convict in the mining colony.",dia_bdt_1013_bandit_where_prisoner);
};

func void dia_bdt_1013_bandit_where_prisoner()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_00");	//I was a convict in the mining colony.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_01");	//(amazed) You come from behind the Barrier? Man, then we were there together.
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_02");	//I don't know you...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_03");	//I was a digger in the Old Camp. I didn't have much to do with the whole thing.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_04");	//(conspiratorially) But what is more important now - you are in big trouble!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_05");	//Someone has put a pretty price on your head. And he's handed out a few posters - with your mug on them!
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_06");	//If I were you, then I would be very - very - careful. There are people with us who would kill their own mother for gold.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_07");	//But I think we boys from the penal colony ought to stick together!
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_15_08");	//Then I guess I had better thank you now...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_PRISONER_01_09");	//It's nothing. Just make sure you stay alive.
	BDT13_FRIEND = TRUE;
	b_setattitude(self,ATT_FRIENDLY);
	self.npctype = NPCTYPE_FRIEND;
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Info_ClearChoices(dia_bdt_1013_bandit_where);
};

func void dia_bdt_1013_bandit_where_notimportant()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_15_00");	//That's not important.
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_NOTIMPORTANT_01_01");	//Suit yourself. So, are we going now, or not?
	Info_ClearChoices(dia_bdt_1013_bandit_where);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fine! You go first!",dia_bdt_1013_bandit_where_later);
	Info_AddChoice(dia_bdt_1013_bandit_where,"Fine! You go first!",dia_bdt_1013_bandit_where_yes);
};

func void dia_bdt_1013_bandit_where_later()
{
	AI_Output(other,self,"DIA_BDT_1013_BANDIT_WHERE_LATER_15_00");	//Maybe later...
	AI_Output(self,other,"DIA_BDT_1013_BANDIT_WHERE_LATER_01_01");	//There won't be a later for you, pal!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_1013_BANDIT_AMBUSH(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_ambush_condition;
	information = dia_1013_bandit_ambush_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1013_bandit_ambush_condition()
{
	if((Npc_GetDistToWP(self,"NW_XARDAS_BANDITS_RIGHT") <= 300) && (BDT13_FRIEND == FALSE))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_ambush_info()
{
	if(Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_00");	//It was really stupid of you to follow me...
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_AMBUSH_01_01");	//Hey people, look who I have here...
		AI_StopProcessInfos(self);
	};
};


instance DIA_1013_BANDIT_NAME(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_name_condition;
	information = dia_1013_bandit_name_info;
	permanent = FALSE;
	description = "Who's the fellow who pays the bounty?";
};


func int dia_1013_bandit_name_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_name_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_00");	//Who's the fellow who pays the bounty?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_01");	//That I don't know, there's only one of us who knows him.
	AI_Output(other,self,"DIA_1013_BANDIT_NAME_15_02");	//And who would that be?
	AI_Output(self,other,"DIA_1013_BANDIT_NAME_01_03");	//Hey, man - I really can't tell you that. You know how it goes...
	Log_CreateTopic(TOPIC_BANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BANDITS,LOG_RUNNING);
	b_logentry(TOPIC_BANDITS,"Some bandits are after me. They've got a wanted note. I wonder what's behind it all.");
	MIS_STECKBRIEFE = LOG_RUNNING;
};


instance DIA_1013_BANDIT_DEXTER(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 1;
	condition = dia_1013_bandit_dexter_condition;
	information = dia_1013_bandit_dexter_info;
	permanent = TRUE;
	description = "10 gold pieces for the name of the guy who raised the bounty.";
};


func int dia_1013_bandit_dexter_condition()
{
	if((BDT13_FRIEND == TRUE) && (BDT13_DEXTER_VERRATEN == FALSE) && Npc_KnowsInfo(other,dia_1013_bandit_name))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_dexter_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_00");	//10 gold pieces for the name of the guy who raised the bounty.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_01");	//Oh, man, I really can't do that...
	AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_02");	//Spit it out already!
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_03");	//(takes a deep breath) Oh man! All right. His name is Dexter. Near the big farm there's a steep rock.
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_04");	//There's a watch tower up there, and a few mines. He has his hideout somewhere nearby.
	b_logentry(TOPIC_BANDITS,"The bandits' leader is Dexter. He's hiding out in a mine near the landowner's.");
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_05");	//See, that wasn't so hard. Here's your gold.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_DEXTER_15_06");	//Er - I just realized I haven't got ten gold pieces left.
		AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_07");	//What?! I... Oh - forget it - it's my own fault. I shouldn't have told you the name before I saw the gold...
	};
	AI_Output(self,other,"DIA_1013_BANDIT_DEXTER_01_08");	//And just don't tell them who told you.
	BDT13_DEXTER_VERRATEN = TRUE;
};


instance DIA_1013_BANDIT_PIC(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 2;
	condition = dia_1013_bandit_pic_condition;
	information = dia_1013_bandit_pic_info;
	permanent = FALSE;
	description = "Can I have the picture?";
};


func int dia_1013_bandit_pic_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_pic_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PIC_15_00");	//Can I have the picture?
	AI_Output(self,other,"DIA_1013_BANDIT_PIC_01_01");	//Sure (grins) - after all, it's YOUR mug on there.
	b_giveinvitems(self,other,itwr_poster_mis,1);
};


instance DIA_1013_BANDIT_FROMMALETH(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_1013_bandit_frommaleth_condition;
	information = dia_1013_bandit_frommaleth_info;
	permanent = FALSE;
	description = "One of the farmers outside of town sent me...";
};


func int dia_1013_bandit_frommaleth_condition()
{
	if((BDT13_FRIEND == TRUE) && ((MIS_MALETH_BANDITS == LOG_RUNNING) || (MIS_MALETH_BANDITS == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_frommaleth_info()
{
	var C_NPC b14;
	var C_NPC b15;
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_00");	//One of the farmers outside of town sent me...
	AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_01");	//What? The farmers know the hideout?
	AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_02");	//They have noticed the missing sheep.
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if(Npc_IsDead(b14) && Npc_IsDead(b15))
	{
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_03");	//Damn! Well, then I'll have to move. If they find the hideout empty, maybe they won't keep looking for me.
	}
	else
	{
		AI_Output(other,self,"DIA_1013_BANDIT_FromMaleth_15_04");	//He wants to see you all dead...
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_05");	//Wait - you're not going do me in, are you - after I helped you?
		AI_Output(self,other,"DIA_1013_BANDIT_FromMaleth_01_06");	//Go on in and bump off the others if you're that eager to see blood - I'm staying out of it!
	};
	BDT_1013_AWAY = TRUE;
	b_giveplayerxp(XP_BANDITWEG);
	Npc_ExchangeRoutine(self,"AWAY");
	AI_StopProcessInfos(self);
};


instance DIA_1013_BANDIT_FROMCAVALORN(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 3;
	condition = dia_1013_bandit_fromcavalorn_condition;
	information = dia_1013_bandit_fromcavalorn_info;
	permanent = FALSE;
	description = "There's bound to be a lot of trouble here before long!";
};


func int dia_1013_bandit_fromcavalorn_condition()
{
	if((BDT13_FRIEND == TRUE) && (MIS_ADDON_CAVALORN_KILLBRAGO == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_1013_bandit_fromcavalorn_info()
{
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_00");	//There's bound to be a lot of trouble here before long!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_01");	//What's up?
	AI_Output(other,self,"DIA_ADDON_1013_BANDIT_FromCavalorn_15_02");	//A guy named Cavalorn is coming to get you!
	AI_Output(self,other,"DIA_ADDON_1013_BANDIT_FromCavalorn_01_03");	//Rats! He's still alive? I'm outta here.
	BDT_1013_AWAY = TRUE;
	b_giveplayerxp(XP_BANDITWEG);
	Npc_ExchangeRoutine(self,"AWAY2");
	AI_StopProcessInfos(self);
};


var int bdt13_gossip_wildnis;

instance DIA_1013_BANDIT_PERM(C_INFO)
{
	npc = bdt_1013_bandit_l;
	nr = 4;
	condition = dia_1013_bandit_perm_condition;
	information = dia_1013_bandit_perm_info;
	permanent = TRUE;
	description = "Is there anything else that might interest me?";
};


func int dia_1013_bandit_perm_condition()
{
	if(BDT13_FRIEND == TRUE)
	{
		return TRUE;
	};
};

func void dia_1013_bandit_perm_info()
{
	AI_Output(other,self,"DIA_1013_BANDIT_PERM_15_00");	//Is there anything else that might interest me?
	if(BDT13_GOSSIP_WILDNIS == FALSE)
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_01");	//You mean about the area here? If you want to stay alive, stay on the paths.
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_02");	//The farther you go into the wilderness, the more dangerous it is.
		BDT13_GOSSIP_WILDNIS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_1013_BANDIT_PERM_01_03");	//I've told you everything I can.
	};
};

