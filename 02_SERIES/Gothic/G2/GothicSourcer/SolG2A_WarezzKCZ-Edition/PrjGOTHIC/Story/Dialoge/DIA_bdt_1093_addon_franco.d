
instance DIA_ADDON_FRANCO_EXIT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 999;
	condition = dia_addon_franco_exit_condition;
	information = dia_addon_franco_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_franco_exit_condition()
{
	return TRUE;
};

func void dia_addon_franco_exit_info()
{
	if((FRANCO_EXIT == FALSE) && (MIS_HLPLOGAN == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Addon_Franco_EXIT_08_00");	//Don't get lost or you'll wind up as food for the sharks.
		FRANCO_EXIT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_FRANCO_PICKPOCKET(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 900;
	condition = dia_franco_pickpocket_condition;
	information = dia_franco_pickpocket_info;
	permanent = TRUE;
	description = "(It would be a great risk to steal his amulet)";
};


func int dia_franco_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && ((other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)) && (Npc_HasItems(self,itam_addon_franco) >= 1)))
	{
		return TRUE;
	};
};

func void dia_franco_pickpocket_info()
{
	Info_ClearChoices(dia_franco_pickpocket);
	Info_AddChoice(dia_franco_pickpocket,DIALOG_BACK,dia_franco_pickpocket_back);
	Info_AddChoice(dia_franco_pickpocket,DIALOG_PICKPOCKET,dia_franco_pickpocket_doit);
};

func void dia_franco_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itam_addon_franco,1);
		b_givethiefxp();
		Info_ClearChoices(dia_franco_pickpocket);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		self.attribute[ATR_HITPOINTS_MAX] = 196;
		self.attribute[ATR_HITPOINTS] = 196;
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_franco_pickpocket_back()
{
	Info_ClearChoices(dia_franco_pickpocket);
};


instance DIA_ADDON_FRANCO_HI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 1;
	condition = dia_addon_franco_hi_condition;
	information = dia_addon_franco_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_franco_hi_condition()
{
	return TRUE;
};

func void dia_addon_franco_hi_info()
{
	Log_CreateTopic(TOPIC_ADDON_FRANCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FRANCO,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FRANCO,"If I do a good job for Franco, he will get me into the camp.");
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_00");	//Hey, what are you doing here? Do you want to get into the camp.
	AI_Output(other,self,"DIA_Addon_Franco_HI_15_01");	//Yes, I am...
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_02");	//I don't care who you are. I'm Franco, I'm the leader here.
	AI_Output(self,other,"DIA_Addon_Franco_HI_08_03");	//So, if you do a good job out here, I'll take you into the camp.
	if(RAMON_NEWS == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Franco_HI_08_04");	//Ramon, the gatekeeper, will tell you if they need new people in the camp. Talk to him.
		b_logentry(TOPIC_ADDON_FRANCO,"I'm supposed to ask Ramon the gatekeeper if they need new people in the camp.");
	};
};


instance DIA_ADDON_FRANCO_HAI(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 2;
	condition = dia_addon_franco_hai_condition;
	information = dia_addon_franco_hai_info;
	permanent = FALSE;
	description = "Thorus needs a new man.";
};


func int dia_addon_franco_hai_condition()
{
	if(RAMON_NEWS == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_franco_hai_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_00");	//Thorus needs a new man.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_01");	//Good. I'll take care of it.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_02");	//Wait a minute, what about me?
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_03");	//You haven't done anything yet.
	AI_Output(other,self,"DIA_Addon_Franco_Hai_15_04");	//I've done a lot, only YOU don't know about it.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_05");	//Okay, you want a chance? You'll get your chance. Move your butt to Logan. The swampsharks are breathing down his neck.
	AI_Output(self,other,"DIA_Addon_Franco_Hai_08_06");	//Help him finish off the beasts and you're as good as in the camp.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco wants me to help Logan before he sends me to the camp.");
};


instance DIA_ADDON_FRANCO_WO(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 3;
	condition = dia_addon_franco_wo_condition;
	information = dia_addon_franco_wo_info;
	permanent = FALSE;
	description = "Where do I find Logan?";
};


func int dia_addon_franco_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_hai) && !Npc_IsDead(logan) && (MIS_HLPLOGAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_franco_wo_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Wo_15_00");	//Where do I find Logan?
	AI_Output(self,other,"DIA_Addon_Franco_Wo_08_01");	//If you're standing in front of the camp entrance, follow the rock wall to the left. It's a bit farther into the swamp.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_TOT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 5;
	condition = dia_addon_franco_tot_condition;
	information = dia_addon_franco_tot_info;
	permanent = FALSE;
	description = "Logan is dead.";
};


func int dia_addon_franco_tot_condition()
{
	if((MIS_HLPLOGAN != LOG_SUCCESS) && Npc_IsDead(logan) && Npc_KnowsInfo(other,dia_addon_franco_hai))
	{
		return TRUE;
	};
};

