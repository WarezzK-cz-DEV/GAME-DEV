
instance DIA_MARDUK_KAP1_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap1_exit_condition;
	information = dia_marduk_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_marduk_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_JOB(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_job_condition;
	information = dia_marduk_job_info;
	permanent = FALSE;
	description = "What's your job here?";
};


func int dia_marduk_job_condition()
{
	return TRUE;
};

func void dia_marduk_job_info()
{
	AI_Output(other,self,"DIA_Marduk_JOB_15_00");	//What's your job here?
	AI_Output(self,other,"DIA_Marduk_JOB_05_01");	//I prepare the paladins for their fight against Evil.
};


instance DIA_MARDUK_ARBEIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_arbeit_condition;
	information = dia_marduk_arbeit_info;
	permanent = FALSE;
	description = "Is there anything I can do for you, Master?";
};


func int dia_marduk_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_marduk_arbeit_info()
{
	AI_Output(other,self,"DIA_Marduk_Arbeit_15_00");	//Is there anything I can do for you, Master?
	AI_Output(self,other,"DIA_Marduk_Arbeit_05_01");	//For me? No, I do not require your help. Pray rather for the well-being of the warriors of Innos who have gone to the Valley of Mines.
	MIS_MARDUKBETEN = LOG_RUNNING;
	b_startotherroutine(sergio,"WAIT");
	Log_CreateTopic(TOPIC_MARDUKBETEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARDUKBETEN,LOG_RUNNING);
	b_logentry(TOPIC_MARDUKBETEN,"Master Marduk hasn't got any assignments for me. He told me I'd do better to say a prayer for the paladins.");
};


instance DIA_MARDUK_GEBETET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_gebetet_condition;
	information = dia_marduk_gebetet_info;
	permanent = FALSE;
	description = "I prayed for the paladins.";
};


func int dia_marduk_gebetet_condition()
{
	if((MIS_MARDUKBETEN == LOG_RUNNING) && Npc_KnowsInfo(other,pc_prayshrine_paladine))
	{
		return TRUE;
	};
};

func void dia_marduk_gebetet_info()
{
	AI_Output(other,self,"DIA_Marduk_Gebetet_15_00");	//I prayed for the paladins.
	AI_Output(self,other,"DIA_Marduk_Gebetet_05_01");	//You have done well. Now go back to doing your work.
	MIS_MARDUKBETEN = LOG_SUCCESS;
	b_giveplayerxp(XP_MARDUKBETEN);
	b_startotherroutine(sergio,"START");
};


instance DIA_MARDUK_EVIL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_evil_condition;
	information = dia_marduk_evil_info;
	permanent = TRUE;
	description = "What is 'Evil'?";
};


func int dia_marduk_evil_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_evil_info()
{
	AI_Output(other,self,"DIA_Marduk_Evil_15_00");	//What is 'Evil'?
	AI_Output(self,other,"DIA_Marduk_Evil_05_01");	//Evil is everywhere. It is the power of Beliar, the eternal adversary of Innos.
	AI_Output(self,other,"DIA_Marduk_Evil_05_02");	//It is the all-encompassing blackness which seeks to blot out the Light of Innos forever.
	AI_Output(self,other,"DIA_Marduk_Evil_05_03");	//Beliar is the Lord of Darkness, of Hate and Destruction.
	AI_Output(self,other,"DIA_Marduk_Evil_05_04");	//Only those among us in whose hearts blazes the Holy Fire of Innos will bear the radiant Light of Innos into the world and banish the darkness.
};


instance DIA_MARDUK_PAL(C_INFO)
{
	npc = kdf_505_marduk;
	condition = dia_marduk_pal_condition;
	information = dia_marduk_pal_info;
	permanent = FALSE;
	description = "But there are only magicians and novices living in the monastery.";
};


func int dia_marduk_pal_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_pal_info()
{
	AI_Output(other,self,"DIA_Marduk_Pal_15_00");	//But there are only magicians and novices living in the monastery.
	AI_Output(self,other,"DIA_Marduk_Pal_05_01");	//That is correct. In contrast to our community which honors the Word of Innos...
	AI_Output(self,other,"DIA_Marduk_Pal_05_02");	//... the paladins honor the great deeds of our Lord, above all else.
	AI_Output(self,other,"DIA_Marduk_Pal_05_03");	//We are the representatives of Innos, but the paladins are his warriors, who go into battle in his name and increase his glory.
};


instance DIA_MARDUK_BEFORETEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 3;
	condition = dia_marduk_beforeteach_condition;
	information = dia_marduk_beforeteach_info;
	permanent = FALSE;
	description = "Is there anything you can teach me?";
};


func int dia_marduk_beforeteach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_job))
	{
		return TRUE;
	};
};

