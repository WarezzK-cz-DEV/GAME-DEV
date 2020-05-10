
instance DIA_JESPER_EXIT(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 999;
	condition = dia_jesper_exit_condition;
	information = dia_jesper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jesper_exit_condition()
{
	return TRUE;
};

func void dia_jesper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JESPER_PICKPOCKET(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 900;
	condition = dia_jesper_pickpocket_condition;
	information = dia_jesper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_jesper_pickpocket_condition()
{
	return c_beklauen(80,180);
};

func void dia_jesper_pickpocket_info()
{
	Info_ClearChoices(dia_jesper_pickpocket);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_BACK,dia_jesper_pickpocket_back);
	Info_AddChoice(dia_jesper_pickpocket,DIALOG_PICKPOCKET,dia_jesper_pickpocket_doit);
};

func void dia_jesper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jesper_pickpocket);
};

func void dia_jesper_pickpocket_back()
{
	Info_ClearChoices(dia_jesper_pickpocket);
};


instance DIA_JESPER_HALLO(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_hallo_condition;
	information = dia_jesper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_hallo_condition()
{
	return TRUE;
};

func void dia_jesper_hallo_info()
{
	AI_Output(self,other,"DIA_Jesper_Hallo_09_00");	//Hey, what are you doing down here? There's nothing here for you.
	AI_Output(self,other,"DIA_Jesper_Hallo_09_01");	//So, out with it, what are you doing here?
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"I have come to kill you.",dia_jesper_hallo_kill);
	Info_AddChoice(dia_jesper_hallo,"I wanted to have a little look around.",dia_jesper_hallo_nurso);
	if(ATTILA_KEY == TRUE)
	{
		Info_AddChoice(dia_jesper_hallo,"Attila gave me a key...",dia_jesper_hallo_willkommen);
	}
	else
	{
		Info_AddChoice(dia_jesper_hallo,"I've done in Attila...",dia_jesper_hallo_umgelegt);
	};
	DG_GEFUNDEN = TRUE;
};

func void dia_jesper_hallo_kill()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Kill_15_00");	//I have come to kill you.
	AI_Output(self,other,"DIA_Jesper_Hallo_Kill_09_01");	//What a marvelous idea. Thought that up all by yourself, did you? Ah, so what. I'll make it short.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_attack(self,other,AR_NONE,1);
};

func void dia_jesper_hallo_nurso()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_NurSo_15_00");	//I wanted to have a little look around.
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_01");	//There's nothing here to look at. You're walking on dangerous ground, understand?
	AI_Output(self,other,"DIA_Jesper_Hallo_NurSo_09_02");	//So leave your weapon where it is and tell me why you're here.
};

func void dia_jesper_hallo_willkommen()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Willkommen_15_00");	//Attila gave me a key. That's why I'm here. So what do you want of me?
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_01");	//Wouldn't you like to know? Keep your cool.
	AI_Output(self,other,"DIA_Jesper_Hallo_Willkommen_09_02");	//Go see Cassia. You're expected.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};

func void dia_jesper_hallo_umgelegt()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Umgelegt_15_00");	//I've done in Attila. He had the key to the sewers on him.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_01");	//(disbelieving) YOU killed Attila?! (scornfully) So what, he was a lousy dog anyway.
	AI_Output(self,other,"DIA_Jesper_Hallo_Umgelegt_09_02");	//But I'll tell you something. If you attack me, I'll kill you.
	Info_ClearChoices(dia_jesper_hallo);
	Info_AddChoice(dia_jesper_hallo,"What are you doing here...",dia_jesper_hallo_was);
	Info_AddChoice(dia_jesper_hallo,"Take me to your leader.",dia_jesper_hallo_anfuehrer);
};

func void dia_jesper_hallo_was()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Was_15_00");	//What are you doing here in this dark, dank hole?
	AI_Output(self,other,"DIA_Jesper_Hallo_Was_09_01");	//(growls) I live here. One more stupid question and I'll cut a design in your hide.
};

func void dia_jesper_hallo_anfuehrer()
{
	AI_Output(other,self,"DIA_Jesper_Hallo_Anfuehrer_15_00");	//Take me to your leader.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_01");	//(laughs dirtily) HA - my leader? I'm sure Cassia will want to talk to you.
	AI_Output(self,other,"DIA_Jesper_Hallo_Anfuehrer_09_02");	//Go ahead - and don't try to fool me.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JESPER_BEZAHLEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 1;
	condition = dia_jesper_bezahlen_condition;
	information = dia_jesper_bezahlen_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_jesper_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (JESPER_TEACHSNEAK == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_bezahlen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_15_00");	//Can you teach me something?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_01");	//Sure, I'll show you how to sneak - free of charge for you.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_09_02");	//You want to learn how to move without making a sound? That'll cost you 100 gold pieces.
		b_say_gold(self,other,JESPER_COST);
		Info_ClearChoices(dia_jesper_bezahlen);
		Info_AddChoice(dia_jesper_bezahlen,"Maybe later...(BACK)",dia_jesper_bezahlen_spaeter);
		Info_AddChoice(dia_jesper_bezahlen,"OK, I want to learn how to sneak around (pay 100 gold).",dia_jesper_bezahlen_okay);
	};
};

func void dia_jesper_bezahlen_spaeter()
{
	Info_ClearChoices(dia_jesper_bezahlen);
};

