
instance DIA_MIL_333_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 999;
	condition = dia_mil_333_stadtwache_exit_condition;
	information = dia_mil_333_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_333_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_333_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string MIL_333_CHECKPOINT = "NW_CITY_MERCHANT_PATH_29";

var int mil_333_personal_absolutionlevel;

instance DIA_MIL_333_STADTWACHE_FIRSTWARN(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 1;
	condition = dia_mil_333_stadtwache_firstwarn_condition;
	information = dia_mil_333_stadtwache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_firstwarn_condition()
{
	if(Npc_GetDistToWP(other,MIL_333_CHECKPOINT) <= 1000)
	{
		Npc_SetRefuseTalk(self,5);
		return FALSE;
	};
	if((b_getgreatestpetzcrime(self) >= CRIME_ATTACK) && (b_getcurrentabsolutionlevel(self) == MIL_333_PERSONAL_ABSOLUTIONLEVEL))
	{
		self.aivar[AIV_PASSGATE] = FALSE;
	}
	else if(MIL_333_SCHONMALREINGELASSEN == TRUE)
	{
		self.aivar[AIV_PASSGATE] = TRUE;
	};
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_firstwarn_info()
{
	var C_ITEM itm;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_00");	//HALT!
	if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
	{
		AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_01");	//(sighs) What is it?
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_02");	//You know that only too well!
		if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_03");	//You're wanted for murder in town!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_04");	//We need no filthy thieves around here!
		};
		if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_05");	//We have no use for troublemakers in our town!
		};
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_06");	//Why do you think we should let you in?
	}
	else
	{
		itm = Npc_GetEquippedArmor(other);
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_bau_l) == TRUE) || (Hlp_IsItem(itm,itar_bau_m) == TRUE))
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_07");	//Yes?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_08");	//You look like a poor blighter. In this town, we have no use for people without money.
			if(Npc_HasItems(other,itwr_passierschein))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_09");	//But I've got a pass!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_10");	//That one's only good for the other gate!
			};
			if(Npc_KnowsInfo(other,dia_mil_310_stadtwache_milizwerden))
			{
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_11");	//But I'm planning to join the city guard!
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_12");	//Hah! Don't make me laugh! Go to the other gate and try to sell that story to THEM.
				AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_13");	//I've already been there - they sent me to you.
				AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_14");	//(dirty laugh) Oh man! They're always sending us the cream of the crop...
			};
		}
		else
		{
			AI_Output(other,self,"DIA_Mil_333_Stadtwache_FirstWarn_15_15");	//(calmly) What?
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_FirstWarn_06_16");	//Just wanted to have a look at you. Oh well, you seem to have some money. Go on in.
			self.aivar[AIV_PASSGATE] = TRUE;
			stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
			MIL_333_SCHONMALREINGELASSEN = TRUE;
			AI_StopProcessInfos(self);
		};
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_333_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_MIL_333_STADTWACHE_SECONDWARN(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 2;
	condition = dia_mil_333_stadtwache_secondwarn_condition;
	information = dia_mil_333_stadtwache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_secondwarn_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_333_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_secondwarn_info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_SecondWarn_06_00");	//Something wrong with your ears? Take one more step and you'll feel my blade!
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,MIL_333_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_MIL_333_STADTWACHE_ATTACK(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 3;
	condition = dia_mil_333_stadtwache_attack_condition;
	information = dia_mil_333_stadtwache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_attack_condition()
{
	if((self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,MIL_333_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_Attack_06_00");	//You asked for it...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,0);
};


instance DIA_MIL_333_STADTWACHE_BRIBE(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_bribe_condition;
	information = dia_mil_333_stadtwache_bribe_info;
	permanent = TRUE;
	description = "Here's 100 gold pieces. Let me pass!";
};


func int dia_mil_333_stadtwache_bribe_condition()
{
	if(self.aivar[AIV_PASSGATE] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_bribe_info()
{
	AI_Output(other,self,"DIA_Mil_333_Stadtwache_Bribe_15_00");	//Here's 100 gold pieces. Let me pass!
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_01");	//(greedily) 100 pieces of gold sounds fine. In you go, then.
		if(b_getgreatestpetzcrime(self) >= CRIME_ATTACK)
		{
			AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_02");	//And go directly to Andre! Or I'll charge you another 100 gold pieces the next time!
		};
		self.aivar[AIV_PASSGATE] = TRUE;
		stadtwache_310.aivar[AIV_PASSGATE] = TRUE;
		MIL_333_SCHONMALREINGELASSEN = TRUE;
		b_checklog();
		MIL_333_PERSONAL_ABSOLUTIONLEVEL = b_getcurrentabsolutionlevel(self) + 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Mil_333_Stadtwache_Bribe_06_03");	//What?! Where?! I don't see any gold coins. Get lost!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MIL_333_STADTWACHE_PERM(C_INFO)
{
	npc = mil_333_stadtwache;
	nr = 5;
	condition = dia_mil_333_stadtwache_perm_condition;
	information = dia_mil_333_stadtwache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mil_333_stadtwache_perm_condition()
{
	if((self.aivar[AIV_PASSGATE] == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_mil_333_stadtwache_perm_info()
{
	AI_Output(self,other,"DIA_Mil_333_Stadtwache_PERM_06_00");	//Move on!
	AI_StopProcessInfos(self);
};

