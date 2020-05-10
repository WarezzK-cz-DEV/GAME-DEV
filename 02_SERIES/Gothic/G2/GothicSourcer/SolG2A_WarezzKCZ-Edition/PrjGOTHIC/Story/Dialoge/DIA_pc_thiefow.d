
instance DIA_DIEGOOW_EXIT(C_INFO)
{
	npc = pc_thiefow;
	nr = 999;
	condition = dia_diegoow_exit_condition;
	information = dia_diegoow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegoow_exit_condition()
{
	return TRUE;
};

func void dia_diegoow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGOOW_HALLO(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_diegoow_hallo_condition;
	information = dia_diegoow_hallo_info;
	important = TRUE;
};


func int dia_diegoow_hallo_condition()
{
	return TRUE;
};

func void dia_diegoow_hallo_info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//Hey, I thought you were dead.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//Yes... so I was.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//But now I'm back, and looking for proof of the arrival of the dragons.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//Who are you doing that for?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//I work for Lord Hagen. With the help of the paladins, the dragons can be stopped.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//The paladins? Let me tell you something. After I managed to flee from here, I went to Khorinis.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//I wanted to warn the paladins about the dragons. Heaven knows why I even tried.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//That puffed-up Lothar didn't even listen to me - and certainly didn't let me talk to Lord Hagen.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//Instead, they sent me back here with the expedition. So don't talk to me about paladins...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//The important thing is to stop the dragons as long as there's still time - no matter who helps us achieve that.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//Stop them? We should get our asses out of this valley as long as we still have time for THAT.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//Say - how did you manage to get across the pass? I thought that it was swarming with orcs.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//There is a path through the abandoned mine which isn't held by orcs.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//That's good to know. Then I will head for Khorinis before long - I've got a few old accounts to settle there.
};


instance DIA_DIEGOOW_BEWEISE(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_beweise_condition;
	information = dia_diegoow_beweise_info;
	description = "Listen, I need this proof.";
};


func int dia_diegoow_beweise_condition()
{
	return TRUE;
};

func void dia_diegoow_beweise_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//Listen, I need this proof.
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//All right, I'll help you if I can. But I'm not going to stick my neck out for anyone.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//All right, if that's your mission - go talk to Commander Garond.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//If anyone knows anything about the dragon attacks, it will be the boys in the castle.
	};
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//I'm traveling on behalf of Garond. He needs to know how much ore has been mined so far.
		AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//And then he will give you the proof you want?
		AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//That's right. So - can you tell me anything about it?
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Garond_11_01");	//And while you're in the castle, you can tell Garond something that should interest him a lot:
	};
	if(Npc_GetDistToWP(self,"LOCATION_02_05") <= 1000)
	{
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//There are FOUR chests of ore here in the back of the cave. Silvestro's people mined them.
		AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//Garond is welcome to come and get them - but I won't be here then.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_01");	//In the cave close to where I hid he'll find the FOUR crates of ore. Silvestro's men mined them.
		AI_Output(self,other,"DIA_Addon_DiegoOw_Silvestro_11_02");	//Garond is welcome to go and get them. I have no use for them anyway.
	};
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"Diego has brought FOUR crates of ore mined by Silvestro's scrapers to safety.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "How did you come by the ore?";
};


func int dia_diegoow_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_beweise))
	{
		return TRUE;
	};
};

func void dia_diegoow_mine_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//How did you come by the ore?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//I was with Silvestro's group. We had been prospecting for several days when Silvestro suddenly became nervous.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//He said that we should take the ore to a safe place.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//Well, since I was planning to skedaddle anyway, I volunteered to hide the ore.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//And that was lucky for me. Because the scrapers met with a few minecrawlers. And none of them survived.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 4;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "What about the two dead knights...";
};


func int dia_diegoow_ritter_condition()
{
	if((Npc_HasItems(pal_leiche4,itmi_oldcoin) == 0) || (Npc_HasItems(pal_leiche5,itmi_oldcoin) == 0))
	{
		return TRUE;
	};
};

func void dia_diegoow_ritter_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//What about the two dead knights in front of your hideout?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//They met their doom during a fight with a group of snappers.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//Well, the Valley of Mines has its own rules. I told them so. But they wouldn't listen to me.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 5;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = FALSE;
	description = "What do I need to know about the valley?";
};


