
instance DIA_AGON_EXIT(C_INFO)
{
	npc = nov_603_agon;
	nr = 999;
	condition = dia_agon_exit_condition;
	information = dia_agon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_agon_exit_condition()
{
	return TRUE;
};

func void dia_agon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AGON_HELLO(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_hello_condition;
	information = dia_agon_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_hello_info()
{
	AI_Output(self,other,"DIA_Agon_Hello_07_00");	//(scornful) What do you want?
};


instance DIA_AGON_WURST(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_wurst_condition;
	information = dia_agon_wurst_info;
	permanent = FALSE;
	description = "Here, I've got a mutton sausage for you.";
};


func int dia_agon_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_agon_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Agon_Wurst_15_00");	//Here, I've got a mutton sausage for you.
	AI_Output(self,other,"DIA_Agon_Wurst_07_01");	//Sheep sausage, sheep cheese... sheep milk... it's getting so I can't stand the sight of it.
	AI_Output(other,self,"DIA_Agon_Wurst_15_02");	//So do you want the sausage, or not?
	AI_Output(self,other,"DIA_Agon_Wurst_07_03");	//Oh, give it here already!
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_AGON_NEW(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_new_condition;
	information = dia_agon_new_info;
	permanent = FALSE;
	description = "I'm new here.";
};


func int dia_agon_new_condition()
{
	if((MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_new_info()
{
	AI_Output(other,self,"DIA_Agon_New_15_00");	//I'm new here.
	AI_Output(self,other,"DIA_Agon_New_07_01");	//So I see.
	AI_Output(self,other,"DIA_Agon_New_07_02");	//If you still don't have any work, talk to Parlan. He'll assign you some.
};


instance DIA_AGON_YOUANDBABO(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_youandbabo_condition;
	information = dia_agon_youandbabo_info;
	permanent = FALSE;
	description = "What happened between you and Babo?";
};


func int dia_agon_youandbabo_condition()
{
	if(Npc_KnowsInfo(other,dia_opolos_monastery) && (MIS_SCHNITZELJAGD == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_agon_youandbabo_info()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_15_00");	//What happened between you and Babo?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_01");	//You shouldn't believe everything you hear.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_02");	//(insistently) Let's get something straight: I shall go my own way. The way that Innos foreordained for me.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_07_03");	//I won't allow anyone to stand in my way, and certainly not that simpleton Babo.
	Info_ClearChoices(dia_agon_youandbabo);
	Info_AddChoice(dia_agon_youandbabo,"Shouldn't we novices stick together?",dia_agon_youandbabo_alltogether);
	Info_AddChoice(dia_agon_youandbabo,"Innos alone knows which path we shall take.",dia_agon_youandbabo_innosway);
	Info_AddChoice(dia_agon_youandbabo,"We'll get along just fine.",dia_agon_youandbabo_understand);
};

func void dia_agon_youandbabo_alltogether()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_AllTogether_15_00");	//Shouldn't we novices stick together?
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_01");	//The rest of you can stick together as much as you like.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_AllTogether_07_02");	//But please, don't waste my time. (cold) And no one should get in my way.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_innosway()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_InnosWay_15_00");	//Innos alone knows which path we shall take.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_InnosWay_07_01");	//My family has always stood highly in Innos' favor and nothing about that is going to change.
	Info_ClearChoices(dia_agon_youandbabo);
};

func void dia_agon_youandbabo_understand()
{
	AI_Output(other,self,"DIA_Agon_YouAndBabo_Understand_15_00");	//We'll get along just fine.
	AI_Output(self,other,"DIA_Agon_YouAndBabo_Understand_07_01");	//I hope so. Once I'm a magician, I can put in a good word for you.
	Info_ClearChoices(dia_agon_youandbabo);
};


instance DIA_AGON_GETHERB(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_getherb_condition;
	information = dia_agon_getherb_info;
	permanent = TRUE;
	description = "What are you planting here?";
};


func int dia_agon_getherb_condition()
{
	if(MIS_SCHNITZELJAGD == FALSE)
	{
		return TRUE;
	};
};

func void dia_agon_getherb_info()
{
	AI_Output(other,self,"DIA_Agon_GetHerb_15_00");	//What are you planting here?
	AI_Output(self,other,"DIA_Agon_GetHerb_07_01");	//We're trying to grow healing plants that Master Neoras can use to brew potions.
};


instance DIA_AGON_GOLEMDEAD(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemdead_condition;
	information = dia_agon_golemdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemdead_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsDead(magic_golem))
	{
		return TRUE;
	};
};

func void dia_agon_golemdead_info()
{
	AI_Output(self,other,"DIA_Agon_GolemDead_07_00");	//(triumphant) You are too late!
	AI_Output(self,other,"DIA_Agon_GolemDead_07_01");	//I was here first! I have won!
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"(menacing) Only if you get out of here alive.",dia_agon_golemdead_noway);
	Info_AddChoice(dia_agon_golemdead,"Shut up!",dia_agon_golemdead_shutup);
	Info_AddChoice(dia_agon_golemdead,"Congratulations, you have really deserved it.",dia_agon_golemdead_congrat);
};

func void dia_agon_golemdead_noway()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_NoWay_15_00");	//(menacing) Only if you get out of here alive.
	AI_Output(self,other,"DIA_Agon_GolemDead_NoWay_07_01");	//Do you want to kill me? You will never succeed.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
};

func void dia_agon_golemdead_shutup()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_15_00");	//Shut up!
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_01");	//(mocking) It is hopeless, you have lost! Resign yourself to it.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_07_02");	//Only I am destined to become a magician.
	Info_ClearChoices(dia_agon_golemdead);
	Info_AddChoice(dia_agon_golemdead,"Destined my ass. The chest is mine.",dia_agon_golemdead_shutup_mychest);
	Info_AddChoice(dia_agon_golemdead,"You win.",dia_agon_golemdead_shutup_youwin);
};

