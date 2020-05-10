
instance DIA_BABERA_EXIT(C_INFO)
{
	npc = bau_934_babera;
	nr = 999;
	condition = dia_babera_exit_condition;
	information = dia_babera_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_babera_exit_condition()
{
	return TRUE;
};

func void dia_babera_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_HALLO(C_INFO)
{
	npc = bau_934_babera;
	nr = 1;
	condition = dia_babera_hallo_condition;
	information = dia_babera_hallo_info;
	description = "Hello, beautiful maid.";
};


func int dia_babera_hallo_condition()
{
	return TRUE;
};

func void dia_babera_hallo_info()
{
	AI_Output(other,self,"DIA_Babera_HALLO_15_00");	//Hello, beautiful maid.
	AI_Output(self,other,"DIA_Babera_HALLO_16_01");	//Stop trying to sweet-talk me, boy. Tell me what you want. I'm busy.
};


instance DIA_BABERA_WIESIEHTSAUS(C_INFO)
{
	npc = bau_934_babera;
	nr = 2;
	condition = dia_babera_wiesiehtsaus_condition;
	information = dia_babera_wiesiehtsaus_info;
	description = "How's the field work coming?";
};


func int dia_babera_wiesiehtsaus_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_hallo))
	{
		return TRUE;
	};
};

func void dia_babera_wiesiehtsaus_info()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_15_00");	//How's the field work coming?
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_01");	//Look at these huge fields we have to work, and you know how it's coming.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_16_02");	//Are you looking for farm work?
	Info_ClearChoices(dia_babera_wiesiehtsaus);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_babera_wiesiehtsaus,"No. Actually, I want to become a mercenary.",dia_babera_wiesiehtsaus_nein);
		Info_AddChoice(dia_babera_wiesiehtsaus,"Maybe.",dia_babera_wiesiehtsaus_vielleicht);
	};
};

func void dia_babera_wiesiehtsaus_vielleicht()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Vielleicht_15_00");	//Maybe.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_01");	//In that case, you should go and see our farmer Sekob, the old slave-driver. Maybe he's got something for you.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_02");	//Of course, you could also try Onar's farm at the end of the long road.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Vielleicht_16_03");	//But beware of the mercenaries. They don't take to strangers.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};

func void dia_babera_wiesiehtsaus_nein()
{
	AI_Output(other,self,"DIA_Babera_WIESIEHTSAUS_Nein_15_00");	//No. Actually, I want to become a mercenary.
	AI_Output(self,other,"DIA_Babera_WIESIEHTSAUS_Nein_16_01");	//Then you're wrong here. You can usually find the mercenaries on the landowner's farm.
	Info_ClearChoices(dia_babera_wiesiehtsaus);
};


instance DIA_BABERA_BRONKO(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_bronko_condition;
	information = dia_babera_bronko_info;
	description = "(ask about Bronko)";
};


func int dia_babera_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && Npc_KnowsInfo(other,dia_babera_wiesiehtsaus))
	{
		return TRUE;
	};
};

func void dia_babera_bronko_info()
{
	AI_Output(other,self,"DIA_Babera_BRONKO_15_00");	//Say, the nasty fellow over there...
	AI_Output(self,other,"DIA_Babera_BRONKO_16_01");	//That's Bronko. What about him?
	AI_Output(other,self,"DIA_Babera_BRONKO_15_02");	//Is that your farmer?
	AI_Output(self,other,"DIA_Babera_BRONKO_16_03");	//(laughs) Is that what he told you? Sekob is our farmer. Bronko is nothing but a layabout and ne'er-do-well. But strong as an ox.
	AI_Output(self,other,"DIA_Babera_BRONKO_16_04");	//That's why nobody says anything when he doesn't work.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_05");	//He fears no one except for you mercenaries.
	}
	else
	{
		AI_Output(self,other,"DIA_Babera_BRONKO_16_06");	//The only people who could get him to work are the mercenaries. He's afraid of them.
	};
	BABERA_BRONKOKEINBAUER = TRUE;
};


instance DIA_BABERA_ROSI(C_INFO)
{
	npc = bau_934_babera;
	nr = 3;
	condition = dia_babera_rosi_condition;
	information = dia_babera_rosi_info;
	description = "Where's Rosi?";
};


func int dia_babera_rosi_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING) && (KAPITEL >= 5) && (ROSIFOUNDKAP5 == FALSE))
	{
		return TRUE;
	};
};

func void dia_babera_rosi_info()
{
	AI_Output(other,self,"DIA_Babera_Rosi_15_00");	//Where's Rosi?
	AI_Output(self,other,"DIA_Babera_Rosi_16_01");	//She couldn't stand it here any longer and went north, into the woods.
	b_logentry(TOPIC_ROSISFLUCHT,"Rosi has run away from Sekob's farm. Babera says she left the farm and went towards the north, into the woods.");
	b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Rosi has run away from Sekob's farm. Babera says she left the farm and went towards the north, into the woods.");
};


instance DIA_BABERA_DUSTOERST(C_INFO)
{
	npc = bau_934_babera;
	nr = 10;
	condition = dia_babera_dustoerst_condition;
	information = dia_babera_dustoerst_info;
	permanent = TRUE;
	description = "And apart from that?";
};


func int dia_babera_dustoerst_condition()
{
	if(Npc_KnowsInfo(other,dia_babera_bronko))
	{
		return TRUE;
	};
};

func void dia_babera_dustoerst_info()
{
	AI_Output(other,self,"DIA_Babera_DUSTOERST_15_00");	//And apart from that?
	AI_Output(self,other,"DIA_Babera_DUSTOERST_16_01");	//I'm busy.
	AI_StopProcessInfos(self);
};


instance DIA_BABERA_PICKPOCKET(C_INFO)
{
	npc = bau_934_babera;
	nr = 900;
	condition = dia_babera_pickpocket_condition;
	information = dia_babera_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_babera_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_babera_pickpocket_info()
{
	Info_ClearChoices(dia_babera_pickpocket);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_BACK,dia_babera_pickpocket_back);
	Info_AddChoice(dia_babera_pickpocket,DIALOG_PICKPOCKET,dia_babera_pickpocket_doit);
};

func void dia_babera_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_babera_pickpocket);
};

func void dia_babera_pickpocket_back()
{
	Info_ClearChoices(dia_babera_pickpocket);
};

