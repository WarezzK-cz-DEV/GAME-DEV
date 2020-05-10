
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_hallo_info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//(grumpy) What do you want from me?
};


instance DIA_TORLOF_WANNAJOIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 2;
	condition = dia_torlof_wannajoin_condition;
	information = dia_torlof_wannajoin_info;
	permanent = FALSE;
	description = "I want to join the mercenaries!";
};


func int dia_torlof_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_torlof_wannajoin_info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//I want to join the mercenaries!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Oh? And why do you think I should be in favor of you being accepted here?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "Put me to the test!";
};


func int dia_torlof_probe_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_wannajoin) && (hero.guild == GIL_NONE) && (TORLOF_GO == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_probe_info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Put me to the test!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Did Lee send you to me?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//He said you would help me.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//(sigh) Fine. So here we go: There are two things you have to do before you can join us.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//First: You have to prove that you're capable of mastering the tasks that you will have to fulfill as a mercenary. I'll put you to the test.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//And second: You have to earn the respect of the other mercenaries.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"To be accepted as a mercenary, I have to let Torlof put me to the test and earn the respect of the other mercenaries.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//No.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Then what are you blathering at me for?
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_RESPEKT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 4;
	condition = dia_torlof_respekt_condition;
	information = dia_torlof_respekt_info;
	permanent = FALSE;
	description = "How can I earn the respect of the other mercenaries? ";
};


func int dia_torlof_respekt_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_respekt_info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//How can I earn the respect of the other mercenaries?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//For most of them, it will be enough if you fulfill your task and pass my test.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//But you'll have to find some other way of convincing some of them.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Some will try and exploit your situation, and others may not like your mug.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//You should try to get along with as many of the boys as possible - but if nothing else helps, you can always take part in a duel.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//If you win, you'll earn the respect of most of them. But watch out that you don't kill one of them by accident. Because then you'll have a big problem.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"If I want the other mercenaries to respect me, I have to pass the test Torlof sets me. They'll also be convinced if I can beat them in a duel.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "What are the rules for a duel?";
};


func int dia_torlof_duellregeln_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_respekt) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_torlof_duellregeln_info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//What are the rules for a duel?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Quite simple. Both opponents have to have the opportunity to draw their weapons before the first blow.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//You can't just go and belt one of the men without warning.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//There has to be some sort of spoken challenge. An insult, or another reason to fight.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//None of the other men will interfere in a fight like that. Unless one of the two gets killed in the duel.
	b_logentry(TOPIC_SLDRESPEKT,"The rules for a duel: A duel must be started with a challenge, that way no one else will get involved. There must be no killing in a duel.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "What about you? Will you vote me in?";
};


