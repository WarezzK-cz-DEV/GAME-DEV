
instance DIA_GRITTA_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_exit_condition;
	information = dia_gritta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_gritta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PICKPOCKET(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 900;
	condition = dia_gritta_pickpocket_condition;
	information = dia_gritta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_gritta_pickpocket_condition()
{
	return c_beklauen(20,20);
};

func void dia_gritta_pickpocket_info()
{
	Info_ClearChoices(dia_gritta_pickpocket);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_BACK,dia_gritta_pickpocket_back);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_PICKPOCKET,dia_gritta_pickpocket_doit);
};

func void dia_gritta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gritta_pickpocket);
};

func void dia_gritta_pickpocket_back()
{
	Info_ClearChoices(dia_gritta_pickpocket);
};


instance DIA_GRITTA_HELLO(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 10;
	condition = dia_gritta_hello_condition;
	information = dia_gritta_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_hello_info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//What do you want, stranger? I f you have come to beg, I must disappoint you. I am a poor widow.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//My name is Gritta. Ever since my husband died, I have been running the household for my uncle, Thorben.
};


instance DIA_GRITTA_WANTSMONEY(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wantsmoney_condition;
	information = dia_gritta_wantsmoney_info;
	permanent = FALSE;
	description = "Matteo sent me. You still owe him some gold.";
};


func int dia_gritta_wantsmoney_condition()
{
	if(MIS_MATTEO_GOLD == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int gritta_wantpay;
var int gritta_threatened;

func void dia_gritta_wantsmoney_info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//Matteo sent me. You still owe him some gold.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//He wants his money? What for? The goods he delivered were flawed, bad fabric and bad seams.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//And did you look at the colors? Those are not the colors I ordered. That's fraud, it is!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//Let me tell you, back when my husband was alive, he wouldn't have dared to do that. Oh, my poor husband...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Cut it out. Where's the dough?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Continue...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//... such a good man he was. Handsome, hard-working, a gentleman of the old school. We had it all, wealth, happiness...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//... sometimes we were even invited to high society events. The festivities, all the beautiful clothes and hairdos...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//... the fine dining and civilized conversations. Everything was better back then. No one would have dared to humiliate the heart of a poor widow with such...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Cut it out. Where's the dough?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Continue...",dia_gritta_wantsmoney_continue02);
};

func void dia_gritta_wantsmoney_continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//... ridiculous claims. Whatever shall I do? My pension is barely enough to make ends meet, and times are getting even rougher. One sees it everywhere...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//... people must scrimp and save. It's been weeks since the last ship came to town. My husband was the captain of a merchant ship - actually, he even owned the ship...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//... from his long journeys, he always brought me presents - exquisite fabrics from the mainland, precious spices from the southern countries...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Cut it out. Where's the dough?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Continue...",dia_gritta_wantsmoney_continue03);
};

func void dia_gritta_wantsmoney_continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//... most people haven't even heard of these things. But then, one day I got the tidings that the Gritta had sunk - that was the name of the ship, my husband called it that out of...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//... love for me. I wept and prayed that my husband had survived the disaster, every day I hoped to hear from him, but all my longing was in vain...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//... may Innos have mercy on his soul. May he rest in peace. Since that time I have been living under these modest circumstances, and now this soulless, callous Matteo...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//... is after the last bit of my life savings. Please have mercy on a poor woman. Back when my husband was alive, he wouldn't have dared to do that. Oh, my poor husband...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Cut it out. Where's the gold?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Continue...",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_wheremoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//Cut it out. Where's the gold?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(defiantly) But I don't have the gold, I'm only a poor widow!
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"Fork over the dough, or I'll slug you one!",dia_gritta_wantsmoney_beatup);
	Info_AddChoice(dia_gritta_wantsmoney,"Guess we'll just have to sell your stuff...",dia_gritta_wantsmoney_enoughstuff);
	Info_AddChoice(dia_gritta_wantsmoney,"I'm going to pay the sum for you.",dia_gritta_wantsmoney_iwillpay);
};

func void dia_gritta_wantsmoney_enoughstuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//Then we'll simply sell a few of your togs. I'm sure you've still got a bunch of stuff in your closet...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//How dare you, uncouth lout! All right, here, take the gold.
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(grins) See, that wasn't so hard.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(tartly) And now will you please leave my house.
	GRITTA_GOLDGIVEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gritta_wantsmoney_iwillpay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//I'm going to pay the sum for you.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//You would do that for me? Oh, I knew you weren't a greedy bastard like that Matteo!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//Yeah, yeah, never mind.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//Come back once you've taken care of that - I want to show you my gratitude.
	Info_ClearChoices(dia_gritta_wantsmoney);
	GRITTA_WANTPAY = TRUE;
};

