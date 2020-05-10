
instance DIA_ADDON_SNAF_EXIT(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 999;
	condition = dia_addon_snaf_exit_condition;
	information = dia_addon_snaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_snaf_exit_condition()
{
	return TRUE;
};

func void dia_addon_snaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SNAF_PICKPOCKET(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 900;
	condition = dia_addon_snaf_pickpocket_condition;
	information = dia_addon_snaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_addon_snaf_pickpocket_condition()
{
	return c_beklauen(49,56);
};

func void dia_addon_snaf_pickpocket_info()
{
	Info_ClearChoices(dia_addon_snaf_pickpocket);
	Info_AddChoice(dia_addon_snaf_pickpocket,DIALOG_BACK,dia_addon_snaf_pickpocket_back);
	Info_AddChoice(dia_addon_snaf_pickpocket,DIALOG_PICKPOCKET,dia_addon_snaf_pickpocket_doit);
};

func void dia_addon_snaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_snaf_pickpocket);
};

func void dia_addon_snaf_pickpocket_back()
{
	Info_ClearChoices(dia_addon_snaf_pickpocket);
};


instance DIA_ADDON_SNAF_HI(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 1;
	condition = dia_addon_snaf_hi_condition;
	information = dia_addon_snaf_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_snaf_hi_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_hi_info()
{
	AI_Output(self,other,"DIA_Addon_Snaf_Hi_01_00");	//Do you want to eat or chatter? What'll it be?
};


instance DIA_ADDON_SNAF_COOK(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 2;
	condition = dia_addon_snaf_cook_condition;
	information = dia_addon_snaf_cook_info;
	permanent = FALSE;
	description = "What's on the menu?";
};


func int dia_addon_snaf_cook_condition()
{
	return TRUE;
};

func void dia_addon_snaf_cook_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_15_00");	//What's on the menu?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_01_01");	//I want to try out a new dish - 'Fire strips in Hammer sauce'.
	Info_ClearChoices(dia_addon_snaf_cook);
	Info_AddChoice(dia_addon_snaf_cook,"Fire strips?",dia_addon_snaf_cook_feuer);
	Info_AddChoice(dia_addon_snaf_cook,"Hammer sauce?",dia_addon_snaf_cook_hammer);
};

func void dia_addon_snaf_cook_feuer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_FEUER_15_00");	//Fire strips?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_01");	//Crisp, delicately roasted meat, mixed with pickled fireweed.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_FEUER_01_02");	//But don't worry - I already have the ingredients for that.
};

func void dia_addon_snaf_cook_hammer()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_15_00");	//Hammer sauce?
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_01");	//A sauce made from a hammer-hard booze. I have a recipe from a guy called Lou.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_01_02");	//You get the ingredients and distill the booze up on the alchemist's bench, then I'll make a sauce out of it. What do you think?
	Info_AddChoice(dia_addon_snaf_cook,"I don't have time for that.",dia_addon_snaf_cook_no);
	Info_AddChoice(dia_addon_snaf_cook,"Okay, I'll do it.",dia_addon_snaf_cook_yes);
};

func void dia_addon_snaf_cook_no()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_NO_15_00");	//I don't have time for that.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_NO_01_01");	//Then forget it.
	MIS_SNAFHAMMER = LOG_OBSOLETE;
	Info_ClearChoices(dia_addon_snaf_cook);
};

func void dia_addon_snaf_cook_yes()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Cook_HAMMER_YES_15_00");	//Okay, I'll do it.
	AI_Output(self,other,"DIA_Addon_Snaf_Cook_HAMMER_YES_01_01");	//All right. Here's the recipe.
	b_giveinvitems(self,other,itwr_addon_lou_rezept,1);
	MIS_SNAFHAMMER = LOG_RUNNING;
	Info_ClearChoices(dia_addon_snaf_cook);
	Log_CreateTopic(TOPIC_ADDON_HAMMER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_HAMMER,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_HAMMER,"Snaf needs booze for his sauce. He gave me the recipe for a Hammer booze that I can brew on the laboratory table.");
};