func int dia_torlof_deinestimme_condition()
{
	if((TORLOF_GO == TRUE) && (other.guild == GIL_NONE) && (MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_torlof_deinestimme_info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//What about you? Will you vote me in?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//If you can prove that you can fulfill the duties of a mercenary, yes.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "How's my reputation among the mercenaries?";
};


func int dia_torlof_ruf_condition()
{
	if((TORLOF_GO == TRUE) && (TORLOF_GENUGSTIMMEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_ruf_info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//How's my reputation among the mercenaries?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Let's see...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Wolf says he has nothing against you joining.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Jarvis thinks you're on the right side.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Jarvis still isn't sure if you're on the right side.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//He doesn't want more people dancing to Sylvio's tune. For that matter, neither do I.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Cord thinks you would be good enough to join.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//It's Cord's opinion that you first need to learn how to handle weapons better.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Cipher says that for him it was crystal clear that you'd get to join. Something seems to have made him really happy.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Cipher says you owe him a little favor, and that you know what that's all about.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Rod just wants to have his sword back.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//You seem to have convinced Rod that you're strong enough.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Rod thinks you're a weakling.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Sentenza will vote for you. He says you were a very reasonable man.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Sentenza won't vote for you. He says you still owe him 50 gold pieces.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Raoul is against you. I think he can't stand you.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//I don't need to say anything about Sylvio and Bullco. Those two morons are against everyone.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Buster says you're okay.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//Although you lost to him.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Buster said you chickened out when he challenged you.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//That's not a good idea. Maybe you should go back to the outpost and challenge him.
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//And Dar says you're a blabbermouth. But his vote doesn't count for very much here.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//The rest of the mercenaries haven't said anything.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Most of them are just waiting to see if you pass the test.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//You convinced most of them by passing the test.
		if(CORD_RANGERHELP_TORLOFSPROBE == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Torlof_RUF_01_00");	//(grins) Even if Cord had a little hand in it...
			POINTS_SLD = POINTS_SLD + 4;
		}
		else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//Although a lot of them say that getting a farmer to pay his rent was too easy for a test.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//You have my vote, in any case.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//And you won some fair duels.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//A lot of mercenaries respect that.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//At any rate, you won some fair duels already.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Most of the mercenaries are for you - as far as we're concerned, you can start with us any time.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//Go to Lee. He'll explain everything else to you.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"I've earned enough respect from the mercenaries. Now I should have a word with Lee.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//That's quite a lot, but it still isn't enough.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//You'll have to keep fighting with the boys for a while.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//You're far from done, kid. If you want us to accept you, you'll have to do something for it.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "What are my duties as a mercenary?";
};


func int dia_torlof_aufgaben_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_aufgaben_info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//What are my duties as a mercenary?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Onar hired us for two reasons: He wants us to keep the militia off his back, and he wants us to keep things in order on his farms.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//That includes collecting the rent when the small farmers won't pay.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//So, what'll it be?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"Let me collect the rent!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"I'll deal with the militia, don't worry!",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Good. Listen. The farmer Sekob hasn't paid his rent to Onar for weeks.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Onar wants him to cough up 50 gold pieces. Any questions?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Where is Sekob's farm?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//In the north of the valley. Looking from here, that's to the right at the big crossroad.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//If you have problems, the farmers in the fields will help you find your way around the area.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"Torlof has tasked me to collect the rent from the farmer Sekob. He's got to pay 50 pieces of gold.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//The farmer Bengar has complained that lately the militia from the city has been getting on his nerves.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//They're pressuring the farmer - probably trying to make him break with Onar.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//I want you to go to his farm and make it clear to the militia that they have no business there! Questions?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//How can I find Bengar's farm?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//In the southwest of the valley is a big stairway that leads to a high plain. That's where Bengar's farm is.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//If you get lost, ask the farmers in the fields how to find your way around the area.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"Torlof has tasked me to drive away the militia from farmer Bengar's farm. It's on the high plain.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Let me collect the rent!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//I'll deal with the militia, don't worry!
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//You took an awfully long time there. Onar won't be very happy.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//And it's all the same to him if the paladins get eaten in the Valley of Mines or not...
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Well done! When I have something new, I'll let you know.
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "I collected the rent from Sekob.";
};


func int dia_torlof_sekobsuccess_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		if((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))
		{
			return TRUE;
		};
	};
};

func void dia_torlof_sekobsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//I collected the rent from Sekob.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//And? Did he pay willingly?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//Well, he had a deadly accident...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//I had to convince him first.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Well done! You passed your test. That will convince a lot of the mercenaries that you have what it takes.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"I have completed the task Torlof gave me.");
		TORLOF_PROBEBESTANDEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//And? Did you blow it on booze? Bring me the money! And be quick about it!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "I took care of Bengar's militia problem.";
};


func int dia_torlof_bengarsuccess_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick))
	{
		return TRUE;
	};
};

func void dia_torlof_bengarsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//I took care of Bengar's militia problem.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Did you make sure that they won't be standing on his doorstep again tomorrow?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//They'd have a really hard time doing that...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Well done!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//You passed your test. If you can handle the militia, most here will respect you.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"I have completed the task Torlof gave me.");
	TORLOF_PROBEBESTANDEN = TRUE;
};


instance DIA_TORLOF_WELCOME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_welcome_condition;
	information = dia_torlof_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_welcome_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_welcome_info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Welcome to the mercenaries, kid!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Thanks!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//As soon as I have something for you to do, I'll let you know.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Where have you been?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//I was in the Valley of Mines! There are dragons there! They gave the paladins a pretty hard time!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//So? Then there really is something to the stories!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Lee will be interested...
	TORLOF_KNOWSDRAGONS = TRUE;
};


