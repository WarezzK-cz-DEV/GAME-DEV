
instance DIA_ADDON_QUARHODRON_EXIT(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 999;
	condition = dia_addon_quarhodron_exit_condition;
	information = dia_addon_quarhodron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_quarhodron_exit_condition()
{
	return TRUE;
};

func void dia_addon_quarhodron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_QUARHODRON_HELLO(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_hello_condition;
	information = dia_addon_quarhodron_hello_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_addon_quarhodron_hello_noperm;

func int dia_addon_quarhodron_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_ADDON_QUARHODRON_HELLO_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_quarhodron_hello_info()
{
	if(KNOW_FOREIGNLANGUAGE == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_00");	//Why do you disturb my rest, guardian?
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_01");	//(angry) Tell me, what do you desire?
		Info_ClearChoices(dia_addon_quarhodron_hello);
		Info_AddChoice(dia_addon_quarhodron_hello,"What is there in the temple of Adanos?",dia_addon_quarhodron_hello_schwert);
		Info_AddChoice(dia_addon_quarhodron_hello,"Someone has forced his way into the temple of Adanos.",dia_addon_quarhodron_hello_raven);
		Info_AddChoice(dia_addon_quarhodron_hello,"Grant me access to the temple of Adanos.",dia_addon_quarhodron_hello_tempel);
		Info_AddChoice(dia_addon_quarhodron_hello,"The land is afflicted with earthquakes.",dia_addon_quarhodron_hello_erdbeben);
		DIA_ADDON_QUARHODRON_HELLO_NOPERM = TRUE;
		Npc_RemoveInvItems(hero,itwr_addon_summonancientghost,1);
		SC_TALKEDTOGHOST = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_02");	//Bengla anthani, Osiri?
		b_say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_11_03");	//(loudly) Bengla anthani?
		AI_StopProcessInfos(self);
	};
};


var int dia_addon_quarhodron_hello_choicecounter;
var int b_quarhodron_hello_kommzumpunkt_onetime;

func void b_quarhodron_hello_kommzumpunkt()
{
	if((DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER >= 3) && (b_quarhodron_hello_kommzumpunkt_onetime == FALSE))
	{
		Info_AddChoice(dia_addon_quarhodron_hello,"The praised wisdom of the ancestors is truly overwhelming.",dia_addon_quarhodron_hello_frech);
		b_quarhodron_hello_kommzumpunkt_onetime = TRUE;
	};
};

func void dia_addon_quarhodron_hello_erdbeben()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_erdbeben_15_00");	//The land is plagued by earthquakes. We must do something or the entire island will sink into the sea.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_01");	//There is nothing left for us to do.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_erdbeben_11_02");	//The wrath of Adanos has fallen upon Jharkendar to punish the unbelievers.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_raven()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_00");	//Someone has forced his way into the temple of Adanos.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_raven_11_01");	//Nonsense. I myself sealed the door. It is impossible to pass.
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_raven_15_02");	//Indeed?
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_tempel()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_tempel_15_00");	//Grant me access to the temple of Adanos.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_tempel_11_01");	//The temple will remain closed for all eternity. Thus did we in the council decide.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_schwert()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_schwert_15_00");	//What is there in the temple of Adanos?
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_schwert_11_01");	//My greatest sorrow, my greatest disappointment.
	DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER = DIA_ADDON_QUARHODRON_HELLO_CHOICECOUNTER + 1;
	b_quarhodron_hello_kommzumpunkt();
};

func void dia_addon_quarhodron_hello_frech()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Hello_frech_15_00");	//The praised wisdom of the ancestors is truly overwhelming.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_01");	//A man of your standing does not speak to me thus.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_02");	//I cannot free myself of the impression that you are not the one you pretend to be.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_03");	//If you require my aid, you must first prove yourself to me.
	AI_Output(self,other,"DIA_Addon_Quarhodron_Hello_frech_11_04");	//Answer my questions, so that I may be sure that I do not reveal myself to strangers.
	Log_CreateTopic(TOPIC_ADDON_QUARHODRON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_QUARHODRON,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron will only help me if I can prove myself to him. He has asked me some difficult questions. I have to answer them first before he will help me.");
	Info_ClearChoices(dia_addon_quarhodron_hello);
};


instance DIA_ADDON_QUARHODRON_FRAGEN(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_fragen_condition;
	information = dia_addon_quarhodron_fragen_info;
	permanent = TRUE;
	description = "Ask away.";
};


