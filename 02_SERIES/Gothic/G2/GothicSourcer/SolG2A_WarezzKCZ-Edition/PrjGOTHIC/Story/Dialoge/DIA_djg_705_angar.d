
instance DIA_ANGARDJG_EXIT(C_INFO)
{
	npc = djg_705_angar;
	nr = 999;
	condition = dia_angardjg_exit_condition;
	information = dia_angardjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angardjg_exit_condition()
{
	return TRUE;
};

func void dia_angardjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_HALLO(C_INFO)
{
	npc = djg_705_angar;
	nr = 5;
	condition = dia_angardjg_hallo_condition;
	information = dia_angardjg_hallo_info;
	description = "Don't I know you?";
};


func int dia_angardjg_hallo_condition()
{
	return TRUE;
};

func void dia_angardjg_hallo_info()
{
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_00");	//Don't I know you? You are Cor Angar. You used to be a templar in the swamp camp.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_01");	//(resigned) Call me Angar. I have set aside my title. The Brotherhood of the Sleeper has disbanded.
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_02");	//Curious, but you seem somehow familiar to me. Yet, I cannot quite recall you.
	AI_Output(other,self,"DIA_AngarDJG_HALLO_15_03");	//What's the matter with you?
	AI_Output(self,other,"DIA_AngarDJG_HALLO_04_04");	//(dismissively) Oh. I haven't been able to sleep properly for some time. These constant nightmares.
	b_logentry(TOPIC_DRAGONHUNTER,"I found Angar in the Valley of Mines.");
};

func void b_sctellsangaraboutmadpsi()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00");	//The Brotherhood of the Sleeper has been enslaved by evil.
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01");	//Your former friends from the swamp camp roam the land wearing black robes and feeling really irritated by anything that moves.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02");	//What are you talking about?
	};
};

func void b_sctellsangaraboutmadpsi2()
{
	if(ANGAR_KNOWSMADPSI == FALSE)
	{
		AI_Output(other,self,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00");	//They serve the enemy now and are nothing but soulless warriors of evil.
		AI_Output(self,other,"DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01");	//By all the gods. Would that I had not allowed myself to be blinded so. That will never happen to me again, that I swear.
		b_giveplayerxp(XP_ANGAR_KNOWSMADPSI);
		ANGAR_KNOWSMADPSI = TRUE;
	};
};


instance DIA_ANGAR_WIEKOMMSTDUHIERHER(C_INFO)
{
	npc = djg_705_angar;
	nr = 6;
	condition = dia_angar_wiekommstduhierher_condition;
	information = dia_angar_wiekommstduhierher_info;
	description = "How did you get here?";
};


func int dia_angar_wiekommstduhierher_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_hallo))
	{
		return TRUE;
	};
};

func void dia_angar_wiekommstduhierher_info()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_15_00");	//How did you get here?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_01");	//After the collapse of the magic barrier, I hid myself in the mountains. It became time for me to do something.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_02");	//I strayed about for days, until I suddenly awoke in the castle. Do not ask me what happened. I don't know.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_04_03");	//To make matters worse, I have also lost the amulet which I have had for years. I shall go mad if I do not find it again.
	Log_CreateTopic(TOPIC_ANGARSAMULETT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ANGARSAMULETT,LOG_RUNNING);
	b_logentry(TOPIC_ANGARSAMULETT,"Angar lost his amulet and is now desperately trying to find it.");
	Info_AddChoice(dia_angar_wiekommstduhierher,DIALOG_BACK,dia_angar_wiekommstduhierher_gehen);
	Info_AddChoice(dia_angar_wiekommstduhierher,"Where exactly did you lose your amulet?",dia_angar_wiekommstduhierher_amulett);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"The Brotherhood of the Sleeper has been enslaved by evil.",dia_angar_wiekommstduhierher_andere);
	}
	else
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"What happened to the others from the swamp camp?",dia_angar_wiekommstduhierher_andere);
	};
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_wiekommstduhierher,"What will you do next?",dia_angar_wiekommstduhierher_nun);
	};
};

func void dia_angar_wiekommstduhierher_amulett()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00");	//Where exactly did you lose your amulet?
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01");	//Somewhere in the south, shortly before I awoke here in the castle.
		b_logentry(TOPIC_ANGARSAMULETT,"The amulet is supposed to be somewhere in the south. Angar's going to go looking for it.");
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02");	//It must be here somewhere.
		b_logentry(TOPIC_ANGARSAMULETT,"The amulet is near a rock tomb in the south of the Valley of Mines.");
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03");	//I suspect it was stolen. I absolutely must have it back.
};

