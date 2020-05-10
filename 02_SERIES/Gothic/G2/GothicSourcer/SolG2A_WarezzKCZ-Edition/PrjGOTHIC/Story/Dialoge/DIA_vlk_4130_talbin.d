
instance DIA_TALBIN_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_exit_condition;
	information = dia_talbin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_talbin_exit_info()
{
	AI_StopProcessInfos(self);
};


var int talbin_runs;

instance DIA_TALBIN_HALLO(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 5;
	condition = dia_talbin_hallo_condition;
	information = dia_talbin_hallo_info;
	important = TRUE;
};


func int dia_talbin_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_talbin_hallo_info()
{
	AI_Output(self,other,"DIA_Talbin_HALLO_07_00");	//Halt! Stop right where you are!
	AI_Output(other,self,"DIA_Talbin_HALLO_15_01");	//Ack! No problem!
	AI_Output(self,other,"DIA_Talbin_HALLO_07_02");	//Really! Another lost little lamb, huh? At first, I took you for one of those evil bastards who are haunting the area.
	AI_Output(self,other,"DIA_Talbin_HALLO_07_03");	//I can see you're probably not one of them. You look much too harmless!
};


instance DIA_TALBIN_WASMACHTIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 6;
	condition = dia_talbin_wasmachtihr_condition;
	information = dia_talbin_wasmachtihr_info;
	description = "You look like a hunter who doesn't know what to do with his time.";
};


func int dia_talbin_wasmachtihr_condition()
{
	if(TALBIN_RUNS == FALSE)
	{
		return TRUE;
	};
};

func void dia_talbin_wasmachtihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_15_00");	//You look like a hunter who doesn't know what to do with his time.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_01");	//Ha-ha! Yep - you've got a point there. But what am I to do - I cannot get back across the pass!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_02");	//So I'm just staying here, doing what I do best.
	if(Npc_IsDead(engrom) == FALSE)
	{
		AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_03");	//I'm sorry, though, for my pal Engrom.
	};
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_07_04");	//Come close to my fire and warm yourself up.
	Info_ClearChoices(dia_talbin_wasmachtihr);
	Info_AddChoice(dia_talbin_wasmachtihr,DIALOG_BACK,dia_talbin_wasmachtihr_back);
	Info_AddChoice(dia_talbin_wasmachtihr,"You seem to be doing all right, though.",dia_talbin_wasmachtihr_gut);
	Info_AddChoice(dia_talbin_wasmachtihr,"Are you a former prisoner of the Barrier?",dia_talbin_wasmachtihr_strf);
};

func void dia_talbin_wasmachtihr_back()
{
	Info_ClearChoices(dia_talbin_wasmachtihr);
};

func void dia_talbin_wasmachtihr_strf()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_00");	//Are you a former prisoner of the Barrier?
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_01");	//No, no! What are you thinking? I actually meant to strike it rich out here.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_02");	//Someone from around here told me that these are the best hunting grounds there are.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_03");	//Rich pickings, if you know what I mean.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_04");	//The only thing that is to be had here since those orcs have shown up is a punch in the face if you venture out too far!
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_strf_07_05");	//And I let those idiots put a flea in my ear.
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_strf_15_06");	//I know those jokers!
};

func void dia_talbin_wasmachtihr_gut()
{
	AI_Output(other,self,"DIA_Talbin_WASMACHTIHR_gut_15_00");	//You seem to be doing all right, though.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_01");	//Oh well! I guess I can't complain. In spite of those blasted orcs, the areas by the river are the least dangerous.
	AI_Output(self,other,"DIA_Talbin_WASMACHTIHR_gut_07_02");	//It looks like they don't dare go near the water. Mmh. Just a coincidence, maybe.
};


instance DIA_TALBIN_SORRYFORENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 7;
	condition = dia_talbin_sorryforengrom_condition;
	information = dia_talbin_sorryforengrom_info;
	description = "Why are you sorry for Engrom?";
};


func int dia_talbin_sorryforengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_sorryforengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_SORRYFORENGROM_15_00");	//Why are you sorry for Engrom?
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_01");	//Because he simply followed me without asking any questions.
	AI_Output(self,other,"DIA_Talbin_SORRYFORENGROM_07_02");	//And now we've gotten ourselves into this mess. Greed doesn't pay after all.
};


instance DIA_TALBIN_WASJAGDIHR(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 8;
	condition = dia_talbin_wasjagdihr_condition;
	information = dia_talbin_wasjagdihr_info;
	description = "What are you hunting here by the river?";
};


