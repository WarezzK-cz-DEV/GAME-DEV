
instance DIA_EHNIM_EXIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 999;
	condition = dia_ehnim_exit_condition;
	information = dia_ehnim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ehnim_exit_condition()
{
	return TRUE;
};

func void dia_ehnim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_HALLO(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 3;
	condition = dia_ehnim_hallo_condition;
	information = dia_ehnim_hallo_info;
	description = "Who are you?";
};


func int dia_ehnim_hallo_condition()
{
	return TRUE;
};

func void dia_ehnim_hallo_info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//My name is Ehnim. I'm one of the field hands.
	if(Hlp_IsValidNpc(egill) && !c_npcisdown(egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//And the half-pint over there is my brother Egill.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//We've been working here on the farm for Akil for several years.
};


instance DIA_EHNIM_FELDARBEIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 4;
	condition = dia_ehnim_feldarbeit_condition;
	information = dia_ehnim_feldarbeit_info;
	description = "How's the field work going?";
};


func int dia_ehnim_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_hallo))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//How's the field work going?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//Do you want to help? There's another hoe back there. Grab it and then head for the field.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//You just have to make sure the field raiders don't surprise you. They'll tear your arm right off with one bite.
};


instance DIA_EHNIM_FELDRAEUBER(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 5;
	condition = dia_ehnim_feldraeuber_condition;
	information = dia_ehnim_feldraeuber_info;
	description = "Why don't you do anything about the field raiders?";
};


func int dia_ehnim_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//Why don't you do anything about the field raiders?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//I've killed more of them than I can count. The only problem is, they keep coming back.
};


instance DIA_EHNIM_STREIT1(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 6;
	condition = dia_ehnim_streit1_condition;
	information = dia_ehnim_streit1_info;
	description = "Your brother told me the same.";
};


func int dia_ehnim_streit1_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Npc_KnowsInfo(other,dia_egill_streit2) == FALSE) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit1_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//Your brother told me the same.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//What? That goldbricker? He always disappears just as soon as the beasts come onto our land.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//He shouldn't be talking such nonsense.
};


instance DIA_EHNIM_STREIT3(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 7;
	condition = dia_ehnim_streit3_condition;
	information = dia_ehnim_streit3_info;
	description = "Your brother thinks you're a braggart.";
};


func int dia_ehnim_streit3_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit2) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit3_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//Your brother thinks you're a braggart.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//What? He's actually got the nerve to say that?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//He'd better watch out or I'll teach him a lesson.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//Go and tell him that.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_STREIT5(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 8;
	condition = dia_ehnim_streit5_condition;
	information = dia_ehnim_streit5_info;
	permanent = TRUE;
	description = "I think the two of you should just relax.";
};


var int dia_ehnim_streit5_noperm;

func int dia_ehnim_streit5_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit4) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)) && (DIA_EHNIM_STREIT5_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit5_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//I think the two of you should just relax.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//The bastard didn't give in, am I right?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//I'll tear out his guts. Tell him that.
	Info_ClearChoices(dia_ehnim_streit5);
	Info_AddChoice(dia_ehnim_streit5,"Do whatever you want. I'm leaving.",dia_ehnim_streit5_gehen);
	Info_AddChoice(dia_ehnim_streit5,"Why don't you tell him yourself?",dia_ehnim_streit5_attack);
};

func void dia_ehnim_streit5_attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//Why don't you tell him yourself?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//I'll do that.
	AI_StopProcessInfos(self);
	DIA_EHNIM_STREIT5_NOPERM = TRUE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,egill,AR_NONE,0);
	b_giveplayerxp(XP_EGILLEHNIMSTREIT);
};

func void dia_ehnim_streit5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//Do whatever you want. I'm leaving.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//Yeah, just slink off quietly.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP1(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap1_condition;
	information = dia_ehnim_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk) && ((KAPITEL < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap1_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//Do you want to cause even more trouble? I think it would be better if you left now.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_MOLERATFETT(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_moleratfett_condition;
	information = dia_ehnim_moleratfett_info;
	important = TRUE;
};


func int dia_ehnim_moleratfett_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && (KAPITEL >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_ehnim_moleratfett_info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//You're STILL here.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//Obviously. Still miffed?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//Never mind, forget about it. Say, have you been to Lobart's farm lately?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//Maybe. Why?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//Oh, nothing important. I just wanted to talk to Vino again about his still.
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"I've got no time right now.",dia_ehnim_moleratfett_nein);
	Info_AddChoice(dia_ehnim_moleratfett,"Still? What still?",dia_ehnim_moleratfett_was);
	if(Npc_IsDead(vino))
	{
		Info_AddChoice(dia_ehnim_moleratfett,"Vino is dead.",dia_ehnim_moleratfett_tot);
	};
};

