
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "I've got to go!";
};


func int dia_maleth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//I've got to go!
	AI_StopProcessInfos(self);
	if(MALETH_ERSTERWOLF == FALSE)
	{
		Wld_InsertNpc(ywolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		MALETH_ERSTERWOLF = TRUE;
	};
};


instance DIA_MALETH_HALLO(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_hallo_condition;
	information = dia_maleth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_maleth_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Hey, stranger!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//I saw how you came out of the mountains.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//You can be glad you didn't come by here three weeks ago.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//We would have taken you for an escaped convict. And we made short work of those!
		if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//You look completely done in.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//You looked completely done in when you arrived.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Well, you look almost human again by now!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(distrustful) What do you want here?
};


instance DIA_MALETH_BANDITS(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_bandits_condition;
	information = dia_maleth_bandits_info;
	permanent = FALSE;
	description = "I was attacked by bandits in the mountains.";
};


func int dia_maleth_bandits_condition()
{
	if((KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_bandits_info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//I was attacked by bandits in the mountains.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Those filthy rabble! They were probably the same bastards who took one of our sheep last night!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//You had terrific luck. Most people DON'T get away alive.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "Those bandits won't trouble you anymore...";
};


func int dia_maleth_banditsdead_condition()
{
	if((Npc_IsDead(ambusher_1013) || (BDT_1013_AWAY == TRUE)) && Npc_IsDead(ambusher_1014) && Npc_IsDead(ambusher_1015) && Npc_KnowsInfo(other,dia_maleth_bandits))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsdead_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Those bandits won't trouble you any more...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Why? Are they dead?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//They picked a fight with the wrong guy...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Thank Innos! Here - it isn't much, but I want you to have it!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//I'll tell the others about this!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "I know the hideout of the bandits...";
};


func int dia_maleth_banditsalive_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((!Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,dia_maleth_bandits) && (MIS_MALETH_BANDITS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsalive_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//I know the hideout of the bandits...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Do you want to attack them? Count me out! It's much too dangerous!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//Besides, I have to watch over my sheep!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//But if you think you can get the riff-raff off our backs, the whole farm would be very grateful to you.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"If I defeat the bandits on the way from Xardas' tower to Lobart's farm, everyone on the farm will be really grateful.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "I'm on my way to town.";
};


func int dia_maleth_tothecity_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_tothecity_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//I'm on my way to town.
	if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//The way you look, you'll have to bribe the guards to get in.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//And you have to know what they want to hear.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//They might let you in - if you tell them what they want to hear...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//And that would be?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Well, for example, that you're from Lobart's farm and want to go to the smith in the city.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"To get into the city I can tell the guards at the gates that I come from Lobart's farm and want to see the blacksmith.");
	if((Npc_HasEquippedArmor(other) == FALSE) || (Hlp_IsItem(itm,itar_prisoner) == TRUE))
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//But that won't do you any good. You don't look like a farmer.
		b_logentry(TOPIC_CITY,"Of course, I'd have to look like a farmer first.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//I see.
};


instance DIA_MALETH_EQUIPMENT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_equipment_condition;
	information = dia_maleth_equipment_info;
	permanent = FALSE;
	description = "I need better equipment!";
};


func int dia_maleth_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_equipment_info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//I need better equipment!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//I can imagine. But I'll tell you right now: we don't have anything to give away!
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//If you can pay for what you want, Lobart will sell you something.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Otherwise, go to him and ask him if he has work for you.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "Where can I find Lobart?";
};


func int dia_maleth_lobart_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_equipment) && !Npc_IsDead(lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_lobart_info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Where can I find Lobart?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//Well, on the farm, of course! The farm belongs to him!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//And don't try messing with him! He's thrashed a lot of tramps and thrown them off his farm.
};


instance DIA_MALETH_KAP3_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap3_exit_condition;
	information = dia_maleth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_maleth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PROBLEME(C_INFO)
{
	npc = bau_954_maleth;
	nr = 30;
	condition = dia_maleth_probleme_condition;
	information = dia_maleth_probleme_info;
	description = "Any new developments in the last few days?";
};


