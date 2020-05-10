
instance DIA_ADDON_SENYAN_EXIT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 999;
	condition = dia_addon_senyan_exit_condition;
	information = dia_addon_senyan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V3;
};


func int dia_addon_senyan_exit_condition()
{
	return TRUE;
};

func void dia_addon_senyan_exit_info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//We'll meet again.
	if(SENYAN_ERPRESSUNG == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Senyan_EXIT_12_00");	//You know what you have to do...
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SENYAN_PICKPOCKET(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 900;
	condition = dia_addon_senyan_pickpocket_condition;
	information = dia_addon_senyan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_senyan_pickpocket_condition()
{
	return c_beklauen(45,88);
};

func void dia_addon_senyan_pickpocket_info()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_BACK,dia_addon_senyan_pickpocket_back);
	Info_AddChoice(dia_addon_senyan_pickpocket,DIALOG_PICKPOCKET,dia_addon_senyan_pickpocket_doit);
};

func void dia_addon_senyan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void dia_addon_senyan_pickpocket_back()
{
	Info_ClearChoices(dia_addon_senyan_pickpocket);
};

func void b_senyan_attack()
{
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_00");	//(sneering) Then what do I still need you for, you bum?
	AI_Output(self,other,"DIA_Addon_Senyan_Attack_12_01");	//(calls) Hey, people, look who we have here!
	SENYAN_CALLED = TRUE;
	SENYAN_ERPRESSUNG = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void b_senyan_erpressung()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_00");	//How much do you want?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_01");	//(playing hurt) Oh, no, please. I don't want to extort gold from you. I wouldn't dream of it.
	AI_Output(other,self,"DIA_Addon_Senyan_Erpressung_15_02");	//Then what do you want?
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_03");	//Recently somebody tried to get Esteban out of the way. But he ran into the bodyguards.
	AI_Output(self,other,"DIA_Addon_Senyan_Erpressung_12_04");	//Go to Esteban and talk to him. Afterwards we'll talk again.
	AI_StopProcessInfos(self);
	Log_CreateTopic(TOPIC_ADDON_SENYAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SENYAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SENYAN,"Senyan has recognized me. He knows who I am. He wants to use that for his own plans. He has something in mind and wants me to talk to Esteban first.");
};


instance DIA_ADDON_BDT_1084_SENYAN_HI(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_hi_condition;
	information = dia_addon_senyan_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_hi_condition()
{
	return TRUE;
};


var int senyan_msg;
var int senyan_bad;
var int senyan_good;

func void dia_addon_senyan_hi_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_00");	//Ah! Who have we here then?
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_12_01");	//Looky, looky. There you are. I've got good news and bad news for you.
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"I want to hear the good news first.",dia_addon_bdt_1084_senyan_hi_good);
	Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"First tell me the bad news.",dia_addon_bdt_1084_senyan_hi_bad);
};

func void dia_addon_bdt_1084_senyan_hi_good()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");	//I want to hear the good news first.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");	//And what's the good news?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");	//Well, I don't really know why, but you've made yourself a couple of powerful enemies.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");	//You can count yourself lucky that I recognized you and no one else.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");	//Because I am understanding and sociable.
	SENYAN_GOOD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_BAD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"And what's the bad news?",dia_addon_bdt_1084_senyan_hi_bad);
	};
};

func void dia_addon_bdt_1084_senyan_hi_bad()
{
	if(SENYAN_MSG == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");	//First tell me the bad news.
		SENYAN_MSG = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");	//And what's the bad news?
	};
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");	//Raven is looking for you. So are his guards. Actually, all the bandits are looking for you...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");	//And if they find you, they'll kill you.
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");	//A lot of people have already tried that.
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");	//Then your combat skills are as good as your craftiness. Coming into the camp with some of our armor is like...
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");	//... the sheep coming to the wolves. Your life is hanging by a thin thread, son of danger.
	SENYAN_BAD = TRUE;
	Info_ClearChoices(dia_addon_bdt_1084_senyan_hi);
	if(SENYAN_GOOD == TRUE)
	{
		b_senyan_erpressung();
	}
	else
	{
		Info_AddChoice(dia_addon_bdt_1084_senyan_hi,"And what's the good news?",dia_addon_bdt_1084_senyan_hi_good);
	};
};


