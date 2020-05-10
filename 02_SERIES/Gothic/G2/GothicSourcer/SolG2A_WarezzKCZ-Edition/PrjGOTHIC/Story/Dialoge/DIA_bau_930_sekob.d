
instance DIA_SEKOB_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_exit_condition;
	information = dia_sekob_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_sekob_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_HALLO(C_INFO)
{
	npc = bau_930_sekob;
	nr = 3;
	condition = dia_sekob_hallo_condition;
	information = dia_sekob_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sekob_hallo_condition()
{
	if((KAPITEL < 3) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_hallo_info()
{
	AI_Output(self,other,"DIA_Sekob_HALLO_01_00");	//What are you doing on my land? There's nothing here to steal. Clear off.
	AI_Output(other,self,"DIA_Sekob_HALLO_15_01");	//Isn't there a piece of land in this blasted country that doesn't belong to anyone?
	AI_Output(self,other,"DIA_Sekob_HALLO_01_02");	//Go to work, then maybe some day you can call a piece of land your own. But until then, kindly loaf around somewhere else.
};


instance DIA_SEKOB_PERMVORMIS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 3;
	condition = dia_sekob_permvormis_condition;
	information = dia_sekob_permvormis_info;
	permanent = TRUE;
	description = "Listen...";
};


func int dia_sekob_permvormis_condition()
{
	if((KAPITEL < 3) && (MIS_TORLOF_HOLPACHTVONSEKOB == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_permvormis_info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//Listen...
	AI_Output(self,other,"DIA_Sekob_PermVorMis_01_01");	//I don't have any work for you at the moment. Now go!
};


instance DIA_SEKOB_ZAHLPACHT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_zahlpacht_condition;
	information = dia_sekob_zahlpacht_info;
	permanent = FALSE;
	description = "Onar wants you to pay your rent at last.";
};


func int dia_sekob_zahlpacht_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_sekob_zahlpacht_info()
{
	AI_Output(other,self,"DIA_Sekob_ZAHLPACHT_15_00");	//This land belongs to the big farmer. You're only the tenant here. Onar wants you to pay your rent at last. You're several weeks behind.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_01");	//What? And he sent a villain like you? Not even you believe that.
	AI_Output(self,other,"DIA_Sekob_ZAHLPACHT_01_02");	//Get out of here before I forget myself.
	self.aivar[AIV_DEFEATEDBYPLAYER] = FALSE;
};


instance DIA_SEKOB_KOHLERAUS(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_kohleraus_condition;
	information = dia_sekob_kohleraus_info;
	permanent = TRUE;
	description = "Fork over the dough, or I'll bash in your teeth.";
};


func int dia_sekob_kohleraus_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_kohleraus_info()
{
	AI_Output(other,self,"DIA_Sekob_KohleRaus_15_00");	//Fork over the dough, or I'll bash in your teeth.
	AI_Output(self,other,"DIA_Sekob_KohleRaus_01_01");	//You're not going after my purse, you criminal. NOT YOU!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SEKOB_INFORMONAR(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_informonar_condition;
	information = dia_sekob_informonar_info;
	permanent = FALSE;
	description = "I guess I'll have to tell Onar about this, then.";
};


func int dia_sekob_informonar_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_informonar_info()
{
	AI_Output(other,self,"DIA_Sekob_InformOnar_15_00");	//I guess I'll have to tell Onar about this, then.
	AI_Output(self,other,"DIA_Sekob_InformOnar_01_01");	//I don't care! You can tell Onar I don't have anything. That's the sad truth.
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_DEFEATED(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_defeated_condition;
	information = dia_sekob_defeated_info;
	permanent = FALSE;
	description = "Where do you have the money!?!";
};


func int dia_sekob_defeated_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) && Npc_KnowsInfo(other,dia_sekob_zahlpacht) && (SEKOB_PACHTBEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_defeated_info()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_15_00");	//Where do you have the money!?!
	AI_Output(self,other,"DIA_Sekob_Defeated_01_01");	//Don't hit me again, please. I'll do whatever you say.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Pay your rent, then.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_03");	//(whining) But sir, I don't have anything. I'm just a poor wretch, and half-starved.
	AI_Output(self,other,"DIA_Sekob_Defeated_01_04");	//My last harvest dried up completely. I WANT to pay my rent, but I just don't HAVE anything. Have pity.
	Info_ClearChoices(dia_sekob_defeated);
	Info_AddChoice(dia_sekob_defeated,"Pay your rent, now, or I'll kill you.",dia_sekob_defeated_hart);
	Info_AddChoice(dia_sekob_defeated,"All right, I'll talk to Onar.",dia_sekob_defeated_weich);
};

func void dia_sekob_defeated_weich()
{
	AI_Output(other,self,"DIA_Sekob_Defeated_weich_15_00");	//All right, I'll talk to Onar.
	AI_Output(self,other,"DIA_Sekob_Defeated_weich_01_01");	//Thank you, sir. Thank you a thousand times!
	MIS_SEKOB_REDEMITONAR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};

func void b_sekob_kassieren()
{
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_00");	//Cut out that piffle. It rains here all the time, and your larders are full. Pay your rent, now, or I'll kill you.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_01");	//(obsequious) No, please, here take the gold. I'll even add a bonus if you let me live.
	b_giveinvitems(self,other,itmi_gold,60);
	AI_Output(other,self,"DIA_Sekob_Kassieren_15_02");	//See, that wasn't so hard.
	AI_Output(self,other,"DIA_Sekob_Kassieren_01_03");	//(despairing) I'm ruined.
	SEKOB_PACHTBEZAHLT = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_sekob_defeated_hart()
{
	b_sekob_kassieren();
};


instance DIA_SEKOB_AGAIN(C_INFO)
{
	npc = bau_930_sekob;
	nr = 5;
	condition = dia_sekob_again_condition;
	information = dia_sekob_again_info;
	permanent = TRUE;
	description = "About your rent...";
};


func int dia_sekob_again_condition()
{
	if((MIS_SEKOB_REDEMITONAR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_sekob_defeated) && (SEKOB_PACHTBEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_again_info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//About your rent...
	AI_Output(self,other,"DIA_Sekob_Again_01_01");	//You'll talk to Onar, right?
	Info_ClearChoices(dia_sekob_again);
	Info_AddChoice(dia_sekob_again,"I changed my mind.",dia_sekob_again_nein);
	if(ONAR_WEGENSEKOB == TRUE)
	{
		Info_AddChoice(dia_sekob_again,"I did that...",dia_sekob_again_verarscht);
	}
	else
	{
		Info_AddChoice(dia_sekob_again,"Sure.",dia_sekob_again_ja);
	};
};

func void dia_sekob_again_nein()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//I changed my mind.
	b_sekob_kassieren();
};

func void dia_sekob_again_ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Sure.
	AI_Output(self,other,"DIA_Sekob_Again_Ja_01_01");	//You can do it.
	AI_StopProcessInfos(self);
};

func void dia_sekob_again_verarscht()
{
	MIS_SEKOB_REDEMITONAR = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//I did that...
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_01");	//And? What did he say?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_02");	//I'm sorry, but I'll be forced to tear off your head now.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_03");	//But why? What have I done?
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_04");	//You've been putting me on.
	AI_Output(self,other,"DIA_Sekob_Again_verarscht_01_05");	//I told the truth - honest!
	b_sekob_kassieren();
};


instance DIA_SEKOB_PERMKAP1(C_INFO)
{
	npc = bau_930_sekob;
	nr = 6;
	condition = dia_sekob_permkap1_condition;
	information = dia_sekob_permkap1_info;
	permanent = TRUE;
	description = "The next time you'll pay on time, understand?";
};


func int dia_sekob_permkap1_condition()
{
	if((SEKOB_PACHTBEZAHLT == TRUE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_sekob_permkap1_info()
{
	AI_Output(other,self,"DIA_Sekob_PERMKAP1_15_00");	//The next time you'll pay on time, understand?
	AI_Output(self,other,"DIA_Sekob_PERMKAP1_01_01");	//(to himself) What did I do to deserve this...
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_KAP3_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap3_exit_condition;
	information = dia_sekob_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_sekob_kap3_exit_info()
{
	self.flags = 0;
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_DMT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 30;
	condition = dia_sekob_dmt_condition;
	information = dia_sekob_dmt_info;
	description = "Did something happen?";
};


func int dia_sekob_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_sekob_dmt_info()
{
	AI_Output(other,self,"DIA_Sekob_DMT_15_00");	//Did something happen?
	AI_Output(self,other,"DIA_Sekob_DMT_01_01");	//You've got to help me. The black robes have invaded my house.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_02");	//You royal guard people are supposed to take care of everyone's well-being, right?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_03");	//I know you mercenaries aren't big on charity, but I would pay you.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04");	//You have to help me, worthy Sir Magician.
	};
	AI_Output(self,other,"DIA_Sekob_DMT_01_05");	//Those fellows said they were looking for something. But surely not in my house.
	AI_Output(self,other,"DIA_Sekob_DMT_01_06");	//Please, help me. Make them go away again.
	Log_CreateTopic(TOPIC_SEKOBDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SEKOBDMT,LOG_RUNNING);
	b_logentry(TOPIC_SEKOBDMT,"The black mages have driven Sekob from his house. Sekob wants me to drive them out now.");
};


instance DIA_SEKOB_DMTWEG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 31;
	condition = dia_sekob_dmtweg_condition;
	information = dia_sekob_dmtweg_info;
	description = "Your house is empty. The black hoods have left.";
};


func int dia_sekob_dmtweg_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_sekob_dmt) && Npc_IsDead(dmt_dementorambientsekob1) && Npc_IsDead(dmt_dementorambientsekob2) && Npc_IsDead(dmt_dementorambientsekob3) && Npc_IsDead(dmt_dementorambientsekob4))
	{
		return TRUE;
	};
};

func void dia_sekob_dmtweg_info()
{
	AI_Output(other,self,"DIA_Sekob_DMTWEG_15_00");	//Your house is empty. The black hoods have left.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_01");	//I knew that the guard could be counted on.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_02");	//You did a great job. Onar can count himself lucky to have people like you on his side.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Sekob_DMTWEG_01_03");	//Thank you, worthy Sir Magician. What would become of us without the protective hand of the clergy?
	};
	TOPIC_END_SEKOBDMT = TRUE;
	b_giveplayerxp(XP_SEKOBDMTWEG);
	if(KAPITEL < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(ROSI_FLEEFROMSEKOB_KAP5 == FALSE)
	{
		b_startotherroutine(rosi,"Start");
		b_startotherroutine(till,"Start");
	};
	b_startotherroutine(balthasar,"Start");
	b_startotherroutine(bau_933_rega,"Start");
	b_startotherroutine(bau_934_babera,"Start");
	b_startotherroutine(bau_937_bauer,"Start");
	b_startotherroutine(bau_938_bauer,"Start");
};


instance DIA_SEKOB_BELOHNUNG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 32;
	condition = dia_sekob_belohnung_condition;
	information = dia_sekob_belohnung_info;
	description = "Not so fast, my friend.";
};