func void dia_gritta_wantsmoney_beatup()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(menacing) Fork over the dough, or I'll slug you one!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(defiantly) You're nothing but a common thug. Go ahead, draw your weapon, and I'll call the guards!
	GRITTA_THREATENED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_WINE(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wine_condition;
	information = dia_gritta_wine_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_wine_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GRITTA_WANTPAY == TRUE) && (MIS_MATTEO_GOLD == LOG_SUCCESS) && (Npc_HasItems(self,itmi_gold) >= 80))
	{
		return TRUE;
	};
};

func void dia_gritta_wine_info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//It was very noble of you to pay for me. I want to show you my gratitude.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//Here's a bottle of wine which my husband, may Innos rest his soul, brought back from the southern islands.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//Also, I'm going to spread the news around. At last there's somebody in town whose virtue...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//Yeah, yeah, never mind.
	b_giveplayerxp(XP_PAYFORGRITTA);
	b_giveinvitems(self,other,itfo_wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PERM(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 3;
	condition = dia_gritta_perm_condition;
	information = dia_gritta_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gritta_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_gritta_wantsmoney) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_gritta_perm_info()
{
	if(Npc_KnowsInfo(other,dia_gritta_wine) && (Npc_HasItems(self,itmi_gold) >= 80))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//As long as there are men like you in this town, I still have the hope that everything will turn out well.
	}
	else if((GRITTA_WANTPAY == TRUE) && (Npc_HasItems(self,itmi_gold) >= 80))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//Come back when the matter with Matteo is settled.
	}
	else if((GRITTA_THREATENED == TRUE) && (Npc_HasItems(self,itmi_gold) >= 80))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//Why are you staring like an idiot? You won't dare to attack me anyway!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//What else do you want? You've got my gold! Go away!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_KAP3_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_kap3_exit_condition;
	information = dia_gritta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_gritta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int grittaxp_once;

instance DIA_GRITTA_PERM3U4U5(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 31;
	condition = dia_gritta_perm3u4u5_condition;
	information = dia_gritta_perm3u4u5_info;
	permanent = TRUE;
	description = "How's it going?";
};


func int dia_gritta_perm3u4u5_condition()
{
	return TRUE;
};

func void dia_gritta_perm3u4u5_info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//How's it going?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//Everything's going to the dogs here. Wherever you look, there's crime and violence. Just imagine, they even murdered one of the paladins.
			Info_ClearChoices(dia_gritta_perm3u4u5);
			Info_AddChoice(dia_gritta_perm3u4u5,DIALOG_BACK,dia_gritta_perm3u4u5_back);
			Info_AddChoice(dia_gritta_perm3u4u5,"That's war for you, these things happen.",dia_gritta_perm3u4u5_war);
			Info_AddChoice(dia_gritta_perm3u4u5,"It'll be all right.",dia_gritta_perm3u4u5_turnsgood);
			Info_AddChoice(dia_gritta_perm3u4u5,"What have you heard?",dia_gritta_perm3u4u5_rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//Oh, I'm so thrilled, Lord Hagen has set the mercenary free.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//And how would that affect you?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//Just think about it. Do you believe the mercenaries would have stood by and watched one of their comrades get hanged?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//They would have tried to free him, and there would have been lots of bloodshed. I can only thank Innos.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//The paladins are getting ready, and it looks like they're going to move out soon.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//Same as always, but I don't want to complain.
	};
};

func void dia_gritta_perm3u4u5_back()
{
	Info_ClearChoices(dia_gritta_perm3u4u5);
};

func void dia_gritta_perm3u4u5_war()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//That's war for you, these things happen.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//Yes, there's this horrible war on top of it all. Everybody suffers and wonders how they are going to manage.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//Sometimes I ask myself what we have done to deserve such a punishment from Innos.
};

func void dia_gritta_perm3u4u5_turnsgood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//It'll be all right.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//You're trying to cheer me up - that's nice.
	if(GRITTAXP_ONCE == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		GRITTAXP_ONCE = TRUE;
	};
};

func void dia_gritta_perm3u4u5_rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//What have you heard?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//Only what they're telling each other in the street.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//I've heard that they already caught the murderer, but I can't tell you if that is true.
};

