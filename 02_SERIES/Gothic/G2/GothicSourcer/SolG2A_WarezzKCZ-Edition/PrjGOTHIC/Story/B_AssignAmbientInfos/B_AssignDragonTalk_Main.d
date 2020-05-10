
instance DIA_DRAGONTALK_MAIN_1(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_1_condition;
	information = dia_dragontalk_main_1_info;
	permanent = FALSE;
	description = "What made you appear here?";
};


func int dia_dragontalk_main_1_condition()
{
	if(MIS_KILLEDDRAGONS == 0)
	{
		return 1;
	};
};

func void dia_dragontalk_main_1_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_1_15_00");	//Servant of Evil. What made you appear here? Have you only come to spread terror and panic?
	AI_Output(self,other,"DIA_DragonTalk_Main_1_20_01");	//The higher meaning of our congress in this world, little human, will remain hidden to you.
	Info_AddChoice(dia_dragontalk_main_1,"How can I get the other dragons to talk?",dia_dragontalk_main_1_reden);
	Info_AddChoice(dia_dragontalk_main_1,"What must I do to banish you again?",dia_dragontalk_main_1_verbannen);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void dia_dragontalk_main_1_verbannen()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_verbannen_15_00");	//What in the name of Innos must I do to ban you once again from the realms of humankind?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_01");	//(laughs) Before you can act, you must first understand the meaning of our congress.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_02");	//However, no one will disclose that to you of his own free will.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_03");	//The Eye alone could loosen our tongues and reveal to you our true goals.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_04");	//In any case, it will be of no use to you when you are dead.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_05");	//It has already been reported to us that you have chosen the path of the dragon hunter.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_06");	//Therefore, we have dispatched our offspring to your world in order to secure the continuance of our ancestral line.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_07");	//You have already lost, little human.
		Log_CreateTopic(TOPIC_DRACHENEIER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER,LOG_RUNNING);
		b_logentry(TOPIC_DRACHENEIER,"One of the dragons mumbled something about 'offspring' and the continuance of his ancestral line. I'm afraid they've scattered their brood throughout the civilized world.");
	}
	else
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_08");	//The Eye has granted you access. However, single combat alone will decide whether you are worthy of me.
	};
};

func void dia_dragontalk_main_1_reden()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_reden_15_00");	//How can I get the other dragons to talk?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_01");	//Only my heart could help you to renew the power of the Eye.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_02");	//But you will not succeed in snatching away my heart.
};


instance DIA_DRAGONTALK_MAIN_2(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_2_condition;
	information = dia_dragontalk_main_2_info;
	permanent = FALSE;
	description = "Who sent you here?";
};


func int dia_dragontalk_main_2_condition()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		return 1;
	};
};

func void dia_dragontalk_main_2_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_2_15_00");	//Whose orders do you follow? Who sent you here?
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_01");	//Our future and well-being is controlled by the Master with his Word of Power. Soon no one will be able to resist him.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_02");	//His long arm already stretches far from the Realm of the Dead. The spirits of the night gather in joyful anticipation of his arrival.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_03");	//He will overcome you humans and rule the world.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_04");	//In his shadow, we are no more than accessories to his creative power.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_05");	//The Master will come to raise your afflicted bodies from the ashes and use them to reshape the fate of the world.
	b_logentry(TOPIC_DRACHENJAGD,"The dragons are not their own masters. They serve a master they are unwilling to divulge anything other than vague prophecies about. The master will come to destroy the world and so on. The usual stuff.");
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_3(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_3_condition;
	information = dia_dragontalk_main_3_info;
	permanent = FALSE;
	description = "How can I defeat your master?";
};


func int dia_dragontalk_main_3_condition()
{
	if(MIS_KILLEDDRAGONS == 2)
	{
		return 1;
	};
};

func void dia_dragontalk_main_3_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_00");	//How can I defeat your master?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_01");	//He is almighty and nigh unto invincible. Should you be so foolish as to meet him nevertheless, you will die a slow and painful death.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_02");	//This isn't the first time I've heard that. Nearly invincible does not mean I cannot kill him.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_03");	//So, out with it: What must I do?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_04");	//In order to oppose my Master, you require things which he would never be able to obtain.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_05");	//And what would that be?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_06");	//You must acquire the finest armor known to your earthly community, and wear it on your skin.
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_01");	//You need a sword which has been blessed by your god.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_02");	//You need a rune which was crafted only for you.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_00");	//You need a weapon which was made only for you.
	};
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_08");	//But the most difficult condition of all is that you must win five companions who would follow you into death.
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_09");	//Then and only then can you dare to face the Master.
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_4(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_4_condition;
	information = dia_dragontalk_main_4_info;
	permanent = FALSE;
	description = "How can I find your Master?";
};


func int dia_dragontalk_main_4_condition()
{
	if(MIS_KILLEDDRAGONS == 3)
	{
		return 1;
	};
};

func void dia_dragontalk_main_4_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_00");	//How can I find your Master?
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_01");	//He has established his hoard in the solid rock of the Halls of Irdorath and waits there for his destiny.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_02");	//Until he can restore this world to the order which it has deserved, he waits there in deep meditation and...
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_03");	//Spare me the details. Just tell me where I can find these sacred halls of Irdorath.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_04");	//Ha ha ha. You disappoint me, little man. So you have withstood all the dangers and overcome almost all of us, and now you fail in your inability to use the higher knowledge.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_05");	//If Irdorath means nothing to you, then you had better go to your magicians and ask them to be allowed to take care of their worldly needs.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_06");	//For quite obviously, you are not yet ready for the heavy burden of their higher knowledge.
	Log_CreateTopic(TOPIC_BUCHHALLENVONIRDORATH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUCHHALLENVONIRDORATH,LOG_RUNNING);
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"The dragons' master is said to have taken refuge in the strong rock of the sacred Halls of Irdorath. Mmh. Sounds familiar. Now where did I read that?");
	b_npc_isalivecheck(OLDWORLD_ZEN);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void b_assigndragontalk_main(var C_NPC slf)
{
	dia_dragontalk_main_1.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_2.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_3.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_4.npc = Hlp_GetInstanceID(slf);
};

