
instance DIA_ADDON_BILL_EXIT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 999;
	condition = dia_addon_bill_exit_condition;
	information = dia_addon_bill_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_bill_exit_condition()
{
	return TRUE;
};

func void dia_addon_bill_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BILL_PICKPOCKET(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 900;
	condition = dia_addon_bill_pickpocket_condition;
	information = dia_addon_bill_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_addon_bill_pickpocket_condition()
{
	return c_beklauen(80,205);
};

func void dia_addon_bill_pickpocket_info()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_BACK,dia_addon_bill_pickpocket_back);
	Info_AddChoice(dia_addon_bill_pickpocket,DIALOG_PICKPOCKET,dia_addon_bill_pickpocket_doit);
};

func void dia_addon_bill_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_bill_pickpocket);
};

func void dia_addon_bill_pickpocket_back()
{
	Info_ClearChoices(dia_addon_bill_pickpocket);
};


instance DIA_ADDON_BILL_HELLO(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 1;
	condition = dia_addon_bill_hello_condition;
	information = dia_addon_bill_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_bill_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_hello_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Hello_15_00");	//How are things going with you?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_01");	//What's up? Did Henry send you here?
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_02");	//Tell him he'll get his planks as soon as I'm done.
	AI_Output(self,other,"DIA_Addon_Bill_Hello_03_03");	//If he can't wait that long, he's welcome to saw them himself.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BILL_PLANKS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 2;
	condition = dia_addon_bill_planks_condition;
	information = dia_addon_bill_planks_info;
	description = "What are all these planks for?";
};


func int dia_addon_bill_planks_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_planks_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Planks_15_00");	//What are all these planks for?
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_01");	//We use them for the palisade, you dimwit.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_02");	//Greg thought it would be a good idea to secure our camp this way.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_03");	//We can save ourselves the work, if you ask me.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_04");	//If the bandits are really planning to attack us, this ridiculous palisade isn't going to stop them.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_05");	//We should never have tolerated them in our valley in the first place.
	AI_Output(self,other,"DIA_Addon_Bill_Planks_03_06");	//If I had known all this in advance, I'd have stayed in Khorinis.
};


var int bill_perm_once;

instance DIA_ADDON_BILL_PERM(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 4;
	condition = dia_addon_bill_perm_condition;
	information = dia_addon_bill_perm_info;
	permanent = TRUE;
	description = "Can I help you saw?";
};


func int dia_addon_bill_perm_condition()
{
	if((GREGISBACK == FALSE) && Npc_WasInState(self,zs_saw))
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm_15_00");	//Can I help you saw?
	AI_Output(self,other,"DIA_Addon_Bill_Perm_03_01");	//Nah, I can handle this by myself.
	if(BILL_PERM_ONCE == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm_03_02");	//I joined up here not long ago, and letting others do my work won't get me anywhere, if you get my drift.
		BILL_PERM_ONCE = TRUE;
	};
};


instance DIA_ADDON_BILL_PERM2(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 5;
	condition = dia_addon_bill_perm2_condition;
	information = dia_addon_bill_perm2_info;
	permanent = TRUE;
	description = "What are you doing now?";
};


func int dia_addon_bill_perm2_condition()
{
	if(GREGISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_bill_perm2_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Perm2_15_00");	//What are you doing now?
	AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_01");	//I'm taking a break.
	if(!Npc_IsDead(francis))
	{
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_02");	//(gloating) Francis got my old job.
		AI_Output(self,other,"DIA_Addon_Bill_Perm2_03_03");	//Let him saw planks until his arms fall off.
	};
};


instance DIA_ADDON_BILL_ANGUSNHANK(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 11;
	condition = dia_addon_bill_angusnhank_condition;
	information = dia_addon_bill_angusnhank_info;
	permanent = FALSE;
	description = "I'm looking for Angus and Hank.";
};


func int dia_addon_bill_angusnhank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushank) && Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_angusnhank_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_00");	//I'm looking for Angus and Hank.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_01");	//(sighs) I've no idea where they are - the bandits must have got them.
	AI_Output(other,self,"DIA_Addon_Bill_AngusnHank_15_02");	//You were friends with them, weren't you?
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_03");	//All I know is that they were going to meet up with the bandits in a cave not far from here.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_04");	//It must be somewhere outside of our camp, to the east.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_05");	//I don't know where exactly. I've never been there myself.
	AI_Output(self,other,"DIA_Addon_Bill_AngusnHank_03_06");	//Maybe you should ask Alligator Jack about this. He's always roaming around outside the camp.
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Angus and Hank had a cave east of the camp. Alligator Jack may know more about it.");
};


instance DIA_ADDON_BILL_FOUNDFRIENDS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 12;
	condition = dia_addon_bill_foundfriends_condition;
	information = dia_addon_bill_foundfriends_info;
	permanent = FALSE;
	description = "I found your friends.";
};


