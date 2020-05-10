
instance DIA_DRAGOMIR_EXIT(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 999;
	condition = dia_dragomir_exit_condition;
	information = dia_dragomir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragomir_exit_condition()
{
	return TRUE;
};

func void dia_dragomir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DRAGOMIR_HELLO(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 1;
	condition = dia_dragomir_hello_condition;
	information = dia_dragomir_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragomir_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dragomir_hello_info()
{
	AI_Output(self,other,"DIA_Dragomir_Hello_12_00");	//Traveling so far from home?
	AI_Output(self,other,"DIA_Dragomir_Hello_12_01");	//Out here you have to be careful, especially when you're all by yourself.
};


instance DIA_DRAGOMIR_OUTHERE(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_outhere_condition;
	information = dia_dragomir_outhere_info;
	permanent = FALSE;
	description = "What are you doing out here?";
};


func int dia_dragomir_outhere_condition()
{
	return TRUE;
};

func void dia_dragomir_outhere_info()
{
	AI_Output(other,self,"DIA_Dragomir_OutHere_15_00");	//What are you doing out here?
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_01");	//Well, the tavern is too expensive for me, that's why I settled here.
	AI_Output(self,other,"DIA_Dragomir_OutHere_12_02");	//The previous inhabitants don't seem to need it any more.
};


instance DIA_DRAGOMIR_SETTLERS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_settlers_condition;
	information = dia_dragomir_settlers_info;
	permanent = FALSE;
	description = "Who used to live in this camp?";
};


func int dia_dragomir_settlers_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_settlers_info()
{
	AI_Output(other,self,"DIA_Dragomir_Settlers_15_00");	//Who used to live in this camp?
	AI_Output(self,other,"DIA_Dragomir_Settlers_12_01");	//No idea, probably some hunters. I suppose it got too dangerous for them out here.
};


instance DIA_DRAGOMIR_DANGEROUS(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_dangerous_condition;
	information = dia_dragomir_dangerous_info;
	permanent = FALSE;
	description = "Isn't it too dangerous out here?";
};


func int dia_dragomir_dangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_outhere))
	{
		return TRUE;
	};
};

func void dia_dragomir_dangerous_info()
{
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_00");	//Isn't it too dangerous out here?
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_01");	//Well, not if you can defend yourself. My crossbow has already proven to be of service many times.
	AI_Output(other,self,"DIA_Dragomir_Dangerous_15_02");	//It's not all that big.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_03");	//But deadly, if you know how to handle it. I used to have a bigger one. Unfortunately, I lost it.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_04");	//I ventured too far north into the mountains. There's a big stone circle there with a sacrificial altar.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_05");	//While I was hunting scavengers up there, these vile undead beings came out of the woods and attacked me.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_06");	//All I could do was run for my life.
	AI_Output(self,other,"DIA_Dragomir_Dangerous_12_07");	//While I was running, the crossbow slipped from my hand. I bet it's still lying up there by that strange stone circle in the north.
	Log_CreateTopic(TOPIC_DRAGOMIRSARMBRUST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRAGOMIRSARMBRUST,LOG_RUNNING);
	b_logentry(TOPIC_DRAGOMIRSARMBRUST,"Dragomir lost his crossbow at a strange stone circle in the high northern mountains.");
	MIS_DRAGOMIRSARMBRUST = LOG_RUNNING;
};


instance DIA_DRAGOMIR_ARMBRUST(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_armbrust_condition;
	information = dia_dragomir_armbrust_info;
	permanent = FALSE;
	description = "Here. I found your crossbow.";
};