func int dia_addon_quarhodron_fragen_condition()
{
	if(QUARHODRONISTZUFRIEDEN == FALSE)
	{
		return TRUE;
	};
};


var int quarhodrons_nextquestion;
var int quarhodronistzufrieden;
var int quarhodrons_richtigeantworten;
const int QUARHODRON_ALLEFRAGENGESTELLT = 100;
var int b_quarhodron_fragen_choicesonetime;

func void b_quarhodron_testfailed()
{
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_00");	//Your wrong answers reveal your evil intentions.
	AI_Output(self,other,"DIA_Addon_Quarhodron_TestFailed_11_01");	//I shall not help you.
	AI_StopProcessInfos(self);
};

func void b_quarhodron_fragen_choices()
{
	Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- QUARHODRON'S QUESTIONS ---");
	if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else if((QUARHODRONS_NEXTQUESTION == 1) && (QUARHODRONS_RICHTIGEANTWORTEN == 0))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_00");	//I do not believe you.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_01");	//I think you should only return when you have decided to tell me the truth.
		AI_StopProcessInfos(self);
	}
	else
	{
		if(QUARHODRONS_NEXTQUESTION == 1)
		{
			if(b_quarhodron_fragen_choicesonetime == FALSE)
			{
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_02");	//(thinking) The abilities of a guardian of the dead would have allowed you to waken me, that is true.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_03");	//If you are truly the one you claim to be, you will be able to answer all of my questions.
				AI_Output(self,other,"DIA_Addon_Quarhodron_Add_11_00");	//Except for one...
				b_quarhodron_fragen_choicesonetime = TRUE;
			};
			QUARHODRONS_NEXTQUESTION = 2;
		};
		if(QUARHODRONS_NEXTQUESTION == 7)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_04");	//Who sealed the portal to guard the world from Evil?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Who closed the portal to protect the world from Evil? ---");
			QUARHODRONS_NEXTQUESTION = QUARHODRON_ALLEFRAGENGESTELLT;
		}
		else if(QUARHODRONS_NEXTQUESTION == 6)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_05");	//Who alleviates suffering and attends to the ill?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Who alleviates suffering and cares for the sick in Jharkendar? ---");
			QUARHODRONS_NEXTQUESTION = 7;
		}
		else if(QUARHODRONS_NEXTQUESTION == 5)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_06");	//Who has the final word in the Council of Five?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Who has the last word in the Council of Five? ---");
			QUARHODRONS_NEXTQUESTION = 6;
		}
		else if(QUARHODRONS_NEXTQUESTION == 4)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_07");	//Who brought the Evil upon us?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Who is to blame for the evil that befell the people of Jharkendar? ---");
			QUARHODRONS_NEXTQUESTION = 5;
		}
		else if(QUARHODRONS_NEXTQUESTION == 3)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_08");	//Who can give me a direct order?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Who can give Quarhodron a direct order? ---");
			QUARHODRONS_NEXTQUESTION = 4;
		}
		else if(QUARHODRONS_NEXTQUESTION == 2)
		{
			AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_Choices_11_09");	//Who once protected the people of Jharkendar from enemy attacks?
			Log_AddEntry(TOPIC_ADDON_QUARHODRON," --- Who once protected the people of Jharkendar from enemy attacks? ---");
			QUARHODRONS_NEXTQUESTION = 3;
		};
		Info_ClearChoices(dia_addon_quarhodron_fragen);
		if(QUARHODRONS_NEXTQUESTION >= QUARHODRON_ALLEFRAGENGESTELLT)
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"There's no way I could know that.",dia_addon_quarhodron_fragen_noplan);
		}
		else
		{
			Info_AddChoice(dia_addon_quarhodron_fragen,"I don't know.",dia_addon_quarhodron_fragen_noplan);
		};
		Info_AddChoice(dia_addon_quarhodron_fragen,"The scholars.",dia_addon_quarhodron_fragen_gele);
		Info_AddChoice(dia_addon_quarhodron_fragen,"The guardians of the dead.",dia_addon_quarhodron_fragen_totenw);
		Info_AddChoice(dia_addon_quarhodron_fragen,"The priests.",dia_addon_quarhodron_fragen_prie);
		Info_AddChoice(dia_addon_quarhodron_fragen,"The warrior caste.",dia_addon_quarhodron_fragen_warr);
		Info_AddChoice(dia_addon_quarhodron_fragen,"The healers.",dia_addon_quarhodron_fragen_heiler);
	};
};


