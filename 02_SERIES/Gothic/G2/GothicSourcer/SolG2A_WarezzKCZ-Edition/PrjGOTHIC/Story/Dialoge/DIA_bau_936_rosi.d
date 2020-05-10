
instance DIA_ROSI_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_exit_condition;
	information = dia_rosi_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_rosi_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_HALLO(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_hallo_condition;
	information = dia_rosi_hallo_info;
	description = "Everything all right with you?";
};


func int dia_rosi_hallo_condition()
{
	return TRUE;
};

func void dia_rosi_hallo_info()
{
	AI_Output(other,self,"DIA_Rosi_HALLO_15_00");	//Everything all right with you?
	AI_Output(self,other,"DIA_Rosi_HALLO_17_01");	//Well, it's so-so. My back hurts from all this hard labor. What are you doing here? I don't get visitors here all that often.
	if(hero.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Rosi_HALLO_17_02");	//Usually, it's either some cutthroats from the mountains, or those horrible militia soldiers from the city.
		AI_Output(self,other,"DIA_Rosi_HALLO_17_03");	//They've been raiding our farm rather frequently lately. But you don't look like you're one of them, or are you?
	};
};


instance DIA_ROSI_WASMACHSTDU(C_INFO)
{
	npc = bau_936_rosi;
	nr = 4;
	condition = dia_rosi_wasmachstdu_condition;
	information = dia_rosi_wasmachstdu_info;
	description = "What are you doing here?";
};


func int dia_rosi_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_rosi_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rosi_WASMACHSTDU_15_00");	//What are you doing here?
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_01");	//I've been asking myself that for several years. Sekob, my husband, has fallen out with everyone in the area by now.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_02");	//He's in debt everywhere. And so he steals goods from Onar's stocks and sells them in town.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_03");	//By now, he's accumulated a fortune with his underhanded dealings.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_04");	//And he works our field hands until their backs break. His own people call him nothing but slave-driver these days.
		AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_05");	//I'm not particularly proud to call myself the wife of Sekob, believe me. Sometimes I wish the Barrier were still in place.
	};
	AI_Output(self,other,"DIA_Rosi_WASMACHSTDU_17_06");	//Would you like to buy something to eat, or perhaps something for hunting in the forest?
	Log_CreateTopic(TOPIC_OUTTRADER,LOG_NOTE);
	b_logentry(TOPIC_OUTTRADER,"Rosi trades various goods on Sekob's farm.");
};


instance DIA_ROSI_WAREZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 2;
	condition = dia_rosi_warez_condition;
	information = dia_rosi_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "What can you offer me?";
};


func int dia_rosi_warez_condition()
{
	if((Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)) || Npc_IsDead(sekob)) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_rosi_warez_info()
{
	b_clearsmithinv(self);
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Rosi_WAREZ_15_00");	//What can you offer me?
	AI_Output(self,other,"DIA_Rosi_WAREZ_17_01");	//What do you want?
};


instance DIA_ROSI_BARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 6;
	condition = dia_rosi_barriere_condition;
	information = dia_rosi_barriere_info;
	description = "Barrier?";
};


func int dia_rosi_barriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_barriere_info()
{
	AI_Output(other,self,"DIA_Rosi_BARRIERE_15_00");	//Barrier?
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_01");	//Well, the dome that used to enclose the old Valley of Mines.
	AI_Output(self,other,"DIA_Rosi_BARRIERE_17_02");	//Many of the farmers and workers who committed a crime back then were simply tossed in there, and they never came back.
};


instance DIA_ROSI_DUINBARRIERE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 10;
	condition = dia_rosi_duinbarriere_condition;
	information = dia_rosi_duinbarriere_info;
	description = "Have you ever been at the Barrier?";
};


func int dia_rosi_duinbarriere_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_barriere))
	{
		return TRUE;
	};
};

func void dia_rosi_duinbarriere_info()
{
	AI_Output(other,self,"DIA_Rosi_DuInBarriere_15_00");	//Have you ever been at the Barrier?
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_01");	//No. We only heard about it. Bengar, the farmer on the high pastures, can surely tell you more about that.
	AI_Output(self,other,"DIA_Rosi_DuInBarriere_17_02");	//His farm is quite close to the pass which leads to the Valley of Mines.
};


instance DIA_ROSI_BENGAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 11;
	condition = dia_rosi_bengar_condition;
	information = dia_rosi_bengar_info;
	description = "How can I get to Bengar's farm?";
};


func int dia_rosi_bengar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_duinbarriere) && (Npc_IsDead(balthasar) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rosi_bengar_info()
{
	AI_Output(other,self,"DIA_Rosi_BENGAR_15_00");	//How can I get to Bengar's farm?
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_01");	//Go ask Balthasar. He's our shepherd. He sometimes leads his animals to graze on Bengar's pastures up there.
	AI_Output(self,other,"DIA_Rosi_BENGAR_17_02");	//He'll be able to tell you how to get there.
};


instance DIA_ROSI_MILIZ(C_INFO)
{
	npc = bau_936_rosi;
	nr = 7;
	condition = dia_rosi_miliz_condition;
	information = dia_rosi_miliz_info;
	description = "Why do the militia attack you on your farms here?";
};


func int dia_rosi_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) && (hero.guild != GIL_MIL))
	{
		return TRUE;
	};
};

