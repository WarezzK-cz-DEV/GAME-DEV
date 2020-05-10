
instance DIA_BALTRAM_EXIT(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 999;
	condition = dia_baltram_exit_condition;
	information = dia_baltram_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_baltram_exit_condition()
{
	return TRUE;
};

func void dia_baltram_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_HALLO(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_hallo_condition;
	information = dia_baltram_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_NAGUR_BOTE == FALSE))
	{
		return TRUE;
	};
};

func void dia_baltram_hallo_info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//Welcome, stranger, my name is Baltram. Have you come to stock up on food?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//I'm afraid I'll have to disappoint you. I don't have much in stock right now.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//But I'll be getting a new delivery soon.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//If you've come to buy food from me, you can just go away again.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//I don't think much of you mercenaries! You cause me nothing but trouble.
	};
};


instance DIA_ADDON_BALTRAM_LARESABLOESE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 1;
	condition = dia_addon_baltram_laresabloese_condition;
	information = dia_addon_baltram_laresabloese_info;
	important = TRUE;
};


func int dia_addon_baltram_laresabloese_condition()
{
	if(Npc_IsInState(self,zs_talk) && (SCISWEARINGRANGERRING == TRUE) && (MIS_LARES_BRINGRANGERTOME == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_laresabloese_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_00");	//Why are you looking so doubtful?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_01");	//I see that you bear the sign of the 'Ring of Water'.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_02");	//So are you a member, too?
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_03");	//What if I am?
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_04");	//Then I would tell you that Lares wants to be relieved from his post down at the harbor.
	AI_Output(self,other,"DIA_Addon_Baltram_LaresAbloese_01_05");	//Fine. If that's so, I'll see to it that somebody deals with it.
	AI_Output(other,self,"DIA_Addon_Baltram_LaresAbloese_15_06");	//I see.
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_ADDON_BRINGRANGERTOLARES,"Baltram, the trader in the marketplace, will see to it that Lares gets relieved. Maybe Lares can leave the harbor NOW.");
	SC_KNOWSBALTRAMASRANGER = TRUE;
	BALTRAM_EXCHANGE4LARES = TRUE;
};


instance DIA_BALTRAM_JOB(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 3;
	condition = dia_baltram_job_condition;
	information = dia_baltram_job_info;
	permanent = FALSE;
	description = "Have you got a job for me?";
};


func int dia_baltram_job_condition()
{
	if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baltram_job_info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//Have you got a job for me?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//No, I already have an errand-boy. Try with the other merchants.
};


instance DIA_BALTRAM_TRICK(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_trick_condition;
	information = dia_baltram_trick_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_trick_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_baltram_trick_info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//Are you looking for a job?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//Sure, what's it about?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//My errand-boy hasn't come back, and I'm waiting for a delivery from the farmer Akil.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//And how much is it worth to you?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//I'll give you 50 gold pieces.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//Fine, I'm in.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//Okay, just tell Akil that I sent you. He'll give you a package. Bring it to me.
	MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
	b_logentry(TOPIC_NAGUR,"Baltram has employed me as an errand-boy. Now I have to collect a delivery from Akil's farm.");
	Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
	b_logentry(TOPIC_BALTRAM,"If I bring Baltram his delivery, he'll pay me 50 pieces of gold.");
};


var int baltram_tradelog;

instance DIA_BALTRAM_WAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_warez_condition;
	information = dia_baltram_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V4;
};


func int dia_baltram_warez_condition()
{
	return TRUE;
};

func void dia_baltram_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//Show me your wares.
	if(BALTRAM_TRADELOG == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Baltram trades in foodstuffs at the marketplace.");
		BALTRAM_TRADELOG = TRUE;
	};
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//They never should have let it get so far. Now one of the mercenaries has actually murdered a paladin.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//Something had to happen one of these days!
	};
	if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//People like you will get nothing from me.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//Why?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//First you stir up the farmers, and then you act like nothing happened.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//Now beat it, you're driving away my customers.
		MIS_BALTRAMTRADE = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_BALTRAM_SKIP(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skip_condition;
	information = dia_addon_baltram_skip_info;
	description = "You're trading with pirates?";
};


