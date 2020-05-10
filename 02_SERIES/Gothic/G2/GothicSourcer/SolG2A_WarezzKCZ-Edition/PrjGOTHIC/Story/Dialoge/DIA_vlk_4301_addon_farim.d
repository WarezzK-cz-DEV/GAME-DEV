
instance DIA_ADDON_FARIM_EXIT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 999;
	condition = dia_addon_farim_exit_condition;
	information = dia_addon_farim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_farim_exit_condition()
{
	return TRUE;
};

func void dia_addon_farim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_FARIM_PICKPOCKET(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 900;
	condition = dia_addon_farim_pickpocket_condition;
	information = dia_addon_farim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_farim_pickpocket_condition()
{
	return c_beklauen(20,11);
};

func void dia_addon_farim_pickpocket_info()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_BACK,dia_addon_farim_pickpocket_back);
	Info_AddChoice(dia_addon_farim_pickpocket,DIALOG_PICKPOCKET,dia_addon_farim_pickpocket_doit);
};

func void dia_addon_farim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_farim_pickpocket);
};

func void dia_addon_farim_pickpocket_back()
{
	Info_ClearChoices(dia_addon_farim_pickpocket);
};


instance DIA_ADDON_FARIM_HALLO(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_hallo_condition;
	information = dia_addon_farim_hallo_info;
	description = "You're a fisherman?";
};


func int dia_addon_farim_hallo_condition()
{
	return TRUE;
};

func void dia_addon_farim_hallo_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Hallo_15_00");	//You're a fisherman?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_01");	//(cynically) Now how did you ever guess that?
	AI_Output(self,other,"DIA_Addon_Farim_Hallo_11_02");	//Can't you simply leave me alone?
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_02");	//Don't take it personally, but I haven't been too happy with the militia lately.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_Add_11_03");	//Don't take it personally, but I haven't been too happy lately. It's that militia.
	};
};


instance DIA_ADDON_FARIM_MILIZPROBS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_milizprobs_condition;
	information = dia_addon_farim_milizprobs_info;
	description = "Trouble with the militia?";
};


func int dia_addon_farim_milizprobs_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_milizprobs_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_15_00");	//Trouble with the militia?
	if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_01");	//Those bastards keep coming here and taking whatever they want.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_02");	//Last week they made off with my entire catch. 'It's for a good cause,' they said.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_03");	//I know that everybody's got to fend for himself since the farmers have stopped trading.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_04");	//And, of course, sometimes people just go hungry. Small wonder that they're snatching the fish from right under my nose.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_11_05");	//But if they keep doing this, I won't even have enough to feed myself.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Info_AddChoice(dia_addon_farim_milizprobs,"Give me all your fish.",dia_addon_farim_milizprobs_klauen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Maybe I can help you.",dia_addon_farim_milizprobs_helfen);
	Info_AddChoice(dia_addon_farim_milizprobs,"Have you talked to the paladins about this?",dia_addon_farim_milizprobs_paladine);
};

func void dia_addon_farim_milizprobs_paladine()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_paladine_15_00");	//Have you talked to the paladins about this?
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_paladine_11_01");	//(laughs) Are you joking? Do you really think they'd be interested if a poor devil like me has his problems with the militia?
};


var int farim_pissedoff;

func void dia_addon_farim_milizprobs_klauen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_klauen_15_00");	//Give me all your fish.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_01");	//(angrily) I just KNEW it. Another of those scumbags.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_02");	//You're too late, I'm afraid. Your friends were here yesterday, and they took everything.
	};
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_klauen_11_04");	//Well. I guess you had better leave now.
	FARIM_PISSEDOFF = TRUE;
	Info_ClearChoices(dia_addon_farim_milizprobs);
};

func void dia_addon_farim_milizprobs_helfen()
{
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_00");	//Maybe I can help you.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_02");	//I don't know. I suppose you'd have to know somebody from the militia who has connections to the paladins.
	AI_Output(self,other,"DIA_Addon_Farim_MilizProbs_helfen_11_03");	//The paladins will hardly buy the fish from me.
	AI_Output(other,self,"DIA_Addon_Farim_MilizProbs_helfen_15_04");	//I shall see what I can do.
	Info_ClearChoices(dia_addon_farim_milizprobs);
	Log_CreateTopic(TOPIC_ADDON_FARIMSFISH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_FARIMSFISH,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_FARIMSFISH,"Farim the fisher has a problem with the militia. They take so much fish from him that he doesn't have enough to live on. I should find someone in the militia with influence on the paladins who can help him.");
	MIS_ADDON_FARIM_PALADINFISCH = LOG_RUNNING;
};


