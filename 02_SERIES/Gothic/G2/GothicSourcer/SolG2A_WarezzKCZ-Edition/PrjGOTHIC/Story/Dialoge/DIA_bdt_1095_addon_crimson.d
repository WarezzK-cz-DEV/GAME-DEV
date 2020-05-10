
instance DIA_ADDON_CRIMSON_EXIT(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 999;
	condition = dia_addon_crimson_exit_condition;
	information = dia_addon_crimson_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_crimson_exit_condition()
{
	return TRUE;
};

func void dia_addon_crimson_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CRIMSON_PICKPOCKET(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 900;
	condition = dia_addon_crimson_pickpocket_condition;
	information = dia_addon_crimson_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_crimson_pickpocket_condition()
{
	return c_beklauen(66,66);
};

func void dia_addon_crimson_pickpocket_info()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_BACK,dia_addon_crimson_pickpocket_back);
	Info_AddChoice(dia_addon_crimson_pickpocket,DIALOG_PICKPOCKET,dia_addon_crimson_pickpocket_doit);
};

func void dia_addon_crimson_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};

func void dia_addon_crimson_pickpocket_back()
{
	Info_ClearChoices(dia_addon_crimson_pickpocket);
};


instance DIA_ADDON_CRIMSON_HI(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_hi_condition;
	information = dia_addon_crimson_hi_info;
	permanent = FALSE;
	description = "What are you doing? Are you melting down your gold?";
};


func int dia_addon_crimson_hi_condition()
{
	return TRUE;
};

func void dia_addon_crimson_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Hi_15_00");	//What are you doing? Are you melting down your gold?
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_01");	//No, I'm washing vegetables. Of course, I'm melting down gold - and I'm making coins out of it.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_02");	//Because, just imagine: one fine evening Raven comes along and shoves a coin die in my hands.
	AI_Output(self,other,"DIA_Addon_Crimson_Hi_10_03");	//Out of one single gold nugget, I can mint a heap of coins - I'm so good that no one can tell the difference!
};


instance DIA_ADDON_CRIMSON_HOW(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_how_condition;
	information = dia_addon_crimson_how_info;
	permanent = FALSE;
	description = "How many coins will you give me for one nugget?";
};


func int dia_addon_crimson_how_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_hi))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_how_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_How_15_00");	//How many coins will you give me for one nugget?
	AI_Output(self,other,"DIA_Addon_Crimson_How_10_01");	//Well, I don't know you at all, but I'll make you a special price. For one nugget I'll give you...
	b_say_gold(self,other,10);
};


instance DIA_ADDON_CRIMSON_FEILSCH(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 2;
	condition = dia_addon_crimson_feilsch_condition;
	information = dia_addon_crimson_feilsch_info;
	permanent = FALSE;
	description = "Let's haggle!";
};


func int dia_addon_crimson_feilsch_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_feilsch_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_00");	//Let's haggle!
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_01");	//Hmm... no. That's the standard price EVERYONE gets.
	AI_Output(other,self,"DIA_Addon_Crimson_Feilsch_15_02");	//I thought that was a special price.
	AI_Output(self,other,"DIA_Addon_Crimson_Feilsch_10_03");	//It is. Everyone here is special to me.
};


instance DIA_ADDON_CRIMSON_GOLD(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 99;
	condition = dia_addon_crimson_gold_condition;
	information = dia_addon_crimson_gold_info;
	permanent = TRUE;
	description = "Trade gold nuggets...";
};


func int dia_addon_crimson_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_gold_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Gold_15_00");	//Let's trade...
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Trade all gold nuggets",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Trade 1 gold nugget",dia_addon_crimson_gold_1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_Gold_10_01");	//But you don't have any gold nuggets on you.
	};
};

func void dia_addon_crimson_gold_back()
{
	Info_ClearChoices(dia_addon_crimson_gold);
};

