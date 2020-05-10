
instance DIA_KERVO_EXIT(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 999;
	condition = dia_kervo_exit_condition;
	information = dia_kervo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kervo_exit_condition()
{
	return TRUE;
};

func void dia_kervo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_WASIST(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 4;
	condition = dia_kervo_wasist_condition;
	information = dia_kervo_wasist_info;
	description = "What's wrong?";
};


func int dia_kervo_wasist_condition()
{
	return TRUE;
};

func void dia_kervo_wasist_info()
{
	AI_Output(other,self,"DIA_Kervo_WASIST_15_00");	//What's wrong with you?
	AI_Output(self,other,"DIA_Kervo_WASIST_13_01");	//You have to ask that? Just look around you.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_02");	//These damned lurkers have spread across the entire river since I've come here.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_03");	//First, there were only two. Since yesterday, I've counted five at least.
	AI_Output(self,other,"DIA_Kervo_WASIST_13_04");	//No idea how I'm ever going to get out of here.
};


instance DIA_KERVO_HILFE(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 5;
	condition = dia_kervo_hilfe_condition;
	information = dia_kervo_hilfe_info;
	description = "Have you tried getting through to the pass?";
};


func int dia_kervo_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_kervo_wasist))
	{
		return TRUE;
	};
};

func void dia_kervo_hilfe_info()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_15_00");	//Have you tried getting through to the pass?
	AI_Output(self,other,"DIA_Kervo_HILFE_13_01");	//Do I look insane to you? 20 soldiers couldn't drag me out of here as long as those beasts are out there. I despise those things.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_02");	//(completely unnerved) I only have to smell them and I break out in a cold sweat. And their constant gurgling makes the blood freeze in my veins.
	AI_Output(self,other,"DIA_Kervo_HILFE_13_03");	//If you're that eager to have them skin you alive, go right ahead.
	Info_ClearChoices(dia_kervo_hilfe);
	Info_AddChoice(dia_kervo_hilfe,"Well, I'm off, then.",dia_kervo_hilfe_tschau);
	Info_AddChoice(dia_kervo_hilfe,"But you can't stay here forever.",dia_kervo_hilfe_ewig);
	if(KERVO_GOTSTUFF == TRUE)
	{
		Info_AddChoice(dia_kervo_hilfe,"What would you give me if I killed the things?",dia_kervo_hilfe_problem);
	};
	MIS_KERVO_KILLLURKER = LOG_RUNNING;
};

func void dia_kervo_hilfe_ewig()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_ewig_15_00");	//But you can't stay here forever.
	AI_Output(self,other,"DIA_Kervo_HILFE_ewig_13_01");	//I've no idea what it is you want from me, but I can tell you this: you're not going to get me to leave here.
};


var int kervo_promisenugget;

func void dia_kervo_hilfe_problem()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_Problem_15_00");	//What would you give me if I killed the things?
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_01");	//Mmh. Well. It would be enough if those lurkers in front of the cave would disappear.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_02");	//I found a blank runestone. Since you're a magician, I'm sure you can make use of it.
	}
	else
	{
		AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_03");	//I found a lump of ore.
	};
	AI_Output(self,other,"DIA_Kervo_HILFE_Problem_13_04");	//I would give it to you in exchange.
	KERVO_PROMISENUGGET = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kervo_hilfe_tschau()
{
	AI_Output(other,self,"DIA_Kervo_HILFE_tschau_15_00");	//Well, I'm off, then.
	AI_Output(self,other,"DIA_Kervo_HILFE_tschau_13_01");	//Sure. I won't keep you.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_LURKERPLATT(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_lurkerplatt_condition;
	information = dia_kervo_lurkerplatt_info;
	description = "The lurkers in front of the cave are gone.";
};


func int dia_kervo_lurkerplatt_condition()
{
	if((MIS_KERVO_KILLLURKER == LOG_RUNNING) && Npc_IsDead(kervo_lurker1) && Npc_IsDead(kervo_lurker2) && Npc_IsDead(kervo_lurker3) && Npc_IsDead(kervo_lurker4) && Npc_IsDead(kervo_lurker5) && Npc_IsDead(kervo_lurker6))
	{
		return TRUE;
	};
};

func void dia_kervo_lurkerplatt_info()
{
	AI_Output(other,self,"DIA_Kervo_LurkerPlatt_15_00");	//The lurkers in front of the cave are gone.
	AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_01");	//Great. Now I can breathe again at last.
	if(KERVO_PROMISENUGGET == TRUE)
	{
		AI_Output(self,other,"DIA_Kervo_LurkerPlatt_13_02");	//Here's what I promised you.
		if(hero.guild == GIL_KDF)
		{
			b_giveinvitems(self,other,itmi_runeblank,1);
		}
		else
		{
			b_giveinvitems(self,other,itmi_nugget,1);
		};
	};
	b_giveplayerxp(XP_KERVOKILLLURKER);
	MIS_KERVO_KILLLURKER = LOG_SUCCESS;
};


instance DIA_KERVO_VERGISSES(C_INFO)
{
	npc = strf_1116_kervo;
	condition = dia_kervo_vergisses_condition;
	information = dia_kervo_vergisses_info;
	permanent = TRUE;
	description = "Will you cross the pass now?";
};


func int dia_kervo_vergisses_condition()
{
	if(MIS_KERVO_KILLLURKER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_kervo_vergisses_info()
{
	AI_Output(other,self,"DIA_Kervo_VERGISSES_15_00");	//Will you cross the pass now?
	AI_Output(self,other,"DIA_Kervo_VERGISSES_13_01");	//Forget it, man. If they catch me, they'll take me back to the mines. I'm staying put.
	AI_StopProcessInfos(self);
};


instance DIA_KERVO_PICKPOCKET(C_INFO)
{
	npc = strf_1116_kervo;
	nr = 900;
	condition = dia_kervo_pickpocket_condition;
	information = dia_kervo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kervo_pickpocket_condition()
{
	return c_beklauen(34,10);
};

func void dia_kervo_pickpocket_info()
{
	Info_ClearChoices(dia_kervo_pickpocket);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_BACK,dia_kervo_pickpocket_back);
	Info_AddChoice(dia_kervo_pickpocket,DIALOG_PICKPOCKET,dia_kervo_pickpocket_doit);
};

func void dia_kervo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kervo_pickpocket);
};

func void dia_kervo_pickpocket_back()
{
	Info_ClearChoices(dia_kervo_pickpocket);
};

