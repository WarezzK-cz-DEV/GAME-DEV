
instance DIA_DRAGON_FIRE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_fire_exit_condition;
	information = dia_dragon_fire_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//The Eye has lost its power, and you will not survive the next day.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
	Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_HOSHPAK_04");
	Wld_InsertNpc(orcwarrior_roam,"FP_ROAM_HOSHPAK_06");
	Wld_InsertNpc(orcwarrior_roam,"OC10");
	Wld_InsertNpc(waran,"CASTLE_5_1");
	Wld_InsertNpc(waran,"CASTLE_5_1");
	Wld_InsertNpc(waran,"CASTLE_8");
};


instance DIA_DRAGON_FIRE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_fire_hello_condition;
	information = dia_dragon_fire_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_fire_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_fire_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//I simply cannot believe that there truly are still people who will forfeit their lives merely to see a dragon in the flesh.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//You're quite articulate for such a bulky monster.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//I haven't just come to see you. I rather had something more radical in mind, I'm afraid.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//You do not mean to say that you wish to challenge me?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ha ha ha. I shall break your scrawny neck.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Not so fast, my friend. I carry the Eye of Innos with me. You cannot resist my will. Answer my questions, or the agony will be unbearable for you.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//(bellows) Arrh. Then pose your ridiculous questions while you still can. Your power will not last long.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "Who are you?";
};


func int dia_dragon_fire_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//My name is Feomathar, and that is all that you will learn about me.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Once I can escape the spell of the Eye, you will go up in flames.
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "So where's your hoard?";
};


func int dia_dragon_fire_hort_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hort_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//Every dragon has a hoard where he stores his collected treasures. So where's your hoard?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//In a place that will be inaccessible to you, once I am finally free of the chains of the Eye.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//I keep my treasure high up on the hot cliffs, which should be all but impossible to reach for a wingless human such as you.
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

