
instance DIA_INGMAR_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_exit_condition;
	information = dia_ingmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_HALLO(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 2;
	condition = dia_ingmar_hallo_condition;
	information = dia_ingmar_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ingmar_hallo_permanent;

func int dia_ingmar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_INGMAR_HALLO_PERMANENT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_ingmar_hallo_info()
{
	if((ENTEROW_KAPITEL2 == FALSE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//According to the reports I have received, the Valley of Mines is a dangerous place.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//Make sure to equip yourself well before you leave.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//The situation in the Valley of Mines is quite worrying. But we shall develop plans to get rid of the dangers and get our boys out of there along with the ore.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//I thought you had come to talk to Lord Hagen. So you should go ahead and do that.
	};
};


instance DIA_INGMAR_KRIEG(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 99;
	condition = dia_ingmar_krieg_condition;
	information = dia_ingmar_krieg_info;
	permanent = FALSE;
	description = "How is the situation on the mainland.";
};


func int dia_ingmar_krieg_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ingmar_krieg_info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//How is the situation on the mainland.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//The war isn't won yet, although the royal troops are already driving back the orcs.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//But small bands of orcs are gathering in many places, trying to scatter our army.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//They fight without honor and without faith - and therefore we shall prevail in the end.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "Can you teach me?";
};


func int dia_ingmar_canteach_condition()
{
	if(INGMAR_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_ingmar_canteach_info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//Can you teach me?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//I can teach you how to fortify your arms in order to wield your weapons more effectively.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"The paladin Ingmar can help me to become stronger.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//I only instruct the followers of our Order.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "I want to get stronger.";
};


func int dia_ingmar_teach_condition()
{
	if(INGMAR_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ingmar_teach_info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//I want to become stronger.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= T_MAX)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//You are as strong as a troll. There is nothing more I can teach you.
	};
	Info_ClearChoices(dia_ingmar_teach);
};

func void dia_ingmar_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ingmar_teach_5);
};


instance DIA_INGMAR_KAP3_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap3_exit_condition;
	information = dia_ingmar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP4_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap4_exit_condition;
	information = dia_ingmar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_ORKELITE(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 40;
	condition = dia_ingmar_orkelite_condition;
	information = dia_ingmar_orkelite_info;
	description = "The orcs are planning a major offensive.";
};


func int dia_ingmar_orkelite_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering) || (HAGEN_SAWORCRING == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ingmar_orkelite_info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//The orcs are planning a major offensive.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//Indeed. Well, that's very interesting. And how can you claim to know this?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//I have talked to them.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//Some of their leaders are haunting this area.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//Mmh. That doesn't sound like a typical Orc strategy.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"You had better come up with a way to get rid of them.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"What should we do now?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"What does that mean?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"Ingmar was deeply interested in the story of the orcish elite warriors.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//You had better come up with a way to get rid of them.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//It would suffice if we had more information. I shall send somebody to scout out the surroundings.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//What does that mean?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//If what you say is right, that means that they hope to weaken us from the inside by attacking with their best warriors.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//Usually, there is one warlord leading each horde of orc fighters. You rarely see two or more of them together.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//They do this for a reason. Their leaders form the core of their attack strategy and are usually surrounded by the orc warriors.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//Thus, it is really hard to get close to any of them without having to fight your way through a horde of at least 30 warriors.
	b_logentry(TOPIC_ORCELITE,"Ingmar said something about a leader of the orcish warlords.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//What should we do now?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//When they are seen in numbers like this, they usually form a raiding patrol led by the highest among them.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//This highest warlord establishes the headquarters and withdraws to some cave from where he sends his troops into battle.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//If we could get hold of this leader, it would give us a decisive advantage.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//An orc leader usually likes to hang out in the vicinity of his enemies. It would be advisable to look for his cave somewhere not too far from the city.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//Some orcs have been spotted near Lobart's farm. Maybe that's where you should begin your search.
	b_logentry(TOPIC_ORCELITE,"According to Ingmar, I should find the orcish colonel in a cave somewhere near Lobart's farm. Ingmar wants me to find him and eliminate him.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "I have been able to find the headquarters of the orcs.";
};


func int dia_ingmar_hauptquartier_condition()
{
	if(Npc_IsDead(orkelite_antipaladinorkoberst) && Npc_KnowsInfo(other,dia_ingmar_orkelite))
	{
		return TRUE;
	};
};

func void dia_ingmar_hauptquartier_info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//I have been able to find the headquarters of the orcs. Their chief warlord has fallen.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//This is great news. That will keep the orcs busy for a while.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//Not bad, that. If we had more knights of your kind, the upcoming battle would be a piece of cake.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//Here. Take our gold and use it towards your equipment.
	b_giveplayerxp(XP_KILLEDORKOBERST);
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	MIS_KILLORKOBERST = LOG_SUCCESS;
};


instance DIA_INGMAR_KAP5_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap5_exit_condition;
	information = dia_ingmar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP6_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap6_exit_condition;
	information = dia_ingmar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_PICKPOCKET(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 900;
	condition = dia_ingmar_pickpocket_condition;
	information = dia_ingmar_pickpocket_info;
	permanent = TRUE;
	description = "(It would be nearly impossible to steal his scroll)";
};


func int dia_ingmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ingmar_pickpocket_info()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_BACK,dia_ingmar_pickpocket_back);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_PICKPOCKET,dia_ingmar_pickpocket_doit);
};

func void dia_ingmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		b_giveinvitems(self,other,itwr_manowar,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_ingmar_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ingmar_pickpocket_back()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
};

