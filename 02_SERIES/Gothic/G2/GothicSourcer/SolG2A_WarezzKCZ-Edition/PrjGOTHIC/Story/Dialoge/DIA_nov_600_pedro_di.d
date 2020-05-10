
instance DIA_PEDRO_DI_EXIT(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 999;
	condition = dia_pedro_di_exit_condition;
	information = dia_pedro_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_di_exit_condition()
{
	return TRUE;
};

func void dia_pedro_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_DI_YOU(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 2;
	condition = dia_pedro_di_you_condition;
	information = dia_pedro_di_you_info;
	description = "Traitor!";
};


func int dia_pedro_di_you_condition()
{
	return TRUE;
};

func void dia_pedro_di_you_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Traitor! So I've found you at last.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//You needn't think I'll have mercy on you just because I am one of the paladins.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Many of us mercenaries have sold their souls to Beliar, and often I still felt bad about slaughtering them just like that. For you, scummy swine, I'll make an exception!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Of all the soulless bastards I've met in my life, you're the worst by far. You are a disgrace to our order.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//I ought to just kill you on the spot.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//Stop. I beg you. They have put a spell on me. I would never have betrayed the monastery of my own free will.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//You have no idea what I've been through in the last few days. They put this voice in my head. I couldn't defend myself against it.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//The Orcish colonel questioned me for days. He beat me constantly. Spare me. I'm not guilty. You must believe me.
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Tell me what you know, then.",dia_pedro_di_you_verschon);
	Info_AddChoice(dia_pedro_di_you,"I don't have to do a thing. I'm going to kill you now.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"Give me just one reason why I should believe you.",dia_pedro_di_you_grund);
	if(MIS_GORAX_KILLPEDRO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pedro_di_you,"Serpentes gave me the order to kill you.",dia_pedro_di_you_serpentes);
	};
};

func void dia_pedro_di_you_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Give me just one reason why I should believe you.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//(pleading) Let me live. I can also give you information that will help you to get out of here again. You have to listen to me.
};


var int pedrodi_flee;

func void dia_pedro_di_you_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//I don't have to do a thing. I'm going to kill you now.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//By all the gods...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	b_attack(self,other,AR_NONE,1);
	PEDRODI_FLEE = LOG_RUNNING;
};

func void dia_pedro_di_you_serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Serpentes gave me the order to kill you, and as a matter of principle, I do what I am told.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//(pleading) Please, no. You can't do that. I could still be of great use to you. You have to see that.
	b_giveplayerxp(XP_PEDRO_SERPENTESMISSION);
	MIS_GORAX_KILLPEDRO = LOG_SUCCESS;
};

func void dia_pedro_di_you_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Tell me what you know, then.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//(relieved) Yes, of course. I'll tell you everything you want to know. Under one condition. You have to get me off of this accursed island, do you hear?
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"I don't have to do a thing. I'm going to kill you now.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"All right. Follow me, I'll take you to my ship.",dia_pedro_di_you_followship);
};


var int mis_pedro_di_followship;

func void dia_pedro_di_you_followship()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//All right. Follow me, I'll take you to the ship.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Thank you. You won't regret it.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_PEDRO_DI_FOLLOWSHIP = LOG_RUNNING;
};


instance DIA_PEDRO_DI_ARRIVEDATSHIP(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 4;
	condition = dia_pedro_di_arrivedatship_condition;
	information = dia_pedro_di_arrivedatship_info;
	description = "Here we are!";
};


func int dia_pedro_di_arrivedatship_condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_PEDRO_DI_FOLLOWSHIP == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pedro_di_arrivedatship_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Here we are!
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//An impressive ship you have there. You truly are a great general.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Stop babbling. Just tell me what I want to know.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Eh, of course. Where should I begin?
	Info_ClearChoices(dia_pedro_di_arrivedatship);
	Info_AddChoice(dia_pedro_di_arrivedatship,"I've heard enough.",dia_pedro_di_arrivedatship_back);
	Info_AddChoice(dia_pedro_di_arrivedatship,"How can I get to the interior of the island?",dia_pedro_di_arrivedatship_innere);
	Info_AddChoice(dia_pedro_di_arrivedatship,"What other monsters are haunting this island?",dia_pedro_di_arrivedatship_monster);
	Info_AddChoice(dia_pedro_di_arrivedatship,"What about that orcish colonel?",dia_pedro_di_arrivedatship_orkoberst);
};

func void dia_pedro_di_arrivedatship_orkoberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//What about that orcish colonel?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//He took away my last spark of hope of ever seeing my homeland again.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//Since I came here, he has been questioning me about the strategic placement of the paladins in Khorinis.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Of course, I couldn't tell him much about that. How could I, damnit? I am a novice of the Fire.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
	{
		Info_AddChoice(dia_pedro_di_arrivedatship,"The orcish colonel is dead.",dia_pedro_di_arrivedatship_obersttot);
	};
};

func void dia_pedro_di_arrivedatship_monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//What other monsters are haunting this island?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//During the day, you often see the lizard people walking towards the coast. They usually carry very large eggs with them.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//I didn't catch a lot of this in my cell, but I think they're getting ready to leave the island.
};

func void dia_pedro_di_arrivedatship_innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//How can I get to the interior of the island?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//There is a secret passage in the orcish colonel's throne room.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//They dragged me there every time he wanted to question me. I saw it there.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//One of the shamans started a mechanism by pulling on the torches that hang on the walls of the hall.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//Mmh. I think he first pulled on the left torch and then the right, but I can' remember it exactly.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//In the rear area, a secret passage suddenly opened that led deep into the mountain.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Where this passage ends, I don't know.
};

func void dia_pedro_di_arrivedatship_obersttot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//The orcish colonel is dead.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Dead? Innos be praised. I shall never forget his hideous face.
};

func void dia_pedro_di_arrivedatship_back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//I've heard enough. Go find a place on my ship. I've still got a job to do.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//May the power of Innos go with you. I shall pray for you.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_PEDRO_DI_PERM(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 5;
	condition = dia_pedro_di_perm_condition;
	information = dia_pedro_di_perm_info;
	permanent = TRUE;
	description = "Tired?";
};


var int pedrodi_talknomore;

func int dia_pedro_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you) && (PEDRODI_TALKNOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_di_perm_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Tired?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PEDRODI_FLEE == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Would you like me to bring you a pillow, then?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Spare me, please. I'll sit here very quietly and I won't make a sound.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//Mmh.
			b_giveplayerxp(XP_AMBIENT);
			PEDRODI_FLEE = LOG_SUCCESS;
		}
		else if(Npc_IsDead(dragon_undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//I'm completely done in.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Go hit the sack. We'll soon be at sea again.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Thanks, man. I already thought I'd fall right off this bench. Good night.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PEDRODI_TALKNOMORE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//It's all right. Thanks.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//Please. Let me live!
		AI_StopProcessInfos(self);
	};
};