func int dia_addon_baltram_skip_condition()
{
	if(SCKNOWSBALTRAMASPIRATETRADER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skip_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_00");	//(casually) You're doing business with pirates?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_01");	//(feels caught) What? Who told you that?
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_15_02");	//I talked to one of them. He seems to be waiting for you in his bay.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_01_03");	//What can you do? These are hard times. Everybody has to look after his own.
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"Weren't you afraid of getting caught?",dia_addon_baltram_skip_erwischen);
	Info_AddChoice(dia_addon_baltram_skip,"You will bear the consequences for this!",dia_addon_baltram_skip_mil);
};

func void dia_addon_baltram_skip_back()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Back_15_00");	//That was all I wanted to know.
	Info_ClearChoices(dia_addon_baltram_skip);
};

func void dia_addon_baltram_skip_mil()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_MIL_15_00");	//You will bear the consequences for this!
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_MIL_01_01");	//Hey, listen. I'll tell you all that I know and, in return, you won't rat on me, okay?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"What is it you trade?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"What do you know about the pirates?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_erwischen()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_erwischen_15_00");	//Weren't you afraid of getting caught?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_01");	//That could happen. You found out, too, didn't you?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_erwischen_01_02");	//But you'll keep your mouth shut, right?
	Info_ClearChoices(dia_addon_baltram_skip);
	Info_AddChoice(dia_addon_baltram_skip,"What is it you trade?",dia_addon_baltram_skip_was);
	Info_AddChoice(dia_addon_baltram_skip,"What do you know about the pirates?",dia_addon_baltram_skip_pirat);
};

func void dia_addon_baltram_skip_was()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_was_15_00");	//(curtly) What is it you're trading?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_01");	//I mostly supply them with food.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_was_01_02");	//And for that, they give me the finest rum that is to be had in Khorinis.
	Info_AddChoice(dia_addon_baltram_skip,"That was all I wanted to know.",dia_addon_baltram_skip_back);
	Info_AddChoice(dia_addon_baltram_skip,"I could handle this deal for you.",dia_addon_baltram_skip_ich);
};

func void dia_addon_baltram_skip_ich()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_Ich_15_00");	//(grins) I could take care of this deal for you.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_01");	//That would be great. I cannot leave Khorinis at the moment.
	CreateInvItems(self,itmi_packet_baltram4skip_addon,1);
	b_giveinvitems(self,other,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_02");	//Here, take this package and tell Skip not to be so stingy with the rum this time.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_Ich_01_03");	//It should be at least 3 bottles.
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,"Baltram gave me a package. I'm supposed to take it to Skip.");
	MIS_ADDON_BALTRAM_PAKET4SKIP = LOG_RUNNING;
};

func void dia_addon_baltram_skip_pirat()
{
	AI_Output(other,self,"DIA_Addon_Baltram_Skip_pirat_15_00");	//(curtly) What do you know about the pirates?
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_01");	//(hastily) They live in a remote part of the island of Khorinis.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_02");	//It can only be reached with a cog or some other ship, as far as I know.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_03");	//The citizens of Khorinis fear them. Quite rightly so, for they're nothing but a bunch of nasty cutthroats.
	AI_Output(self,other,"DIA_Addon_Baltram_Skip_pirat_01_04");	//Still, if you ask me, they're nowhere near as bad as the bandits.
};


instance DIA_ADDON_BALTRAM_SKIPSRUM(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_addon_baltram_skipsrum_condition;
	information = dia_addon_baltram_skipsrum_info;
	description = "I've got the rum from Skip.";
};


func int dia_addon_baltram_skipsrum_condition()
{
	if((SKIP_RUM4BALTRAM == TRUE) && (MIS_ADDON_BALTRAM_PAKET4SKIP == LOG_RUNNING) && (Npc_HasItems(other,itfo_addon_rum) >= 2))
	{
		return TRUE;
	};
};

