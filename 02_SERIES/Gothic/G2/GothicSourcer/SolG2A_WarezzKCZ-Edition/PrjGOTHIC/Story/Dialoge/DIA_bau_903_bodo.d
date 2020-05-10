
instance DIA_BODO_EXIT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 999;
	condition = dia_bodo_exit_condition;
	information = dia_bodo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bodo_exit_condition()
{
	return TRUE;
};

func void dia_bodo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BODO_HALLO(C_INFO)
{
	npc = bau_903_bodo;
	nr = 1;
	condition = dia_bodo_hallo_condition;
	information = dia_bodo_hallo_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_bodo_hallo_condition()
{
	return TRUE;
};

func void dia_bodo_hallo_info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//How's it going?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//The militia has bullied us long enough. Now that the mercenaries are on our side, they won't dare to just show up here any more.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//The King may think he can get away with anything. But we're not going to take it any more.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//Good. If you see a few militiamen, pound them one for me too, will you?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//Good. Innos be with you.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//The King's troops aren't exactly welcome on the farm.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//A lot of people here may talk to you anyway, but you certainly won't make yourself popular.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "In town, they're talking about a peasants' revolt!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//In town, they're talking about a peasants' revolt!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//Nonsense. We aren't doing anything except defending what we've worked hard for.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//It's certainly true that the war is being fought on the backs of the peasants. But Onar is no longer prepared to just stand by and watch while the king bleeds us dry.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "Can I rest somewhere around here?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//Can I rest somewhere around here?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//If you're looking for a place to sleep, go to the barn. But don't lie down in a mercenary's bed by mistake.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//Onar makes sure that they leave us farmers alone, but with strangers who don't belong on the farm, the mercenaries can do whatever they like.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "Cipher told me somebody stole a package of swampweed from him...";
};


func int dia_bodo_cipher_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) || (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bodo_cipher_info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//Cipher told me somebody stole a package of swampweed from him...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//And?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//He thinks you're the one who took it.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//Oh, THAT's why the guy is always gawping at me so stupidly.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//I've been extra friendly to him lately, because he seems to have hit a rough spot.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//But there was nothing I could do. I'd look at him friendly like and he'd stare at me like he wanted to kill me.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "Give me that weed, or else!";
};


func int dia_bodo_weedorelse_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_cipher))
	{
		return TRUE;
	};
};

func void dia_bodo_weedorelse_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//Give me that weed, or else!
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//Listen, all I've got is this one reefer of weed. Take it and leave me alone.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//You know that Onar's mercenaries look out for us, right?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//So don't do anything stupid!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "I don't believe a word you're saying. Give me the swampweed!";
};


func int dia_bodo_weedperm_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_weedorelse))
	{
		return TRUE;
	};
};

func void dia_bodo_weedperm_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//I don't believe a word you're saying. Give me the swampweed!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//I don't have it. Honest.
};


instance DIA_BODO_PICKPOCKET(C_INFO)
{
	npc = bau_903_bodo;
	nr = 900;
	condition = dia_bodo_pickpocket_condition;
	information = dia_bodo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bodo_pickpocket_condition()
{
	return c_beklauen(30,60);
};

func void dia_bodo_pickpocket_info()
{
	Info_ClearChoices(dia_bodo_pickpocket);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_BACK,dia_bodo_pickpocket_back);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_PICKPOCKET,dia_bodo_pickpocket_doit);
};

func void dia_bodo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bodo_pickpocket);
};

func void dia_bodo_pickpocket_back()
{
	Info_ClearChoices(dia_bodo_pickpocket);
};

