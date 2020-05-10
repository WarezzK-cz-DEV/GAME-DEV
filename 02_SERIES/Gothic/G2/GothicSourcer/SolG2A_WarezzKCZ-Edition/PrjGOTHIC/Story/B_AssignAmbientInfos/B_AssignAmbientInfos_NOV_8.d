
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_8_exit_condition;
	information = dia_nov_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_8_exit_condition()
{
	return TRUE;
};

func void dia_nov_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_8_fegen_condition;
	information = dia_nov_8_fegen_info;
	permanent = TRUE;
	description = "I need help sweeping the novices' chambers.";
};


func int dia_nov_8_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};


var int feger3_permanent;

func void dia_nov_8_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//I need help sweeping the novices' chambers.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//Oh, man. You just got here and you let them make you do the sweeping already?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Console yourself, it was exactly the same with me when I first got here. And that's why I'm going to help you. It would be ridiculous if we couldn't handle it.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"I've found a novice willing to help me sweep the chambers.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Brother, I know the situation you're in. And I already told you that I will help you. And that's what I'm doing.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Hey, I'd do it, but I'm really busy.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "How about a delicious mutton sausage?";
};


func int dia_nov_8_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_8_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//How about a delicious mutton sausage?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//I wouldn't say no to that. Thanks, man - that's just what I needed.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_NOV_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_8_join_condition;
	information = dia_nov_8_join_info;
	permanent = TRUE;
	description = "What must I do to become a magician?";
};


func int dia_nov_8_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_8_join_info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//What must I do to become a magician?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//You will become a Chosen of Innos only when the High Magicians of Fire allow it.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//As novices we are forbidden to study rune magic - and we may study the old scriptures only with the permission of the magicians.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "Who is in charge of this monastery?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Who is in charge of this monastery?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//The High Council. It is composed of the three most powerful magicians of our order. They consult daily in the church.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//The Chosen of Innos are all magicians. Innos has provided them with this gift, so that they are able to carry out his will on earth.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "Tell me about this monastery.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Tell me about this monastery.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//It is ancient. It comes from the time before Rhobar the First.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Under the monastery are the catacombs. They stretch deep into the mountain.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "Is there anything new?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Is there anything new?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//You could say so. It has been more than a hundred years since a novice was accepted so quickly into the Circle of Fire.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//I hope that this honor is also granted to me one day. I shall work hard for it.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//The paladins arrived in Khorinis recently. One of them is here in the monastery to pray.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//I still can't believe it. One of us has betrayed the monastery and stolen the Eye of Innos.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//It was our task to build a community, but we were too weak. That is the only reason Beliar could have succeeded in drawing one of our own to his side.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Innos be praised, we were able to get the Eye back from the enemy.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Your courage can be a model for many despairing souls and help them to survive these dark times.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//I have heard of dragons and an army of Evil. Innos be with us!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//The High Council is very concerned about the situation our paladins are in. There has been no news from the Valley of Mines for some time.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//No. And I thank our Lord for that. With the Eye of Innos we will be able to defeat the dragons!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Yes. We have achieved victory over the dragons! Innos has shown us that we must never give up hope.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//Yet there are many shadows and we shall have to light many fires to drive them away.
	};
};

func void b_assignambientinfos_nov_8(var C_NPC slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_wurst.npc = Hlp_GetInstanceID(slf);
};