func int dia_diegoow_perm_condition()
{
	return TRUE;
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//What do I need to know about the valley?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//Since the fall of the Barrier, a few things have changed around here. The orcs are now in charge.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//We humans are nothing but fodder for the true rulers of the valley: the dragons.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//Stay away from anything that is stronger than you - and avoid everything that resembles a dragon.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 6;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "I want to buy Gorn his freedom...";
};


func int dia_diegoow_gorn_condition()
{
	if(MIS_RESCUEGORN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_diegoow_gorn_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//I want to buy Gorn his freedom, but Garond is asking 1000 pieces of gold.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//A tidy sum of gold. I've got 300 gold pieces on me, you can take them. The rest is up to you.
	b_giveinvitems(self,other,itmi_gold,300);
	b_logentry(TOPIC_RESCUEGORN,"Diego has paid 300 pieces of gold to help free Gorn.");
};


var int diego_merkedex;
var int diego_merkestr;

instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 100;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_01");	//Sure, what would you like to know?
	DIEGO_MERKEDEX = other.attribute[ATR_DEXTERITY];
	DIEGO_MERKESTR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > DIEGO_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_02");	//You have gained a little dexterity already.
	};
	if(other.attribute[ATR_STRENGTH] > DIEGO_MERKESTR)
	{
		AI_Output(self,other,"DIA_Addon_DiegoOw_Teach_11_03");	//(appraisingly) Good. Your strength has increased.
	};
	Info_ClearChoices(dia_diegoow_teach);
};

func void dia_diegoow_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_HIGH);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegoow_teachstr_5);
};

func void dia_diegoow_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_HIGH);
	Info_ClearChoices(dia_diegoow_teach);
	Info_AddChoice(dia_diegoow_teach,DIALOG_BACK,dia_diegoow_teach_back);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_diegoow_teachdex_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_diegoow_teachdex_5);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_diegoow_teachstr_1);
	Info_AddChoice(dia_diegoow_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_diegoow_teachstr_5);
};


instance DIA_THIEFOW_PICKPOCKET(C_INFO)
{
	npc = pc_thiefow;
	nr = 900;
	condition = dia_thiefow_pickpocket_condition;
	information = dia_thiefow_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thiefow_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thiefow_pickpocket_info()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_BACK,dia_thiefow_pickpocket_back);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_PICKPOCKET,dia_thiefow_pickpocket_doit);
};

func void dia_thiefow_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thiefow_pickpocket);
};

func void dia_thiefow_pickpocket_back()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
};


instance DIA_ADDON_THIEFOW_TOGETHER(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_addon_thiefow_together_condition;
	information = dia_addon_thiefow_together_info;
	description = "Let's go together.";
};


func int dia_addon_thiefow_together_condition()
{
	return TRUE;
};

func void dia_addon_thiefow_together_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_Together_15_00");	//Let's go together.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_01");	//To the pass? Why not...
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_02");	//You go first. You've only just come from there.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_03");	//But don't even think about going too close to the castle, or to the orc wall.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_04");	//Also, we need to avoid all fortified camps of the paladins.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_05");	//I have just escaped from one, and I don't intend to go back to toiling in one of the mines.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_06");	//And it goes without saying that we're not going near any dragons.
	AI_Output(self,other,"DIA_Addon_Diego_Together_11_07");	//Let me know when you're ready.
};


instance DIA_ADDON_THIEFOW_COMEON(C_INFO)
{
	npc = pc_thiefow;
	nr = 12;
	condition = dia_addon_thiefow_comeon_condition;
	information = dia_addon_thiefow_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_thiefow_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && Npc_KnowsInfo(other,dia_addon_thiefow_together) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_ComeOn_15_00");	//Come with me.
	if(c_diegotoofar(0))
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_01");	//That's the wrong direction!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_ComeOn_11_02");	//All right.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_THIEFOW_GOHOME(C_INFO)
{
	npc = pc_thiefow;
	nr = 13;
	condition = dia_addon_thiefow_gohome_condition;
	information = dia_addon_thiefow_gohome_info;
	permanent = TRUE;
	description = "Wait here.";
};


