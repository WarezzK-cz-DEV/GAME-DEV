
instance DIA_ADDON_SKIP_EXIT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 999;
	condition = dia_addon_skip_exit_condition;
	information = dia_addon_skip_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_skip_exit_condition()
{
	return TRUE;
};

func void dia_addon_skip_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_PICKPOCKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 900;
	condition = dia_addon_skip_pickpocket_condition;
	information = dia_addon_skip_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_addon_skip_pickpocket_condition()
{
	return c_beklauen(20,43);
};

func void dia_addon_skip_pickpocket_info()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_BACK,dia_addon_skip_pickpocket_back);
	Info_AddChoice(dia_addon_skip_pickpocket,DIALOG_PICKPOCKET,dia_addon_skip_pickpocket_doit);
};

func void dia_addon_skip_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_skip_pickpocket);
};

func void dia_addon_skip_pickpocket_back()
{
	Info_ClearChoices(dia_addon_skip_pickpocket);
};


instance DIA_ADDON_SKIP_HELLO(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_hello_condition;
	information = dia_addon_skip_hello_info;
	important = TRUE;
};


func int dia_addon_skip_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (PLAYERTALKEDTOSKIPNW == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_00");	//What have we here, crossing the path of old Skip again?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_01");	//(exaggerated) I know you!
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_02");	//The bay near the city, remember?
	AI_Output(other,self,"DIA_Addon_Skip_Hello_15_03");	//Skip! Right?
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_04");	//(proudly) I see I made a lasting impression.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_05");	//But I've seen your mug ELSEWHERE in the meantime...
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_06");	//But of course!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_07");	//Oh well. Not a great likeness, but it's certainly YOU.
	AI_Output(self,other,"DIA_Addon_Skip_Hello_08_08");	//Don't let it get to you. My own wanted poster looks just as daft.
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ADDON_SKIPADW_BALTRAMPAKET(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 2;
	condition = dia_addon_skipadw_baltrampaket_condition;
	information = dia_addon_skipadw_baltrampaket_info;
	description = "I've got a package for you, from Baltram.";
};


func int dia_addon_skipadw_baltrampaket_condition()
{
	if(Npc_HasItems(other,itmi_packet_baltram4skip_addon))
	{
		return TRUE;
	};
};

func void dia_addon_skipadw_baltrampaket_info()
{
	AI_Output(other,self,"DIA_Addon_SkipADW_BaltramPaket_15_00");	//I've got a package for you, from Baltram.
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_01");	//(grinning) That guy must be really keen on our rum if he sends his goods after us all the way HERE.
	b_giveinvitems(other,self,itmi_packet_baltram4skip_addon,1);
	AI_Output(self,other,"DIA_Addon_SkipADW_BaltramPaket_08_02");	//Here, give him these 2 bottles of rum. I quaffed the third one while I was waiting for him.
	b_giveinvitems(self,other,itfo_addon_rum,2);
	b_giveplayerxp(XP_ADDON_SKIP_BALTRAMPAKET);
	b_logentry(TOPIC_ADDON_BALTRAMSKIPTRADE,LOGTEXT_ADDON_SKIPSRUMTOBALTRAM);
	SKIP_RUM4BALTRAM = TRUE;
};


instance DIA_ADDON_SKIP_JOB(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 3;
	condition = dia_addon_skip_job_condition;
	information = dia_addon_skip_job_info;
	description = "What are you doing here?";
};


func int dia_addon_skip_job_condition()
{
	return TRUE;
};

func void dia_addon_skip_job_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Job_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Addon_Skip_Job_08_01");	//I've just come back from Khorinis and now I'm waiting for Greg to return.
};


instance DIA_ADDON_SKIP_ADW_GREGGETROFFEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 4;
	condition = dia_addon_skip_adw_greggetroffen_condition;
	information = dia_addon_skip_adw_greggetroffen_info;
	description = "I saw Greg in Khorinis.";
};