var int snaf_tip_kosten;

instance DIA_ADDON_SNAF_BOOZE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 3;
	condition = dia_addon_snaf_booze_condition;
	information = dia_addon_snaf_booze_info;
	permanent = FALSE;
	description = "I distilled the booze.";
};


func int dia_addon_snaf_booze_condition()
{
	if((Npc_HasItems(other,itfo_addon_loushammer) >= 1) && (MIS_SNAFHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_booze_info()
{
	b_giveinvitems(other,self,itfo_addon_loushammer,1);
	AI_Output(other,self,"DIA_Addon_Snaf_Booze_15_00");	//I distilled the booze.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_01");	//Excellent, then I'll finish it.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_02");	//Here, you can try a portion right away. That'll put some strength in your arm.
	AI_Output(self,other,"DIA_Addon_Snaf_Booze_01_03");	//Oh, and if I can help you again... For you, all information is for free from now on.
	SNAF_TIP_KOSTEN = 0;
	b_giveinvitems(self,other,itfo_addon_firestew,1);
	MIS_SNAFHAMMER = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_LOUSHAMMER);
};


instance DIA_ADDON_SNAF_ATTENTAT(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 4;
	condition = dia_addon_snaf_attentat_condition;
	information = dia_addon_snaf_attentat_info;
	permanent = FALSE;
	description = "What do you know about the attack?";
};


func int dia_addon_snaf_attentat_condition()
{
	if(MIS_JUDAS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_snaf_attentat_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_15_00");	//What do you know about the attack?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_01");	//The thing with Esteban?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_01_02");	//You know how it is. The barkeeper hears everything, but never takes sides...
	Info_ClearChoices(dia_addon_snaf_attentat);
	Info_AddChoice(dia_addon_snaf_attentat,"At least tell me who I can go to.",dia_addon_snaf_attentat_gowhere);
	Info_AddChoice(dia_addon_snaf_attentat,"If you were in my place, what would you do?",dia_addon_snaf_attentat_youbeingme);
	Info_AddChoice(dia_addon_snaf_attentat,"So do you know something?",dia_addon_snaf_attentat_something);
};

func void dia_addon_snaf_attentat_something()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_Something_15_00");	//So do you know something?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_Something_01_01");	//I didn't say THAT.
};

func void dia_addon_snaf_attentat_gowhere()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_GoWhere_15_00");	//At least tell me who I can go to.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_GoWhere_01_01");	//Oh, man! Where's the difference? Forget that!
};

func void dia_addon_snaf_attentat_youbeingme()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Attentat_YouBeingMe_15_00");	//If you were in my place, what would you do?
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_01");	//I would think about what I know about the guy behind it.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_02");	//First, it was probably one of the bandits, that means he is here in the camp.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_03");	//Second, that he's here in the camp means that he is watching you.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_04");	//Third, as long as he thinks that you're on Esteban's side, he'll never reveal himself to you.
	AI_Output(self,other,"DIA_Addon_Snaf_Attentat_YouBeingMe_01_05");	//So the INTERESTING question is: what are your chances of finding your man?
	Info_ClearChoices(dia_addon_snaf_attentat);
};


instance DIA_ADDON_SNAF_ABRECHNUNG(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 5;
	condition = dia_addon_snaf_abrechnung_condition;
	information = dia_addon_snaf_abrechnung_info;
	permanent = TRUE;
	description = "What are my chances of finding my man?";
};


