
instance DIA_PEPE_EXIT(C_INFO)
{
	npc = bau_912_pepe;
	nr = 999;
	condition = dia_pepe_exit_condition;
	information = dia_pepe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pepe_exit_condition()
{
	return TRUE;
};

func void dia_pepe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEPE_HALLO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 1;
	condition = dia_pepe_hallo_condition;
	information = dia_pepe_hallo_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_pepe_hallo_condition()
{
	return TRUE;
};

func void dia_pepe_hallo_info()
{
	AI_Output(other,self,"DIA_Pepe_Hallo_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Pepe_Hallo_03_01");	//(bored) Guarding sheep! (sighs) And if possible, staying out of trouble.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pepe_Hallo_15_02");	//Doesn't always work, does it?
		AI_Output(self,other,"DIA_Pepe_Hallo_03_03");	//Nah, especially not with the mercenaries. I'm really glad to be out here on the pasture. Although that can be dangerous too.
	};
};


instance DIA_PEPE_DANGER(C_INFO)
{
	npc = bau_912_pepe;
	nr = 2;
	condition = dia_pepe_danger_condition;
	information = dia_pepe_danger_info;
	permanent = FALSE;
	description = "What's so dangerous in the pasture?";
};


func int dia_pepe_danger_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_danger_info()
{
	AI_Output(other,self,"DIA_Pepe_Danger_15_00");	//What's so dangerous in the pasture?
	AI_Output(self,other,"DIA_Pepe_Danger_03_01");	//There's a small pack of wolves that roams the area. Lately the damn beasts have come by and eaten one of my sheep almost every day.
	AI_Output(self,other,"DIA_Pepe_Danger_03_02");	//A few days ago, I had almost twice as many sheep. I don't want to think what Onar will do to me when he finds out.
};


instance DIA_PEPE_WHYNOTSLD(C_INFO)
{
	npc = bau_912_pepe;
	nr = 3;
	condition = dia_pepe_whynotsld_condition;
	information = dia_pepe_whynotsld_info;
	permanent = FALSE;
	description = "Why didn't you tell the mercenaries about the wolves? I thought they worked for you.";
};


func int dia_pepe_whynotsld_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_pepe_whynotsld_info()
{
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_00");	//Why didn't you tell the mercenaries about the wolves? I thought they worked for you.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_01");	//Yeah, I know. I should have done that. But I didn't, damnit.
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_02");	//And now, with so many sheep gone, I'm afraid to tell anyone about it at all.
	AI_Output(other,self,"DIA_Pepe_WhyNotSLD_15_03");	//But you just told ME...
	AI_Output(self,other,"DIA_Pepe_WhyNotSLD_03_04");	//(irritated) I'm already regretting that, too.
};


instance DIA_PEPE_KILLWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 4;
	condition = dia_pepe_killwolves_condition;
	information = dia_pepe_killwolves_info;
	permanent = FALSE;
	description = "What if I kill those wolves?";
};


func int dia_pepe_killwolves_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_danger))
	{
		return TRUE;
	};
};

func void dia_pepe_killwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_00");	//What if I kill those wolves?
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_01");	//(mocking) You, by yourself? Ha ha. I don't believe it. I'd sooner trust my bellwether to do that.
	AI_Output(other,self,"DIA_Pepe_KillWolves_15_02");	//Forget it. It was just a suggestion. I'll go over to the boys and see what THEY say about it...
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_03");	//(scared) Wait a minute. Okay, okay! Ehm... you're the greatest and you can take on a hundred wolves at once. No problem!
	AI_Output(self,other,"DIA_Pepe_KillWolves_03_04");	//Mostly they lurk between the trees near the pasture. (incidentally) I think there were only four...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(pepes_ywolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(pepes_ywolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(pepes_ywolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(pepes_ywolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_PEPE_KILLWOLVES = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PEPEWOLVES,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PEPEWOLVES,LOG_RUNNING);
	b_logentry(TOPIC_PEPEWOLVES,"Pepe's sheep are in danger from four wolves. I should drive them off.");
};


instance DIA_PEPE_KILLEDWOLVES(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_killedwolves_condition;
	information = dia_pepe_killedwolves_info;
	permanent = TRUE;
	description = "I've done in the wolves.";
};


