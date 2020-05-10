
instance DIA_ADDON_ALLIGATORJACK_EXIT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 999;
	condition = dia_addon_alligatorjack_exit_condition;
	information = dia_addon_alligatorjack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_alligatorjack_exit_condition()
{
	return TRUE;
};


var int dia_addon_alligatorjack_exit_info_onetime;

func void dia_addon_alligatorjack_exit_info()
{
	if((MIS_KROKOJAGD == LOG_SUCCESS) && (dia_addon_alligatorjack_exit_info_onetime == FALSE))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_00");	//If you're looking for me, you'll usually find me near my camp in front of the palisade.
		if(pir_1354_addon_henry.aivar[AIV_TALKEDTOPLAYER] == FALSE)
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Palisade?
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Exit_12_02");	//Just continue west from here and you'll see what I mean.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		dia_addon_alligatorjack_exit_info_onetime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_ALLIGATORJACK_PICKPOCKET(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 900;
	condition = dia_addon_alligatorjack_pickpocket_condition;
	information = dia_addon_alligatorjack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_addon_alligatorjack_pickpocket_condition()
{
	return c_beklauen(100,333);
};

func void dia_addon_alligatorjack_pickpocket_info()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_BACK,dia_addon_alligatorjack_pickpocket_back);
	Info_AddChoice(dia_addon_alligatorjack_pickpocket,DIALOG_PICKPOCKET,dia_addon_alligatorjack_pickpocket_doit);
};

func void dia_addon_alligatorjack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};

func void dia_addon_alligatorjack_pickpocket_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_pickpocket);
};


instance DIA_ADDON_ALLIGATORJACK_HELLO(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_hello_condition;
	information = dia_addon_alligatorjack_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_hello_condition()
{
	if(GREGISBACK == FALSE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_hello_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_00");	//Who on earth are YOU? You don't look like the others.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Hello_15_01");	//What others?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_02");	//Well, the mages who are hanging around those ruins over there.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_03");	//Are you one of that bunch, then?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Hello_12_04");	//Brave thing to run around here by yourself.
};


instance DIA_ADDON_ALLIGATORJACK_WERBISTDU(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_werbistdu_condition;
	information = dia_addon_alligatorjack_werbistdu_info;
	description = "Who are you?";
};


func int dia_addon_alligatorjack_werbistdu_condition()
{
	return TRUE;
};

func void dia_addon_alligatorjack_werbistdu_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WerBistDu_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_01");	//I'm sure you've heard of me before.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_02");	//(proudly) I'm Alligator Jack.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_03");	//Feared all over the country. I'm one of the most dangerous pirates around here.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_04");	//Together with Cap'n Greg I've boarded more merchant vessels than I count.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WerBistDu_12_05");	//You're looking at a living legend here.
};


instance DIA_ADDON_ALLIGATORJACK_VORSCHLAG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_vorschlag_condition;
	information = dia_addon_alligatorjack_vorschlag_info;
	description = "Do you know a fellow named Raven?";
};


func int dia_addon_alligatorjack_vorschlag_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_vorschlag_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_15_00");	//Do you know a fellow named Raven?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_01");	//Of course. He's the leader of the bandits to the east.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_12_02");	//What's your business with HIM?
	b_logentry(TOPIC_ADDON_RAVENKDW,"Raven and his bandits are in the eastern part of the valley.");
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"I want to join him.",dia_addon_alligatorjack_vorschlag_join);
	Info_AddChoice(dia_addon_alligatorjack_vorschlag,"I've got to kill him.",dia_addon_alligatorjack_vorschlag_tot);
};

func void b_alligatorjack_besser()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_00");	//I've got a better idea.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_01");	//Come and join us.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_02");	//That'll give you time to think about it.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Besser_12_03");	//Once you've tried our good home-brewed rum, things will look very different.
	Info_ClearChoices(dia_addon_alligatorjack_vorschlag);
};

func void dia_addon_alligatorjack_vorschlag_tot()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_tot_15_00");	//I've got to kill him.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_01");	//(laughs) What? YOU? How are you going to do THAT?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_02");	//Isn't that guy way out of your league?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_03");	//You won't even get close to him. The bandits he's surrounded himself with will skin you alive first.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_04");	//You won't even get past their first outpost.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_tot_12_05");	//The way you look, those bandits will get itchy fingers when they spot you a mile away.
	b_alligatorjack_besser();
};

