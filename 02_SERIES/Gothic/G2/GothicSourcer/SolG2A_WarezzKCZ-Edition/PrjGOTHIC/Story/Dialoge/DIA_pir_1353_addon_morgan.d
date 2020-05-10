
var int morgan_perm_counter;

instance DIA_ADDON_MORGAN_EXIT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 999;
	condition = dia_addon_morgan_exit_condition;
	information = dia_addon_morgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_morgan_exit_condition()
{
	return TRUE;
};

func void dia_addon_morgan_exit_info()
{
	if(GREGISBACK == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Morgan_Perm_15_00");	//Go lie back down.
		if(MORGAN_PERM_COUNTER == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_01");	//(yawning) Great idea.
			MORGAN_PERM_COUNTER = 1;
		}
		else if(MORGAN_PERM_COUNTER == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_02");	//(sleepily) Well, good night then.
			MORGAN_PERM_COUNTER = 2;
		}
		else if(MORGAN_PERM_COUNTER == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_03");	//(tired) With the greatest pleasure.
			MORGAN_PERM_COUNTER = 3;
		}
		else if(MORGAN_PERM_COUNTER == 3)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_Perm_07_04");	//Wake me if anything happens.
			MORGAN_PERM_COUNTER = 0;
		};
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_PICKPOCKET(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 900;
	condition = dia_addon_morgan_pickpocket_condition;
	information = dia_addon_morgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_morgan_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_morgan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_BACK,dia_addon_morgan_pickpocket_back);
	Info_AddChoice(dia_addon_morgan_pickpocket,DIALOG_PICKPOCKET,dia_addon_morgan_pickpocket_doit);
};

func void dia_addon_morgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};

func void dia_addon_morgan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_morgan_pickpocket);
};


instance DIA_ADDON_MORGAN_ANHEUERN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_anheuern_condition;
	information = dia_addon_morgan_anheuern_info;
	important = TRUE;
};


func int dia_addon_morgan_anheuern_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GREGISBACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_anheuern_info()
{
	AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_00");	//Great, now Greg is making me saw planks!
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Anheuern_07_01");	//(sarcastic) Have fun slaughtering monsters!
	};
};


instance DIA_ADDON_MORGAN_HELLO(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 1;
	condition = dia_addon_morgan_hello_condition;
	information = dia_addon_morgan_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_morgan_hello_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == FALSE) && Npc_IsInState(self,zs_talk) && (Npc_IsDead(alligatorjack) == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Hello_15_00");	//Hey you!
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_01");	//(sleepily) Huh? What do you want?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_02");	//(sleepily) Is Alligator Jack back, then?
	AI_Output(self,other,"DIA_Addon_Morgan_Hello_07_03");	//(sleepily) No? Then he'll certainly be here soon. Good night.
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_MEAT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 2;
	condition = dia_addon_morgan_meat_condition;
	information = dia_addon_morgan_meat_info;
	description = "I'm here to deliver some meat.";
};


func int dia_addon_morgan_meat_condition()
{
	if((MIS_ALLIGATORJACK_BRINGMEAT == LOG_RUNNING) && (Npc_HasItems(other,itfomuttonraw) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_meat_info()
{
	var int givenmeat;
	AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_00");	//I'm here to deliver some meat.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_01");	//(waking up) Argh. I need a sip to wake me up.
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_02");	//That's better. So, again - what do you want?
		AI_Output(other,self,"DIA_Addon_Morgan_Meat_15_03");	//I'm here to deliver some meat. From Alligator Jack.
	};
	AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_04");	//I remember. Right! The meat! Give it here.
	givenmeat = Npc_HasItems(other,itfomuttonraw);
	if(givenmeat > 10)
	{
		givenmeat = 10;
	};
	b_giveinvitems(other,self,itfomuttonraw,givenmeat);
	if(givenmeat < 10)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Meat_07_05");	//What, is that all? Ate the rest yourself, huh? Oh well, never mind...
	};
	b_logentry(TOPIC_ADDON_BRINGMEAT,"I have brought Morgan the meat.");
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_ALLIGATORJACK_BRINGMEAT);
};


instance DIA_ADDON_MORGAN_JOB(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 3;
	condition = dia_addon_morgan_job_condition;
	information = dia_addon_morgan_job_info;
	description = "What are you doing here?";
};


func int dia_addon_morgan_job_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_meat))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_job_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Job_15_01");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_01");	//Greg made me commander of one of the two raiding troops.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_02");	//I'm responsible for keeping the camp supplied - Alligator Jack sees to that.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_03");	//I'm also responsible for keeping those beasts you find out here well away from the camp.
	AI_Output(self,other,"DIA_Addon_Morgan_Job_07_04");	//That's what the BOYS do.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Job_07_05");	//I told them I don't want to see a single beast left around here (yawns) when Greg comes back.
	};
};


instance DIA_ADDON_MORGAN_SLEEP(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 4;
	condition = dia_addon_morgan_sleep_condition;
	information = dia_addon_morgan_sleep_info;
	description = "Do you ever do anything yourself?";
};