func int dia_maleth_probleme_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_maleth_probleme_info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Any new developments in the last few days?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Just go down the path to the city.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//If you run into a fellow with a black robe, then you'll know what's new.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"How are your sheep?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"Have the black robes come to see you yet?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Have the black robes come to see you yet?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Yeah. They've been here for a few days. If you ask me they come straight from hell.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//How are your sheep?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(angry) As if that would interest you at all. You have other problems.
	Info_AddChoice(dia_maleth_probleme,"My problems? What would you know about that?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//My problems? What would you know about that?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(brusque) Do you belong to the city guard or not? Then do something about these black-robed bastards.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(angry) You filthy mercenaries only think of one thing: how do I get other people's money into my pocket.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//You noble lords from the monastery should do something about these hooded fellows.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Hey, watch your mouth, buddy.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"What's your problem?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//What's your problem?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//I blame that moonshine rotgut Vino palmed off on me a few weeks ago.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//I can hardly remember anything at all, man. I only know that my walking stick has been missing since then.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//And that's what you're raising such a ruckus for?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//That's easy for you to say, it doesn't belong to you.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth lost his walking stick. He was stone drunk. If I know him, he never went far from Lobart's farm. I should be able to find the thing somewhere around there.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Hey, watch your mouth, buddy.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//All you can do is talk big. The best thing would be if you went away.
};

func void dia_maleth_probleme_back()
{
	Info_ClearChoices(dia_maleth_probleme);
};


instance DIA_MALETH_GEHSTOCK(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_gehstock_condition;
	information = dia_maleth_gehstock_info;
	description = "I think this walking stick belongs to you.";
};


func int dia_maleth_gehstock_condition()
{
	if(Npc_HasItems(other,itmw_malethsgehstock_mis) && Npc_KnowsInfo(other,dia_maleth_probleme))
	{
		return TRUE;
	};
};

func void dia_maleth_gehstock_info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//I think this walking stick belongs to you.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//That's terrific. I...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Just a moment. First you pay for it.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//But... I don't have much.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//Then think of something else.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//Okay. How about this? Yesterday I saw some bandits run past with a few bags of gold.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//If I tell you where they keep their booty, can I have my walking stick back?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"Sorry, not interested. I want your gold.",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"All right.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//All right.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//Okay. You just go west to that piece of woods over there. You'll find a ravine there.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//You should find something in the cave there.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Maleth told me there's a large camp of bandits in the woodlands west of Lobart's farm.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Sorry, not interested. I want your gold.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//Here's everything I have. That has to be enough.
	CreateInvItems(self,itmi_gold,35);
	b_giveinvitems(self,other,itmi_gold,35);
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	Info_ClearChoices(dia_maleth_gehstock);
};


instance DIA_MALETH_PERM3(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_perm3_condition;
	information = dia_maleth_perm3_info;
	permanent = TRUE;
	description = "Don't get all worked up.";
};


func int dia_maleth_perm3_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_probleme) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_maleth_perm3_info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Don't get all worked up.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(irritated) Beat it.
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP4_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap4_exit_condition;
	information = dia_maleth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_maleth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP5_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap5_exit_condition;
	information = dia_maleth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_maleth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP6_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap6_exit_condition;
	information = dia_maleth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_maleth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PICKPOCKET(C_INFO)
{
	npc = bau_954_maleth;
	nr = 900;
	condition = dia_maleth_pickpocket_condition;
	information = dia_maleth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_maleth_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_maleth_pickpocket_info()
{
	Info_ClearChoices(dia_maleth_pickpocket);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_BACK,dia_maleth_pickpocket_back);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_PICKPOCKET,dia_maleth_pickpocket_doit);
};

func void dia_maleth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maleth_pickpocket);
};

func void dia_maleth_pickpocket_back()
{
	Info_ClearChoices(dia_maleth_pickpocket);
};