func void dia_marduk_beforeteach_info()
{
	AI_Output(other,self,"DIA_Marduk_BEFORETEACH_15_00");	//Is there anything you can teach me?
	AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_01");	//I am an expert in the magics of ice and thunder. I can teach you their power.
	if(other.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Marduk_BEFORETEACH_05_02");	//However, I only instruct magicians.
	};
};


instance DIA_MARDUK_TEACH(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 10;
	condition = dia_marduk_teach_condition;
	information = dia_marduk_teach_info;
	permanent = TRUE;
	description = "Teach me (create runes).";
};


func int dia_marduk_teach_condition()
{
	if(Npc_KnowsInfo(hero,dia_marduk_beforeteach) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_marduk_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Marduk_TEACH_15_00");	//Teach me.
	Info_ClearChoices(dia_marduk_teach);
	Info_AddChoice(dia_marduk_teach,DIALOG_BACK,dia_marduk_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_ZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ZAP)),dia_marduk_teach_zap);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEBOLT)),dia_marduk_teach_icebolt);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_ICECUBE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICECUBE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICECUBE)),dia_marduk_teach_icecube);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_CHARGEZAP] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_CHARGEZAP,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_CHARGEZAP)),dia_marduk_teach_thunderball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_LIGHTNINGFLASH)),dia_marduk_teach_lightningflash);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE))
	{
		Info_AddChoice(dia_marduk_teach,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES,SPL_ICEWAVE)),dia_marduk_teach_icewave);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Marduk_TEACH_05_01");	//At the moment I cannot teach you.
		Info_ClearChoices(dia_marduk_teach);
	};
};

func void dia_marduk_teach_back()
{
	Info_ClearChoices(dia_marduk_teach);
};

func void dia_marduk_teach_zap()
{
	b_teachplayertalentrunes(self,other,SPL_ZAP);
};

func void dia_marduk_teach_icebolt()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};

func void dia_marduk_teach_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_marduk_teach_icecube()
{
	b_teachplayertalentrunes(self,other,SPL_ICECUBE);
};

func void dia_marduk_teach_thunderball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEZAP);
};

func void dia_marduk_teach_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};


instance DIA_MARDUK_KAP2_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap2_exit_condition;
	information = dia_marduk_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marduk_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap3_exit_condition;
	information = dia_marduk_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP3_HELLO(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 30;
	condition = dia_marduk_kap3_hello_condition;
	information = dia_marduk_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marduk_kap3_hello_condition()
{
	if((KAPITEL == 3) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_hello_info()
{
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_00");	//Welcome, my son.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_01");	//Since when are you one of the paladins?
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Info_05_02");	//Where do you come from?
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
	Info_AddChoice(dia_marduk_kap3_hello,"That's none of your business.",dia_marduk_kap3_hello_notyourconcern);
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"Only for a short time.",dia_marduk_kap3_hello_soon);
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_marduk_kap3_hello,"I've come from the farms.",dia_marduk_kap3_hello_djg);
	};
};

func void dia_marduk_kap3_hello_notyourconcern()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_NotYourConcern_15_00");	//That's none of your business.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_01");	//(scolding) A paladin should always be polite and modest. It is your task to protect those who cannot protect themselves.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_02");	//(scolding) It is a privilege and you should be thankful that Innos offers you this opportunity. Think about that!
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_03");	//(angry) There were times when it was not possible for rabble to enter our holy monastery. You are proof that those were better times.
		AI_Output(self,other,"DIA_Marduk_Kap3_Hello_NotYourConcern_05_04");	//(warning) I warn you, don't get up to anything here or you will be immediately punished. We shall exercise no false lenience.
	};
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_soon()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_Soon_15_00");	//Only for a short time.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_01");	//Then I bid you welcome. In this battle we need every man who has the courage to oppose Evil.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_Soon_05_02");	//The fate of us all lies in the hands of men like you. May Innos ever give you the courage you need.
	Info_ClearChoices(dia_marduk_kap3_hello);
};

func void dia_marduk_kap3_hello_djg()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_Hello_DJG_15_00");	//I've come from the farms.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_01");	//Then I bid you welcome in the name of hospitality. I hope that you will appreciate it.
	AI_Output(self,other,"DIA_Marduk_Kap3_Hello_DJG_05_02");	//Do not abuse your place as a guest, or you will have big problems.
	Info_ClearChoices(dia_marduk_kap3_hello);
};


instance DIA_MARDUK_TRAINPALS(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 32;
	condition = dia_marduk_trainpals_condition;
	information = dia_marduk_trainpals_info;
	permanent = TRUE;
	description = "What can you teach me?";
};


var int marduk_trainpals_permanent;

