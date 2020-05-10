
func void b_dragon_undead_bla()
{
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_00");	//Well, kid? Have you got an original copy, then?
};


instance DIA_DRAGON_UNDEAD_EXIT(C_INFO)
{
	npc = dragon_undead;
	nr = 999;
	condition = dia_dragon_undead_exit_condition;
	information = dia_dragon_undead_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_undead_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_undead_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_UNDEAD_HELLO(C_INFO)
{
	npc = dragon_undead;
	nr = 5;
	condition = dia_dragon_undead_hello_condition;
	information = dia_dragon_undead_hello_info;
	important = TRUE;
};


func int dia_dragon_undead_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_undead_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//So now you have managed to find me. I have waited all too long for your arrival.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//Come on. Stop pretending you planned it that way.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//(laughs loudly) What do you know of my intentions?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//Have I not sent you the Seekers to lure you onto my trail?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//Have I not left the signs of my existence so clearly that you absolutely could not miss me?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//And have the dragon eggs not contributed to your armor, which helped you get to me?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//Were not the converted paladins reason enough for you to seek after the secret driving force?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//Were not the possessed of your kind reason enough for you to seek after the secret driving force?
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//As much as you twist and turn, you cannot dispute all of that.
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_01");	//There is only one thing that was not predetermined!
	AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_02");	//You have destroyed one of my servants! He was chosen to bear the claw.
	if(c_schasequippedbeliarsweapon() || c_schasreadiedbeliarsweapon() || c_schasbeliarsrune())
	{
		AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_03");	//As I see, you now bear it. For this outrage, you will die!
	};
	Info_AddChoice(dia_dragon_undead_hello,"Enough said.",dia_dragon_undead_hello_attack);
	Info_AddChoice(dia_dragon_undead_hello,"On whose behalf are you leading your minions to war against humankind?",dia_dragon_undead_hello_auftraggeber);
	Info_AddChoice(dia_dragon_undead_hello,"Why are you here?",dia_dragon_undead_hello_warum);
	Info_AddChoice(dia_dragon_undead_hello,"Who are you?",dia_dragon_undead_hello_wer);
	b_logentry(TOPIC_HALLENVONIRDORATH,"The enemy is an undead dragon. I have to kill him before I can leave this damned island.");
};

func void dia_dragon_undead_hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//(laughs) You still have to ask that? Search within yourself, you fool. You know who I am.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_02");	//I bear no name. Just as you bear no name.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//I am given the divine power from my creator. Just as you bear the power of your god in you.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//My fate is the destruction of the world.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//Just as your fate is determined by the integrity and virtue of a paladin.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//Just as your hand brings certain death, dragon hunter.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//Just as the preaching of the faith of Innos is your purpose, Magician of Fire.
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//Do you not feel the bond that ties us together? Yes. You know who I am.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//(confused) No. That cannot be. Xardas always said...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//Xardas is weak and no threat to me. You alone are worthy of facing me.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//So it is written. The time has come to accept your fate.
};

func void dia_dragon_undead_hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//Why are you here?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//The divinity bestowed upon me will inspire me to drown the world in a river of violence.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//Only when the last fortress of the righteous has fallen shall I rest.
};

func void dia_dragon_undead_hello_auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//On whose behalf are you leading your minions to war against humankind?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//My master is the Lord of Night. You know him. You can hear his call.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//My armies will rise from the ground in his name and shroud the world in darkness.
};

func void dia_dragon_undead_hello_attack()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_attack_15_00");	//Enough said. I shall chase you back under the rock from whence you crept, you monster.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//(laughs) You are not yet ready to defeat me. Only one brief moment and I shall have reached my goal.
	if(c_schasequippedbeliarsweapon() || c_schasreadiedbeliarsweapon() || c_schasbeliarsrune())
	{
		AI_Output(self,other,"DIA_Addon_UndeadDragon_Add_20_04");	//Do you really believe you can injure me with the claw? (laughs)
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//Your bones will serve me to let the ill winds of death blow across the world.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

