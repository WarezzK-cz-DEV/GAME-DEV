
instance DIA_SLD_820_EXIT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 999;
	condition = dia_sld_820_exit_condition;
	information = dia_sld_820_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_820_exit_condition()
{
	return TRUE;
};

func void dia_sld_820_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_HALT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_halt_condition;
	information = dia_sld_820_halt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_820_halt_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_820_halt_info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//Where d'you think you're going?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//To the house, of course.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Onar pays us not to let guys like you in here!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Just don't let any militia in here! - Those were his exact words.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//I want to talk to Lee!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//What do you want from him?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"He and I go way back...",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"I want to join the mercenaries!",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Lee is in the right wing. Don't even think about wandering around anywhere else!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//I want to join the mercenaries!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Ah, fresh cannon fodder! Then go on in.
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//But above all, leave Onar alone! He doesn't like it when people talk to him without being asked. Especially not guys like you.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//He and I go way back...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//YOU'RE a pal of Lee's? I don't believe a word! But go on in, if he doesn't recognize you, you'll know it...(laughs)
	b_sld_820_leeisright();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_PERM(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_perm_condition;
	information = dia_sld_820_perm_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//Go on in, if you want, but don't babble at me.
	AI_StopProcessInfos(self);
};

