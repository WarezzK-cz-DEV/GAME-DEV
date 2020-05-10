
instance DIA_SYLVIODJG_EXIT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 999;
	condition = dia_sylviodjg_exit_condition;
	information = dia_sylviodjg_exit_info;
	important = 0;
	permanent = 1;
	description = DIALOG_ENDE;
};


func int dia_sylviodjg_exit_condition()
{
	return 1;
};

func void dia_sylviodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_HELLOAGAIN(C_INFO)
{
	npc = djg_700_sylvio;
	condition = dia_sylviodjg_helloagain_condition;
	information = dia_sylviodjg_helloagain_info;
	important = TRUE;
};


func int dia_sylviodjg_helloagain_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_helloagain_info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//Well, I'll be damned. Looking for profit, huh? I knew it! You've got the soul of a mercenary.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//Listen, if you think you can make a pile here, you're thoroughly mistaken. I was here first.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//Hey, you! Magicians make me nervous! Go somewhere else! There's nothing here.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//Hey, you, paladin! Go back to your ore mine. There's nothing here.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//Understood. Nobody likes to part with his booty.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//You said it. Disappear.
};


instance DIA_SYLVIO_VERSAGER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 6;
	condition = dia_sylvio_versager_condition;
	information = dia_sylvio_versager_info;
	description = "And what if I won't go?";
};


func int dia_sylvio_versager_condition()
{
	if(Npc_KnowsInfo(other,dia_sylviodjg_helloagain) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_versager_info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//And what if I won't go?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//Don't play the big man here, squirt, otherwise you'll wind up just like those poor swine lying dead back there in the snow.
};


instance DIA_SYLVIO_DEINELEUTE(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 7;
	condition = dia_sylvio_deineleute_condition;
	information = dia_sylvio_deineleute_info;
	description = "Those were your people?";
};


func int dia_sylvio_deineleute_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_DJG_SYLVIO_KILLICEGOLEM == 0))
	{
		return TRUE;
	};
};

func void dia_sylvio_deineleute_info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//Those were your people?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//Not any more. No big loss. Those idiots weren't worth much anyway.
};


instance DIA_SYLVIO_WASISTPASSIERT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 8;
	condition = dia_sylvio_wasistpassiert_condition;
	information = dia_sylvio_wasistpassiert_info;
	description = "What happened to them?";
};


func int dia_sylvio_wasistpassiert_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasistpassiert_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//What happened to them?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//They weren't able to get past the big ice giants back there and got stamped out by them.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//If you're such a tough guy, why don't you give it a try?
	Info_AddChoice(dia_sylvio_wasistpassiert,"All right, then. Why not?",dia_sylvio_wasistpassiert_ok);
	Info_AddChoice(dia_sylvio_wasistpassiert,"How would it help you if I did it?",dia_sylvio_wasistpassiert_washastdudavon);
	Info_AddChoice(dia_sylvio_wasistpassiert,"What's in it for me?",dia_sylvio_wasistpassiert_warum);
	Info_AddChoice(dia_sylvio_wasistpassiert,"Why don't you get rid of them yourself?",dia_sylvio_wasistpassiert_selbst);
	Log_CreateTopic(TOPIC_SYLVIOKILLICEGOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SYLVIOKILLICEGOLEM,LOG_RUNNING);
	b_logentry(TOPIC_SYLVIOKILLICEGOLEM,"Sylvio's scared of the two ice golems at the entrance to the ice region in the Valley of Mines.");
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_RUNNING;
};

func void dia_sylvio_wasistpassiert_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//Why don't you get rid of them yourself?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//Come, come. Don't puff yourself up like that.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//If you ask me, you're scared shitless.
	Info_AddChoice(dia_sylvio_wasistpassiert,"I'm not playing your little games.",dia_sylvio_wasistpassiert_keininteresse);
};


var int djg_sylvio_promisedmoney;

func void dia_sylvio_wasistpassiert_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//What's in it for me?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//Dunno. Let's say...1000 gold pieces. How's that sound?
	DJG_SYLVIO_PROMISEDMONEY = TRUE;
};

func void dia_sylvio_wasistpassiert_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//How would it help you if I did it?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//It's all the same to you. But to answer your question, I want to go into the ice region.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//Unfortunately, those damned things are in my way.
	Info_AddChoice(dia_sylvio_wasistpassiert,"What do you want to do in the ice region?",dia_sylvio_wasistpassiert_eisregion);
};

func void dia_sylvio_wasistpassiert_keininteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//I'm not playing your little games.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//Ahh. Then get out of here, you coward.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasistpassiert_eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//What do you want to do in the ice region?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//You don't stop with the questions, do you? All right, I'll tell you.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//Here, behind these cliffs, is a wasteland of ice like you've never seen before.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//A jewel of an ice dragon is hiding there with his fat hoard.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//I want it. So, what's it to be? Yes or no?
};

