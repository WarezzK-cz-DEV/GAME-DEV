
instance DIA_PAL_205_TORWACHE_EXIT(C_INFO)
{
	npc = pal_205_torwache;
	nr = 999;
	condition = dia_pal_205_torwache_exit_condition;
	information = dia_pal_205_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_205_torwache_exit_condition()
{
	return TRUE;
};

func void dia_pal_205_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_205_CHECKPOINT = "NW_CITY_CITYHALL_IN";

var int pal_205_schonmalreingelassen;

instance DIA_PAL_205_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 1;
	condition = dia_pal_205_torwache_firstwarn_condition;
	information = dia_pal_205_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,PAL_205_CHECKPOINT) <= 550)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (PAL_205_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_205_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_firstwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_00");	//HALT!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_01");	//I would violate my most sacred duty if I were to grant entrance to a murderer.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_02");	//You are accused of theft. As long as that is true, you may not enter!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_03");	//You are known as a brawler. I shall not let you through.
		};
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_04");	//Go to Lord Andre and settle the matter!
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_FirstWarn_12_05");	//Only men who are in service to the king may enter the town hall.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_205_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance DIA_PAL_205_TORWACHE_SECONDWARN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_secondwarn_condition;
	information = dia_pal_205_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//If you take one more step forward, by Innos, I shall knock you down!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_205_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_ATTACK(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_attack_condition;
	information = dia_pal_205_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_205_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_205_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_PAL_205_TORWACHE_HAGEN(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_hagen_condition;
	information = dia_pal_205_torwache_hagen_info;
	permanent = TRUE;
	description = "I need to speak to Lord Hagen!";
};


func int dia_pal_205_torwache_hagen_condition()
{
	if(PAL_205_SCHONMALREINGELASSEN == FALSE)
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_hagen_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//I need to speak to Lord Hagen!
	AI_Output(self,other,"DIA_PAL_205_Torwache_Hagen_12_01");	//Do you know how often I've heard that? You can't go in. If you try anyway, I'll have to kill you.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMIL(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmil_condition;
	information = dia_pal_205_torwache_passasmil_info;
	permanent = TRUE;
	description = "I am a member of the militia.";
};


func int dia_pal_205_torwache_passasmil_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_MIL) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//I am a member of the militia.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//All right, you can go in.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passasmage_condition;
	information = dia_pal_205_torwache_passasmage_info;
	permanent = TRUE;
	description = "I am a Fire Magician.";
};


func int dia_pal_205_torwache_passasmage_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_KDF) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//I am a Fire Magician.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Yes, of course. Forgive me, Chosen One, but I am only doing my duty.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PASSASSLD(C_INFO)
{
	npc = pal_205_torwache;
	nr = 3;
	condition = dia_pal_205_torwache_passassld_condition;
	information = dia_pal_205_torwache_passassld_info;
	permanent = TRUE;
	description = "Let me through, I bear a message from the mercenaries.";
};


func int dia_pal_205_torwache_passassld_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_SLD) && (PAL_205_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_passassld_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsSld_15_00");	//Let me through, I bear a message from the mercenaries.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsSld_12_01");	//All right, but I'm warning you. If you cause any trouble here, you won't have time to regret it.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_205_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_205_TORWACHE_PERM(C_INFO)
{
	npc = pal_205_torwache;
	nr = 2;
	condition = dia_pal_205_torwache_perm_condition;
	information = dia_pal_205_torwache_perm_info;
	permanent = TRUE;
	description = "How's your duty?";
};


func int dia_pal_205_torwache_perm_condition()
{
	if((PAL_205_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_205_torwache_perm_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PERM_15_00");	//How's duty?
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_01");	//We have everything under control.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_02");	//My task fulfills me, Chosen One.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_03");	//Go on in and shut up.
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_205_Torwache_PERM_12_04");	//What do you want?
	};
	AI_StopProcessInfos(self);
};