func void dia_addon_franco_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tot_15_00");	//Logan is dead.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_01");	//Damn. He was the best hunter we had out here. Cursed nuisance.
	AI_Output(self,other,"DIA_Addon_Franco_tot_08_02");	//Be that as it may, I already sent someone else into the camp.
	if(MIS_HLPLOGAN == LOG_RUNNING)
	{
		MIS_HLPLOGAN = LOG_OBSOLETE;
		b_checklog();
	};
};


instance DIA_ADDON_FRANCO_HAISUCCESS(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 6;
	condition = dia_addon_franco_haisuccess_condition;
	information = dia_addon_franco_haisuccess_info;
	permanent = FALSE;
	description = "I helped Logan...";
};


func int dia_addon_franco_haisuccess_condition()
{
	if((MIS_HLPLOGAN == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_franco_hai))
	{
		return TRUE;
	};
};

func void dia_addon_franco_haisuccess_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_00");	//I helped Logan...
	if(Npc_IsDead(logan))
	{
		AI_Output(other,self,"DIA_Addon_Franco_HaiSuccess_15_01");	//... but he didn't survive.
	};
	AI_Output(self,other,"DIA_Addon_Franco_HaiSuccess_08_02");	//Okay, so you fought the swampsharks - you're useful - at least more so than most of the guys here.
	b_giveplayerxp(XP_ADDON_HLPLOGAN);
	b_logentry(TOPIC_ADDON_FRANCO,"Helping Logan wasn't enough for Franco to send me into the camp.");
};


instance DIA_ADDON_FRANCO_MIS2(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 7;
	condition = dia_addon_franco_mis2_condition;
	information = dia_addon_franco_mis2_info;
	permanent = FALSE;
	description = "So can I go to the camp now?";
};


func int dia_addon_franco_mis2_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_haisuccess) || Npc_KnowsInfo(other,dia_addon_franco_tot))
	{
		return TRUE;
	};
};

func void dia_addon_franco_mis2_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_MIS2_15_00");	//So can I go to the camp now?
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_01");	//Listen - there's another thing I need you for.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_02");	//A few days ago, I sent Edgor into the swamp.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_03");	//He was supposed to get me an old stone tablet - but he hasn't been seen since.
	AI_Output(self,other,"DIA_Addon_Franco_MIS2_08_04");	//See what he's doing and bring me that damned stone tablet.
	MIS_HLPEDGOR = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_STONEPLATE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_STONEPLATE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_STONEPLATE,"Franco wants a stone tablet that Edgor was supposed to bring him. Now I am supposed to take care of it.");
	b_logentry(TOPIC_ADDON_FRANCO,"Franco wants me to help Edgor before he sends me to the camp.");
};


instance DIA_ADDON_FRANCO_WHILE(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 8;
	condition = dia_addon_franco_while_condition;
	information = dia_addon_franco_while_info;
	permanent = FALSE;
	description = "What about gold?";
};


func int dia_addon_franco_while_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_haisuccess))
	{
		return TRUE;
	};
};

func void dia_addon_franco_while_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_While_15_00");	//What about gold?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_01");	//What?
	AI_Output(other,self,"DIA_Addon_Franco_While_15_02");	//Do I get anything for my work here in the swamp?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_03");	//(extremely friendly) You want gold? Sure, how much do you want? Fifty gold nuggets? A hundred? I'll give you as much gold as you can carry...
	AI_Output(self,other,"DIA_Addon_Franco_While_08_04");	//(loudly) Who do you think you are? Are you trying to make a fool out of me?
	AI_Output(self,other,"DIA_Addon_Franco_While_08_05");	//Now push off and do something! Otherwise, you won't get so much as one CRUMB OF GOLD!!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_WOEDGOR(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 9;
	condition = dia_addon_franco_woedgor_condition;
	information = dia_addon_franco_woedgor_info;
	permanent = TRUE;
	description = "So WHERE can I find this Edgor?";
};


func int dia_addon_franco_woedgor_condition()
{
	if((MIS_HLPEDGOR == LOG_RUNNING) && (Npc_HasItems(other,itmi_addon_stone_04) < 1))
	{
		return TRUE;
	};
};

func void dia_addon_franco_woedgor_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_15_00");	//(sighs) So, WHERE do I find this Edgor?
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_08_01");	//Do you want the easy way or the fast way?
	Info_ClearChoices(dia_addon_franco_woedgor);
	Info_AddChoice(dia_addon_franco_woedgor,"I'll take the fast way.",dia_addon_franco_woedgor_fast);
	Info_AddChoice(dia_addon_franco_woedgor,"Tell me the easy way.",dia_addon_franco_woedgor_easy);
};

func void b_addon_franco_there()
{
	AI_Output(self,other,"DIA_Addon_Franco_There_08_00");	//There are ruins everywhere. He's sitting around somewhere there.
	AI_Output(self,other,"DIA_Addon_Franco_There_08_01");	//I assume he was smart enough to build himself a fire. You should be able to find THAT.
};