func void dia_agon_golemdead_shutup_mychest()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_MyChest_15_00");	//Destined my ass. The chest is mine.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_MyChest_07_01");	//(furious) No, you cannot do that, I will kill you first.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
};

func void dia_agon_golemdead_shutup_youwin()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_ShutUp_YouWin_15_00");	//You win.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_01");	//(furious) No, you cannot deceive me. You're trying to get rid of me.
	AI_Output(self,other,"DIA_Agon_GolemDead_ShutUp_YouWin_07_02");	//I shall prevent that!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
};

func void dia_agon_golemdead_congrat()
{
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_00");	//Congratulations, you have really deserved it.
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_01");	//(distrustful) What does that mean? What are you planning?
	AI_Output(other,self,"DIA_Agon_GolemDead_Congrat_15_02");	//What are you talking about?
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_03");	//(nervous) You want to dispute my victory. You want to kill me and take all the glory for yourself!
	AI_Output(self,other,"DIA_Agon_GolemDead_Congrat_07_04");	//You will never succeed!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,1);
};


instance DIA_AGON_GOLEMLIVES(C_INFO)
{
	npc = nov_603_agon;
	nr = 1;
	condition = dia_agon_golemlives_condition;
	information = dia_agon_golemlives_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_agon_golemlives_condition()
{
	if((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_02") <= 3500) && (MIS_SCHNITZELJAGD == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE))
	{
		return TRUE;
	};
};

func void dia_agon_golemlives_info()
{
	AI_Output(self,other,"DIA_Agon_GolemLives_07_00");	//(surprised) You found the hiding place before me. That cannot be...
	AI_Output(self,other,"DIA_Agon_GolemLives_07_01");	//(determined) That must not be! I shall not permit it.
	AI_Output(self,other,"DIA_Agon_GolemLives_07_02");	//They won't even find your corpse.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_AGON_PERM(C_INFO)
{
	npc = nov_603_agon;
	nr = 2;
	condition = dia_agon_perm_condition;
	information = dia_agon_perm_info;
	permanent = TRUE;
	description = "So how are things?";
};


func int dia_agon_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_agon_perm_info()
{
	AI_Output(other,self,"DIA_Agon_Perm_15_00");	//So how's it going?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_01");	//Oh - thank you for your concern, Sir Paladin. I enjoy the work and I am certain to be selected as a magician soon.
	}
	else
	{
		AI_Output(self,other,"DIA_Agon_Perm_07_02");	//(arrogant) You are only a guest here in the monastery of Innos. Therefore you should act accordingly and not disturb me while I am working. Good day.
	};
};


instance DIA_AGON_PICKPOCKET(C_INFO)
{
	npc = nov_603_agon;
	nr = 900;
	condition = dia_agon_pickpocket_condition;
	information = dia_agon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_agon_pickpocket_condition()
{
	return c_beklauen(23,12);
};

func void dia_agon_pickpocket_info()
{
	Info_ClearChoices(dia_agon_pickpocket);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_BACK,dia_agon_pickpocket_back);
	Info_AddChoice(dia_agon_pickpocket,DIALOG_PICKPOCKET,dia_agon_pickpocket_doit);
};

func void dia_agon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_agon_pickpocket);
};

func void dia_agon_pickpocket_back()
{
	Info_ClearChoices(dia_agon_pickpocket);
};