func void dia_addon_alligatorjack_vorschlag_join()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Vorschlag_join_15_00");	//I want to join him.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_01");	//(slyly) Is that so?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Vorschlag_join_12_02");	//But you don't look at all like someone who would want to join those crackpots.
	b_alligatorjack_besser();
};


instance DIA_ADDON_ALLIGATORJACK_BDTRUESTUNG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_bdtruestung_condition;
	information = dia_addon_alligatorjack_bdtruestung_info;
	description = "I need a bandit's armor.";
};


func int dia_addon_alligatorjack_bdtruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_vorschlag) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_bdtruestung_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_15_00");	//I need a bandit's armor.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_01");	//What would you do with THAT?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_02");	//It'll only get you into trouble if you're seen with it.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_12_03");	//Everyone's going to take you for a bandit and will try to kill you.
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"Do you have any idea where I could find armor like that?",dia_addon_alligatorjack_bdtruestung_wo);
	Info_AddChoice(dia_addon_alligatorjack_bdtruestung,"Sounds good...",dia_addon_alligatorjack_bdtruestung_gut);
};

func void dia_addon_alligatorjack_bdtruestung_gut()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00");	//Sounds good...
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01");	//Yes, but only to someone who's suicidal.
};

func void dia_addon_alligatorjack_bdtruestung_wo()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00");	//Do you have any idea where I could find armor like that?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01");	//We used to have one in our pirate camp.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03");	//But I don't know whether it's still there.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"The pirates are supposed to have a suit of bandit armor. But Alligator Jack couldn't tell me if it exists.");
	Info_ClearChoices(dia_addon_alligatorjack_bdtruestung);
};


instance DIA_ADDON_ALLIGATORJACK_GREG(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_greg_condition;
	information = dia_addon_alligatorjack_greg_info;
	description = "Your captain's name is Greg?";
};


func int dia_addon_alligatorjack_greg_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_greg_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_00");	//Your captain's name is Greg?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_01");	//Right. He's the greatest pirate the sea ever spawned.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_02");	//I think I know your captain. I met him in Khorinis.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_03");	//(laughs) Greg? In Khorinis? Nonsense!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_04");	//Greg is out at sea after booty with some of the lads.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_05");	//The only thing that could bring Greg to Khorinis would be one of the King's prison galleys.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_06");	//He's one of the most wanted men in the land.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Greg_12_07");	//He'd never march into town voluntarily and have the royal guard throw him into prison.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Greg_15_08");	//If you say so.
};


instance DIA_ADDON_ALLIGATORJACK_PIRLAGER(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirlager_condition;
	information = dia_addon_alligatorjack_pirlager_info;
	description = "Where's your pirate camp?";
};


func int dia_addon_alligatorjack_pirlager_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_werbistdu) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirlager_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_00");	//Where's your pirate camp?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_01");	//See the cave passage over there? Go through it and continue west, and you'll come to our beach sooner or later.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_02");	//That's where our log huts are.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_03");	//I can take you there if you want, if you do me a favor first.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//What would that be?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_05");	//I'll have to get the boys some meat before I can go back to camp.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_06");	//You're a strong fellow.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PIRLager_12_07");	//I could use your help hunting. Interested?
	Log_CreateTopic(TOPIC_ADDON_RATHUNT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_RATHUNT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_RATHUNT,"Alligator Jack needs help with hunting.");
};


instance DIA_ADDON_ALLIGATORJACK_WASJAGEN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_wasjagen_condition;
	information = dia_addon_alligatorjack_wasjagen_info;
	description = "What is it you hunt?";
};


func int dia_addon_alligatorjack_wasjagen_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_wasjagen_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_00");	//What is it you hunt?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_01");	//Only alligators, usually. But they're no good for eating.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_02");	//And there aren't any left around here anyway.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_03");	//So I take what I can find: swamp rats.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//What?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//Most beasts around here taste like old socks, or they're as tough as alligator meat.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Those fat swamp rats are the only thing that is remotely edible.
	b_logentry(TOPIC_ADDON_RATHUNT,"The only thing that is remotely edible in the area is swamp rats.");
};


instance DIA_ADDON_ALLIGATORJACK_PIRATES(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_pirates_condition;
	information = dia_addon_alligatorjack_pirates_info;
	permanent = FALSE;
	description = "Tell me more about you pirates.";
};