func int dia_addon_snaf_abrechnung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && (MIS_JUDAS == LOG_RUNNING) && (HUNO_ZUSNAF == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_abrechnung_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Abrechnung_15_00");	//What are my chances of finding my man?
	AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_01");	//Hmmm...
	if((SENYAN_ERPRESSUNG == LOG_RUNNING) && !Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_02");	//They're pretty dim. Some people have noticed that you're involved with Senyan.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_03");	//You'll have to break off your connection with him, otherwise you'll never have a chance of finding the one responsible for the attack.
		if(SNAF_TIP_SENYAN == FALSE)
		{
			b_logentry(TOPIC_ADDON_SENYAN,"I should end my relationship with Senyan. It wouldn't be very smart to attack him directly though. I should talk to him before that.");
			SNAF_TIP_SENYAN = TRUE;
		};
	}
	else if(Npc_IsDead(senyan))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_04");	//You bumped off one of Esteban's people. The man you're looking for will believe you are on his side.
		AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_05");	//But he won't just reveal himself to you. You will have to find out more.
	}
	else
	{
		if(FINN_PETZT == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_06");	//Finn seems to be really agitated since you talked to him.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_07");	//And everyone here knows that he's in good standing with Esteban.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_08");	//That means you probably told him something he didn't want to hear.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_09");	//That will please the man you are looking for...
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_10");	//However, there is the danger that he will run to Esteban with it - (ironically) but you know that yourself...
		};
		if(FINN_TELLALL == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_11");	//They say you told Finn that you work for Esteban.
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_12");	//I don't know what you're really planning, but the man you're looking for will certainly be more careful from now on.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Snaf_Abrechnung_01_13");	//So far everything is still open.
		};
	};
	if(SNAF_RECHNUNG == FALSE)
	{
		if(SNAF_EINMAL == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_14");	//Thanks.
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_15");	//(curtly) Hey! I didn't tell you anything you didn't already know, got it?!
			SNAF_EINMAL = TRUE;
		}
		else
		{
			AI_Output(other,self,"DIA_Addon_Snaf_Abschied_15_16");	//I knew that...
			AI_Output(self,other,"DIA_Addon_Snaf_Abschied_01_17");	//Exactly.
		};
	};
};


instance DIA_ADDON_SNAF_HOCH(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 6;
	condition = dia_addon_snaf_hoch_condition;
	information = dia_addon_snaf_hoch_info;
	permanent = FALSE;
	description = "Huno says I should meet someone here...";
};


func int dia_addon_snaf_hoch_condition()
{
	if(HUNO_ZUSNAF == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_snaf_hoch_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_HOCH_15_00");	//Huno sent me.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_01");	//Looks like you found your man.
	AI_Output(self,other,"DIA_Addon_Snaf_HOCH_01_02");	//Go on up to the next floor, someone's waiting for you.
	AI_StopProcessInfos(self);
	AI_Teleport(fisk,"BL_INN_UP_06");
	b_startotherroutine(fisk,"MEETING");
	b_giveplayerxp(XP_ADDON_AUFTRAGGEBER);
};


var int kosten_einmal;

instance DIA_ADDON_SNAF_PEOPLE(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 6;
	condition = dia_addon_snaf_people_condition;
	information = dia_addon_snaf_people_info;
	permanent = TRUE;
	description = "What do people here think of Esteban?";
};


func int dia_addon_snaf_people_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_people_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_15_00");	//What do people here think of Esteban?
	AI_Output(self,other,"DIA_Addon_Snaf_People_01_01");	//You'll have to be a bit more precise...
	if((KOSTEN_EINMAL == FALSE) && (MIS_SNAFHAMMER != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_02");	//Each piece of information will cost you...
		AI_Output(other,self,"DIA_Addon_Snaf_People_15_03");	//How much?
		AI_Output(self,other,"DIA_Addon_Snaf_People_01_04");	//10 gold pieces!
		SNAF_TIP_KOSTEN = 10;
		KOSTEN_EINMAL = TRUE;
	};
	Info_ClearChoices(dia_addon_snaf_people);
	Info_AddChoice(dia_addon_snaf_people,DIALOG_BACK,dia_addon_snaf_people_back);
	Info_AddChoice(dia_addon_snaf_people,"Paul.",dia_addon_snaf_people_paul);
	Info_AddChoice(dia_addon_snaf_people,"Huno.",dia_addon_snaf_people_huno);
	Info_AddChoice(dia_addon_snaf_people,"Fisk.",dia_addon_snaf_people_fisk);
	Info_AddChoice(dia_addon_snaf_people,"Emilio.",dia_addon_snaf_people_emilio);
	if(!Npc_IsDead(senyan))
	{
		Info_AddChoice(dia_addon_snaf_people,"Senyan.",dia_addon_snaf_people_senyan);
	};
	Info_AddChoice(dia_addon_snaf_people,"Lennar.",dia_addon_snaf_people_lennar);
	Info_AddChoice(dia_addon_snaf_people,"Finn.",dia_addon_snaf_people_finn);
};