func void dia_angar_wiekommstduhierher_andere()
{
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi();
	}
	else
	{
		AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00");	//What happened to the others from the swamp camp?
	};
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01");	//The last thing I remember is that the Barrier collapsed, accompanied by a nerve-shattering scream.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02");	//Stricken with panicked fear, we fell to the ground, writhing in pain. That voice. It grew ever louder.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03");	//And then when it was over, they all ran mad and disappeared into the bleak night, screaming loudly.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04");	//I have not seen them again.
	if(SC_KNOWSMADPSI == TRUE)
	{
		b_sctellsangaraboutmadpsi2();
	};
};

func void dia_angar_wiekommstduhierher_nun()
{
	AI_Output(other,self,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00");	//What will you do next?
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01");	//I shall rest a while first, so that I may take up the search for my lost amulet.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02");	//I have heard something of dragons.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03");	//It is also being said that many warriors have come to the Valley of Mines to hunt them.
	AI_Output(self,other,"DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04");	//I am thinking of joining them.
	ANGAR_WILLDJGWERDEN = TRUE;
};

func void dia_angar_wiekommstduhierher_gehen()
{
	Info_ClearChoices(dia_angar_wiekommstduhierher);
};


instance DIA_ANGAR_SCTELLSANGARABOUTMADPSI2(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_sctellsangaraboutmadpsi2_condition;
	information = dia_angar_sctellsangaraboutmadpsi2_info;
	description = "The Brotherhood of the Sleeper has been enslaved by evil.";
};


func int dia_angar_sctellsangaraboutmadpsi2_condition()
{
	if((SC_KNOWSMADPSI == TRUE) && (ANGAR_KNOWSMADPSI == FALSE) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void dia_angar_sctellsangaraboutmadpsi2_info()
{
	b_sctellsangaraboutmadpsi();
	b_sctellsangaraboutmadpsi2();
};


instance DIA_ANGAR_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar;
	nr = 7;
	condition = dia_angar_foundamulett_condition;
	information = dia_angar_foundamulett_info;
	description = "I found your amulet.";
};


func int dia_angar_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher))
	{
		return TRUE;
	};
};

func void b_angarsamulettabgeben()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_15_00");	//I found your amulet.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_04_01");	//Thank you. I thought I would never see it again.
	b_giveinvitems(other,self,itam_mana_angar_mis,1);
	DJG_ANGARGOTAMULETT = TRUE;
	b_giveplayerxp(XP_ANGARDJGUNDEADMAGE);
};

func void dia_angar_foundamulett_info()
{
	b_angarsamulettabgeben();
	Info_AddChoice(dia_angar_foundamulett,"What makes it so special for you?",dia_angar_foundamulett_besonders);
	Info_AddChoice(dia_angar_foundamulett,"What are you planning to do now?",dia_angar_foundamulett_nun);
};

func void dia_angar_foundamulett_besonders()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_00");	//What makes it so special for you?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_besonders_04_01");	//It was a gift.
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//I see.
};

func void dia_angar_foundamulett_nun()
{
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_nun_15_00");	//What are you planning to do now?
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_01");	//Get out of this accursed valley.
	AI_Output(self,other,"DIA_Angar_FOUNDAMULETT_nun_04_02");	//Perhaps we shall meet again. Farewell.
	AI_StopProcessInfos(self);
	if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
	{
		Npc_ExchangeRoutine(self,"LeavingOW");
	};
};


instance DIA_ANGAR_DJG_ANWERBEN(C_INFO)
{
	npc = djg_705_angar;
	nr = 8;
	condition = dia_angar_djg_anwerben_condition;
	information = dia_angar_djg_anwerben_info;
	description = "Maybe I can help you find your amulet.";
};


func int dia_angar_djg_anwerben_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_djg_anwerben_info()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_15_00");	//Maybe I can help you find your amulet.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_04_01");	//Why not. Some help cannot hurt.
	if(DJG_ANGAR_SENTTOSTONES == FALSE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"I've got to go.",dia_angar_djg_anwerben_gehen);
		Info_AddChoice(dia_angar_djg_anwerben,"Where do you want to look?",dia_angar_djg_anwerben_wo);
		Info_AddChoice(dia_angar_djg_anwerben,"When will you go?",dia_angar_djg_anwerben_wann);
	};
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angar_djg_anwerben,"What about the Dragon hunters?",dia_angar_djg_anwerben_djg);
	};
};

