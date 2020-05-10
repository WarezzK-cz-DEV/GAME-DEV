
instance DIA_DRAGON_FIRE_ISLAND_EXIT(C_INFO)
{
	npc = dragon_fire_island;
	nr = 999;
	condition = dia_dragon_fire_island_exit_condition;
	information = dia_dragon_fire_island_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_island_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_FIRE_ISLAND_HELLO(C_INFO)
{
	npc = dragon_fire_island;
	nr = 5;
	condition = dia_dragon_fire_island_hello_condition;
	information = dia_dragon_fire_island_hello_info;
	important = TRUE;
};


func int dia_dragon_fire_island_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//Stay, human. All of my senses tell me that the murderer of my own flesh and blood stands before me.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//Really? Who are you calling a murderer, you hellspawn?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//Was it not enough for you that you destroyed almost all of our offspring?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//You have my brother Feomathar on your conscience, and you will pay for that.
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//I'll get to the rest of your disgusting brood as well.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//Arrh. It will be a pleasure for me to burn you alive.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//Stop making so much noise. Let's get down to business.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//You have come far, little human, but you will never leave these halls alive.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Another fire dragon. I'm getting fed to the teeth with those beasts. All I want is to get across the chasm that's opening behind the fire dragon.");
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

