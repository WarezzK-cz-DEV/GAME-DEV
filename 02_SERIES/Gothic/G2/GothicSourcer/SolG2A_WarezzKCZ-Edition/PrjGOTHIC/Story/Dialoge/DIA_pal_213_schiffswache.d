
instance DIA_PAL_213_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 999;
	condition = dia_pal_213_schiffswache_exit_condition;
	information = dia_pal_213_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_213_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


const string PAL_213_CHECKPOINT = "SHIP_DECK_09";

instance DIA_PAL_213_SCHIFFSWACHE_FIRSTWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 1;
	condition = dia_pal_213_schiffswache_firstwarn_condition;
	information = dia_pal_213_schiffswache_firstwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_firstwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_NONE) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_firstwarn_info()
{
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_00");	//Wait a moment! Where do you think you're going?
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_FirstWarn_15_01");	//I wanted to...
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_02");	//Sorry. You can't go through here.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_FirstWarn_01_03");	//There's nothing here to see. Now move along.
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_FIRSTWARNGIVEN;
};


instance DIA_PAL_213_SCHIFFSWACHE_SECONDWARN(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 2;
	condition = dia_pal_213_schiffswache_secondwarn_condition;
	information = dia_pal_213_schiffswache_secondwarn_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_secondwarn_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_FIRSTWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_secondwarn_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_00");	//Not one step further. No exceptions.
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_213_Schiffswache_SecondWarn_01_01");	//You don't want to FORCE me to hurt you, do you?
	};
	other.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(other,PAL_213_CHECKPOINT);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_SECONDWARNGIVEN;
	AI_StopProcessInfos(self);
};


instance DIA_PAL_213_SCHIFFSWACHE_ATTACK(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 3;
	condition = dia_pal_213_schiffswache_attack_condition;
	information = dia_pal_213_schiffswache_attack_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pal_213_schiffswache_attack_condition()
{
	if((MIS_SHIPISFREE == FALSE) && (self.aivar[AIV_GUARDPASSAGE_STATUS] == GP_SECONDWARNGIVEN) && (self.aivar[AIV_PASSGATE] == FALSE) && (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == TRUE) && (Npc_GetDistToWP(other,PAL_213_CHECKPOINT) < (other.aivar[AIV_LASTDISTTOWP] - 50)))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_attack_info()
{
	other.aivar[AIV_LASTDISTTOWP] = 0;
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_GUARDSTOPSINTRUDER,1);
};


instance DIA_PAL_213_SCHIFFSWACHE_GOONBOARD(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 5;
	condition = dia_pal_213_schiffswache_goonboard_condition;
	information = dia_pal_213_schiffswache_goonboard_info;
	permanent = FALSE;
	description = "I want to get aboard the ship.";
};


func int dia_pal_213_schiffswache_goonboard_condition()
{
	return TRUE;
};

func void dia_pal_213_schiffswache_goonboard_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_GoOnBoard_15_00");	//I want to get aboard the ship.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_01");	//No one may enter the ship! I have my orders!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_02");	//I shall kill anyone who enters the ship without authorization.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_GoOnBoard_01_03");	//In the name of Innos, I shall defend the ship with my life.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf_condition;
	information = dia_pal_213_schiffswache_iamkdf_info;
	permanent = FALSE;
	description = "You question the wish of a Fire Magician?";
};


func int dia_pal_213_schiffswache_iamkdf_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF_15_00");	//You question the wish of a Fire Magician?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_01");	//(nervous) No, of course not. May Innos forgive me.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_02");	//(nervous) The Magicians of Fire are the guardians of the wisdom of Innos...
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF_01_03");	//(nervous)... whoever doubts them, doubts Innos and forfeits any right to mercy.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf2_condition;
	information = dia_pal_213_schiffswache_iamkdf2_info;
	permanent = FALSE;
	description = "What happens if I go aboard?";
};


func int dia_pal_213_schiffswache_iamkdf2_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF2_15_00");	//What happens if I go aboard?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF2_01_01");	//(nervous) I shall kill... I mean, stop you.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf3_condition;
	information = dia_pal_213_schiffswache_iamkdf3_info;
	permanent = FALSE;
	description = "You would attack a Fire Magician?";
};