func int dia_addon_bill_foundfriends_condition()
{
	if(!Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_bill_foundfriends_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_00");	//I found your friends.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_01");	//And? Where are they?
	AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_02");	//They're dead.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_03");	//(hatefully) Those damned bandits did this!
	if(SC_KNOWS_JUANMURDEREDANGUS == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Bill_FoundFriends_15_06");	//It's possible.
	};
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_04");	//Those cursed swine. May they roast in hell.
	AI_Output(self,other,"DIA_Addon_Bill_FoundFriends_03_05");	//(to himself, hatefully) If only I knew the name of the lowlife who did this...
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_KILLJUAN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KILLJUAN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KILLJUAN,"Bill was completely done in when I told him about the death of Angus and Hank. He wants the names of the murderers.");
};


instance DIA_ADDON_BILL_JUANMURDER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 13;
	condition = dia_addon_bill_juanmurder_condition;
	information = dia_addon_bill_juanmurder_info;
	description = "I know who murdered Angus and Hank.";
};


func int dia_addon_bill_juanmurder_condition()
{
	if((MIS_ADDON_BILL_SEARCHANGUSMURDER == LOG_RUNNING) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_juanmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_00");	//I know who murdered Angus and Hank.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_01");	//(excitedly) Who? Who did it?
	AI_Output(other,self,"DIA_Addon_Bill_JuanMurder_15_02");	//His name is Juan, he's one of the bandits.
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_03");	//You've got to do that bastard in, do you hear me?
	AI_Output(self,other,"DIA_Addon_Bill_JuanMurder_03_04");	//He must not get away with this.
	b_logentry(TOPIC_ADDON_KILLJUAN,"I am supposed to kill Juan, as a revenge for Angus and Hank.");
};


instance DIA_ADDON_BILL_KILLEDESTEBAN(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 14;
	condition = dia_addon_bill_killedesteban_condition;
	information = dia_addon_bill_killedesteban_info;
	description = "Juan is history.";
};


func int dia_addon_bill_killedesteban_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_juanmurder) && Npc_IsDead(juan))
	{
		return TRUE;
	};
};

func void dia_addon_bill_killedesteban_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_00");	//Juan is history.
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_01");	//(eagerly) And? Did he suffer?
	AI_Output(other,self,"DIA_Addon_Bill_KilledEsteban_15_02");	//Come off it, kid!
	AI_Output(self,other,"DIA_Addon_Bill_KilledEsteban_03_03");	//(sighs) Oh well. Just as long as you killed the swine.
	b_logentry(TOPIC_ADDON_KILLJUAN,"Juan is finished. Bill was very pleased.");
	MIS_ADDON_BILL_SEARCHANGUSMURDER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_BILL_KILLANGUSMURDER);
};


instance DIA_ADDON_BILL_KHORINIS(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 21;
	condition = dia_addon_bill_khorinis_condition;
	information = dia_addon_bill_khorinis_info;
	description = "You've been to Khorinis?";
};


func int dia_addon_bill_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_planks))
	{
		return TRUE;
	};
};

func void dia_addon_bill_khorinis_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_Khorinis_15_00");	//You've been to Khorinis?
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_01");	//Yes, I kept myself afloat there picking pockets and doing a little swindle or two.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_02");	//But when ever fewer ships came in, business got worse and worse.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_03");	//At some point, I got tired of being on the run from the militia for a few crusts of bread.
	AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_04");	//That's when I joined Greg. Now I'm stuck here.
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Bill_Khorinis_03_05");	//(sighs) Sawing all day to build a palisade that's of no use to anyone.
	};
};


instance DIA_ADDON_BILL_TEACHPLAYER(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 22;
	condition = dia_addon_bill_teachplayer_condition;
	information = dia_addon_bill_teachplayer_info;
	description = "Can you teach me something?";
};


func int dia_addon_bill_teachplayer_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_khorinis))
	{
		return TRUE;
	};
};

func void dia_addon_bill_teachplayer_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_TeachPlayer_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_01");	//Well, I could show you how to pick other people's pockets unnoticed.
	AI_Output(self,other,"DIA_Addon_Bill_TeachPlayer_03_02");	//But you should be fairly dexterous, or you can just forget it.
	BILL_ADDON_TEACHPICKPOCKET = TRUE;
};


instance DIA_ADDON_BILL_LEARNTALENT(C_INFO)
{
	npc = pir_1356_addon_bill;
	nr = 23;
	condition = dia_addon_bill_learntalent_condition;
	information = dia_addon_bill_learntalent_info;
	permanent = TRUE;
	description = "Show me how to pick pockets. (5 LP)";
};


func int dia_addon_bill_learntalent_condition()
{
	if((BILL_ADDON_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_bill_learntalent_info()
{
	AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_00");	//Show me how to pick pockets.
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_01");	//First, you need to make your intended victim feel completely safe.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_02");	//I used to walk up to people and chat to them. That worked like a charm.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_03");	//Then you can take a snatch, but make sure they don't notice a thing.
			AI_Output(other,self,"DIA_Addon_Bill_LearnTalent_15_05");	//Anything else?
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_06");	//Yes, keep training your dexterity. The more dexterous you are, the more chances you'll recognize.
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_07");	//And the sooner you can relieve your victim of his stuff without getting CAUGHT!
			AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_08");	//That's all - in theory, at least.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_09");	//Forget it! You're not nimble enough!
		AI_Output(self,other,"DIA_Addon_Bill_LearnTalent_03_10");	//You'll have to become more dexterous first, or find a better teacher.
	};
};

