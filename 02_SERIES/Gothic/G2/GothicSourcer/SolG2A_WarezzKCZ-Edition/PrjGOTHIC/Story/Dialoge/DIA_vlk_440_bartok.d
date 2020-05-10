
instance DIA_BARTOK_EXIT(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 999;
	condition = dia_bartok_exit_condition;
	information = dia_bartok_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bartok_exit_condition()
{
	return TRUE;
};

func void dia_bartok_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BARTOK_PICKPOCKET(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 900;
	condition = dia_bartok_pickpocket_condition;
	information = dia_bartok_pickpocket_info;
	permanent = TRUE;
	description = "(It would be easy to steal his quiver of arrows)";
};


func int dia_bartok_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itrw_arrow) >= 40) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_bartok_pickpocket_info()
{
	Info_ClearChoices(dia_bartok_pickpocket);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_BACK,dia_bartok_pickpocket_back);
	Info_AddChoice(dia_bartok_pickpocket,DIALOG_PICKPOCKET,dia_bartok_pickpocket_doit);
};

func void dia_bartok_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itrw_arrow,40);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_givethiefxp();
		Info_ClearChoices(dia_bartok_pickpocket);
	}
	else
	{
		b_resetthieflevel();
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_bartok_pickpocket_back()
{
	Info_ClearChoices(dia_bartok_pickpocket);
};


instance DIA_BARTOK_HALLO(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_hallo_condition;
	information = dia_bartok_hallo_info;
	permanent = FALSE;
	description = "What's up?";
};


func int dia_bartok_hallo_condition()
{
	return TRUE;
};

func void dia_bartok_hallo_info()
{
	AI_Output(other,self,"DIA_Bartok_Hello_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Bartok_Hello_04_01");	//You're not from around here, are you? Never mind - neither am I.
	AI_Output(other,self,"DIA_Bartok_Hello_15_02");	//Where did you hang around before?
	AI_Output(self,other,"DIA_Bartok_Hello_04_03");	//In the woods, hunting scavengers and wolves together with some hunters.
	AI_Output(self,other,"DIA_Bartok_Hello_04_04");	//But I gave it up. These are dangerous times. There's a lot of riff-raff running around out there...
};


instance DIA_BARTOK_JAEGER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 2;
	condition = dia_bartok_jaeger_condition;
	information = dia_bartok_jaeger_info;
	permanent = FALSE;
	description = "Where can I find the other hunters?";
};


func int dia_bartok_jaeger_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_jaeger_info()
{
	AI_Output(other,self,"DIA_Bartok_Jager_15_00");	//Where can I find the other hunters?
	AI_Output(self,other,"DIA_Bartok_Jager_04_01");	//We had our camp outside, near the tavern, half way to Onar's farm.
	AI_Output(self,other,"DIA_Bartok_Jager_04_02");	//But I don't know whether there's anyone left in the camp now.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_00");	//There used to be two of us here in town, until a few days ago.
	AI_Output(self,other,"DIA_Addon_Bartok_Jager_04_01");	//My friend Trokar is an excellent hunter.
};


instance DIA_ADDON_BARTOK_MISSINGPEOPLE(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_addon_bartok_missingpeople_condition;
	information = dia_addon_bartok_missingpeople_info;
	description = "So where is your friend Trokar now?";
};


func int dia_addon_bartok_missingpeople_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_jaeger))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_missingpeople_info()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_15_00");	//So where is your friend Trokar now?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_01");	//Well. It's a curious story.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_02");	//Only a few days ago, we were both standing at the bar in Coragon's tavern, discussing the hunt.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_03");	//Don't ask me what happened next. I had had a few by then.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_04_04");	//I vaguely remember Trokar saying that he was going out to get a few swampweed reefers. He never came back.
	MIS_BARTOK_MISSINGTROKAR = LOG_RUNNING;
	Info_ClearChoices(dia_addon_bartok_missingpeople);
	Info_AddChoice(dia_addon_bartok_missingpeople,"Didn't you go looking for him?",dia_addon_bartok_missingpeople_such);
	Info_AddChoice(dia_addon_bartok_missingpeople,"So where can I get some swampweed reefers?",dia_addon_bartok_missingpeople_wo);
};

func void dia_addon_bartok_missingpeople_wo()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_wo_15_00");	//Where does one get swampweed reefers?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_wo_04_01");	//Somewhere down at the harbor, as far as I know.
};

func void dia_addon_bartok_missingpeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Didn't you go looking for him?
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_01");	//No. But I reported it to the militia.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_02");	//But they haven't been able to find him yet.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_03");	//I hope he didn't get attacked by a wolf, or worse.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_04");	//I'm afraid that I'll stumble over his body some day when I'm out hunting.
	AI_Output(self,other,"DIA_Addon_Bartok_MissingPeople_such_04_05");	//I don't think I could bear that.
};


instance DIA_BARTOK_BOSPER(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 3;
	condition = dia_bartok_bosper_condition;
	information = dia_bartok_bosper_info;
	permanent = FALSE;
	description = "Bosper said you used to work for him...";
};


