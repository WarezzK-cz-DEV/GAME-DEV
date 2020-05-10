
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return TRUE;
};

func void dia_jarvis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_HELLO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 1;
	condition = dia_jarvis_hello_condition;
	information = dia_jarvis_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jarvis_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jarvis_hello_info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//Hey! Don't I know you from somewhere?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//It's possible. I was in the colony, too.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//Right... what do you want?
};


instance DIA_JARVIS_DIELAGE(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 2;
	condition = dia_jarvis_dielage_condition;
	information = dia_jarvis_dielage_info;
	permanent = FALSE;
	description = "How are things?";
};


func int dia_jarvis_dielage_condition()
{
	return TRUE;
};

func void dia_jarvis_dielage_info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//How's the situation?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//Right now we've got real trouble. Two factions are building up among us mercenaries.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//Sylvio and his people doubt that Lee is following the right plan.
};


instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 3;
	condition = dia_jarvis_twofronts_condition;
	information = dia_jarvis_twofronts_info;
	permanent = FALSE;
	description = "How come there are two factions?";
};


func int dia_jarvis_twofronts_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_twofronts_info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//How come there are two factions?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//Most of us came out of the colony with Lee back then.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//But some of the mercenaries hooked up with us later.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//They didn't come from the colony, but were farther south fighting the orcs.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//Somehow they got wind that Lee needed people. Their leader was Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//He agreed that Lee was in charge, but now he's trying to stir up the mercenaries against him and his plan.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//A lot of Lee's people don't think that it's a big problem. But I know guys like Sylvio.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//He'll go to extremes to realize his ideas.
};


instance DIA_JARVIS_LEESPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 4;
	condition = dia_jarvis_leesplan_condition;
	information = dia_jarvis_leesplan_info;
	permanent = FALSE;
	description = "Do you know what Lee's intentions are?";
};


func int dia_jarvis_leesplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_leesplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//Do you know what Lee's intentions are?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//Lee wants us to wait and starve the paladins in the city.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//He is planning to get us all away from the island. And Innos knows, I've got nothing against getting away from here.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//I don't really know how he's planning to go about it, but I trust him. He's led us well so far.
};


instance DIA_JARVIS_SYLVIOSPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 5;
	condition = dia_jarvis_sylviosplan_condition;
	information = dia_jarvis_sylviosplan_info;
	permanent = FALSE;
	description = "Do you know what Sylvio is planning?";
};


func int dia_jarvis_sylviosplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//Do you know what Sylvio is planning?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//Sylvio found out that some of the paladins have moved out to the old colony.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//He says the rest of the paladins wouldn't dare to attack us here and wants to take advantage of the situation.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//Plunder the small farms, waylay the militia patrols outside the city, hold up travelers, things like that.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//But Lee thinks that would be the worst thing we could do in our situation.
};


instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 6;
	condition = dia_jarvis_wannajoin_condition;
	information = dia_jarvis_wannajoin_info;
	permanent = FALSE;
	description = "I want to become a mercenary!";
};


func int dia_jarvis_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_wannajoin_info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//I want to become a mercenary!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//I'm not sure that's a good idea...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//Where's the problem?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//Well, I either have to vote for you or against you.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//And in the situation we're in, I'll only vote for you if I can be sure that you're on Lee's side!
};


instance DIA_JARVIS_MISSIONKO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 7;
	condition = dia_jarvis_missionko_condition;
	information = dia_jarvis_missionko_info;
	permanent = FALSE;
	description = "So what should I do?";
};


func int dia_jarvis_missionko_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_wannajoin) && Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_missionko_info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//So what should I do?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//Simple. Beat up a few of Sylvio's boys! That way both sides will know exactly where you stand.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//And if you stick to the rules for a duel, you'll even win the respect of the others.
	MIS_JARVIS_SLDKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_MURDER] = TRUE;
	Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
	b_logentry(TOPIC_JARVISSLDKO,"Jarvis wants me to knock a couple of Sylvio's guys down, then he'll give me his vote.");
};


instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_duellregeln_condition;
	information = dia_jarvis_duellregeln_info;
	permanent = FALSE;
	description = "What are the rules for a duel?";
};


func int dia_jarvis_duellregeln_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_duellregeln_info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//What are the rules for a duel?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//Go to Torlof and let him explain it, if you're interested.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//Just so we understand each other: I don't care if you stick to the rules or not. Just as long as the boys wind up out cold in the mud!
	b_logentry(TOPIC_JARVISSLDKO,"And I don't even need to stick to the duelling rules...");
};


instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_sylviosmen_condition;
	information = dia_jarvis_sylviosmen_info;
	permanent = FALSE;
	description = "Which of the mercenaries are Sylvio's men?";
};


func int dia_jarvis_sylviosmen_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosmen_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//Which of the mercenaries are Sylvio's men?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//There are six men. First of all, Sylvio himself and his right hand man, Bullco.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//Then there's Rod, Sentenza, Fester and Raoul.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//The rest of the people are either neutral or on Lee's side.
	b_logentry(TOPIC_JARVISSLDKO,"Sylvio's men are Sylvio himself, his lieutenant Bullco, Rod, Sentenza, Fester and Raoul.");
};


instance DIA_JARVIS_HOWMANY(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmany_condition;
	information = dia_jarvis_howmany_info;
	permanent = FALSE;
	description = "How many of Sylvio's people should I defeat?";
};


func int dia_jarvis_howmany_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_howmany_info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//How may of Sylvio's people should I defeat?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//If you knock three of them to the ground, then you've proven which side you're on.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//Whom you choose is your business.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//Just one little hint: This isn't about proving your courage. Don't go up against Sylvio himself - he'll make mincemeat out of you.
	b_logentry(TOPIC_JARVISSLDKO,"It's quite enough if I just knock down three of Sylvio's men. I'd better not tackle Sylvio himself though.");
};


instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmanyleft_condition;
	information = dia_jarvis_howmanyleft_info;
	permanent = TRUE;
	description = "How many of Sylvio's men are still on my list?";
};


func int dia_jarvis_howmanyleft_condition()
{
	if((MIS_JARVIS_SLDKO == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jarvis_howmany))
	{
		return TRUE;
	};
};

func void dia_jarvis_howmanyleft_info()
{
	var int victories;
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//How many of Sylvio's men are still on my list?
	victories = 0;
	if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//I have bested Bullco.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//I heard. Not bad.
		victories = victories + 1;
	};
	if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//Rod looks a little worse for the wear.
		victories = victories + 1;
	};
	if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(Npc_KnowsInfo(other,dia_sentenza_hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//Sentenza was trying to squeeze some gold out of me - not a smart idea.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//I knocked out Sentenza.
		};
		victories = victories + 1;
	};
	if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(MIS_FESTER_KILLBUGS == LOG_OBSOLETE)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//Fester tried to take me for a ride - that was his mistake.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//Fester got what was coming to him.
		};
		victories = victories + 1;
	};
	if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//And as to Raoul...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//I went to see Raoul...
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//And?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//He was badly in need of a proper licking.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//You haven't knocked down any of Sylvio's men so far.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//Good - keep it up.
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//I expect you to rough up at least three of them.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//That's enough, that's enough.
		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//You really whupped every single one of them, eh?
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//I'm impressed - if Lee asks me, I can vote for you without hesitation.
		MIS_JARVIS_SLDKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_MURDER] = FALSE;
		b_giveplayerxp(XP_AMBIENT * victories);
		b_logentry(TOPIC_SLDRESPEKT,"Jarvis will vote for me if I want to join the mercenaries.");
	};
};


var int jarvis_guildcomment;
var int jarvis_sylviocomment;

instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = FALSE;
	description = "Any news?";
};


func int dia_jarvis_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//Any news?
	if(KAPITEL <= 3)
	{
		if(JARVIS_GUILDCOMMENT == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//Now you are one of us. That's good.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//You made the wrong choice, you could have been one of us.
			};
			JARVIS_GUILDCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//Lately, Sylvio's people have been really subdued. (dirty laugh)
		};
	};
	if(KAPITEL >= 4)
	{
		if(JARVIS_SYLVIOCOMMENT == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//Sylvio is finally gone. After he heard about the dragons, he and some of his boys headed for the mining colony.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//He probably thought there is more to be had there.
			JARVIS_SYLVIOCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//Nothing, all's quiet so far. I can't wait to see how this all turns out.
		};
	};
};


instance DIA_JARVIS_PICKPOCKET(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 900;
	condition = dia_jarvis_pickpocket_condition;
	information = dia_jarvis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jarvis_pickpocket_condition()
{
	return c_beklauen(41,55);
};

func void dia_jarvis_pickpocket_info()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_BACK,dia_jarvis_pickpocket_back);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_PICKPOCKET,dia_jarvis_pickpocket_doit);
};

func void dia_jarvis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jarvis_pickpocket);
};

func void dia_jarvis_pickpocket_back()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
};