func int dia_talbin_wasjagdihr_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_wasjagdihr_info()
{
	AI_Output(other,self,"DIA_Talbin_WASJAGDIHR_15_00");	//What are you hunting here by the river?
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_01");	//What a question! Just take a stroll along the river and you'll know what I'm hunting here. Lurkers, of course!
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_02");	//Those things aren't easy to catch, but they taste all the better for it.
	AI_Output(self,other,"DIA_Talbin_WASJAGDIHR_07_03");	//Once in a while, I stumble across a scavenger, too. I don't turn up my nose at those, either!
};


instance DIA_TALBIN_ENGROMANGRY(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 9;
	condition = dia_talbin_engromangry_condition;
	information = dia_talbin_engromangry_info;
	description = "I think your buddy is a little stressed out!";
};


func int dia_talbin_engromangry_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving) && Npc_KnowsInfo(other,dia_talbin_sorryforengrom) && (Npc_IsDead(engrom) == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (KAPITEL <= 3) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_engromangry_info()
{
	AI_Output(other,self,"DIA_Talbin_ENGROMANGRY_15_00");	//I think your buddy is a little stressed out!
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_01");	//Just cut it out. Don't provoke him any further, or he'll have my head. At this point, there's nothing I can do about us being here.
	AI_Output(self,other,"DIA_Talbin_ENGROMANGRY_07_02");	//I'll make up for it some day!
};


instance DIA_TALBIN_ASKTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 10;
	condition = dia_talbin_askteacher_condition;
	information = dia_talbin_askteacher_info;
	description = "Can you teach me about hunting?";
};


func int dia_talbin_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasjagdihr) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_askteacher_info()
{
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_00");	//Can you teach me something about hunting?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_01");	//I see! So you've acquired a taste for it now. All right. But it'll cost you!
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_02");	//What do you want for it?
	AI_Output(self,other,"DIA_Talbin_AskTeacher_07_03");	//Would you happen to have anything to eat other than lurker meat? Maybe a hunk of cheese. Yes, a hunk of cheese. I could die for a hunk...
	AI_Output(other,self,"DIA_Talbin_AskTeacher_15_04");	//I'll see what I can do.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Talbin can teach me to take animal trophies.");
};


instance DIA_TALBIN_PAYTEACHER(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 11;
	condition = dia_talbin_payteacher_condition;
	information = dia_talbin_payteacher_info;
	permanent = TRUE;
	description = "Here's your cheese. Will you teach me now?";
};


var int dia_talbin_payteacher_noperm;

func int dia_talbin_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_askteacher) && (DIA_TALBIN_PAYTEACHER_NOPERM == FALSE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_payteacher_info()
{
	if(b_giveinvitems(other,self,itfo_cheese,1))
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_00");	//Here's your cheese. Will you teach me now?
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_01");	//Really, you've got some? Oh man, it's been ages since I ate something like that. Thank you. Er, what about... oh yeah. Sure!
		TALBIN_TEACHANIMALTROPHY = TRUE;
		DIA_TALBIN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_PayTeacher_15_02");	//I don't have any cheese at the moment!
		AI_Output(self,other,"DIA_Talbin_PayTeacher_07_03");	//It would just have been too good to be true. Tell me when you've got some!
	};
};


instance DIA_TALBIN_TEACHHUNTING(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 12;
	condition = dia_talbin_teachhunting_condition;
	information = dia_talbin_teachhunting_info;
	permanent = TRUE;
	description = "What can you teach me?";
};


func int dia_talbin_teachhunting_condition()
{
	if((TALBIN_TEACHANIMALTROPHY == TRUE) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_teachhunting_info()
{
	AI_Output(other,self,"DIA_Talbin_TEACHHUNTING_15_00");	//What can you teach me?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[5] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[4] == FALSE))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_01");	//What do you want to know?
		Info_AddChoice(dia_talbin_teachhunting,DIALOG_BACK,dia_talbin_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Remove claws",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_talbin_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Skin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_talbin_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[5] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Shadowbeast horn",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_talbin_teachhunting_shadowhorn);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[4] == FALSE)
		{
			Info_AddChoice(dia_talbin_teachhunting,b_buildlearnstring("Remove heart",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_talbin_teachhunting_heart);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_07_02");	//I'll have to disappoint you there. You already know everything I could teach you. Still, thanks again for the cheese!
	};
};

func void dia_talbin_teachhunting_back()
{
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_00");	//Chopping off claws is quite simple. You just grab the claw directly at the joint and press it down to the ground.
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Claws_07_01");	//Then you take your knife and carefully cut off the claw.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_00");	//The easiest way to skin a lurker is to make a cut along the length of its belly...
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Fur_07_01");	//... then tug on its hind legs and thus pull off the skin in one piece from back to front.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_ShadowHorn_07_00");	//Shadowbeast horns are very hard and can be used to create statues or tools.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};

func void dia_talbin_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Talbin_TEACHHUNTING_Heart_07_00");	//Hearts of magical beings are very rare and hard to obtain. Be careful when you try that, especially with any kind of golem.
	};
	Info_ClearChoices(dia_talbin_teachhunting);
};


