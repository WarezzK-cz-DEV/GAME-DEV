
instance DIA_BRONKO_EXIT(C_INFO)
{
	npc = bau_935_bronko;
	nr = 999;
	condition = dia_bronko_exit_condition;
	information = dia_bronko_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bronko_exit_condition()
{
	return TRUE;
};

func void dia_bronko_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BRONKO_HALLO(C_INFO)
{
	npc = bau_935_bronko;
	nr = 1;
	condition = dia_bronko_hallo_condition;
	information = dia_bronko_hallo_info;
	important = TRUE;
};


func int dia_bronko_hallo_condition()
{
	return TRUE;
};

func void dia_bronko_hallo_info()
{
	AI_Output(self,other,"DIA_Bronko_HALLO_06_00");	//(fatherly) So, where are we headed, then?
	AI_Output(other,self,"DIA_Bronko_HALLO_15_01");	//Are you the foreman here?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_06_02");	//I'll give you one upside the head, you rascal.
	};
	AI_Output(self,other,"DIA_Bronko_HALLO_06_03");	//If you want to go ambling across my land, you'll pay me 5 gold coins, or you're in for a good thrashing!
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"Forget it. You won't get anything from me.",dia_bronko_hallo_vergisses);
	Info_AddChoice(dia_bronko_hallo,"If I have no choice - here's your money.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Your land? Are you the farmer here?",dia_bronko_hallo_deinland);
};

func void dia_bronko_hallo_deinland()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_deinland_15_00");	//Your land? Are you the farmer here?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_01");	//You can bet on that. Why else would I make you pay me a toll?
	AI_Output(self,other,"DIA_Bronko_HALLO_deinland_06_02");	//I don't mind if you go ask the others about me. Heh heh!
};

func void dia_bronko_hallo_hiergeld()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_hiergeld_15_00");	//If I have no choice - here's your money.
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		b_giveinvitems(other,self,itmi_gold,5);
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_01");	//(mischievously) Thank you. And have a nice day.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_hiergeld_06_02");	//You don't even have 5 gold coins. Trying to pull a fast one, are you?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_bronko_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_vergisses_15_00");	//Forget it. You won't get anything from me.
	if((hero.guild == GIL_NONE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_01");	//Then, I'm afraid, I'm going to have to tan your hide.
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_02");	//You boys from the city guard are short of money, huh?
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Bronko_HALLO_vergisses_06_03");	//I don't care if you are a magician. You'll have to pay. Understood?
		};
	};
	Info_ClearChoices(dia_bronko_hallo);
	Info_AddChoice(dia_bronko_hallo,"If I have no choice - here's your money.",dia_bronko_hallo_hiergeld);
	Info_AddChoice(dia_bronko_hallo,"Come on and try it, then.",dia_bronko_hallo_attack);
};

