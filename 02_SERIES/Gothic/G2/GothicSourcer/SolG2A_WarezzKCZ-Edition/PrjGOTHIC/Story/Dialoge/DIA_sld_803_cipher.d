
instance DIA_CIPHER_EXIT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 999;
	condition = dia_cipher_exit_condition;
	information = dia_cipher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipher_exit_condition()
{
	return TRUE;
};

func void dia_cipher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HELLO(C_INFO)
{
	npc = sld_803_cipher;
	nr = 1;
	condition = dia_cipher_hello_condition;
	information = dia_cipher_hello_info;
	permanent = FALSE;
	description = "What's up?";
};


func int dia_cipher_hello_condition()
{
	return TRUE;
};

func void dia_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//How are things?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//Hey, don't I know you from somewhere?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//It's possible...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//I used to deal in swampweed back in the colony, remember?
};


instance DIA_CIPHER_TRADEWHAT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_tradewhat_condition;
	information = dia_cipher_tradewhat_info;
	permanent = FALSE;
	description = "And what are you dealing in now?";
};


func int dia_cipher_tradewhat_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello))
	{
		return TRUE;
	};
};

func void dia_cipher_tradewhat_info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//And what are you dealing in now?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//Ah, don't ask.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//I brought a whole package of swampweed with me from the mining colony.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//Many of the mercenaries like a little smoke now and then. I've earned a small fortune on the side.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//But some bastard stole all the weed from my chest!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"The mercenary Cipher has lost a package of swampweed.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//I'm pretty sure it was that Bodo. He bunks in the same room as me, and he always grins at me like such an idiot...
		b_logentry(TOPIC_CIPHERPAKET,"He suspects Bodo of stealing it.");
	};
	MIS_CIPHER_PAKET = LOG_RUNNING;
};


instance DIA_CIPHER_DOWITHTHIEF(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dowiththief_condition;
	information = dia_cipher_dowiththief_info;
	permanent = FALSE;
	description = "What are you going to do about the thief, then?";
};


func int dia_cipher_dowiththief_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_dowiththief_info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//What are you going to do about the thief, then?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//One of these days, I'll catch him puffing away on my weed.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//And then I'll find a quiet spot and teach him a lesson he won't forget.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//If I knock him down here in the middle of the yard, the other farmers will notice, and I'll pay an arm and a leg.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//How come?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//Quite simple. We can't rough up the farmers, otherwise Lee makes us pay a heavy fine. That's the way Onar wants it.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//And the more witnesses there are, the more of a fuss there is. That makes things more expensive.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//So I'll pull the thing off nice and inconspicuously...
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "I want to join Lee's people!";
};


func int dia_cipher_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//I want to join Lee's people!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//LEE'S people?! If Lee keeps on this way, they soon won't be his any more!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//Why?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//Lee has always been a quiet one. It was that way in the colony, too.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//But lately, he's overdoing it. He just wants to sit here and wait until the paladins drop dead from starvation.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//Sylvio thinks we should clean up a bit on the small farms and outside the city.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//I think that would make for an excellent change.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//At the moment, most of us are just twiddling our thumbs here - do you want to join up anyway?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "I want to become one of you no matter what!";
};


func int dia_cipher_yesjoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_yesjoin_info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//I want to become one of you no matter what!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//You already know that we take a vote on every new recruit?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//What are you hinting at?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//Well, I haven't had anything to smoke in a long time. Bring me a few swampweed reefers and you've got my vote.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//You can surely scare some up someplace.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"Cipher will give me his vote if I bring him some stalks of swampweed.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "About the swampweed...";
};


func int dia_cipher_joints_condition()
{
	if(MIS_CIPHER_BRINGWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cipher_joints_info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//About the swampweed...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//You brought back my packet! Now everything will be all right.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//I'm certainly going to vote for you...
			b_logentry(TOPIC_SLDRESPEKT,"Cipher will vote for me when I join the mercenaries.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"I'll see what I can do...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"Here's a few stalks for you...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//I'll see what I can do...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//Here's a few stalks for you...
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//Ah! You are my man!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//You've got my vote.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"Cipher will vote for me when I join the mercenaries.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//That's all? I can smoke that much in one sitting!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//It's got to be at least 10 reefers.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//At any rate, you've got my vote for joining us.
		};
	};
	Info_ClearChoices(dia_cipher_joints);
};


instance DIA_CIPHER_TRADE(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_trade_condition;
	information = dia_cipher_trade_info;
	permanent = TRUE;
	description = DIALOG_TRADE_V4;
	trade = TRUE;
};


func int dia_cipher_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//Show me your wares.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//Sure. Help yourself.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//I don't have any swampweed at the moment. Do you want something else?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "I know who took your weed.";
};


func int dia_cipher_dardieb_condition()
{
	if(((DAR_DIEB == TRUE) || (DAR_VERDACHT == TRUE)) && !Npc_IsDead(dar))
	{
		return TRUE;
	};
};

func void dia_cipher_dardieb_info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//I know who took your weed.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//Who? Was it that Bodo?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//No - one of the mercenaries did it - Dar.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//That bastard - where is he?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//Finding him won't help you, he doesn't have the package any more. He sold it in Khorinis.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//WHERE IS HE!?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//Behind the kitchen building, on the corner...
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//I'LL FLATTEN HIM!
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,dar,AR_NONE,0);
};


instance DIA_CIPHER_DARLOST(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_darlost_condition;
	information = dia_cipher_darlost_info;
	permanent = FALSE;
	description = "You really gave Dar what for... are you feeling better now?";
};


func int dia_cipher_darlost_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipher_darlost_info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//You really gave Dar what for... are you feeling better now?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(sighs) Yeah, that felt good.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//Not to HIM, I suppose...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//The little beggar has no business going through my chest!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "Would this package of swampweed happen to be yours?";
};


func int dia_cipher_krautpaket_condition()
{
	if((Npc_HasItems(other,itmi_herbpaket) > 0) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cipher_krautpaket_info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//Would this package of swampweed happen to be yours?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//Well, I'll be! Where did you get that?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//It's a long story...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//Doesn't matter, really, you're a decent guy.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//Here, take this as a reward. Have fun with it!
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//First let me roll a few...
	CreateInvItems(self,itmi_joint,40);
	Npc_RemoveInvItems(self,itmi_herbpaket,1);
	MIS_CIPHER_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_CIPHERPAKET);
};


instance DIA_CIPHERSLD_PICKPOCKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 900;
	condition = dia_ciphersld_pickpocket_condition;
	information = dia_ciphersld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ciphersld_pickpocket_condition()
{
	return c_beklauen(65,65);
};

func void dia_ciphersld_pickpocket_info()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_BACK,dia_ciphersld_pickpocket_back);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_PICKPOCKET,dia_ciphersld_pickpocket_doit);
};

func void dia_ciphersld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cipher_pickpocket);
};

func void dia_ciphersld_pickpocket_back()
{
	Info_ClearChoices(dia_cipher_pickpocket);
};

