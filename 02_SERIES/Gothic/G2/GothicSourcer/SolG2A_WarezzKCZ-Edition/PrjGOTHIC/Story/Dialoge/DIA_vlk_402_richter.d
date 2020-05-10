
instance DIA_RICHTER_EXIT(C_INFO)
{
	npc = vlk_402_richter;
	nr = 999;
	condition = dia_richter_exit_condition;
	information = dia_richter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_richter_exit_condition()
{
	return TRUE;
};

func void dia_richter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_HELLO(C_INFO)
{
	npc = vlk_402_richter;
	nr = 4;
	condition = dia_richter_hello_condition;
	information = dia_richter_hello_info;
	permanent = FALSE;
	description = "What are you doing here?";
};


func int dia_richter_hello_condition()
{
	if(MIS_LEE_JUDGERICHTER == 0)
	{
		return TRUE;
	};
};

func void dia_richter_hello_info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//What are you accosting me for? Who are you anyway?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//I, er...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//Say, don't I know you from somewhere?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"Not that I remember.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"Maybe so.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//Not that I remember.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//That's funny. I could have sworn I'd met you before.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//Never mind, you're obviously gutter scum anyway. You all look alike somehow.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//Maybe so.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//Don't get snotty! Who do you think you're talking to anyway?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//The least you can do is address me in a more appropriate tone.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//And now get out of my sight!
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "What's up?";
};


func int dia_richter_perm_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER == LOG_RUNNING)) && (SCISTRICHTERSLAKAI == FALSE))
	{
		return TRUE;
	};
};

func void dia_richter_perm_info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//How's it going?
	if((MIS_LEE_JUDGERICHTER == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//You'd better scram, you filthy mercenary, before I call the guards.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//Relax. I'm not here to steal from you. I'm looking for work.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//Ah. So you want to work for me. Hmm. That is, of course, a different matter.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//There is, alas, one minor problem. I don't know whether I can trust you. You will have to prove your loyalty first.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//Have I not made it clear that I want no contact with you?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//No, not in so many words.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//So I certainly hope you get the point now.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "Put me to the test.";
};


func int dia_richter_richterslakai_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER != 0)) && (SCISTRICHTERSLAKAI == TRUE))
	{
		return TRUE;
	};
};

func void dia_richter_richterslakai_info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//Put me to the test.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//Mmh. All right. Listen. Bring me the sacred hammer of the Magicians of Fire. They keep it somewhere in the basement of their monastery.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//If you pull that off, I might think about hiring you as a bodyguard.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"I'm supposed to steal from the magicians? You're off your rocker.",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"All right.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"The judge doesn't trust me. I've got to prove my loyalty to him. I'm to steal the sacred hammer from the cellar of the Fire Magicians' monastery and bring it to him.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//I'm supposed to steal from the magicians? You're off your rocker.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//Then go to hell and stop wasting my time.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//All right.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//Fine. But remember - if they catch you, I've never heard of you.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "Here's the sacred hammer of the magicians.";
};


func int dia_richter_killmorgahard_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) && (MIS_RICHTER_BRINGHOLYHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//Here's the sacred hammer of the magicians.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//I am truly impressed. You're really serious about this, aren't you? Here's your pay.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//Fine. If that's how it is, I have another task for you already.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//Some days ago, several prisoners escaped from the local jail.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//Those sumbitches have taken off to the mountains. Somewhere in the direction of Xardas' new tower.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//The name of their leader is Morgahard. I want you to kill him.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//Go hurry before they are gone for good.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"Some prisoners have escaped the judge. I'm to hunt them down and kill their leader MORGAHARD. They're supposedly hiding in the mountains, somewhere in the direction of Xardas' new tower.");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "Morgahard is dead.";
};


func int dia_richter_killedmorgahard_condition()
{
	if(Npc_IsDead(morgahard) && (MIS_RICHTER_KILLMORGAHARD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//Morgahard is dead.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//Ah. You're a good boy. Here's your reward.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"The judge was visibly amused by the news of Morgahard's death. Oh well, let him be. I mustn't lose sight of Lee's assignment.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "Is there anything else I could do for you?";
};


func int dia_richter_killedmorgahardperm_condition()
{
	if((MIS_RICHTER_KILLMORGAHARD == LOG_SUCCESS) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahardperm_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//Is there anything else I could do for you?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//Not right now. Maybe later.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "Give me a written authorization for the paladins' ship.";
};


func int dia_richter_permissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_richter_permissionforship_info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//Give me a written authorization for the paladins' ship.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(laughs) You've got to be out of your mind. What do you want me to do?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//You heard me all right. Give me that authorization, or I'll turn you in to the militia.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(bellows) I shall not be blackmailed. Least of all by you! I shall feed you to the wolves, you miserable piece of scum.
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//Morgahard assaulted the governor by your order. I am in possession of a document which can prove it.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(bellows) Arrh.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//You'll be sorry for this. No-one blackmails me and gets away with it.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//Here's your authorization. Now leave. I shall deal with you later.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"The letter of authorization should make it easy as winking to get possession of the ship. I wonder what Lee will say.");
	MIS_RICHTERSPERMISSIONFORSHIP = LOG_SUCCESS;
	b_giveplayerxp(XP_RICHTERSPERMISSIONFORSHIP);
};


instance DIA_RICHTER_PERM2(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_perm2_condition;
	information = dia_richter_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_richter_perm2_condition()
{
	if((MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_richter_perm2_info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//Get out of my sight.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(It would be easy to steal his key)";
};


func int dia_richter_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_richter_pickpocket_info()
{
	Info_ClearChoices(dia_richter_pickpocket);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_BACK,dia_richter_pickpocket_back);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_PICKPOCKET,dia_richter_pickpocket_doit);
};

func void dia_richter_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_richter,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_richter_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_richter_pickpocket_back()
{
	Info_ClearChoices(dia_richter_pickpocket);
};

