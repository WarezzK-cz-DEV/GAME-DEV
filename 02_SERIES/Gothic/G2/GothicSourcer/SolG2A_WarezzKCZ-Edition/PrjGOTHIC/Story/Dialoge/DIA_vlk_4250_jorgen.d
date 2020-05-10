
instance DIA_JORGEN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap3_exit_condition;
	information = dia_jorgen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_PICKPOCKET(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 900;
	condition = dia_jorgen_pickpocket_condition;
	information = dia_jorgen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jorgen_pickpocket_condition()
{
	return c_beklauen(59,70);
};

func void dia_jorgen_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_BACK,dia_jorgen_pickpocket_back);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_pickpocket_doit);
};

func void dia_jorgen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jorgen_pickpocket);
};

func void dia_jorgen_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
};


instance DIA_JORGEN_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 4;
	condition = dia_jorgen_hallo_condition;
	information = dia_jorgen_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_hallo_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_hallo_info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Hey, you!
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//I see you belong to the magicians' monastery.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Yes, why?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Can you use another worker there?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Hey you, ever been to the monastery?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Maybe, why?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//Are they still taking on people?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//I wouldn't know where else to turn.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "Have you seen a novice walk past?";
};


func int dia_jorgen_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_novice_info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Have you seen a novice walk past?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//Yeah, sure, he went thataway.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//He jumped into the water off the bridge and swam like a shark was after him.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "If you're headed for the monastery, you should talk to Milten...";
};


func int dia_jorgen_milten_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (miltennw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_milten_info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//If you're headed for the monastery, you should talk to Milten. He'll surely be able to help you.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//What do you think, would they let me in there at all?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Perhaps. But the way you look, I can hardly imagine you in a novice's robe.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Enough of that nonsense - novice's robe indeed. It's the grub I'm after, or I'll be forced to eat the bark off the trees next.
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "Where do you come from?";
};


func int dia_jorgen_home_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_home_info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Where do you come from?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//I used to be captain of a big whaler, my boy. The sea is my home.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//My ship, the good old Magdalena, was sunk by pirates a few months ago, and now I'm stranded here.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//All I ever wanted was to go back to sea, but since I've come here, not one schooner has called at this accursed port.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//The only ship which is anchored in Khorinis is that blasted war galley of the King, and they don't take on anyone.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//So what else can I do? There's no work for me in town. I've tried everything.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "You had better get off the road.";
};


func int dia_jorgen_becarefull_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};

func void dia_jorgen_becarefull_info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//You had better get off the road.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//Don't worry. I've already noticed that the wilderness out here has become damned dangerous in the last couple of days.
};


instance DIA_JORGEN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap4_exit_condition;
	information = dia_jorgen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NEUHIER(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 41;
	condition = dia_jorgen_neuhier_condition;
	information = dia_jorgen_neuhier_info;
	description = "How's life in the monastery?";
};


func int dia_jorgen_neuhier_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_neuhier_info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//How's life in the monastery?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//I'm going out of my mind here!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//But anyway, thanks for the hint. Milten was indeed able to help me get a place here.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//I feel really stupid among those ever-nagging do-gooders.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//Well. What's a body to do? Before I starve in town, I'd rather do what the novices tell me to.
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "You'll be all right, I think.";
};


func int dia_jorgen_perm4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_jorgen_neuhier) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm4_onetime;

func void dia_jorgen_perm4_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//You'll be all right, I think.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Just imagine - I'm expected to weed their garden. If this carries on much longer, I'll go bonkers.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//What I need is some good old planks beneath my feet.
};


instance DIA_JORGEN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap5_exit_condition;
	information = dia_jorgen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 51;
	condition = dia_jorgen_bemycaptain_condition;
	information = dia_jorgen_bemycaptain_info;
	permanent = TRUE;
	description = "Maybe I could offer you a job as a captain.";
};


func int dia_jorgen_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_PYROKARCLEARDEMONTOWER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};


var int dia_jorgen_bemycaptain_onetime;

func void dia_jorgen_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Maybe I could offer you a job as a captain.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//You're not having me on, mate? If what you say is really true, I'm definitely in on it.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Errh... there's only a minor problem. I ate those novices out of half their larder.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//They're hopping mad, those fellows. I don't think that head magician will let me leave here just like that.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//First, I have to work off my debt with Pyrokar. I'm sorry.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jorgen is willing to be my captain, but I'd have to pay his debts at the monastery first.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "I took care of your bill.";
};


func int dia_jorgen_bemycaptain2_condition()
{
	if(MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//I took care of your bill. You're free.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Really? How did you manage that?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//You don't want to know.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//Oh well. Not that I really care. Thanks a million, again.
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//Now what about your offer? Can I still sign on with you?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//Great. And now we're out of here!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 53;
	condition = dia_jorgen_bemycaptain3_condition;
	information = dia_jorgen_bemycaptain3_info;
	description = "Be my captain.";
};


func int dia_jorgen_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Be my captain.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//I feel honored, but do you even have a ship and a crew?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//I should say, we'll need five men at least.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Good. I'll see what I can do. Wait for me at the harbor.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Aye, aye, sir.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JORGENISCAPTAIN = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JORGEN_LOSFAHREN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_losfahren_condition;
	information = dia_jorgen_losfahren_info;
	permanent = TRUE;
	description = "Are you ready to take me over to the island?";
};


func int dia_jorgen_losfahren_condition()
{
	if((JORGENISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_losfahren_info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Are you ready to take me over to the island?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//But certainly. Give me that chart.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Great. Then hoist the sails, and we're out of here.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//You had better check your gear first. Once we're at sea, there will be no way back.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//When you've done that, you should get some sleep. There's a bed made up for you in the captain's quarters. Good night.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//You need a ship, a crew of at least five men, and a nautical chart which I can use to navigate.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//We're not going to set sail until I see you've got everything you need.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JORGEN_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_perm5_notcaptain_condition;
	information = dia_jorgen_perm5_notcaptain_info;
	permanent = TRUE;
	description = "How are you?";
};


func int dia_jorgen_perm5_notcaptain_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm5_notcaptain_xpgiven;

func void dia_jorgen_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//How are you?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Fine. This is not a bad place.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//They still give me idiotic assignments, such as herding sheep, but they're not half as narrow-minded here as they were at the monastery.
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//I'll have to find another place to stay. Let's see where the winds shall blow me next.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap6_exit_condition;
	information = dia_jorgen_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

