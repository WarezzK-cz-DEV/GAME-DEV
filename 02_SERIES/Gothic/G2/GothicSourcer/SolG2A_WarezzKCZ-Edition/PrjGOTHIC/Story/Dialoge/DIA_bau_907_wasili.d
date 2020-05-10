
instance DIA_WASILI_EXIT(C_INFO)
{
	npc = bau_907_wasili;
	nr = 999;
	condition = dia_wasili_exit_condition;
	information = dia_wasili_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wasili_exit_condition()
{
	return TRUE;
};

func void dia_wasili_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WASILI_HALLO(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_hallo_condition;
	information = dia_wasili_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_wasili_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_wasili_hallo_info()
{
	AI_Output(self,other,"DIA_Wasili_HALLO_01_00");	//Don't even think about touching anything here. Otherwise you'll get a couple upside the head, got it?
};


instance DIA_WASILI_JOB(C_INFO)
{
	npc = bau_907_wasili;
	nr = 1;
	condition = dia_wasili_job_condition;
	information = dia_wasili_job_info;
	permanent = FALSE;
	description = "What's your job?";
};


func int dia_wasili_job_condition()
{
	return TRUE;
};

func void dia_wasili_job_info()
{
	AI_Output(other,self,"DIA_Wasili_Job_15_00");	//What's your job?
	AI_Output(self,other,"DIA_Wasili_Job_01_01");	//Onar wants me to spend all day keeping an eye on his stuff.
	AI_Output(self,other,"DIA_Wasili_Job_01_02");	//He's worried that something will go missing. And I would too, in his place.
	AI_Output(self,other,"DIA_Wasili_Job_01_03");	//Most of the mercenaries he's hired are former convicts from the penal colony.
	AI_Output(self,other,"DIA_Wasili_Job_01_04");	//They'll walk off with everything that isn't nailed down, if no one watches out.
};


instance DIA_WASILI_SAMMLER(C_INFO)
{
	npc = bau_907_wasili;
	nr = 4;
	condition = dia_wasili_sammler_condition;
	information = dia_wasili_sammler_info;
	permanent = FALSE;
	description = "There's a whole bunch of junk here.";
};


func int dia_wasili_sammler_condition()
{
	return TRUE;
};

func void dia_wasili_sammler_info()
{
	AI_Output(other,self,"DIA_Wasili_Sammler_15_00");	//There's a whole bunch of junk here.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_01");	//That's right, and most of it is extremely valuable. Onar collects valuable objects.
	AI_Output(self,other,"DIA_Wasili_Sammler_01_02");	//A simple man like me can hardly afford such luxury. I stick to other things.
	AI_Output(other,self,"DIA_Wasili_Sammler_15_03");	//And that would be?
	AI_Output(self,other,"DIA_Wasili_Sammler_01_04");	//I collect old coins.
	MIS_WASILI_BRINGOLDCOIN = LOG_RUNNING;
};


instance DIA_WASILI_FIRSTOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_firstoldcoin_condition;
	information = dia_wasili_firstoldcoin_info;
	permanent = TRUE;
	description = "I've got an old coin here.";
};


var int wasili_bringoldcoin_nomore;

func int dia_wasili_firstoldcoin_condition()
{
	if((MIS_WASILI_BRINGOLDCOIN == LOG_RUNNING) && (WASILISOLDCOINOFFER == 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
	{
		return TRUE;
	};
};


var int wasilisoldcoinoffer;
var int firstoldcoin_angebotenxp_onetime;
var int dia_wasili_firstoldcoin_mehr_onetime;

func void dia_wasili_firstoldcoin_info()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_15_00");	//I've got an old coin here.
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_01");	//Mmh. Show me.
	};
	b_giveinvitems(other,self,itmi_oldcoin,1);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_02");	//Oh, yeah. That won't bring much on the open market.
	};
	if(DIA_WASILI_FIRSTOLDCOIN_MEHR_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_03");	//I'll pay you a gold piece for it. Exactly as much as it used to be worth.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_01_04");	//You know what I'm prepared to pay for it, you dog. One gold piece. No more.
	};
	Info_ClearChoices(dia_wasili_firstoldcoin);
	Info_AddChoice(dia_wasili_firstoldcoin,"Nah, I think I'll keep it then.",dia_wasili_firstoldcoin_nein);
	Info_AddChoice(dia_wasili_firstoldcoin,"Not quite enough. What about 2?",dia_wasili_firstoldcoin_mehr);
	Info_AddChoice(dia_wasili_firstoldcoin,"It's a deal.",dia_wasili_firstoldcoin_ok);
	if(FIRSTOLDCOIN_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_giveplayerxp(XP_BRINGOLDCOIN);
		FIRSTOLDCOIN_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_wasili_firstoldcoin_ok()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ok_15_00");	//It's a deal.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_01");	//Good.
	if(WASILISOLDCOINOFFER == 2)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_02");	//Here's 2 gold coins.
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ok_01_03");	//If you have any more of those, you know where to find ME.
		WASILISOLDCOINOFFER = 1;
	};
	CreateInvItems(self,itmi_gold,WASILISOLDCOINOFFER);
	b_giveinvitems(self,other,itmi_gold,WASILISOLDCOINOFFER);
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_mehr()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_mehr_15_00");	//Not quite enough. What about 2?
	if(dia_wasili_firstoldcoin_mehr_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_01");	//Nothing doing! I'm not a loony! Beat it.
		dia_wasili_firstoldcoin_mehr_onetime = TRUE;
		b_giveinvitems(self,other,itmi_oldcoin,1);
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Wasili_FirstOldCoin_mehr_01_02");	//Arrh. Damn. All right. 2 gold coins for every old coin you can bring me, that's my final offer.
		WASILISOLDCOINOFFER = 2;
		Info_AddChoice(dia_wasili_firstoldcoin,"In that case, 3 doesn't sound bad.",dia_wasili_firstoldcoin_zumteufel);
	};
};

