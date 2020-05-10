
instance DIA_RETHON_EXIT(C_INFO)
{
	npc = djg_709_rethon;
	nr = 999;
	condition = dia_rethon_exit_condition;
	information = dia_rethon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rethon_exit_condition()
{
	return TRUE;
};

func void dia_rethon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RETHON_HALLO(C_INFO)
{
	npc = djg_709_rethon;
	nr = 5;
	condition = dia_rethon_hallo_condition;
	information = dia_rethon_hallo_info;
	description = "What are you doing here?";
};


func int dia_rethon_hallo_condition()
{
	return TRUE;
};

func void dia_rethon_hallo_info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//I'm getting ready to fight, what else?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "Who do you want to fight against?";
};


func int dia_rethon_kampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_kampf_info()
{
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//Who do you want to fight against?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//I thought I'd drop in on the paladins and kick their fat asses.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Idiot. Against the dragons, of course. What did you think?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "Don't the paladins mind you being here?";
};


func int dia_rethon_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_paladine_info()
{
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Don't the paladins mind you being here?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Nonsense. They have entirely different problems. Most of them are glad to still be alive.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//The boys' morale isn't the best. That will be their downfall.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//I mean, just look at those nicked blades they're fixing to go into battle with.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Any reasonable warrior would desert immediately.
};


instance DIA_RETHON_WOGRUPPE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 7;
	condition = dia_rethon_wogruppe_condition;
	information = dia_rethon_wogruppe_info;
	description = "Have you separated from your group?";
};


func int dia_rethon_wogruppe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_wogruppe_info()
{
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//Have you separated from your group?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//My group? I don't have a group. I'm a trophy collector.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//If I go home without a trophy, then I won't know what I came for. So, I can't use anybody else.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "Have you set eyes on a dragon yet?";
};


func int dia_rethon_drachengesehen_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_kampf))
	{
		return TRUE;
	};
};

func void dia_rethon_drachengesehen_info()
{
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//Have you set eyes on a dragon yet?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//No. I want to get my weapons in shape before I set off.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "Aren't you afraid that somebody might beat you to it?";
};


func int dia_rethon_angst_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_wogruppe))
	{
		return TRUE;
	};
};

func void dia_rethon_angst_info()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//Aren't you afraid that somebody might beat you to it?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//What? Who? Sylvio?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Your boss really thinks he can make a killing here, huh?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//I'm not one of Sylvio's people. I work for myself.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//Oh. All right, then. Forget I said anything.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Have you seen the pathetic figures he's got with him?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Sylvio can be glad if he gets out of here alive.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//No, he won't. He's dead.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Fine with me.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"You don't seem to like him.",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"So where is Sylvio now?",dia_rethon_angst_wosylvio);
		Info_AddChoice(dia_rethon_angst,"Sylvio was here?",dia_rethon_angst_sylviohier);
	};
};

func void dia_rethon_angst_weiter()
{
	Info_ClearChoices(dia_rethon_angst);
};

func void dia_rethon_angst_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//Sylvio was here?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//Here in the castle, you mean? Yeah, he was. But only for a short time.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//He chatted with a few people here and then set out again.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//You don't seem to like him.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//What do you mean, like? I'm not particularly proud that I know him.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//Sylvio doesn't have any friends. He needs people who follow him no matter what.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//That's not for me. I work alone.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//So where is Sylvio now?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//The paladins here mentioned an ice dragon in the west. It's supposed to be the most dangerous and powerful of them all.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//You should have seen the gleam in Sylvio's eye when he heard that. One guess where he went.
	b_logentry(TOPIC_DRACHENJAGD,"Rethon the Dragon hunter mumbled something about an ice dragon.");
	b_logentry(TOPIC_DRAGONHUNTER,"Sylvio was in the castle and then set off to find an ice dragon.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "Can you help me improve my weapons?";
};


func int dia_rethon_meinewaffe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_paladine))
	{
		return TRUE;
	};
};

func void dia_rethon_meinewaffe_info()
{
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//Can you help me improve my weapons?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Improve? Better to buy something new and throw away the junk you're carrying around.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Maybe I've got something for you. Interested?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "What can you sell me?";
};


func int dia_rethon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_meinewaffe))
	{
		return TRUE;
	};
};

func void dia_rethon_trade_info()
{
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//What can you sell me?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Man, look at how low I've sunk. Now I'm even selling my weapons to a paladin.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//I don't really have much for a magician, but you can take a look anyway.
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//I think I've got what you want, mate.
	};
};


instance DIA_RETHON_PICKPOCKET(C_INFO)
{
	npc = djg_709_rethon;
	nr = 900;
	condition = dia_rethon_pickpocket_condition;
	information = dia_rethon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_rethon_pickpocket_condition()
{
	return c_beklauen(78,230);
};

func void dia_rethon_pickpocket_info()
{
	Info_ClearChoices(dia_rethon_pickpocket);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_BACK,dia_rethon_pickpocket_back);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_PICKPOCKET,dia_rethon_pickpocket_doit);
};

func void dia_rethon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rethon_pickpocket);
};

func void dia_rethon_pickpocket_back()
{
	Info_ClearChoices(dia_rethon_pickpocket);
};