func int dia_marduk_trainpals_condition()
{
	if((hero.guild == GIL_PAL) && (MARDUK_TRAINPALS_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_trainpals_info()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_00");	//What can you teach me?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_01");	//Naturally, I cannot teach you your combat skills.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_02");	//I can, however, bring the essence of Innos and his gifts closer to you.
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_03");	//Besides, it is my task to prepare you for the Consecration of the Sword.
	AI_Output(other,self,"DIA_Marduk_TrainPals_15_04");	//And the magic?
	AI_Output(self,other,"DIA_Marduk_TrainPals_05_05");	//Here we teach only our magic. You must learn the magic of the paladins in the city.
	Info_ClearChoices(dia_marduk_trainpals);
	Info_AddChoice(dia_marduk_trainpals,"Maybe later.",dia_marduk_trainpals_later);
	Info_AddChoice(dia_marduk_trainpals,"What do you mean by that?",dia_marduk_trainpals_meaning);
	Info_AddChoice(dia_marduk_trainpals,"What's the Consecration of the Sword?",dia_marduk_trainpals_blessing);
};

func void dia_marduk_trainpals_later()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Later_15_00");	//Maybe later.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Later_05_01");	//You are heartily welcome here any time.
	Info_ClearChoices(dia_marduk_trainpals);
};

func void dia_marduk_trainpals_meaning()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_00");	//What do you mean by that?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_01");	//When Innos had to leave our world, he left humankind a part of his divine power.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_02");	//Only a few of us humans are allowed to use his power, and to oversee justice in his name.
	AI_Output(other,self,"DIA_Marduk_TrainPals_Meaning_15_03");	//And what do you want to bring closer to me?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Meaning_05_04");	//I can set you on the right path to recognize the essence of Innos, and follow him.
};

func void dia_marduk_trainpals_blessing()
{
	AI_Output(other,self,"DIA_Marduk_TrainPals_Blessing_15_00");	//What's the Consecration of the Sword?
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_01");	//The Consecration of the Sword is one of the paladins' most sacred rituals.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_02");	//During this ceremony, the holy power of Innos flows through the blade of the paladin's sword and gives the sword undreamed of powers.
	AI_Output(self,other,"DIA_Marduk_TrainPals_Blessing_05_03");	//A sword so consecrated is a paladin's most valuable possession and will accompany him his whole life long.
	MARDUK_TRAINPALS_PERMANENT = TRUE;
};


instance DIA_MARDUK_SWORDBLESSING(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 33;
	condition = dia_marduk_swordblessing_condition;
	information = dia_marduk_swordblessing_info;
	permanent = TRUE;
	description = "I want to consecrate my sword.";
};


func int dia_marduk_swordblessing_condition()
{
	if((MARDUK_TRAINPALS_PERMANENT == TRUE) && (c_schasblessedsword() == FALSE))
	{
		return TRUE;
	};
};

func void dia_marduk_swordblessing_info()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_15_00");	//I want to consecrate my sword.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_01");	//If you are determined to take this step, you will first need a magic blade.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_02");	//With this, you should then retreat to the chapel and pray.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_03");	//During the prayer, and after a reasonable donation to our Lord Innos, you should ask Innos for his grace and guidance in the battle against Evil.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_05_04");	//If Innos is well disposed toward you, your sword will be consecrated to our Lord from that moment on.
	Info_ClearChoices(dia_marduk_swordblessing);
	Info_AddChoice(dia_marduk_swordblessing,DIALOG_BACK,dia_marduk_swordblessing_back);
	Info_AddChoice(dia_marduk_swordblessing,"What kind of a donation?",dia_marduk_swordblessing_donation);
	if(OREBLADEBOUGHT == FALSE)
	{
		Info_AddChoice(dia_marduk_swordblessing,"Where can I get a magic blade?",dia_marduk_swordblessing_oreblade);
	};
};

func void dia_marduk_swordblessing_back()
{
	Info_ClearChoices(dia_marduk_swordblessing);
};

func void dia_marduk_swordblessing_donation()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_Donation_15_00");	//What kind of a donation?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_01");	//Now, in view of the grace that is to be granted to you, a sum of 5000 gold pieces is more than suitable.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_Donation_05_02");	//Of course, you are allowed to give more.
};

func void dia_marduk_swordblessing_oreblade()
{
	AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_00");	//Where can I get a magic blade?
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_01");	//Try in the city with Harad the smith.
	AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_02");	//He provides the paladins with magic blades while they are on the island.
	if(Npc_IsDead(harad) == TRUE)
	{
		AI_Output(other,self,"DIA_Marduk_SwordBlessing_OreBlade_15_03");	//Harad is dead.
		AI_Output(self,other,"DIA_Marduk_SwordBlessing_OreBlade_05_04");	//I am sorry, then you will have to wait until you return to the mainland with the other paladins.
	};
};


