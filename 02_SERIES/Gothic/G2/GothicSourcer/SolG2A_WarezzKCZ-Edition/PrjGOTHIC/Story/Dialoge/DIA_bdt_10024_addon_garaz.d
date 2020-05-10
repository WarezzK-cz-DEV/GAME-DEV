
instance DIA_ADDON_GARAZ_EXIT(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 999;
	condition = dia_addon_garaz_exit_condition;
	information = dia_addon_garaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_garaz_exit_condition()
{
	return TRUE;
};

func void dia_addon_garaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_GARAZ_PICKPOCKET(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 900;
	condition = dia_addon_garaz_pickpocket_condition;
	information = dia_addon_garaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_garaz_pickpocket_condition()
{
	return c_beklauen(66,80);
};

func void dia_addon_garaz_pickpocket_info()
{
	Info_ClearChoices(dia_addon_garaz_pickpocket);
	Info_AddChoice(dia_addon_garaz_pickpocket,DIALOG_BACK,dia_addon_garaz_pickpocket_back);
	Info_AddChoice(dia_addon_garaz_pickpocket,DIALOG_PICKPOCKET,dia_addon_garaz_pickpocket_doit);
};

func void dia_addon_garaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_garaz_pickpocket);
};

func void dia_addon_garaz_pickpocket_back()
{
	Info_ClearChoices(dia_addon_garaz_pickpocket);
};


instance DIA_ADDON_GARAZ_PROBLEME(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 2;
	condition = dia_addon_garaz_probleme_condition;
	information = dia_addon_garaz_probleme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_probleme_condition()
{
	return TRUE;
};

func void dia_addon_garaz_probleme_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_00");	//Wait a minute.
	AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Is there a problem?
	AI_Output(self,other,"DIA_Addon_Garaz_Probleme_08_02");	//Minecrawlers. Lots and lots of minecrawlers. We've run into a nest here.
};


instance DIA_ADDON_GARAZ_HI(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_hi_condition;
	information = dia_addon_garaz_hi_info;
	permanent = FALSE;
	description = "Why don't we attack the crawlers?";
};


func int dia_addon_garaz_hi_condition()
{
	if(!Npc_IsDead(bloodwyn) && (MINECRAWLER_KILLED <= 9))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_00");	//Why don't we attack the crawlers?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_01");	//I asked that, too. But the guards had 'more important things' to do.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_02");	//Bloodwyn has left it to me to remove this problem.
	AI_Output(other,self,"DIA_Addon_Garaz_Hi_15_03");	//I don't suppose you're planning to fight the crawlers.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_04");	//Why should I? So that we can get at the gold in the cave?
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_05");	//Bloodwyn will just take most of it for himself anyway. And I'm not risking my neck for the little bit I'd get.
	AI_Output(self,other,"DIA_Addon_Garaz_Hi_08_06");	//If YOU want to fight the crawlers - don't let me stop you. Only - don't lure them all out here, okay?
};


instance DIA_ADDON_GARAZ_BLOODWYN(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 8;
	condition = dia_addon_garaz_bloodwyn_condition;
	information = dia_addon_garaz_bloodwyn_info;
	permanent = FALSE;
	description = "Can you tell me more about Bloodwyn?";
};


func int dia_addon_garaz_bloodwyn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_garaz_hi) && (MINECRAWLER_KILLED <= 9) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_bloodwyn_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_00");	//Can you tell me more about Bloodwyn?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_01");	//Yes. He's a gold-hungry bastard. He inspects every new vein and every nugget.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_02");	//He can't go too far out of his way for gold. But we don't mean shit to him.
	AI_Output(other,self,"DIA_Addon_Garaz_Bloodwyn_15_03");	//And otherwise?
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_04");	//He thinks he's the greatest and can't stand it if someone is better off than he is. Okay - I wouldn't go up against him, even so.
	AI_Output(self,other,"DIA_Addon_Garaz_Bloodwyn_08_05");	//Just stay out of his way and don't provoke him - unless you want him to get furious and lose control...
	b_logentry(TOPIC_ADDON_TEMPEL,"Bloodwyn will definitely leave the temple when he finds out that a new gold vein has been found in the mine.");
	b_logentry(TOPIC_ADDON_TEMPEL,"When Bloodwyn is annoyed, he loses control. That will certainly be useful to me.");
};


instance DIA_ADDON_GARAZ_SIEG(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_sieg_condition;
	information = dia_addon_garaz_sieg_info;
	permanent = FALSE;
	description = "The crawlers are history.";
};


func int dia_addon_garaz_sieg_condition()
{
	if((MINECRAWLER_KILLED >= 9) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_sieg_info()
{
	AI_Output(other,self,"DIA_Addon_Garaz_Sieg_15_00");	//So, that should be it. The crawlers are finished.
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_01");	//Bloodwyn is already on the way. That's what you wanted, isn't it?
	AI_Output(self,other,"DIA_Addon_Garaz_Sieg_08_02");	//I mean, you slaughtered the crawlers so Bloodwyn would come here. So, whatever you're planning, do it NOW.
	b_giveplayerxp(XP_ADDON_BLOODYWYN);
	b_startotherroutine(bloodwyn,"GOLD");
};


instance DIA_ADDON_GARAZ_BLOOD(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_blood_condition;
	information = dia_addon_garaz_blood_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_blood_condition()
{
	if(Npc_IsDead(bloodwyn) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_blood_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_00");	//You sure showed that bum. Nice work.
	AI_Output(self,other,"DIA_Addon_Garaz_Blood_08_01");	//Then I'll take a look around the cave.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GOLD");
	b_startotherroutine(thorus,"TALK");
};


instance DIA_ADDON_GARAZ_GOLD(C_INFO)
{
	npc = bdt_10024_addon_garaz;
	nr = 3;
	condition = dia_addon_garaz_gold_condition;
	information = dia_addon_garaz_gold_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_garaz_gold_condition()
{
	if((Npc_GetDistToWP(self,"ADW_MINE_MC_GARAZ") <= 500) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_addon_garaz_gold_info()
{
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_00");	//Wow, man, there sure is a lot of gold here.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_01");	//To get to the chunks up there, we'd actually need a ladder.
	AI_Output(self,other,"DIA_Addon_Garaz_Gold_08_02");	//But since the fall of the Barrier, nobody's been using ladders any more... it's really too bad...
};