func void b_addon_snaf_notenough()
{
	AI_Output(self,other,"DIA_Addon_Snaf_NotEnough_01_00");	//You don't have enough gold, boy!
};

func void dia_addon_snaf_people_back()
{
	Info_ClearChoices(dia_addon_snaf_people);
};

func void dia_addon_snaf_people_paul()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Paul_15_00");	//What about Paul?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Paul_01_01");	//I don't think he particularly likes Esteban. Since he's been working for Huno, he'll never get into the mine.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_huno()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Huno_15_00");	//What does Huno think of Esteban?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_01");	//Ah! Huno. I know almost nothing about him.
	if(MIS_SNAFHAMMER != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Huno_01_02");	//(grins) That information is, of course, free.
	};
};

func void dia_addon_snaf_people_fisk()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Fisk_15_00");	//What about Fisk?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_01");	//Fisk is Fisk. He pays his share to Esteban and distributes the goods he mostly gets from the pirates.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Fisk_01_02");	//I don't think he really cares about Esteban.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_emilio()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Emilio_15_00");	//Emilio. What does he think about Esteban?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Emilio_01_01");	//I don't think he'd bring any flowers to Esteban's grave, if you know what I mean.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_senyan()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Senyan_15_00");	//What about Senyan?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Senyan_01_01");	//Senyan is one of Esteban's boys. He's been working for him for quite a while.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};

func void dia_addon_snaf_people_lennar()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Lennar_15_00");	//What does Lennar think about Esteban?
	AI_Output(self,other,"DIA_Addon_Snaf_People_Lennar_01_01");	//As far as I can tell, Lennar doesn't think AT ALL.
};

func void dia_addon_snaf_people_finn()
{
	AI_Output(other,self,"DIA_Addon_Snaf_People_Finn_15_00");	//What about Finn?
	if(b_giveinvitems(other,self,itmi_gold,SNAF_TIP_KOSTEN))
	{
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_01");	//A good digger. He has a nose for gold.
		AI_Output(self,other,"DIA_Addon_Snaf_People_Finn_01_02");	//Esteban favors him because of it. I think he's in pretty good standing with him.
	}
	else
	{
		b_addon_snaf_notenough();
	};
};


instance DIA_ADDON_SNAF_HIMSELF(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 7;
	condition = dia_addon_snaf_himself_condition;
	information = dia_addon_snaf_himself_info;
	permanent = FALSE;
	description = "What do YOU think of Esteban?";
};


func int dia_addon_snaf_himself_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_snaf_attentat) && !Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_himself_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_Himself_15_00");	//What do YOU think of Esteban?
	AI_Output(self,other,"DIA_Addon_Snaf_Himself_01_01");	//Whoever talks about him is soon dead...
};


instance DIA_ADDON_SNAF_PERM(C_INFO)
{
	npc = bdt_1098_addon_snaf;
	nr = 8;
	condition = dia_addon_snaf_perm_condition;
	information = dia_addon_snaf_perm_info;
	permanent = TRUE;
	description = "How's business?";
};


func int dia_addon_snaf_perm_condition()
{
	if(Npc_IsDead(esteban))
	{
		return TRUE;
	};
};

func void dia_addon_snaf_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Snaf_PERM_15_00");	//How's business?
	AI_Output(self,other,"DIA_Addon_Snaf_PERM_01_01");	//Good! Esteban's death is a reason for some here to celebrate...
};

