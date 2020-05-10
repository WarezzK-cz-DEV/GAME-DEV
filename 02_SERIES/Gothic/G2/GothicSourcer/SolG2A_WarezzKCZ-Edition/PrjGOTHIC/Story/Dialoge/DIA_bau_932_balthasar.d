
instance DIA_BALTHASAR_EXIT(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 999;
	condition = dia_balthasar_exit_condition;
	information = dia_balthasar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_balthasar_exit_condition()
{
	return TRUE;
};

func void dia_balthasar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTHASAR_HALLO(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 3;
	condition = dia_balthasar_hallo_condition;
	information = dia_balthasar_hallo_info;
	description = "How are things?";
};


func int dia_balthasar_hallo_condition()
{
	return TRUE;
};

func void dia_balthasar_hallo_info()
{
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_00");	//How are things?
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_01");	//Ah, a new face here on the farm. Has the old skinflint finally granted me an apprentice?
	AI_Output(other,self,"DIA_Balthasar_HALLO_15_02");	//I'm not an apprentice.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_03");	//Oh. I see. I'm not as young as I used to be, you know? And I've been waiting for a replacement for years.
	AI_Output(self,other,"DIA_Balthasar_HALLO_05_04");	//You aren't here because the neighbors are annoyed, are you?
};


instance DIA_BALTHASAR_WASMACHSTDU(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 4;
	condition = dia_balthasar_wasmachstdu_condition;
	information = dia_balthasar_wasmachstdu_info;
	description = "What's the work you do here?";
};


func int dia_balthasar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo))
	{
		return TRUE;
	};
};

func void dia_balthasar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Balthasar_WASMACHSTDU_15_00");	//What's the work you do here?
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_01");	//Oh, I guard the sheep, and I've been doing that for as long as I can remember.
	AI_Output(self,other,"DIA_Balthasar_WASMACHSTDU_05_02");	//The animals are very loyal and very smart, you see. If you treat them well, they'll follow you for a lifetime.
};


instance DIA_ADDON_BALTHASAR_RANGERBANDITS(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_addon_balthasar_rangerbandits_condition;
	information = dia_addon_balthasar_rangerbandits_info;
	description = "Have you seen any bandits passing through here?";
};


func int dia_addon_balthasar_rangerbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_hallo) && ((MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING) || (SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)))
	{
		return TRUE;
	};
};

func void dia_addon_balthasar_rangerbandits_info()
{
	AI_Output(other,self,"DIA_Addon_Balthasar_Rangerbandits_15_00");	//Have you seen any bandits passing through here?
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_01");	//I certainly have. They passed along the edge of the field near Sekob's farm and entered the forest to the north.
	if(MIS_VATRAS_FINDTHEBANDITTRADER == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_02");	//They were carrying loads of weapons. They looked like they were all set to win the war against the orcs.
	};
	if(SC_KNOWSLUCIACAUGHTBYBANDITS == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_03");	//If my eyes didn't deceive me, they were also dragging a young woman along to the forest.
		AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_04");	//I really hope they left her alone.
	};
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Addon_Balthasar_Rangerbandits_05_05");	//I'm just glad they stayed away from our farm.
};


instance DIA_BALTHASAR_AERGERMITNACHBARN(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 5;
	condition = dia_balthasar_aergermitnachbarn_condition;
	information = dia_balthasar_aergermitnachbarn_info;
	description = "What's the trouble with your neighbors?";
};


func int dia_balthasar_aergermitnachbarn_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_aergermitnachbarn_info()
{
	AI_Output(other,self,"DIA_Balthasar_AERGERMITNACHBARN_15_00");	//What's the trouble with your neighbors?
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_01");	//The grass on this side of the big field is always so stunted and dry. So I mostly go to the big pastures of the other farmers.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_02");	//The landowner doesn't mind, but Bengar, the farmer on the high pastures, always makes a huge deal out of it when I take the animals up there.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_03");	//He says Sekob should pay if I take his animals onto Bengar's pasture.
	AI_Output(self,other,"DIA_Balthasar_AERGERMITNACHBARN_05_04");	//But Sekob won't spend a measly coin for that, so I can't go up onto the plateau anymore.
};


instance DIA_BALTHASAR_WOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 10;
	condition = dia_balthasar_wobengar_condition;
	information = dia_balthasar_wobengar_info;
	description = "Where can I find the high pastures and Bengar's farm?";
};


func int dia_balthasar_wobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_balthasar_wobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_WOBENGAR_15_00");	//Where can I find the high pastures and Bengar's farm?
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_01");	//Follow this path and cross the big crossroad.
	AI_Output(self,other,"DIA_Balthasar_WOBENGAR_05_02");	//If you stick to the right, you'll see a big outcropping of rock. Behind that to the right are the high pastures and the pass.
};