instance DIA_TALBIN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap3_exit_condition;
	information = dia_talbin_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_talbin_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap4_exit_condition;
	information = dia_talbin_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP4_WASNEUES(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 13;
	condition = dia_talbin_kap4_wasneues_condition;
	information = dia_talbin_kap4_wasneues_info;
	description = "Have you seen anyone come by here?";
};


func int dia_talbin_kap4_wasneues_condition()
{
	if((KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_wasneues_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASNEUES_15_00");	//Have you seen anyone come by here?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASNEUES_07_01");	//Yes. There's been some mighty funny fellows running around here lately! They strut about in spiffed-up armor and act all important.
};


instance DIA_TALBIN_KAP4_WASWOLLTENDJG(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 14;
	condition = dia_talbin_kap4_waswolltendjg_condition;
	information = dia_talbin_kap4_waswolltendjg_info;
	description = "What did those 'funny fellows' want here?";
};


func int dia_talbin_kap4_waswolltendjg_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_kap4_wasneues) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_kap4_waswolltendjg_info()
{
	AI_Output(other,self,"DIA_Talbin_KAP4_WASWOLLTENDJG_15_00");	//What did those 'funny fellows' want here?
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_01");	//They asked me about provisions and equipment. Man, I've barely got enough for myself!
	AI_Output(self,other,"DIA_Talbin_KAP4_WASWOLLTENDJG_07_02");	//They were going on about killing dragons and such. Lord knows where those boys came from, but they didn't look particularly trustworthy!
	if(KAPITEL == 4)
	{
		b_logentry(TOPIC_DRAGONHUNTER,"Some Dragon hunters stopped by Talbin the Hunter's place.");
	};
};


instance DIA_TALBIN_WOENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_woengrom_condition;
	information = dia_talbin_woengrom_info;
	description = "Are you alone here at the moment?";
};


func int dia_talbin_woengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_wasmachtihr) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (ENGROMISGONE == TRUE) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_woengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_WOENGROM_15_00");	//Are you alone here at the moment?
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_01");	//Yes. My buddy Engrom has up and left. Yesterday he said he was having a vision - someone speaking to him very softly.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_02");	//I didn't hear a thing. I just thought to myself, he's gone off the deep end...
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_03");	//... and then he was suddenly gone. I've no idea where he went.
	AI_Output(self,other,"DIA_Talbin_WOENGROM_07_04");	//If you should see Engrom anywhere, tell him he still owes me a lurker skin, the bastard.
	if(Npc_KnowsInfo(other,dia_engrom_whataboutleaving))
	{
		AI_Output(other,self,"DIA_Talbin_WOENGROM_15_05");	//But I was under the impression that he didn't even want to leave here until the orcs are gone.
		AI_Output(self,other,"DIA_Talbin_WOENGROM_07_06");	//Like I said - something's wrong with him.
	};
	MIS_TABIN_LOOKFORENGROM = LOG_RUNNING;
};


instance DIA_TALBIN_FOUNDENGROM(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 16;
	condition = dia_talbin_foundengrom_condition;
	information = dia_talbin_foundengrom_info;
	description = "I found your buddy Engrom.";
};


func int dia_talbin_foundengrom_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_woengrom) && ((NPCOBSESSEDBYDMT_ENGROM == TRUE) || Npc_HasItems(other,itat_talbinslurkerskin)) && (KAPITEL >= 4) && (TALBIN_FOLLOWSTHROUGHPASS == 0) && (TALBIN_RUNS == FALSE))
	{
		return TRUE;
	};
};