func int dia_bartok_bosper_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_bartok) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_bosper_info()
{
	AI_Output(other,self,"DIA_Bartok_Bosper_15_00");	//Bosper said you used to work for him...
	AI_Output(self,other,"DIA_Bartok_Bosper_04_01");	//Yes, I did. But he was only interested in his blasted hides.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_02");	//I told him how dangerous it's gotten out there. He didn't really listen to me.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_03");	//Well, anyway he paid well - I can't complain about that.
	AI_Output(other,self,"DIA_Bartok_Bosper_15_04");	//Can you tell me anything else about him?
	AI_Output(self,other,"DIA_Bartok_Bosper_04_05");	//(laughs) Bosper had one of his bows stolen recently. In broad daylight.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_06");	//Some guy just waltzed into his store, took a bow, and left.
	AI_Output(self,other,"DIA_Bartok_Bosper_04_07");	//The thieves are getting more and more brazen!
	if(MIS_BOSPER_BOGEN != LOG_SUCCESS)
	{
		MIS_BOSPER_BOGEN = LOG_RUNNING;
	};
};


instance DIA_BARTOK_WANNALEARN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_wannalearn_condition;
	information = dia_bartok_wannalearn_info;
	permanent = FALSE;
	description = "Can you teach me something about hunting?";
};


func int dia_bartok_wannalearn_condition()
{
	if(Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_wannalearn_info()
{
	AI_Output(other,self,"DIA_Bartok_WannaLearn_15_00");	//Can you teach me something about hunting?
	AI_Output(self,other,"DIA_Bartok_WannaLearn_04_01");	//I can teach you how to sneak properly and how to handle a bow.
	if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == FALSE)
	{
		AI_Output(self,other,"DIA_Bartok_WannaLearn_04_02");	//If you want to learn how to skin an animal, go to Bosper. He's the one who taught me.
	};
	BARTOK_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Bartok can teach me archery and how to sneak.");
};


instance DIA_BARTOK_TEACHSNEAK(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teachsneak_condition;
	information = dia_bartok_teachsneak_info;
	permanent = TRUE;
	description = b_buildlearnstring("Teach me how to sneak around!",b_getlearncosttalent(other,NPC_TALENT_SNEAK,1));
};


func int dia_bartok_teachsneak_condition()
{
	if((BARTOK_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void dia_bartok_teachsneak_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachSneak_15_00");	//Teach me how to sneak!
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_01");	//All right - so, first you have to make sure that you shift your weight properly.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_02");	//To achieve that, bend your knees and always put your foot down heel first.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_03");	//Make sure that you always keep your weight on the foot you're standing on until you've got your other foot securely placed.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_04");	//Most creatures you can't sneak up on unless they're sleeping. The beasts just smell you.
		AI_Output(self,other,"DIA_Bartok_TeachSneak_04_05");	//So always pay close attention when you're out there.
	};
};


var int bosper_merkebow;

instance DIA_BARTOK_TEACH(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 4;
	condition = dia_bartok_teach_condition;
	information = dia_bartok_teach_info;
	permanent = TRUE;
	description = "I want to be able to handle a bow better!";
};


func int dia_bartok_teach_condition()
{
	if(BARTOK_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_teach_info()
{
	AI_Output(other,self,"DIA_Bartok_TeachBow_15_00");	//I want to be able to handle a bow better!
	AI_Output(self,other,"DIA_Bartok_TeachBow_04_01");	//Okay, then let's see if I can teach you anything...
	BOSPER_MERKEBOW = other.hitchance[NPC_TALENT_BOW];
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_back()
{
	if(other.hitchance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_00");	//You should now look for someone who knows more about it than I do.
	}
	else if(BOSPER_MERKEBOW < other.hitchance[NPC_TALENT_BOW])
	{
		AI_Output(self,other,"DIA_Bartok_TeachBow_BACK_04_01");	//All right, your aim has become more accurate already.
	};
	Info_ClearChoices(dia_bartok_teach);
};

func void dia_bartok_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};

func void dia_bartok_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(dia_bartok_teach);
	Info_AddChoice(dia_bartok_teach,DIALOG_BACK,dia_bartok_teach_back);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_bartok_teach_bow_1);
	Info_AddChoice(dia_bartok_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_bartok_teach_bow_5);
};


var int bartok_bereit;
var int bartok_later;

instance DIA_BARTOK_ZUSAMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_zusammen_condition;
	information = dia_bartok_zusammen_info;
	permanent = TRUE;
	description = "Why don't we go hunting together?";
};


func int dia_bartok_zusammen_condition()
{
	if((BARTOK_BEREIT == FALSE) && Npc_KnowsInfo(other,dia_bartok_hallo))
	{
		return TRUE;
	};
};

