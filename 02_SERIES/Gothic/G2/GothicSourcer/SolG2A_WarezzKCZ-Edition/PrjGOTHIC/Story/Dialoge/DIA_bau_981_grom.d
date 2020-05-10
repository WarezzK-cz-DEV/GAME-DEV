
instance DIA_GROM_EXIT(C_INFO)
{
	npc = bau_981_grom;
	nr = 999;
	condition = dia_grom_exit_condition;
	information = dia_grom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grom_exit_condition()
{
	return TRUE;
};

func void dia_grom_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GROM_HALLO(C_INFO)
{
	npc = bau_981_grom;
	nr = 3;
	condition = dia_grom_hallo_condition;
	information = dia_grom_hallo_info;
	description = "Everything all right?";
};


func int dia_grom_hallo_condition()
{
	return TRUE;
};

func void dia_grom_hallo_info()
{
	AI_Output(other,self,"DIA_Grom_HALLO_15_00");	//Everything all right?
	AI_Output(self,other,"DIA_Grom_HALLO_08_01");	//Ah, an unfamiliar wanderer. I am very busy, so what do you want?
	Info_ClearChoices(dia_grom_hallo);
	Info_AddChoice(dia_grom_hallo,"What interesting things are there to see here?",dia_grom_hallo_waszusehen);
	Info_AddChoice(dia_grom_hallo,"What are you doing here?",dia_grom_hallo_was);
};

func void dia_grom_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Grom_HALLO_waszusehen_15_00");	//What interesting things are there to see here?
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_01");	//Interesting is well put. If you go deeper into the woods here, you will run into some very evil fellows.
	AI_Output(self,other,"DIA_Grom_HALLO_waszusehen_08_02");	//They're about ten feet tall, hairy, and in a really bad mood. So don't go there if you're not strong enough for them.
};

func void dia_grom_hallo_was()
{
	AI_Output(other,self,"DIA_Grom_HALLO_was_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Grom_HALLO_was_08_01");	//Well, the things a woodcutter and hunter usually does.
	Info_AddChoice(dia_grom_hallo,DIALOG_BACK,dia_grom_hallo_back);
};

func void dia_grom_hallo_back()
{
	Info_ClearChoices(dia_grom_hallo);
};


instance DIA_GROM_ASKTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 10;
	condition = dia_grom_askteacher_condition;
	information = dia_grom_askteacher_info;
	description = "Can you teach me something about hunting?";
};


func int dia_grom_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_hallo))
	{
		return TRUE;
	};
};

func void dia_grom_askteacher_info()
{
	AI_Output(other,self,"DIA_Grom_AskTeacher_15_00");	//Can you teach me something about hunting?
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_01");	//Sure. But first get me something decent to eat. I'm dying of hunger out here.
	AI_Output(self,other,"DIA_Grom_AskTeacher_08_02");	//I want a bottle of milk, a loaf of bread and a fat ham, then I'll teach you what you want.
	Log_CreateTopic(TOPIC_GROMASKTEACHER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GROMASKTEACHER,LOG_RUNNING);
	b_logentry(TOPIC_GROMASKTEACHER,"Grom the hunter will teach me what he knows if I get him a bottle of milk, a loaf of bread and ham.");
};


instance DIA_GROM_PAYTEACHER(C_INFO)
{
	npc = bau_981_grom;
	nr = 11;
	condition = dia_grom_payteacher_condition;
	information = dia_grom_payteacher_info;
	description = "Here's the food you wanted.";
};


func int dia_grom_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_grom_askteacher) && Npc_HasItems(other,itfo_milk) && Npc_HasItems(other,itfo_bread) && Npc_HasItems(other,itfo_bacon))
	{
		return TRUE;
	};
};

func void dia_grom_payteacher_info()
{
	b_giveinvitems(other,self,itfo_milk,1);
	b_giveinvitems(other,self,itfo_bread,1);
	b_giveinvitems(other,self,itfo_bacon,1);
	AI_Output(other,self,"DIA_Grom_PayTeacher_15_00");	//Here's the food you wanted.
	AI_Output(self,other,"DIA_Grom_PayTeacher_08_01");	//Fantastic. And now?
	GROM_TEACHANIMALTROPHY = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GROM_TEACHHUNTING(C_INFO)
{
	npc = bau_981_grom;
	nr = 12;
	condition = dia_grom_teachhunting_condition;
	information = dia_grom_teachhunting_info;
	permanent = TRUE;
	description = "Teach me how to hunt.";
};


func int dia_grom_teachhunting_condition()
{
	if(GROM_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};

func void dia_grom_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grom_TEACHHUNTING_15_00");	//Teach me how to hunt.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[4] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[9] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[5] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//What do you want to learn?
		Info_AddChoice(dia_grom_teachhunting,DIALOG_BACK,dia_grom_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Skin",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FUR)),dia_grom_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Remove teeth",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_grom_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[4] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Remove heart",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_HEART)),dia_grom_teachhunting_heart);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[9] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Remove mandibles",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_grom_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[5] == FALSE)
		{
			Info_AddChoice(dia_grom_teachhunting,b_buildlearnstring("Shadowbeast horn",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_SHADOWHORN)),dia_grom_teachhunting_shadowhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//I can't teach you anything you don't already know.
	};
};

func void dia_grom_teachhunting_back()
{
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Fur_08_00");	//Cut a slit in the animal's legs so that you can strip the skin off. Do that from front to back, not the other way around.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Teeth_08_00");	//When removing the teeth you have to take special care that they don't break when they come away from the skull.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_heart()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_HEART))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Heart_08_00");	//You remove the heart of the animal with a deft cut in the chest. But it's usually only worth it with special animals or magical beings.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_Mandibles_08_00");	//The mandibles of a minecrawler or field raider have to be removed with a very strong metal lever. They are lodged very deeply in the animal's skull.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};

func void dia_grom_teachhunting_shadowhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_ShadowHorn_08_00");	//To take off a shadowbeast horn, brace yourself against the skull with all your might, pulling on the horn and cutting the thing out with a hard blade.
	};
	Info_ClearChoices(dia_grom_teachhunting);
};


