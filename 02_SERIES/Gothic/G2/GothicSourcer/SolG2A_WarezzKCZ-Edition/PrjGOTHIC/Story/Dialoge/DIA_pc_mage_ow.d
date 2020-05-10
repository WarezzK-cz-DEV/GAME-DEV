
instance DIA_MILTENOW_EXIT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 999;
	condition = dia_miltenow_exit_condition;
	information = dia_miltenow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltenow_exit_condition()
{
	return TRUE;
};

func void dia_miltenow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENOW_HELLO(C_INFO)
{
	npc = pc_mage_ow;
	nr = TRUE;
	condition = dia_miltenow_hello_condition;
	information = dia_miltenow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltenow_hello_condition()
{
	return TRUE;
};

func void dia_miltenow_hello_info()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Look who has returned! Our hero from the barrier!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Good to see you, Milten.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"Do I know you?",dia_miltenow_hello_no);
	b_startotherroutine(milten,"START");
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Do you remember Gorn, Diego and Lester?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Good to see you, Milten. Are you still here, or here again?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Again. After the Barrier collapsed I entered the monastery of the Magicians of Fire.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//But once it was clear that the paladins wanted to come here, my experience and knowledge of the place proved to be quite useful.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//So they decided then and there to entrust me with the holy mission of providing magical support to this expedition.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Of course I remember the boys.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Those names don't ring a bell at all.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//Am I supposed to know them?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//You've been through a lot, huh?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"So what is there to report?",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Those names don't ring a bell at all.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Of course I remember the boys.
	b_giveplayerxp(100);
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//Well, Gorn and Diego didn't get far. They were picked up by the paladins here in the valley.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Lester has vanished, though - I have no idea where he's hanging around.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//I've met Lester - he's with Xardas now.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//One bit of good news, at least.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//Well, I have nothing pleasant to report.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Those names don't ring a bell at all.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//You have forgotten a great deal, haven't you? Well, let's leave the past in peace and devote ourselves to the here and now.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//Even if there isn't anything pleasant to report.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "So what is there to report?";
};


func int dia_miltenow_bericht_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello))
	{
		return TRUE;
	};
};

func void dia_miltenow_bericht_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//So what is there to report?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//The paladins came here with the intention of getting the magic ore.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//But with the dragon attacks and the orcs - I can't imagine the paladins will march out of here with the ore.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//No, by Innos - I feel the presence of something dark... something evil, growing here. Something that emanates from this valley.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//We paid a high price for the annihilation of the Sleeper. The destruction of the Barrier has ruined this place as well.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//We can all count ourselves lucky if we survive this.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "How much ore have you stored away so far?";
};


func int dia_miltenow_erz_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_bericht))
	{
		return TRUE;
	};
};

func void dia_miltenow_erz_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//How much ore have you stored away so far?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//How much ore...? Not one chest! We haven't had contact with the scrapers for some time.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//It wouldn't amaze me if they were all long dead. And we are being attacked by dragons and besieged by orcs!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//This expedition is a complete disaster.
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "Where are Gorn and Diego now?";
};


func int dia_miltenow_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello) && (KNOWS_DIEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_miltenow_wo_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//Where are Gorn and Diego now?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Well, Gorn is sitting here in the dungeon - because he resisted arrest.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//They assigned Diego to a troop of scrapers - ask the paladin Parcival, he assembled the groups.
	KNOWSABOUTGORN = TRUE;
	SEARCHFORDIEGO = LOG_RUNNING;
};


instance DIA_MILTENOW_GORN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_gorn_condition;
	information = dia_miltenow_gorn_info;
	permanent = FALSE;
	description = "Let's go and free Gorn!";
};


func int dia_miltenow_gorn_condition()
{
	if((KNOWSABOUTGORN == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_gorn_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Let's go and free Gorn!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//Well, the problem in this matter is that Gorn is a convicted prisoner.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//But if we're lucky, Garond will agree on a deal, and we can buy his freedom.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Yes, maybe...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Keep me in the picture.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"Comander Garond has had Gorn locked up. Maybe he'll enter into a little arrangement, so we can bail him out.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "Garond wants 1000 gold pieces for Gorn.";
};


func int dia_miltenow_preis_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_preis_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Garond wants 1000 gold pieces for Gorn.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//A nice sum. I can chip in 250 gold pieces.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"Milten gave me 250 pieces of gold to pay for Gorn's release.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "I need more gold to buy Gorn's freedom.";
};


func int dia_miltenow_mehr_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (Npc_HasItems(other,itmi_gold) < 1000) && Npc_KnowsInfo(other,dia_miltenow_preis))
	{
		return TRUE;
	};
};

func void dia_miltenow_mehr_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//I need more gold to buy Gorn's freedom.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Getting more gold... hm. Diego knows a lot about that - but he isn't here.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Maybe Gorn has some gold hidden somewhere himself - we should find out.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//I'll write him a note - here, try to smuggle it into the dungeon.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Milten has given me a message for Gorn. If I can just smuggle it into the jail, he may be able to tell us whether he's got any gold stashed away somewhere.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "Can you give me some equipment?";
};


