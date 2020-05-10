
var int diego_coming;

instance DIA_GERBRANDT_EXIT(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 999;
	condition = dia_gerbrandt_exit_condition;
	information = dia_gerbrandt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerbrandt_exit_condition()
{
	return TRUE;
};

func void dia_gerbrandt_exit_info()
{
	if(DIEGO_COMING == TRUE)
	{
		DIEGONW = Hlp_GetNpc(pc_thief_nw);
		if(DIEGO_ISONBOARD == FALSE)
		{
			b_startotherroutine(diegonw,"GERBRANDT");
		};
		Npc_ExchangeRoutine(self,"FLEE");
		b_startotherroutine(gerbrandtsfrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PICKPOCKET(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 900;
	condition = dia_gerbrandt_pickpocket_condition;
	information = dia_gerbrandt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gerbrandt_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)) && (DIEGO_COMING != TRUE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_pickpocket_info()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_BACK,dia_gerbrandt_pickpocket_back);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_PICKPOCKET,dia_gerbrandt_pickpocket_doit);
};

func void dia_gerbrandt_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_gerbrandt_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gerbrandt_pickpocket_back()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
};


instance DIA_GERBRANDT_HELLO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 5;
	condition = dia_gerbrandt_hello_condition;
	information = dia_gerbrandt_hello_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_gerbrandt_hello_condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hello_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//Who are you, then? Looks like you're new and have no idea what goes on around here.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//They call me Gerbrandt. To you, that's: Mr. Gerbrandt, sir. Got it?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"I got it, Gerbrandt.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"I get the point, Mr. Gerbrandt, sir.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//I got it, Gerbrandt.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Careful with that big mouth of yours. You had better show me a little more respect, or you're headed for all kinds of trouble here.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//I call the shots here. Whoever causes trouble has to answer to me and had better skip town in a hurry, because once I'm done with him, he'll wish he'd never laid eyes on me.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Most people around the harbor work for me. If you're ever looking for work, you had better see to it that my memories of you are pleasant ones.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//I get the point, Mr. Gerbrandt, sir.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//At least it didn't take you long to grasp how the wind blows around here.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//As soon as business starts picking up again, I can surely find a use for a strapping lad like you.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//You would make an excellent depot master.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Can you read?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"No.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"I don't want a job.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"Of course.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//No.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Never mind, at least you'll be able to lug a few sacks about.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//If I am satisfied with you, I might even offer you a permanent position. There is enough to do around here.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Well, then, I'll expect you when the first ships come back here to dock.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//I don't want a job.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//You think you're awfully clever. Watch it, no one can get a job here as long as I don't approve.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//So if you keep giving me the lip like that, you can find yourself a bug-infested straw tick to sleep on, because that will be all you can afford.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//The time will come when you'll beg me to give you a job.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Of course.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Fine, fine. Trained staff is hard to come by.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//How about your references?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//References?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//All right, I shall remember your face. Once trade picks up again, come and see me. I just might have a job for you then.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//What is that about - are you trying to mock me?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//You and your buddy Diego have wreaked enough havoc already.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Leave me alone!
	if(DIEGO_COMING != TRUE)
	{
		AI_StopProcessInfos(self);
	};
};


instance DIA_GERBRANDT_PERM(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 800;
	condition = dia_gerbrandt_perm_condition;
	information = dia_gerbrandt_perm_info;
	permanent = TRUE;
	description = "Any news?";
};


func int dia_gerbrandt_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_gerbrandt_hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_perm_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Anything new?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//People like you have no business up here. This is where the respectable society resides, and not tramps or crooks.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//If you should ever succeed in becoming wealthy and respectable, you might find yourself more welcome here.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//I cannot complain, honorable Sir.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//I have seen the likes of you - you simply don't know your place.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//I shall have a talk with the governor concerning appropriate safety measures for the upper end of town.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//That's nobody's business but mine. I'm busy!
			};
		}
		else
		{
			b_gerbrandt_pissoff();
		};
	};
};


instance DIA_GERBRANDT_GREETINGSFROMDIEGO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_greetingsfromdiego_condition;
	information = dia_gerbrandt_greetingsfromdiego_info;
	permanent = FALSE;
	description = "Diego says hello.";
};


func int dia_gerbrandt_greetingsfromdiego_condition()
{
	if((MIS_DIEGOSRESIDENCE == LOG_RUNNING) && (Npc_HasItems(other,itwr_diegosletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_greetingsfromdiego_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Diego says hello.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(scared) What? Who? What Diego?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//And he wants me to give you this letter.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(agitated) That can't be. No. I'm a goner!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(fearfully) Is he in town, then?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Who?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Diego, of course!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Yes, I am going to meet him here shortly.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(desperately, to himself) This is the end, then. All is lost.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//I've got no time, I need to get out of here. Quick. If he finds me here, I'm done for.
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

