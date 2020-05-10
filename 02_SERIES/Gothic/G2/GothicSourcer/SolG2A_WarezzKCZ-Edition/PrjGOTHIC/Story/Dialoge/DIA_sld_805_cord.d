
instance DIA_CORD_EXIT(C_INFO)
{
	npc = sld_805_cord;
	nr = 999;
	condition = dia_cord_exit_condition;
	information = dia_cord_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cord_exit_condition()
{
	return TRUE;
};

func void dia_cord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_CORD_MEETINGISRUNNING(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_addon_cord_meetingisrunning_condition;
	information = dia_addon_cord_meetingisrunning_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_addon_cord_meetingisrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (RANGERMEETINGRUNNING == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int dia_addon_cord_meetingisrunning_onetime;

func void dia_addon_cord_meetingisrunning_info()
{
	if(DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_00");	//Welcome to the 'Ring of Water', brother.
		DIA_ADDON_CORD_MEETINGISRUNNING_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Cord_MeetingIsRunning_14_01");	//You should go see Vatras now...
	};
	AI_StopProcessInfos(self);
};


instance DIA_CORD_HALLO(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_hallo_condition;
	information = dia_cord_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cord_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE) && (RANGERMEETINGRUNNING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_cord_hallo_info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//If you have a problem with wolves or field raiders, go talk to one of the younger mercenaries.
	AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//You can come to me when the paladins show up here.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//What?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Whenever one of you peasants comes to me, it's always about slaughtering innocent beasts.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//I'm not a peasant.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Oh? And what is it you want, then?
	};
};


var int cord_schonmalgefragt;

instance DIA_CORD_WANNAJOIN(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_cord_wannajoin_condition;
	information = dia_cord_wannajoin_info;
	permanent = TRUE;
	description = "I want to become a mercenary!";
};


func int dia_cord_wannajoin_condition()
{
	if((CORD_APPROVED == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void b_cord_bebetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//As long as you barely know how to wield a weapon, you're in the wrong place here!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//I want to become a mercenary!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//You look more like someone who was born to work in the field, boy.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Can you wield a weapon then?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Have you gotten better by now?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//So, how about one-handed weapons?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//I'm not so bad at that.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Weeell...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//And two-handed weapons, then?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//I can handle those.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//I'm surely going to get better!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//Well, at least you're not a bloody beginner. All right. I'm going to vote you in.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Whatever else you need to know, you can learn from me.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"Cord's vote is in the bag.");
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Cord can train me in the use of one and two-handed weapons.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//In other words: you're a bloody greenhorn!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Each mercenary needs to be able to rely on his comrades. All our lives depend on that.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Cord will give me his vote once I've learned to fight better.");
	};
};


instance DIA_ADDON_CORD_YOUARERANGER(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_youareranger_condition;
	information = dia_addon_cord_youareranger_info;
	description = "I've heard that you belong to the 'Ring of Water'.";
};


func int dia_addon_cord_youareranger_condition()
{
	if((RANGERHELP_GILDESLD == TRUE) && (CORD_SCHONMALGEFRAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_cord_youareranger_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_00");	//I've heard that you belong to the 'Ring of Water'.
	if(SC_ISRANGER == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_01");	//What rat has not been able to keep his big trap shut?
		if(SC_KNOWSCORDASRANGERFROMLEE == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_02");	//Lee told me about it.
		};
		if(SC_KNOWSCORDASRANGERFROMLARES == TRUE)
		{
			AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_15_03");	//Lares said you could help me if I told you that I 'reside beneath his wing'.
		};
	};
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_04");	//(sigh) Look's like I've got to deal with you now, doesn't it?
	AI_Output(self,other,"DIA_Addon_Cord_Add_14_01");	//All right, so what do you need?
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_14_06");	//And be damn careful about what you tell me now. For if I don't like what I hear, I might just skin you alive.
	Info_ClearChoices(dia_addon_cord_youareranger);
	Info_AddChoice(dia_addon_cord_youareranger,"I don't really need anything. I'll get along by myself.",dia_addon_cord_youareranger_nix);
	Info_AddChoice(dia_addon_cord_youareranger,"I want your armor.",dia_addon_cord_youareranger_ruestung);
	Info_AddChoice(dia_addon_cord_youareranger,"I want your weapon!",dia_addon_cord_youareranger_waffe);
	if(CORD_APPROVED == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Teach me how to fight.",dia_addon_cord_youareranger_kampf);
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"Get out of here. I want to take your place on this farm.",dia_addon_cord_youareranger_weg);
	};
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"You could help me join the mercenaries.",dia_addon_cord_youareranger_sldaufnahme);
	};
	Info_AddChoice(dia_addon_cord_youareranger,"Pay me for the silence.",dia_addon_cord_youareranger_gold);
};


var int cord_sc_dreist;

func void b_dia_addon_cord_youareranger_warn()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_WARN_14_00");	//(menacing) And woe betide you if I hear that you can't keep your trap shut. And I'm only saying this once, understand?
};

func void b_dia_addon_cord_youareranger_fresse()
{
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_FRESSE_14_00");	//(furiously) That's it. Now you've gone too far. I'll sweep the yard with you.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	CORD_RANGERHELP_GETSLD = FALSE;
	CORD_RANGERHELP_FIGHT = FALSE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void dia_addon_cord_youareranger_ruestung()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_ruestung_15_00");	//I want your armor.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_ruestung_14_01");	//Say that again and you get to pick up your teeth from the ground.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_waffe()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Add_15_00");	//I want your weapon!
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_03");	//(menacingly) Do you, now?
		AI_Output(self,other,"DIA_Addon_Cord_Add_14_02");	//(grimly) Just try and get it!
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_weg()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_weg_15_00");	//Clear out. I want to take your place on this farm.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_weg_14_01");	//Don't get cute with me, kid, or I'll break every single bone in your body.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};