instance DIA_ADDON_SENYAN_UNTERWEGS(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 99;
	condition = dia_addon_senyan_unterwegs_condition;
	information = dia_addon_senyan_unterwegs_info;
	permanent = TRUE;
	description = "About Esteban...";
};


func int dia_addon_senyan_unterwegs_condition()
{
	if((MIS_JUDAS != LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_unterwegs_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_00");	//About Esteban...
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_01");	//Have you already talked to him?
	AI_Output(other,self,"DIA_Addon_Senyan_unterwegs_15_02");	//Not yet.
	AI_Output(self,other,"DIA_Addon_Senyan_unterwegs_12_03");	//Well, you should do that soon.
};


instance DIA_ADDON_SENYAN_ATTENTAT(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 2;
	condition = dia_addon_senyan_attentat_condition;
	information = dia_addon_senyan_attentat_info;
	permanent = FALSE;
	description = "I've talked to Esteban.";
};


func int dia_addon_senyan_attentat_condition()
{
	if((MIS_JUDAS == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_bdt_1084_senyan_hi))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_00");	//I've talked to Esteban.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_01");	//And did he tell you about the attack?
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_02");	//He ordered me to find out who sent the assassin. Do you know anything about that?
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_03");	//No more than you do. I'm also on the hunt for the guy behind it. And now we come to the interesting part.
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_15_04");	//Let's hear it.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_05");	//I want you to do your job well. I want you to find the traitor.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_06");	//(coldly) And when you have found him - I want you to kill him for me.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_07");	//Then I will pocket the reward.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_12_08");	//I have your wanted poster - don't forget that. Do your job and do it well. You can figure out will happen otherwise.
	Info_ClearChoices(dia_addon_senyan_attentat);
	Info_AddChoice(dia_addon_senyan_attentat,"I guess I've got no choice...",dia_addon_senyan_attentat_ja);
	Info_AddChoice(dia_addon_senyan_attentat,"Forget it!",dia_addon_senyan_attentat_no);
};

func void dia_addon_senyan_attentat_no()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_NO_15_00");	//Forget it!
	b_senyan_attack();
	Info_ClearChoices(dia_addon_senyan_attentat);
};

func void dia_addon_senyan_attentat_ja()
{
	AI_Output(other,self,"DIA_Addon_Senyan_Attentat_JA_15_00");	//I don't really have a choice...
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_01");	//I knew we would come to an agreement.
	AI_Output(self,other,"DIA_Addon_Senyan_Attentat_JA_12_02");	//(curtly) When you find out who the guy is - we'll kill the tick together. And now beat it!
	SENYAN_ERPRESSUNG = LOG_RUNNING;
	Info_ClearChoices(dia_addon_senyan_attentat);
	b_logentry(TOPIC_ADDON_SENYAN,"Senyan wants me to find the person responsible and kill him. Then he will pocket the reward.");
};


instance DIA_ADDON_SENYAN_CHANGEPLAN(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_changeplan_condition;
	information = dia_addon_senyan_changeplan_info;
	permanent = FALSE;
	description = "I've changed my mind. We aren't working together any more!";
};


func int dia_addon_senyan_changeplan_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (SNAF_TIP_SENYAN == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_changeplan_info()
{
	AI_Output(other,self,"DIA_Addon_Senyan_ChangePlan_15_00");	//I've changed my mind. We aren't working together any more!
	b_senyan_attack();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BDT_1084_SENYAN_FOUND(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 3;
	condition = dia_addon_senyan_found_condition;
	information = dia_addon_senyan_found_info;
	permanent = FALSE;
	description = "I found the traitor. It's Fisk.";
};


func int dia_addon_senyan_found_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_found_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_1084_Senyan_Found_15_00");	//I found the traitor. It's Fisk.
	b_senyan_attack();
};


instance DIA_ADDON_BDT_1084_SENYAN_DERBE(C_INFO)
{
	npc = bdt_1084_addon_senyan;
	nr = 1;
	condition = dia_addon_senyan_derbe_condition;
	information = dia_addon_senyan_derbe_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_senyan_derbe_condition()
{
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && (MIS_JUDAS == LOG_SUCCESS) && (Npc_IsDead(fisk) || Npc_IsDead(esteban)))
	{
		return TRUE;
	};
};

func void dia_addon_senyan_derbe_info()
{
	AI_Output(self,other,"DIA_Addon_BDT_1084_Senyan_derbe_12_00");	//(furious) You haven't kept our agreement.
	b_senyan_attack();
};

