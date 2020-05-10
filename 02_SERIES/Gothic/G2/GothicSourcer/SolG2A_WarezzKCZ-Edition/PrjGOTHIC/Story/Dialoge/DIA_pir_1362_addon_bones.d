
instance DIA_ADDON_BONES_EXIT(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 999;
	condition = dia_addon_bones_exit_condition;
	information = dia_addon_bones_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bones_exit_condition()
{
	return TRUE;
};

func void dia_addon_bones_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BONES_PICKPOCKET(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 900;
	condition = dia_addon_bones_pickpocket_condition;
	information = dia_addon_bones_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bones_pickpocket_condition()
{
	return c_beklauen(75,104);
};

func void dia_addon_bones_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bones_pickpocket);
	Info_AddChoice(dia_addon_bones_pickpocket,DIALOG_BACK,dia_addon_bones_pickpocket_back);
	Info_AddChoice(dia_addon_bones_pickpocket,DIALOG_PICKPOCKET,dia_addon_bones_pickpocket_doit);
};

func void dia_addon_bones_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bones_pickpocket);
};

func void dia_addon_bones_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bones_pickpocket);
};

func void b_addon_bones_keinezeit()
{
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_01");	//I'm sorry. I've got no time right now.
	AI_Output(self,other,"DIA_Addon_Bones_Train_01_02");	//I've got some training to do.
};


instance DIA_ADDON_BONES_ANHEUERN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 1;
	condition = dia_addon_bones_anheuern_condition;
	information = dia_addon_bones_anheuern_info;
	description = "The canyon awaits.";
};


func int dia_addon_bones_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_bones_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Anheuern_15_01");	//The canyon awaits.
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_HELLO(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_hello_condition;
	information = dia_addon_bones_hello_info;
	permanent = FALSE;
	description = "How's it going?";
};


func int dia_addon_bones_hello_condition()
{
	return TRUE;
};

func void dia_addon_bones_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Hello_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Addon_Bones_Hello_01_01");	//I can't complain. It's a bit boring, but at least I don't have to work.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_01");	//I'm preparing for the next task that Greg has given me.
	AI_Output(other,self,"DIA_Addon_Bones_Work_15_02");	//What task?
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_03");	//I mustn't say.
	AI_Output(self,other,"DIA_Addon_Bones_Work_01_04");	//No offense, kid. But I've worked hard for the privilege and I don't want to lose it again.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BONES_TRAIN(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_train_condition;
	information = dia_addon_bones_train_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_addon_bones_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bones_hello) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bones_train_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Train_15_00");	//Can you teach me something?
	b_addon_bones_keinezeit();
};


instance DIA_ADDON_BONES_TEACHER(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 5;
	condition = dia_addon_bones_teacher_condition;
	information = dia_addon_bones_teacher_info;
	permanent = FALSE;
	description = "Who around here can teach me something?";
};


func int dia_addon_bones_teacher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bones_train) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bones_teacher_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_00");	//Who around here can teach me something?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_04");	//Henry and Morgan are leading our raiding troops.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_05");	//They can teach you how to be a better fighter.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_07");	//Henry's people all use two-handed weapons.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_08");	//Morgan prefers the faster one-handed weapons.
	AI_Output(other,self,"DIA_Addon_Bones_Teacher_15_09");	//Who else?
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_10");	//Beats me, I've never been interested in anything else.
	AI_Output(self,other,"DIA_Addon_Bones_Teacher_01_11");	//But I'm sure that Alligator Jack or Samuel could still show you a trick or two.
	KNOWS_HENRYSENTERTRUPP = TRUE;
	Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_HENRYTEACH);
	b_logentry(TOPIC_ADDON_PIR_TEACHER,LOG_TEXT_ADDON_MORGANTEACH);
};


instance DIA_ADDON_BONES_FRANCIS(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 3;
	condition = dia_addon_bones_francis_condition;
	information = dia_addon_bones_francis_info;
	permanent = FALSE;
	description = "Can you tell me something about Francis?";
};


func int dia_addon_bones_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_bones_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_Francis_15_00");	//Can you tell me something about Francis?
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_03");	//Look around you. The only ones working are Henry and his boys.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_04");	//Morgan spends all day in bed, or guzzling booze.
	AI_Output(self,other,"DIA_Addon_Bones_Francis_01_05");	//No such nonsense with Greg. If you don't toe the line, he'll kick you in the butt, and that's that.
};


instance DIA_ADDON_BONES_WANTARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_wantarmor_condition;
	information = dia_addon_bones_wantarmor_info;
	permanent = TRUE;
	description = "Give me that bandit's armor.";
};


func int dia_addon_bones_wantarmor_condition()
{
	if((GREG_GAVEARMORTOBONES == TRUE) && (MIS_GREG_SCOUTBANDITS == 0))
	{
		return TRUE;
	};
};

func void dia_addon_bones_wantarmor_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_WantArmor_15_00");	//Give me that bandit's armor.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_01");	//I'm not that crazy. Greg will have my head.
	AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_02");	//He explicitly stated that no-one will get that armor unless he orders it.
	if(GREGISBACK == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Bones_WantArmor_01_03");	//I can't give it to you. Especially not now that he's come back.
	};
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Bones won't give me the armor without permission from Greg.");
};


instance DIA_ADDON_BONES_GIVEARMOR(C_INFO)
{
	npc = pir_1362_addon_bones;
	nr = 2;
	condition = dia_addon_bones_givearmor_condition;
	information = dia_addon_bones_givearmor_info;
	permanent = FALSE;
	description = "You're supposed to give me the bandit's armor. Orders from Greg.";
};


func int dia_addon_bones_givearmor_condition()
{
	if(MIS_GREG_SCOUTBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_bones_givearmor_info()
{
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_00");	//You're supposed to give me the bandit's armor. Orders from Greg.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_01");	//From Greg? Whew, I already thought I'd have to go after all.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_02");	//This spy job in the bandits' camp is nothing short of a suicide mission.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_03");	//I'd rather have Greg heap his chores on me than get myself killed by those bandits.
	AI_Output(other,self,"DIA_Addon_Bones_GiveArmor_15_04");	//(irritated) The armor.
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_05");	//Oh yeah, right, here it is.
	b_giveinvitems(self,other,itar_bdt_m,1);
	AI_Output(self,other,"DIA_Addon_Bones_GiveArmor_01_06");	//Just be careful. Those bandits are a bad lot.
	self.flags = 0;
	pir_1320_addon_greg.flags = 0;
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"The order from Greg seems to work wonders. I have the bandit armor!");
	b_giveplayerxp(XP_BONES_GETBDTARMOR);
};