instance DIA_TORLOF_THEOTHERMISSION(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_theothermission_condition;
	information = dia_torlof_theothermission_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_theothermission_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_torlof_theothermission_info()
{
	if((TORLOF_KNOWSDRAGONS == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		b_torlof_dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Good thing you're here. I've got something for you to do...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//What is it?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//And see to it that you finish by tomorrow!
	TORLOF_THEOTHERMISSION_DAY = Wld_GetDay();
};


instance DIA_TORLOF_DRAGONS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 12;
	condition = dia_torlof_dragons_condition;
	information = dia_torlof_dragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_dragons_condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (KAPITEL <= 3) && (other.guild == GIL_SLD) && (TORLOF_KNOWSDRAGONS == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_dragons_info()
{
	b_torlof_dragons();
};


instance DIA_TORLOF_WHATCANYOUTEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 140;
	condition = dia_torlof_whatcanyouteach_condition;
	information = dia_torlof_whatcanyouteach_info;
	permanent = FALSE;
	description = "Can you help me improve my abilities?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Can you help me improve my abilities?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//I could show you how you can use your strength better in close combat.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//A lot of fighters are very weak because they don't have the technique to use their strength properly.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//The same is true for dexterity and ranged weapons.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Torlof can help me improve my dexterity and strength.");
};


var int torlof_merke_str;
var int torlof_merke_dex;

instance DIA_TORLOF_TEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 150;
	condition = dia_torlof_teach_condition;
	information = dia_torlof_teach_info;
	permanent = TRUE;
	description = "I want to improve my abilities!";
};


func int dia_torlof_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_whatcanyouteach))
	{
		return TRUE;
	};
};

func void dia_torlof_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//I want to improve my abilities!
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE))
	{
		TORLOF_MERKE_STR = other.attribute[ATR_STRENGTH];
		TORLOF_MERKE_DEX = other.attribute[ATR_DEXTERITY];
		Info_ClearChoices(dia_torlof_teach);
		Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_teach_dex_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_teach_dex_5);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_teach_str_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_teach_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//I said I COULD help you, not that I WOULD.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//As long as you aren't one of us, you can find someone else to instruct you!
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Good! Now you can use your abilities better!
	};
	Info_ClearChoices(dia_torlof_teach);
};

func void dia_torlof_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_torlof_teach_str_5);
};


instance DIA_TORLOF_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap3_exit_condition;
	information = dia_torlof_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_torlof_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DEMENTOREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dementoren_condition;
	information = dia_torlof_dementoren_info;
	description = "Have you got something for me to do?";
};


func int dia_torlof_dementoren_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_torlof_dementoren_info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//Have you got something for me to do?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Have you seen those black-hooded guys creeping by here? Those people give me the willies, I'll tell you.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//When I was at sea, I saw some pretty curious things, but those fellows really scare me.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//They went in the direction of the bandit camp in the mountains at the southern end of the valley.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Maybe you should go there to check on those guys, and do away with them!
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"There are supposed to be some of those black-hooded guys at the bandits' camp in the mountains in the south of the valley. They give Torlof heartburn. I'm to solve that problem for him.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "The black-hooded men in the mountains are no longer with us.";
};


func int dia_torlof_dmtsuccess_condition()
{
	if((MIS_TORLOF_DMT == LOG_RUNNING) && Npc_IsDead(castleminedmt))
	{
		return TRUE;
	};
};

func void dia_torlof_dmtsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//The black-hooded men in the mountains are no longer with us.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//You were able to deal with them? Good man!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//I didn't trust those guys one bit. They were bound to cause a lot of trouble...
	MIS_TORLOF_DMT = LOG_SUCCESS;
	b_giveplayerxp(XP_TORLOF_DMT);
};


instance DIA_TORLOF_KAP4_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap4_exit_condition;
	information = dia_torlof_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_torlof_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_WOISTSYLVIO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 40;
	condition = dia_torlof_woistsylvio_condition;
	information = dia_torlof_woistsylvio_info;
	description = "Some of the mercenaries have left?";
};


func int dia_torlof_woistsylvio_condition()
{
	if((MIS_READYFORCHAPTER4 == TRUE) || (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_torlof_woistsylvio_info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Some of the mercenaries have left?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Sylvio took a few of the boys and disappeared over the pass.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//It's rumored that some dragons have shown up there. When he heard that, there was no stopping him.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Who knows? A dragon trophy is sure to bring a ton of money on the open market.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//That's nothing for me. I'm a sailor. I belong on the sea and not in a stuffy dragon's den.
};


instance DIA_TORLOF_KAP5_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap5_exit_condition;
	information = dia_torlof_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_torlof_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_BEMYCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 51;
	condition = dia_torlof_bemycaptain_condition;
	information = dia_torlof_bemycaptain_info;
	description = "You're a sailor?";
};


func int dia_torlof_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//You're a sailor?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//Did you finally catch on to that? Aye, damnit, I'm a sailor. Why do you ask?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//I could use your abilities. I need to go to an island.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(laughs) To an island? You don't even have a ship, let alone a crew to man her.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//No, my boy. If you want to engage my services as a captain and strength teacher, then first you'll have to prove to me that you know what you're talking about.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Besides which, I already have other worries. The paladins haven't pulled out of the city as expected.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Something serious will have to happen to get them to clear the field.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//Go to the castle in the Valley of Mines. Steal the key for the main gate from the gate guard and open it. The orcs will take care of the rest!
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Before Torlof will accept the post of captain, I must get the paladins to leave the city. He said to arrange an incident in the castle in the Valley of Mines. He wants me to steal the key to the main gate from the gate guard and let the orcs into the castle. He hopes that will make the paladins leave the city to help their comrades.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "The gate to the castle in the Valley of Mines is open...";
};


