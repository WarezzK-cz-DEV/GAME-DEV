
instance DIA_ADDON_PARDOS_EXIT(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 999;
	condition = dia_addon_pardos_exit_condition;
	information = dia_addon_pardos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_pardos_exit_condition()
{
	return TRUE;
};

func void dia_addon_pardos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_PARDOS_HI(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 2;
	condition = dia_addon_pardos_hi_condition;
	information = dia_addon_pardos_hi_info;
	permanent = FALSE;
	description = "How are you holding up?";
};


func int dia_addon_pardos_hi_condition()
{
	if(SKLAVEN_FLUCHT == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_pardos_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_Hi_03_00");	//How are you holding up?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_01");	//(wearily) I'm beat... completely worn out. Is it a glorious sunny day, or one of those clear nights where a thousand stars are twinkling?
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_02");	//(even more weary) I don't know... where's the gentle rain of summer... the cool evening breeze... I can feel them no longer...
	AI_Output(self,other,"DIA_Addon_Pardos_Hi_03_03");	//(resignedly) It's the eyes that go first in here...
};


instance DIA_ADDON_PARDOS_SAVE(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 2;
	condition = dia_addon_pardos_save_condition;
	information = dia_addon_pardos_save_info;
	permanent = FALSE;
	description = "Hang in there. Your rescue is near.";
};


func int dia_addon_pardos_save_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_pardos_hi) && (SKLAVEN_FLUCHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_pardos_save_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_save_15_00");	//Hang in there. Your rescue is near.
	AI_Output(self,other,"DIA_Addon_Pardos_save_03_01");	//(wearily) Thanks. Thank you for your words.
};


var int pardos_geheilt;

instance DIA_ADDON_PARDOS_TRANK(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 2;
	condition = dia_addon_pardos_trank_condition;
	information = dia_addon_pardos_trank_info;
	permanent = FALSE;
	description = "Here, drink this. (give potion)";
};


func int dia_addon_pardos_trank_condition()
{
	if((PARDOS_GEHEILT == FALSE) && Npc_KnowsInfo(other,dia_addon_pardos_save))
	{
		return TRUE;
	};
};

func void dia_addon_pardos_trank_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_15_00");	//Here, drink that.
	AI_StandupQuick(self);
	Info_ClearChoices(dia_addon_pardos_trank);
	Info_AddChoice(dia_addon_pardos_trank,DIALOG_BACK,dia_addon_pardos_trank_back);
	if(Npc_HasItems(other,itpo_health_01))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Give essence of healing",dia_addon_pardos_trank_01);
	};
	if(Npc_HasItems(other,itpo_health_02))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Give extract of healing",dia_addon_pardos_trank_02);
	};
	if(Npc_HasItems(other,itpo_health_03))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Give elixir of healing",dia_addon_pardos_trank_03);
	};
	if(Npc_HasItems(other,itfo_addon_meatsoup))
	{
		Info_AddChoice(dia_addon_pardos_trank,"Give meat stew",dia_addon_pardos_trank_soup);
	};
};

func void b_saypardosthanks()
{
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_00");	//Thanks, that does me good.
};

func void dia_addon_pardos_trank_back()
{
	Info_ClearChoices(dia_addon_pardos_trank);
};

func void dia_addon_pardos_trank_01()
{
	if(b_giveinvitems(other,self,itpo_health_01,1))
	{
		b_useitem(self,itpo_health_01);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	PARDOS_GEHEILT = TRUE;
	b_saypardosthanks();
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_addon_pardos_trank_02()
{
	if(b_giveinvitems(other,self,itpo_health_02,1))
	{
		b_useitem(self,itpo_health_02);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	PARDOS_GEHEILT = TRUE;
	b_saypardosthanks();
	b_giveplayerxp(XP_AMBIENT * 2);
};

func void dia_addon_pardos_trank_03()
{
	if(b_giveinvitems(other,self,itpo_health_03,1))
	{
		b_useitem(self,itpo_health_03);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	PARDOS_GEHEILT = TRUE;
	b_saypardosthanks();
	b_giveplayerxp(XP_AMBIENT * 3);
};

func void dia_addon_pardos_trank_soup()
{
	AI_Output(other,self,"DIA_Addon_Pardos_trank_soup_15_00");	//Here, have some meat stew.
	if(b_giveinvitems(other,self,itfo_addon_meatsoup,1))
	{
		b_useitem(self,itfo_addon_meatsoup);
	};
	Info_ClearChoices(dia_addon_pardos_trank);
	self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	PARDOS_GEHEILT = TRUE;
	AI_Output(self,other,"DIA_Addon_Pardos_trank_03_01");	//Thank you, I feel a little stronger now.
	b_giveplayerxp(XP_AMBIENT * 3);
};


instance DIA_ADDON_PARDOS_PERM(C_INFO)
{
	npc = strf_1122_addon_pardos;
	nr = 99;
	condition = dia_addon_pardos_perm_condition;
	information = dia_addon_pardos_perm_info;
	permanent = TRUE;
	description = "How are you now?";
};


func int dia_addon_pardos_perm_condition()
{
	if(PARDOS_GEHEILT == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_pardos_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Pardos_perm_15_00");	//How are you now?
	AI_Output(self,other,"DIA_Addon_Pardos_perm_03_01");	//Better, thanks to you. I can feel my strength returning.
};

