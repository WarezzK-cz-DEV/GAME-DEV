
instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//What are you doing here?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//I'm trying to fulfill the tasks the monastery has set me to your satisfaction.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//I am a novice from the monastery. I run errands for the magicians and also the paladins.
		AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//I have provided the three innkeepers in the city with wine from the monastery.
	};
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "Who are the three innkeepers?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//Who are the three innkeepers?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//One of them is the good man here behind the bar.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//Then there is Caragon, who has his tavern on the temple square, and Kardif, the owner of the pub in the harbor district.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "What can you tell me about the monastery?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//What can you tell me about the monastery?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//We novices seek enlightenment in prayer to Innos and learn the principles of faith from the magicians.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//We serve them as we serve Innos and prepare ourselves for the union with the Fire.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "Take me to the monastery.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//Take me to the monastery.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//Forget it. Do you know how many creatures I had to evade on the way?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//When I think of all those bloodflies, wolves and goblins, I'm glad that I don't have to leave here any more.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//Besides, you can't enter the monastery anyway.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//Why not?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//Entrance is only permitted to magicians, paladins and novices.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "How can I become a novice?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//How can I become a novice?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//If a man feels the deep desire...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//Hey - just tell me what the conditions are.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//You need the offerings. A sheep and...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"To become a novice at the monastery of Innos, I need a sheep and 1000 pieces of gold.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "How am I supposed to get that much gold?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//How am I supposed to get that much gold?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//Since you obviously don't know anyone who would pay that for you, you'll simply have to go to work.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "Where can I find a sheep?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//Where can I find a sheep?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//From the farmers, of course. But you won't get one for nothing.
	b_logentry(TOPIC_KLOSTER,"I can get a sheep from the farmers.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//Hey, do you know what happened?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//You have been chosen.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//Right. Just as I was about to have a cool sip of beer - Daron comes around the corner and tells me that I've been chosen.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//Who would have thought? The will of Innos is unfathomable. And what brings you here?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//I have demanded the Test of Fire.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//It's not possible?! Boy, you are damned brave. Does that mean that you will also seek 'that which the believer finds behind the path'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//Looks like it.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "Have you found out anything yet?";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//Have you found out anything yet?
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//Well, I just followed Agon - but in the meantime I lost him.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//And now... what do they say? Follow the signs of Innos. But I don't understand that bit with the path...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//So what, I'll keep searching.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "Hey, are you following me?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//Hey, are you following me?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//Nonsense. I just happen to be going the same direction as you.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "Stop running after me!";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//Stop running after me!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//I'm not following you. But please, if that's what you think - then I'll take a different path now.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//So we meet again. I've been thinking, you know. I believe that the desire to be a magician is strong in me.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//Oh man - don't do that...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//I have no choice. A novice's life is not for me.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//I just have to be a magician. Then everything will go well with me. And now I shall take what I'm entitled to.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//Do you have any last words?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"Cut it out, I don't want to kill you.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"Let's get straight down to it - I need to get back to the monastery.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"Have you got anything to smoke?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//Cut it out, I don't want to kill you.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//Big talk. But you know you don't have a chance against me! Let's go!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//Let's get straight down to it - I need to go back to the monastery.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//You're not going anywhere ever again!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//Have you got anything to smoke?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//You're lucky. I've actually got something right here.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//Let's get it over with.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//Hey, do you really think we're going the right way? A troll lives back there somewhere.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//I think I'd rather look in a different direction.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};

