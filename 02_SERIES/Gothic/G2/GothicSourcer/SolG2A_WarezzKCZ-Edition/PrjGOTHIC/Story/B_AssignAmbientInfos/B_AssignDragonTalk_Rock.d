
instance DIA_DRAGON_ROCK_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_rock_exit_condition;
	information = dia_dragon_rock_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_rock_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Enough words. Your temporary power is exhausted. The Eye has lost its strength. Prepare to die.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	Wld_InsertNpc(ybloodfly,"FP_ROAM_OW_ROCK_DRACONIAN_02");
	Wld_InsertNpc(ybloodfly,"PATH_TO_PLATEAU02");
	Wld_InsertNpc(ybloodfly,"OW_WATERFALL_GOBBO10");
	Wld_InsertNpc(draconian,"PLATEAU_ROUND07");
	Wld_InsertNpc(gobbo_warrior,"PATH_TO_PLATEAU04_BRIDGE2");
	Wld_InsertNpc(gobbo_green,"ROCKDRAGON_GOBBO1");
	Wld_InsertNpc(gobbo_green,"ROCKDRAGON_GOBBO2");
	Wld_InsertNpc(gobbo_green,"ROCKDRAGON_GOBBO3");
	Wld_InsertNpc(gobbo_green,"ROCKDRAGON_GOBBO4");
};


instance DIA_DRAGON_ROCK_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_rock_hello_condition;
	information = dia_dragon_rock_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_rock_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return 1;
	};
};

func void dia_dragon_rock_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Yet another presumptuous wight who dares to climb my rock. You little humans. So brave, and yet so fragile.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Hey, you can actually talk.
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//I shall tear out your entrails and feed them to the rats.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Not so fast. I bear the Eye of Innos. You will obey me and answer my questions.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(bellows) Arrh. Ask your questions.
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "Who are you?";
};


func int dia_dragon_rock_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//I am called Pedrakhan and I shall slowly skin you alive when I catch you.
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "Who is the strongest among you dragons?";
};


func int dia_dragon_rock_hierarchie_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hierarchie_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Who is the strongest among you dragons?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//We draw our power from the elements of this world. Their hierarchy is clear and simple.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Land formed of soft earth bestows life on all creatures under the sun. Yet it will open up and swallow you entirely if you get too close to it.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//The rock, which would rather break than ever surrender, towers with pride and buries the careless beneath itself. And yet it offers the best protection from the tide.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//The spark of life lives in the deep fires of this world. And yet the fire incinerates everything in a breath, leaving nothing but ashes.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//All our elements preserve and destroy. But only in water that has become hard and solid as rock will everything be transformed into an eternal pillar of salt where life is barely possible.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