func void dia_addon_franco_woedgor_easy()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Easy_15_00");	//Tell me the easy way.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_01");	//Follow the path to the front gate. Sancho should be standing there.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Easy_08_02");	//Go left from there and follow the boardwalk
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};

func void dia_addon_franco_woedgor_fast()
{
	AI_Output(other,self,"DIA_Addon_Franco_WOEDGOR_Fast_15_00");	//I'll take the fast way.
	AI_Output(self,other,"DIA_Addon_Franco_WOEDGOR_Fast_08_01");	//Okay. From here go diagonally left past the boardwalk, into the swamp.
	b_addon_franco_there();
	Info_ClearChoices(dia_addon_franco_woedgor);
};


instance DIA_ADDON_FRANCO_TAFEL(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 10;
	condition = dia_addon_franco_tafel_condition;
	information = dia_addon_franco_tafel_info;
	permanent = FALSE;
	description = "Here's the stone tablet.";
};


func int dia_addon_franco_tafel_condition()
{
	if((Npc_HasItems(other,itmi_addon_stone_04) >= 1) && (MIS_HLPEDGOR == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_franco_tafel_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_tafel_15_00");	//Here's the stone tablet.
	b_giveinvitems(other,self,itmi_addon_stone_04,1);
	AI_Output(self,other,"DIA_Addon_Franco_tafel_08_01");	//Good, very good. Raven will be pleased with you.
	MIS_HLPEDGOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_HLPEDGOR);
	b_logentry(TOPIC_ADDON_FRANCO,"I brought Franco the stone tablet that he wanted.");
};


instance DIA_ADDON_FRANCO_JEMANDANDEREN(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 11;
	condition = dia_addon_franco_jemandanderen_condition;
	information = dia_addon_franco_jemandanderen_info;
	permanent = FALSE;
	description = "What about the camp now? Can I finally go in?";
};


func int dia_addon_franco_jemandanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_tafel))
	{
		return TRUE;
	};
};

func void dia_addon_franco_jemandanderen_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_JemandAnderen_15_00");	//What about the camp now? Can I finally go in?
	if(!Npc_IsDead(logan))
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_01");	//No, I already sent Logan in. He was ahead of you in the list.
		LOGAN_INSIDE = TRUE;
		AI_Teleport(logan,"BL_INN_CORNER_02");
		b_startotherroutine(logan,"LAGER");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_02");	//No, I already sent someone else in.
	};
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_03");	//And at the moment, there's no need for another man in the camp.
	AI_Output(self,other,"DIA_Addon_Franco_JemandAnderen_08_04");	//Besides, I can really use you here, (grins) now that Logan isn't here any more.
	b_logentry(TOPIC_ADDON_FRANCO,"Franco won't send me to the camp. I think I will have to take care of the Franco problem...");
};


instance DIA_ADDON_FRANCO_FIGHT(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 12;
	condition = dia_addon_franco_fight_condition;
	information = dia_addon_franco_fight_info;
	permanent = TRUE;
	description = "Send me in NOW!";
};


func int dia_addon_franco_fight_condition()
{
	return TRUE;
};

func void dia_addon_franco_fight_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_15_00");	//Send me in NOW!
	AI_Output(self,other,"DIA_Addon_Franco_Fight_08_01");	//(dangerously friendly) And what if I say no?
	Info_ClearChoices(dia_addon_franco_fight);
	Info_AddChoice(dia_addon_franco_fight,"Then I'll just wait a bit...",dia_addon_franco_fight_nothing);
	Info_AddChoice(dia_addon_franco_fight,"Then you'll simply regret it.",dia_addon_franco_fight_duel);
};

func void dia_addon_franco_fight_duel()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Duel_15_00");	//Then you'll simply regret it.
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Duel_08_01");	//Are you threatening me? YOU? Want to threaten ME? - It's time for a lesson...
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_addon_franco_fight_nothing()
{
	AI_Output(other,self,"DIA_Addon_Franco_Fight_Nothing_15_00");	//Then I'll just wait a bit...
	AI_Output(self,other,"DIA_Addon_Franco_Fight_Nothing_08_01");	//(mockingly) Exactly.
	Info_ClearChoices(dia_addon_franco_fight);
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FRANCO_PIG(C_INFO)
{
	npc = bdt_1093_addon_franco;
	nr = 13;
	condition = dia_addon_franco_pig_condition;
	information = dia_addon_franco_pig_info;
	permanent = TRUE;
	description = "You swine! I'll get you!";
};


func int dia_addon_franco_pig_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_franco_jemandanderen))
	{
		return TRUE;
	};
};

func void dia_addon_franco_pig_info()
{
	AI_Output(other,self,"DIA_Addon_Franco_Pig_15_00");	//You swine! I'll get you!
	AI_Output(self,other,"DIA_Addon_Franco_Pig_08_01");	//(strained) You miserable little wretch, you want to mess with ME? Just you wait!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

