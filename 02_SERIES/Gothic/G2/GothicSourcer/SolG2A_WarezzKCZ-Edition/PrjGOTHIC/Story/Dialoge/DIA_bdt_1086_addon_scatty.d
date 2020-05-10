
var int scatty_start;

instance DIA_ADDON_SCATTY_EXIT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 999;
	condition = dia_addon_scatty_exit_condition;
	information = dia_addon_scatty_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_scatty_exit_condition()
{
	return TRUE;
};

func void dia_addon_scatty_exit_info()
{
	AI_StopProcessInfos(self);
	if(SCATTY_START == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		SCATTY_START = TRUE;
	};
};


instance DIA_ADDON_SCATTY_PICKPOCKET(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 900;
	condition = dia_addon_scatty_pickpocket_condition;
	information = dia_addon_scatty_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_addon_scatty_pickpocket_condition()
{
	return c_beklauen(60,90);
};

func void dia_addon_scatty_pickpocket_info()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_BACK,dia_addon_scatty_pickpocket_back);
	Info_AddChoice(dia_addon_scatty_pickpocket,DIALOG_PICKPOCKET,dia_addon_scatty_pickpocket_doit);
};

func void dia_addon_scatty_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};

func void dia_addon_scatty_pickpocket_back()
{
	Info_ClearChoices(dia_addon_scatty_pickpocket);
};


instance DIA_ADDON_SCATTY_HI(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_hi_condition;
	information = dia_addon_scatty_hi_info;
	permanent = FALSE;
	description = "How's business?";
};


func int dia_addon_scatty_hi_condition()
{
	return TRUE;
};

func void dia_addon_scatty_hi_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Hi_15_00");	//How's business?
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_01");	//Since the tomb has been opened, there hasn't been much demand.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_02");	//Raven has no more use for the slaves, that's why they're mining gold now. On Bloodwyn's orders.
	AI_Output(self,other,"DIA_Addon_Scatty_Hi_01_03");	//And the diggers are taking it easy. (mumbles) Diggers who take it easy aren't good for business.
	Log_CreateTopic(TOPIC_ADDON_BDT_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_BDT_TRADER,"Scatty sells a variety of goods.");
};


instance DIA_ADDON_SCATTY_LAST(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_last_condition;
	information = dia_addon_scatty_last_info;
	permanent = FALSE;
	description = "Bloodwyn? Is he in charge here?";
};


func int dia_addon_scatty_last_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi) && !Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_last_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_00");	//Bloodwyn? Is he in charge here?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_01");	//He oversees the mine. But he's almost never down here. He spends most of his time with Raven in the temple.
	AI_Output(other,self,"DIA_Addon_Scatty_last_15_02");	//What exactly does 'almost never' mean?
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_03");	//The last time I saw him was when he came out of the tomb...
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_04");	//(hastily)... No, wait! The last time he was here was when he sent the slaves to mine the gold.
	AI_Output(self,other,"DIA_Addon_Scatty_last_01_05");	//Unlike Raven, HE is very interested in gold.
};


instance DIA_ADDON_SCATTY_GRUFT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruft_condition;
	information = dia_addon_scatty_gruft_info;
	permanent = FALSE;
	description = "What sort of tomb?";
};


func int dia_addon_scatty_gruft_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruft_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_00");	//What sort of tomb?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_01");	//A cursed unlucky tomb! The guardians of the tomb have killed many men!
	AI_Output(other,self,"DIA_Addon_Scatty_Gruft_15_02");	//Guardians? Are you talking about creatures of stone? Rather flat, with a round head?
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_03");	//That's exactly what I mean! They came out of the depths of the stone by the dozen.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_04");	//I knew from the beginning that it wasn't good to dig out the tomb.
	AI_Output(self,other,"DIA_Addon_Scatty_Gruft_01_05");	//But Raven was possessed with the idea of digging there. And once the tomb was finally uncovered, he marched in there with his guards.
};


instance DIA_ADDON_SCATTY_GRUFTAGAIN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gruftagain_condition;
	information = dia_addon_scatty_gruftagain_info;
	permanent = FALSE;
	description = "What did Raven want in the tomb?";
};