func int dia_addon_morgan_sleep_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_job))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_sleep_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Sleep_15_00");	//Do you ever do anything yourself?
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_01");	//Hey, none of that lip!
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_02");	//Mine is the most important task of all.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_03");	//I train my people.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_04");	//I make them into the best and most fearless fighters who ever sailed these waters.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_05");	//And it's not like the lads do all that work for nothing.
	AI_Output(self,other,"DIA_Addon_Morgan_Sleep_07_06");	//They get a good-sized bag of gold for their efforts.
};


instance DIA_ADDON_MORGAN_JOINMORGAN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_joinmorgan_condition;
	information = dia_addon_morgan_joinmorgan_info;
	description = "I want to join your troop.";
};


func int dia_addon_morgan_joinmorgan_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_joinmorgan_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_JoinMorgan_15_00");	//I want to join your troop.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_01");	//(laughs) My troop? My troop is hanging out at the beach.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_03");	//Those boys won't lift a finger until the Captain is back, you can count on that.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_04");	//But if you want to show everybody what you're made of, feel free to work on the northern beach.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_05");	//It's full of lurkers and who knows what else.
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_06");	//Take them on by yourself and you'll earn the respect (yawns) of the people...
	AI_Output(self,other,"DIA_Addon_Morgan_JoinMorgan_07_07");	//Welcome to my troop. Ha! I'll go lie back down...
	Log_CreateTopic(TOPIC_ADDON_MORGANBEACH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MORGANBEACH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MORGANBEACH,"Now that I am in Morgan's raiding troop, he wants me to clean the northern beach of beasts.");
	MIS_ADDON_MORGANLURKER = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MORGAN_LURKERPLATT(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 6;
	condition = dia_addon_morgan_lurkerplatt_condition;
	information = dia_addon_morgan_lurkerplatt_info;
	permanent = TRUE;
	description = "The northern beach is all cleared.";
};


func int dia_addon_morgan_lurkerplatt_condition()
{
	if(Npc_IsDead(beachlurker1) && Npc_IsDead(beachlurker2) && Npc_IsDead(beachlurker3) && Npc_IsDead(beachwaran1) && Npc_IsDead(beachwaran2) && (MIS_ADDON_MORGANLURKER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_00");	//The northern beach is all cleared.
	AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_01");	//What about the cave? Have you been there, too?
	if(Npc_IsDead(beachshadowbeast1))
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_02");	//Sure thing.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_03");	//Great. You're a good man.
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_04");	//Here's your reward.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
		b_logentry(TOPIC_ADDON_MORGANBEACH,"The beach is clean. I have done in all the beasts.");
		MIS_ADDON_MORGANLURKER = LOG_SUCCESS;
		b_giveplayerxp(XP_ADDON_MORGAN_LURKERPLATT);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Morgan_LurkerPlatt_15_05");	//Er...
		AI_Output(self,other,"DIA_Addon_Morgan_LurkerPlatt_07_06");	//Well, that's part of it, too. Come back when you're done.
		b_logentry(TOPIC_ADDON_MORGANBEACH,"Morgan also wants me to take care of the cave.");
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_MORGAN_AUFTRAG2(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_auftrag2_condition;
	information = dia_addon_morgan_auftrag2_info;
	permanent = TRUE;
	description = "Is there anything else for me to do?";
};


func int dia_addon_morgan_auftrag2_condition()
{
	if(MIS_ADDON_MORGANLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_auftrag2_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Auftrag2_15_00");	//Is there anything else for me to do?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_01");	//Not at the moment.
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_02");	//Go find yourself a bunk and have a decent bottle of rum!
		CreateInvItems(self,itfo_booze,3);
		b_useitem(self,itfo_booze);
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_03");	//Aaah. This is good stuff.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Auftrag2_07_04");	//You'd better go ask the Captain.
	};
	AI_StopProcessInfos(self);
};


var int morgan_angusstory;

instance DIA_ADDON_MORGAN_FOUNDTHEM(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 7;
	condition = dia_addon_morgan_foundthem_condition;
	information = dia_addon_morgan_foundthem_info;
	permanent = TRUE;
	description = "About Angus and Hank...";
};


func int dia_addon_morgan_foundthem_condition()
{
	if((MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_addon_skip_angushank))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_foundthem_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_00");	//About Angus and Hank...
	if(MORGAN_ANGUSSTORY == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_01");	//Don't remind me of THEM.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_02");	//They probably got themselves killed by pirates.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_03");	//And Angus had my ring on him.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_04");	//Well, sure, it was HIS ring in a way. He won it from me playing dice.
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_05");	//But I would have gotten it back, and now it's GONE!
		MORGAN_ANGUSSTORY = TRUE;
	};
	Info_ClearChoices(dia_addon_morgan_foundthem);
	if(Npc_HasItems(other,itri_addon_morgansring_mission) > 0)
	{
		Info_AddChoice(dia_addon_morgan_foundthem,"I found them.",dia_addon_morgan_foundthem_now);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_06");	//If you find my ring, bring it back to me. I'll certainly make it up to you!
	};
};