func void dia_bronko_hallo_attack()
{
	AI_Output(other,self,"DIA_Bronko_HALLO_attack_15_00");	//Come on and try it, then.
	AI_Output(self,other,"DIA_Bronko_HALLO_attack_06_01");	//Well, in that case...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BRONKO_KEINBAUER(C_INFO)
{
	npc = bau_935_bronko;
	nr = 2;
	condition = dia_bronko_keinbauer_condition;
	information = dia_bronko_keinbauer_info;
	permanent = TRUE;
	description = "You, the farmer? Don't make me laugh. You're nobody, really.";
};


var int dia_bronko_keinbauer_noperm;

func int dia_bronko_keinbauer_condition()
{
	if(((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING) || (BABERA_BRONKOKEINBAUER == TRUE)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && (DIA_BRONKO_KEINBAUER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_bronko_keinbauer_info()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_15_00");	//You, the farmer? Don't make me laugh. You're nobody, really.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_06_01");	//Whaaat? Want me to smash your face in?
	Info_ClearChoices(dia_bronko_keinbauer);
	if(hero.guild == GIL_NONE)
	{
		if(BABERA_BRONKOKEINBAUER == TRUE)
		{
			Info_AddChoice(dia_bronko_keinbauer,"(threaten Bronko to fetch mercenaries)",dia_bronko_keinbauer_sld);
		};
		if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING)
		{
			Info_AddChoice(dia_bronko_keinbauer,"Sekob is the farmer here, and you're nothing but a small-time crook.",dia_bronko_keinbauer_sekobderbauer);
		};
	};
	Info_AddChoice(dia_bronko_keinbauer,"Well, let's see what you've got.",dia_bronko_keinbauer_attack);
	Info_AddChoice(dia_bronko_keinbauer,"Never mind!",dia_bronko_keinbauer_schongut);
};

func void dia_bronko_keinbauer_attack()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_attack_15_00");	//Well, let's see then what you've got.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_attack_06_01");	//I hoped you would say that.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_bronko_keinbauer_sekobderbauer()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_00");	//Sekob is the farmer here, and you're nothing but a small-time crook who's trying to wangle money out of people's pockets.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_01");	//Says who?
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_sekobderbauer_15_02");	//Says me. Sekob wants you to go back to work instead of loafing around here.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_sekobderbauer_06_03");	//So what? What are you going to do now?
};

func void dia_bronko_keinbauer_schongut()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_schongut_15_00");	//Never mind!
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_schongut_06_01");	//Scram!
	AI_StopProcessInfos(self);
};

func void dia_bronko_keinbauer_sld()
{
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_00");	//All right, then I guess I'll have to tell Onar the landowner that there's a farmer mouthing off here who refuses to pay his rent.
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_01");	//Ahem. Wait a minute. Onar will send all his mercenaries after me.
	AI_Output(other,self,"DIA_Bronko_KEINBAUER_SLD_15_02");	//So what?
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_03");	//All right, all right. I'll give you whatever you want, but leave the mercenaries out of this, OK?
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold)))
	{
		AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_04");	//Here, I'll even give you all my gold.
	};
	AI_Output(self,other,"DIA_Bronko_KEINBAUER_SLD_06_05");	//And I'll go back to my field. Anything but the mercenaries.
	AI_StopProcessInfos(self);
	DIA_BRONKO_KEINBAUER_NOPERM = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BRONKO_FLEISSIG(C_INFO)
{
	npc = bau_935_bronko;
	nr = 3;
	condition = dia_bronko_fleissig_condition;
	information = dia_bronko_fleissig_info;
	permanent = TRUE;
	description = "(taunt Bronko)";
};


func int dia_bronko_fleissig_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_bronko_fleissig_info()
{
	if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_00");	//So? Busy as a bee, are you?
	}
	else
	{
		AI_Output(other,self,"DIA_Bronko_FLEISSIG_15_01");	//So? Still got that big mouth?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_02");	//You're a mercenary, aren't you? I might have known.
	}
	else if(MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_03");	//(fearfully) You won't go fetch those mercenaries, huh?
	};
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_04");	//Don't beat me, please.
	};
	AI_Output(self,other,"DIA_Bronko_FLEISSIG_06_05");	//I'll even go back to work, OK?
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRONKO_PICKPOCKET(C_INFO)
{
	npc = bau_935_bronko;
	nr = 900;
	condition = dia_bronko_pickpocket_condition;
	information = dia_bronko_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_bronko_pickpocket_condition()
{
	return c_beklauen(54,80);
};

func void dia_bronko_pickpocket_info()
{
	Info_ClearChoices(dia_bronko_pickpocket);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_BACK,dia_bronko_pickpocket_back);
	Info_AddChoice(dia_bronko_pickpocket,DIALOG_PICKPOCKET,dia_bronko_pickpocket_doit);
};

func void dia_bronko_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bronko_pickpocket);
};

func void dia_bronko_pickpocket_back()
{
	Info_ClearChoices(dia_bronko_pickpocket);
};

