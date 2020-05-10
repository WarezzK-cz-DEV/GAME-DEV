
instance DIA_REGIS_EXIT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 999;
	condition = dia_regis_exit_condition;
	information = dia_regis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_regis_exit_condition()
{
	return TRUE;
};

func void dia_regis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGIS_PICKPOCKET(C_INFO)
{
	npc = vlk_425_regis;
	nr = 900;
	condition = dia_regis_pickpocket_condition;
	information = dia_regis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_regis_pickpocket_condition()
{
	return c_beklauen(40,35);
};

func void dia_regis_pickpocket_info()
{
	Info_ClearChoices(dia_regis_pickpocket);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_BACK,dia_regis_pickpocket_back);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_PICKPOCKET,dia_regis_pickpocket_doit);
};

func void dia_regis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_regis_pickpocket);
};

func void dia_regis_pickpocket_back()
{
	Info_ClearChoices(dia_regis_pickpocket);
};


instance DIA_REGIS_HALLO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 1;
	condition = dia_regis_hallo_condition;
	information = dia_regis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_regis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_regis_hallo_info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Hey, you're new in town, huh?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Yes, and what about you?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//I've come from the mainland, and now I'm hanging about here. I'm almost out of gold, so all I can do now is join the militia, I guess.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//But I don't want to do that. I won't be slaughtered by those orcs on the King's behalf.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "What can you tell me about the militia?";
};


func int dia_regis_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_hallo))
	{
		return TRUE;
	};
};

func void dia_regis_miliz_info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//What can you tell me about the militia?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//One of the paladins has taken command. A certain Lord Andre.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//He's trying to mobilize half the city in case the orcs attack.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//But you need to be a citizen of the town in order to be admitted.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//As far as I know, if you're not a citizen, you can train anyway, but you won't be officially admitted.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "What else can you tell me about Lord Andre?";
};


func int dia_regis_andre_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_miliz))
	{
		return TRUE;
	};
};

func void dia_regis_andre_info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//What else can you tell me about Lord Andre?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//He has taken over the position of judge as well.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//If you cause any trouble in this town, you're going to have to answer to him.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//I was once in a brawl with a citizen.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//He went crying to Lord Andre and ratted me out.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//That little matter cost me 50 gold pieces.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//I was lucky that it happened at night, or others would have witnessed it.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//The more people complain about you in this town, the higher your penalty will be.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "Who did you fight with?";
};


func int dia_regis_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_andre))
	{
		return TRUE;
	};
};

func void dia_regis_valentino_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//Who did you fight with?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//With a fellow named Valentino. He often hangs out in the pub near the temple.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//I'm not usually a violent person. But THAT guy needed his face rearranged in the worst way...
};


instance DIA_REGIS_VALDEFEAT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valdefeat_condition;
	information = dia_regis_valdefeat_info;
	permanent = FALSE;
	description = "I met Valentino...";
};


func int dia_regis_valdefeat_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_valentino) && (valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_regis_valdefeat_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//I met Valentino...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//And?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//I gave him a sound beating...
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(laughs) He deserved it...
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Here - I found this ring on him when our little disagreement had been settled.
		b_giveinvitems(self,other,itri_valentinosring,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(grinning) You're welcome to pass it on to the next person who beats him up...
	};
};


var int regis_bogendieb;

instance DIA_REGIS_PERM(C_INFO)
{
	npc = vlk_425_regis;
	nr = 200;
	condition = dia_regis_perm_condition;
	information = dia_regis_perm_info;
	permanent = TRUE;
	description = "Has anything exciting happened?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Has anything exciting happened?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//You could say that.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//They robbed Bosper the bowmaker. What a brazen thing to do, I tell you!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//The fellow just ambled into the shop in broad daylight and grabbed himself a bow.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//And Bosper right after him, hollering 'Stop right there, you rogue!' But the thief was too fast.
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//And then an honest finder actually brought that stolen bow back to Bosper.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//That's odd - you'd think it's everyone for himself in times like these, but this man just drops in and returns that bow.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//Oh well, all's quiet. I suppose that when the orcs come, we can't fail to notice...
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//They actually found out that the mercenary is innocent, and they had to let him go.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Lord Hagen must be beside himself with rage.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//The entire city is abuzz with it. Do you remember Lothar, the paladin?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Maybe.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Anyway, he's dead. Murdered out in the street. They're blaming the mercenaries, of course.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "I'm trying to find a crew for a sea voyage.";
};


func int dia_regis_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_regis_crew_info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//I'm trying to find a crew for a sea voyage.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//I can't help you with that. You should probably have a look around the harbor, or maybe in the pub.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//If there are any sailors left here, you'll probably find them there.
};