func void dia_talbin_foundengrom_info()
{
	AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_00");	//I found your buddy Engrom.
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_01");	//Yes? Where is he?
	if(Npc_IsDead(engrom))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_02");	//He's dead.
	}
	else
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_03");	//I don't think you'll see him ever again.
	};
	if(b_giveinvitems(other,self,itat_talbinslurkerskin,1))
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_04");	//Here. I found this lurker skin on him.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_05");	//The Seekers have taken possession of him.
		AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_06");	//The Seekers? Who's that supposed to be?
		AI_Output(other,self,"DIA_Talbin_FOUNDENGROM_15_07");	//Henchmen of the nether realms. They are the true leaders of the orcs.
	};
	AI_Output(self,other,"DIA_Talbin_FOUNDENGROM_07_08");	//By Innos. I need to get out of here, even if it kills me. Now or never!
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_TALBIN_RUNS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TALBIN_RUNS,LOG_RUNNING);
	b_logentry(TOPIC_TALBIN_RUNS,"Talbin, the hunter from the Valley of Mines, ran to the pass like there were swarms of bloodflies at his heels. I think he's headed for Khorinis.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FleePass");
	Wld_InsertNpc(snapper,"START");
	TALBIN_RUNS = TRUE;
};


instance DIA_TALBIN_WOHIN(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 17;
	condition = dia_talbin_wohin_condition;
	information = dia_talbin_wohin_info;
	permanent = TRUE;
	description = "Where will you go? ";
};


func int dia_talbin_wohin_condition()
{
	if(Npc_KnowsInfo(other,dia_talbin_foundengrom) && (TALBIN_FOLLOWSTHROUGHPASS == 0))
	{
		return TRUE;
	};
};

func void dia_talbin_wohin_info()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_15_00");	//Where will you go?
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_01");	//Take me across the pass. Please!!
		Info_ClearChoices(dia_talbin_wohin);
		Info_AddChoice(dia_talbin_wohin,"I don't have time for you.",dia_talbin_wohin_);
		Info_AddChoice(dia_talbin_wohin,"Just go ahead and cross.",dia_talbin_wohin_durch);
		Info_AddChoice(dia_talbin_wohin,"All right.",dia_talbin_wohin_ok);
	}
	else
	{
		AI_Output(self,other,"DIA_Talbin_WOHIN_07_02");	//I must get out of here, across the pass. Out of my way!
		AI_StopProcessInfos(self);
	};
};

func void dia_talbin_wohin_ok()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_ok_15_00");	//All right.
	AI_Output(self,other,"DIA_Talbin_WOHIN_ok_07_01");	//Thank you. When you cross, I'll simply follow you.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"IntoPass");
	TALBIN_FOLLOWSTHROUGHPASS = LOG_RUNNING;
	self.flags = NPC_FLAG_IMMORTAL;
};

func void dia_talbin_wohin_durch()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_durch_15_00");	//Just go ahead and cross.
	AI_Output(self,other,"DIA_Talbin_WOHIN_durch_07_01");	//It's so dark in there. No way am I going in there by myself.
};

func void dia_talbin_wohin_()
{
	AI_Output(other,self,"DIA_Talbin_WOHIN_schwein_15_00");	//I don't have time for you.
	AI_Output(self,other,"DIA_Talbin_WOHIN_schwein_07_01");	//Simply leaving me here to croak. You'll fry in hell for this!
	TALBIN_FOLLOWSTHROUGHPASS = LOG_OBSOLETE;
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_VERSCHWINDE(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 15;
	condition = dia_talbin_verschwinde_condition;
	information = dia_talbin_verschwinde_info;
	permanent = TRUE;
	description = "Hey.";
};


func int dia_talbin_verschwinde_condition()
{
	if(TALBIN_FOLLOWSTHROUGHPASS == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_talbin_verschwinde_info()
{
	AI_Output(other,self,"DIA_Talbin_VERSCHWINDE_15_00");	//Hey.
	AI_Output(self,other,"DIA_Talbin_VERSCHWINDE_07_01");	//Get lost. I can get along without you, scumbag!
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap5_exit_condition;
	information = dia_talbin_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_talbin_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 999;
	condition = dia_talbin_kap6_exit_condition;
	information = dia_talbin_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_talbin_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_talbin_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TALBIN_PICKPOCKET(C_INFO)
{
	npc = vlk_4130_talbin;
	nr = 900;
	condition = dia_talbin_pickpocket_condition;
	information = dia_talbin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_talbin_pickpocket_condition()
{
	return c_beklauen(40,25);
};

func void dia_talbin_pickpocket_info()
{
	Info_ClearChoices(dia_talbin_pickpocket);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_BACK,dia_talbin_pickpocket_back);
	Info_AddChoice(dia_talbin_pickpocket,DIALOG_PICKPOCKET,dia_talbin_pickpocket_doit);
};

func void dia_talbin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_talbin_pickpocket);
};

func void dia_talbin_pickpocket_back()
{
	Info_ClearChoices(dia_talbin_pickpocket);
};

