
instance DIA_ADDON_MYXIR_ADW_EXIT(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 999;
	condition = dia_addon_myxir_adw_exit_condition;
	information = dia_addon_myxir_adw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_myxir_adw_exit_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_MYXIR_ADWHELLO(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_adwhello_condition;
	information = dia_addon_myxir_adwhello_info;
	description = "Any new findings?";
};


func int dia_addon_myxir_adwhello_condition()
{
	return TRUE;
};

func void dia_addon_myxir_adwhello_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_00");	//Any new findings?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_01");	//The builders of these ruins fascinate me!
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_02");	//It is just too bad that their language is as dead as they are.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_03");	//(considering) Even their mighty rituals and summonings could not save them.
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_15_04");	//Summonings?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_05");	//The builders had a strong connection to the spirit world.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_06");	//If I have understood correctly, they believed they were in constant contact with their ancestors.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_12_07");	//They held regular summonings and rituals to ask the spirits for advice or to gain enlightenment.
	Info_ClearChoices(dia_addon_myxir_adwhello);
	Info_AddChoice(dia_addon_myxir_adwhello,"How did these spirit summonings work?",dia_addon_myxir_adwhello_wie);
	Info_AddChoice(dia_addon_myxir_adwhello,"The undead that I know never had much to say.",dia_addon_myxir_adwhello_watt);
};

func void dia_addon_myxir_adwhello_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_wie_15_00");	//How did these spirit summonings work?
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_01");	//The guardians of the dead had their special formulas they used to pacify the spirits.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_wie_12_02");	//The descriptions I could find here, however, are in part very confusing. Only rarely do I get a clear answer to my questions.
};

func void dia_addon_myxir_adwhello_watt()
{
	AI_Output(other,self,"DIA_Addon_Myxir_ADWHello_Watt_15_00");	//The undead that I know never had much to say.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_01");	//The builders did not create soulless undead such as zombies or other evil creatures.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_02");	//These spirits were the souls of great warriors, priests and rulers.
	AI_Output(self,other,"DIA_Addon_Myxir_ADWHello_Watt_12_03");	//So far, I have no doubt that they really exist.
};


instance DIA_ADDON_MYXIR_PERMADW(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 10;
	condition = dia_addon_myxir_permadw_condition;
	information = dia_addon_myxir_permadw_info;
	permanent = TRUE;
	description = "If I see a spirit, I'll let you know.";
};


func int dia_addon_myxir_permadw_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_myxir_adwhello) && (SATURAS_RIESENPLAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_permadw_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_PermADW_15_00");	//If I see a spirit, I'll let you know.
	AI_Output(self,other,"DIA_Addon_Myxir_PermADW_12_01");	//(laughs) Yes, I insist on it.
};


instance DIA_ADDON_MYXIR_GEISTTAFEL(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geisttafel_condition;
	information = dia_addon_myxir_geisttafel_info;
	description = "Saturas sent me.";
};


func int dia_addon_myxir_geisttafel_condition()
{
	if((SATURAS_RIESENPLAN == TRUE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geisttafel_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_00");	//Saturas sent me.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_01");	//Raven has made his way into the temple and blocked the portal from the inside.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_02");	//Saturas thinks he got his information about the temple from a ghost!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_03");	//(stunned) By Adanaos!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_04");	//He must have summoned the high priest Khardimon to ask him about a way into the temple.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_05");	//According to the records, his grave was in the caves under the fortress!
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_06");	//You will have to do the same.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_07");	//But you cannot ask Khardimon any more...
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_08");	//The grave of the warrior prince Quahodron is supposed to lie in the west of the valley.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_09");	//You will have to find it... and waken Quahodron.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_10");	//It is written in these inscriptions how a believer of Adanos can summon a spirit.
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_15_11");	//Do you think that will really work?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_12");	//I've read a lot of crazy ramblings.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_13");	//For example, the writings of Y'Berion, the leader of the Brotherhood of the Sleeper.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_12_14");	//But I believe every word of the author of THESE writings.
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_RUNNING;
	Info_ClearChoices(dia_addon_myxir_geisttafel);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Are you really serious?",dia_addon_myxir_geisttafel_geist);
	Info_AddChoice(dia_addon_myxir_geisttafel,"Why Quarhodron? Why not the high priest Khardimon?",dia_addon_myxir_geisttafel_khardimon);
	Info_AddChoice(dia_addon_myxir_geisttafel,"The Brotherhood of the Sleeper didn't spread JUST lies.",dia_addon_myxir_geisttafel_psi);
};

func void dia_addon_myxir_geisttafel_khardimon()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_Khardimon_15_00");	//Why Quarhodron? Why not the high priest Khardimon?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_01");	//Raven has desecrated the grave of Khardimon with his summoning. We can assume that.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_Khardimon_12_02");	//We shall have to look for another spirit.
};

func void dia_addon_myxir_geisttafel_psi()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_psi_15_00");	//The Brotherhood of the Sleeper didn't spread JUST lies. The Sleeper really existed.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_01");	//But it wasn't their lies that made them implausible, it was their words as such.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_02");	//They were more confused than believable. They showed the excessive use of the swampweed they smoked.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_psi_12_03");	//It is the seriousness and prudence in the words on this stone tablet that convince me that THIS man wrote the truth.
};