func int dia_addon_skip_adw_greggetroffen_condition()
{
	if((PLAYERTALKEDTOGREGNW == TRUE) && (GREGISBACK == FALSE) && Npc_KnowsInfo(other,dia_addon_skip_job))
	{
		return TRUE;
	};
};

func void dia_addon_skip_adw_greggetroffen_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ADW_GregGetroffen_15_00");	//I saw Greg in Khorinis.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_01");	//Really? Damn! Something must have gone wrong then.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_02");	//He should have been here with our ship some time ago.
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_03");	//(pensively) I suppose I should go back to Khorinis and wait for him there...
	AI_Output(self,other,"DIA_Addon_Skip_ADW_GregGetroffen_08_04");	//(sighs) But certainly not today. I only just arrived here.
	b_giveplayerxp(XP_AMBIENT);
};


var int skip_transport_variation;

instance DIA_ADDON_SKIP_TRANSPORT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 99;
	condition = dia_addon_skip_transport_condition;
	information = dia_addon_skip_transport_info;
	permanent = TRUE;
	description = "Can you take me to Khorinis?";
};


func int dia_addon_skip_transport_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_job) && (self.aivar[AIV_PARTYMEMBER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_transport_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Transport_15_00");	//Can you take me to Khorinis?
	if(GREGISBACK == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_01");	//No way. I'm not leaving now. I'll find myself a decent swig of grog first.
	}
	else if(SKIP_TRANSPORT_VARIATION == 0)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_02");	//Are you out of your mind? We've lost our SHIP, man!
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_03");	//I'm not taking our last boat out for a spin just because you're too lazy to get your butt over to Khorinis BY YOURSELF!
		SKIP_TRANSPORT_VARIATION = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Transport_08_04");	//For the last time: NO!
	};
};


instance DIA_ADDON_SKIP_BANDITS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_bandits_condition;
	information = dia_addon_skip_bandits_info;
	description = "What can you tell me about the bandits?";
};


func int dia_addon_skip_bandits_condition()
{
	return TRUE;
};

func void dia_addon_skip_bandits_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Bandits_15_00");	//What can you tell me about the bandits?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_01");	//The bandits?! They're ATTACKING us!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_02");	//Why do you think we're building this palisade?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_03");	//We brought those scumbags over here ourselves.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_04");	//We used to trade with them. Boy, let me tell you, they've got more gold than they'll ever know what to do with!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_05");	//They were prepared to pay any price for a bottle of rum.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_06");	//But those times are past. It's war now!
	AI_Output(other,self,"DIA_Addon_Erol_Bandits_15_06");	//What happened?
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_07");	//Those bastards hadn't paid for their last shipment.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_08");	//So I went there to see what had become of our gold.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_09");	//But when I got to the swamp, the swine attacked me!
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_10");	//And that's not all. They killed Angus and Hank! Two of our best people.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_11");	//Just stay away from that swamp, I tell you.
	AI_Output(self,other,"DIA_Addon_Skip_Bandits_08_12");	//They'll go after anyone who doesn't look as shabby as they do.
};


instance DIA_ADDON_SKIP_ARMORPRICE(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_armorprice_condition;
	information = dia_addon_skip_armorprice_info;
	description = "I need bandit's armor.";
};


func int dia_addon_skip_armorprice_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_armorprice_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_00");	//I need bandit's armor.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_01");	//You want to go in there? Are you insane?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_02");	//Once those guys find out you're not one of them, you're sausage meat!
	AI_Output(other,self,"DIA_Addon_Skip_ArmorPrice_15_02");	//Do you have any idea where I could find armor like that?
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_03");	//(sighs) You don't give up easily, do you? All right. We used to have a suit.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_04");	//Greg's probably still got it somewhere up in his hut.
	AI_Output(self,other,"DIA_Addon_Skip_ArmorPrice_08_05");	//Maybe you can buy it from him when he gets back...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Skip assumes that the armor is in Greg's hut.");
};