func void dia_wasili_firstoldcoin_nein()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_nein_15_00");	//Nah, I think I'll keep it then.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_nein_01_01");	//They don't have any value for you. You'll be back.
	b_giveinvitems(self,other,itmi_oldcoin,1);
	WASILISOLDCOINOFFER = 0;
	Info_ClearChoices(dia_wasili_firstoldcoin);
};

func void dia_wasili_firstoldcoin_zumteufel()
{
	AI_Output(other,self,"DIA_Wasili_FirstOldCoin_ZumTeufel_15_00");	//In that case, 3 doesn't sound bad.
	AI_Output(self,other,"DIA_Wasili_FirstOldCoin_ZumTeufel_01_01");	//Go to hell, you bastard.
	AI_StopProcessInfos(self);
	WASILI_BRINGOLDCOIN_NOMORE = TRUE;
	WASILISOLDCOINOFFER = 0;
};


instance DIA_WASILI_BRINGOLDCOIN(C_INFO)
{
	npc = bau_907_wasili;
	nr = 5;
	condition = dia_wasili_bringoldcoin_condition;
	information = dia_wasili_bringoldcoin_info;
	permanent = TRUE;
	description = "Interested in some more old coins?";
};


func int dia_wasili_bringoldcoin_condition()
{
	if((WASILISOLDCOINOFFER > 0) && (Npc_HasItems(other,itmi_oldcoin) >= 1) && (WASILI_BRINGOLDCOIN_NOMORE == FALSE))
	{
		return TRUE;
	};
};


var int oldcoincounter;

func void dia_wasili_bringoldcoin_info()
{
	var int oldcoincount;
	var int xp_bringoldcoins;
	var int oldcoingeld;
	AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_00");	//Interested in some more old coins?
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_01");	//Sure. Do you still have any?
	oldcoincount = Npc_HasItems(other,itmi_oldcoin);
	if(oldcoincount == 1)
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_02");	//One.
		b_giveplayerxp(XP_BRINGOLDCOIN);
		b_giveinvitems(other,self,itmi_oldcoin,1);
		Npc_RemoveInvItem(self,itmi_oldcoin);
		OLDCOINCOUNTER = OLDCOINCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Wasili_BringOldCoin_15_03");	//A few.
		b_giveinvitems(other,self,itmi_oldcoin,oldcoincount);
		Npc_RemoveInvItems(self,itmi_oldcoin,Npc_HasItems(self,itmi_oldcoin));
		xp_bringoldcoins = oldcoincount * XP_BRINGOLDCOIN;
		OLDCOINCOUNTER = OLDCOINCOUNTER + oldcoincount;
		b_giveplayerxp(xp_bringoldcoins);
	};
	AI_Output(self,other,"DIA_Wasili_BringOldCoin_01_04");	//Thanks. Here's your money. Bring me all you can find.
	oldcoingeld = oldcoincount * WASILISOLDCOINOFFER;
	CreateInvItems(self,itmi_gold,oldcoingeld);
	b_giveinvitems(self,other,itmi_gold,oldcoingeld);
};


instance DIA_WASILI_PERM(C_INFO)
{
	npc = bau_907_wasili;
	nr = 900;
	condition = dia_wasili_perm_condition;
	information = dia_wasili_perm_info;
	permanent = TRUE;
	description = "Has anyone tried to steal anything yet?";
};


func int dia_wasili_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_wasili_job))
	{
		return TRUE;
	};
};

func void dia_wasili_perm_info()
{
	AI_Output(other,self,"DIA_Wasili_PERM_15_00");	//Has anyone tried to steal anything yet?
	if(KAPITEL <= 2)
	{
		if(PETZCOUNTER_FARM_THEFT > 0)
		{
			AI_Output(self,other,"DIA_Wasili_PERM_01_01");	//You mean besides you?
		};
		AI_Output(self,other,"DIA_Wasili_PERM_01_02");	//A few! And I caught them all!
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Wasili_PERM_01_03");	//A few nights ago one of the mercenaries was creeping through the house.
		AI_Output(self,other,"DIA_Wasili_PERM_01_04");	//He had on a black robe with a hood so I wouldn't be able to see him.
		AI_Output(self,other,"DIA_Wasili_PERM_01_05");	//But I sent him running.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_06");	//No. Not lately.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Wasili_perm_01_07");	//The mercenaries seem to be getting ready to break camp.
		AI_Output(self,other,"DIA_Wasili_perm_01_08");	//It wouldn't amaze me if Lee and his boys left the island over night.
	};
};


instance DIA_WASILI_PICKPOCKET(C_INFO)
{
	npc = bau_907_wasili;
	nr = 900;
	condition = dia_wasili_pickpocket_condition;
	information = dia_wasili_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_wasili_pickpocket_condition()
{
	return c_beklauen(55,90);
};

func void dia_wasili_pickpocket_info()
{
	Info_ClearChoices(dia_wasili_pickpocket);
	Info_AddChoice(dia_wasili_pickpocket,DIALOG_BACK,dia_wasili_pickpocket_back);
	Info_AddChoice(dia_wasili_pickpocket,DIALOG_PICKPOCKET,dia_wasili_pickpocket_doit);
};

func void dia_wasili_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wasili_pickpocket);
};

func void dia_wasili_pickpocket_back()
{
	Info_ClearChoices(dia_wasili_pickpocket);
};

