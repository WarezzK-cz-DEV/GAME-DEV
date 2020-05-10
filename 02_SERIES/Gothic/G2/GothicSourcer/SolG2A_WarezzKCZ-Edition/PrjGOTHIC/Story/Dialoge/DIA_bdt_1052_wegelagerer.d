
instance DIA_1052_WEGELAGERER_EXIT(C_INFO)
{
	npc = bdt_1052_wegelagerer;
	nr = 999;
	condition = dia_1052_wegelagerer_exit_condition;
	information = dia_1052_wegelagerer_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1052_wegelagerer_exit_condition()
{
	return TRUE;
};

func void dia_1052_wegelagerer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1052_WEGELAGERER_HELLO(C_INFO)
{
	npc = bdt_1052_wegelagerer;
	nr = 1;
	condition = dia_1052_wegelagerer_hello_condition;
	information = dia_1052_wegelagerer_hello_info;
	permanent = FALSE;
	description = "Who are you?";
};


func int dia_1052_wegelagerer_hello_condition()
{
	var C_NPC pal;
	pal = Hlp_GetNpc(bdt_1051_wegelagerer);
	if(c_npcisdown(pal) == FALSE)
	{
		return TRUE;
	};
};

func void dia_1052_wegelagerer_hello_info()
{
	AI_Output(other,self,"DIA_1052_Wegelagerer_Hello_15_00");	//Who are you?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_01");	//What is this? An interrogation?
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_02");	//I have nothing to tell you, but you might want to talk to my buddy here.
	AI_Output(self,other,"DIA_1052_Wegelagerer_Hello_06_03");	//But be careful, he doesn't take to strangers.
};


instance DIA_WEGELAGERER_ANGRIFF2(C_INFO)
{
	npc = bdt_1052_wegelagerer;
	nr = 2;
	condition = dia_wegelagerer_angriff2_condition;
	information = dia_wegelagerer_angriff2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_wegelagerer_angriff2_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && c_npcisdown(bdt_1051_wegelagerer))
	{
		return TRUE;
	};
};

func void dia_wegelagerer_angriff2_info()
{
	AI_Output(self,other,"DIA_Wegelagerer_ANGRIFF2_06_00");	//All right, buddy. You're in for it now.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,40);
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1051_wegelagerer.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