func void dia_addon_morgan_foundthem_now()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_01");	//I found them.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_07");	//So tell me already. Where are they?
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_15_03");	//They are dead.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_07_08");	//The ring, what about the ring?
	Info_ClearChoices(dia_addon_morgan_foundthem);
	Info_AddChoice(dia_addon_morgan_foundthem,"Here it is.",dia_addon_morgan_foundthem_givering);
	Info_AddChoice(dia_addon_morgan_foundthem,"They didn't have it.",dia_addon_morgan_foundthem_noring);
};

func void dia_addon_morgan_foundthem_noring()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_15_00");	//They didn't have it.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_01");	//(horrified) What? Go back and look again. They must have had it.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_02");	//It's a small ring with many intricate ornaments.
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_NoRing_07_03");	//You've GOT to find it. You've GOT to!
	Info_ClearChoices(dia_addon_morgan_foundthem);
};

func void dia_addon_morgan_foundthem_givering()
{
	AI_Output(other,self,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_15_00");	//Here it is.
	b_giveinvitems(other,self,itri_addon_morgansring_mission,1);
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_01");	//(happy like a child) Yes, that's it. Good man!
	AI_Output(self,other,"DIA_Addon_Morgan_FOUNDTHEM_GiveRing_07_02");	//Here, take this stone tablet. It may look like a piece of junk, but Garett will shell out a lot of gold for it.
	MIS_ADDON_MORGAN_SEEKTRAITOR = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MORGANSRING);
	Info_ClearChoices(dia_addon_morgan_foundthem);
	b_giveinvitems(self,other,itwr_stoneplatecommon_addon,1);
};


instance DIA_ADDON_MORGAN_FRANCIS(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_francis_condition;
	information = dia_addon_morgan_francis_info;
	description = "What do you think of Francis?";
};


func int dia_addon_morgan_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_morgan_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_00");	//What do you think of Francis?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_01");	//I don't mind him (menacingly) as long as he leaves me alone!
	AI_Output(other,self,"DIA_Addon_Morgan_Francis_15_02");	//Isn't he the boss around here?
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_03");	//(dirty laugh) He THINKS he's the boss.
	AI_Output(self,other,"DIA_Addon_Morgan_Francis_07_04");	//(gloating) But at some point Greg will return, and then Francis gets to go back to sawing planks.
};


instance DIA_ADDON_MORGAN_TRAIN(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 5;
	condition = dia_addon_morgan_train_condition;
	information = dia_addon_morgan_train_info;
	description = "Can you train ME as well?";
};


func int dia_addon_morgan_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_morgan_sleep))
	{
		return TRUE;
	};
};

func void dia_addon_morgan_train_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_TRAIN_15_00");	//Can you train ME as well?
	AI_Output(self,other,"DIA_Addon_Morgan_TRAIN_07_01");	//Sure, I can show you how to fight with one-handed weapons.
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
	MORGAN_ADDON_TEACHPLAYER = TRUE;
};


var int morgan_merke1h;
var int morgan_labercount;

instance DIA_ADDON_MORGAN_TEACH(C_INFO)
{
	npc = pir_1353_addon_morgan;
	nr = 99;
	condition = dia_addon_morgan_teach_condition;
	information = dia_addon_morgan_teach_info;
	permanent = TRUE;
	description = "Teach me!";
};


func int dia_addon_morgan_teach_condition()
{
	if(MORGAN_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_morgan_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Morgan_Teach_15_00");	//Teach me!
	MORGAN_MERKE1H = other.hitchance[NPC_TALENT_1H];
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_back()
{
	if(other.hitchance[NPC_TALENT_1H] > MORGAN_MERKE1H)
	{
		if(MORGAN_LABERCOUNT == 0)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_00");	//Forget all that bullshit about honor and such. Either you kill him, or he kills you.
			MORGAN_LABERCOUNT = 1;
		}
		else if(MORGAN_LABERCOUNT == 1)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_01");	//In the future you must learn to put more strength into your strikes.
			MORGAN_LABERCOUNT = 2;
		}
		else if(MORGAN_LABERCOUNT == 2)
		{
			AI_Output(self,other,"DIA_Addon_Morgan_CommentFightSkill_07_02");	//Ha ha ha, at least you now know how to hold a sword.
			MORGAN_LABERCOUNT = 0;
		};
	}
	else if(other.hitchance[NPC_TALENT_1H] >= 75)
	{
		AI_Output(self,other,"DIA_Addon_Morgan_Teach_Back_07_00");	//If you want to get even better, you'll have to learn from somebody else.
	};
	Info_ClearChoices(dia_addon_morgan_teach);
};

func void dia_addon_morgan_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_addon_morgan_teach_1h_5);
};

func void dia_addon_morgan_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,75);
	Info_ClearChoices(dia_addon_morgan_teach);
	Info_AddChoice(dia_addon_morgan_teach,DIALOG_BACK,dia_addon_morgan_teach_back);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_addon_morgan_teach_1h_1);
	Info_AddChoice(dia_addon_morgan_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_addon_morgan_teach_1h_5);
};

