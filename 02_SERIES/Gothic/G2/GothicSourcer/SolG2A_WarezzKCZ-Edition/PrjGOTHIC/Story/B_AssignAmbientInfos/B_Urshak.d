
var int urshak_sucked;

instance DIA_URSHAK_EXIT(C_INFO)
{
	npc = none_110_urshak;
	nr = 999;
	condition = dia_urshak_exit_condition;
	information = dia_urshak_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_urshak_exit_condition()
{
	return TRUE;
};

func void dia_urshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HALLO(C_INFO)
{
	npc = none_110_urshak;
	nr = 5;
	condition = dia_urshak_hallo_condition;
	information = dia_urshak_hallo_info;
	important = TRUE;
};


func int dia_urshak_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hallo_info()
{
	AI_Output(self,other,"DIA_Urshak_HALLO_18_00");	//(aggressively) KHROTOK JABARTH!!!
	AI_Output(self,other,"DIA_Urshak_HALLO_18_01");	//Wait! Me know you. You friend human with soft voice.
	AI_Output(self,other,"DIA_Urshak_HALLO_18_02");	//Friend kill evil demon KRUSHAK.
	b_giveplayerxp(XP_URSHAKFOUND);
	Log_CreateTopic(TOPIC_URSHAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URSHAK,LOG_RUNNING);
	b_logentry(TOPIC_URSHAK,"I found my old orc friend Ur-Shak.");
	Info_ClearChoices(dia_urshak_hallo);
	Info_AddChoice(dia_urshak_hallo,"What are you doing here?",dia_urshak_hallo_freund);
	Info_AddChoice(dia_urshak_hallo,"A talking orc?",dia_urshak_hallo_wer);
};

func void dia_urshak_hallo_wer()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_wer_15_00");	//A talking orc?
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_01");	//You forget Ur-Shak? That make me sad.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_02");	//Ur-Shak help friend many days before get ULU-MULU for going my village. So orcs respect friend and friend not die by hand of orcs.
	AI_Output(self,other,"DIA_Urshak_HALLO_wer_18_03");	//Friend then go deep orc temple and banish evil demon. Many days before. You no remember?
};

func void dia_urshak_hallo_freund()
{
	AI_Output(other,self,"DIA_Urshak_HALLO_freund_15_00");	//You picked a funny time to cross my path. I almost killed you. What are you doing here?
	AI_Output(self,other,"DIA_Urshak_HALLO_freund_18_01");	//Ur-Shak look over land and see what become of land and my people.
	Info_ClearChoices(dia_urshak_hallo);
};


instance DIA_URSHAK_WASMACHENORKS(C_INFO)
{
	npc = none_110_urshak;
	nr = 6;
	condition = dia_urshak_wasmachenorks_condition;
	information = dia_urshak_wasmachenorks_info;
	description = "Why are the orcs attacking the humans?";
};


func int dia_urshak_wasmachenorks_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_wasmachenorks_info()
{
	AI_Output(other,self,"DIA_Urshak_WASMACHENORKS_15_00");	//Why are the orcs attacking the humans?
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_01");	//Ur-Shak always tell orc people that humans no evil and many good friends there.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_02");	//But shaman no listen Ur-Shak. Ur-Shak still in disfavor with people.
	AI_Output(self,other,"DIA_Urshak_WASMACHENORKS_18_03");	//So Ur-Shak no hear exactly what big plan of war against humans.
	b_logentry(TOPIC_URSHAK,"He still hasn't gotten his people to listen to him. He's still an exile.");
};


instance DIA_URSHAK_SOVIELE(C_INFO)
{
	npc = none_110_urshak;
	nr = 7;
	condition = dia_urshak_soviele_condition;
	information = dia_urshak_soviele_info;
	description = "Why are there suddenly so many of you?";
};


func int dia_urshak_soviele_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_soviele_info()
{
	AI_Output(other,self,"DIA_Urshak_SOVIELE_15_00");	//Why are there suddenly so many of you?
	AI_Output(self,other,"DIA_Urshak_SOVIELE_18_01");	//Orcs come from mountains, but others come with ships and make big fence.
};


instance DIA_URSHAK_ZAUN(C_INFO)
{
	npc = none_110_urshak;
	nr = 8;
	condition = dia_urshak_zaun_condition;
	information = dia_urshak_zaun_info;
	description = "What is hidden behind the long orc fence in the east?";
};


func int dia_urshak_zaun_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_zaun_info()
{
	AI_Output(other,self,"DIA_Urshak_ZAUN_15_00");	//What is hidden behind the long orc fence in the east?
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_01");	//Orcs always make big fence and home camp for war.
	AI_Output(self,other,"DIA_Urshak_ZAUN_18_02");	//Fence good for war. Hide strength of army and protect orcs.
};


instance DIA_URSHAK_WASHASTDUVOR(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_washastduvor_condition;
	information = dia_urshak_washastduvor_info;
	description = "What are you planning to do now?";
};


func int dia_urshak_washastduvor_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hallo) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_washastduvor_info()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_00");	//What are you planning to do now?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_01");	//Ur-Shak wait for orc scouts bring Ur-Shak to Hosh-Pak.
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_15_02");	//Who is Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_18_03");	//Be very great shaman. Have great influence on warriors and make big plans for orcs.
	b_logentry(TOPIC_URSHAK,"Ur-Shak's plan is to meet with the orcish shaman Hosh-Pak and persuade him to accept Ur-Shak back into the council of the shamans.");
	Info_ClearChoices(dia_urshak_washastduvor);
	Info_AddChoice(dia_urshak_washastduvor,DIALOG_BACK,dia_urshak_washastduvor_weiter);
	Info_AddChoice(dia_urshak_washastduvor,"Where can I find this Hosh-Pak?",dia_urshak_washastduvor_);
	Info_AddChoice(dia_urshak_washastduvor,"Why don't you go to him, then?",dia_urshak_washastduvor_hoshpak);
};

