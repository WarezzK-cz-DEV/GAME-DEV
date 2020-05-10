
instance DIA_JACK_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_exit_condition;
	information = dia_jack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_jack_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_PICKPOCKET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 900;
	condition = dia_jack_pickpocket_condition;
	information = dia_jack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jack_pickpocket_condition()
{
	return c_beklauen(50,100);
};

func void dia_jack_pickpocket_info()
{
	Info_ClearChoices(dia_jack_pickpocket);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_BACK,dia_jack_pickpocket_back);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_PICKPOCKET,dia_jack_pickpocket_doit);
};

func void dia_jack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jack_pickpocket);
};

func void dia_jack_pickpocket_back()
{
	Info_ClearChoices(dia_jack_pickpocket);
};


instance DIA_JACK_GREET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 4;
	condition = dia_jack_greet_condition;
	information = dia_jack_greet_info;
	important = TRUE;
};


func int dia_jack_greet_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jack_greet_info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//Ahoy, you landlubber, looks like you're stranded here.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//You look a bit pale around the gills.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//Never mind, my lad. All you need is a good stiff sea breeze.
};


instance DIA_JACK_JOB(C_INFO)
{
	npc = vlk_444_jack;
	nr = 5;
	condition = dia_jack_job_condition;
	information = dia_jack_job_info;
	description = "What are you doing here?";
};


func int dia_jack_job_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_greet))
	{
		return TRUE;
	};
};

func void dia_jack_job_info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//Back when I was a young man, I went to sea and rode through many a big storm.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//No big deal. Not at all. But that old tower came closest to what I would call a home.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//I haven't been up there in ages.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//Why not?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//Ever since those scallywags took over my lighthouse, I haven't dared get closer to it than twenty feet. Really bad rabble, that.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//They're criminals from the Valley of Mines, you know.
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//There was this big bang on the other side of the mountains, and then they swarmed all over the land like flies. Now they're hiding out everywhere - even in my lighthouse.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//I think they're on the lookout for a ship they can raid.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//Ha! Let them. Then at least they'd be out of my tower.
	Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
	b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,"The old seadog Jack can't get back in his lighthouse while the bandits are settled in there.");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};


instance DIA_JACK_CITY(C_INFO)
{
	npc = vlk_444_jack;
	nr = 6;
	condition = dia_jack_city_condition;
	information = dia_jack_city_info;
	description = "Do you come to town often?";
};


func int dia_jack_city_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_job))
	{
		return TRUE;
	};
};

func void dia_jack_city_info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//Do you come to town often?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//I always say, a town is only as good as its harbor.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//A harbor is a gate to the world. That's where everyone meets, and where everything starts.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//Once the harbor goes to the dogs, the rest of the city will follow soon.
};


instance DIA_JACK_HARBOR(C_INFO)
{
	npc = vlk_444_jack;
	nr = 70;
	condition = dia_jack_harbor_condition;
	information = dia_jack_harbor_info;
	permanent = TRUE;
	description = "Tell me about the harbor.";
};


func int dia_jack_harbor_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_city) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JACKISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_harbor_info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//Tell me about the harbor.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//The harbor of Khorinis isn't what it used to be.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//There's nothing but riffraff hanging about, the ship's don't come in any more, and trade is dead. This harbor's about to go under.
	Info_ClearChoices(dia_jack_harbor);
	Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
	Info_AddChoice(dia_jack_harbor,"Why are the ships no longer coming?",dia_jack_harbor_ships);
	Info_AddChoice(dia_jack_harbor,"What do you mean by riffraff?",dia_jack_harbor_rogue);
	Info_AddChoice(dia_jack_harbor,"So why don't you leave?",dia_jack_harbor_leave);
};

func void dia_jack_harbor_back()
{
	Info_ClearChoices(dia_jack_harbor);
};

func void dia_jack_harbor_ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//Why are the ships no longer coming?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//They all say that, once the war is over, everything will be like it used to. That's a load of bilge water.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//I tell you, a sailor can see when a town's going downhill.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//A sailor feels that in his blood. And I tell you, forget about this harbor, its heyday's over.
};

func void dia_jack_harbor_rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//What do you mean by riffraff?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//Look at them, the lazy rabble. Most of them don't even know what work is. All they do is drink all day and spend their last pay at the brothel.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//I tell you, stay away from them.
};

func void dia_jack_harbor_leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//So why don't you leave?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//Nobody would take an old sea dog like me on his ship these days.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//Most people think that Old Jack's got the gout in his rotten old bones.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//And? Are they right?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//Balderdash. Once I've got those planks below my feet again, I'll feel like a young whippersnapper.
};


instance DIA_JACK_BANDITENWEG(C_INFO)
{
	npc = vlk_444_jack;
	nr = 7;
	condition = dia_jack_banditenweg_condition;
	information = dia_jack_banditenweg_info;
	description = "The bandits that were occupying your lighthouse are gone.";
};