func void dia_rosi_miliz_info()
{
	AI_Output(other,self,"DIA_Rosi_Miliz_15_00");	//Why do the militia attack you on your farms here?
	AI_Output(self,other,"DIA_Rosi_Miliz_17_01");	//Because there's nobody there to prevent them from simply plundering our farms instead of buying our goods.
	AI_Output(self,other,"DIA_Rosi_Miliz_17_02");	//The king is far away, and we just have to put up with working for Onar and hoping that Onar will send help when we really need it.
};


instance DIA_ROSI_ONAR(C_INFO)
{
	npc = bau_936_rosi;
	nr = 8;
	condition = dia_rosi_onar_condition;
	information = dia_rosi_onar_info;
	description = "What does Onar's help look like?";
};


func int dia_rosi_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_miliz))
	{
		return TRUE;
	};
};

func void dia_rosi_onar_info()
{
	AI_Output(other,self,"DIA_Rosi_ONAR_15_00");	//What does Onar's help look like?
	AI_Output(self,other,"DIA_Rosi_ONAR_17_01");	//Sometimes we receive warning in advance when some militiamen are planning to pay us a visit on their own account to rob us.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_02");	//Then we send somebody to the old landowner to ask him for help.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_03");	//And then, usually, it doesn't take long for the mercenaries he pays to come here and chase off the militia.
	AI_Output(self,other,"DIA_Rosi_ONAR_17_04");	//But, when all is said and done, the mercenaries aren't much better.
};


instance DIA_ROSI_PERMKAP1(C_INFO)
{
	npc = bau_936_rosi;
	nr = 80;
	condition = dia_rosi_permkap1_condition;
	information = dia_rosi_permkap1_info;
	permanent = TRUE;
	description = "Keep your chin up.";
};


func int dia_rosi_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu) || ((KAPITEL >= 5) && Npc_KnowsInfo(other,dia_rosi_fleefromsekob)))
	{
		return TRUE;
	};
};

func void dia_rosi_permkap1_info()
{
	AI_Output(other,self,"DIA_Rosi_PERMKAP1_15_00");	//Keep your chin up.
	if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_01");	//Go jump in the lake.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_PERMKAP1_17_02");	//Take care of yourself and don't let them get to you.
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP3_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap3_exit_condition;
	information = dia_rosi_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_rosi_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP4_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap4_exit_condition;
	information = dia_rosi_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_rosi_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_KAP5_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap5_exit_condition;
	information = dia_rosi_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_rosi_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_FLEEFROMSEKOB(C_INFO)
{
	npc = bau_936_rosi;
	nr = 50;
	condition = dia_rosi_fleefromsekob_condition;
	information = dia_rosi_fleefromsekob_info;
	description = "What are you doing here in the wilderness?";
};


func int dia_rosi_fleefromsekob_condition()
{
	if((KAPITEL == 5) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_fleefromsekob_info()
{
	AI_Output(other,self,"DIA_Rosi_FLEEFROMSEKOB_15_00");	//What are you doing here in the wilderness?
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_01");	//I couldn't take it any more on Sekob's farm. Sekob threw one hissy fit after another.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_02");	//In the end, one couldn't talk to him at all. All he would do was yell.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_03");	//I must get away from here, but I don't know where to turn.
	AI_Output(self,other,"DIA_Rosi_FLEEFROMSEKOB_17_04");	//Interested in a little deal?
	b_giveplayerxp(XP_AMBIENT);
	ROSIFOUNDKAP5 = TRUE;
};


instance DIA_ROSI_HILFE(C_INFO)
{
	npc = bau_936_rosi;
	nr = 51;
	condition = dia_rosi_hilfe_condition;
	information = dia_rosi_hilfe_info;
	description = "I'll get you out of here.";
};


func int dia_rosi_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_rosi_fleefromsekob) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_hilfe_info()
{
	AI_Output(other,self,"DIA_Rosi_HILFE_15_00");	//I'll get you out of here.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	till.aivar[AIV_PARTYMEMBER] = TRUE;
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_01");	//I could take you to the city.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_02");	//I'll bring you to the landowner's farm.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Rosi_HILFE_15_03");	//Come away to the monastery. You'll be welcome there.
	};
	AI_Output(self,other,"DIA_Rosi_HILFE_17_04");	//I'll never forget what you did for me. I'll pay you, of course.
	if(Npc_IsDead(till))
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_05");	//You go first. I'll follow.
	}
	else
	{
		AI_Output(self,other,"DIA_Rosi_HILFE_17_06");	//You go first. We'll follow.
	};
	AI_StopProcessInfos(self);
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		Npc_ExchangeRoutine(self,"FollowCity");
		b_startotherroutine(till,"FollowCity");
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Npc_ExchangeRoutine(self,"FollowBigfarm");
		b_startotherroutine(till,"FollowBigfarm");
	};
	if(hero.guild == GIL_KDF)
	{
		Npc_ExchangeRoutine(self,"FollowKloster");
		b_startotherroutine(till,"FollowKloster");
	};
	Log_CreateTopic(TOPIC_ROSISFLUCHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ROSISFLUCHT,LOG_RUNNING);
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi couldn't stand it on Sekob's farm any longer and now she doesn't know where to go. I'll lead her out of the wilderness.");
	MIS_ROSISFLUCHT = LOG_RUNNING;
};