func int dia_addon_scatty_gruftagain_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruft))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_gruftagain_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_00");	//What did Raven want in the tomb?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_01");	//(stops short) Hm... you're pretty curious. You remind me of a fellow I once knew.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_02");	//He was just as curious. And eventually it was his undoing.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_03");	//Get to the point. What happened in the tomb?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_04");	//Well... Ehm... my throat is really dry...
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_05");	//Hey, Scatty, NOT NOW. This is important, so what did Raven do there?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_06");	//All right. (takes a deep breath) He... he called... summoned something. He kept calling out words in a foreign language.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_07");	//Bright light poured out of the tomb and then I heard a scream that cut right through me - a demonic scream.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//And then?
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_09");	//That's all I know. At that moment Bloodwyn came out of the tomb and said I should beat it. And that's what I did.
	AI_Output(self,other,"DIA_Addon_Scatty_GruftAgain_01_10");	//It also didn't take long before Raven and his boys disappeared back into the temple. Since then Raven hasn't been seen.
};


instance DIA_ADDON_SCATTY_TRINKEN(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trinken_condition;
	information = dia_addon_scatty_trinken_info;
	permanent = FALSE;
	description = "Would you like a drink?";
};


func int dia_addon_scatty_trinken_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gruftagain))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trinken_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Trinken_15_00");	//Would you like a drink?
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_01");	//A beer would really hit the spot. There's hardly any beer here in camp.
	AI_Output(self,other,"DIA_Addon_Scatty_Trinken_01_02");	//But maybe Lucia still has a bottle...
};


instance DIA_ADDON_SCATTY_BIER(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_bier_condition;
	information = dia_addon_scatty_bier_info;
	permanent = FALSE;
	description = "To your health. (give beer)";
};


func int dia_addon_scatty_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_trinken) && Npc_HasItems(other,itfo_beer))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_bier_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_Bier_15_00");	//There you go.
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		AI_UseItem(self,itfo_beer);
	};
	AI_Output(self,other,"DIA_Addon_Scatty_Bier_01_01");	//Oh, that tastes good. Thanks man. You're my hero.
	b_giveplayerxp(XP_AMBIENT * 5);
};


instance DIA_ADDON_SCATTY_GOLD(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_gold_condition;
	information = dia_addon_scatty_gold_info;
	permanent = FALSE;
	description = DIALOG_ADDON_GOLD_DESCRIPTION;
};


func int dia_addon_scatty_gold_condition()
{
	return TRUE;
};

func void dia_addon_scatty_gold_info()
{
	b_say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_00");	//Take a pickaxe in your hand and whack at a lump of gold - anyone can do that.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_01");	//But many nuggets will shatter that way. That's why only people who understand mining should do it.
	AI_Output(self,other,"DIA_Addon_Scatty_Gold_01_02");	//I can tell you more once you have some more experience.
	b_upgrade_hero_hackchance(5);
};


var int scatty_teach_perm;

instance DIA_ADDON_SCATTY_TEACH(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_teach_condition;
	information = dia_addon_scatty_teach_info;
	permanent = TRUE;
	description = "Learn to dig gold (Cost: 1 LP/10 percent)";
};


func int dia_addon_scatty_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_gold) && (SCATTY_TEACH_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_teach_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_teach_15_00");	//Tell me more about gold mining.
	if(other.lp >= 1)
	{
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_01");	//Above all, you should know that gold isn't ore. It's soft as butter. If you strike too hard, everything will shatter.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_02");	//Every digger has his own tricks for knocking some decent nuggets out of the rock.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_03");	//Ultimately, these tricks are what make the difference between a digger and a good digger.
		AI_Output(self,other,"DIA_Addon_Scatty_teach_01_04");	//Besides that, practice makes perfect. Only when you've been digging for a while will you get better.
		other.lp = other.lp - 1;
		b_upgrade_hero_hackchance(10);
		SCATTY_TEACH_PERM = TRUE;
	}
	else
	{
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_ADDON_SCATTY_TOT(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 2;
	condition = dia_addon_scatty_tot_condition;
	information = dia_addon_scatty_tot_info;
	permanent = FALSE;
	description = "Bloodwyn is dead.";
};


func int dia_addon_scatty_tot_condition()
{
	if(Npc_IsDead(bloodwyn))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_tot_info()
{
	AI_Output(other,self,"DIA_Addon_Scatty_tot_15_00");	//Bloodwyn is dead.
	AI_Output(self,other,"DIA_Addon_Scatty_tot_01_01");	//Hm, there aren't many people I'd wish that on - but Bloodwyn is better off dead.
};


instance DIA_ADDON_SCATTY_TRADE(C_INFO)
{
	npc = bdt_1086_addon_scatty;
	nr = 99;
	condition = dia_addon_scatty_trade_condition;
	information = dia_addon_scatty_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE_V1;
};


func int dia_addon_scatty_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_scatty_hi))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_trade_info()
{
	b_say(other,self,"$TRADE_1");
	b_givetradeinv(self);
};

