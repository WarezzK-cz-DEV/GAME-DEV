
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(disbelieving) I can hardly believe it. Are you really a paladin now?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//Obviously.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(euphoric) If someone like you is with the paladins, then Beliar's thugs had better watch out.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//If you did in the Sleeper, that handful of orcs shouldn't be a problem.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//This is not only about the orcs.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//I know, but it's still good to have you on our side.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//Oh well.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//What are you doing here in the monastery? Let me guess. You want to be instructed in the art of magic.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//Perhaps.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//I knew it - best talk to Marduk, he's responsible for you paladins. You'll find him in front of the chapel.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//I can see that the rumors are true.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//What rumors?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//That you joined up with those Dragon hunters.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//Well, you never were a man of the church. Nevertheless, you're fighting for our cause, and that's what counts.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//Is that all?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//I'm glad, of course, and the way you look, every orc is bound to be afraid of you.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//This is not only about the orcs.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//I know, but nonetheless they're a problem. You are important.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//You defeated the Sleeper. We may all need your help some day.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//Oh well.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "How did you get to the monastery so fast?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//How did you get to the monastery so fast?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//What kind of a question is that? I crept through the pass and made my way straight to the monastery.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//Admittedly, it was never easy avoiding all the monsters making themselves at home on this side of the valley, but ultimately I encountered fewer problems than I'd expected.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "Do you know where the others are?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//Do you know where the others are?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//Gorn seems to have coped with his stay in Garond's dungeon very well.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//How did he get out?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//I had to lie to Garond, so that he would drop all the charges.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//But let's keep that between ourselves, understood?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//In any case, he wanted to go to Lee and see what was happening on the farm.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//After the grub they serve in the dungeon, he's probably stuffing his face right now and putting the mercenaries' provisions to a real test.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//Gorn didn't make it.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//Diego mumbled something about a reckoning. No idea what he meant by that.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//But I suspect that he's in the city. You know him - always there where there's something to be had.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//Diego bought it - looks like that Barrier got him after all.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "I need to get into the monastery. It's urgent!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//I need to get into the monastery. It's urgent!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//Yes, sure. Here's the key.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//I can't let you into the monastery. I'll get in trouble with the High Council.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//Without the permission of my superiors, I can't let anyone into the monastery.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"It's important!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"I've got a letter from Lord Hagen.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//It's important!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//It won't work. Pyrokar would rip my head off.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//I've got a letter from Lord Hagen.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//Show me.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(hesitantly) All right. Here's the key to the monastery. Pyrokar is in the church.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "Do you know where Pedro is?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//Do you know where Pedro is?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//Do you think I'd be standing around here if I knew where the renegade was hiding?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//He must pay for his deeds. I hope we manage to get the Eye back.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//You have to help us. Find him and bring back the Eye of Innos.
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "Do you know anything about the hooded figures?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//Do you know anything about the hooded figures?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//No, but I have a bad feeling about those guys.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//Be careful if you run into them.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//Any news?
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//I should be asking you that. We're still very worried here.
	AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//The High Council is trying to find out the enemy's next move.
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//Anything else?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//Lately, you hear more about orc attacks, even outside the Valley of Mines.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//I don't like all this - I don't think we have much time left.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//A farmer reported scaly creatures near his farm.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//I don't know what to make of that, but I think the enemy is planning something.
	}
	else if(MIS_FINDTHEOBESESSED == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//We're getting more and more reports of people possessed. The enemy has become strong, much stronger than I expected.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//No, the situation is still serious. All we can do now is trust in Innos.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "I killed all the dragons.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//I killed all the dragons.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//Really? So there's more than a glimmer of hope on the horizon. Now all we have to do is to cut off the head of Evil.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//If you have indeed done that, then we shall win the war.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//Who, me?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//You, of course. Who else?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//We should set out soon, otherwise it could be too late.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//Hey, I heard you spent a long time in the monastery cellars. What did you find out?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "I know now where the enemy is hiding.";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//I know now where the enemy is hiding. It's a small island, not far from here.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//This is our big chance. We have to set out at once and destroy evil forever.
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//Have you talked to Diego about it? I think he would want to accompany you.
		b_logentry(TOPIC_CREW,"Diego could be a great help. He's never stayed in one place long.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//What about Gorn? Talk to him. I heard that he has returned from the Valley of Mines.
		b_logentry(TOPIC_CREW,"Gorn would certainly be a great help. It can't hurt to have a good fighter at one's side. Maybe he can train me.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//And don't forget Lester. If you don't drag him out of his valley, he'll rot there.
		b_logentry(TOPIC_CREW,"If I don't take Lester along, he'll probably never get out of his valley.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//I also know my role in all this. I can increase your mana and be helpful in constructing runes once we face the enemy. When do we start?
	b_logentry(TOPIC_CREW,"If Milten comes with me, he can teach me to create runes and increase my mana.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//Not so fast, I've already got enough people.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//You know I would go with you. If you change your mind, I'll be here waiting for you.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//Good luck, and may Innos hold his protecting hand over you.
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"I cannot use you at the moment.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"Welcome aboard!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//Welcome aboard!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//We should meet at the harbor. Wait for me there.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//Good. I'll be there when you're ready.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//I cannot use you at the moment.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//You know that I would have stuck with you to the end. If you change your mind, I'll be here waiting for you.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "Where shall I look for a captain?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//Where shall I look for a captain?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//Ask Jorgen. He's a sailor, after all. He should still be in the monastery.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//But if he can't help you, you'll have to look for someone on the farms or in the city who can navigate your ship.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//The best thing to do is talk to Lee or go to the harbor of Khorinis. I can't think of anything better at the moment.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"I might be able to take Jorgen on as captain. He should still be in the monastery. Other than that, there must be other candidates on the farms or in the city. Maybe I should talk to Lee or ask around at the harbor.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "I can't take you along after all.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//I can't take you along after all.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//You know best who can be of use to you. If you change your mind, I'll wait for you in the monastery.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "I need you.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//I need you.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//Your decision honors me. Let's go, we haven't any time to lose.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//I'll go to the harbor. We'll meet there.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "I want to learn some new spells.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//I want to learn some new spells.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//You still haven't reached the second Circle of Magic. I can't teach you anything.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "I want to increase my magic powers.";
};


func int dia_miltennw_mana_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//I want to increase my magic powers.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//Your magic power is great. Too great for me to be able to help you increase it.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