func int dia_pal_213_schiffswache_iamkdf3_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_00");	//You would attack a Fire Magician?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_01");	//(nervous) I would never lay a hand on a magician.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF3_15_02");	//So what would you do if I went aboard?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF3_01_03");	//(sheepishly) Nothing, Sir.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF4(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf4_condition;
	information = dia_pal_213_schiffswache_iamkdf4_info;
	permanent = FALSE;
	description = "I will go aboard now.";
};


func int dia_pal_213_schiffswache_iamkdf4_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf3))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf4_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF4_15_00");	//I will go aboard now.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF4_01_01");	//(nervous) You mustn't do that, Lord Hagen's orders were quite clear.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF5(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf5_condition;
	information = dia_pal_213_schiffswache_iamkdf5_info;
	permanent = FALSE;
	description = "Do Lord Hagen's orders include me, too?";
};


func int dia_pal_213_schiffswache_iamkdf5_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf4))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf5_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_00");	//Do Lord Hagen's orders include me, too?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_01");	//(nervous) I don't know.
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF5_15_02");	//Just think - would Lord Hagen dare to suspect a magician of theft?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF5_01_03");	//I don't believe that.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMKDF6(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamkdf6_condition;
	information = dia_pal_213_schiffswache_iamkdf6_info;
	permanent = FALSE;
	description = "For the last time: Let me board the ship!";
};


func int dia_pal_213_schiffswache_iamkdf6_condition()
{
	if((hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamkdf5))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamkdf6_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmKDF6_15_00");	//For the last time: Let me board the ship!
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmKDF6_01_01");	//(nervous) Understood. You may go on board.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal_condition;
	information = dia_pal_213_schiffswache_iampal_info;
	permanent = FALSE;
	description = "Do you not trust me, knight?";
};


func int dia_pal_213_schiffswache_iampal_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL_15_00");	//Do you not trust me, knight?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL_01_01");	//No, I just follow my orders.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal2_condition;
	information = dia_pal_213_schiffswache_iampal2_info;
	permanent = FALSE;
	description = "Then you shall know which of us has the higher rank.";
};


func int dia_pal_213_schiffswache_iampal2_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL2_15_00");	//Then you should know which of us has the higher rank.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL2_01_01");	//Yes, Sir!
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMPAL3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iampal3_condition;
	information = dia_pal_213_schiffswache_iampal3_info;
	permanent = FALSE;
	description = "I hereby command you to grant me access to this ship.";
};


func int dia_pal_213_schiffswache_iampal3_condition()
{
	if((hero.guild == GIL_PAL) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iampal2))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iampal3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmPAL3_15_00");	//I hereby command you to grant me access to the ship.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmPAL3_01_01");	//Understood, Sir, access will be granted.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg_condition;
	information = dia_pal_213_schiffswache_iamdjg_info;
	permanent = FALSE;
	description = "Is there nothing to be done about that?";
};


func int dia_pal_213_schiffswache_iamdjg_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_goonboard))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG_15_00");	//Is there nothing to be done about that?
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG_01_01");	//I don't think I understand.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG2(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg2_condition;
	information = dia_pal_213_schiffswache_iamdjg2_info;
	permanent = FALSE;
	description = "I could give you money.";
};


func int dia_pal_213_schiffswache_iamdjg2_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg2_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG2_15_00");	//I could give you money. For looking the other way.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG2_01_01");	//I cannot be bribed, and if you don't disappear right now, I will take that as an insult.
};


instance DIA_PAL_213_SCHIFFSWACHE_IAMDJG3(C_INFO)
{
	npc = pal_213_schiffswache;
	nr = 6;
	condition = dia_pal_213_schiffswache_iamdjg3_condition;
	information = dia_pal_213_schiffswache_iamdjg3_info;
	permanent = FALSE;
	description = "I have a written authorization.";
};


func int dia_pal_213_schiffswache_iamdjg3_condition()
{
	if((hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_pal_213_schiffswache_iamdjg) && (Npc_HasItems(other,itwr_forgedshipletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_pal_213_schiffswache_iamdjg3_info()
{
	AI_Output(other,self,"DIA_Pal_213_Schiffswache_IAmDJG3_15_00");	//I have a written authorization. I am permitted to board the ship.
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_01");	//Let me see.
	b_giveinvitems(other,self,itwr_forgedshipletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pal_213_Schiffswache_IAmDJG3_01_02");	//All right, you may pass.
	MIS_SHIPISFREE = TRUE;
	b_startotherroutine(girion,"WaitForShip");
};

