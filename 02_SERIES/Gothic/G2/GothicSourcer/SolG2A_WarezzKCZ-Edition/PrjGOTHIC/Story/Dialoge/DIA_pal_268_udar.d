
instance DIA_UDAR_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_exit_condition;
	information = dia_udar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_HELLO(C_INFO)
{
	npc = pal_268_udar;
	nr = 2;
	condition = dia_udar_hello_condition;
	information = dia_udar_hello_info;
	important = TRUE;
};


func int dia_udar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_udar_hello_info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//You had damned luck when you came in. I very nearly shot you.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//Then I guess I should be glad that you have such keen eyesight.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//Save your breath. Talk to Sengrath if you want something.
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_YOUAREBEST(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_youarebest_condition;
	information = dia_udar_youarebest_info;
	permanent = FALSE;
	description = "I heard that you are the BEST crossbowman...";
};


func int dia_udar_youarebest_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_udar))
	{
		return 1;
	};
};

func void dia_udar_youarebest_info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//I heard that you are the BEST crossbowman far and wide.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//If they say so, it must be true. What do you want?
};


instance DIA_UDAR_TEACHME(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teachme_condition;
	information = dia_udar_teachme_info;
	permanent = FALSE;
	description = "Teach me how to shoot a crossbow..";
};


func int dia_udar_teachme_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest) && (UDAR_TEACHPLAYER != TRUE))
	{
		return 1;
	};
};

func void dia_udar_teachme_info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//Teach me how to shoot a crossbow..
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//Scram! There are enough targets running around outside the castle. Practice on them.
};


instance DIA_UDAR_IMGOOD(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_imgood_condition;
	information = dia_udar_imgood_info;
	permanent = FALSE;
	description = "I am the greatest.";
};


func int dia_udar_imgood_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest))
	{
		return 1;
	};
};

func void dia_udar_imgood_info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//I am the greatest.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(laughing) You're all right!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//Well, if you want to learn, then I'll help you.
	UDAR_TEACHPLAYER = TRUE;
	b_logentry(TOPIC_TEACHER_OC,"Udar can teach me to use a crossbow.");
};


instance DIA_UDAR_TEACH(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teach_condition;
	information = dia_udar_teach_info;
	permanent = TRUE;
	description = "I want to learn from you.";
};


func int dia_udar_teach_condition()
{
	if(UDAR_TEACHPLAYER == TRUE)
	{
		return 1;
	};
};

func void dia_udar_teach_info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//I want to learn form you.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//Okay, fire away!
	Info_ClearChoices(dia_udar_teach);
	Info_AddChoice(dia_udar_teach,DIALOG_BACK,dia_udar_teach_back);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_udar_teach_crossbow_1);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_udar_teach_crossbow_5);
};

func void dia_udar_teach_back()
{
	Info_ClearChoices(dia_udar_teach);
};

func void b_udar_teachnomore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//You already know the basics - we don't have time for more.
};

func void b_udar_teachnomore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//To improve your handling of the weapon, you should look for a proper teacher.
};

func void dia_udar_teach_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_udar_teach_crossbow_1);
};

func void dia_udar_teach_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_udar_teach_crossbow_5);
};


instance DIA_UDAR_PERM(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_perm_condition;
	information = dia_udar_perm_info;
	permanent = FALSE;
	description = "How are things in the castle?";
};


func int dia_udar_perm_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_udar_perm_info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//How are things in the castle?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//A few of the boys are practicing, but in principle we're all just waiting for something to happen.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//This uncertainty is wearing us down. That's the strategy of those blasted orcs. They'll wait until our nerves are shot.
};


instance DIA_UDAR_RING(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_ring_condition;
	information = dia_udar_ring_info;
	permanent = FALSE;
	description = "Here, I bring you Tengron's ring...";
};


func int dia_udar_ring_condition()
{
	if(Npc_HasItems(other,itri_tengron) >= 1)
	{
		return TRUE;
	};
};