func int dia_addon_alligatorjack_pirates_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_alligatorjack_pirlager))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_pirates_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Pirates_15_00");	//Tell me more about you pirates.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_01");	//We've been living here for years. Back before the war, everyone knew us from here to the mainland.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_02");	//Our flag alone would spread terror among the crews of merchant vessels.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_03");	//But those times are past now. It's been weeks since we've run into a merchant vessel.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_04");	//Our Cap'n Greg left to try and catch another.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_05");	//The rest of us are sitting here in camp, twiddling our thumbs until he comes back.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Pirates_12_06");	//I hope he'll bring back lots of booty.
};


instance DIA_ADDON_ALLIGATORJACK_LETSGOHUNTING(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_letsgohunting_condition;
	information = dia_addon_alligatorjack_letsgohunting_info;
	permanent = TRUE;
	description = "Let's go hunting.";
};


func int dia_addon_alligatorjack_letsgohunting_condition()
{
	if((MIS_KROKOJAGD == FALSE) && Npc_KnowsInfo(other,dia_addon_alligatorjack_wasjagen) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_letsgohunting_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Let's go hunting.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_01");	//All right. With two people, that's child's play.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Are you ready?
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"No, not yet.",dia_addon_alligatorjack_letsgohunting_no);
	Info_AddChoice(dia_addon_alligatorjack_letsgohunting,"Yes.",dia_addon_alligatorjack_letsgohunting_yes);
};


const int ALLIGATORJACK_INTER1 = 1;
const int ALLIGATORJACK_KESSEL = 2;
const int ALLIGATORJACK_INTER2 = 3;
const int ALLIGATORJACK_CANYON = 4;

func void dia_addon_alligatorjack_letsgohunting_yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Yes.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01");	//Great. Just stay right behind me.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER1;
	MIS_KROKOJAGD = LOG_RUNNING;
};

func void dia_addon_alligatorjack_letsgohunting_no()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//No, not yet.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01");	//Hurry up, then.
	Info_ClearChoices(dia_addon_alligatorjack_letsgohunting);
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER1(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter1_condition;
	information = dia_addon_alligatorjack_alligatorjackinter1_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter1_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter1_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//The hollow.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01");	//There should be some of those beasts around here.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02");	//Follow me.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_KESSEL;
};


instance DIA_ADDON_ALLIGATORJACK_THEHUNT(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_thehunt_condition;
	information = dia_addon_alligatorjack_thehunt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_thehunt_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_KESSEL) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_thehunt_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_00");	//I was afraid of that.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//What?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_02");	//This handful of beasts here is only about half of what I need.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_03");	//Now we'll have to enter the canyon.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_04");	//Watch out, it's very dangerous deeper down in the canyon.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_12_05");	//If you hold your life dear, stay very close to me.
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(dia_addon_alligatorjack_thehunt);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"What IS there in the canyon?",dia_addon_alligatorjack_thehunt_enough);
	Info_AddChoice(dia_addon_alligatorjack_thehunt,"Fine, let's go.",dia_addon_alligatorjack_thehunt_running);
};

func void dia_addon_alligatorjack_thehunt_enough()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Enough_15_00");	//What IS there in the canyon?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_01");	//We avoid that area if it's at all possible.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Enough_12_02");	//That's where you find razors. Tough beasts, those. Stay away from them if you want to live another day.
};

func void dia_addon_alligatorjack_thehunt_running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Fine, let's go.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//All right.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_INTER2;
};


instance DIA_ADDON_ALLIGATORJACK_ALLIGATORJACKINTER2(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_alligatorjackinter2_condition;
	information = dia_addon_alligatorjack_alligatorjackinter2_info;
	important = TRUE;
};


func int dia_addon_alligatorjack_alligatorjackinter2_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_INTER2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_alligatorjackinter2_info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Come on.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	ALLIGATORJACK_JAGDSTART = ALLIGATORJACK_CANYON;
};