func void dia_addon_crimson_gold_alle()
{
	var int currentnuggets;
	currentnuggets = Npc_HasItems(other,itmi_goldnugget_addon);
	b_giveinvitems(other,self,itmi_goldnugget_addon,currentnuggets);
	b_giveinvitems(self,other,itmi_gold,currentnuggets * 10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Trade all gold nuggets",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Trade 1 gold nugget",dia_addon_crimson_gold_1);
	};
};

func void dia_addon_crimson_gold_1()
{
	b_giveinvitems(other,self,itmi_goldnugget_addon,1);
	b_giveinvitems(self,other,itmi_gold,10);
	Info_ClearChoices(dia_addon_crimson_gold);
	Info_AddChoice(dia_addon_crimson_gold,DIALOG_BACK,dia_addon_crimson_gold_back);
	if(Npc_HasItems(other,itmi_goldnugget_addon) >= 1)
	{
		Info_AddChoice(dia_addon_crimson_gold,"Trade all gold nuggets",dia_addon_crimson_gold_alle);
		Info_AddChoice(dia_addon_crimson_gold,"Trade 1 gold nugget",dia_addon_crimson_gold_1);
	};
};

func void b_say_crimsonbeliar()
{
	AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_LOS_10_00");	//(conjuring) KHARDIMON FATAGN SHATAR FATAGN BELIAR.
};


instance DIA_ADDON_CRIMSON_RAVEN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 9;
	condition = dia_addon_crimson_raven_condition;
	information = dia_addon_crimson_raven_info;
	permanent = FALSE;
	description = "What do you know about Raven?";
};


func int dia_addon_crimson_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_how))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Crimson_Raven_15_00");	//What do you know about Raven?
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_01");	//You won't believe it. I was there. I saw what he did in the tomb!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_02");	//(afraid) He mumbled and called some strange words. Over and over...
	b_say_crimsonbeliar();
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_03");	//(loudly) And then a blazing light came out of the tomb and I heard the SCREAM.
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_04");	//(calls) Oh, ye gods, that voice. That was the sound of the end of the world!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_05");	//Raven spoke with it, they conversed - Raven and THAT voice!
	AI_Output(self,other,"DIA_Addon_Crimson_Raven_10_06");	//I can't remember what they said - I just know that I could only master my limbs again many hours later, back in the camp.
};


instance DIA_ADDON_CRIMSON_FATAGN(C_INFO)
{
	npc = bdt_1095_addon_crimson;
	nr = 98;
	condition = dia_addon_crimson_fatagn_condition;
	information = dia_addon_crimson_fatagn_info;
	permanent = TRUE;
	description = "Can you repeat Raven's words again?";
};


func int dia_addon_crimson_fatagn_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_crimson_raven) && (CRIMSON_SAYBELIAR < 4))
	{
		return TRUE;
	};
};

func void dia_addon_crimson_fatagn_info()
{
	CRIMSON_SAYBELIAR = CRIMSON_SAYBELIAR + 1;
	AI_Output(other,self,"DIA_Addon_Crimson_FATAGN_15_00");	//Can you repeat Raven's words again?
	if(CRIMSON_SAYBELIAR <= 3)
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_01");	//Sure. Are you ready?
		Info_ClearChoices(dia_addon_crimson_fatagn);
		Info_AddChoice(dia_addon_crimson_fatagn,"Okay.",dia_addon_crimson_fatagn_los);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Crimson_FATAGN_10_02");	//I think we had better leave it be...
	};
};

func void dia_addon_crimson_fatagn_los()
{
	Snd_Play("Mystery_09");
	b_say_crimsonbeliar();
	if(CRIMSON_SAYBELIAR == 3)
	{
		Wld_PlayEffect("FX_EARTHQUAKE",self,self,0,0,0,FALSE);
		Wld_PlayEffect("DEMENTOR_FX",self,self,0,0,0,FALSE);
	};
	Info_ClearChoices(dia_addon_crimson_fatagn);
};