func void dia_addon_myxir_geisttafel_geist()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_geist_15_00");	//Are you really serious?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_01");	//I want to explore every possibility.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_02");	//Even if there is only a ghost of a chance for us to meet one of the builders, then we have to do it.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_geist_12_03");	//Raven has managed to do it, after all.
	Info_AddChoice(dia_addon_myxir_geisttafel,"Supposing I wanted to summon this ghost...",dia_addon_myxir_geisttafel_wie);
};

func void dia_addon_myxir_geisttafel_wie()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistTafel_wie_15_00");	//Assuming I want to summon this ghost, what do I have to do?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_01");	//Find Quahodron's grave in the west of the valley.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_02");	//His ghost can be summoned by the words of the guardians of the dead which I have written for you here.
	CreateInvItems(self,itwr_addon_summonancientghost,1);
	b_giveinvitems(self,other,itwr_addon_summonancientghost,1);
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_03");	//That's all. Now you just have to find the grave.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistTafel_wie_12_04");	//Good luck, my son!
	b_logentry(TOPIC_ADDON_QUARHODRON,"Myxir wants me to waken the ghost of the old warrior prince Quarhodron and ask him for advice. He gave me a document with a formula that I am supposed to read aloud at Quarhodron's grave in the west.");
	Info_ClearChoices(dia_addon_myxir_geisttafel);
};


instance DIA_ADDON_MYXIR_GEISTPERM(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_geistperm_condition;
	information = dia_addon_myxir_geistperm_info;
	description = "What was that again about the warrior prince Quarhodron?";
};


func int dia_addon_myxir_geistperm_condition()
{
	if(MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_myxir_geistperm_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_GeistPerm_15_00");	//What was that again about the warrior prince Quarhodron?
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_01");	//You have to find his grave and summon his ghost with the words of the guardians of the dead.
	AI_Output(self,other,"DIA_Addon_Myxir_GeistPerm_12_02");	//I have written the words down. You just have to read them aloud.
};


instance DIA_ADDON_MYXIR_TALKEDTOGHOST(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 5;
	condition = dia_addon_myxir_talkedtoghost_condition;
	information = dia_addon_myxir_talkedtoghost_info;
	description = "I've talked to Quarhodron.";
};


func int dia_addon_myxir_talkedtoghost_condition()
{
	if((MIS_ADDON_MYXIR_GEISTBESCHWOEREN == LOG_RUNNING) && (SC_TALKEDTOGHOST == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_talkedtoghost_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_00");	//I've talked to Quarhodron.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_01");	//(excited) Then you were really able to waken him from the realm of the dead?
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_02");	//That's unbelievable. I am more and more amazed by these builders.
	AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_03");	//Who knows what they could have achieved if they still existed today...
	MIS_ADDON_MYXIR_GEISTBESCHWOEREN = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_MYXIR_GEISTBESCHWOEREN);
	if((SATURAS_KNOWSHOW2GETINTEMPEL == FALSE) && (GHOST_SCKNOWSHOW2GETINADANOSTEMPEL == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_04");	//What did the ghost say?
		AI_Output(other,self,"DIA_Addon_Myxir_TalkedToGhost_15_05");	//He gave me something that will let me get into the temple of Adanos.
		AI_Output(self,other,"DIA_Addon_Myxir_TalkedToGhost_12_06");	//Then go straight to Saturas. He will certainly be interested in what you have to say.
		b_logentry(TOPIC_ADDON_QUARHODRON,"I should report to Saturas that I have woken Quarhodron.");
	};
};


instance DIA_ADDON_MYXIR_ADW_TEACH(C_INFO)
{
	npc = kdw_14030_addon_myxir_adw;
	nr = 90;
	condition = dia_addon_myxir_adw_teach_condition;
	information = dia_addon_myxir_adw_teach_info;
	permanent = TRUE;
	description = "Teach me that language.";
};


var int dia_addon_myxir_adw_teach_noperm;
var int dia_addon_myxir_adw_teach_onetime;

func int dia_addon_myxir_adw_teach_condition()
{
	if((DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_TEACH_NOPERM == FALSE) && (DIA_ADDON_MYXIR_ADW_TEACH_NOPERM == FALSE) && Npc_KnowsInfo(other,dia_addon_myxir_adwhello))
	{
		return TRUE;
	};
};

func void dia_addon_myxir_adw_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Myxir_TeachRequest_15_00");	//Teach me that language.
	if(KNOW_FOREIGNLANGUAGE == FALSE)
	{
		b_dia_addon_myxir_teach_fl();
		b_dia_addon_myxir_teach_language_x();
		AI_PrintScreen("Learn language of the builders",-1,-1,FONT_SCREENBRIGHTLARGE,3);
		Info_ClearChoices(dia_addon_myxir_adw_teach);
		KNOW_FOREIGNLANGUAGE = TRUE;
	}
	else
	{
		b_dia_addon_myxir_teachnomore();
		DIA_ADDON_MYXIR_ADW_TEACH_NOPERM = TRUE;
	};
};