instance DIA_GROM_TEACHWOOD(C_INFO)
{
	npc = bau_981_grom;
	nr = 13;
	condition = dia_grom_teachwood_condition;
	information = dia_grom_teachwood_info;
	permanent = TRUE;
	description = "Improve woodcutting skill.";
};


func int dia_grom_teachwood_condition()
{
	if((GROM_TEACHANIMALTROPHY == TRUE) && (GROM_TEACHWOOD == FALSE))
	{
		return TRUE;
	};
};

func void dia_grom_teachwood_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	if((PLAYER_TALENT_WOODMASTER[0] == FALSE) || (PLAYER_TALENT_WOODMASTER[1] == FALSE) || (PLAYER_TALENT_WOODMASTER[2] == FALSE))
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_01");	//What do you want to learn?
		Info_AddChoice(dia_grom_teachwood,DIALOG_BACK,dia_grom_teachwood_back);
		if(PLAYER_TALENT_WOODMASTER[0] == FALSE)
		{
			Info_AddChoice(dia_grom_teachwood,b_buildlearnstring("Learn woodcutting - Lumberjack",b_getlearncosttalent(other,NPC_TALENT_WOODMASTER,WOODMASTERY_1)),dia_grom_teachwood_woodmastery_1);
		};
		if((PLAYER_TALENT_WOODMASTER[1] == FALSE) && (PLAYER_TALENT_WOODMASTER[0] == TRUE))
		{
			Info_AddChoice(dia_grom_teachwood,b_buildlearnstring("Learn woodcutting - Expert",b_getlearncosttalent(other,NPC_TALENT_WOODMASTER,WOODMASTERY_2)),dia_grom_teachwood_woodmastery_2);
		};
		if((PLAYER_TALENT_WOODMASTER[2] == FALSE) && (PLAYER_TALENT_WOODMASTER[0] == TRUE) && (PLAYER_TALENT_WOODMASTER[1] == TRUE))
		{
			Info_AddChoice(dia_grom_teachwood,b_buildlearnstring("Learn woodcutting - Master",b_getlearncosttalent(other,NPC_TALENT_WOODMASTER,WOODMASTERY_3)),dia_grom_teachwood_woodmastery_3);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grom_TEACHHUNTING_08_02");	//I can't teach you anything you don't already know.
		GROM_TEACHWOOD = TRUE;
	};
};

func void dia_grom_teachwood_back()
{
	Info_ClearChoices(dia_grom_teachwood);
};

func void dia_grom_teachwood_woodmastery_1()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentwoodmaster(self,other,WOODMASTERY_1);
	Info_ClearChoices(dia_grom_teachwood);
};

func void dia_grom_teachwood_woodmastery_2()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentwoodmaster(self,other,WOODMASTERY_2);
	Info_ClearChoices(dia_grom_teachwood);
};

func void dia_grom_teachwood_woodmastery_3()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentwoodmaster(self,other,WOODMASTERY_3);
	Info_ClearChoices(dia_grom_teachwood);
};


instance DIA_GROM_PICKPOCKET(C_INFO)
{
	npc = bau_981_grom;
	nr = 900;
	condition = dia_grom_pickpocket_condition;
	information = dia_grom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_grom_pickpocket_condition()
{
	return c_beklauen(75,40);
};

func void dia_grom_pickpocket_info()
{
	Info_ClearChoices(dia_grom_pickpocket);
	Info_AddChoice(dia_grom_pickpocket,DIALOG_BACK,dia_grom_pickpocket_back);
	Info_AddChoice(dia_grom_pickpocket,DIALOG_PICKPOCKET,dia_grom_pickpocket_doit);
};

func void dia_grom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grom_pickpocket);
};

func void dia_grom_pickpocket_back()
{
	Info_ClearChoices(dia_grom_pickpocket);
};

