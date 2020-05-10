
instance DIA_ADDON_LENNAR_EXIT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 999;
	condition = dia_addon_lennar_exit_condition;
	information = dia_addon_lennar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE_V2;
};


func int dia_addon_lennar_exit_condition()
{
	return TRUE;
};

func void dia_addon_lennar_exit_info()
{
	AI_Output(other,self,"DIA_Angar_DJG_Anwerben_Gehen_15_00");	//I'd gotta go
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_LENNAR_PICKPOCKET(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 900;
	condition = dia_addon_lennar_pickpocket_condition;
	information = dia_addon_lennar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_lennar_pickpocket_condition()
{
	return c_beklauen(65,100);
};

func void dia_addon_lennar_pickpocket_info()
{
	Info_ClearChoices(dia_addon_lennar_pickpocket);
	Info_AddChoice(dia_addon_lennar_pickpocket,DIALOG_BACK,dia_addon_lennar_pickpocket_back);
	Info_AddChoice(dia_addon_lennar_pickpocket,DIALOG_PICKPOCKET,dia_addon_lennar_pickpocket_doit);
};

func void dia_addon_lennar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_lennar_pickpocket);
};

func void dia_addon_lennar_pickpocket_back()
{
	Info_ClearChoices(dia_addon_lennar_pickpocket);
};


instance DIA_ADDON_LENNAR_HI(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 1;
	condition = dia_addon_lennar_hi_condition;
	information = dia_addon_lennar_hi_info;
	permanent = FALSE;
	description = "Hi.";
};


func int dia_addon_lennar_hi_condition()
{
	return TRUE;
};

func void dia_addon_lennar_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_00");	//Hi.
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_01");	//Hi, I'm Lennar. Welcome to the digger's camp.
	AI_Output(other,self,"DIA_Addon_Lennar_Hi_15_02");	//Diggers? I thought this was the bandit's camp...
	AI_Output(self,other,"DIA_Addon_Lennar_Hi_01_03");	//Right, but the bandits are also only here to dig. (shrugging) So...
};


instance DIA_ADDON_LENNAR_ATTENTAT(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 2;
	condition = dia_addon_lennar_attentat_condition;
	information = dia_addon_lennar_attentat_info;
	permanent = FALSE;
	description = "About the attempted murder of Esteban...";
};


func int dia_addon_lennar_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_lennar_attentat_info()
{
	b_say(other,self,"$ATTENTAT_ADDON_DESCRIPTION2");
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_00");	//(naively) Yes?
	AI_Output(other,self,"DIA_Addon_Lennar_ATTENTAT_15_01");	//Do you have any idea who was behind it?
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_02");	//(enthusiastically) Sure!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_03");	//(hectically) Let me tell you: I bet that Emilio is behind this!
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_04");	//(hectically) He always ran to the mine like a crazy man. He dug as much as he could.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_05");	//(slyly) But since the attack, he's been sitting on his bench, not budging an inch.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_06");	//(realizing) It's obvious! To get into the mine, he has to have a red stone from Esteban.
	AI_Output(self,other,"DIA_Addon_Lennar_ATTENTAT_01_07");	//(conspiratorially) I bet he doesn't dare look him in the eye.
	b_logentry(TOPIC_ADDON_ESTEBAN,"Lennar suspects Emilio because he no longer goes to Esteban.");
};


instance DIA_ADDON_LENNAR_INSPEKTOR(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 3;
	condition = dia_addon_lennar_inspektor_condition;
	information = dia_addon_lennar_inspektor_info;
	permanent = FALSE;
	description = "What would Emilio get out of Esteban's death?";
};


func int dia_addon_lennar_inspektor_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_attentat))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_inspektor_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Inspektor_15_00");	//What would Emilio get out of Esteban's death?
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_01");	//What do I know? Maybe he has a pal in the mine who would take over Esteban's place then.
	AI_Output(self,other,"DIA_Addon_Lennar_Inspektor_01_02");	//(to himself) Yeah, that would make sense...
};


instance DIA_ADDON_LENNAR_MINE(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 4;
	condition = dia_addon_lennar_mine_condition;
	information = dia_addon_lennar_mine_info;
	permanent = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};


func int dia_addon_lennar_mine_condition()
{
	if((MIS_SEND_BUDDLER == LOG_RUNNING) && (PLAYER_SENTBUDDLER < 3) && (Npc_HasItems(other,itmi_addon_stone_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_mine_info()
{
	b_say(other,self,"$MINE_ADDON_DESCRIPTION");
	b_giveinvitems(other,self,itmi_addon_stone_01,1);
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_00");	//You really do have a red stone for me.
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_01");	//Excellent. Now I'll work that damned rock to crumbs - I already know exactly where I'll go!
	AI_Output(self,other,"DIA_Addon_Lennar_Mine_01_02");	//One more thing - if you go mining, watch out that you don't strike too HARD. Otherwise your pickaxe will get wedged in the gold!
	b_upgrade_hero_hackchance(10);
	PLAYER_SENTBUDDLER = PLAYER_SENTBUDDLER + 1;
	b_giveplayerxp(XP_ADDON_MINE);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MINE");
};


instance DIA_ADDON_LENNAR_GOLD(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 5;
	condition = dia_addon_lennar_gold_condition;
	information = dia_addon_lennar_gold_info;
	permanent = FALSE;
	description = "Can you teach me anything about gold mining?";
};


func int dia_addon_lennar_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_hi))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_00");	//Can you teach me anything about gold mining?
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_01");	//Certainly, but if I teach you something, you'll be able to mine more gold.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_02");	//That's why I'm asking.
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_03");	//Sure. But if you can mine more, it's only fair if I get a share of it.
	AI_Output(other,self,"DIA_Addon_Lennar_Gold_15_04");	//Well...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_05");	//You might as well give me my share in advance. Let's say...
	AI_Output(self,other,"DIA_Addon_Lennar_Gold_01_06");	//Fifty gold pieces.
};


var int lennar_teachgold;

instance DIA_ADDON_LENNAR_TRAIN(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 6;
	condition = dia_addon_lennar_train_condition;
	information = dia_addon_lennar_train_info;
	permanent = TRUE;
	description = "Teach me something about gold mining! (50 gold)";
};


func int dia_addon_lennar_train_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_lennar_gold) && (LENNAR_TEACHGOLD == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lennar_train_info()
{
	AI_Output(other,self,"DIA_Addon_Lennar_Train_15_00");	//Teach me something about gold mining!
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_01");	//Good. Regular swings will take you forward. Don't overdo it - but also don't fall asleep swinging.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_02");	//And don't always strike at the same spot - try to work around a good-sized nugget.
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_03");	//Do that and you're on the way to becoming a master digger.
		b_upgrade_hero_hackchance(10);
		LENNAR_TEACHGOLD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Lennar_Train_01_04");	//First I want to see my share!
	};
};


instance DIA_ADDON_LENNAR_HACKER(C_INFO)
{
	npc = bdt_1096_addon_lennar;
	nr = 9;
	condition = dia_addon_lennar_hacker_condition;
	information = dia_addon_lennar_hacker_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_addon_lennar_hacker_condition()
{
	if(Npc_GetDistToWP(self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};

func void dia_addon_lennar_hacker_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10004_Lennar_Hacker_15_00");	//Everything all right?
	AI_Output(self,other,"DIA_Addon_BDT_10004_Lennar_Hacker_01_01");	//Nice and regular - that's the way to get the fat nuggets!
};