func void dia_udar_ring_info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//Here, I bring you Tengron's ring. It's supposed to protect you. Tengron sys he'll come and get it once he's back.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//What? Do you know what ring that is? He got that ring as an award for his courage in battle.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//You say he wants to get it back? If it's the will of Innos, he is going to. If it's the will of Innos...
	b_giveinvitems(other,self,itri_tengron,1);
	TENGRONRING = TRUE;
	b_giveplayerxp(XP_TENGRONRING);
};


instance DIA_UDAR_KAP4_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap4_exit_condition;
	information = dia_udar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP4WIEDERDA(C_INFO)
{
	npc = pal_268_udar;
	nr = 40;
	condition = dia_udar_kap4wiederda_condition;
	information = dia_udar_kap4wiederda_info;
	important = TRUE;
};


func int dia_udar_kap4wiederda_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4wiederda_info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//It's good that you've come. All hell is breaking loose here.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//What happened?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//The Dragon hunters are strutting around here in the castle and bragging that they can solve the dragon problem.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//But I'll tell you what, the way they look, they won't even kill a sick, old snapper.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//A lot of us are getting really worried by now and no longer truly believe that we'll ever make it out of here alive.
};


instance DIA_UDAR_SENGRATH(C_INFO)
{
	npc = pal_268_udar;
	nr = 41;
	condition = dia_udar_sengrath_condition;
	information = dia_udar_sengrath_info;
	description = "Weren't there two of you sentinels up here?";
};


func int dia_udar_sengrath_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_kap4wiederda) && (SENGRATH_MISSING == TRUE))
	{
		return TRUE;
	};
};

func void dia_udar_sengrath_info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//Weren't there two of you sentinels up here?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//Not any more. Sengrath stood here on the battlements when suddenly he fell asleep.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//His good crossbow fell down when that happened.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//We could only just see one of the orcs snatch it up and disappear with it into the darkness.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//Sengrath woke up then and just ran into the night towards the Orc palisades. He hasn't come back since.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//Innos be with us!
	Log_CreateTopic(TOPIC_SENGRATH_MISSING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SENGRATH_MISSING,LOG_RUNNING);
	b_logentry(TOPIC_SENGRATH_MISSING,"Udar, the guardsman at the castle, misses his pal Sengrath. The last time he saw him was late one night, and he was heading for the orc fence to get back his crossbow.");
};


instance DIA_UDAR_SENGRATHGEFUNDEN(C_INFO)
{
	npc = pal_268_udar;
	nr = 42;
	condition = dia_udar_sengrathgefunden_condition;
	information = dia_udar_sengrathgefunden_info;
	description = "I've found Sengrath.";
};


func int dia_udar_sengrathgefunden_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_sengrath) && Npc_HasItems(other,itrw_sengrathsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_udar_sengrathgefunden_info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//I've found Sengrath.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//Really? Where is he?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//He's dead. Here's his crossbow. He had it with him.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//He must have gotten his crossbow back, but then the orcs seem to have slain him after all.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//Damn fool. I knew it. We're all going to die.
	TOPIC_END_SENGRATH_MISSING = TRUE;
	b_giveplayerxp(XP_SENGRATHFOUND);
};


instance DIA_UDAR_BADFEELING(C_INFO)
{
	npc = pal_268_udar;
	nr = 50;
	condition = dia_udar_badfeeling_condition;
	information = dia_udar_badfeeling_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_udar_badfeeling_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_udar_sengrathgefunden) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_udar_badfeeling_info()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//Another underhanded attack like that and we're history.
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//The orcs are very worried. Something's given them a hell of a scare. I can feel it.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//I've got a really bad feeling about this.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_UDAR_KAP5_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap5_exit_condition;
	information = dia_udar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_udar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP6_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap6_exit_condition;
	information = dia_udar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_udar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_PICKPOCKET(C_INFO)
{
	npc = pal_268_udar;
	nr = 900;
	condition = dia_udar_pickpocket_condition;
	information = dia_udar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_udar_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_udar_pickpocket_info()
{
	Info_ClearChoices(dia_udar_pickpocket);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_BACK,dia_udar_pickpocket_back);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_PICKPOCKET,dia_udar_pickpocket_doit);
};

func void dia_udar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_udar_pickpocket);
};

func void dia_udar_pickpocket_back()
{
	Info_ClearChoices(dia_udar_pickpocket);
};