func int dia_addon_thiefow_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_WarteHier_15_00");	//Wait here!
	if(Npc_GetDistToWP(self,"LOCATION_02_05") < 2000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_01");	//Okay.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else if(Npc_GetDistToWP(self,"DT_E1_04") < (1500 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_02");	//I'll wait by the tower outside.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"XARDAS");
	}
	else if(Npc_GetDistToWP(self,"OW_NEWMINE_11") < (4000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_03");	//I'll wait near the mine.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"FAJETH");
	}
	else if(Npc_GetDistToWP(self,"OW_MINE3_OUT") < (1200 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_04");	//I'll wait in front of the mine.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"SILVESTRO");
	}
	else if(Npc_GetDistToWP(self,"OW_PATH_266") < (3000 + 1000))
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_05");	//I'll wait close by.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"GRIMES");
	}
	else if(Npc_GetDistToWP(self,"LOCATION_02_05") < 15000)
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_06");	//No. I'm going back to the cave.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_07");	//Come and see me when you're done here.
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_08");	//But don't wait too long, or I'm going back by myself.
		AI_StopProcessInfos(self);
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		Npc_ExchangeRoutine(self,"START");
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_09");	//You've got to be kidding. We're supposed to split up? Here?
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_10");	//Over my dead body!
		AI_Output(self,other,"DIA_Addon_Diego_GoHome_11_11");	//We're going to the pass now - together.
	};
};

func void b_addon_diego_willwaitoutside()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_00");	//Go ahead and take a look around - I'll be waiting outside.
};

func void b_addon_diego_passotherdirection()
{
	AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_01");	//To get to the pass, we'll have to go in the other direction.
};


var int diego_toofarcomment;
var int diego_burgvariation;
var int diego_fajethvariation;
var int diego_silvestrovariation;
var int diego_grimesvariation;
var int diego_xardasvariation;
var int diego_icevariation;

instance DIA_ADDON_THIEFOW_TOOFAR(C_INFO)
{
	npc = pc_thiefow;
	nr = 14;
	condition = dia_addon_thiefow_toofar_condition;
	information = dia_addon_thiefow_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_thiefow_toofar_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(c_diegotoofar(0))
		{
			if(DIEGO_TOOFARCOMMENT == FALSE)
			{
				return TRUE;
			};
		}
		else
		{
			DIEGO_TOOFARCOMMENT = FALSE;
		};
	};
	return FALSE;
};

func void dia_addon_thiefow_toofar_info()
{
	if(c_diegotoofar(1000) == LOC_ANGAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_02");	//There's something eerie about this old tomb.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_03");	//Let's rather walk around it.
	}
	else if(c_diegotoofar(1000) == LOC_ICE)
	{
		if(DIEGO_ICEVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_04");	//That's the entrance to the former New Camp.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_05");	//I'm sure that a dragon has made himself at home in there.
			b_addon_diego_passotherdirection();
			DIEGO_ICEVARIATION = 1;
		}
		else
		{
			b_addon_diego_passotherdirection();
		};
	}
	else if(c_diegotoofar(1000) == LOC_SWAMP)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_06");	//This swamp is a dead end.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_07");	//I wouldn't be surprised if there's even a dragon lurking for us inside.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Let's not go in there.
	}
	else if(c_diegotoofar(1000) == LOC_FIRE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//If we keep walking up the mountain, we're sure to meet a dragon.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_10");	//And I would love to get to Khorinis ALIVE.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_11");	//Let's take a different path.
	}
	else if(c_diegotoofar(1000) == LOC_LAKE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_12");	//This lake doesn't lead us anywhere.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_13");	//To get to the pass, we'll have to go in the other direction!
	}
	else if(c_diegotoofar(1000) == LOC_XARDAS)
	{
		if(DIEGO_XARDASVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_14");	//This is the old tower of Xardas. He made himself scarce long ago, of course.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_15");	//I'm sure there must be some nasty surprises waiting in there.
			b_addon_diego_willwaitoutside();
			DIEGO_XARDASVARIATION = 1;
		}
		else
		{
			b_addon_diego_willwaitoutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"XARDAS");
		};
	}
	else if(c_diegotoofar(1000) == LOC_FAJETHMINE)
	{
		if(DIEGO_FAJETHVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_16");	//That's Fajeth's mine back there.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_17");	//If you want to go there, count me out!
			DIEGO_FAJETHVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_18");	//I shall give that mine a wide berth!
		};
	}
	else if(c_diegotoofar(1000) == LOC_SILVESTROMINE)
	{
		if(DIEGO_SILVESTROVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_19");	//That's the mine where they took me when I came back with the penal convoy.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_20");	//I'm sure that NOBODY'S still alive in there.
			b_addon_diego_willwaitoutside();
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_20");	//But if you take too long, I'll just go back to my camp.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_Add_11_21");	//Unless you want me to wait here for you.
			DIEGO_SILVESTROVARIATION = 1;
		}
		else
		{
			b_addon_diego_willwaitoutside();
			AI_StopProcessInfos(self);
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			Npc_ExchangeRoutine(self,"SILVESTRO");
		};
	}
	else if(c_diegotoofar(1000) == LOC_GRIMESMINE)
	{
		if(DIEGO_GRIMESVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_21");	//This is one of the new mines of the paladins.
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_22");	//I've never been there - and I'm not going to go there either.
			DIEGO_GRIMESVARIATION = 1;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_23");	//Let's give that mine a wide berth.
		};
	}
	else if(c_diegotoofar(1000) == LOC_BURG)
	{
		if(DIEGO_BURGVARIATION == 0)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_24");	//Suicidal, are you? Just stay well away from that castle.
			DIEGO_BURGVARIATION = 1;
		}
		else if(DIEGO_BURGVARIATION == 1)
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_25");	//Hey, are you even listening to me?! Stay away from the castle!
			DIEGO_BURGVARIATION = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_26");	//What part of 'Stay away from the castle' is unclear?
			DIEGO_BURGVARIATION = 1;
		};
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_27");	//We can't continue here. The orc barrier is too dangerous.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_28");	//I think it would be better if we headed west again and walked around to the other side.
	}
	else if(c_diegotoofar(1000) == LOC_ORCBARRIER_FAR)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_29");	//If we continue in this direction, we'll only end up at the orc barrier again.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_30");	//Let's go to the pass!
	}
	else if(c_diegotoofar(1000) == LOC_ROCK)
	{
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_09");	//If we keep walking up the mountain, we're sure to meet a dragon.
		AI_Output(self,other,"DIA_Addon_Diego_TooFar_11_08");	//Let's not go in there.
	};
	DIEGO_TOOFARCOMMENT = TRUE;
};

