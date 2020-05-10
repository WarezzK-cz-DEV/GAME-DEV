
instance DIA_GIRION_DI_XIT(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 999;
	condition = dia_girion_di_exit_condition;
	information = dia_girion_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_di_exit_condition()
{
	return TRUE;
};

func void dia_girion_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_HALLO(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_hallo_condition;
	information = dia_girion_di_hallo_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_girion_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_hallo_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Everything all right?
	if(ORKSTURMDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//The orcs are truly brave to set themselves against me.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//They really should know better than to challenge a paladin of the royal guard.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//I think so. Will you need long for your mission here on this cliff?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Don't treat me like an idiot. Do what must be done and then surrender the ship to me.
	};
};


instance DIA_GIRION_DI_TEACH(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 5;
	condition = dia_girion_di_teach_condition;
	information = dia_girion_di_teach_info;
	permanent = TRUE;
	description = "Train me, and we'll all be able to leave here faster!";
};


func int dia_girion_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_teach_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//Train me, the faster we will be able to leave here.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//I seem to have no other choice.
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//Never prop up your elbows. That makes your aim much too stiff and you will inevitably twist your weapon.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//Always loosen your left arm before a shot. That way you are more flexible when aiming.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Your blade must slice through the air like a reed in the wind.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Always use your strength with calculation. Running blindly at your opponent has never yet led to success.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Don't hold the shaft so tightly, then your blow will hit its mark.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Don't forget to parry. But the best defense is always to dodge your opponent's blow.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,1)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW,5)),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_back()
{
	Info_ClearChoices(dia_girion_di_teach);
};


instance DIA_GIRION_DI_ORCELITERING(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 99;
	condition = dia_girion_di_orcelitering_condition;
	information = dia_girion_di_orcelitering_info;
	permanent = TRUE;
	description = "I have a ring from the orcish warlords.";
};


func int dia_girion_di_orcelitering_condition()
{
	if(Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};


var int dia_girion_di_orcelitering_onetime;

func void dia_girion_di_orcelitering_info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//I have a ring from the orcish warlords.
	if(DIA_GIRION_DI_ORCELITERING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//I suspect that Lord Hagen will be able to do something with that.
		DIA_GIRION_DI_ORCELITERING_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Give it to me. I shall deliver it to Lord Hagen.
	Info_ClearChoices(dia_girion_di_orcelitering);
	Info_AddChoice(dia_girion_di_orcelitering,"I'd rather keep it to myself.",dia_girion_di_orcelitering_behalten);
	Info_AddChoice(dia_girion_di_orcelitering,"Here, take it.",dia_girion_di_orcelitering_geben);
};

func void dia_girion_di_orcelitering_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Here, take it.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//Thanks. I don't think you have much use for it anyway.
	Info_ClearChoices(dia_girion_di_orcelitering);
	b_giveinvitems(other,self,itri_orcelitering,1);
	Npc_RemoveInvItem(self,itri_orcelitering);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_girion_di_orcelitering_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//I'd rather keep it to myself.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Suit yourself. You can't do anything with it anyway.
	Info_ClearChoices(dia_girion_di_orcelitering);
};


instance DIA_GIRION_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_undeaddragondead_condition;
	information = dia_girion_di_undeaddragondead_info;
	permanent = TRUE;
	description = "We can cast off now.";
};


func int dia_girion_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_girion_di_undeaddragondead_onetime;

func void dia_girion_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//We can cast off now.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//It's about time. I thought for sure I would rot here on this cliff.
	if(DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Now surrender the ship to me immediately.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//We're not in Khorinis yet. And, to be honest, I'm not terribly keen on going back to Khorinis.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//I've been there long enough.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//I thought as much. But this is neither the time nor the place to straighten this out. We shall discuss this again at sea.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//So what. I'm glad to have you back on board in one piece, nevertheless.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//You are a true warrior of Innos. I have no more doubt of that. I am glad to have you on our side.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//Even if you are a rascal, in the end you acted with righteousness.
		};
		DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//All right. Now go to the captain and let him navigate us out of here.
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 900;
	condition = dia_girion_di_pickpocket_condition;
	information = dia_girion_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_di_pickpocket_condition()
{
	return c_beklauen(71,260);
};

func void dia_girion_di_pickpocket_info()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_BACK,dia_girion_di_pickpocket_back);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_PICKPOCKET,dia_girion_di_pickpocket_doit);
};

func void dia_girion_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_di_pickpocket);
};

func void dia_girion_di_pickpocket_back()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
};

