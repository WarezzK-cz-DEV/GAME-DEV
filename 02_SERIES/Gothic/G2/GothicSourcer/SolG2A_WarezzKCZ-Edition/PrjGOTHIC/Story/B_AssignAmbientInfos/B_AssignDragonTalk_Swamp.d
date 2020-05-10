
instance DIA_DRAGON_SWAMP_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_swamp_exit_condition;
	information = dia_dragon_swamp_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_swamp_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//The power of the Eye is exhausted. Your life ends here, human.
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_FLASH_EXP",self,self,3,3,3,FALSE);
	SWAMPDRAGON = Hlp_GetNpc(dragon_swamp);
	swampdragon.flags = 0;
	Wld_InsertNpc(ybloodfly,"FP_ROAM_SWAMP_16_01");
	Wld_InsertNpc(ybloodfly,"FP_ROAM_SWAMP_2_03");
	Wld_InsertNpc(ybloodfly,"FP_ROAM_OW_SCAVENGER_AL_NL_01");
	Wld_InsertNpc(ybloodfly,"FP_ROAM_WARG_OC_02");
	Wld_InsertNpc(gobbo_green,"OW_PATH_046");
	Wld_InsertNpc(gobbo_green,"OW_DJG_SWAMP_WAIT1_02");
	Wld_InsertNpc(gobbo_green,"OW_DJG_SWAMP_WAIT1_01");
	Wld_InsertNpc(gobbo_green,"OW_PATH_OC_NC2_TO_TOWER_01");
	Wld_InsertNpc(gobbo_green,"OW_PATH_OC_NC2_TO_TOWER_02");
	Wld_InsertNpc(gobbo_green,"OW_PATH_OC_NC");
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	if(DJG_SWAMPPARTY_GOGOGO == TRUE)
	{
		if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(djg_cipher) == FALSE))
		{
			b_startotherroutine(djg_rod,"SwampDragon");
		};
		b_startotherroutine(djg_cipher,"SwampDragon");
	};
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_SWAMP_HELLO(C_INFO)
{
	nr = 5;
	condition = dia_dragon_swamp_hello_condition;
	information = dia_dragon_swamp_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_swamp_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_swamp_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//Woe unto you, if you come one step closer!
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ah. The Eye of Innos seems to work.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//Many of your sort have come. I have swept them all away.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//Save your breath. Your big words don't scare me, you stinking spawn of hell.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//Tell me what I want to know, or I shall make you drown in your own blood.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ha ha ha. You dare to threaten me, little worm? Name just one reason why I should not tear you into a thousand pieces right now.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//I'm an envoy of Innos, and I carry the sacred Eye on me. You have no choice. You must surrender to my will, or be destroyed.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(bellows) Arrh. Say what you want of me.
};


instance DIA_DRAGON_SWAMP_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_swamp_werbistdu_condition;
	information = dia_dragon_swamp_werbistdu_info;
	description = "Who are you?";
};


func int dia_dragon_swamp_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//My name is Pandrodor. And you would be well advised if you crawled back under the rock from whence you came.
};


instance DIA_DRAGON_SWAMP_WOSINDDIEANDEREN(C_INFO)
{
	nr = 7;
	condition = dia_dragon_swamp_wosinddieanderen_condition;
	information = dia_dragon_swamp_wosinddieanderen_info;
	description = "Where can I find the rest of you repulsive creatures?";
};


func int dia_dragon_swamp_wosinddieanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_wosinddieanderen_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Where can I find the rest of you repulsive creatures?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//The elements, from which everything is made, hold this world together.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Each one stands for the ability to control a part of the world.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Search for the elements and you will find the others.
};

func void b_assigndragontalk_swamp(var C_NPC slf)
{
	dia_dragon_swamp_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_wosinddieanderen.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