func void b_diego_wirsindda()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_02");	//I shall go the rest of the way by myself.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_03");	//I have a few things to take care of before I can return to Khorinis.
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_04");	//Thank you, my friend. I'll see you in town.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"PASS");
	DIEGO_ANGEKOMMEN = TRUE;
};


instance DIA_ADDON_THIEFOW_ANGEKOMMEN(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_addon_thiefow_angekommen_condition;
	information = dia_addon_thiefow_angekommen_info;
	important = TRUE;
};


func int dia_addon_thiefow_angekommen_condition()
{
	if((Npc_GetDistToWP(self,"OW_VM_ENTRANCE") < 800) && !Npc_KnowsInfo(other,dia_addon_thiefow_nostalgie))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_angekommen_info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Angekommen_11_01");	//Right, here we are.
	b_giveplayerxp(500);
	b_diego_wirsindda();
};


instance DIA_ADDON_THIEFOW_NOSTALGIE(C_INFO)
{
	npc = pc_thiefow;
	nr = 1;
	condition = dia_addon_thiefow_nostalgie_condition;
	information = dia_addon_thiefow_nostalgie_info;
	important = TRUE;
};


func int dia_addon_thiefow_nostalgie_condition()
{
	if(Npc_GetDistToWP(self,"WP_INTRO14") < 2000)
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_nostalgie_info()
{
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_01");	//Remember, back then?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_02");	//When we met here for the first time?
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_03");	//It's been ages...
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_04");	//There was something ELSE in this place - hmm - damn! I just can't remember.
	AI_Output(self,other,"DIA_Addon_Diego_Nostalgie_11_05");	//Whatever...
	b_giveplayerxp(500);
	hero.exp = hero.exp + 500;
	PrintScreen(ConcatStrings(NAME_ADDON_NOSTALGIEBONUS,IntToString(500)),-1,60,FONT_SCREEN,2);
	b_diego_wirsindda();
};


instance DIA_ADDON_THIEFOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_addon_thiefow_perm_condition;
	information = dia_addon_thiefow_perm_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_addon_thiefow_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_perm) && Npc_KnowsInfo(other,dia_addon_thiefow_together))
	{
		return TRUE;
	};
};

func void dia_addon_thiefow_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Diego_PERM_15_00");	//How's it going?
	if(self.attribute[ATR_HITPOINTS] <= (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_01");	//I could use a healing potion. You wouldn't happen to have one for me?
	}
	else if((diegoow.aivar[AIV_PARTYMEMBER] == FALSE) && (DIEGO_ANGEKOMMEN == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_02");	//Let me know when you want to get started.
	}
	else if(DIEGO_ANGEKOMMEN == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_03");	//Fine. I'm just taking a brief rest.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Diego_PERM_11_04");	//Fine.
	};
};

