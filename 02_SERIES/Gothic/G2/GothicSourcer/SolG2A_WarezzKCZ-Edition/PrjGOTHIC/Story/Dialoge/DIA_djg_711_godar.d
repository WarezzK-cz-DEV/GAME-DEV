
instance DIA_GODAR_EXIT(C_INFO)
{
	npc = djg_711_godar;
	nr = 999;
	condition = dia_godar_exit_condition;
	information = dia_godar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_godar_exit_condition()
{
	return TRUE;
};

func void dia_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GODAR_HELLO(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_hello_condition;
	information = dia_godar_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_godar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_godar_hello_info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//Heh? What?
};


instance DIA_GODAR_COMEFROM(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_comefrom_condition;
	information = dia_godar_comefrom_info;
	permanent = FALSE;
	description = "Where do you come from?";
};


func int dia_godar_comefrom_condition()
{
	return TRUE;
};

func void dia_godar_comefrom_info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Where do you come from?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//We come from... eh, from the city.
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"You're bandits!",dia_godar_comefrom_bandits);
	Info_AddChoice(dia_godar_comefrom,"Why have I never seen you in town before?",dia_godar_comefrom_notcity);
	Info_AddChoice(dia_godar_comefrom,"I see. From the city, then.",dia_godar_comefrom_understand);
};

func void dia_godar_comefrom_bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//You're bandits!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Careful! You're biting off more than you can chew!
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Relax. I won't rat you out.",dia_godar_comefrom_bandits_keepcalm);
	Info_AddChoice(dia_godar_comefrom,"You can't scare me.",dia_godar_comefrom_bandits_nofear);
};

func void dia_godar_comefrom_bandits_keepcalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Relax. I won't rat you out.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//I hope so, for your sake. Otherwise you're dead!
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_bandits_nofear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//You can't scare me.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//We'll see about that.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_notcity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//I never saw you in town before.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//I can't stand people who stick their noses into things that don't concern them, understand?
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Nope.",dia_godar_comefrom_notcity_cutthroat);
	Info_AddChoice(dia_godar_comefrom,"I see, you come from the city.",dia_godar_comefrom_notcity_forget);
};

func void dia_godar_comefrom_notcity_forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//I see, you come from the city.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//Exactly.
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_notcity_cutthroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Nope.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Then I'll have to beat it into you.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//I see. From the city, then.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//See! You understand!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Here, have a swig!
	CreateInvItems(self,itfo_beer,1);
	b_giveinvitems(self,other,itfo_beer,1);
	b_useitem(other,itfo_beer);
	Info_ClearChoices(dia_godar_comefrom);
};


instance DIA_GODAR_PLAN(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_plan_condition;
	information = dia_godar_plan_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_godar_plan_condition()
{
	return TRUE;
};

func void dia_godar_plan_info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//We heard about the dragon hunt. So we packed up our stuff and came here.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//But to be honest, I don't give a shit about dragons. I just want a bit of gold.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//Dragons have gold, don't they?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Certainly.
};


instance DIA_GODAR_DRAGONLORE(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonlore_condition;
	information = dia_godar_dragonlore_info;
	permanent = FALSE;
	description = "What do you know about the dragons?";
};


func int dia_godar_dragonlore_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_dragonlore_info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//What do you know about the dragons?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//I only know the stories they tell the children.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//You know, virgins, gold, fire breathing, that kind of thing.
};


instance DIA_GODAR_DESTINATION(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_destination_condition;
	information = dia_godar_destination_info;
	permanent = FALSE;
	description = "Where are you planning to go from here?";
};


func int dia_godar_destination_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_destination_info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//Where are you planning to go from here?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//No idea. We're still thinking about it.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//You could go to the castle.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Wild horses couldn't drag me there. Not to the paladins.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//I'm not going back to jail. I was there once and that was enough for me.
	};
};


instance DIA_GODAR_ORKS(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_orks_condition;
	information = dia_godar_orks_info;
	permanent = FALSE;
	description = "What about the orcs?";
};


func int dia_godar_orks_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination))
	{
		return TRUE;
	};
};

func void dia_godar_orks_info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//What about the orcs?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//The whole castle is surrounded. There aren't any gaps.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Trying to sneak through there is insane. If you try to fight, you're a dead man.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Nobody gets through there.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Ah, really.
};


instance DIA_GODAR_PRISON(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_prison_condition;
	information = dia_godar_prison_info;
	permanent = FALSE;
	description = "What were you in the slammer for?";
};


