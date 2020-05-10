
instance DIA_1051_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 999;
	condition = dia_1051_wegelagerer_exit_condition;
	information = dia_1051_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int bdt_1051_wegelagerer_angriff;

func int dia_1051_wegelagerer_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_1051_wegelagerer_question) || (BDT_1051_WEGELAGERER_ANGRIFF == TRUE))
	{
		return TRUE;
	};
};

func void dia_1051_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
	if(BDT_1051_WEGELAGERER_ANGRIFF == TRUE)
	{
		self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		bdt_1052_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_1051_WEGELAGERER_HELLO(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_hello_condition;
	information = dia_wegelagerer_hello_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_wegelagerer_hello_condition()
{
	if(BDT_1051_WEGELAGERER_ANGRIFF == FALSE)
	{
		return TRUE;
	};
};

func void dia_wegelagerer_hello_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Hello_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Hello_07_01");	//What's it to you?
};


instance DIA_1051_WEGELAGERER_NOVICE(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_novice_condition;
	information = dia_wegelagerer_novice_info;
	permanent = FALSE;
	description = "I'm looking for a novice.";
};


func int dia_wegelagerer_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (BDT_1051_WEGELAGERER_ANGRIFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_novice_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Novice_15_00");	//I'm looking for a novice.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Novice_07_01");	//That's very interesting. We're looking for someone, too.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_novice,"Who are you looking for?",dia_1051_wegelagerer_question_novice_who);
};


instance DIA_1051_WEGELAGERER_QUESTION(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 4;
	condition = dia_wegelagerer_question_condition;
	information = dia_wegelagerer_question_info;
	permanent = FALSE;
	description = "Well, just asking.";
};


func int dia_wegelagerer_question_condition()
{
	if(Npc_KnowsInfo(other,dia_1051_wegelagerer_hello) && (BDT_1051_WEGELAGERER_ANGRIFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_question_info()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_15_00");	//Just asking.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_07_01");	//Understood. But what are YOU doing here?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_07_02");	//Anyway, this is our road and we don't like it when someone bothers us here.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		Info_AddChoice(dia_1051_wegelagerer_question,"I'm looking for a novice.",dia_1051_wegelagerer_question_novice);
	};
	Info_AddChoice(dia_1051_wegelagerer_question,"That's none of your business.",dia_1051_wegelagerer_question_myconcern);
	Info_AddChoice(dia_1051_wegelagerer_question,"I'm only having a look around.",dia_1051_wegelagerer_question_lookaround);
};

func void dia_1051_wegelagerer_question_novice()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_Novice_15_00");	//I'm looking for a novice.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_07_01");	//That's very interesting. We're looking for someone, too.
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_question,"Who are you looking for?",dia_1051_wegelagerer_question_novice_who);
};

func void dia_1051_wegelagerer_question_novice_who()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_Novice_Who_15_00");	//And who would that be?
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_Novice_Who_07_01");	//You!
	BDT_1051_WEGELAGERER_ANGRIFF = TRUE;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(dia_1051_wegelagerer_question);
};

func void dia_1051_wegelagerer_question_myconcern()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_15_00");	//That's none of your business.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_07_01");	//What do you mean? Are you looking for trouble?
	Info_ClearChoices(dia_1051_wegelagerer_question);
	Info_AddChoice(dia_1051_wegelagerer_question,"No, never mind. No trouble.",dia_1051_wegelagerer_question_myconcern_no);
	Info_AddChoice(dia_1051_wegelagerer_question,"If you insist.",dia_1051_wegelagerer_question_myconcern_yes);
};

func void dia_1051_wegelagerer_question_myconcern_no()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_No_15_00");	//No, never mind. No trouble.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_No_07_01");	//I understand, you filled your pants. Now scram.
	AI_StopProcessInfos(self);
};

func void dia_1051_wegelagerer_question_myconcern_yes()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_15_00");	//If you insist.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_01");	//Ho ho, you've got a big mouth.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_MyConcern_Yes_07_02");	//It's time I shut it for you.
	BDT_1051_WEGELAGERER_ANGRIFF = TRUE;
	Npc_SetRefuseTalk(self,40);
	Info_ClearChoices(dia_1051_wegelagerer_question);
};

func void dia_1051_wegelagerer_question_lookaround()
{
	AI_Output(other,self,"DIA_1051_Wegelagerer_Question_LookAround_15_00");	//I'm only having a look around.
	AI_Output(self,other,"DIA_1051_Wegelagerer_Question_LookAround_07_01");	//Do that, but stop bugging us.
	AI_StopProcessInfos(self);
};


instance DIA_WEGELAGERER_ANGRIFF(C_INFO)
{
	npc = bdt_1051_wegelagerer;
	nr = 2;
	condition = dia_wegelagerer_angriff_condition;
	information = dia_wegelagerer_angriff_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_wegelagerer_angriff_condition()
{
	var C_NPC pal;
	pal = Hlp_GetNpc(bdt_1052_wegelagerer);
	if((Npc_RefuseTalk(self) == FALSE) && ((BDT_1051_WEGELAGERER_ANGRIFF == TRUE) || c_npcisdown(pal)))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_angriff_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF_07_00");	//That's it for you.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1052_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

