
instance DIA_GARWIG_EXIT(C_INFO)
{
	npc = nov_608_garwig;
	nr = 999;
	condition = dia_garwig_exit_condition;
	information = dia_garwig_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garwig_exit_condition()
{
	return TRUE;
};

func void dia_garwig_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARWIG_WURST(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_wurst_condition;
	information = dia_garwig_wurst_info;
	permanent = FALSE;
	description = "Would you like a sausage?";
};


func int dia_garwig_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_garwig_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Garwig_Wurst_15_00");	//Would you like a sausage?
	AI_Output(self,other,"DIA_Garwig_Wurst_06_01");	//Ah - delicious, that. Thank you so much, brother.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
};


instance DIA_GARWIG_HELLO(C_INFO)
{
	npc = nov_608_garwig;
	nr = 3;
	condition = dia_garwig_hello_condition;
	information = dia_garwig_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_garwig_hello_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_hello_info()
{
	AI_Output(self,other,"DIA_Garwig_Hello_06_00");	//Innos be with you - I've never seen you before, are you new around here?
	AI_Output(other,self,"DIA_Garwig_Hello_15_01");	//Yes, I only just joined.
	AI_Output(self,other,"DIA_Garwig_Hello_06_02");	//In that case, I hope you'll get settled here fast. Let me know if I can help you with anything.
};


instance DIA_GARWIG_ROOM(C_INFO)
{
	npc = nov_608_garwig;
	nr = 5;
	condition = dia_garwig_room_condition;
	information = dia_garwig_room_info;
	permanent = FALSE;
	description = "What room is this?";
};


func int dia_garwig_room_condition()
{
	return TRUE;
};

func void dia_garwig_room_info()
{
	AI_Output(other,self,"DIA_Garwig_Room_15_00");	//What room is this?
	AI_Output(self,other,"DIA_Garwig_Room_06_01");	//This is where they keep the holy relics of the monastery.
	AI_Output(other,self,"DIA_Garwig_Room_15_02");	//What relics?
	AI_Output(self,other,"DIA_Garwig_Room_06_03");	//Here rests the Hammer of Innos, along with the Shield of Fire. These are the most important relics of the Church of Innos outside of the capital of the realm.
};


instance DIA_GARWIG_HAMMER(C_INFO)
{
	npc = nov_608_garwig;
	nr = 99;
	condition = dia_garwig_hammer_condition;
	information = dia_garwig_hammer_info;
	permanent = TRUE;
	description = "Tell me about the hammer.";
};


func int dia_garwig_hammer_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_hammer_info()
{
	AI_Output(other,self,"DIA_Garwig_Hammer_15_00");	//Tell me about the hammer.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_01");	//This is the sacred Hammer of Innos. With this hammer, Saint Rhobar slew the Stone Sentinel.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_02");	//The Holy Scriptures say that the Stone Sentinel was invulnerable. He stood in battle like a tower, and the weapons of his enemies were smashed on his skin of stone.
	AI_Output(self,other,"DIA_Garwig_Hammer_06_03");	//With the name of Innos on his lips, Rhobar hurled himself at the monster and crushed it with one mighty blow of his hammer.
};


instance DIA_GARWIG_SHIELD(C_INFO)
{
	npc = nov_608_garwig;
	nr = 98;
	condition = dia_garwig_shield_condition;
	information = dia_garwig_shield_info;
	permanent = FALSE;
	description = "Tell me about the shield.";
};


func int dia_garwig_shield_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room))
	{
		return TRUE;
	};
};

func void dia_garwig_shield_info()
{
	AI_Output(other,self,"DIA_Garwig_Shield_15_00");	//Tell me about the shield.
	AI_Output(self,other,"DIA_Garwig_Shield_06_01");	//The Shield of Fire was borne by Dominique in the battle on the Southern Isles.
	AI_Output(self,other,"DIA_Garwig_Shield_06_02");	//But the power of this shield is never to be wielded again - therefore, we have nailed it to the wall.
};


instance DIA_GARWIG_AUGE(C_INFO)
{
	npc = nov_608_garwig;
	nr = 4;
	condition = dia_garwig_auge_condition;
	information = dia_garwig_auge_info;
	permanent = FALSE;
	description = "Is the Eye of Innos kept here, too?";
};


func int dia_garwig_auge_condition()
{
	if(Npc_KnowsInfo(other,dia_garwig_room) && (KAPITEL <= 2))
	{
		return TRUE;
	};
};

func void dia_garwig_auge_info()
{
	AI_Output(other,self,"DIA_Garwig_Auge_15_00");	//Is the Eye of Innos kept here, too?
	AI_Output(self,other,"DIA_Garwig_Auge_06_01");	//Of course not. What a strange idea. Nobody knows where that divine artifact is to be found.
};


instance DIA_GARWIG_SLEEP(C_INFO)
{
	npc = nov_608_garwig;
	nr = 23;
	condition = dia_garwig_sleep_condition;
	information = dia_garwig_sleep_info;
	permanent = TRUE;
	description = "What are you doing here?";
};