instance DIA_MARDUK_KAP3_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 39;
	condition = dia_marduk_kap3_perm_condition;
	information = dia_marduk_kap3_perm_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_marduk_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_marduk_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_00");	//Any news?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_01");	//Yes, Tthe enemy has succeeded in planting a traitor in our sacred halls.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_02");	//He has stolen the Eye of Innos, one of our most important artifacts. And that is only the tip of the iceberg.
	};
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_04");	//(concerned) The enemy has apparently already entered the city.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_15_05");	//What do you mean?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_06");	//One of the paladins, Lothar, was murdered in the street.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_05_07");	//(angry) In broad daylight! It has gone too far, but I fear that is only the beginning.
	Info_ClearChoices(dia_marduk_kap3_perm);
	Info_AddChoice(dia_marduk_kap3_perm,DIALOG_BACK,dia_marduk_kap3_perm_back);
	Info_AddChoice(dia_marduk_kap3_perm,"What's going to happen now?",dia_marduk_kap3_perm_andnow);
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Bennet is innocent.",dia_marduk_kap3_perm_bennetisnotguilty);
	}
	else
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Has the murderer been caught?",dia_marduk_kap3_perm_murderer);
	};
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		Info_AddChoice(dia_marduk_kap3_perm,"Where did the thief go?",dia_marduk_kap3_perm_thief);
	};
};

func void dia_marduk_kap3_perm_back()
{
	Info_ClearChoices(dia_marduk_kap3_perm);
};

func void dia_marduk_kap3_perm_andnow()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_00");	//What's going to happen now?
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_01");	//We will pursue the thief, no matter where. We will hunt him down and see to it that he receives his just punishment.
		AI_Output(other,self,"DIA_Marduk_Kap3_PERM_AndNow_15_02");	//For that, we would need to know first who the thief is.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_03");	//We will soon find out. And no matter how long it takes us, we shall find him.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_04");	//This I swear by Innos.
	}
	else
	{
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_05");	//A murder, moreover of a paladin, is without doubt one of the worst crimes there is.
		AI_Output(self,other,"DIA_Marduk_Kap3_PERM_AndNow_05_06");	//The murderer will undoubtedly be sentenced to death.
	};
};

func void dia_marduk_kap3_perm_bennetisnotguilty()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_00");	//Bennet is innocent. The witness lied.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_01");	//How do you know that?
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_15_02");	//I have found proof.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_BennetisNotGuilty_05_03");	//Sometimes I think that treason and greed are our greatest enemies.
};

func void dia_marduk_kap3_perm_murderer()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_00");	//Has the murderer been caught?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_01");	//Fortunately, yes. It was one of the cut-throats from Onar's farm.
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_Murderer_15_02");	//Who?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_Murderer_05_03");	//I don't know his name. But there are certainly a few figures among the mercenaries of whom you could expect such a deed.
};

func void dia_marduk_kap3_perm_thief()
{
	AI_Output(other,self,"DIA_Marduk_Kap3_PERM_thief_15_00");	//Where did the thief go?
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_01");	//I don't know that, he rushed to the gate like he was possessed and then disappeared.
	AI_Output(self,other,"DIA_Marduk_Kap3_PERM_thief_05_02");	//No matter where he hides, under what rock he crawls, the wrath of Innos will strike him and scorch his black soul.
};


instance DIA_MARDUK_KAP4_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap4_exit_condition;
	information = dia_marduk_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_marduk_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_KAP4U5_PERM(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 49;
	condition = dia_marduk_kap4u5_perm_condition;
	information = dia_marduk_kap4u5_perm_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_marduk_kap4u5_perm_condition()
{
	if((KAPITEL == 4) || (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_marduk_kap4u5_perm_info()
{
	AI_Output(other,self,"DIA_Marduk_Kap4U5_PERM_15_00");	//Any news?
	AI_Output(self,other,"DIA_Marduk_Kap4U5_PERM_05_01");	//No, alas not, the situation is still very critical.
};


instance DIA_MARDUK_KAP5_EXIT(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 999;
	condition = dia_marduk_kap5_exit_condition;
	information = dia_marduk_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marduk_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_marduk_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARDUK_PICKPOCKET(C_INFO)
{
	npc = kdf_505_marduk;
	nr = 900;
	condition = dia_marduk_pickpocket_condition;
	information = dia_marduk_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_marduk_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_marduk_pickpocket_info()
{
	Info_ClearChoices(dia_marduk_pickpocket);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_BACK,dia_marduk_pickpocket_back);
	Info_AddChoice(dia_marduk_pickpocket,DIALOG_PICKPOCKET,dia_marduk_pickpocket_doit);
};

func void dia_marduk_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marduk_pickpocket);
};

func void dia_marduk_pickpocket_back()
{
	Info_ClearChoices(dia_marduk_pickpocket);
};

