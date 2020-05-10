
instance DIA_DJG_715_FERROS_EXIT(C_INFO)
{
	npc = djg_715_ferros;
	nr = 999;
	condition = dia_djg_715_ferros_exit_condition;
	information = dia_djg_715_ferros_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_djg_715_ferros_exit_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_FERROS_HELLO(C_INFO)
{
	npc = djg_715_ferros;
	nr = 4;
	condition = dia_djg_715_ferros_hello_condition;
	information = dia_djg_715_ferros_hello_info;
	permanent = FALSE;
	description = "Where do you come from?";
};


func int dia_djg_715_ferros_hello_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_hello_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//Where do you come from?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//From the mainland. My people and I fled here.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//The situation there is getting worse. The orcs leave nothing but burned-out villages behind.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//The king has lost control of his realm.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//You paladins have failed, if you ask me.
	};
};


instance DIA_DJG_715_FERROS_FRIENDS(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_djg_715_ferros_friends_condition;
	information = dia_djg_715_ferros_friends_info;
	permanent = FALSE;
	description = "Where are your people now?";
};


func int dia_djg_715_ferros_friends_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_friends_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//Where are your people now?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//I left them.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//They thought they could take everything they wanted, even if it doesn't belong to them. Count me out.
};


instance DIA_DJG_715_FERROS_WAR(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_war_condition;
	information = dia_djg_715_ferros_war_info;
	permanent = FALSE;
	description = "What else do you know about the war?";
};


func int dia_djg_715_ferros_war_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_war_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//What else do you know about the war?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//You haven't been to see your king in a long time, huh?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//The orcs are outside the capital. But whether it's fallen yet, I don't know.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//The last thing I heard was that the king is dead. But I don't believe that.
};


instance DIA_DJG_715_FERROS_OLDCAMP(C_INFO)
{
	npc = djg_715_ferros;
	nr = 7;
	condition = dia_djg_715_ferros_oldcamp_condition;
	information = dia_djg_715_ferros_oldcamp_info;
	permanent = FALSE;
	description = "What are you doing here in the castle?";
};


func int dia_djg_715_ferros_oldcamp_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_oldcamp_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//What are you doing here in the castle?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//I heard about the dragons and wanted to help fight them.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//Unfortunately, I lost my sword when I was sneaking past the orcs. Now I'm stuck here.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//Without a sword, I can't get out of here, and the swords I can buy here are the worst junk.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"I wish you luck with your search.",dia_djg_715_ferros_oldcamp_no);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"What will you give me if I find you a good sword?",dia_djg_715_ferros_oldcamp_price);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"I shall find your sword.",dia_djg_715_ferros_oldcamp_yes);
	Wld_InsertItem(itmw_1h_ferrossword_mis,"FP_OW_ITEM_08");
	MIS_FERROSSWORD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FERROSSWORD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERROSSWORD,LOG_RUNNING);
	b_logentry(TOPIC_FERROSSWORD,"Feros left his sword with the orcs. That was stupid.");
};

func void dia_djg_715_ferros_oldcamp_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//I wish you luck with your search.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//I really have to ask myself why I ever came here.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//What will you give me if I find you a good sword?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//Alas, I can't give you anything. I spent my last gold on the sword.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//I shall find your sword.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//That would be great. You should look for it on the high cliff to the south.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//I probably lost it there, near the orc tents.
	b_logentry(TOPIC_FERROSSWORD,"It seems Feros lost his sword on the tall cliff in the south, where the orc tents are.");
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};


instance DIA_DJG_715_FERROS_FERROSANYSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferrosanysword_condition;
	information = dia_djg_715_ferros_ferrosanysword_info;
	permanent = FALSE;
	description = "Maybe I've got another sword for you.";
};


func int dia_djg_715_ferros_ferrosanysword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && ((Npc_HasItems(other,itmw_1h_special_01) >= 1) || (Npc_HasItems(other,itmw_1h_special_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferrosanysword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//Maybe I've got another sword for you.
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,DIALOG_BACK,dia_djg_715_ferros_ferrosanysword_back);
	if(Npc_HasItems(other,itmw_1h_special_01) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,itmw_1h_special_01.name,dia_djg_715_ferros_ferrosanysword_silverblade);
	};
	if(Npc_HasItems(other,itmw_1h_special_02) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,itmw_1h_special_02.name,dia_djg_715_ferros_ferrosanysword_oreblade);
	};
};