var int dia_addon_cord_youareranger_scgotoffer;

func void dia_addon_cord_youareranger_kampf()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_kampf_15_00");	//Teach me how to fight.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_kampf_14_01");	//All right. What else?
	CORD_RANGERHELP_FIGHT = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"That's all.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_sldaufnahme()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_15_00");	//You could help me to be accepted by the mercenaries.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_SLDAufnahme_14_01");	//(laughs) I can just see it now. Right. I'll try. What else?
	CORD_RANGERHELP_GETSLD = TRUE;
	if(DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER == FALSE)
	{
		Info_AddChoice(dia_addon_cord_youareranger,"That's all.",dia_addon_cord_youareranger_reicht);
		DIA_ADDON_CORD_YOUARERANGER_SCGOTOFFER = TRUE;
	};
};

func void dia_addon_cord_youareranger_gold()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_Gold_15_00");	//Pay me for my silence.
	if(CORD_SC_DREIST == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_Gold_14_01");	//Wouldn't you like that? Too bad for you. I won't be blackmailed, buster.
		CORD_SC_DREIST = TRUE;
	}
	else
	{
		b_dia_addon_cord_youareranger_fresse();
	};
};

func void dia_addon_cord_youareranger_nix()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_nix_15_00");	//I don't really need anything. I'll get along by myself.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_nix_14_01");	//If that's what you want. You had your chance.
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};

func void dia_addon_cord_youareranger_reicht()
{
	AI_Output(other,self,"DIA_Addon_Cord_YouAreRanger_reicht_15_00");	//That's all.
	AI_Output(self,other,"DIA_Addon_Cord_YouAreRanger_reicht_14_01");	//That shouldn't be too hard.
	b_dia_addon_cord_youareranger_warn();
	Info_ClearChoices(dia_addon_cord_youareranger);
};


