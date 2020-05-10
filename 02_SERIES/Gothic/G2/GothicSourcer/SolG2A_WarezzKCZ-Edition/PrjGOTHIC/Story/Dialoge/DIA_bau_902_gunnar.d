
instance DIA_GUNNAR_EXIT(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 999;
	condition = dia_gunnar_exit_condition;
	information = dia_gunnar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gunnar_exit_condition()
{
	return TRUE;
};

func void dia_gunnar_exit_info()
{
	AI_StopProcessInfos(self);
};


var int gunnar_hallogesagt;

instance DIA_GUNNAR_HALLO(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 1;
	condition = dia_gunnar_hallo_condition;
	information = dia_gunnar_hallo_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_gunnar_hallo_condition()
{
	return TRUE;
};

func void dia_gunnar_hallo_info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//What's up?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//Since Onar announced he was hiring mercenaries, the court has been overflowing with nothing but rogues.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//All the rabble who didn't have the guts to come out of the woods before are here now.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//The bastards really came from everywhere...
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//So you're a mercenary now too, hm?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//Innos be with you!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//People from the city aren't welcome here.
	};
	GUNNAR_HALLOGESAGT = TRUE;
};


instance DIA_GUNNAR_EVERYWHERE(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 2;
	condition = dia_gunnar_everywhere_condition;
	information = dia_gunnar_everywhere_info;
	permanent = TRUE;
	description = "The mercenaries came from everywhere?";
};


func int dia_gunnar_everywhere_condition()
{
	if(GUNNAR_HALLOGESAGT == TRUE)
	{
		return TRUE;
	};
};

func void dia_gunnar_everywhere_info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//The mercenaries came from everywhere?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//Most of them came from the penal colony.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//Another group of mercenaries came from the south, where they were probably hunting orcs.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//And I bet that a few bandits from the mountains have shown up as well by now to get a free meal!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "What do you know about the mercenaries from the south?";
};


func int dia_gunnar_south_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_south_info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//What do you know about the mercenaries from the south?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//Not much. So far as I know, they were hunting orcs there.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//Sylvio is their boss. Bullco, Sentenza, Raoul and a few others work for him...
};


instance DIA_GUNNAR_COLONY(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 4;
	condition = dia_gunnar_colony_condition;
	information = dia_gunnar_colony_info;
	permanent = TRUE;
	description = "Which one of them came from the colony?";
};


func int dia_gunnar_colony_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_colony_info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//Which one of them came from the colony?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//Lee and his people. Torlof, Cord, Jarvis, Wolf and whoever else.
};


instance DIA_GUNNAR_BANDITS(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 5;
	condition = dia_gunnar_bandits_condition;
	information = dia_gunnar_bandits_info;
	permanent = TRUE;
	description = "What bandits were you talking about?";
};


func int dia_gunnar_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_bandits_info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//What bandits were you talking about?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//Ah, I'm just blabbering. I'm not really sure about it.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//There are mountains with abandoned mines south of the valley. Some bandits are hiding up there.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//They are also convicts from the colony, just like most of the mercenaries in this court.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//The only difference is that they're even worse scum. They kill anyone who gets too close.
};


instance DIA_GUNNAR_PICKPOCKET(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 900;
	condition = dia_gunnar_pickpocket_condition;
	information = dia_gunnar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gunnar_pickpocket_condition()
{
	return c_beklauen(45,70);
};

func void dia_gunnar_pickpocket_info()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_BACK,dia_gunnar_pickpocket_back);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_PICKPOCKET,dia_gunnar_pickpocket_doit);
};

func void dia_gunnar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gunnar_pickpocket);
};

func void dia_gunnar_pickpocket_back()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
};

