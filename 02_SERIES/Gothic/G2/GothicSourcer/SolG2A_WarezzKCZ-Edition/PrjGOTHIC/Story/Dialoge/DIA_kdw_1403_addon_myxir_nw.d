
instance DIA_ADDON_MYXIR_EXIT(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 999;
	condition = dia_addon_myxir_exit_condition;
	information = dia_addon_myxir_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_HALLO(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_hallo_condition;
	information = dia_addon_myxir_hallo_info;
	description = "Everything all right?";
};


func int dia_addon_myxir_hallo_condition()
{
	return TRUE;
};

func void dia_addon_myxir_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_Hallo_15_00");	//Everything all right?
	AI_Output(self,other,"DIA_Addon_Myxir_Hallo_12_01");	//It's very brave of you to just walk in here.
};


instance DIA_ADDON_MYXIR_WASMACHSTDU(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 5;
	condition = dia_addon_myxir_wasmachstdu_condition;
	information = dia_addon_myxir_wasmachstdu_info;
	description = "What are you doing here?";
};


func int dia_addon_myxir_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WasMachstDu_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_01");	//I'm studying the language of the builders.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_02");	//The language is the key to understanding the ancient people.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_03");	//Each one of us must learn it, or this expedition will be over before it even begins.
	AI_Output(self,other,"DIA_Addon_Myxir_WasMachstDu_12_04");	//The builders used stone tablets to pass on their knowledge. Unfortunately, many of them are broken or were stolen long ago.
};


instance DIA_ADDON_MYXIR_WILLYOUTEACHME(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 10;
	condition = dia_addon_myxir_willyouteachme_condition;
	information = dia_addon_myxir_willyouteachme_info;
	description = "Can you teach me to read the language of the architects?";
};


func int dia_addon_myxir_willyouteachme_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_willyouteachme_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_WillYouTeachMe_15_00");	//Can you teach me to read the language?
	AI_Output(self,other,"DIA_Addon_Myxir_WillYouTeachMe_12_01");	//Well. Why not? I'll gladly pass on my knowledge to you.
	MYXIR_ADDON_TEACHPLAYER = TRUE;
};


instance DIA_ADDON_MYXIR_TEACH(C_INFO)
{
	npc = kdw_1403_addon_myxir_nw;
	nr = 90;
	condition = dia_addon_myxir_teach_condition;
	information = dia_addon_myxir_teach_info;
	permanent = TRUE;
	description = "Teach me that language.";
};


var int dia_addon_myxir_teach_noperm;

func int dia_addon_myxir_teach_condition()
{
	if((MYXIR_ADDON_TEACHPLAYER == TRUE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Teach me that language.
	if(KNOW_FOREIGNLANGUAGE == FALSE)
	{
		b_dia_addon_myxir_teach_fl();
		b_dia_addon_myxir_teach_language_x();
		AI_PrintScreen("Learn language of the builders",-1,-1,FONT_SCREENBRIGHTLARGE,3);
		Info_ClearChoices(dia_addon_myxir_teach);
		KNOW_FOREIGNLANGUAGE = TRUE;
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_TEACH_NOPERM = TRUE;
	};
};