instance DIA_ADDON_CORD_RANGERHELP2GETSLD(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_addon_cord_rangerhelp2getsld_condition;
	information = dia_addon_cord_rangerhelp2getsld_info;
	permanent = TRUE;
	description = "Help me become a mercenary.";
};


var int dia_addon_cord_rangerhelp2getsld_noperm;

func int dia_addon_cord_rangerhelp2getsld_condition()
{
	if((CORD_RANGERHELP_GETSLD == TRUE) && (hero.guild == GIL_NONE) && (DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void b_cord_rangerhelpobsolete()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_00");	//It's already taken care of.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_01");	//Oh. I guess I can't help you then.
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelpObsolete_15_02");	//What do you mean by that?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_03");	//Well, it means that I cannot help you.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_04");	//Or do you want me to go up against every single mercenary just so that you can join here?
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelpObsolete_14_05");	//You'll have to do that yourself.
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
	TOPIC_END_RANGERHELPSLD = TRUE;
};

func void b_cord_comelaterwhendone()
{
	AI_Output(self,other,"DIA_Addon_Cord_ComeLaterWhenDone_14_00");	//So go ahead, take care of it and then come back here.
	AI_StopProcessInfos(self);
};

func void b_cord_idoitforyou()
{
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_00");	//Ah yes. That's easy. Listen. Come back tomorrow. I'll have taken care of it by then.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_01");	//But you're going to have to do something for me in return.
	AI_Output(other,self,"DIA_Addon_Cord_IDoItForYou_15_02");	//And what would that be?
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_03");	//Not far from here, to the south-east, there's a small bandit camp in the mountains.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_04");	//If you go south-east from here you'll soon see the tower there.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_05");	//One of my people, Patrick, left several days ago to do business with those varmints.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_06");	//Well. I told him it was a rotten idea. But that idiot wouldn't listen to me.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_07");	//I assume they've made short work of him. But I don't know for sure.
	AI_Output(self,other,"DIA_Addon_Cord_IDoItForYou_14_08");	//You're going to find out for me.
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"Cord is going to take care of Torlof's test. Cord's buddy Patrick has disappeared. He wants me to go to the bandits' small mountain camp to the south-east and find out whether Patrick is there.");
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"Forget it. That's much harder than Torlof's task.",b_cord_idoitforyou_mist);
	Info_AddChoice(dia_addon_cord_rangerhelp2getsld,"And what makes you so sure that they won't make short work of ME, too?",b_cord_idoitforyou_dexter);
	DIA_ADDON_CORD_RANGERHELP2GETSLD_NOPERM = TRUE;
};

func void b_cord_idoitforyou_mist()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_mist_15_00");	//Forget it. That's much harder than Torlof's task.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_01");	//It doesn't have to be. Such a small, greasy, nondescript fellow like you won't be of much interest to them.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_mist_14_02");	//And I can't do it myself. Those boys will get their dander up at the mere sight of a mercenary.
};

func void b_cord_idoitforyou_dexter()
{
	AI_Output(other,self,"Dia_Addon_Cord_IDoItForYou_Dexter_15_00");	//And what makes you so sure that they won't make short work of ME, too?
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_01");	//The fact that I know the name of their leader. It's Dexter. You'll simply claim that you know the guy.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_02");	//His men will think twice then before they wring your neck just for the heck of it.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_03");	//It could still get dangerous, of course.
	AI_Output(self,other,"Dia_Addon_Cord_IDoItForYou_Dexter_14_04");	//But you can handle that.
	Info_ClearChoices(dia_addon_cord_rangerhelp2getsld);
	b_logentry(TOPIC_ADDON_RANGERHELPSLD,"The leader of the bandits is named Dexter.");
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_MISSINGPEOPLE,"Cord the mercenary is looking for his buddy Patrick.");
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_RUNNING;
	RANGER_SCKNOWSDEXTER = TRUE;
};