func int dia_sekob_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_dmtweg) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_sekob_belohnung_info()
{
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_00");	//Not so fast, my friend.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(Npc_KnowsInfo(other,dia_rosi_wasmachstdu))
		{
			AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_01");	//From now on, you're going to abandon your dirty deals and act for the common good instead, or I'll be back.
		};
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_02");	//I don't understand. What else do you want?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_03");	//You were babbling about a reward, weren't you? Or was I just hearing things?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_04");	//I'm only interested in one thing. What did the black hoods want in your house?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_05");	//I can't explain it myself, honorable Sir Magician. Perhaps it has...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//What?
		AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_07");	//I'm sorry. I swore several years ago never to speak of it, and I don't plan to break my oath.
	};
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_08");	//All that I can do is give you a bit of gold and ask you to spare me.
	AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_09");	//Give it here, then. I'm in a hurry.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//Here.
	CreateInvItems(self,itmi_gold,250);
	b_giveinvitems(self,other,itmi_gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_PERM(C_INFO)
{
	npc = bau_930_sekob;
	nr = 80;
	condition = dia_sekob_perm_condition;
	information = dia_sekob_perm_info;
	permanent = TRUE;
	description = "Has anything happened in the meantime?";
};


func int dia_sekob_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_sekob_belohnung) && (KAPITEL >= 3) && (NPCOBSESSEDBYDMT_SEKOB == FALSE))
	{
		return TRUE;
	};
};