func void dia_addon_baltram_skipsrum_info()
{
	AI_Output(other,self,"DIA_Addon_Baltram_SkipsRum_15_00");	//I got the rum from Skip. But he gave me no more than 2 bottles.
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_01");	//(angrily) Damn expensive, that. Who does he think he is? Well, give it here then.
	b_giveinvitems(other,self,itfo_addon_rum,2);
	AI_Output(self,other,"DIA_Addon_Baltram_SkipsRum_01_02");	//I can't give you much for it now. This here must be enough.
	CreateInvItems(self,itmi_gold,10);
	b_giveinvitems(self,other,itmi_gold,10);
	TOPIC_END_BALTRAMSKIPTRADE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_akilshof_condition;
	information = dia_baltram_akilshof_info;
	permanent = FALSE;
	description = "Where can I find Akil's farm?";
};


func int dia_baltram_akilshof_condition()
{
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_baltram_akilshof_info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//Where can I find Akil's farm?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//Just go straight out here through the east gate and follow the road to the southeast.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//After a short while, you'll come to a stone stairway. Go up that and from there you'll already be able to see Akil's farm.
};


instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_baltram_lieferung_condition;
	information = dia_baltram_lieferung_info;
	permanent = FALSE;
	description = "I've got Akil's delivery.";
};


func int dia_baltram_lieferung_condition()
{
	if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_baltram_lieferung_info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//I've got Akil's delivery.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//Excellent. Finally I can offer fresh goods again. Here are your 50 gold pieces.
	b_giveinvitems(other,self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
	MIS_NAGUR_BOTE = LOG_FAILED;
	b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
	Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	CreateInvItems(self,itfo_cheese,5);
	CreateInvItems(self,itfo_apple,10);
	CreateInvItems(self,itfo_beer,5);
	CreateInvItems(self,itfo_bacon,5);
	CreateInvItems(self,itfo_sausage,5);
};


instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_letustrade_condition;
	information = dia_baltram_letustrade_info;
	permanent = FALSE;
	description = "Couldn't we do business together after all?";
};


func int dia_baltram_letustrade_condition()
{
	if(MIS_BALTRAMTRADE == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baltram_letustrade_info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//Couldn't we do business together after all?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//Listen, if you bring me 10 hams and 10 bottles of wine, then I'll deal with you again.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//I'll see what I can do.
	MIS_BALTRAMTRADE = LOG_RUNNING;
};


var int baltramenoughbacon;
var int baltramenoughwine;

instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_haveyourwarez_condition;
	information = dia_baltram_haveyourwarez_info;
	permanent = TRUE;
	description = "I've got your wares.";
};


func int dia_baltram_haveyourwarez_condition()
{
	if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baltram_haveyourwarez_info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//I've got your wares.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//Show me.
	if(Npc_HasItems(other,itfo_bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//We already agreed on 10 hams. Come back when you have enough.
		BALTRAMENOUGHBACON = FALSE;
	}
	else
	{
		BALTRAMENOUGHBACON = TRUE;
	};
	if(Npc_HasItems(other,itfo_wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//And what about the 10 bottles of wine? Did you forget them?
		BALTRAMENOUGHWINE = FALSE;
	}
	else
	{
		BALTRAMENOUGHWINE = TRUE;
	};
	if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//Hmm, it isn't the best quality, but in these times you can't be too picky.
		b_giveinvitems(other,self,itfo_bacon,10);
		b_giveinvitems(other,self,itfo_wine,10);
		MIS_BALTRAMTRADE = LOG_SUCCESS;
		b_giveplayerxp(XP_BALTRAMTRADE);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//Now there's nothing that keeps us from doing business together.
	};
};


instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 900;
	condition = dia_baltram_pickpocket_condition;
	information = dia_baltram_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_baltram_pickpocket_condition()
{
	return c_beklauen(76,175);
};

func void dia_baltram_pickpocket_info()
{
	Info_ClearChoices(dia_baltram_pickpocket);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};

func void dia_baltram_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_baltram_pickpocket);
};

func void dia_baltram_pickpocket_back()
{
	Info_ClearChoices(dia_baltram_pickpocket);
};