func int dia_godar_prison_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_prison_info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//What were you in the slammer for?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Like I'm going to tell you that, huh?
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//You magicians are in cahoots with the paladins. Nah, my friend. Forget it.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//The swine nabbed me for poaching. For two lousy hares!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//They slapped me with 10 years for that.
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//That was all?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//Well, okay, of course I defended myself.
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//And?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//I couldn't do anything about it, the guy tripped and broke his neck. Honest!
		Info_ClearChoices(dia_godar_prison);
		Info_AddChoice(dia_godar_prison,"Sounds familiar.",dia_godar_prison_court);
		Info_AddChoice(dia_godar_prison,"You shouldn't have let yourself get caught.",dia_godar_prison_pissoff);
	};
};

func void dia_godar_prison_court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//Sounds familiar.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//You know what I mean. The rich bastards don't have any idea how we're treated.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//That doesn't worry them in the least.
	Info_ClearChoices(dia_godar_prison);
	GODARLIKESYOU = TRUE;
};

func void dia_godar_prison_pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//You shouldn't have let yourself get caught.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(angry) I bet you've never been in jail, have you?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Then I should teach you a lesson about what all can happen to a body in jail.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GODAR_HUNTING(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_hunting_condition;
	information = dia_godar_hunting_info;
	permanent = FALSE;
	description = "Can you teach me how to hunt?";
};


func int dia_godar_hunting_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_godar_hunting_info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Can you teach me how to hunt?
	if(GODARLIKESYOU == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//You aren't serious, are you? Beat it!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//An animal has more than just meat. You can sell the pelts or the claws. That can bring a tidy little sum.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//I can hardly wait to get my hands on a dragon.
		GODAR_TEACHANIMALTROPHY = TRUE;
	};
};


instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonstuff_condition;
	information = dia_godar_dragonstuff_info;
	permanent = TRUE;
	description = "Show me how to gut a dragon.";
};


var int godar_teachdragonstuff;

func int dia_godar_dragonstuff_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[12] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[13] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_godar_dragonstuff_info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Show me how to gut a dragon.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//So you can rake in all the dough yourself, huh?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//Well, all right, but that'll cost you 1000 gold coins.
	Info_ClearChoices(dia_godar_dragonstuff);
	Info_AddChoice(dia_godar_dragonstuff,"It's not worth that much to me.",dia_godar_dragonstuff_nein);
	Info_AddChoice(dia_godar_dragonstuff,"That's fair.",dia_godar_dragonstuff_fair);
};

func void dia_godar_dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//That's fair.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		GODAR_TEACHDRAGONSTUFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Without money it's not. First get the cash.
	};
	Info_ClearChoices(dia_godar_dragonstuff);
};

func void dia_godar_dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//It's not worth that much to me.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Suit yourself.
	Info_ClearChoices(dia_godar_dragonstuff);
};


instance DIA_GODAR_TEACH(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_teach_condition;
	information = dia_godar_teach_info;
	permanent = TRUE;
	description = "Show me how to hunt.";
};


func int dia_godar_teach_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_teach_info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Show me how to hunt.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[12] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[13] == FALSE))
	{
		Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Sneak",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1)),dia_godar_teach_thief_sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Remove teeth",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_godar_teach_trophys_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[8] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Bloodfly's stinger",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFSTING)),dia_godar_teach_trophys_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[7] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Bloodfly's wings",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_BFWING)),dia_godar_teach_trophys_bfwing);
		};
		if(GODAR_TEACHDRAGONSTUFF == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[12] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Remove dragon scales",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_godar_teach_trophys_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[13] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Collect dragon blood",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_godar_teach_trophys_dragonblood);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void dia_godar_teach_back()
{
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//The best way to remove the teeth is with a sturdy knife.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//The fastest way to remove a bloodfly's stinger is to squeeze it out before you cut it off.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//A bloodfly's wings are very sensitive. So be careful when you cut them off.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_thief_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Use soft footwear when you're sneaking. A stiff sole can be very noisy.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//You need a lot of strength to get the scales off a dragon. But you can handle that.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Look for a soft spot on the dragon's belly. That's where it's easiest to get dragon blood.
	};
	Info_ClearChoices(dia_godar_teach);
};


instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_alldragonsdead_condition;
	information = dia_godar_alldragonsdead_info;
	permanent = FALSE;
	description = "I've killed all the dragons.";
};


func int dia_godar_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_godar_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//I've killed all the dragons.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//Well, so what. Here in the valley there's still enough for us to get.
};


instance DIA_GODAR_PICKPOCKET(C_INFO)
{
	npc = djg_711_godar;
	nr = 900;
	condition = dia_godar_pickpocket_condition;
	information = dia_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_godar_pickpocket_condition()
{
	return c_beklauen(16,160);
};

func void dia_godar_pickpocket_info()
{
	Info_ClearChoices(dia_godar_pickpocket);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};

func void dia_godar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_godar_pickpocket);
};

func void dia_godar_pickpocket_back()
{
	Info_ClearChoices(dia_godar_pickpocket);
};

