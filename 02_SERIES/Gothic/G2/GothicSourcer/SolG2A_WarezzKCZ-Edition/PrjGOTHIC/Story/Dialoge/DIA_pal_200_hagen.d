
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//It's good that you've come. You can pay your penalty right away.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//You don't take the city laws very seriously, do you?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//The list of your offenses has grown longer.
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//And don't tell me you didn't know that!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//You will pay the maximum penalty.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//Well, it appears that the situation has changed.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//There are no more witnesses for your murder!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//No one will testify now that you have stolen!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//There are no more witnesses for your brawling.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//All of the accusations against you are no longer valid.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//I don't know what happened there in the city - and I don't want to know.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//Simply make sure that you don't get into trouble here.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//In any case, I have decided to excuse your debts.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//See to it that you don't get into any more difficulties.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//You will, nevertheless, pay your fines in full.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//So, do you want to pay?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"I haven't got enough gold!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"How much was that again?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"I want to pay the penalty!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//How much was that again?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"I haven't got enough gold!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"How much was that again?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"I want to pay the penalty!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//Your reputation precedes you. You have violated the laws of the city.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//You have gotten yourself into a fine mess.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//Murder is a serious crime!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//Not to mention your other offenses.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//The guards have orders to execute every murderer on the spot.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//Murder is not acceptable in this city. But you can show your remorse by paying your penalty.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//You are accused of theft!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//Not to mention the other things I have heard.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//That is a violation of the laws of the city. You will pay a penalty for that.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//You have been involved in a brawl. In doing so, you have violated the law.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//And what was that thing with the sheep?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//A violation of the laws of the city - is a violation of the laws of Innos.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//Therefore, you will pay for it.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//You have been after our sheep - I didn't want to believe it at first.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//Why must I busy myself with such trifles?
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//You will have to pay compensation!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//How much?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"I haven't got enough gold!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"I want to pay the penalty!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//I want to pay the penalty!
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//Good! I shall see to it that every one in the city learns of it - this will restore your reputation to some degree.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//I want to pay the penalty!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//Then see to it that you acquire the gold as quickly as possible.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//And I'm warning you: if you add to your guilt, things will get worse for you.
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (hero.guild != GIL_SHEEP) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//I have already heard of you.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//Lothar has reported that you wish to speak with me.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//You are the stranger who has demanded the Eye of Innos.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//I am Lord Hagen.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//Paladin of the king, warrior of our Lord Innos and commander-in-chief of Khorinis.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//I have much to do. So do not waste my time - tell me, rather, why you are here.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "I bring an offer of peace from the mercenaries!";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//I bring an offer of peace from the mercenaries!
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(grumpily) Hm - show me!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//I know General Lee. I also know the circumstances under which he was condemned to forced labor in the colony.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//I consider him to be an honorable man. I am prepared to grant him absolution - only him!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//That does not apply to his men, however. Most of them are dishonorable cut-throats and have earned their punishment!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//I shall certainly not offer them absolution. Report that to him.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//Was that all?
	};
	b_logentry(TOPIC_FRIEDEN,"Lord Hagen is willing to grant absolution to Lee, but not to any of the other mercenaries.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "The hosts of evil are gathering very close to here. In the Valley of Mines.";
};


