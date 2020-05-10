
instance DIA_PC_THIEF_DI_EXIT(C_INFO)
{
	npc = pc_thief_di;
	nr = 999;
	condition = dia_pc_thief_di_exit_condition;
	information = dia_pc_thief_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pc_thief_di_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_THIEF_DI_HALLO(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_hallo_condition;
	information = dia_pc_thief_di_hallo_info;
	description = "Here we are.";
};


func int dia_pc_thief_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_hallo_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//Here we are.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//This island is not as far away from Khorinis as I thought.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//I didn't know about it. But now, of course, a few things are becoming clear to me.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//I had always asked myself how the orcs could keep their supplies coming so fast.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//With this outpost, that's a piece of cake.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//On your way to the interior of the island, you are probably going to encounter a trap or two.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//If you think you are stuck at some point, come to me. Maybe my experience can help you.
};


instance DIA_PC_THIEF_DI_RAT(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_rat_condition;
	information = dia_pc_thief_di_rat_info;
	permanent = TRUE;
	description = "I need your advice.";
};


func int dia_pc_thief_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_rat_onetime;
var int dia_pc_thief_di_rat_onetime2;

func void dia_pc_thief_di_rat_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//I need your advice.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//An orcish colonel has his headquarters up there. I can't get any further to the interior of the island from there.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//Orcs are smart creatures. They are often underestimated. I assume they have a secret passage of some sort. Search the walls for secret switches.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//Remember, however, that switches must often be used in a certain order before they have any effect.
	}
	else if(Npc_IsDead(firedragonisland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//I have fought with a dragon, and now I'm facing an abyss with a drawbridge. The bridge has been hauled up, and I cannot get across.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//Mmh. Have you already tried a ranged weapon? Maybe the mechanism could be activated with a shot.
	}
	else if(Npc_IsDead(skeleton_lord_archol) && (Npc_KnowsInfo(other,dia_schwarzmagier_hello) == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//I'm facing a host of undead and their complicated traps.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//I'm sorry, I have no experience with the undead. You're on your own with this one.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//Come see me again when you have a problem which my experience can solve.
		if((ORKSTURMDI == TRUE) && (DIA_PC_THIEF_DI_RAT_ONETIME2 == FALSE))
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//One more thing. I'd rather that you didn't draw all the creatures that crawl around here to the ship. I hope this orc raid was the last attack I had to fend off here!
			b_giveplayerxp(XP_AMBIENT);
			DIA_PC_THIEF_DI_RAT_ONETIME2 = TRUE;
		};
	};
};


instance DIA_DIEGO_DI_TRADE(C_INFO)
{
	npc = pc_thief_di;
	nr = 12;
	condition = dia_diego_di_trade_condition;
	information = dia_diego_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "I need ammunition.";
};


func int dia_diego_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_diego_di_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//I need ammunition.
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//Maybe I can help you.
};


instance DIA_PC_THIEF_DI_TRAINING_TALENTE(C_INFO)
{
	npc = pc_thief_di;
	nr = 10;
	condition = dia_pc_thief_di_training_talente_condition;
	information = dia_pc_thief_di_training_talente_info;
	permanent = TRUE;
	description = "Train me.";
};


func int dia_pc_thief_di_training_talente_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//Train me.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//What is it you need?
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring("Pick locks",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK,1)),dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_1()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//Life will be much easier for you if you always try to stay out of the line of fire.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Pick locks",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_5()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//When you move, always have the litheness of a cat in mind. The rest will follow automatically.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Pick locks",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//For best results, put in a lot of dry practice.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Pick locks",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//To steady your hand, breathe out slowly while you aim.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Pick locks",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_picklock()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//It was high time. It's strange you've never learned this ability before.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"Pick locks",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_di_training_talente);
};


instance DIA_PC_THIEF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_undeaddragondead_condition;
	information = dia_pc_thief_di_undeaddragondead_info;
	permanent = TRUE;
	description = "It's all over. Now we can get out of here.";
};


func int dia_pc_thief_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_undeaddragondead_onetime;

func void dia_pc_thief_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//It's all over. Now we can get out of here.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//Now will you look at this. I've never seen such a construction all my life.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//How in earth did you manage to get past that thing?
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//I was lucky, I suppose.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//(laughs) If you say so.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//Fine.
	};
	if(DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//What are you going to do now?
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//That's a good question. I think I'll go back to Khorinis first.
		if((DIEBESGILDE_VERRATEN == TRUE) || (MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//There's no more thieves' guild there. That opens up some interesting possibilities.
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//Mmh. Or maybe I'll simply take over Bromor's business. There's always money in that. Honest money.
		DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//Go to the captain now and let's get out of here.
	AI_StopProcessInfos(self);
	if(LARES_ISONBOARD != LOG_SUCCESS)
	{
		Npc_ExchangeRoutine(self,"SittingShipDI");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_THIEF_DI_PICKPOCKET(C_INFO)
{
	npc = pc_thief_di;
	nr = 900;
	condition = dia_thief_di_pickpocket_condition;
	information = dia_thief_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_di_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_di_pickpocket_info()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_BACK,dia_thief_di_pickpocket_back);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_PICKPOCKET,dia_thief_di_pickpocket_doit);
};

func void dia_thief_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_di_pickpocket);
};

func void dia_thief_di_pickpocket_back()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
};