func void dia_addon_cord_rangerhelp2getsld_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_00");	//Help me become a mercenary.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_01");	//Let me think. Mmh. You'll have to get past Torlof if you want to make any progress here.
	AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_02");	//Have you already seen Torlof about it?
	if(TORLOF_GO == FALSE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_03");	//Not really.
		b_cord_comelaterwhendone();
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_04");	//Yes. That's with the test and all.
		AI_Output(self,other,"DIA_Addon_Cord_RangerHelp2GetSLD_14_05");	//Ah. What test would that be?
		if((TORLOF_PROBEBESTANDEN == TRUE) || ((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick)) || ((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING) && ((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))))
		{
			b_cord_rangerhelpobsolete();
		}
		else if(TORLOF_PROBE == 0)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_06");	//I haven't accepted it yet.
			b_cord_comelaterwhendone();
		}
		else if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_07");	//I'm supposed to collect the rent at Sekob's farm.
			b_cord_idoitforyou();
		}
		else if(TORLOF_PROBE == PROBE_BENGAR)
		{
			AI_Output(other,self,"DIA_Addon_Cord_RangerHelp2GetSLD_15_08");	//I'm supposed to drive the militia away from Bengar's farm.
			b_cord_idoitforyou();
		}
		else
		{
			b_cord_rangerhelpobsolete();
		};
	};
};


instance DIA_ADDON_CORD_TALKEDTODEXTER(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_addon_cord_talkedtodexter_condition;
	information = dia_addon_cord_talkedtodexter_info;
	description = "I went to see Dexter.";
};


func int dia_addon_cord_talkedtodexter_condition()
{
	if(((bdt_1060_dexter.aivar[AIV_TALKEDTOPLAYER] == TRUE) || Npc_IsDead(bdt_1060_dexter)) && (MIS_ADDON_CORD_LOOK4PATRICK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_cord_talkedtodexter_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_00");	//I went to see Dexter.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_01");	//And?
	if(Npc_IsDead(bdt_1060_dexter))
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_02");	//Dexter is dead.
	};
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_03");	//There was no trace up there of your buddy Patrick.
	if(DEXTER_KNOWSPATRICK == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_04");	//Dexter remembered him, but he said it had been ages since he'd seen him.
		AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_05");	//And you're sure that Dexter didn't lie to you?
		AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_06");	//No, I'm not. But this is all I can tell you.
	};
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_07");	//I don't get it. He seems to have vanished off the face of the earth.
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_08");	//Well, you've kept your side of the bargain...
	MIS_ADDON_CORD_LOOK4PATRICK = LOG_SUCCESS;
	TOPIC_END_RANGERHELPSLD = TRUE;
	b_giveplayerxp(XP_ADDON_CORD_LOOK4PATRICK);
	AI_Output(other,self,"DIA_Addon_Cord_TalkedToDexter_15_09");	//What about Torlof's test, now?
	AI_Output(self,other,"DIA_Addon_Cord_TalkedToDexter_14_10");	//Don't worry, you can go back to Torlof. Your task is fulfilled, and you've passed the test. I told you I would take care of it.
	CORD_RANGERHELP_TORLOFSPROBE = TRUE;
	if(TORLOF_PROBE == PROBE_SEKOB)
	{
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
	}
	else if(TORLOF_PROBE == PROBE_BENGAR)
	{
		MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	};
};


instance DIA_CORD_RETURNPATRICK(C_INFO)
{
	npc = sld_805_cord;
	nr = 8;
	condition = dia_cord_returnpatrick_condition;
	information = dia_cord_returnpatrick_info;
	permanent = FALSE;
	description = "Patrick is back.";
};


func int dia_cord_returnpatrick_condition()
{
	if((Npc_GetDistToWP(patrick_nw,"NW_BIGFARM_PATRICK") <= 1000) && (MISSINGPEOPLERETURNEDHOME == TRUE))
	{
		return TRUE;
	};
};