func int dia_lord_hagen_armee_condition()
{
	if(!(MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//The hosts of evil are gathering very close to here. In the Valley of Mines.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//In the Valley of Mines? We have dispatched an expedition there. We are also aware of reports that say the pass there is occupied by orcs.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//But thus far, nothing has come to me of an army of Evil.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//Is this merely a trick to make me believe that it is necessary to form an alliance with the mercenaries?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//No.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//(skeptical) What army is that supposed to be?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//An army of dragons who have gathered hosts of their minions around them.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//Dragons? According to the old scriptures it is many centuries since dragons were last sighted.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//Tell me - why should I believe a word you say?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//But the question isn't whether you can believe me. The question is whether you can afford NOT to believe me when I tell the truth.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//As long as I have no proof, I cannot afford to send even more men there.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = TRUE;
	description = "So you want me to bring you proof?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (HAGEN_BRINGPROOF == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//So you want me to bring you proof?
	if((hero.guild != GIL_NONE) && (hero.guild != GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//Precisely. Cross the pass and go to the Valley of Mines. Once there, seek out the expedition - and when you have found them, speak to Commander Garond.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//If anyone knows the situation there, he will.
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//If he confirms your words, then I am prepared to help you.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//Does that mean you'll hand over the Eye of Innos to me?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//The Eye of Innos... good. Bring me proof, then I shall see to it that you are permitted to wear the amulet.
		AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//Then can I say I've got your word in this matter?
		AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//You can - for you have it.
		HAGEN_BRINGPROOF = TRUE;
	}
	else
	{
		if(hero.guild == GIL_NOV)
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED_NOV,-1,-1,FONT_SCREEN,2);
		}
		else
		{
			PrintScreen(PRINT_ADDON_GUILDNEEDED,-1,-1,FONT_SCREEN,2);
		};
		b_say(self,other,"$NOLEARNNOPOINTS");
	};
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "What do you know about the Eye of Innos?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//What do you know about the Eye of Innos?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//It is a divine artifact. (pensive) In the old prophecies it is mentioned in connection with dragons.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//However, the scriptures also say that only a Chosen of Innos can wear it.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//I AM a Chosen of Innos!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//Then perhaps it will be possible for you to wear the amulet.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "How am I supposed to get across the pass?";
};


func int dia_lord_hagen_pass_condition()
{
	if((HAGEN_BRINGPROOF == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//How am I supposed to get across the pass?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//I shall give you the key to the gate to the pass. However, you will have to find your own way through the ranks of the orcs.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//May Innos protect you.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	b_removenpc(bdt_1013_bandit_l);
	Wld_InsertNpc(wolf,"NW_XARDAS_MONSTER_INSERT_01");
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"Lord Hagen wants me to bring him proof of the army of Evil. I'm going to head for the Valley of Mines and talk to Commander Garond there.");
	if(FERNANDO_IMKNAST == FALSE)
	{
		b_startotherroutine(fernando,"WAIT");
	};
	Wld_InsertNpc(bdt_1020_bandit_l,"NW_TROLLAREA_PATH_47");
};


instance DIA_ADDON_LORD_HAGEN_ORNAMENT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 10;
	condition = dia_addon_lord_hagen_ornament_condition;
	information = dia_addon_lord_hagen_ornament_info;
	description = "I'm looking for a metal ornament.";
};


func int dia_addon_lord_hagen_ornament_condition()
{
	if((MIS_ADDON_CAVALORN_GETORNAMENTFROMPAL == LOG_RUNNING) && (LORD_HAGEN_GOTORNAMENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_lord_hagen_ornament_info()
{
	AI_Output(other,self,"DIA_Addon_Lord_Hagen_GiveOrnament_15_00");	//I am looking for a metal ornament. It should have been by the stone circle near Lobart's farm.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_01");	//If you mean this thing here... we suspected that it might be a magical rune, but it turned out to be completely worthless.
	AI_Output(self,other,"DIA_Addon_Lord_Hagen_GiveOrnament_04_02");	//You can have it if you like. I have no use for it.
	CreateInvItems(self,itmi_ornament_addon,1);
	b_giveinvitems(self,other,itmi_ornament_addon,1);
	LORD_HAGEN_GOTORNAMENT = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "Why have you come to Khorinis?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//Why have you come to Khorinis?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//We are on an important mission for the kingdom. Our orders come directly from King Rhobar.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//I told you that we have sent an expedition to the Valley of Mines. That is the reason for our presence.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "What are your men doing in the Valley of Mines?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//What are your men doing in the Valley of Mines?
	if(HAGEN_BRINGPROOF == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//I see no reason to reveal that to you!
	}
	else
	{
		if(garond.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//You were there. You should know.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//All right, since you are going there anyway, I might as well tell you.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//This is all about the magic ore. It can decide the outcome of the war.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//Without enough weapons made of magic ore, the king's army does not stand the slightest chance against the elite warriors of the orcs.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//And the ore mines here on the island are the last to which we still have access.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//As soon as our ship is fully laden with ore, we shall sail back to the mainland.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//The war against the orcs is going badly, then?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//I have already told you too much.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "I'm looking for a swordmaster.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.aivar[REAL_TALENT_2H] >= 90) && (other.aivar[REAL_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//I'm looking for a swordmaster.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//So? You have found one.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"Lord Hagen can teach me to fight with two-handed weapons.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "Let us begin (learn two-handed combat).";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//Let us begin.
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//You are now a worthy swordmaster. I can teach you no more.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//May your future deeds be guided by the wisdom of a swordmaster.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "I want to take up service with the order.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//I want to take up service with the order.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//Good, you have proven that you have the courage, the skill and the knowledge to serve Innos.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//Your deeds bear witness to a pure heart.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//If it is your wish, then I shall bid you welcome to our order.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"I'm not quite sure yet.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"I'm ready!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//To be a warrior of Innos means to devote yourself entirely to the cause of Innos.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//Only the noblest and bravest warriors are accepted into our order.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//If you are truly determined to become a paladin, you must prove that you are worthy.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//I'm not quite sure yet.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//Then go and free your heart of doubt. Return when you are prepared.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//I am ready!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(serious) Then so shall it be!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//(serious) Many men have taken this path and given their lives in the name of Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//(serious) Do you swear that your deeds will honor their deaths and proclaim the fame of Innos?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//I swear!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//Then, from now on, you are a member of our fellowship.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//I hereby appoint you a warrior of Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//I give to you the weapons and armor of a knight. Bear them with pride, knight!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//Henceforth, by virtue of your rank, you shall have access to the monastery.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//Albrecht will teach you our magic, just go and talk to him.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//And, of course, our quarters in the upper end of the city are now open to you.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "How can I prove myself worthy?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//How can I prove myself worthy?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//Your deeds will show whether you are worthy.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//We fight for freedom and justice in the name of Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//We fight against Beliar and his henchmen, who want to destroy the just order of Innos.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//I understand.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//You understand nothing at all! Our honor is our life and our life is Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//A paladin goes to battle praising Innos, and many of us have lost their lives on the altar of the eternal strife between Good and Evil.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//Every single one of us has committed himself to this tradition. If we fail, we tarnish the deeds of our fallen comrades.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//Only he who truly understands this is worthy of being a paladin.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//How's the situation?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//I must find a way to rescue this expedition.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//We must do something against the dragons.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(to himself) Perhaps the Eye of Innos can save us all now...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//I shall go mad here. I am a soldier, not a bureaucrat.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//With all this paperwork that I must do, I barely remember what my sword feels like in my hand.
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "I have the Eye - it is broken.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//I have the Eye - it is broken.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//WHAT? By Innos! What have you done? We need the Eye!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//Speak to Pyrokar! There must be a way to put it back together.
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "I bring you news from Garond.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//I bring you news from Garond. Here, he gave me these lines for you.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//Our situation is worse than I had feared. But report to me on the situation in the Valley of Mines.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//The paladins are holed up in the castle in the Valley of mines, surrounded by orcs.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//There were many casualties in the prospecting operations, and there's barely any ore left.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//Well, I should say that, without any help, the lads are lost. That's how it looks.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//I shall find a way to rescue this expedition. You have done much for us. Innos will thank you...
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//I'm not all that interested in his gratitude. I want his eye.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//Yes of course. I stand by my word. Take this letter. It will open the monastery gates to you.
	AI_PrintScreen("Letter of Authorization for Pyrokar received",-1,26,FONT_SCREENBRIGHTLARGE,3);
	CreateInvItems(hero,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//Speak with Pyrokar, the highest Fire Magician, and show him this authorization. He will grant you access to the Eye of Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//One more thing, before you go...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//Take this rune as a token of my gratitude. It will take you safely back to the city whenever you want.
	AI_PrintScreen("Teleport rune to Khorinis received",-1,30,FONT_SCREENBRIGHTLARGE,2);
	CreateInvItems(hero,itru_teleportseaport,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"Lord Hagen's given me a message. This will cause Master Pyrokar to hand me the Eye of Innos at the monastery.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_removenpc(pedro);
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "I need to talk to you about Bennet.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//I need to talk to you about Bennet.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//But that's the mercenary who murdered one of my men.
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"How come you're so sure that Bennet is the killer?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"I believe that Bennet is innocent.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"Bennet could help us to repair the Eye of Innos.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//Bennet could help us to repair the Eye of Innos.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//Even if he could summon down the power of Innos himself to earth...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//He has murdered a paladin. He will be executed for that!
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//How come you're so sure that Bennet is the killer?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//We have a witness.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//As you see, there is no doubt about the mercenary's guilt.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//Who is that witness?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//Cornelius, the governor's secretary, saw the murder.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//His description fits Bennet, no doubt about that. As far as I am concerned, that settles the matter.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//The mercenary will hang for treason.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius, the governor's secretary, is the witness. He claims to have witnessed the murder.");
	RECUEBENNET_KNOWSCORNELIUS = TRUE;
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//I believe that Bennet is innocent.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//The evidence is clear. He is guilty.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//So what if the proof is wrong?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//Be careful what you say. You raise some serious accusations.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//If you cannot present me with evidence that the witness lied, then you had best hold your tongue.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "Cornelius lied.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//Cornelius lied.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//How do you know that?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//Here, I've got his diary. Everything's in there.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(furious) That slimy little criminal!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//In view of the new evidence, there is nothing else I can do.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//By virtue of the office granted me by king and church, I declare...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//... that the prisoner Bennet is exonerated of all charges and is thereby a free man.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//Cornelius is to be taken into immediate custody for perjury.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//Save yourself the trouble. Cornelius is dead.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//Then he has already received his just punishment. Well done.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//He's made himself scarce.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//Sooner or later, he will turn up. Then we shall arrest him.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//Your deeds would redound to the honor of one of our own.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "I carry the Eye!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//I carry the Eye!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(reverently) You bear the Eye!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//And you have put it back together!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//Then you are a Chosen of Innos!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//I shall set out and kill all the dragons in the Valley of Mines!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//Go with Innos and destroy Evil with his power!
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "The orcs' elite warriors are attacking the land.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//The orcs' elite warriors are attacking the land.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"I told Lord Hagen about the advancing hordes of orcish warlords.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//What makes you say that?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//I talked to one of them. Your name was mentioned.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//Nonsense. My people have not reported a massive invasion of orcs so far.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//Perhaps some of their scouts got lost in the nearby woods.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//Those were no scouts. I took this ring from one of them.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//Show me.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//Mmh. That is certainly disturbing.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//That is a sign of their strength. So the orcs have left their palisades and are fighting on the open field.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//I haven't seen a whole lot so far. Mainly their warlords, and only a few fighters.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//So? Then they must be plotting something else. That is rather unlike orcs that their leaders should leave their protective palisades by themselves.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//It would be a good opportunity, however, to deliver them a telling blow.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//If they lose their leaders, their morale will sink as well.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//You have a new assignment, knight. Go and kill the orc leaders you can find here in the area.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//Bring me their rings. That will be a tough blow to the orcs.
		b_logentry(TOPIC_ORCELITE,"I was able to bring Hagen a ring of the orcish warlord as proof. He wants me to bring all the ones to him I can find.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//Ask Ingmar about this. He can give you a few tactical hints for fighting the orc leaders.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//The orcs' elite warriors are his specialty. He has often had to deal with them.
			b_logentry(TOPIC_ORCELITE,"The orcish elite warriors are Ingmar's specialty.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//Your word alone that you have killed the chief warlord of the orcs is not enough for me.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//I need more tangible evidence if I am to respond to this.
		b_logentry(TOPIC_ORCELITE,"Hagen is unwilling to believe me. He demands evidence that the elite warriors are attacking the civilized lands. Well, it would have surprised me if he hadn't.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "There's something else I have to report about the orcish warlords.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//There's something else I have to report about the orcish warlords.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//Then tell me.
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//I can give you another orc ring.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//I can give you some more orc rings.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//I am proud of you. Carry on!
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//There may still be a few of them out there.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//Soon we shall have forced them to their knees.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//I would be amazed if you still found very many of them.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//You are welcome to keep bringing me their rings, but I think the orcs have gotten the message now.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//Here. Let me give you some gold towards your equipment.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "The dragons are dead.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//The dragons are dead.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//I knew that Innos would give you the strength to defeat the dragons!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//Where is the ore?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//The orcs are still besieging the castle in the Valley of Mines. Garond stands no chance of leaving the castle before the siege is ended.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(furious) Damnit!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//If Garond isn't capable of handling the situation, then I shall have to see to it myself.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//A few orcs won't stop me! Not me!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//I have already informed my men. We are preparing for departure.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//We shall ALL go. I shall leave only a minimal guard on the ship.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//That should be enough then to finally put an end to the orcs!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
	b_startotherroutine(albrecht,"START");
	b_startotherroutine(pal_210_torwache,"START");
	b_startotherroutine(pal_211_torwache,"START");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "I need a ship.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//I need a ship.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//So do a lot of people, soldier.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//(laughs) I hear that almost every day, reverend. But...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//You do not even have a captain, to say nothing of a crew.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//What about the ship in the harbor?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//It belongs to me, and that's that. We shall transport the ore with this ship.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//Once that is done, then you can ask me again.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "The orcs have stormed the castle in the Valley of Mines!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//The orcs have stormed the castle in the Valley of Mines!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//By Innos! What exactly happened there?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//Somehow the gate must have opened...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//Somehow?! How is that possible... There must have been a traitor in the castle!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "What are you waiting for?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//What are you waiting for?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//We are still waiting for our equipment and provisions. Then we set off!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//Now that the castle has been stormed, we need even more provisions.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//But that will not delay our departure for long.
	};
};

