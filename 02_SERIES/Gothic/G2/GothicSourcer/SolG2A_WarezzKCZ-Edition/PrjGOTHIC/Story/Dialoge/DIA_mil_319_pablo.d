
instance DIA_PABLO_EXIT(C_INFO)
{
	npc = mil_319_pablo;
	nr = 999;
	condition = dia_pablo_exit_condition;
	information = dia_pablo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pablo_exit_condition()
{
	return TRUE;
};

func void dia_pablo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_PICKPOCKET(C_INFO)
{
	npc = mil_319_pablo;
	nr = 900;
	condition = dia_pablo_pickpocket_condition;
	information = dia_pablo_pickpocket_info;
	permanent = TRUE;
	description = "(It would be child's play to steal his key)";
};


func int dia_pablo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_pablo_pickpocket_info()
{
	Info_ClearChoices(dia_pablo_pickpocket);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};

func void dia_pablo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_city_tower_01,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_pablo_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_pablo_pickpocket_back()
{
	Info_ClearChoices(dia_pablo_pickpocket);
};


var int pablo_belogen;

instance DIA_PABLO_WANTED(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_wanted_condition;
	information = dia_pablo_wanted_info;
	important = TRUE;
};


func int dia_pablo_wanted_condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pablo_wanted_info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Hey you, wait - you look familiar to me.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//What do you want?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//I've seen your face before somewhere... ah - right!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Here - we found this picture on some bandits we picked up a few days ago - it looks a lot like you.
	b_giveinvitems(self,other,itwr_poster_mis,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//Apparently, those guys were looking for you.
	Info_ClearChoices(dia_pablo_wanted);
	Info_AddChoice(dia_pablo_wanted,"No, you've got to be mistaken.",dia_pablo_wanted_nothing);
	Info_AddChoice(dia_pablo_wanted,"Gee, I'd never have thought of that myself.",dia_pablo_wanted_irony);
};

func void dia_pablo_wanted_nothing()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//No, you've got to be mistaken. Everything's fine with me...
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Whatever you say, stranger.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//But if that happens to be YOUR mug after all - and if you have some problems - keep them outside of this town. Things are difficult enough here as it is.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//And strangers who bring trouble into the city don't stay here long - I hope I make myself clear.
	PABLO_BELOGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pablo_wanted_irony()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Gee, I'd never have thought of that myself.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Very funny... what did those fellows want from you?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Ask them yourself. You've got them safely locked up, haven't you?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//No - they're dead.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//I guess we'll never know, then.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//If you're in some kind of trouble - go talk to Lord Andre. Maybe he can help you. You'll find him in the barracks.
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_BANDITEN(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_banditen_condition;
	information = dia_pablo_banditen_info;
	permanent = FALSE;
	description = "What do you know about the bandits?";
};


func int dia_pablo_banditen_condition()
{
	return TRUE;
};

func void dia_pablo_banditen_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//What do you know about the bandits?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//They've all come from that blasted mining colony. But there are several splinter groups.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Some have holed up in the mountains, and others have joined up with Onar, the landowner.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//But it's the bandits outside of town who cause the most problems.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//They're the reason that none of the merchants venture beyond the city gates now.
};


instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_hakonbandits_condition;
	information = dia_pablo_hakonbandits_info;
	permanent = FALSE;
	description = "What do you know about the bandits who robbed Hakon the merchant?";
};


func int dia_pablo_hakonbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
	{
		return TRUE;
	};
};

func void dia_pablo_hakonbandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//What do you know about the bandits who robbed Hakon the merchant?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Oh, THAT matter. Don't remind me...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//As far as we know, they're responsible for a lot of the attacks on merchants.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Those rats have crawled into their holes and don't dare come out again.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Once, we were able to track them down and follow them. But we broke off pursuit in the woods outside the city.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//There's too many beasts roaming around there, it's much too dangerous.
	b_logentry(TOPIC_HAKONBANDITEN,"The bandits who robbed Hakon are hiding in some woodlands near the town.");
	if(PABLO_ANDREMELDEN == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//But there's one more thing...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//A few of the stolen goods have shown up in Khorinis.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//This means that they know how they can smuggle the wares into town and sell them...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Yeah, we suspect they have a fence in the city. But we haven't been able to catch the guy yet.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//If you find out anything about the business, remember Lord Andre has posted a bounty for the fence.
		b_logentry(TOPIC_HAKONBANDITEN,"The bandits are probably in cahoots with some dealer in the city. Lord Andre's got a reward out for the dealer.");
	};
};


instance DIA_PABLO_MYBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 4;
	condition = dia_pablo_mybandits_condition;
	information = dia_pablo_mybandits_info;
	permanent = FALSE;
	description = "Where did the bandits who had my wanted poster come from?";
};


func int dia_pablo_mybandits_condition()
{
	if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
	{
		return TRUE;
	};
};

func void dia_pablo_mybandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//Where did the bandits who had my wanted poster come from?
	if(PABLO_BELOGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//A-HA! So it IS your mug after all. Why didn't you admit that right away, huh?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(demanding) What are you wanted for?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//I don't know - honest!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Yeah, yeah. I know. Let me tell you something. If I thought you were in cahoots with these bandits, you'd already be cooling your heels in the slammer, understood?
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//Still, I had better report this incident to Lord Andre...
		PABLO_ANDREMELDEN = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//But - to answer your question...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//We picked them up near the landowner's place.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//But they don't look like Onar's people.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//I think they're part of a smaller group which has holed up in the mountains near Onar's farm.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//But if you intend to go there, let me warn you. Those cutthroats make short work of everyone!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//I'll remember that.
};


instance DIA_PABLO_PERM(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_perm_condition;
	information = dia_pablo_perm_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_pablo_perm_condition()
{
	return TRUE;
};

func void dia_pablo_perm_info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//How's the situation?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//I've always said that these mercenaries can't be trusted.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//It's high time we taught that scum a lesson. Bennet didn't think this up all by himself.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//I am deeply shaken by the murder of the honorable paladin Lothar.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//But I know that the church will find a just punishment for the villain.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//What are you doing roaming around here? If you're trying to free your mercenary friend, you can just forget it.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//It's pathetic. Now they're stirring us up against each other.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//If you hadn't managed to find the real culprit for the murder, the orcs wouldn't have had to lift a finger.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//I'm worried about what will happen if the paladins leave now.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//You can count on us, we will use every available means to make sure that this city doesn't degenerate into a sink of iniquity.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Just mind your step here. We watch rogues like you very closely around here.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//At the moment it's quiet. Only the bandits outside the city are causing us problems.
	};
};