func void dia_sekob_perm_info()
{
	if((hero.guild == GIL_KDF) && (KAPITEL >= 5))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Sekob_PERM_15_00");	//Has anything happened in the meantime?
		if(MIS_BRINGROSIBACKTOSEKOB == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Beat it.
		}
		else if(MIS_BRINGROSIBACKTOSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_02");	//No. Nothing special.
		}
		else if((KAPITEL >= 5) && (MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_03");	//My wife has disappeared. At first I didn't notice it at all, and suddenly she was gone.
			AI_Output(self,other,"DIA_Sekob_PERM_01_04");	//I suspect she fled to the woods to get away from the field raiders.
			AI_Output(self,other,"DIA_Sekob_PERM_01_05");	//Do me a favor, if you find her, bring her back to me safe and sound.
			MIS_BRINGROSIBACKTOSEKOB = LOG_RUNNING;
			Log_CreateTopic(TOPIC_BRINGROSIBACKTOSEKOB,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_BRINGROSIBACKTOSEKOB,LOG_RUNNING);
			b_logentry(TOPIC_BRINGROSIBACKTOSEKOB,"Sekob's wife Rosi has vanished. Sekob wants her back.");
		}
		else
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_06");	//Nothing since those scoundrels in black were in my house.
		};
	};
};


instance DIA_SEKOB_KAP4_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap4_exit_condition;
	information = dia_sekob_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_sekob_kap4_exit_info()
{
	self.flags = 0;
	AI_StopProcessInfos(self);
};