func int dia_dragomir_armbrust_condition()
{
	if((MIS_DRAGOMIRSARMBRUST == LOG_RUNNING) && Npc_HasItems(other,itrw_dragomirsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_dragomir_armbrust_info()
{
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_00");	//Here. I found your crossbow.
	b_giveinvitems(other,self,itrw_dragomirsarmbrust_mis,1);
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_01");	//Indeed, this is mine. Don't tell me you were up by the stone circle?!
	AI_Output(other,self,"DIA_Dragomir_Armbrust_15_02");	//Most certainly!
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_03");	//That was pretty reckless of you. But thanks anyway.
	AI_Output(self,other,"DIA_Dragomir_Armbrust_12_04");	//Naturally, I'll repay this deed. I hope this is enough.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_DRAGOMIRSARMBRUST = LOG_SUCCESS;
	b_giveplayerxp(XP_DRAGOMIRSARMBRUST);
};


var int dragomir_teachplayer;
const int DRAGOMIR_TEACHINGCOST = 150;

instance DIA_DRAGOMIR_LEARN(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_learn_condition;
	information = dia_dragomir_learn_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_dragomir_learn_condition()
{
	if(Npc_KnowsInfo(other,dia_dragomir_dangerous) && (DRAGOMIR_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_learn_info()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_15_00");	//Can you teach me something?
	if(other.attribute[ATR_DEXTERITY] < 30)
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_01");	//Before I teach you anything, you'll have to improve your dexterity.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragomir_Learn_12_02");	//If you can pay. Like I said, at the moment I'm a bit strapped for cash.
		AI_Output(other,self,"DIA_Dragomir_Learn_15_03");	//How much do you ask?
		b_say_gold(self,other,DRAGOMIR_TEACHINGCOST);
		Info_ClearChoices(dia_dragomir_learn);
		Info_AddChoice(dia_dragomir_learn,"Maybe later.",dia_dragomir_learn_later);
		if(Npc_HasItems(other,itmi_gold) >= DRAGOMIR_TEACHINGCOST)
		{
			Info_AddChoice(dia_dragomir_learn,"Here's your gold.",dia_dragomir_learn_here);
		};
	};
};

func void dia_dragomir_learn_later()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Later_15_00");	//Maybe later.
	Info_ClearChoices(dia_dragomir_learn);
};

func void dia_dragomir_learn_here()
{
	AI_Output(other,self,"DIA_Dragomir_Learn_Here_15_00");	//Here's your gold.
	b_giveinvitems(other,self,itmi_gold,DRAGOMIR_TEACHINGCOST);
	AI_Output(self,other,"DIA_Dragomir_Learn_Here_12_01");	//Good, as far as I'm concerned we can begin immediately.
	DRAGOMIR_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_dragomir_learn);
};


var int dia_dragomir_teach_permanent;

instance DIA_DRAGOMIR_TEACH(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 2;
	condition = dia_dragomir_teach_condition;
	information = dia_dragomir_teach_info;
	permanent = TRUE;
	description = "Teach me something.";
};


func int dia_dragomir_teach_condition()
{
	if((DRAGOMIR_TEACHPLAYER == TRUE) && (DIA_DRAGOMIR_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_dragomir_teach_info()
{
	AI_Output(other,self,"DIA_Dragomir_Teach_15_00");	//Teach me something.
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_back()
{
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 75)
	{
		AI_Output(self,other,"DIA_Dragomir_Teach_12_00");	//I can't teach you anything more. It's time you looked for another teacher.
		DIA_DRAGOMIR_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_dragomir_teach);
};

func void dia_dragomir_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,75);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_dragomir_teach_1h_5);
};

func void dia_dragomir_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,75);
	Info_ClearChoices(dia_dragomir_teach);
	Info_AddChoice(dia_dragomir_teach,DIALOG_BACK,dia_dragomir_teach_back);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_dragomir_teach_1h_1);
	Info_AddChoice(dia_dragomir_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_dragomir_teach_1h_5);
};


instance DIA_DRAGOMIR_PICKPOCKET(C_INFO)
{
	npc = bau_983_dragomir;
	nr = 900;
	condition = dia_dragomir_pickpocket_condition;
	information = dia_dragomir_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_dragomir_pickpocket_condition()
{
	return c_beklauen(47,70);
};

func void dia_dragomir_pickpocket_info()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_BACK,dia_dragomir_pickpocket_back);
	Info_AddChoice(dia_dragomir_pickpocket,DIALOG_PICKPOCKET,dia_dragomir_pickpocket_doit);
};

func void dia_dragomir_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dragomir_pickpocket);
};

func void dia_dragomir_pickpocket_back()
{
	Info_ClearChoices(dia_dragomir_pickpocket);
};