func void dia_angar_djg_anwerben_djg()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_DJG_15_00");	//What about the Dragon hunters?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_DJG_04_01");	//I will speak with them later. Maybe they can use a strong arm.
};

func void dia_angar_djg_anwerben_wann()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wann_15_00");	//When will you go?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wann_04_01");	//As soon as I feel better.
};

func void dia_angar_djg_anwerben_wo()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_wo_15_00");	//Where do you want to look?
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_01");	//I shall go to the south, where I was last.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_wo_04_02");	//There is a cave tomb there, surrounded by many boulders.
};

func void dia_angar_djg_anwerben_gehen()
{
	AI_Output(other,self,"DIA_Angar_DJG_ANWERBEN_gehen_15_00");	//I've got to go.
	AI_Output(self,other,"DIA_Angar_DJG_ANWERBEN_gehen_04_01");	//Watch your back.
	AI_StopProcessInfos(self);
};


instance DIA_ANGARDJG_WASMACHSTDU(C_INFO)
{
	npc = djg_705_angar;
	nr = 9;
	condition = dia_angardjg_wasmachstdu_condition;
	information = dia_angardjg_wasmachstdu_info;
	description = "Is something wrong?";
};


func int dia_angardjg_wasmachstdu_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,dia_angar_djg_anwerben) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_00");	//Is something wrong?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_01");	//Do you hear that? Never in my life have I heard such a dreadful noise!
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_15_02");	//What do you mean? I don't hear a thing!
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_03");	//The whole area here stinks of death and destruction. The putrid creatures guard the rocky entrance to the crypt in front of us.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_04");	//Something ghastly is concealing itself in there and sending its henchmen to the surface of this world.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_04_05");	//I am almost certain that my amulet was lost somewhere here.
	if(ANGAR_WILLDJGWERDEN == TRUE)
	{
		Info_AddChoice(dia_angardjg_wasmachstdu,"Have you talked to the Dragon hunters?",dia_angardjg_wasmachstdu_djg);
	};
};

func void dia_angardjg_wasmachstdu_djg()
{
	AI_Output(other,self,"DIA_AngarDJG_WASMACHSTDU_DJG_15_00");	//Have you talked to the Dragon hunters?
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_01");	//Yes. But I had expected a fellowship like the one we had in the Swamp Camp.
	AI_Output(self,other,"DIA_AngarDJG_WASMACHSTDU_DJG_04_02");	//The boys are nothing but a wild, motley collection of idiots. It's nothing for me.
};


instance DIA_ANGARDJG_WHATSINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 10;
	condition = dia_angardjg_whatsinthere_condition;
	information = dia_angardjg_whatsinthere_info;
	description = "What's hiding in the cave in the rocks?";
};


func int dia_angardjg_whatsinthere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_wasmachstdu) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_whatsinthere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WHATSINTHERE_15_00");	//What's hiding in the cave in the rocks?
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_01");	//Something will not let me get close to the entrance!
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_02");	//It is guarded by a magical creature. I have seen it at night, searching the area. A disgusting thing.
	AI_Output(self,other,"DIA_AngarDJG_WHATSINTHERE_04_03");	//It glides back and forth between the trees, and you get the impression that it sucks up all life in its surroundings like a sponge.
	b_logentry(TOPIC_DRAGONHUNTER,"I found Angar in the Valley of Mines.");
};


instance DIA_ANGARDJG_WANTTOGOINTHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 11;
	condition = dia_angardjg_wanttogointhere_condition;
	information = dia_angardjg_wanttogointhere_info;
	description = "Let's go together.";
};


