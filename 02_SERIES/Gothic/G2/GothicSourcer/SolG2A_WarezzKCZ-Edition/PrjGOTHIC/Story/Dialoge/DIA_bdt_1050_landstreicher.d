
instance DIA_LANDSTREICHER_EXIT(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 999;
	condition = dia_landstreicher_exit_condition;
	information = dia_landstreicher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_landstreicher_exit_condition()
{
	return TRUE;
};

func void dia_landstreicher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_HALLO(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 5;
	condition = dia_landstreicher_hallo_condition;
	information = dia_landstreicher_hallo_info;
	important = TRUE;
};


func int dia_landstreicher_hallo_condition()
{
	return TRUE;
};

func void dia_landstreicher_hallo_info()
{
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//What's going on here?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//What do you mean?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//You're the second fellow to rush past here like he's been stung by bloodflies.
	Info_ClearChoices(dia_landstreicher_hallo);
	Info_AddChoice(dia_landstreicher_hallo,"I need to get going.",dia_landstreicher_hallo_weg);
	Info_AddChoice(dia_landstreicher_hallo,"Where did the other one go?",dia_landstreicher_hallo_wo);
	Info_AddChoice(dia_landstreicher_hallo,"Who was the other guy?",dia_landstreicher_hallo_wer);
};

func void dia_landstreicher_hallo_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//Where did the other one go?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//He ran up that way like lightning.
};

func void dia_landstreicher_hallo_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//Who was the other guy?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//He looked like one of those brainy novices from the monastery back there.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//You can say what you like, but somehow those guys aren't quite right in the head.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//Just look at their silly clothes. I wouldn't want to be caught in the street at night in those. (laughs)
		Info_AddChoice(dia_landstreicher_hallo,"Be careful what you say. I used to be a novice in the monastery myself.",dia_landstreicher_hallo_wer_vorsicht);
	};
};

func void dia_landstreicher_hallo_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//Be careful what you say. I used to be a novice in the monastery myself.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//(laughs) You poor swine. That certainly explains a few things.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//No offense. Be on your way. You're a busy man, don't let me keep you.
	Info_AddChoice(dia_landstreicher_hallo,"Somebody should teach you some manners.",dia_landstreicher_hallo_wer_vorsicht_manieren);
};

func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//Somebody should teach you some manners.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//Now don't be offended. All right, if you absolutely want a fight, you can have one.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//So show me what you've got, novice.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_landstreicher_hallo_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//I need to get going.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//Hey. No problem.
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_WASMACHSTDU(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 6;
	condition = dia_landstreicher_wasmachstdu_condition;
	information = dia_landstreicher_wasmachstdu_info;
	permanent = TRUE;
	description = "What's your business here?";
};


func int dia_landstreicher_wasmachstdu_condition()
{
	return TRUE;
};

func void dia_landstreicher_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//What's your business here?
	if(Npc_KnowsInfo(other,dia_landstreicher_hallo))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//You ask a damn lot of questions for such a young whippersnapper.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//Name the goblin cave we crawled through together, and I'll tell you my secrets.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//Otherwise, mind your own business.
	AI_StopProcessInfos(self);
};