instance DIA_ADDON_FARIM_MARTINHELPS(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_martinhelps_condition;
	information = dia_addon_farim_martinhelps_info;
	description = "I know how to resolve your trouble with the militia.";
};


func int dia_addon_farim_martinhelps_condition()
{
	if((MIS_ADDON_FARIM_PALADINFISCH == LOG_RUNNING) && (MARTIN_KNOWSFARIM == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_farim_martinhelps_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_00");	//I know how to resolve your trouble with the militia.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_01");	//And how would that be?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_02");	//I'm not here often enough to keep a constant vigil on your fish.
		AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_03");	//But I know somebody who can do just that.
	};
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_04");	//Martin, the provisions master of the paladins, wants to hear your story about the militia and the fish.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_05");	//And you think he can make the militia leave me alone?
	AI_Output(other,self,"DIA_Addon_Farim_MartinHelps_15_06");	//At least that's what he said.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_07");	//Great. Thank you. I cannot give you much. But wait...
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_08");	//I found this strange blue stone on one of the islands off the coast of Khorinis.
	AI_Output(self,other,"DIA_Addon_Farim_MartinHelps_11_09");	//I don't think it's worth a whole lot, but someone like you will certainly find a use for it.
	b_giveinvitems(self,other,itmi_aquamarine,1);
	MIS_ADDON_FARIM_PALADINFISCH = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_FARIM_PALADINFISCH);
};


instance DIA_ADDON_FARIM_LANDSTREICHER(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_landstreicher_condition;
	information = dia_addon_farim_landstreicher_info;
	description = "Can you tell me something about the missing people?";
};


func int dia_addon_farim_landstreicher_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo) && (MIS_ADDON_VATRAS_WHEREAREMISSINGPEOPLE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_farim_landstreicher_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Landstreicher_15_01");	//Can you tell me something about the missing people?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_02");	//My friend William started hanging out with a bunch of shady characters. And where did it get him?
	AI_Output(self,other,"DIA_Addon_Farim_Landstreicher_11_03");	//One day he simply didn't show up for work, and that's the last we saw of him.
	SCKNOWSFARIMASWILLIAMSFRIEND = TRUE;
};


instance DIA_ADDON_FARIM_WILLIAM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 5;
	condition = dia_addon_farim_william_condition;
	information = dia_addon_farim_william_info;
	description = "Your buddy William has disappeared?";
};


func int dia_addon_farim_william_condition()
{
	if((SCKNOWSFARIMASWILLIAMSFRIEND == TRUE) && Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_william_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_15_00");	//Your buddy William has disappeared?
	AI_Output(self,other,"DIA_Addon_Farim_William_11_01");	//So he has. He's a fisherman, but a little too big for his boots, I should add.
	AI_Output(self,other,"DIA_Addon_Farim_William_11_02");	//He should have stayed well away from that bunch.
	Log_CreateTopic(TOPIC_ADDON_MISSINGPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_MISSINGPEOPLE,LOG_RUNNING);
	Log_AddEntry(TOPIC_ADDON_MISSINGPEOPLE,LOGTEXT_ADDON_WILLIAMMISSING);
	Info_ClearChoices(dia_addon_farim_william);
	Info_AddChoice(dia_addon_farim_william,"What bastards would those be?",dia_addon_farim_william_typen);
	Info_AddChoice(dia_addon_farim_william,"He'll surface again.",dia_addon_farim_william_auftauchen);
	Info_AddChoice(dia_addon_farim_william,"What's he been up to?",dia_addon_farim_william_wasgemacht);
	Info_AddChoice(dia_addon_farim_william,"When did you last see him?",dia_addon_farim_william_wannweg);
};

func void dia_addon_farim_william_wasgemacht()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WasGemacht_15_00");	//What's he been up to?
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_01");	//William had some shady dealings with those crooks.
	AI_Output(self,other,"DIA_Addon_Farim_William_WasGemacht_11_02");	//I think it was all about contraband that he sold to the bastards.
};