func int dia_angardjg_wanttogointhere_condition()
{
	if(Npc_KnowsInfo(other,dia_angardjg_whatsinthere) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angardjg_wanttogointhere_info()
{
	AI_Output(other,self,"DIA_AngarDJG_WANTTOGOINTHERE_15_00");	//Let's go together.
	AI_Output(self,other,"DIA_AngarDJG_WANTTOGOINTHERE_04_01");	//I shall try it. But be careful.
	AI_StopProcessInfos(self);
	if(Npc_IsDead(skeletonmage_angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_ANGARANGRIFF = TRUE;
	};
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ANGARDJG_UNDEADMAGEDEAD(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagedead_condition;
	information = dia_angardjg_undeadmagedead_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagedead_condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_ANGARANGRIFF == TRUE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagedead_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UndeadMageDead_04_00");	//(bellows) Only death and destruction. I must get out of here.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_ANGARDJG_UNDEADMAGECOMES(C_INFO)
{
	npc = djg_705_angar;
	nr = 13;
	condition = dia_angardjg_undeadmagecomes_condition;
	information = dia_angardjg_undeadmagecomes_info;
	important = TRUE;
};


func int dia_angardjg_undeadmagecomes_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_13") < 500) && Npc_KnowsInfo(other,dia_angardjg_wanttogointhere) && (Npc_KnowsInfo(other,dia_angardjg_undeadmagedead) == FALSE) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angardjg_undeadmagecomes_info()
{
	AI_Output(self,other,"DIA_AngarDJG_UNDEADMAGECOMES_04_00");	//(whispers) There it is! Do you hear that?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_ANGAR_WASISTLOS(C_INFO)
{
	npc = djg_705_angar;
	nr = 14;
	condition = dia_angar_wasistlos_condition;
	information = dia_angar_wasistlos_info;
	description = "What's the matter?";
};


func int dia_angar_wasistlos_condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_ANGARGOTAMULETT == FALSE) && Npc_IsDead(skeletonmage_angar))
	{
		return TRUE;
	};
};

func void dia_angar_wasistlos_info()
{
	AI_Output(other,self,"DIA_Angar_WASISTLOS_15_00");	//What's the matter?
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_01");	//I cannot go farther with you.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_02");	//Something tells me that I will never get out of here alive.
	AI_Output(self,other,"DIA_Angar_WASISTLOS_04_03");	//I can't explain it, but...
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_04");	//I have to get out of this accursed land as quickly as possible, otherwise I'm going to suffer the same fate as my brethren.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_WASISTLOS_04_05");	//Every time I face one of these... hellspawn, I have the feeling that I am fighting my own people.
	};
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_DRAGONHUNTER,"Angar just walked off. With all these undead he gets the feeling he's fighting his own people.");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_ANGAR_WHYAREYOUHERE(C_INFO)
{
	npc = djg_705_angar;
	nr = 15;
	condition = dia_angar_whyareyouhere_condition;
	information = dia_angar_whyareyouhere_info;
	description = "Angar? What are you doing here?";
};


func int dia_angar_whyareyouhere_condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void dia_angar_whyareyouhere_info()
{
	AI_Output(other,self,"DIA_Angar_WHYAREYOUHERE_15_00");	//Angar? What are you doing here?
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_01");	//I was on my way to the pass when I bumped into the orcs. I couldn't shake off the god-forsaken brutes.
	AI_Output(self,other,"DIA_Angar_WHYAREYOUHERE_04_02");	//I'll wait a while and then move across the pass. I'll see you on the other side!
	b_logentry(TOPIC_DRAGONHUNTER,"I met Angar again, he's still stuck in the Valley of Mines.");
	b_giveplayerxp(XP_ANGARDJGAGAIN);
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PERMKAP4(C_INFO)
{
	npc = djg_705_angar;
	condition = dia_angar_permkap4_condition;
	information = dia_angar_permkap4_info;
	permanent = TRUE;
	description = "I don't like to leave you alone!";
};


func int dia_angar_permkap4_condition()
{
	if(Npc_KnowsInfo(other,dia_angar_whyareyouhere))
	{
		return TRUE;
	};
};

func void dia_angar_permkap4_info()
{
	AI_Output(other,self,"DIA_Angar_PERMKAP4_15_00");	//I don't like to leave you alone!
	AI_Output(self,other,"DIA_Angar_PERMKAP4_04_01");	//Sure. Off you go. I'll see you.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar;
	nr = 900;
	condition = dia_angar_pickpocket_condition;
	information = dia_angar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_pickpocket_condition()
{
	return c_beklauen(47,55);
};

func void dia_angar_pickpocket_info()
{
	Info_ClearChoices(dia_angar_pickpocket);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_BACK,dia_angar_pickpocket_back);
	Info_AddChoice(dia_angar_pickpocket,DIALOG_PICKPOCKET,dia_angar_pickpocket_doit);
};

func void dia_angar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_pickpocket);
};

func void dia_angar_pickpocket_back()
{
	Info_ClearChoices(dia_angar_pickpocket);
};