instance DIA_ADDON_ALLIGATORJACK_HUNTEND(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_huntend_condition;
	information = dia_addon_alligatorjack_huntend_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_alligatorjack_huntend_condition()
{
	if((ALLIGATORJACK_JAGDSTART == ALLIGATORJACK_CANYON) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_huntend_info()
{
	if(ALLIGATORJACK_KROKOSKILLED == 0)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_00");	//Say, can you tell me what I took you along for?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_01");	//You didn't kill a single swamp rat.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_02");	//Oh well. Maybe you can be useful some other way.
	}
	else if(ALLIGATORJACK_KROKOSKILLED == 1)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_03");	//Well done, we can use someone like you.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_04");	//You brought down one of those beasts on your first hunt. Not bad.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_05");	//You're a talented hunter.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_HuntEnd_12_06");	//My goodness! If you continue like that, I'll be able to stay in camp next time.
	};
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_07");	//Here, take this swamp rat meat to lazy old Morgan.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_08");	//You'll find him in our camp.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_09");	//He's probably lounging on the beach somewhere. He'll be waiting for this.
	if(pir_1354_addon_henry.aivar[AIV_PASSGATE] == FALSE)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_10");	//Henry usually guards the entrance to the camp and keeps a lookout for bandits.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_11");	//If he refuses to let you in, just tell him that I sent you.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_12");	//Maybe that'll make him a bit more sociable.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_PassHenry_12_13");	//Henry is a little too eager and a bit bossy, too.
	};
	MIS_ALLIGATORJACK_BRINGMEAT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ADDON_BRINGMEAT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADDON_BRINGMEAT,LOG_RUNNING);
	b_logentry(TOPIC_ADDON_BRINGMEAT,"Alligator Jack gave me 10 pieces of meat. I'm supposed to take them to Morgan.");
	b_logentry(TOPIC_ADDON_RATHUNT,"The hunt was successful. We caught several swamp rats.");
	b_giveinvitems(self,other,itfomuttonraw,10);
	MIS_KROKOJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_ADDON_KROKOJAGD);
};


instance DIA_ADDON_ALLIGATORJACK_ANGUS(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_angus_condition;
	information = dia_addon_alligatorjack_angus_info;
	permanent = FALSE;
	description = "Do you know Angus and his friend Hank?";
};


func int dia_addon_alligatorjack_angus_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_bill_angusnhank) == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_angus_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_00");	//Do you know Angus and his friend Hank?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_03");	//I haven't seen them in a while.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_04");	//And I wouldn't mind if the pair of them never came back.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Why?
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Angus_12_06");	//Oh, those bums always hung around the lake, scaring off the game.
};


instance DIA_ADDON_ALLIGATORJACK_LAKE(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_lake_condition;
	information = dia_addon_alligatorjack_lake_info;
	permanent = FALSE;
	description = "WHAT lake would that be?";
};


func int dia_addon_alligatorjack_lake_condition()
{
	if((Npc_KnowsInfo(other,dia_addon_alligatorjack_angus) == TRUE) && (MIS_ADDON_MORGAN_SEEKTRAITOR != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_lake_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_00");	//WHAT lake would that be?
	if(MIS_KROKOJAGD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_01");	//Remember our hunt?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Yep.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_03");	//The lake in the hollow. That's where I usually saw them.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_04");	//The lake in the big hollow.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_05");	//Just walk east from our camp. You can't miss the hollow.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_06");	//There's lots of little waterfalls there.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_Lake_12_07");	//But watch out - if there's nothing but dry sand underfoot, you've missed a turn and entered the canyon.
	};
	b_logentry(TOPIC_ADDON_SKIPSGROG,"The cave should be in the hollow east of the camp, right by the lake.");
};


instance DIA_ADDON_ALLIGATORJACK_CANLEARN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_canlearn_condition;
	information = dia_addon_alligatorjack_canlearn_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_addon_alligatorjack_canlearn_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == FALSE)
	{
		if((Npc_KnowsInfo(other,dia_addon_alligatorjack_huntend) == TRUE) || (GREGISBACK == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_alligatorjack_canlearn_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_CanLearn_15_00");	//Can you teach me something?
	if(MIS_KROKOJAGD > LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_01");	//Sure, I'm a good hunter and I can show you how to skin animals and pull their teeth.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_02");	//I'll teach you if you like.
		Log_CreateTopic(TOPIC_ADDON_PIR_TEACHER,LOG_NOTE);
		b_logentry(TOPIC_ADDON_PIR_TEACHER,"Alligator Jack can show me how to skin animals or how to remove their teeth. Besides that he can teach me archery.");
		ALLIGATORJACK_ADDON_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_03");	//But first show me that you're ready for the hunt.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_CanLearn_12_04");	//Once we've been out hunting together, I might do it.
	};
};

