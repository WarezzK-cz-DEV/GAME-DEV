
instance DIA_PAL_2055_TORWACHE_EXIT(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 999;
	condition = dia_pal_2055_torwache_exit_condition;
	information = dia_pal_2055_torwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_2055_torwache_exit_condition()
{
	return TRUE;
};

func void dia_pal_2055_torwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_2055_CHECKPOINT = "NW_CITY_LHCASTLE_MGATE";

var int pal_2055_schonmalreingelassen;

instance DIA_PAL_2055_TORWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 1;
	condition = dia_pal_2055_torwache_firstwarn_condition;
	information = dia_pal_2055_torwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2055_torwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,PAL_2055_CHECKPOINT) <= 100)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (PAL_2055_SCHONMALREINGELASSEN == TRUE))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(PAL_2055_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_firstwarn_info()
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
		AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//If you take one more step forward, by Innos, I shall knock you down!
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_2055_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance DIA_PAL_2055_TORWACHE_SECONDWARN(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 2;
	condition = dia_pal_2055_torwache_secondwarn_condition;
	information = dia_pal_2055_torwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2055_torwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_2055_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_PAL_205_Torwache_SecondWarn_12_00");	//If you take one more step forward, by Innos, I shall knock you down!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_2055_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2055_TORWACHE_ATTACK(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 3;
	condition = dia_pal_2055_torwache_attack_condition;
	information = dia_pal_2055_torwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_2055_torwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_2055_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
	b_attack(torwache2044,hero,AR_NONE,0);
};


instance DIA_PAL_2055_TORWACHE_HAGEN(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 2;
	condition = dia_pal_2055_torwache_hagen_condition;
	information = dia_pal_2055_torwache_hagen_info;
	permanent = TRUE;
	description = "I'm back from the Valley of Mines.";
};


func int dia_pal_2055_torwache_hagen_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_hagen_info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//I'm back from the Valley of Mines.
	AI_Output(other,self,"DIA_PAL_205_Torwache_Hagen_15_00");	//I need to speak to Lord Hagen!
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//All right, you can go in.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_2055_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2055_TORWACHE_PASSASMIL(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 3;
	condition = dia_pal_2055_torwache_passasmil_condition;
	information = dia_pal_2055_torwache_passasmil_info;
	permanent = TRUE;
	description = "I am a member of the militia.";
};


func int dia_pal_2055_torwache_passasmil_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_MIL) && (PAL_2055_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_passasmil_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMil_15_00");	//I am a member of the militia.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMil_12_01");	//All right, you can go in.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_2055_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2055_TORWACHE_PASSASMAGE(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 3;
	condition = dia_pal_2055_torwache_passasmage_condition;
	information = dia_pal_2055_torwache_passasmage_info;
	permanent = TRUE;
	description = "I am a Fire Magician.";
};


func int dia_pal_2055_torwache_passasmage_condition()
{
	if((Npc_GetTrueGuild(other) == GIL_KDF) && (PAL_2055_SCHONMALREINGELASSEN == FALSE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_passasmage_info()
{
	AI_Output(other,self,"DIA_PAL_205_Torwache_PassAsMage_15_00");	//I am a Fire Magician.
	AI_Output(self,other,"DIA_PAL_205_Torwache_PassAsMage_12_01");	//Yes, of course. Forgive me, Chosen One, but I am only doing my duty.
	self.aivar[AIV_PASSGATE] = TRUE;
	PAL_2055_SCHONMALREINGELASSEN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2055_TORWACHE_PERM(C_INFO)
{
	npc = pal_2055_torwache;
	nr = 2;
	condition = dia_pal_2055_torwache_perm_condition;
	information = dia_pal_2055_torwache_perm_info;
	permanent = TRUE;
	description = "How's duty?";
};


func int dia_pal_2055_torwache_perm_condition()
{
	if((PAL_2055_SCHONMALREINGELASSEN == TRUE) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK))
	{
		return TRUE;
	};
};

func void dia_pal_2055_torwache_perm_info()
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

