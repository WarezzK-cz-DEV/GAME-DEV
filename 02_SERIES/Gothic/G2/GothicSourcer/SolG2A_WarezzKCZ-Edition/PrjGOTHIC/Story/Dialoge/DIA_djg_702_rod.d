
instance DIA_RODDJG_EXIT(C_INFO)
{
	npc = djg_702_rod;
	nr = 999;
	condition = dia_roddjg_exit_condition;
	information = dia_roddjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_roddjg_exit_condition()
{
	return TRUE;
};

func void dia_roddjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_HALLO(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_hallo_condition;
	information = dia_roddjg_hallo_info;
	description = "Everything all right with you?";
};


func int dia_roddjg_hallo_condition()
{
	if(DJG_SWAMPPARTY == FALSE)
	{
		return TRUE;
	};
};

func void dia_roddjg_hallo_info()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_15_00");	//Everything all right with you?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_01");	//These boots are killing me! The new armor is really great, but why do the straps on these boots have to be so tight?
	AI_Output(self,other,"DIA_RodDJG_HALLO_06_02");	//If I loosen them, the boots nearly drop off my feet.
	if((Npc_IsDead(swampdragon) == FALSE) && (DJG_SWAMPPARTY == FALSE))
	{
		Info_AddChoice(dia_roddjg_hallo,"What are you waiting for?",dia_roddjg_hallo_warten);
	};
	Info_AddChoice(dia_roddjg_hallo,"Where did you get those boots?",dia_roddjg_hallo_woher);
};

func void dia_roddjg_hallo_woher()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_Woher_15_00");	//Where did you get those boots?
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_01");	//That old warhorse Bennet made them for us Dragon hunters, and had us pay him generously for that junk to boot.
	AI_Output(self,other,"DIA_RodDJG_HALLO_Woher_06_02");	//If I ever lay hands on him, I'll make him eat the things first and then force him to give me my money back.
};

func void dia_roddjg_hallo_warten()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_15_00");	//What are you waiting for?
	Info_ClearChoices(dia_roddjg_hallo);
	if(Npc_IsDead(djg_cipher) == FALSE)
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_01");	//For Cipher to get his ass going at last. It's about time we left.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_02");	//I had been thinking about having a closer look at that swampy area over there.
		AI_Output(self,other,"DIA_RodDJG_HALLO_warten_06_03");	//What do you think? Should we go over there together and see what we can find?
		Info_AddChoice(dia_roddjg_hallo,"I'll go by myself.",dia_roddjg_hallo_warten_allein);
		Info_AddChoice(dia_roddjg_hallo,"What do you know about the swamp region?",dia_roddjg_hallo_warten_wasweisstdu);
		Info_AddChoice(dia_roddjg_hallo,"Let's go in together.",dia_roddjg_hallo_warten_zusammen);
	};
};

func void dia_roddjg_hallo_warten_zusammen()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_zusammen_15_00");	//Let's go in together.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_zusammen_06_01");	//All right. Follow me, then.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
};

func void dia_roddjg_hallo_warten_wasweisstdu()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_wasweisstdu_15_00");	//What do you know about the swamp region?
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_wasweisstdu_06_01");	//Only that it stinks to high heaven, and that there's probably a load of gold to be had there. Isn't that enough?
};

func void dia_roddjg_hallo_warten_allein()
{
	AI_Output(other,self,"DIA_RodDJG_HALLO_warten_allein_15_00");	//I'll go by myself.
	AI_Output(self,other,"DIA_RodDJG_HALLO_warten_allein_06_01");	//Well, then, I wish you luck.
	AI_StopProcessInfos(self);
};


instance DIA_RODDJG_WARTEMAL(C_INFO)
{
	npc = djg_702_rod;
	condition = dia_roddjg_wartemal_condition;
	information = dia_roddjg_wartemal_info;
	permanent = TRUE;
	description = "What's the matter with you?";
};


func int dia_roddjg_wartemal_condition()
{
	if(Npc_KnowsInfo(other,dia_roddjg_hallo) || (DJG_SWAMPPARTY == TRUE))
	{
		return TRUE;
	};
};

func void dia_roddjg_wartemal_info()
{
	AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_00");	//What's the matter with you?
	if(((DJG_SWAMPPARTY == TRUE) || (Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_02") < 1000)) && Npc_IsDead(djg_cipher))
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_01");	//Listen, man. I think this thing is getting a bit out of hand. I'll just slip quietly away.
		DJG_SWAMPPARTY = FALSE;
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_02");	//(curses) These boots! These blasted boots!
	};
	if(Npc_IsDead(swampdragon))
	{
		AI_Output(other,self,"DIA_RodDJG_WARTEMAL_15_03");	//And what are you going to do now?
		AI_Output(self,other,"DIA_RodDJG_WARTEMAL_06_04");	//The questions you ask! First thing I'll buy myself some new boots, man!
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_ROD_PICKPOCKET(C_INFO)
{
	npc = djg_702_rod;
	nr = 900;
	condition = dia_rod_pickpocket_condition;
	information = dia_rod_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rod_pickpocket_condition()
{
	return c_beklauen(16,320);
};

func void dia_rod_pickpocket_info()
{
	Info_ClearChoices(dia_rod_pickpocket);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_BACK,dia_rod_pickpocket_back);
	Info_AddChoice(dia_rod_pickpocket,DIALOG_PICKPOCKET,dia_rod_pickpocket_doit);
};

func void dia_rod_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rod_pickpocket);
};

func void dia_rod_pickpocket_back()
{
	Info_ClearChoices(dia_rod_pickpocket);
};