func void dia_bartok_zusammen_info()
{
	if(BARTOK_LATER == FALSE)
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_00");	//Why don't we go hunting together?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_01");	//Hmm. With two it isn't so dangerous, that's true...
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_02");	//Do you know anything about hunting, then?
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_03");	//I mean, do you know how to skin an animal?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[3] == TRUE)
	{
		if(BARTOK_LATER == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_HuntNOW_04_01");	//Do you have 50 gold pieces?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Yes.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_05");	//All right, but I want to see 50 gold pieces. For that you can keep the skins and sell them to Bosper.
			AI_Output(self,other,"DIA_Bartok_Zusammen_04_06");	//That's a fair deal, isn't it?
		};
		Info_ClearChoices(dia_bartok_zusammen);
		Info_AddChoice(dia_bartok_zusammen,"Later...",dia_bartok_zusammen_later);
		Info_AddChoice(dia_bartok_zusammen,"Here you are...",dia_bartok_zusammen_pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//No.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_08");	//Then it wouldn't be worth it.
		AI_Output(self,other,"DIA_Bartok_Zusammen_04_09");	//Come back when you've learned something.
	};
};

func void dia_bartok_zusammen_later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Later...
	BARTOK_LATER = TRUE;
	Info_ClearChoices(dia_bartok_zusammen);
};

func void dia_bartok_zusammen_pay()
{
	Info_ClearChoices(dia_bartok_zusammen);
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(other,self,"DIA_Bartok_HuntNOW_GO_15_00");	//Here they are...
		BARTOK_BEREIT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_03");	//Where, then? You don't have the gold.
	};
};


var int bartok_los;

instance DIA_BARTOK_HUNTNOW(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 5;
	condition = dia_bartok_huntnow_condition;
	information = dia_bartok_huntnow_info;
	permanent = FALSE;
	description = "Let's go hunting!";
};


func int dia_bartok_huntnow_condition()
{
	if(BARTOK_BEREIT == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_huntnow_info()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_15_00");	//Let's go hunting!
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_01");	//All right, follow me. Outside the south gate is a wood where we should find more than enough critters.
	AI_Output(self,other,"DIA_Bartok_HuntNOW_GO_04_02");	//(to himself) Probably more than we'd like...
	BARTOK_LOS = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_11");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_11");
	Wld_InsertNpc(wolf,"NW_FARM1_CITYWALL_FOREST_11");
	Wld_InsertNpc(wolf,"NW_XFOREST_WOLF_N01");
	Wld_InsertNpc(wolf,"NW_XFOREST_WOLF_N01");
};


var int bartok_orkstillthere;

instance DIA_BARTOK_IMWALD(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_imwald_condition;
	information = dia_bartok_imwald_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_imwald_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_imwald_info()
{
	AI_Output(self,other,"DIA_Bartok_ImWald_04_00");	//So, what do you think, should we go farther into the woods or not?
	Info_ClearChoices(dia_bartok_imwald);
	Info_AddChoice(dia_bartok_imwald,"Let's go back!",dia_bartok_imwald_nachhause);
	Info_AddChoice(dia_bartok_imwald,"Let's go on.",dia_bartok_imwald_weiter);
};

func void dia_bartok_imwald_nachhause()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_NachHause_15_00");	//Let's go back!
	AI_Output(self,other,"DIA_Bartok_ImWald_NachHause_04_01");	//That's what I'd prefer. We'd probably wind up running straight into the arms of an orc.
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};

func void dia_bartok_imwald_weiter()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Let's go on.
	AI_Output(self,other,"DIA_Bartok_ImWald_Weiter_04_01");	//All right. (to self) Let's hope this works out...
	if(!Npc_IsDead(cityorc))
	{
		BARTOK_ORKSTILLTHERE = TRUE;
	};
	Info_ClearChoices(dia_bartok_imwald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};


var int bartok_ende;

instance DIA_BARTOK_ANGEKOMMEN(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_angekommen_condition;
	information = dia_bartok_angekommen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bartok_angekommen_condition()
{
	if((BARTOK_LOS == TRUE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void dia_bartok_angekommen_info()
{
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_00");	//That's it! I think I'm going back to the city.
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_01");	//It's just too dangerous out here for me - even with two of us.
	if(BARTOK_ORKSTILLTHERE == TRUE)
	{
		b_bartok_shitanorc();
		BARTOK_ORKGESAGT = TRUE;
	};
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_03");	//So, see you!
	AI_Output(self,other,"DIA_Bartok_Angekommen_04_04");	//You can sell the skins to Bosper.
	BARTOK_ENDE = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_BARTOK_PERM(C_INFO)
{
	npc = vlk_440_bartok;
	nr = 1;
	condition = dia_bartok_perm_condition;
	information = dia_bartok_perm_info;
	permanent = TRUE;
	description = "Everything all right?";
};


func int dia_bartok_perm_condition()
{
	if(BARTOK_LOS == TRUE)
	{
		return TRUE;
	};
};

func void dia_bartok_perm_info()
{
	AI_Output(other,self,"DIA_Bartok_PERM_15_00");	//Okay?
	if(BARTOK_ENDE == TRUE)
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_01");	//Yes. But I'm not going out of the city any more - at least not any time soon.
		if(BARTOK_ORKGESAGT == TRUE)
		{
			AI_Output(self,other,"DIA_Bartok_PERM_04_02");	//My knees are still shaking from the scare that orc gave us.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bartok_PERM_04_03");	//Sure. Let's bring down a few beasts!
	};
};

