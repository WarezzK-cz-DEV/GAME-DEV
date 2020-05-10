
instance DIA_GRIMBALD_EXIT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 999;
	condition = dia_grimbald_exit_condition;
	information = dia_grimbald_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grimbald_exit_condition()
{
	return TRUE;
};

func void dia_grimbald_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMBALD_HALLO(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_hallo_condition;
	information = dia_grimbald_hallo_info;
	description = "Are you waiting for someone?";
};


func int dia_grimbald_hallo_condition()
{
	return TRUE;
};


var int grimbald_pissoff;

func void dia_grimbald_hallo_info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Are you waiting for someone?
	if(Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//I'm hunting. That should be obvious.
		GRIMBALD_PISSOFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Not any more. You're here now, aren't you?
		Info_ClearChoices(dia_grimbald_hallo);
		Info_AddChoice(dia_grimbald_hallo,"I've got matters to attend to.",dia_grimbald_hallo_nein);
		Info_AddChoice(dia_grimbald_hallo,"What are you up to?",dia_grimbald_hallo_was);
		Info_AddChoice(dia_grimbald_hallo,"Why me?",dia_grimbald_hallo_ich);
	};
};

func void dia_grimbald_hallo_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Why me?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//You look strong. I could use a fellow like you.
};

func void dia_grimbald_hallo_was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//What are you up to?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//I want to hunt the snappers up there, but I think there may be too many for me alone.
	Info_AddChoice(dia_grimbald_hallo,"Count me out on that.",dia_grimbald_hallo_was_neinnein);
	Info_AddChoice(dia_grimbald_hallo,"Ok, I'll help you. You go first.",dia_grimbald_hallo_was_ja);
};

func void dia_grimbald_hallo_was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Count me out on that.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Then scram, coward.
	GRIMBALD_PISSOFF = TRUE;
	Info_ClearChoices(dia_grimbald_hallo);
};

func void dia_grimbald_hallo_was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//OK. I'll help you. You go first.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Sure thing. But don't get too close to the black troll back there. He'll rip you to pieces otherwise, got it?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//And woe betide you if you chicken out.
	b_startotherroutine(self,"Jagd");
	AI_StopProcessInfos(self);
};

func void dia_grimbald_hallo_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//I've got matters to attend to.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Don't talk nonsense. What can you possibly have to do here in the wilderness that's so important?
};


instance DIA_GRIMBALD_JAGD(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_jagd_condition;
	information = dia_grimbald_jagd_info;
	permanent = TRUE;
	description = "Can you teach me how to hunt?";
};


func int dia_grimbald_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_hallo) && (GRIMBALD_TEACHANIMALTROPHY == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_jagd_info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Can you teach me how to hunt?
	if((Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3)) || (GRIMBALD_PISSOFF == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Mmh. All right. You haven't been much help to me so far, but let's not be too harsh.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Sure. But that'll cost a bit.
		b_say_gold(self,other,200);
		Info_ClearChoices(dia_grimbald_jagd);
		Info_AddChoice(dia_grimbald_jagd,"I'll think about it.",dia_grimbald_jagd_zuviel);
		Info_AddChoice(dia_grimbald_jagd,"Alright here's your money.",dia_grimbald_jagd_ja);
	};
};

func void dia_grimbald_jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//All right. Here's your money.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Good. Then tell me when you want to learn something.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Bring me the money and you can learn something.
	};
	Info_ClearChoices(dia_grimbald_jagd);
};

func void dia_grimbald_jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//I'll think about it.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//If you say so.
	Info_ClearChoices(dia_grimbald_jagd);
};


instance DIA_GRIMBALD_TEACHHUNTING(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 12;
	condition = dia_grimbald_teachhunting_condition;
	information = dia_grimbald_teachhunting_info;
	permanent = TRUE;
	description = "Teach me how to hunt.";
};


func int dia_grimbald_teachhunting_condition()
{
	if(GRIMBALD_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_grimbald_teachhunting_onetime;

func void dia_grimbald_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Teach me how to hunt.
	if(DIA_GRIMBALD_TEACHHUNTING_ONETIME == FALSE)
	{
		b_startotherroutine(self,"JagdOver");
		DIA_GRIMBALD_TEACHHUNTING_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[9] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[10] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//What exactly do you want to know?
		Info_AddChoice(dia_grimbald_teachhunting,DIALOG_BACK,dia_grimbald_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Extract bloodfly stingers",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_grimbald_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Pull bloodfly wings",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_grimbald_teachhunting_bfwing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[2] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Remove claws",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CLAWS)),dia_grimbald_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[9] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Remove mandibles",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grimbald_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[10] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Remove crawler plates",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_grimbald_teachhunting_crawlerplate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[14] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Skin reptiles",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_REPTILESKIN)),dia_grimbald_teachhunting_reptileskin);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//You already know everything I could teach you.
	};
};

func void dia_grimbald_teachhunting_back()
{
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//It's really no problem removing a bloodfly's stinger. You just have to find the base and firmly shove in your knife.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//You can either just rip off the bloodfly's wings, or detach them with a sharp knife.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//There are different ways of removing claws. For some animals a strong blow is needed - with others, you can simply cut them off with a knife.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//Minecrawlers and field raiders have strong mandibles that you can remove from the animal's head with a strong jerk.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Minecrawler plates stick very tightly to the beasts' bodies, but you can get them off with a sharp, sturdy object.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_reptileskin()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_REPTILESKIN))
	{
		AI_PrintScreen("Learned: Skin reptiles",-1,52,FONT_SCREENBRIGHTLARGE,2);
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};


instance DIA_GRIMBALD_NOVCHASE(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_novchase_condition;
	information = dia_grimbald_novchase_info;
	description = "Have you seen a novice pass by here?";
};


func int dia_grimbald_novchase_condition()
{
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_grimbald_novchase_info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Have you seen a novice pass by here?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//A lot of peculiar figures passed by here today - including those two jokers up by the stone arch.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//A while ago, a novice from the Magicians of Fire was with them as well.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_TROLLTOT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_trolltot_condition;
	information = dia_grimbald_trolltot_info;
	important = TRUE;
};


func int dia_grimbald_trolltot_condition()
{
	if(Npc_IsDead(troll_black))
	{
		return TRUE;
	};
};

func void dia_grimbald_trolltot_info()
{
	var string concattext;
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//The black troll is dead. Nicely done. I never thought those could be killed at all. I won't forget that.
	other.lp = other.lp + 3;
	concattext = ConcatStrings(PRINT_LEARNLP,IntToString(3));
	PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
};


instance DIA_GRIMBALD_PICKPOCKET(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 900;
	condition = dia_grimbald_pickpocket_condition;
	information = dia_grimbald_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_grimbald_pickpocket_condition()
{
	return c_beklauen(85,250);
};

func void dia_grimbald_pickpocket_info()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_BACK,dia_grimbald_pickpocket_back);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_PICKPOCKET,dia_grimbald_pickpocket_doit);
};

func void dia_grimbald_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimbald_pickpocket);
};

func void dia_grimbald_pickpocket_back()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
};