func int dia_miltenow_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_miltenow_equipment_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Can you give me some equipment? Garond has asked me to go to the mining sites.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//Where am I supposed to get that? The only thing I can give you is a valuable runestone.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_MILTENOW_VERSTECK(C_INFO)
{
	npc = pc_mage_ow;
	nr = 1;
	condition = dia_miltenow_versteck_condition;
	information = dia_miltenow_versteck_info;
	permanent = FALSE;
	important = FALSE;
	description = "I got an answer from Gorn...";
};


func int dia_miltenow_versteck_condition()
{
	if((GORNSTREASURE == TRUE) && (Npc_HasItems(other,itmi_gornstreasure_mis) <= 0) && (GORNS_BEUTEL == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_versteck_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//I got an answer from Gorn. He says the gold is at the south gate.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(bitter) Former south gate, you mean to say. The dragon has reduced it to rubble.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//How do I get there?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//That is near the orcs' ram. The south gate was to the right of that.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//It won't be easy - so keep your head down and hurry.
	b_logentry(TOPIC_RESCUEGORN,"The former south gate is to the right of the orc's ram. Gorn's gold is somewhere around there.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "I have freed Gorn.";
};


func int dia_miltenow_frei_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_frei_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//I have freed Gorn.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Good. Then we should think about what happens next.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "Can you teach me something?";
};


func int dia_miltenow_lehren_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_lehren_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Can you teach me something?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//I can instruct you in some magic from the second Circle of Magic, or I can help you to increase your magic power.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//If you feel ready to increase your power, then I can instruct you.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me the second Circle of Magic!",b_getlearncosttalent(other,NPC_TALENT_MAGE,2));
};


func int dia_miltenow_teachcircle2_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teachcircle2_info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Teach me the second Circle of Magic!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//This is normally the privilege of the teachers of our order.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//But I think that, in this case, we can make an exception...
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//I don't know if I quite remember the official words...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Enter now the second Circle. Er... It will show you the way - but your deeds form the path - or something along those lines...
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//I think you understand what this is about...
	};
};


instance DIA_MILTENOW_TEACH(C_INFO)
{
	npc = pc_mage_ow;
	nr = 90;
	condition = dia_miltenow_teach_condition;
	information = dia_miltenow_teach_info;
	permanent = TRUE;
	description = "I want to learn some new spells.";
};


func int dia_miltenow_teach_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teach_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//I want to learn some new spells.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltenow_teach);
		Info_AddChoice(dia_miltenow_teach,DIALOG_BACK,dia_miltenow_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_WINDFIST)),dia_miltenow_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_INSTANTFIREBALL)),dia_miltenow_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_miltenow_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//You have not yet reached the second Circle of Magic. I can't teach you anything.
	};
};

func void dia_miltenow_teach_back()
{
	Info_ClearChoices(dia_miltenow_teach);
};

func void dia_miltenow_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltenow_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltenow_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENOW_MANA(C_INFO)
{
	npc = pc_mage_ow;
	nr = 100;
	condition = dia_miltenow_mana_condition;
	information = dia_miltenow_mana_info;
	permanent = TRUE;
	description = "I want to increase my magic powers.";
};


func int dia_miltenow_mana_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_mana_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//I want to increase my magic powers.
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= T_MED)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Your magic power is great. Too great for me to be able to help you to increase it.
	};
	Info_ClearChoices(dia_miltenow_mana);
};

func void dia_miltenow_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,T_MED);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX,1)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX,5)),dia_miltenow_mana_5);
};


instance DIA_MILTENOW_PERM(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_perm_condition;
	information = dia_miltenow_perm_info;
	permanent = TRUE;
	description = "What's your job here?";
};


func int dia_miltenow_perm_condition()
{
	if((KAPITEL == 2) && (Npc_KnowsInfo(other,dia_miltenow_frei) == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltenow_perm_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//What is your task here?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Originally, I was supposed to assay the magic ore. But we haven't seen much of that so far.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//Now I'm concentrating on the study of alchemy.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "What are your plans?";
};


func int dia_miltenow_plan_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_miltenow_frei))
	{
		return TRUE;
	};
};

func void dia_miltenow_plan_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//What are your plans?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//I shall return. I will wait for a while, but now that Gorn is free, I can take off together with him.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//It is more than necessary that Pyrokar learns of the situation here.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//If you think so.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//I hope that Lord Hagen will recognize the threat that emanates from this valley. Not to think of what will happen if the orcs come over the pass.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//Well, then, have a safe trip.
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(It would be difficult to steal his potion)";
};


func int dia_miltenow_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return 1;
	};
};

func void dia_miltenow_pickpocket_info()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_BACK,dia_miltenow_pickpocket_back);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_PICKPOCKET,dia_miltenow_pickpocket_doit);
};

func void dia_miltenow_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itpo_perm_mana,1);
		b_giveinvitems(self,other,itpo_perm_mana,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_miltenow_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_miltenow_pickpocket_back()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
};