func int dia_garwig_sleep_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_garwig_sleep_info()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Garwig_SLEEP_06_01");	//I am the guardian of the sacred artifacts.
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,DIALOG_BACK,dia_garwig_sleep_back);
	Info_AddChoice(dia_garwig_sleep,"Shall I take over from you for a while?",dia_garwig_sleep_exchange);
	Info_AddChoice(dia_garwig_sleep,"Why are the artifacts being guarded?",dia_garwig_sleep_thief);
	Info_AddChoice(dia_garwig_sleep,"Don't you ever sleep?",dia_garwig_sleep_never);
};

func void dia_garwig_sleep_back()
{
	Info_ClearChoices(dia_garwig_sleep);
};

func void dia_garwig_sleep_exchange()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_EXCHANGE_15_00");	//Shall I take over from you for a while?
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_01");	//Is this a test? The mages have sent you to test me, right? Ooh - I knew it!
	AI_Output(self,other,"DIA_Garwig_SLEEP_EXCHANGE_06_02");	//But I shall pass this test. Tell your mages that I stand firm as a rock, and that I shall resist all temptations, for I am a worthy guardian.
};

func void dia_garwig_sleep_thief()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_THIEF_15_00");	//Why are the artifacts being guarded? Is there any reason to worry they might be stolen?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_01");	//What an extraordinary concept. Whatever makes you think that?
	AI_Output(self,other,"DIA_Garwig_SLEEP_THIEF_06_02");	//Only those who serve Innos are authorized to set foot in the monastery. And no true believer would ever harbor such thoughts.
};

func void dia_garwig_sleep_never()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_NEVER_15_00");	//Don't you ever sleep?
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_01");	//What an unusual notion. Of course I don't ever sleep. Innos himself grants me the power which allows me to forego sleep altogether.
	AI_Output(self,other,"DIA_Garwig_SLEEP_NEVER_06_02");	//For how else could I fulfill the sacred duties of guardianship?
	Info_ClearChoices(dia_garwig_sleep);
	Info_AddChoice(dia_garwig_sleep,"Do you really NEVER sleep?",dia_garwig_sleep_again);
};

func void dia_garwig_sleep_again()
{
	AI_Output(other,self,"DIA_Garwig_SLEEP_AGAIN_15_00");	//Do you really NEVER sleep?
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_01");	//No. If a guardian falls asleep, he has failed.
	AI_Output(self,other,"DIA_Garwig_SLEEP_AGAIN_06_02");	//But I shall not fail, for Innos gives me strength and endurance, and I shall never tire.
};


instance DIA_GARWIG_THIEF(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_thief_condition;
	information = dia_garwig_thief_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garwig_thief_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_HasItems(hero,holy_hammer_mis) == 1))
	{
		return TRUE;
	};
};

func void dia_garwig_thief_info()
{
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_00");	//(upset) Thief! You have disgraced not only yourself and me, but this entire monastery!
		AI_Output(self,other,"DIA_Garwig_THIEF_06_01");	//You shall atone for this sacrilege. And, above all - GIVE ME BACK THAT HAMMER!!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_THIEF_06_02");	//(desperate) The hammer has disappeared - how could that happen?
		AI_Output(self,other,"DIA_Garwig_THIEF_06_03");	//I have failed. Innos will punish me!
	};
};


instance DIA_GARWIG_ABGEBEN(C_INFO)
{
	npc = nov_608_garwig;
	nr = 2;
	condition = dia_garwig_abgeben_condition;
	information = dia_garwig_abgeben_info;
	permanent = TRUE;
	description = "I'm bringing back the hammer.";
};


func int dia_garwig_abgeben_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_garwig_abgeben_info()
{
	AI_Output(other,self,"DIA_Garwig_Abgeben_15_00");	//I'm bringing back the hammer.
	if(HAMMER_TAKEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_01");	//You are a villainous thief!
	}
	else
	{
		AI_Output(self,other,"DIA_Garwig_Abgeben_06_02");	//So it's you who took it...
	};
	AI_Output(self,other,"DIA_Garwig_Abgeben_06_03");	//But it is not my place to judge you. Innos shall administer his justice upon you, and you shall receive his punishment!
	b_giveinvitems(other,self,holy_hammer_mis,1);
	HAMMER_TAKEN = FALSE;
};


instance DIA_GARWIG_PICKPOCKET(C_INFO)
{
	npc = nov_608_garwig;
	nr = 900;
	condition = dia_garwig_pickpocket_condition;
	information = dia_garwig_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_garwig_pickpocket_condition()
{
	return c_beklauen(52,80);
};

func void dia_garwig_pickpocket_info()
{
	Info_ClearChoices(dia_garwig_pickpocket);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_BACK,dia_garwig_pickpocket_back);
	Info_AddChoice(dia_garwig_pickpocket,DIALOG_PICKPOCKET,dia_garwig_pickpocket_doit);
};

func void dia_garwig_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_garwig_pickpocket);
};

func void dia_garwig_pickpocket_back()
{
	Info_ClearChoices(dia_garwig_pickpocket);
};