func void dia_urshak_washastduvor_hoshpak()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_hoshpak_15_00");	//Why don't you go to him, then?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_01");	//Ur-Shak try and try get again honor and old place in council of shamans.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_02");	//But till now, Hosh-Pak no listen Ur-Shak. Orcs kill Ur-Shak if see him without scouts. Ur-Shak must talk Hosh-Pak.
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_hoshpak_18_03");	//Maybe lucky today.
};

func void dia_urshak_washastduvor_()
{
	AI_Output(other,self,"DIA_Urshak_WASHASTDUVOR_Urshak_15_00");	//Where can I find this Hosh-Pak?
	AI_Output(self,other,"DIA_Urshak_WASHASTDUVOR_Urshak_18_01");	//Have place where can see orc warriors over fortress by big volcano, so Hosh-Pak can control warriors.
};

func void dia_urshak_washastduvor_weiter()
{
	Info_ClearChoices(dia_urshak_washastduvor);
};


instance DIA_URSHAK_HOSHPAKDEAD(C_INFO)
{
	npc = none_110_urshak;
	nr = 9;
	condition = dia_urshak_hoshpakdead_condition;
	information = dia_urshak_hoshpakdead_info;
	description = "Hosh-Pak is dead.";
};


func int dia_urshak_hoshpakdead_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_washastduvor) && Npc_IsDead(hosh_pak) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakdead_info()
{
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_00");	//Hosh-Pak is dead.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_01");	//Hosh-Pak dead? RUSHTASOK!
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_02");	//My heart carry heavy load. Ur-Shak never forget great orc make Ur-Shak shaman.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKDEAD_15_03");	//I understand. Hosh-Pak was your mentor.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_04");	//Ur-Shak now must carry burden of grief, must give Hosh-Pak last rites. Ur-Shak must go.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_05");	//Friend better go over pass. Too dangerous here.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKDEAD_18_06");	//Ur-Shak sad if friend human also die.
	b_logentry(TOPIC_URSHAK,"Hosh-Pak is dead. My orcish friend is headed for Hosh-Pak's tents. He grieves for his mentor. I should let him go.");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	Npc_ExchangeRoutine(self,"Start");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_01");
	Wld_InsertNpc(orcwarrior_rest,"FP_CAMPFIRE_HOSHPAK_02");
};


instance DIA_URSHAK_GEH(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_geh_condition;
	information = dia_urshak_geh_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_geh_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && ((Npc_GetDistToWP(self,"OW_HOSHPAK_04") < 1000) == FALSE) && (Npc_RefuseTalk(self) == FALSE) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_geh_info()
{
	AI_Output(self,other,"DIA_Urshak_GEH_18_00");	//Friend better go over pass now.
	Npc_SetRefuseTalk(self,10);
	AI_StopProcessInfos(self);
};


instance DIA_URSHAK_HOSHPAKRACHE(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_hoshpakrache_condition;
	information = dia_urshak_hoshpakrache_info;
	important = TRUE;
};


func int dia_urshak_hoshpakrache_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakdead) && (Npc_GetDistToWP(self,"OW_HOSHPAK_04") <= 1000) && (URSHAK_SUCKED == FALSE))
	{
		return TRUE;
	};
};

func void dia_urshak_hoshpakrache_info()
{
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_00");	//(aggressively) KHROTOK ! I learn you there when Hosh-Pak killed. You make big mistake, stranger.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_01");	//I see you have taken his place here. You've been stringing me along.
	AI_Output(other,self,"DIA_Urshak_HOSHPAKRACHE_15_02");	//Your position with your people is higher than you wanted to admit. Now you're nothing but a tool of evil yourself.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_03");	//Stranger right. Ur-Shak filled only with hate and vengeance now.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_04");	//Ur-Shak see big mistake trust evil human. Ur-Shak regret call human friend and help not get killed.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_05");	//Stranger finally leave valley and go over pass. Ur-Shak no can kill stranger now. Honor of shamans command Ur-Shak no kill.
	AI_Output(self,other,"DIA_Urshak_HOSHPAKRACHE_18_06");	//Next time we meet we enemies. You better go now.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
	b_logentry(TOPIC_URSHAK,"Ur-Shak has been accepted back into the council of the orc shamans. He is on the side of the enemy now and a little tense. I'd better keep out of his way until I've settled matters with the orcs. He should have calmed down by then.");
	b_giveplayerxp(XP_URSHAKBECOMESSHAMAN);
};


instance DIA_URSHAK_KEINEWAHL(C_INFO)
{
	npc = none_110_urshak;
	condition = dia_urshak_keinewahl_condition;
	information = dia_urshak_keinewahl_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_urshak_keinewahl_condition()
{
	if(Npc_KnowsInfo(other,dia_urshak_hoshpakrache) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_urshak_keinewahl_info()
{
	AI_Output(self,other,"DIA_Urshak_KEINEWAHL_18_00");	//You go. Me no talk to stranger.
	AI_StopProcessInfos(self);
	URSHAK_SUCKED = TRUE;
};