instance DIA_SEKOB_KAP5_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap5_exit_condition;
	information = dia_sekob_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_sekob_kap5_exit_info()
{
	self.flags = 0;
	b_npcclearobsessionbydmt(self);
};


instance DIA_SEKOB_HEILUNG(C_INFO)
{
	npc = bau_930_sekob;
	nr = 55;
	condition = dia_sekob_heilung_condition;
	information = dia_sekob_heilung_info;
	permanent = TRUE;
	description = "You've got a problem.";
};


func int dia_sekob_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_SEKOB == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};


var int dia_sekob_heilung_onetime;

func void dia_sekob_heilung_info()
{
	AI_Output(other,self,"DIA_Sekob_Heilung_15_00");	//You've got a problem.
	if(DIA_SEKOB_HEILUNG_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_01");	//Yeah, that's right. YOU are my problem, filthy magician. Just go away, otherwise I'll skin you alive.
		AI_Output(other,self,"DIA_Sekob_Heilung_15_02");	//(to himself) A difficult case.
		b_npcclearobsessionbydmt(self);
		DIA_SEKOB_HEILUNG_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Sekob_Heilung_01_03");	//You just won't listen, will you?
		AI_Output(other,self,"DIA_Sekob_Heilung_15_04");	//(to himself) A hopeless case.
		b_npcclearobsessionbydmt(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_SEKOB_ROSIBACKATSEKOB(C_INFO)
{
	npc = bau_930_sekob;
	nr = 53;
	condition = dia_sekob_rosibackatsekob_condition;
	information = dia_sekob_rosibackatsekob_info;
	description = "I'm bringing back your wife.";
};


func int dia_sekob_rosibackatsekob_condition()
{
	if((KAPITEL >= 5) && (hero.guild != GIL_KDF) && (Npc_GetDistToWP(rosi,"NW_FARM4_SEKOB") < 3000) && (MIS_BRINGROSIBACKTOSEKOB == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_sekob_rosibackatsekob_info()
{
	AI_Output(other,self,"DIA_Sekob_ROSIBACKATSEKOB_15_00");	//I'm bringing back your wife.
	AI_Output(self,other,"DIA_Sekob_ROSIBACKATSEKOB_01_01");	//That's wonderful. Here, take this for your trouble.
	MIS_BRINGROSIBACKTOSEKOB = LOG_SUCCESS;
	CreateInvItems(self,itmi_gold,650);
	b_giveinvitems(self,other,itmi_gold,650);
	b_giveplayerxp(XP_AMBIENT);
	b_npcclearobsessionbydmt(self);
	b_startotherroutine(rosi,"Start");
	b_startotherroutine(till,"Start");
};


instance DIA_SEKOB_ROSINEVERBACK(C_INFO)
{
	npc = bau_930_sekob;
	nr = 56;
	condition = dia_sekob_rosineverback_condition;
	information = dia_sekob_rosineverback_info;
	description = "Rosi will never come back to you. I've taken her to a safe place.";
};


func int dia_sekob_rosineverback_condition()
{
	if((MIS_BRINGROSIBACKTOSEKOB == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sekob_rosineverback_info()
{
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_00");	//Rosi will never come back to you. I've taken her to a safe place.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_01");	//Safe. From whom?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//From you.
	AI_Output(self,other,"DIA_Sekob_ROSINEVERBACK_01_03");	//You'll regret this, you swine.
	self.flags = 0;
	b_npcclearobsessionbydmt(self);
	b_attack(self,other,AR_NONE,1);
	b_giveplayerxp(XP_AMBIENT);
	MIS_BRINGROSIBACKTOSEKOB = LOG_FAILED;
};


instance DIA_SEKOB_KAP6_EXIT(C_INFO)
{
	npc = bau_930_sekob;
	nr = 999;
	condition = dia_sekob_kap6_exit_condition;
	information = dia_sekob_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sekob_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_sekob_kap6_exit_info()
{
	self.flags = 0;
	b_npcclearobsessionbydmt(self);
};


instance DIA_SEKOB_PICKPOCKET(C_INFO)
{
	npc = bau_930_sekob;
	nr = 900;
	condition = dia_sekob_pickpocket_condition;
	information = dia_sekob_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sekob_pickpocket_condition()
{
	return c_beklauen(75,230);
};

func void dia_sekob_pickpocket_info()
{
	Info_ClearChoices(dia_sekob_pickpocket);
	Info_AddChoice(dia_sekob_pickpocket,DIALOG_BACK,dia_sekob_pickpocket_back);
	Info_AddChoice(dia_sekob_pickpocket,DIALOG_PICKPOCKET,dia_sekob_pickpocket_doit);
};

func void dia_sekob_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sekob_pickpocket);
};

func void dia_sekob_pickpocket_back()
{
	Info_ClearChoices(dia_sekob_pickpocket);
};