instance DIA_BALTHASAR_TALKTOBENGAR(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 6;
	condition = dia_balthasar_talktobengar_condition;
	information = dia_balthasar_talktobengar_info;
	description = "Maybe I should talk to Bengar.";
};


func int dia_balthasar_talktobengar_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_aergermitnachbarn) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_talktobengar_info()
{
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_00");	//Maybe I should talk to Bengar.
	AI_Output(self,other,"DIA_Balthasar_TALKTOBENGAR_05_01");	//You'd do that for me? What will you tell him, I mean, I don't want any trouble, you hear?
	AI_Output(other,self,"DIA_Balthasar_TALKTOBENGAR_15_02");	//We'll see about that.
	Log_CreateTopic(TOPIC_BALTHASARSSCHAFE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTHASARSSCHAFE,LOG_RUNNING);
	b_logentry(TOPIC_BALTHASARSSCHAFE,"Farmer Bengar has forbidden Balthasar the shepherd to take his sheep to the high pastures.");
	MIS_BALTHASAR_BENGARSWEIDE = LOG_RUNNING;
};


instance DIA_BALTHASAR_BENGARUEBERREDET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 8;
	condition = dia_balthasar_bengarueberredet_condition;
	information = dia_balthasar_bengarueberredet_info;
	description = "You can bring your sheep back to Bengar's pastures.";
};


func int dia_balthasar_bengarueberredet_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_talktobengar) && (MIS_BALTHASAR_BENGARSWEIDE == LOG_SUCCESS) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && ((Npc_IsDead(balthasarsheep1) == FALSE) || (Npc_IsDead(balthasarsheep2) == FALSE) || (Npc_IsDead(balthasarsheep3) == FALSE)))
	{
		return TRUE;
	};
};

func void dia_balthasar_bengarueberredet_info()
{
	AI_Output(other,self,"DIA_Balthasar_BENGARUEBERREDET_15_00");	//You can bring your sheep back to Bengar's pastures. I've talked to him.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_01");	//Thank you. I'll be right on my way.
	AI_Output(self,other,"DIA_Balthasar_BENGARUEBERREDET_05_02");	//Here, take these sheepskins as a token of my appreciation.
	b_giveinvitems(self,other,itat_sheepfur,10);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"BengarsWeide");
	b_giveplayerxp(XP_BALTHASAR_BENGARSWEIDE);
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(sheep,"NW_BIGMILL_FARM3_BALTHASAR");
	Wld_InsertNpc(hammel,"NW_BIGMILL_FARM3_BALTHASAR");
	BALTHASARSHEEP1 = Hlp_GetNpc(balthasar_sheep1);
	if(Hlp_IsValidNpc(balthasarsheep1) && !Npc_IsDead(balthasarsheep1))
	{
		AI_StartState(balthasarsheep1,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP2 = Hlp_GetNpc(balthasar_sheep2);
	if(Hlp_IsValidNpc(balthasarsheep2) && !Npc_IsDead(balthasarsheep2))
	{
		AI_StartState(balthasarsheep2,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
	BALTHASARSHEEP3 = Hlp_GetNpc(balthasar_sheep3);
	if(Hlp_IsValidNpc(balthasarsheep3) && !Npc_IsDead(balthasarsheep3))
	{
		AI_StartState(balthasarsheep3,zs_mm_rtn_follow_sheep_balthasar,1,"");
	};
};


instance DIA_BALTHASAR_PERMKAP1(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 70;
	condition = dia_balthasar_permkap1_condition;
	information = dia_balthasar_permkap1_info;
	permanent = TRUE;
	description = "Everything else all right?";
};


func int dia_balthasar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_balthasar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_balthasar_permkap1_info()
{
	AI_Output(other,self,"DIA_Balthasar_PERMKAP1_15_00");	//Everything else all right?
	Npc_PerceiveAll(self);
	if((Wld_DetectNpc(self,balthasar_sheep1,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep2,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,balthasar_sheep3,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)) || (Wld_DetectNpc(self,hammel,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 2000)))
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_01");	//I can't complain. Thanks for asking.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_02");	//These are bad times. I can't find my sheep!
		if(Npc_IsDead(sekob) == FALSE)
		{
			AI_Output(self,hero,"DIA_Balthasar_PERMKAP1_05_03");	//I guess I'll have to fess up to Sekob.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
	};
};


instance DIA_BALTHASAR_PICKPOCKET(C_INFO)
{
	npc = bau_932_balthasar;
	nr = 900;
	condition = dia_balthasar_pickpocket_condition;
	information = dia_balthasar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_balthasar_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_balthasar_pickpocket_info()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_BACK,dia_balthasar_pickpocket_back);
	Info_AddChoice(dia_balthasar_pickpocket,DIALOG_PICKPOCKET,dia_balthasar_pickpocket_doit);
};

func void dia_balthasar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_balthasar_pickpocket);
};

func void dia_balthasar_pickpocket_back()
{
	Info_ClearChoices(dia_balthasar_pickpocket);
};

