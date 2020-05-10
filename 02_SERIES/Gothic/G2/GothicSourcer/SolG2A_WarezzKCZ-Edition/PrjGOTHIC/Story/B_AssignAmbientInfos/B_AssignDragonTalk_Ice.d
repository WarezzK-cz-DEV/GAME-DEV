
instance DIA_DRAGON_ICE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_ice_exit_condition;
	information = dia_dragon_ice_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_ice_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_ice_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//The power of the Eye is extinguished, and your time has run out.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_29_02");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc(keiler,"SPAWN_OW_MOLERAT_OCWOOD_OC2");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(snapper,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(snapper,"OW_PATH_SCAVENGER12_SPAWN01");
	Wld_InsertNpc(ybloodfly,"FP_SLEEP_OW_SCAVENGER_13_02");
	Wld_InsertNpc(ybloodfly,"FP_ROAM_OW_SCAVENGER_13_05");
	Wld_InsertNpc(ybloodfly,"OW_PATH_SCAVENGER13_SPAWN01");
	Wld_InsertNpc(ybloodfly,"OW_PATH_055");
	Wld_InsertNpc(ybloodfly,"OC_ROUND_20");
	Wld_InsertNpc(giant_bug,"OW_SCAVENGER_TREE_SPAWN");
	Wld_InsertNpc(icewolf,"FP_SLEEP_OW_BLOODFLY_05_02");
};


instance DIA_DRAGON_ICE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_ice_hello_condition;
	information = dia_dragon_ice_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_ice_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_ice_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Why do you disturb my rest? Must I bury myself still farther, just so you annoying little mites will finally leave me alone?
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//A talking dragon. Thanks be to the Eye of Innos.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//You humans are curious creatures. Swept away by the icy winds of death, there will always be at least one who rises from the ashes, thinking he is destined to be a hero.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//But that will soon be over. I shall personally see to it that none of you will rise again any time soon.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Silence. With the power of the sacred Eye which has been bestowed upon me, I order you to answer my questions.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ha ha ha. Ask away, then. Your knowledge will not help you.
};


instance DIA_DRAGON_ICE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_ice_werbistdu_condition;
	information = dia_dragon_ice_werbistdu_info;
	description = "Who are you?";
};


func int dia_dragon_ice_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//I am Finkregh. Lord of ice and snow, Guardian of the Congress and, ultimately, your death.
};


instance DIA_DRAGON_ICE_BELIAR(C_INFO)
{
	nr = 6;
	condition = dia_dragon_ice_beliar_condition;
	information = dia_dragon_ice_beliar_info;
	description = "Which god do you serve?";
};


func int dia_dragon_ice_beliar_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_beliar_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Which god do you serve?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//What accursed god could ever allow despicable creatures such as you to walk this earth?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Do not trouble yourself trying to understand the meaning of our gathering, little hero.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Beliar has not only permitted us to be here - he has even commanded it.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Inspired by his holy words, we shall not rest until his will is made deed.
};

func void b_assigndragontalk_ice(var C_NPC slf)
{
	dia_dragon_ice_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_beliar.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