var int dia_addon_quarhodron_fragen_info_onetime;

func void dia_addon_quarhodron_fragen_info()
{
	QUARHODRONS_NEXTQUESTION = 0;
	QUARHODRONS_RICHTIGEANTWORTEN = 0;
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_15_00");	//Ask away.
	if(dia_addon_quarhodron_fragen_info_onetime == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_01");	//I am Quarhodron, the old warlord of Jharkendar.
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_02");	//You have woken me.
		dia_addon_quarhodron_fragen_info_onetime = TRUE;
	};
	AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_11_03");	//To which caste of Jharkendar do you belong?
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_warr()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_warr_15_00");	//The warrior caste.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 3)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 5)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_prie()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_prie_15_00");	//The priests.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 4)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_gele()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_gele_15_00");	//The scholars.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 6)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_totenw()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_totenw_15_00");	//The guardians of the dead.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_heiler()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_heiler_15_00");	//The healers.
	if(QUARHODRONS_NEXTQUESTION == 0)
	{
		QUARHODRONS_NEXTQUESTION = 1;
	};
	if(QUARHODRONS_NEXTQUESTION == 7)
	{
		QUARHODRONS_RICHTIGEANTWORTEN = QUARHODRONS_RICHTIGEANTWORTEN + 1;
	};
	b_quarhodron_fragen_choices();
};

func void dia_addon_quarhodron_fragen_noplan()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_Fragen_NoPlan_15_00");	//I don't know.
	if((QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT) && (QUARHODRONS_RICHTIGEANTWORTEN >= 6))
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_01");	//Good. I trust you and shall grant you my aid.
		QUARHODRONISTZUFRIEDEN = TRUE;
		Info_ClearChoices(dia_addon_quarhodron_fragen);
	}
	else if(QUARHODRONS_NEXTQUESTION == QUARHODRON_ALLEFRAGENGESTELLT)
	{
		b_quarhodron_testfailed();
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Quarhodron_Fragen_NoPlan_11_02");	//Then do not waste my time.
		AI_StopProcessInfos(self);
	};
};


instance DIA_ADDON_QUARHODRON_GIBMIRKEY(C_INFO)
{
	npc = none_addon_111_quarhodron;
	nr = 5;
	condition = dia_addon_quarhodron_gibmirkey_condition;
	information = dia_addon_quarhodron_gibmirkey_info;
	description = "(demand the key to the temple)";
};


func int dia_addon_quarhodron_gibmirkey_condition()
{
	if(QUARHODRONISTZUFRIEDEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_quarhodron_gibmirkey_info()
{
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_00");	//Now listen here. A truly evil fellow has gained access to the temple of Adanos.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_01");	//If you don't let me into the temple right now, it will probably be too late and everything will go down the drain.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_02");	//That cannot be! The high priest KHARDIMON and I are the only ones in Jharkendar who know how to open the gate to Adanos' temple.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_03");	//Well. Then your pal KHARDIMON must have blabbed.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_04");	//I'm telling you, the gate was open. I saw it myself.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_05");	//Well. There is truth in your voice. I shall no longer doubt your words.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_06");	//I should hope so.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_07");	//Take, then, the password. It is written on this stone tablet. Speak the words at the sealed gate of the temple and it will open.
	CreateInvItems(self,itmi_tempeltorkey,1);
	b_giveinvitems(self,other,itmi_tempeltorkey,1);
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_08");	//(already half dead) My time is done. Alas, I can no longer help you.
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_09");	//(already half dead) But remember: beware the chambers of Adanos. Else your death is certain.
	AI_Output(other,self,"DIA_Addon_Quarhodron_GibMirKey_15_10");	//Wait. What ABOUT the chambers?
	AI_Output(self,other,"DIA_Addon_Quarhodron_GibMirKey_11_11");	//(already half dead) My strength is failing. Farewell. We shall meet again in the realm of the dead.
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_ADDON_QUARHODRON,"Quarhodron gave me a stone tablet that I can use to open the entrance to the temple of Adanos.");
	Log_CreateTopic(TOPIC_ADDON_KAMMERN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_KAMMERN,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_KAMMERN,"Quarhodron mentioned the 'Chambers of Adanos' and said that I should beware of them. I really have to find out what he meant if I don't want to run into a trap in the temple of Adanos.");
	GHOST_SCKNOWSHOW2GETINADANOSTEMPEL = TRUE;
};