instance DIA_ROSI_ANGEKOMMEN(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_angekommen_condition;
	information = dia_rosi_angekommen_info;
	important = TRUE;
};


func int dia_rosi_angekommen_condition()
{
	if((KAPITEL == 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE) && (((Npc_GetDistToWP(self,"CITY2") < 6000) && (hero.guild == GIL_PAL)) || ((Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 6000) && (hero.guild == GIL_DJG)) || ((Npc_GetDistToWP(self,"KLOSTER") < 6000) && (hero.guild == GIL_KDF))))
	{
		return TRUE;
	};
};

func void dia_rosi_angekommen_info()
{
	var int xpforboth;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_00");	//I'll find my own way from here.
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_01");	//Thank you. I don't know what I would have done without you.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_BRINGROSIBACKTOSEKOB = LOG_OBSOLETE;
	MIS_ROSISFLUCHT = LOG_SUCCESS;
	AI_Output(self,other,"DIA_Rosi_ANGEKOMMEN_17_02");	//Please accept this modest gift as a reward.
	CreateInvItems(rosi,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,450);
	if(Npc_IsDead(till))
	{
		b_giveplayerxp(XP_SAVEDROSI);
	}
	else
	{
		xpforboth = XP_SAVEDROSI + XP_AMBIENT;
		b_giveplayerxp(xpforboth);
	};
	AI_StopProcessInfos(self);
	if(Npc_GetDistToWP(self,"CITY2") < 8000)
	{
		Npc_ExchangeRoutine(self,"CITY");
		b_startotherroutine(till,"CITY");
	}
	else if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_02") < 8000)
	{
		Npc_ExchangeRoutine(self,"BIGFARM");
		b_startotherroutine(till,"BIGFARM");
	}
	else if(Npc_GetDistToWP(self,"KLOSTER") < 8000)
	{
		Npc_ExchangeRoutine(self,"KLOSTER");
		b_startotherroutine(till,"KLOSTER");
	};
};


instance DIA_ROSI_TRAIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 55;
	condition = dia_rosi_trait_condition;
	information = dia_rosi_trait_info;
	description = "See, now you're home again.";
};


func int dia_rosi_trait_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
	{
		return TRUE;
	};
};

func void dia_rosi_trait_info()
{
	AI_Output(other,self,"DIA_Rosi_TRAIT_15_00");	//See, now you're home again.
	AI_Output(self,other,"DIA_Rosi_TRAIT_17_01");	//You are the worst piece of dung I've met in my life, you filthy swine.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	till.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_ROSISFLUCHT = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_MINENANTEIL(C_INFO)
{
	npc = bau_936_rosi;
	nr = 3;
	condition = dia_rosi_minenanteil_condition;
	information = dia_rosi_minenanteil_info;
	description = "Selling illegal mine shares - have you no shame?";
};


func int dia_rosi_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rosi_minenanteil_info()
{
	AI_Output(other,self,"DIA_Rosi_Minenanteil_15_00");	//Selling illegal mine shares - have you no shame?
	AI_Output(self,other,"DIA_Rosi_Minenanteil_17_01");	//No. I need to live, too, and I'm not the one who brought them into circulation.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ROSI_KAP6_EXIT(C_INFO)
{
	npc = bau_936_rosi;
	nr = 999;
	condition = dia_rosi_kap6_exit_condition;
	information = dia_rosi_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rosi_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_rosi_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROSI_PICKPOCKET(C_INFO)
{
	npc = bau_936_rosi;
	nr = 900;
	condition = dia_rosi_pickpocket_condition;
	information = dia_rosi_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rosi_pickpocket_condition()
{
	return c_beklauen(30,75);
};

func void dia_rosi_pickpocket_info()
{
	Info_ClearChoices(dia_rosi_pickpocket);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_BACK,dia_rosi_pickpocket_back);
	Info_AddChoice(dia_rosi_pickpocket,DIALOG_PICKPOCKET,dia_rosi_pickpocket_doit);
};

func void dia_rosi_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rosi_pickpocket);
};

func void dia_rosi_pickpocket_back()
{
	Info_ClearChoices(dia_rosi_pickpocket);
};