instance DIA_ADDON_SKIP_GREGSHUT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_gregshut_condition;
	information = dia_addon_skip_gregshut_info;
	permanent = FALSE;
	description = "Can you tell me how to get into Greg's hut?";
};


func int dia_addon_skip_gregshut_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_armorprice) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_gregshut_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GregsHut_15_00");	//Can you tell me how to get into his hut?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_01");	//Whoa there! Not so fast!
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_02");	//You weren't thinking of ransacking Greg's stuff, were you?
	AI_Output(self,other,"DIA_Addon_Skip_GregsHut_08_03");	//When he left, he gave the key to Francis and told him not to let ANYONE into his hut.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Francis has the key to Greg's hut. He has been ordered to let no one in there.");
	KNOWS_GREGSHUT = TRUE;
};


instance DIA_ADDON_SKIP_FRANCIS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 6;
	condition = dia_addon_skip_francis_condition;
	information = dia_addon_skip_francis_info;
	permanent = FALSE;
	description = "What can you tell me about Francis?";
};


func int dia_addon_skip_francis_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_gregshut))
	{
		return TRUE;
	};
};

func void dia_addon_skip_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Francis_15_00");	//What can you tell me about Francis?
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_01");	//Francis is our treasurer.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_02");	//The Captain trusts him. That's probably why he left him in command.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_03");	//But none of the boys here really take him seriously.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_04");	//If you want to know more, talk to Samuel.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_05");	//He's got his still in the little cave north of here.
	AI_Output(self,other,"DIA_Addon_Skip_Francis_08_06");	//There isn't a soul in this camp Samuel DOESN'T know all kinds of things about...
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"I should talk to Samuel. Maybe he can help me.");
};


instance DIA_ADDON_SKIP_RAVEN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_raven_condition;
	information = dia_addon_skip_raven_info;
	permanent = FALSE;
	description = "Have you ever met Raven?";
};


func int dia_addon_skip_raven_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_raven_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Raven_15_00");	//Have you ever met Raven?
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_01");	//Certainly. When I was with Henry, up at the gate, I watched Raven place some of his boys at the tower to the south.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_02");	//Just a stone's throw from our camp. (laughs) I guess they're supposed to spy on us.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_03");	//I've also seen how he treats his people when they don't do his bidding.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_04");	//He'll make short shrift of anyone who doesn't obey his orders to the letter.
	AI_Output(self,other,"DIA_Addon_Skip_Raven_08_05");	//Mark my words: stay well away from Raven.
};


instance DIA_ADDON_SKIP_ANGUSHANK(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushank_condition;
	information = dia_addon_skip_angushank_info;
	description = "Tell me more about Angus and Hank.";
};


func int dia_addon_skip_angushank_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushank_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHank_15_00");	//Tell me more about Angus and Hank.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_01");	//Angus and Hank were supposed to meet with some bandits in front of the camp.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_02");	//They were carrying all kinds of supplies. Everything those bastards had ordered from us.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_03");	//Forged steel and lock picks and whatnot.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_04");	//But they never came back. The bandit swine must have done away with them!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_05");	//Morgan and Bill went out to look for them - without any success.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_06");	//Bill was pretty devastated. They were both friends of his.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_07");	//He's still young, these things really get to him.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_08");	//The rest of us took it in our stride. The goods we can afford to lose. (sighs) But the grog they were carrying...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHank_08_09");	//(angry) We're talking at least 20 bottles!
	MIS_ADDON_SKIPSGROG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_SKIPSGROG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_SKIPSGROG,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip has allegedly lost 20 bottles of grog to the bandits. He wants them back.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"Angus and Hank were supposed to meet with a couple of bandits. They were never seen again.");
	Log_AddEntry(TOPIC_ADDON_SKIPSGROG,"The search for Morgan and Bill remains unsuccessful.");
};


instance DIA_ADDON_SKIP_ANGUSHANKDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankdead_condition;
	information = dia_addon_skip_angushankdead_info;
	permanent = FALSE;
	description = "About Angus and Hank...";
};


