
instance DIA_MOE_EXIT(C_INFO)
{
	npc = vlk_432_moe;
	nr = 999;
	condition = dia_moe_exit_condition;
	information = dia_moe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_moe_exit_condition()
{
	return TRUE;
};

func void dia_moe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MOE_PICKPOCKET(C_INFO)
{
	npc = vlk_432_moe;
	nr = 900;
	condition = dia_moe_pickpocket_condition;
	information = dia_moe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_moe_pickpocket_condition()
{
	return c_beklauen(25,30);
};

func void dia_moe_pickpocket_info()
{
	Info_ClearChoices(dia_moe_pickpocket);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};

func void dia_moe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_moe_pickpocket);
};

func void dia_moe_pickpocket_back()
{
	Info_ClearChoices(dia_moe_pickpocket);
};


instance DIA_MOE_HALLO(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_hallo_condition;
	information = dia_moe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_hallo_info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Hey, I don't know you. What do you want here? Are you headed for the pub?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"No, I'm not headed for the tavern...(END)",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"Oh, so this is the watering hole...",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"Yes, do you mind?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//No, I'm not headed for the pub...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Yeah, that's what I would have said. But that isn't important - and that's why we can get straight down to business.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Since you're new here, I'll make you an offer. You give me 50 gold pieces, and you can go.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//That's your entrance fee for the pub.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Let's find out what the militia thinks of that...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"Forget it, you won't get a single coin!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"All right. I'll pay.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"But I don't want to go to the tavern!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//But I don't want to go to the pub!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//You know, sooner or later, everyone wants to go into the pub. So you can pay right now - then you'll have it over with.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Oh, so this is the harbor watering hole. And there I was, taking it for the governor's palace.
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Hey - cut out the bad jokes, runt, otherwise you'll be chewing the cobblestones.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"I see, I'll be forced to tan your hide...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Are you trying to make trouble for me?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Calm down, all I want to do is drink a beer.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"But I don't want to go to the tavern!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Yes, do you mind?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//You've got no business here, runt.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"I see, I'll be forced to tan your hide...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Are you trying to make trouble for me?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Calm down, all I want to do is drink a beer.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Let's find out what the militia thinks of that...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(laughs) The militia isn't here. And do you know why they aren't here?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//This here is the harbor district, runt. None of the militia will pick a fight with me down here.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//At the most, they go to the 'Red Lantern'. You see, it's just you and me. (filthy grin)
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//I see, I'll be forced to tan your hide in order to make any progress.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//You're welcome to try, runt. Show me what you got!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Are you trying to make trouble for me?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Sure, I'm a master at making trouble. So defend yourself, runt.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Calm down, all I want to do is drink a beer.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Okay, but it'll cost you 50 gold pieces to get in. (grins)
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Forget it, you won't get a single coin!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"All right. I'll pay.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//All right, I'll pay.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Great. And since this went so well, now you can give me the rest of what you've got on you.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Forget it, you won't get a single coin!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"OK, this is all I have.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//... but I don't have that much gold with me.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//That doesn't matter. Just give me everything you've got on you.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Forget it, you won't get a single coin!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"OK, this is all I have.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//... but I don't even have 10 gold pieces.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Man, did I pick a live one.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//All right - sigh - you can go.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Forget it, you won't get a single coin!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Then I'll take everything you have - as soon as you're lying on the ground in front of me.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//OK, this is all I have.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//All right, that's enough, then. Ever generous - that's me. (grins)
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "You know your way about the harbor, don't you?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//You know your way about the harbor, don't you?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Sure thing. Why?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"How's the shipping traffic?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"Why don't I see any militia?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"What kind of rumors are floating about?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//How's the shipping traffic?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//The only ship that's come here recently is the paladins' ship.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//It's over there behind the rocky ridge to the southwest.
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Why don't I see any militia?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//They don't dare come in here. We take care of things ourselves.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//What kind of rumors are floating about?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//Around here, we don't like people who ask too many questions. Especially not if they're strangers.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//Nothing - what could there be? Everything's quiet here.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(contrived) It's bad. Times are hard and we're all trying to stay on the straight and narrow.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Stop mocking me.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//How could you think something like that of me? I am deeply wounded.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Things are really hot. Lord Andre has been trying for a while to stick his nose into things that don't concern him.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//The swells will never understand the way things work down here.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//We don't have anything to do with that business.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//What business?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//With that paladin they murdered up there. You really ought to worry about the mercenaries, instead of wasting your time down here.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//I know you didn't have anything to do with it, but the murder of the paladin has really frightened the fine gentlemen.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//If you want some advice among friends, get out of town. At least for a while.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//Since it got out that the mercenaries didn't do in the paladin, the militia doesn't dare come in here at all.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//I think they're afraid of a few bloody noses. It's okay with me.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//There's absolutely nothing going on here.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Finally those puffed-up paladins are leaving the harbor. It's about time.
	};
};


instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_lehmargeldeintreiben_condition;
	information = dia_moe_lehmargeldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_lehmargeldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0) && (RANGERHELP_LEHMARKOHLE == FALSE) && (lehmar.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_lehmargeldeintreiben_info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Hey, you! Lehmar says hello.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

