
instance DIA_GORNDJG_EXIT(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 999;
	condition = dia_gorndjg_exit_condition;
	information = dia_gorndjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorndjg_exit_condition()
{
	return TRUE;
};

func void dia_gorndjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_STARTCAMP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_startcamp_condition;
	information = dia_gorndjg_startcamp_info;
	description = "I see you have joined the Dragon hunters.";
};


func int dia_gorndjg_startcamp_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_startcamp_info()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_15_00");	//I see you have joined the Dragon hunters.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_01");	//I followed Sylvio into the Valley of Mines, because I know my way around here best and wanted to get a clear picture of the situation.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_02");	//I'll tell you what. Something's definitely brewing here. I've never seen so many orcs in one place in all my life.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_12_03");	//It wouldn't amaze me if Garond and the paladins in the castle had all fled or been slain by now.
	Info_AddChoice(dia_gorndjg_startcamp,"I'll see you around.",dia_gorndjg_startcamp_by);
	Info_AddChoice(dia_gorndjg_startcamp,"What are you planning to do now?",dia_gorndjg_startcamp_wohin);
};

func void dia_gorndjg_startcamp_wohin()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_Wohin_15_00");	//What are your plans now?
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_01");	//I'll follow the boys here to the Valley of Mines first, and then take off later.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_Wohin_12_02");	//I really have to find out what the orcs are planning.
};

func void dia_gorndjg_startcamp_by()
{
	AI_Output(other,self,"DIA_GornDJG_STARTCAMP_By_15_00");	//I'll see you around.
	AI_Output(self,other,"DIA_GornDJG_STARTCAMP_By_12_01");	//Look out for yourself.
	AI_StopProcessInfos(self);
};


instance DIA_GORNDJG_HALLO(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_hallo_condition;
	information = dia_gorndjg_hallo_info;
	description = "So this is where you're holed up!";
};


func int dia_gorndjg_hallo_condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void dia_gorndjg_hallo_info()
{
	AI_Output(other,self,"DIA_GornDJG_HALLO_15_00");	//So this is where you holed up!
	AI_Output(self,other,"DIA_GornDJG_HALLO_12_01");	//You aren't so easy to kill yourself, eh?
};


instance DIA_GORNDJG_WHATSUP(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatsup_condition;
	information = dia_gorndjg_whatsup_info;
	description = "Have you caught anything yet?";
};


func int dia_gorndjg_whatsup_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatsup_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_15_00");	//Have you caught anything yet?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_12_01");	//I'm still waiting. I think there may be something to be had up there in the old rock ruins. There are lights up there at night, and I can hear screams.
	Info_ClearChoices(dia_gorndjg_whatsup);
	Info_AddChoice(dia_gorndjg_whatsup,"Maybe Lester?",dia_gorndjg_whatsup_lester);
	Info_AddChoice(dia_gorndjg_whatsup,"A dragon?",dia_gorndjg_whatsup_a_dragon);
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn is at the foot of the high plain to the old rock fortress. That way he can watch the high plain and the orc barrier.");
};

func void dia_gorndjg_whatsup_lester()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_Lester_15_00");	//Maybe it's Lester who has returned to his old ruin on the rock?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_Lester_12_01");	//Can't be. As far as I know, Lester doesn't live up there any more.
};

func void dia_gorndjg_whatsup_a_dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//A dragon?
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_01");	//Very likely. The high plain up there is guarded like the King's damn treasury. Alas, it's the only way to the fortress.
	AI_Output(self,other,"DIA_GornDJG_WHATSUP_A_Dragon_12_02");	//As if the dragons weren't bad enough already. They seem to have a few more monsters in tow.
	GORNDJG_WHATMONSTERS = TRUE;
	b_logentry(TOPIC_DRAGONHUNTER,"According to Gorn, there's a dragon in the old rock fortress.");
	Info_ClearChoices(dia_gorndjg_whatsup);
};


instance DIA_GORNDJG_WHATMONSTERS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_whatmonsters_condition;
	information = dia_gorndjg_whatmonsters_info;
	description = "What kind of monsters would those be?";
};


func int dia_gorndjg_whatmonsters_condition()
{
	if(GORNDJG_WHATMONSTERS == TRUE)
	{
		return TRUE;
	};
};

func void dia_gorndjg_whatmonsters_info()
{
	AI_Output(other,self,"DIA_GornDJG_WHATMONSTERS_15_00");	//What kind of monsters would those be?
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_01");	//I couldn't quite make them out properly, but they walk upright and have scaly skin. They move over the rocks like snappers that have gotten a whiff of prey.
	AI_Output(self,other,"DIA_GornDJG_WHATMONSTERS_12_02");	//I can hear them snuffling and snorting clear down here. I think they've taken over the whole plain up there.
};


instance DIA_GORNDJG_WAHTABOUTORCS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_wahtaboutorcs_condition;
	information = dia_gorndjg_wahtaboutorcs_info;
	description = "What about the orcs?";
};


func int dia_gorndjg_wahtaboutorcs_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_hallo))
	{
		return TRUE;
	};
};