func int dia_addon_skip_angushankdead_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_bandits) && !Npc_HasItems(angus,itri_addon_morgansring_mission))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankdead_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_00");	//About Angus and Hank...
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_01");	//What?
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_01");	//I found them.
	AI_Output(other,self,"DIA_Addon_Skip_AngusnHankDead_15_03");	//They're dead.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_03");	//(to himself) Dead as doornails - poor devils!
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_04");	//Well, it was only to be expected.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_05");	//You should tell Bill if you haven't done so yet.
	AI_Output(self,other,"DIA_Addon_Skip_AngusnHankDead_08_06");	//But break it to him gently - he's still young.
};


instance DIA_ADDON_SKIP_ANGUSHANKMURDER(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 5;
	condition = dia_addon_skip_angushankmurder_condition;
	information = dia_addon_skip_angushankmurder_info;
	permanent = FALSE;
	description = "I know who murdered Angus and Hank.";
};


func int dia_addon_skip_angushankmurder_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_skip_angushankdead) && (SC_KNOWS_JUANMURDEREDANGUS == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_angushankmurder_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_JuanMurder_15_00");	//I know who murdered Angus and Hank.
	if(MIS_ADDON_SKIPSGROG == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_01");	//Good for you. They're both dead. So who cares now?
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_02");	//No pirate ever got rich through vengeance.
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_03");	//Just as long as I have my grog back.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_AngusHankMurder_08_04");	//I don't care who murdered them. What about my grog?!
	};
};


instance DIA_ADDON_SKIP_GROG(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 9;
	condition = dia_addon_skip_grog_condition;
	information = dia_addon_skip_grog_info;
	permanent = TRUE;
	description = "Here's your 20 bottles.";
};


func int dia_addon_skip_grog_condition()
{
	if(MIS_ADDON_SKIPSGROG == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_15_00");	//About that grog...
	if(Npc_HasItems(other,itfo_addon_grog) >= 20)
	{
		Info_ClearChoices(dia_addon_skip_grog);
		Info_AddChoice(dia_addon_skip_grog,DIALOG_BACK,dia_addon_skip_grog_back);
		Info_AddChoice(dia_addon_skip_grog,"Here's your 20 bottles.",dia_addon_skip_grog_geben);
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Skip_Grog_15_01");	//You're missing 20 bottles, right?
		AI_Output(self,other,"DIA_Addon_Skip_Grog_08_02");	//Yes, damnit. My entire stock.
	};
};

func void dia_addon_skip_grog_back()
{
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_geben()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_00");	//Here's your 20 bottles.
	b_giveinvitems(other,self,itfo_addon_grog,20);
	b_logentry(TOPIC_ADDON_SKIPSGROG,"Skip has his 20 bottles of grog back and is happy.");
	MIS_ADDON_SKIPSGROG = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_SKIPSGROG);
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_01");	//What? Really? Just like that?
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_02");	//Weeell...
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_03");	//Okay. I'll pay for them.
	AI_Output(other,self,"DIA_Addon_Skip_Grog_geben_15_04");	//Haven't you got anything more interesting than gold?
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_05");	//Mmh. Let's see. I've got this ring here.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_06");	//I won it gambling in a filthy dockside pub years ago.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_07");	//Back then, the guy told me it was magic. No idea whether that's true.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_geben_08_08");	//Maybe you want that instead of money?
	Info_ClearChoices(dia_addon_skip_grog);
	Info_AddChoice(dia_addon_skip_grog,"Give me the money.",dia_addon_skip_grog_gold);
	Info_AddChoice(dia_addon_skip_grog,"Give me the ring.",dia_addon_skip_grog_ring);
};

func void dia_addon_skip_grog_ring()
{
	AI_Output(other,self,"DIA_Addon_Skip_Grog_ring_15_00");	//Give me the ring.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_ring_08_01");	//Here you are.
	b_giveinvitems(self,other,itri_prot_edge_02,1);
	Info_ClearChoices(dia_addon_skip_grog);
};