func int dia_jack_banditenweg_condition()
{
	if(Npc_IsDead(leuchtturmbandit_1021) && Npc_IsDead(leuchtturmbandit_1022) && Npc_IsDead(leuchtturmbandit_1023) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//The bandits that were haunting your lighthouse are gone.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//Is that really true? Finally I can get back to my work.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//Come with me to the lighthouse. You get an incredible view of the sea up there.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLLIGHTHOUSEBANDITS);
};


instance DIA_JACK_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_444_jack;
	nr = 8;
	condition = dia_jack_lighthousefree_condition;
	information = dia_jack_lighthousefree_info;
	permanent = TRUE;
	description = "Nice lighthouse you've got here.";
};


func int dia_jack_lighthousefree_condition()
{
	if((MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//Nice lighthouse you've got here.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//Thank you. Just walk on all the way upstairs and take in the beautiful view, my lad. Make yourself at home.
};


instance DIA_JACK_KAP3_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap3_exit_condition;
	information = dia_jack_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jack_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP4_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap4_exit_condition;
	information = dia_jack_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jack_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP5_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap5_exit_condition;
	information = dia_jack_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jack_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 51;
	condition = dia_jack_bemycaptain_condition;
	information = dia_jack_bemycaptain_info;
	permanent = TRUE;
	description = "Wouldn't you like to go back to sea?";
};


func int dia_jack_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == 0))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//Wouldn't you like going back to sea?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//I'd give my right arm if only they'd hire me on a big schooner just one more time.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//But for an old sea dog like me, that's not so easy, my lad. Anyway, who would take care of the lighthouse then?
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Never mind. It was just an idea.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"I need your experience as a sailor.",dia_jack_bemycaptain_seaman);
};

func void dia_jack_bemycaptain_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//I need your experience as a sailor.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//Shiver me timbers. What are you planning to do, matey? You're not fixing to board the King's war galley, are you?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//Who knows?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(laughs) That would be something. Oh well. But I can't give up my lighthouse just like that. Mmh. What shall we do about that?
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Jack, the old sailor from the harbor, would make a good captain. But first I'd have to find someone to guard his lighthouse.");
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"Never mind. It was just an idea.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"What if I brought you someone...?",dia_jack_bemycaptain_seaman_newofficer);
};

func void dia_jack_bemycaptain_seaman_newofficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//What if I brought you someone to take care of your lighthouse in the meantime?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//Not a bad idea, matey. And I know just the person.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//Harad the blacksmith has an apprentice called Brian. I've talked to him many times before.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//I'd like to entrust my lighthouse to him. I think he'd be just the person for that.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//Go talk to him. Maybe we're lucky and the lad will help us out.
	Info_ClearChoices(dia_jack_bemycaptain);
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};

func void dia_jack_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//Never mind. It was just an idea.
	Info_ClearChoices(dia_jack_bemycaptain);
};


instance DIA_JACK_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_444_jack;
	nr = 52;
	condition = dia_jack_bemycaptain2_condition;
	information = dia_jack_bemycaptain2_info;
	description = "About Brian...";
};


func int dia_jack_bemycaptain2_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) || ((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_IsDead(brian)))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain2_info()
{
	if(Npc_IsDead(brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//Brian is dead.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//Oh. These are terrible times. And such a nice fellow he was.
		MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//Brian will take care of your lighthouse from now on.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//I had hoped you would say that.
		b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
		if(SCGOTCAPTAIN == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//Do you still need me?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//Let's see whether the boy is any good.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_JACK_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_444_jack;
	nr = 53;
	condition = dia_jack_bemycaptain3_condition;
	information = dia_jack_bemycaptain3_info;
	description = "Be my captain.";
};


func int dia_jack_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == FALSE) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//Be my captain.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//I've sailed the seven seas, my lad, but never before have I been captain of a ship.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//I know nothing about navigation. You're going to have to do that.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//I shall give it my best.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//So, show me your ship and your crew. Do you know, then, where you're headed? I mean, d'you have a nautical chart?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//Wait for me at the harbor. Don't worry about the rest.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//If you say so.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JACKISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JACK_LOSFAHREN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_losfahren_condition;
	information = dia_jack_losfahren_info;
	permanent = TRUE;
	description = "Right, old man. Let us set sail.";
};


func int dia_jack_losfahren_condition()
{
	if((JACKISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_losfahren_info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//Right, old man. Let us set sail.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//Everything's ship-shape. Show me your nautical chart then.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//Some trip this is turning out to be. I hope we'll get there in one piece.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//D'you really have everything you need? We're not going to sail back just because you're still missing something.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//If you're sure that you've got everything, go to the captain's quarters and hit the sack. You're going to need it.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//Easy does it, my lad. I haven't even seen the tub yet. It doesn't work this way.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//First, you need a complete crew with at least 5 men, free access to the ship, and a nautical chart. Otherwise, forget it.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JACK_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_perm5_notcaptain_condition;
	information = dia_jack_perm5_notcaptain_info;
	permanent = TRUE;
	description = "So what happens next?";
};


func int dia_jack_perm5_notcaptain_condition()
{
	if((Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JACKISCAPTAIN == FALSE)) || (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_jack_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//So what happens next?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//I've thought matters over. I'm going to stay here and guard my lighthouse after all.
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP6_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap6_exit_condition;
	information = dia_jack_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jack_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