func void dia_cord_returnpatrick_info()
{
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_00");	//Patrick is back.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_01");	//Yeah, man. I had almost given up hope. You...
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_02");	//Hey, do me a favor.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_03");	//Yes?
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_04");	//Spare us both your speech of thanks.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_05");	//I wasn't going to thank you at all.
	AI_Output(other,self,"DIA_Addon_Cord_ReturnPatrick_15_06");	//But...?
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_07");	//(grins) I was just going to tell you that you're a damned cheeky devil.
	AI_Output(self,other,"DIA_Addon_Cord_ReturnPatrick_14_09");	//(grins) Stay cool!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_CORD_EXPLAINSKILLS(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_explainskills_condition;
	information = dia_cord_explainskills_info;
	permanent = FALSE;
	description = "What should I learn first, one-handed or two-handed combat?";
};


func int dia_cord_explainskills_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainskills_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//What should I learn first, one-handed or two-handed combat?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Those two types of arms are rather similar.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//As soon as you reach the next level with one type of weapon, you automatically learn for the other as well.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//If, for instance, you are good at fighting with one-handed swords, but still a beginner with two-handed weapons...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//... your two-handed skills will go up as well whenever you train with a one-hander.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//If you train with one type of weapon only, you will find the training more exhausting.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//If you always train both, you will arrive at the same result with less effort.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//In the end, the outcome will be the same either way - it's your choice.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "What are the advantages of one or two-handed weapons?";
};


func int dia_cord_explainweapons_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainweapons_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//What are the advantages of one-handed or two-handed weapons?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//A good question. I see that you have given the subject some thought.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//One-handed weapons are faster, but a little weaker.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Two-handers cause more damage, but you cannot strike as fast.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Also, you need more strength to wield a two-hander. This means additional training.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//The only way to become really good is to invest a lot of effort.
};


var int cord_merke_1h;
var int cord_merke_2h;

instance DIA_CORD_TEACH(C_INFO)
{
	npc = sld_805_cord;
	nr = 3;
	condition = dia_cord_teach_condition;
	information = dia_cord_teach_info;
	permanent = TRUE;
	description = "Teach me how to fight!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//I don't waste my time with beginners.
};

func void dia_cord_teach_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Teach me how to fight!
	if((CORD_APPROVED == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (CORD_RANGERHELP_FIGHT == TRUE))
	{
		if(((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)) || (CORD_RANGERHELP_FIGHT == TRUE))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//I can teach you to use any weapon - where shall we start?
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//I can train you to use a one-handed sword. But you're not good enough yet to wield a two-hander.
			b_cord_zeitverschwendung();
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//When it comes to one-handers, you're a bloody beginner! But your two-handed skills aren't so bad.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//If you need more experience with one-handed arms, go find a different teacher.
			CORD_APPROVED = TRUE;
		}
		else
		{
			b_cord_zeitverschwendung();
			b_cord_bebetter();
		};
		if(CORD_APPROVED == TRUE)
		{
			Info_ClearChoices(dia_cord_teach);
			Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
			if((Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0) || (CORD_RANGERHELP_FIGHT == TRUE))
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
			};
			if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (CORD_RANGERHELP_FIGHT == TRUE))
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
			};
			CORD_MERKE_1H = other.hitchance[NPC_TALENT_1H];
			CORD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//I only train mercenaries, or worthy candidates!
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//You've become better already - keep it up!
	};
	Info_ClearChoices(dia_cord_teach);
};

func void dia_cord_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H,1)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H,5)),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H,1)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H,5)),dia_cord_teach_1h_5);
	};
};


instance DIA_CORD_PICKPOCKET(C_INFO)
{
	npc = sld_805_cord;
	nr = 900;
	condition = dia_cord_pickpocket_condition;
	information = dia_cord_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cord_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_cord_pickpocket_info()
{
	Info_ClearChoices(dia_cord_pickpocket);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_BACK,dia_cord_pickpocket_back);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_PICKPOCKET,dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back()
{
	Info_ClearChoices(dia_cord_pickpocket);
};