func void dia_addon_skip_grog_gold()
{
	var int grogkohle;
	AI_Output(other,self,"DIA_Addon_Skip_Grog_gold_15_00");	//Give me the money.
	AI_Output(self,other,"DIA_Addon_Skip_Grog_gold_08_01");	//All right.
	grogkohle = VALUE_GROG * 20;
	b_giveinvitems(self,other,itmi_gold,grogkohle);
	Info_ClearChoices(dia_addon_skip_grog);
};


instance DIA_ADDON_SKIP_NEWS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 888;
	condition = dia_addon_skip_news_condition;
	information = dia_addon_skip_news_info;
	permanent = FALSE;
	description = "Have you got anything to sell?";
};


func int dia_addon_skip_news_condition()
{
	return TRUE;
};

func void dia_addon_skip_news_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_News_15_00");	//Have you got anything to sell?
	AI_Output(self,other,"DIA_Addon_Skip_News_08_01");	//If you want to trade, go to Garett. He's in charge of our supplies.
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_GARETTTRADE);
};


instance DIA_ADDON_SKIP_ANHEUERN(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 11;
	condition = dia_addon_skip_anheuern_condition;
	information = dia_addon_skip_anheuern_info;
	permanent = FALSE;
	description = "You're supposed to help me.";
};


func int dia_addon_skip_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_skip_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_00");	//You're supposed to help me.
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_01");	//With what?
	AI_Output(other,self,"DIA_Addon_Skip_Anheuern_15_01");	//The canyon awaits.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_02");	//I see you're taking some of the lads along. Good thing!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_03");	//You'd better bring some of the boys!
	};
	AI_Output(self,other,"DIA_Addon_Skip_Anheuern_08_04");	//That canyon is dangerous as hell!
};


instance DIA_ADDON_SKIP_COMEON(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 12;
	condition = dia_addon_skip_comeon_condition;
	information = dia_addon_skip_comeon_info;
	permanent = TRUE;
	description = "Come with me.";
};


func int dia_addon_skip_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_skip_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_skip_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_ComeOn_15_00");	//Come with me.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_02");	//Wait. Let's go back into the canyon first...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_ComeOn_08_01");	//Let's go!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_SKIP_GOHOME(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 13;
	condition = dia_addon_skip_gohome_condition;
	information = dia_addon_skip_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_skip_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_skip_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_Skip_GoHome_15_00");	//I no longer need you.
	AI_Output(self,other,"DIA_Addon_Skip_GoHome_08_01");	//Well, that was that, then. You'll find me in the camp.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_SKIP_TOOFAR(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 14;
	condition = dia_addon_skip_toofar_condition;
	information = dia_addon_skip_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_skip_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_01");	//This is far enough!
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_02");	//If you insist on going further, count us out!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Skip_TooFar_08_03");	//If you insist on going further, count me out!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_TREFFPUNKT(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_treffpunkt_condition;
	information = dia_addon_skip_treffpunkt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_treffpunkt_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 800) && (c_allcanyonrazordead() == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_treffpunkt_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_00");	//If we lose track of each other, let's meet up here at the watering hole.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_02");	//Let's move on!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ORKS(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_orks_condition;
	information = dia_addon_skip_orks_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_orks_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"ADW_CANYON_PATH_TO_LIBRARY_14") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_skip_orks_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_01");	//Orcs! I hate those things!
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SKIP_ALLRAZORSDEAD(C_INFO)
{
	npc = pir_1355_addon_skip;
	nr = 1;
	condition = dia_addon_skip_allrazorsdead_condition;
	information = dia_addon_skip_allrazorsdead_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_skip_allrazorsdead_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_allcanyonrazordead() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_skip_allrazorsdead_info()
{
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_03");	//Looks like we got all of the razors.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_04");	//We could roam around a little longer if you want to.
	AI_Output(self,other,"DIA_Addon_Skip_Add_08_05");	//Just as long as we stay in the canyon.
	AI_StopProcessInfos(self);
};