func void dia_ehnim_moleratfett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//Vino is dead.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//Oh dear. Well. That's that, then.
};

func void dia_ehnim_moleratfett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//Still? What still?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//Oh. I probably shouldn't have said that. Vino's always been very particular about his little secret.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//Whatever, now I've let it slip out anyway. Back in the woods, Vino set up a secret still.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//A while ago, he asked me to get him something to grease his portcullis with.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//It's rained a lot recently and the thing rusted shut on him. Now the winch is stuck and no one can get in any more. What a mess.
	Log_CreateTopic(TOPIC_FOUNDVINOSKELLEREI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FOUNDVINOSKELLEREI,LOG_RUNNING);
	b_logentry(TOPIC_FOUNDVINOSKELLEREI,"Ehnim told me Vino's got a secret still in the wood near Akil's farm. But the mechanism that opens the door is stuck and can only be operated using molerat fat.");
	Info_AddChoice(dia_ehnim_moleratfett,"And? Have you got the grease?",dia_ehnim_moleratfett_was_fett);
};

func void dia_ehnim_moleratfett_was_fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//And? Have you got the grease?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//Yeah, sure. The best there is. Molerat fat. Terrible stuff, let me tell you. It's even used to grease ship's cannons.
	Info_AddChoice(dia_ehnim_moleratfett,"Sell me the grease.",dia_ehnim_moleratfett_was_fett_habenwill);
};


var int ehnim_moleratfettoffer;

func void dia_ehnim_moleratfett_was_fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//Sell me the grease.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//That won't be cheap, mate. It's damn rare in this part of the country.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//How much?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Mmh. 100 gold coins?
	EHNIM_MOLERATFETTOFFER = 100;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"That's too much.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel);
	Info_AddChoice(dia_ehnim_moleratfett,"It's a deal.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//It's a deal.
	if(b_giveinvitems(other,self,itmi_gold,EHNIM_MOLERATFETTOFFER))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//All right. Here you go.
		if(Npc_HasItems(self,itmi_moleratlubric_mis))
		{
			b_giveinvitems(self,other,itmi_moleratlubric_mis,1);
			if(Npc_IsDead(vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(to himself) Oh dear. Vino's going to kill me.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//Damnit, where did it go? What a bloody nuisance. Well, sorry. Obviously, I don't have it any more. Here's your dough back.
			b_giveinvitems(self,other,itmi_gold,EHNIM_MOLERATFETTOFFER);
			if(Npc_IsDead(egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//I bet this is my brother's doing again. That bastard.
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				b_attack(self,egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//Now isn't that swell. First you make a big deal of it and then you don't even have the money. Just beat it.
	};
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//That's too much.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//Okay, okay. 70 gold coins, then. But that's my final offer.
	EHNIM_MOLERATFETTOFFER = 70;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"That's still too much.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch);
	Info_AddChoice(dia_ehnim_moleratfett,"It's a deal.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//That's still too much.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(angry) Then forget about it. Have a nice day.
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//I've got no time right now.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//Don't let me keep you, man.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP3(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap3_condition;
	information = dia_ehnim_permkap3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap3_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_moleratfett) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap3_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//I don't have any time now.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PICKPOCKET(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 900;
	condition = dia_ehnim_pickpocket_condition;
	information = dia_ehnim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ehnim_pickpocket_condition()
{
	return c_beklauen(76,35);
};

func void dia_ehnim_pickpocket_info()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_BACK,dia_ehnim_pickpocket_back);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_PICKPOCKET,dia_ehnim_pickpocket_doit);
};

func void dia_ehnim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ehnim_pickpocket);
};

func void dia_ehnim_pickpocket_back()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
};