func void dia_djg_715_ferros_ferrosanysword_back()
{
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void b_ferros_ferrosanysword_give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//That's a good blade. Really excellent work.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//Are you sure you want to give it to me just like that?
};

func void dia_djg_715_ferros_ferrosanysword_silverblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"No, I need it myself.",dia_djg_715_ferros_ferrosanysword_silverblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Yes, take it.",dia_djg_715_ferros_ferrosanysword_silverblade_yes);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"No, I need it myself.",dia_djg_715_ferros_ferrosanysword_oreblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"Yes, take it.",dia_djg_715_ferros_ferrosanysword_oreblade_yes);
};

func void b_ferros_ferrosanysword_yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");	//Yes, take it.
};

func void b_ferros_ferrosanysword_yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//Thanks, I owe you.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//In return, I'll show you a couple of tricks that will allow you to use your strength and dexterity better in combat.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"Feros can teach me to improve my strength and dexterity.");
};

func void b_ferros_ferrosanysword_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//No, I need it myself.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//I can understand.
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_01,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_02,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};


instance DIA_DJG_715_FERROS_FERROSHISSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferroshissword_condition;
	information = dia_djg_715_ferros_ferroshissword_info;
	permanent = FALSE;
	description = "I found your sword.";
};


func int dia_djg_715_ferros_ferroshissword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && (Npc_HasItems(other,itmw_1h_ferrossword_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferroshissword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//I found your sword.
	b_giveinvitems(other,self,itmw_1h_ferrossword_mis,1);
	b_ferros_ferrosanysword_yes2();
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};


instance DIA_FERROS_TEACH(C_INFO)
{
	npc = djg_715_ferros;
	nr = 1;
	condition = dia_ferros_teach_condition;
	information = dia_ferros_teach_info;
	permanent = TRUE;
	description = "Show me how to improve my abilities.";
};


func int dia_ferros_teach_condition()
{
	if(MIS_FERROSSWORD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ferros_teach_info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//Show me how to improve my abilities.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//After these orc attacks, I quit. I'm just glad to still be alive, man.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//A good fighter has to learn to transfer his abilities directly to his weapon.
		Info_ClearChoices(dia_ferros_teach);
		Info_AddChoice(dia_ferros_teach,DIALOG_BACK,dia_ferros_teach_back);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ferros_teach_str_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ferros_teach_str_5);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ferros_teach_dex_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ferros_teach_dex_5);
	};
};

func void dia_ferros_teach_back()
{
	Info_ClearChoices(dia_ferros_teach);
};

func void dia_ferros_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,T_MAX);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH,1)),dia_ferros_teach_str_1);
};

func void dia_ferros_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,T_MAX);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH,5)),dia_ferros_teach_str_5);
};

func void dia_ferros_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY,1)),dia_ferros_teach_dex_1);
};

func void dia_ferros_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY,5)),dia_ferros_teach_dex_5);
};


instance DIA_FERROS_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_ferros_alldragonsdead_condition;
	information = dia_ferros_alldragonsdead_info;
	permanent = FALSE;
	description = "All the dragons are dead.";
};


func int dia_ferros_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_ferros_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//All the dragons are dead.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//Well done! If we had more people like you, then it would probably never have gone this far.
};


instance DIA_FERROS_PICKPOCKET(C_INFO)
{
	npc = djg_715_ferros;
	nr = 900;
	condition = dia_ferros_pickpocket_condition;
	information = dia_ferros_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ferros_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_ferros_pickpocket_info()
{
	Info_ClearChoices(dia_ferros_pickpocket);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_BACK,dia_ferros_pickpocket_back);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_PICKPOCKET,dia_ferros_pickpocket_doit);
};

func void dia_ferros_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ferros_pickpocket);
};

func void dia_ferros_pickpocket_back()
{
	Info_ClearChoices(dia_ferros_pickpocket);
};