func void dia_gorndjg_wahtaboutorcs_info()
{
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_00");	//What about the orcs?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_01");	//I've been watching them for quite a while. The barricade they set up down there must be hiding something. I suspect that crowds of them have already gathered back there.
	AI_Output(other,self,"DIA_GornDJG_WAHTABOUTORCS_15_02");	//You mean, even MORE than are here already?
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_03");	//It wouldn't amaze me if they tore down their palisade one evening and flooded across the land. I've got a bad feeling about this.
	AI_Output(self,other,"DIA_GornDJG_WAHTABOUTORCS_12_04");	//If that happens, I'll have to go back and warn Lee. He wants to get off the island anyway. By then, it'll be high time.
};


instance DIA_GORNDJG_HELPKILLDRACONIANS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_helpkilldraconians_condition;
	information = dia_gorndjg_helpkilldraconians_info;
	description = "Can you help me get into the fortress?";
};


func int dia_gorndjg_helpkilldraconians_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatmonsters) && Npc_KnowsInfo(other,dia_gorndjg_wahtaboutorcs) && (Npc_IsDead(rockdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_helpkilldraconians_info()
{
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_00");	//Can you help me get into the fortress?
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_01");	//I don't really know. I'm afraid the orcs will attack just at the very moment I look away.
	AI_Output(other,self,"DIA_GornDJG_HELPKILLDRACONIANS_15_02");	//That's paranoid!
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_03");	//Can't be helped. I'd never forgive myself if I came too late, you see? On the other hand...
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_04");	//Whatever! Why else am I here? Let's charge the plain and fight our way clear to the fortress.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_05");	//A little exercise can't hurt. Besides, I want to get a closer look at those beasts up there.
	AI_Output(self,other,"DIA_GornDJG_HELPKILLDRACONIANS_12_06");	//Let me know when you're ready!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn wants to help me to get to the rock fortress over the high plain.");
};


instance DIA_GORNDJG_LOSGEHTS(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_losgehts_condition;
	information = dia_gorndjg_losgehts_info;
	description = "Let's attack!";
};


func int dia_gorndjg_losgehts_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_helpkilldraconians))
	{
		return TRUE;
	};
};

func void dia_gorndjg_losgehts_info()
{
	AI_Output(other,self,"DIA_GornDJG_LOSGEHTS_15_00");	//Let's attack!
	AI_Output(self,other,"DIA_GornDJG_LOSGEHTS_12_01");	//Just like old times, eh? But I'll tell you something: This is my battle. This time I'm going in front!
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
	Wld_InsertNpc(draconian,"PLATEAU_ROUND07");
	Wld_InsertNpc(draconian,"PLATEAU_ROUND07");
};


instance DIA_GORNDJG_BISHIERHIN(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_bishierhin_condition;
	information = dia_gorndjg_bishierhin_info;
	important = TRUE;
};


func int dia_gorndjg_bishierhin_condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_gorndjg_bishierhin_info()
{
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_00");	//It was child's play. So, my friend, you'll have to take care of the rest. Make it hot for them! I'll go back and keep an eye on the orcs.
	AI_Output(other,self,"DIA_GornDJG_BISHIERHIN_15_01");	//No Problem. See you around!
	AI_Output(self,other,"DIA_GornDJG_BISHIERHIN_12_02");	//I should hope so!
	b_logentry(TOPIC_DRAGONHUNTER,"Gorn went back to his lookout post. He wants to keep watching the orcs.");
	b_giveplayerxp(XP_GORNDJGPLATEAUCLEAR);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNDJG_DRAGONDEAD(C_INFO)
{
	npc = pc_fighter_djg;
	condition = dia_gorndjg_dragondead_condition;
	information = dia_gorndjg_dragondead_info;
	description = "The rock dragon is dead!";
};


func int dia_gorndjg_dragondead_condition()
{
	if(Npc_KnowsInfo(other,dia_gorndjg_whatsup) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(rockdragon) == TRUE))
	{
		return TRUE;
	};
};

func void dia_gorndjg_dragondead_info()
{
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_00");	//The rock dragon is dead!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_01");	//I don't hear any more screams! Were you up in the rock fortress?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Yes!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_03");	//Ha ha! I thought as much. Wherever you show up, there won't be one stone left standing.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_04");	//What are you going to do now?
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_05");	//I'll stick around for a while and then make my way back to Lee. Maybe we'll meet again there!
	AI_Output(self,other,"DIA_GornDJG_DRAGONDEAD_12_06");	//I'm getting sick of this damned area. It's time we finally got out of this country.
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_07");	//See you later!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_FIGHTER_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_djg;
	nr = 900;
	condition = dia_fighter_djg_pickpocket_condition;
	information = dia_fighter_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_djg_pickpocket_condition()
{
	return c_beklauen(10,35);
};

func void dia_fighter_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_BACK,dia_fighter_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_djg_pickpocket_doit);
};

func void dia_fighter_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

func void dia_fighter_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_djg_pickpocket);
};