func int dia_torlof_bemycaptain2_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_torlof_bemycaptain))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//The gate to the castle in the Valley of Mines is open and jammed. There's nothing to keep the orcs from storming the castle now.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//The paladins in the castle have suffered some heavy losses against the orcs.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//It won't be long now, I guess, before the paladins from the city advance to the Valley of Mines to get their boys out of the castle.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//That's pleasant news. So now there's nothing to prevent me from escaping from this accursed region.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "Now will you help me get to the island?";
};


var int torlof_paidtobecaptain;

func int dia_torlof_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_bemycaptain2) && (TORLOF_PAIDTOBECAPTAIN == FALSE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Now will you help me get to the island?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//Oh, yeah. You wanted to go to an island. Mmh. I'll make you a suggestion.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//You pay me 2500 gold coins and I'll captain your ship.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//For that, I'll also teach you strength and dexterity wherever you want to go.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"That's an awful lot of gold.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"All right. Here's your gold.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//That's an awful lot of gold.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//Well. Good help is expensive. You don't have any other choice. You won't find anyone else in this area to captain your ship.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//So pay the money and don't make any trouble.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"Torlof is now willing to command the ship. Unfortunately, he wants a reward of 2500 pieces of gold.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//All right. Here's your gold.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//Wonderful. Now you just have to tell me exactly what I'm supposed to do.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"Now that I've given him 2500 pieces of gold, Torlof is prepared to come with me at last.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Are you trying to fob me off with a few coins? First get the money. Then we'll see.
	};
	Info_ClearChoices(dia_torlof_bemycaptain3);
};


instance DIA_TORLOF_BEMYCAPTAIN4(C_INFO)
{
	npc = sld_801_torlof;
	nr = 54;
	condition = dia_torlof_bemycaptain4_condition;
	information = dia_torlof_bemycaptain4_info;
	permanent = TRUE;
	description = "Be my captain.";
};


func int dia_torlof_bemycaptain4_condition()
{
	if((SCGOTCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain4_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Be my captain.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//All right. Get me a ship and a sufficiently strong crew, and I'll take you to your damned island.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//Do you have a nautical chart? We won't get far without one of those things.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//I'll take care of all that. I'll see you at the harbor.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//I can't wait to see how you do that.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	TORLOFISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_TORLOF_LOSFAHREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_losfahren_condition;
	information = dia_torlof_losfahren_info;
	permanent = TRUE;
	description = "Let's set out for the island.";
};


func int dia_torlof_losfahren_condition()
{
	if((TORLOFISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_losfahren_info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Let's set out for the island.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//All right. Give me the chart and we're off.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(calls) All hands on board.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Make sure you really have everything you might need with you. There's no way back.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//If you're sure, then go bunk down in the captain's cabin. The journey will take a while.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//No ship, no crew, no sea chart, no trip, my friend.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//I want to see at least 5 men, willing and able to sail a ship.
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_perm5_notcaptain_condition;
	information = dia_torlof_perm5_notcaptain_info;
	permanent = TRUE;
	description = "I've decided on a different captain.";
};


func int dia_torlof_perm5_notcaptain_condition()
{
	if((SCGOTCAPTAIN == TRUE) && (TORLOFISCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//I've decided on a different captain. You can return my money now.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//Wouldn't you like that. Nothing doing. If you pay me first and then don't want my services after all, that's your problem.
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_KAP6_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap6_exit_condition;
	information = dia_torlof_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_torlof_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof;
	nr = 900;
	condition = dia_torlof_pickpocket_condition;
	information = dia_torlof_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_pickpocket);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_BACK,dia_torlof_pickpocket_back);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_PICKPOCKET,dia_torlof_pickpocket_doit);
};

func void dia_torlof_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_pickpocket);
};

func void dia_torlof_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_pickpocket);
};