func void dia_jesper_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_00");	//OK, I want to learn how to sneak.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Jesper_Bezahlen_Okay_15_01");	//Here's the gold.
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_02");	//So, then tell me when you're ready.
		JESPER_TEACHSNEAK = TRUE;
		Info_ClearChoices(dia_jesper_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Jesper_Bezahlen_Okay_09_03");	//You can't learn anything without gold.
		Info_ClearChoices(dia_jesper_bezahlen);
	};
};


instance DIA_JESPER_SCHLEICHEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_schleichen_condition;
	information = dia_jesper_schleichen_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me the art of stealth.",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1));
};


var int dia_jesper_schleichen_permanent;

func int dia_jesper_schleichen_condition()
{
	if((JESPER_TEACHSNEAK == TRUE) && (DIA_JESPER_SCHLEICHEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_jesper_schleichen_info()
{
	AI_Output(other,self,"DIA_Jesper_Schleichen_15_00");	//Teach me the art of sneaking.
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_01");	//Sneaking is essential for every thief. Above all, when you're moving around in somebody else's house.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_02");	//Don't just tramp on in like that. Most people sleep very lightly.
		AI_Output(self,other,"DIA_Jesper_Schleichen_09_03");	//Only when you sneak will no one hear you - and you can work unhindered.
		DIA_JESPER_SCHLEICHEN_PERMANENT = TRUE;
	};
};


instance DIA_JESPER_KILLER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 2;
	condition = dia_jesper_killer_condition;
	information = dia_jesper_killer_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jesper_killer_condition()
{
	if(Npc_IsDead(cassia) || Npc_IsDead(ramirez))
	{
		return TRUE;
	};
};

func void dia_jesper_killer_info()
{
	if(Npc_IsDead(cassia) && Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_00");	//You killed my friends. Why did you do that, you murderer?
		AI_Output(self,other,"DIA_Jesper_Killer_09_01");	//I'll send you to Beliar's realm.
	}
	else if(Npc_IsDead(cassia))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_02");	//You killed Cassia, you dirty murderer. But you won't get past me!
	}
	else if(Npc_IsDead(ramirez))
	{
		AI_Output(self,other,"DIA_Jesper_Killer_09_03");	//I've done more things for Ramirez and collected more cash than you'll ever see.
		AI_Output(self,other,"DIA_Jesper_Killer_09_04");	//And you just killed him, you filthy dog! It's time to pay the piper!
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_JESPER_BOGEN(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_bogen_condition;
	information = dia_jesper_bogen_info;
	permanent = FALSE;
	description = "Say, would you know anything about Bosper's bow?";
};


func int dia_jesper_bogen_condition()
{
	if((Npc_HasItems(other,itrw_bow_l_03_mis) < 1) && (MIS_BOSPER_BOGEN == LOG_RUNNING) && (JOIN_THIEFS == TRUE))
	{
		return TRUE;
	};
};

func void dia_jesper_bogen_info()
{
	AI_Output(other,self,"DIA_Jesper_Bogen_15_00");	//Say, would you know anything about Bosper's bow?
	AI_Output(self,other,"DIA_Jesper_Bogen_09_01");	//You mean the bow from the bowmaker? Yeah, I've got it packed somewhere up front in a chest.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_02");	//But there's rats scurrying around there. You can fetch it, if the critters don't bother you.
	AI_Output(self,other,"DIA_Jesper_Bogen_09_03");	//Oh, well of course the chest is locked. You just have to break into it. (grins) Hopefully, you still have lock picks.
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(giant_rat,"NW_CITY_KANAL_ROOM_01_03");
};


instance DIA_JESPER_TUER(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_tuer_condition;
	information = dia_jesper_tuer_info;
	permanent = FALSE;
	description = "What's behind that locked door?";
};


func int dia_jesper_tuer_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_jesper_tuer_info()
{
	AI_Output(other,self,"DIA_Jesper_Tuer_15_00");	//What's behind that locked door?
	AI_Output(self,other,"DIA_Jesper_Tuer_09_01");	//(grins) Behind that is the chest - the chest of the master lock picker. Fingers.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_02");	//He put such an unbelievably complicated lock on it that, till now, no one has been able to open it.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_03");	//Unfortunately, he got nabbed - they tossed him through the Barrier, where he probably died.
	AI_Output(self,other,"DIA_Jesper_Tuer_09_04");	//But if you want to try opening the chest, here's the key to the room.
	b_giveinvitems(self,other,itke_fingers,1);
};


instance DIA_JESPER_TRUHE(C_INFO)
{
	npc = vlk_446_jesper;
	nr = 10;
	condition = dia_jesper_truhe_condition;
	information = dia_jesper_truhe_info;
	permanent = FALSE;
	description = "I managed to open the chest.";
};


func int dia_jesper_truhe_condition()
{
	if((Mob_HasItems("MOB_FINGERS",itmi_gold) < 300) || (Mob_HasItems("MOB_FINGERS",itmi_silvercup) < 5) || (Mob_HasItems("MOB_FINGERS",itmi_goldcup) < 1) || (Mob_HasItems("MOB_FINGERS",itam_strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",itpo_perm_dex) < 1))
	{
		return TRUE;
	};
};

func void dia_jesper_truhe_info()
{
	AI_Output(other,self,"DIA_Jesper_Truhe_15_00");	//I managed to open the chest.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_01");	//That's impossible! It looks like we've got a new master lock picker.
	AI_Output(self,other,"DIA_Jesper_Truhe_09_02");	//Congratulations on this accomplishment.
	b_giveplayerxp(XP_JESPERTRUHE);
};