func void dia_sylvio_wasistpassiert_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//All right, then. Why not?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//Then hurry up. I haven't got all day.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ICEGOLEMSKILLED(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 9;
	condition = dia_sylvio_icegolemskilled_condition;
	information = dia_sylvio_icegolemskilled_info;
	description = "Your path is clear! Your ice giants are no more.";
};


func int dia_sylvio_icegolemskilled_condition()
{
	if(Npc_IsDead(icegolem_sylvio1) && Npc_IsDead(icegolem_sylvio2) && (MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_RUNNING) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_icegolemskilled_info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//Your path is clear! Your ice giants are no more.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//Good work. Let's see what we have.
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//Just a moment. What about the money?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//All in its own good time.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_SYLVIODJGICEGOLEMDEAD);
	Npc_ExchangeRoutine(self,"IceWait1");
	b_startotherroutine(djg_bullco,"IceWait1");
};


instance DIA_SYLVIO_WASJETZT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 10;
	condition = dia_sylvio_wasjetzt_condition;
	information = dia_sylvio_wasjetzt_info;
	description = "What next?";
};


func int dia_sylvio_wasjetzt_condition()
{
	if((MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_SUCCESS) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasjetzt_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//What next?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//Well. I'd say it looks pretty bad.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//The best thing is you go ahead and I'll just follow you.
	Info_AddChoice(dia_sylvio_wasjetzt,"All right, then.",dia_sylvio_wasjetzt_ok);
	Info_AddChoice(dia_sylvio_wasjetzt,"Are you afraid?",dia_sylvio_wasjetzt_trennen);
	Info_AddChoice(dia_sylvio_wasjetzt,"I won't do the dirty work for you.",dia_sylvio_wasjetzt_nein);
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		Info_AddChoice(dia_sylvio_wasjetzt,"First, I want to see my money.",dia_sylvio_wasjetzt_geld);
	};
};

func void dia_sylvio_wasjetzt_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//Are you afraid?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//Nonsense, cut out the drivel. Now move.
};

func void dia_sylvio_wasjetzt_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//All right, then.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//Well, go on. Hop to it.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//I won't do the dirty work for you.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//Coward!
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//First, I want to see my money.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//Once we've got the dragon, you can have as much gold as you can carry.
	Info_AddChoice(dia_sylvio_wasjetzt,"I want my money now.",dia_sylvio_wasjetzt_jetztgeld);
};

func void dia_sylvio_wasjetzt_jetztgeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//I want my money now.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//Either you go in front or you'll have me to deal with.
};


instance DIA_SYLVIO_KOMMSTDU(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_kommstdu_condition;
	information = dia_sylvio_kommstdu_info;
	permanent = TRUE;
	description = "I thought you were headed for the ice region.";
};


func int dia_sylvio_kommstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_wasjetzt) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_kommstdu_info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//I thought you were headed for the ice region.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//Go ahead in front. I'll be right behind you.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_DUHIER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_duhier_condition;
	information = dia_sylvio_duhier_info;
	permanent = TRUE;
	description = "I could use some help.";
};


func int dia_sylvio_duhier_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_sylvio_duhier_info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//I could use some help.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//Nonsense. You're doing great.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_WHATNEXT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 12;
	condition = dia_sylviodjg_whatnext_condition;
	information = dia_sylviodjg_whatnext_info;
	important = TRUE;
};


func int dia_sylviodjg_whatnext_condition()
{
	if(Npc_IsDead(icedragon))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_whatnext_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//The ice dragon is dead! And now give me everything you have on you!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//No way in hell!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//It's me who's going to be famous for slaying the ice dragon.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//Your small role in this matter is over!
	TOPIC_END_SYLVIOKILLICEGOLEM = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_sylviodjg_whatnext);
	Info_AddChoice(dia_sylviodjg_whatnext,DIALOG_ENDE,dia_sylviodjg_whatnext_attack);
};

func void dia_sylviodjg_whatnext_attack()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(djg_bullco,"Start");
	b_logentry(TOPIC_DRAGONHUNTER,"That dirty pig Sylvio was after claiming my victory over the ice dragons. There was a bit of an argument.");
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIODJG_BUTNOW(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 13;
	condition = dia_sylviodjg_butnow_condition;
	information = dia_sylviodjg_butnow_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_sylviodjg_butnow_condition()
{
	if(Npc_IsDead(icedragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,dia_sylviodjg_whatnext))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_butnow_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//It's time to settle the score.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIO_PICKPOCKET(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 900;
	condition = dia_sylvio_pickpocket_condition;
	information = dia_sylvio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_sylvio_pickpocket_condition()
{
	return c_beklauen(78,560);
};

func void dia_sylvio_pickpocket_info()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_BACK,dia_sylvio_pickpocket_back);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_PICKPOCKET,dia_sylvio_pickpocket_doit);
};

func void dia_sylvio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sylvio_pickpocket);
};

func void dia_sylvio_pickpocket_back()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
};

