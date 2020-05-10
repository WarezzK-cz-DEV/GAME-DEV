
instance DIA_CORNELIUS_EXIT(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 999;
	condition = dia_cornelius_exit_condition;
	information = dia_cornelius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cornelius_exit_condition()
{
	return TRUE;
};

func void dia_cornelius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_SEEMURDER(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_seemurder_condition;
	information = dia_cornelius_seemurder_info;
	permanent = FALSE;
	description = "You saw the murder of Lothar, didn't you?";
};


func int dia_cornelius_seemurder_condition()
{
	if(RECUEBENNET_KNOWSCORNELIUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_seemurder_info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//You saw the murder of Lothar, didn't you?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(nervously) I need not answer any questions about a current investigation.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//Lord Hagen already has everything I know on record.
};


instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 5;
	condition = dia_cornelius_whatyousee_condition;
	information = dia_cornelius_whatyousee_info;
	permanent = FALSE;
	description = "What was it you saw?";
};


func int dia_cornelius_whatyousee_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_seemurder))
	{
		return TRUE;
	};
};

func void dia_cornelius_whatyousee_info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//What was it you saw?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(hectically) Really, I haven't got any time now.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(hectically) You need to go now, the office is closing.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius is refusing to speak to me.");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 6;
	condition = dia_cornelius_enough_condition;
	information = dia_cornelius_enough_info;
	permanent = FALSE;
	description = "Enough of that! What did you see?";
};


func int dia_cornelius_enough_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_whatyousee))
	{
		return TRUE;
	};
};

func void dia_cornelius_enough_info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//Enough of that! What did you see?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(nervously) I... I saw how the mercenary struck down the paladin from behind.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(nervously) And then he took his sword and rammed it through his chest.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//Are you completely sure?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(scared) Yes, of course. I saw it with my own eyes.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(scared) But I really haven't got any time now, there's a huge pile of paperwork I need to do.
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_dontbelieveyou_condition;
	information = dia_cornelius_dontbelieveyou_info;
	permanent = TRUE;
	description = "I don't believe you.";
};


func int dia_cornelius_dontbelieveyou_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_enough) && (CORNELIUS_TELLTRUTH != TRUE))
	{
		return TRUE;
	};
};

func void dia_cornelius_dontbelieveyou_info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//I don't believe you.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(with fake confidence) So what, what are you going to do about it?
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"What are you asking?",dia_cornelius_dontbelieveyou_whatyouwant);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"You hold your life dear, don't you?",dia_cornelius_dontbelieveyou_wantsurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"They could make you talk in the monastery.",dia_cornelius_dontbelieveyou_monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"I could tell the mercenaries where you live.",dia_cornelius_dontbelieveyou_knowyourhome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"Perjury will land you in the slammer - for a long time!",dia_cornelius_dontbelieveyou_perjury);
	};
};

func void dia_cornelius_dontbelieveyou_whatyouwant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//What is it you want?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(arrogantly) You don't even have enough gold to pay me.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//How much?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 gold pieces. Well, that could make me rethink the matter.
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius would be prepared to speak to me for 2000 pieces of gold.");
	CORNELIUS_PAYFORPROOF = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_wantsurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//You hold your life dear, don't you?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(scared) If you attack me, they'll hang you.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//I have powerful friends. So don't you dare lay a finger on me.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//Now get out of here! Or I'll call the guards!
	AI_StopProcessInfos(self);
};

func void dia_cornelius_dontbelieveyou_monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//They could make you talk in the monastery.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(white as chalk) What do you mean by that?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//Well, we have ways to bring out the truth. Painful ways.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//No, please don't. I'll tell you everything you want.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_knowyourhome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//I could tell the mercenaries where you live.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(white as chalk) What is that supposed to mean?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//I bet they're dying to make your acquaintance. They are not very happy at all.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//You can't do that, they would kill me.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//That is very well possible.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//I'll say whatever you want, but you mustn't do that.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//Perjury will land you in the slammer - for a long time!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//You're trying to threaten me? A little guardsman is threatening me, the secretary to the governor?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//If you don't get lost right now, I'll see to it that you are demoted.
	CORNELIUS_THREATENBYMILSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PAYCORNELIUS(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_paycornelius_condition;
	information = dia_cornelius_paycornelius_info;
	permanent = FALSE;
	description = "Here's the gold.";
};


func int dia_cornelius_paycornelius_condition()
{
	if((CORNELIUS_PAYFORPROOF == TRUE) && (Npc_HasItems(other,itmi_gold) >= 2000))
	{
		return TRUE;
	};
};

func void dia_cornelius_paycornelius_info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//Here's the gold.
	b_giveinvitems(other,self,itmi_gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//It's better if I don't ask you where you got that.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//To be honest, I don't really care.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//But we're in business.
	CORNELIUS_TELLTRUTH = TRUE;
};


instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_realstory_condition;
	information = dia_cornelius_realstory_info;
	permanent = TRUE;
	description = "So what really happened?";
};


func int dia_cornelius_realstory_condition()
{
	if(CORNELIUS_TELLTRUTH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_realstory_info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//So what really happened?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//I didn't see what happened. I received some gold for blaming that mercenary.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//In times like these, it's everyone for himself. I needed the money.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//Who paid you?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//That's enough. He'll kill me if I rat him out.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//Are you ready to tell that to Lord Hagen, too?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//I'm not a lunatic. I can't stay in town now.
	if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//I'll give you my diary, that should be proof enough.
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
	};
	b_logentry(TOPIC_RESCUEBENNET,"Cornelius lied. He was paid to get Bennet into jail. But he won't tell me who bribed him. He's trembling with fear.");
	CORNELIUSFLEE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_CORNELIUS_FLEEING(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 1;
	condition = dia_cornelius_fleeing_condition;
	information = dia_cornelius_fleeing_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_cornelius_fleeing_condition()
{
	if((CORNELIUSFLEE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cornelius_fleeing_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 900;
	condition = dia_cornelius_pickpocket_condition;
	information = dia_cornelius_pickpocket_info;
	permanent = TRUE;
	description = "(It would be risky to steal his book)";
};


func int dia_cornelius_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_cornelius_pickpocket_info()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_BACK,dia_cornelius_pickpocket_back);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_PICKPOCKET,dia_cornelius_pickpocket_doit);
};

func void dia_cornelius_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_cornelius_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_cornelius_pickpocket_back()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
};