func void dia_addon_farim_william_typen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_typen_15_00");	//What bastards would those be?
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_01");	//I don't know who they are or what their business is here in Khorinis.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_02");	//I only know the place where they met up with William.
	AI_Output(self,other,"DIA_Addon_Farim_William_typen_11_03");	//I just happened to see William there when I was fishing in the bay.
	Info_AddChoice(dia_addon_farim_william,"Where exactly is that meeting place?",dia_addon_farim_william_wo);
};

func void dia_addon_farim_william_wo()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Wo_15_00");	//Where exactly is that meeting place?
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_01");	//There's a bay opposite the harbor, north of here.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_02");	//You can only reach it by boat, or swim.
	AI_Output(self,other,"DIA_Addon_Farim_William_Wo_11_03");	//There's a beach there, and a small fishing camp. That's where I saw them.
	self.flags = 0;
	Log_CreateTopic(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_WHOSTOLEPEOPLE,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_WHOSTOLEPEOPLE,"The fisherman Farim laments the loss of his pal William. Farim says that William frequently met with some cutthroats in a bay north of the harbor.");
	Info_AddChoice(dia_addon_farim_william,"I think I've heard enough.",dia_addon_farim_william_tschau);
};

func void dia_addon_farim_william_wannweg()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_WannWeg_15_00");	//When did you last see him?
	AI_Output(self,other,"DIA_Addon_Farim_William_WannWeg_11_01");	//Only a few days ago.
	Info_AddChoice(dia_addon_farim_william,"Maybe he just went out to sea to fish?",dia_addon_farim_william_fischen);
};

func void dia_addon_farim_william_fischen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Fischen_15_00");	//Maybe he just went out to sea to fish?
	AI_Output(self,other,"DIA_Addon_Farim_William_Fischen_11_01");	//That's not very likely. His boat is still moored in the harbor.
};

func void dia_addon_farim_william_auftauchen()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_auftauchen_15_00");	//He'll surface again.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_01");	//I don't think so. He's been gone for too long already.
	AI_Output(self,other,"DIA_Addon_Farim_William_auftauchen_11_02");	//I'm afraid that I'll be dragging his body from the sea at some point.
};

func void dia_addon_farim_william_tschau()
{
	AI_Output(other,self,"DIA_Addon_Farim_William_Tschau_15_00");	//I think I've heard enough.
	AI_Output(self,other,"DIA_Addon_Farim_William_Tschau_11_01");	//Spare yourself the effort. I don't believe you'll find him.
	Info_ClearChoices(dia_addon_farim_william);
};


instance DIA_ADDON_FARIM_PERM(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 99;
	condition = dia_addon_farim_perm_condition;
	information = dia_addon_farim_perm_info;
	permanent = TRUE;
	description = "So, how are the fish biting?";
};


func int dia_addon_farim_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_hallo))
	{
		return TRUE;
	};
};

func void dia_addon_farim_perm_info()
{
	AI_Output(other,self,"DIA_Addon_Farim_Perm_15_00");	//So, how are the fish biting?
	if(FARIM_PISSEDOFF == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_01");	//Stop pretending you're interested.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Farim_Perm_11_02");	//I've seen better times. Too little to live on, too much to die.
	};
};


instance DIA_ADDON_FARIM_WILLIAMREPORT(C_INFO)
{
	npc = vlk_4301_addon_farim;
	nr = 1;
	condition = dia_addon_farim_williamreport_condition;
	information = dia_addon_farim_williamreport_info;
	important = TRUE;
};


func int dia_addon_farim_williamreport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_farim_william))
	{
		if((Npc_HasItems(other,itwr_addon_william_01) > 0) || (SATURAS_ABOUTWILLIAM == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_farim_williamreport_info()
{
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_01");	//There you are again!
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_02");	//Have you heard news of my buddy William, then?
	AI_Output(other,self,"DIA_Addon_Farim_Add_15_02");	//He's dead.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_03");	//(sighs) Yeah, that's what I'd been expecting.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_04");	//Thanks for coming back here to tell me.
	AI_Output(self,other,"DIA_Addon_Farim_Add_11_05");	//I'll go down to the pub and drink up his share of our last catch - that's what he would have wanted...
};