func void b_aj_teach()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
	Info_AddChoice(dia_addon_alligatorjack_teach,DIALOG_BACK,dia_addon_alligatorjack_teach_back);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW,5)),dia_addon_alligatorjack_teach_bow_5);
	Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW,1)),dia_addon_alligatorjack_teach_bow_1);
	if(PLAYER_TALENT_TAKEANIMALTROPHY[14] == FALSE)
	{
		Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Skin reptiles",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_REPTILESKIN)),dia_addon_alligatorjack_teach_fur);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Pull teeth",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_TEETH)),dia_addon_alligatorjack_teach_teeth);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[1] == FALSE)
	{
		Info_AddChoice(dia_addon_alligatorjack_teach,b_buildlearnstring("Gutting animals",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MEAT)),dia_alligatorjack_teachmeat);
	};
};


instance DIA_ADDON_ALLIGATORJACK_TEACH(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 5;
	condition = dia_addon_alligatorjack_teach_condition;
	information = dia_addon_alligatorjack_teach_info;
	permanent = TRUE;
	description = "Teach me!";
};


func int dia_addon_alligatorjack_teach_condition()
{
	if(ALLIGATORJACK_ADDON_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_teach_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Teach_15_00");	//Teach me!
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_12_01");	//What is it you want to learn?
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_back()
{
	Info_ClearChoices(dia_addon_alligatorjack_teach);
};

func void dia_addon_alligatorjack_teach_bow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,75);
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_bow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,75);
	b_aj_teach();
};

func void dia_alligatorjack_teachmeat()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MEAT))
	{
		AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Are you ready?
		AI_Output(other,self,"DIA_Addon_Carlos_HI_Yes_15_00");	//Yes, why?
		AI_Output(other,self,"DIA_Addon_Garaz_Probleme_15_01");	//Is there a problem?
		AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_05");	//Most beasts around here taste like old socks, or they're as tough as alligator meat.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_WasJagen_12_06");	//Those fat swamp rats are the only thing that is remotely edible.
		AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//Sounds awfully nice...
		AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//We'll meet again.
		AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//All right.
	};
	AI_StopProcessInfos(self);
};

func void dia_addon_alligatorjack_teach_fur()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[14] == FALSE)
	{
		if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_REPTILESKIN))
		{
			AI_Output(self,other,"DIA_Addon_AlligatorJack_Teach_Fur_12_00");	//Always make the cut at the belly, or the quality will suffer.
			AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//Thank you.
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void dia_addon_alligatorjack_teach_teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
	{
		b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH);
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
	b_aj_teach();
};

func void b_allijack_alliklar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//All right then.
};


instance DIA_ADDON_ALLIGATORJACK_ANHEUERN(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 11;
	condition = dia_addon_alligatorjack_anheuern_condition;
	information = dia_addon_alligatorjack_anheuern_info;
	permanent = FALSE;
	description = "Let's go hunting.";
};


func int dia_addon_alligatorjack_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Anheuern_15_00");	//Let's go hunting.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	b_addon_piratesfollowagain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};


instance DIA_ADDON_ALLIGATORJACK_COMEON(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 12;
	condition = dia_addon_alligatorjack_comeon_condition;
	information = dia_addon_alligatorjack_comeon_info;
	permanent = TRUE;
	description = "Come along.";
};


func int dia_addon_alligatorjack_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_alligatorjack_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_KommMit_15_00");	//Come along.
	if(c_gregspiratestoofar() == TRUE)
	{
		b_say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		b_allijack_alliklar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_ALLIGATORJACK_GOHOME(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 13;
	condition = dia_addon_alligatorjack_gohome_condition;
	information = dia_addon_alligatorjack_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_alligatorjack_gohome_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_DontNeedYou_15_00");	//I no longer need you.
	b_allijack_alliklar();
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_ALLIGATORJACK_TOOFAR(C_INFO)
{
	npc = pir_1352_addon_alligatorjack;
	nr = 14;
	condition = dia_addon_alligatorjack_toofar_condition;
	information = dia_addon_alligatorjack_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_alligatorjack_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_addon_alligatorjack_toofar_info()
{
	b_say(self,other,"$RUNAWAY");
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