func int dia_pepe_killedwolves_condition()
{
	if(MIS_PEPE_KILLWOLVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_pepe_killedwolves_info()
{
	AI_Output(other,self,"DIA_Pepe_KilledWolves_15_00");	//I've done in the wolves.
	if(Npc_IsDead(pepes_ywolf1) && Npc_IsDead(pepes_ywolf2) && Npc_IsDead(pepes_ywolf3) && Npc_IsDead(pepes_ywolf4))
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_01");	//(amazed) You did it! Thank Innos!
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_02");	//But now I still don't know how to tell Onar that all those sheep are gone.
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_03");	//(to himself) It's all that damn Bullco's fault!
		MIS_PEPE_KILLWOLVES = LOG_SUCCESS;
		b_giveplayerxp(XP_PEPEWOLVES);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_KilledWolves_03_04");	//I don't need you to make a fool out of me. The beasts aren't all dead.
	};
};


instance DIA_PEPE_BULLCO(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullco_condition;
	information = dia_pepe_bullco_info;
	permanent = FALSE;
	description = "What did you say about Bullco?";
};


func int dia_pepe_bullco_condition()
{
	if((MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && !Npc_IsDead(bullco) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_pepe_bullco_info()
{
	AI_Output(other,self,"DIA_Pepe_Bullco_15_00");	//What did you say about Bullco?
	AI_Output(self,other,"DIA_Pepe_Bullco_03_01");	//He's one of the mercenaries. It was actually his job to guard the pasture.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_02");	//But instead he and his pal Sylvio hang around Thekla in the kitchen all day.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_03");	//It's that bastard's fault if I don't get paid for weeks because of the lost sheep.
	AI_Output(self,other,"DIA_Pepe_Bullco_03_04");	//I wish I could at least punch him in the mouth for it. But nobody stands a chance against him. The guy's a killer.
	MIS_PEPE_KICKBULLCO = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KICKBULLCO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KICKBULLCO,LOG_RUNNING);
	b_logentry(TOPIC_KICKBULLCO,"Bullco should have taken better care of Pepe's sheep. Pepe wants someone to give him what for.");
};


instance DIA_PEPE_BULLCODEFEATED(C_INFO)
{
	npc = bau_912_pepe;
	nr = 5;
	condition = dia_pepe_bullcodefeated_condition;
	information = dia_pepe_bullcodefeated_info;
	permanent = FALSE;
	description = "Bullco got what was coming to him.";
};


func int dia_pepe_bullcodefeated_condition()
{
	if(MIS_PEPE_KICKBULLCO == LOG_RUNNING)
	{
		if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (djg_bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_pepe_bullcodefeated_info()
{
	AI_Output(other,self,"DIA_Pepe_BullcoDefeated_15_00");	//Bullco got what was coming to him. I've taught him a lesson.
	AI_Output(self,other,"DIA_Pepe_BullcoDefeated_03_01");	//The swine deserved it.
	MIS_PEPE_KICKBULLCO = LOG_SUCCESS;
	b_giveplayerxp(XP_KICKBULLCO);
};


instance DIA_PEPE_PERM(C_INFO)
{
	npc = bau_912_pepe;
	nr = 6;
	condition = dia_pepe_perm_condition;
	information = dia_pepe_perm_info;
	permanent = TRUE;
	description = "How are you, and how are your sheep?";
};


func int dia_pepe_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_perm_info()
{
	AI_Output(other,self,"DIA_Pepe_PERM_15_00");	//How are you, and how are your sheep?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_01");	//I'm fine. And so are the sheep. That is, the ones that are still here are doing all right.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_02");	//Good. But the wolves are bound to come back some day. And then there will probably be more of them!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_03");	//I heard the strangest things. Some sinister characters are said to have shown up at Sekob's. They're laying siege to his house.
	};
	if(KAPITEL >= 4)
	{
		AI_Output(self,other,"DIA_Pepe_PERM_03_04");	//I heard that some thugs have made themselves at home on Lobart's farm. Maybe someone should help him.
	};
};


instance DIA_PEPE_LIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 7;
	condition = dia_pepe_liesel_condition;
	information = dia_pepe_liesel_info;
	permanent = FALSE;
	description = "Can I buy a sheep?";
};


func int dia_pepe_liesel_condition()
{
	if(Npc_KnowsInfo(hero,dia_pepe_hallo))
	{
		return TRUE;
	};
};

func void dia_pepe_liesel_info()
{
	AI_Output(other,self,"DIA_Pepe_Liesel_15_00");	//Can I buy a sheep?
	AI_Output(self,other,"DIA_Pepe_Liesel_03_01");	//Any time, if you can pay the price. A sheep will cost you 100 gold pieces.
	AI_Output(self,other,"DIA_Pepe_Liesel_03_02");	//If you pay, you can take a sheep. But you have to treat it well.
};


var int pepe_schafgekauft;

instance DIA_PEPE_BUYLIESEL(C_INFO)
{
	npc = bau_912_pepe;
	nr = 8;
	condition = dia_pepe_buyliesel_condition;
	information = dia_pepe_buyliesel_info;
	permanent = TRUE;
	description = "Here's 100 gold pieces. Give me a sheep, then.";
};


func int dia_pepe_buyliesel_condition()
{
	if(Npc_KnowsInfo(other,dia_pepe_liesel))
	{
		return TRUE;
	};
};

func void dia_pepe_buyliesel_info()
{
	AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_00");	//Here's 100 gold pieces. Give me a sheep, then.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(PEPE_SCHAFGEKAUFT == 0)
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_01");	//Good. Then take Betsy - you'll find her in the pasture.
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_02");	//Just tell her she should follow you. She's pretty smart for a sheep. Treat her well!
		}
		else
		{
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_03");	//Again? Okay. Take Betsy.
			AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_04");	//Betsy? But the last sheep was called Betsy...
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_05");	//All the sheep are called Betsy.
			if(PEPE_SCHAFGEKAUFT == 3)
			{
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_06");	//Except for the rams, of course.
				AI_Output(other,self,"DIA_Pepe_BuyLiesel_15_07");	//And what are they called?
				AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
			};
		};
		PEPE_SCHAFGEKAUFT = PEPE_SCHAFGEKAUFT + 1;
		Wld_InsertNpc(follow_sheep,"NW_BIGFARM_SHEEP2_02");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_09");	//You don't have that much gold. I can't give you a sheep for less.
	};
};


instance DIA_PEPE_PICKPOCKET(C_INFO)
{
	npc = bau_912_pepe;
	nr = 900;
	condition = dia_pepe_pickpocket_condition;
	information = dia_pepe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_pepe_pickpocket_condition()
{
	return c_beklauen(15,25);
};

func void dia_pepe_pickpocket_info()
{
	Info_ClearChoices(dia_pepe_pickpocket);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_BACK,dia_pepe_pickpocket_back);
	Info_AddChoice(dia_pepe_pickpocket,DIALOG_PICKPOCKET,dia_pepe_pickpocket_doit);
};

func void dia_pepe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pepe_pickpocket);
};

func void dia_pepe_pickpocket_back()
{
	Info_ClearChoices(dia_pepe_pickpocket);
};

