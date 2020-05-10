
instance DIA_GESTATH_EXIT(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 999;
	condition = dia_gestath_exit_condition;
	information = dia_gestath_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gestath_exit_condition()
{
	return TRUE;
};

func void dia_gestath_exit_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_djg_crawler) == TRUE)
	{
		AI_Output(self,other,"DIA_Gestath_EXIT_09_00");	//(dryly) Cool armor!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GESTATH_HALLO(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 3;
	condition = dia_gestath_hallo_condition;
	information = dia_gestath_hallo_info;
	description = "What's up?";
};


func int dia_gestath_hallo_condition()
{
	return TRUE;
};

func void dia_gestath_hallo_info()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_15_00");	//How's it going?
	AI_Output(self,other,"DIA_Gestath_HALLO_09_01");	//(dryly) Brave of you to come here. You got lost, huh?
	GESTATH_TEACHANIMALTROPHY = TRUE;
	Info_ClearChoices(dia_gestath_hallo);
	Info_AddChoice(dia_gestath_hallo,"What is there to see here?",dia_gestath_hallo_waszusehen);
	Info_AddChoice(dia_gestath_hallo,"What are you doing up here?",dia_gestath_hallo_was);
};

func void dia_gestath_hallo_plate()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_15_00");	//That's some armor you're wearing.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_01");	//Yeah. Hard to get. It's made of minecrawler plates. A guy named Wolf made it for me.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_09_02");	//I used to be a convict here in the colony. Gave him a couple of minecrawler plates and a few days later the thing was finished. The guy's okay.
	WOLF_PRODUCECRAWLERARMOR = TRUE;
	Info_AddChoice(dia_gestath_hallo,DIALOG_BACK,dia_gestath_hallo_back);
	Info_AddChoice(dia_gestath_hallo,"Where's this Wolf now?",dia_gestath_hallo_plate_wowolf);
};

func void dia_gestath_hallo_plate_wowolf()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_plate_woWolf_15_00");	//Where's this Wolf now?
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_01");	//It's been a while since I've seen him. Back then he was a mercenary here in the colony.
	AI_Output(self,other,"DIA_Gestath_HALLO_plate_woWolf_09_02");	//I suppose he still hangs around with the boys.
};

func void dia_gestath_hallo_was()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_00");	//What are you doing up here?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_01");	//I'm here to make money.
	AI_Output(other,self,"DIA_Gestath_HALLO_was_15_02");	//Here, in the middle of nowhere?
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_03");	//I'm a hunter. I specialize in difficult cases.
	AI_Output(self,other,"DIA_Gestath_HALLO_was_09_04");	//Fire lizards, minecrawlers, dragon snappers... Anything nobody else will hunt. That brings in the money.
	Info_AddChoice(dia_gestath_hallo,"That's some armor you're wearing.",dia_gestath_hallo_plate);
};

func void dia_gestath_hallo_waszusehen()
{
	AI_Output(other,self,"DIA_Gestath_HALLO_waszusehen_15_00");	//What is there to see here?
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_01");	//A bunch of fire lizards, orcs and I don't know what all. Haven't been farther up on the high plain.
	AI_Output(self,other,"DIA_Gestath_HALLO_waszusehen_09_02");	//I'd advise you against trying it. The things that live up there don't sound too friendly.
};

func void dia_gestath_hallo_back()
{
	Info_ClearChoices(dia_gestath_hallo);
};


instance DIA_GESTATH_DRACHEN(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 3;
	condition = dia_gestath_drachen_condition;
	information = dia_gestath_drachen_info;
	permanent = TRUE;
	description = "Can you gut dragons, too?";
};


var int gestath_dragontrophy;

func int dia_gestath_drachen_condition()
{
	if((GESTATH_DRAGONTROPHY == FALSE) && (GESTATH_TEACHANIMALTROPHY == TRUE))
	{
		return TRUE;
	};
};

func void dia_gestath_drachen_info()
{
	AI_Output(other,self,"DIA_Gestath_Drachen_15_00");	//Can you gut dragons, too?
	if(KAPITEL < 4)
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_01");	//(laughs) Ask me again later, when you're ready for something like that, okay?
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_Drachen_09_02");	//Sure. Why not?
		GESTATH_DRAGONTROPHY = TRUE;
	};
};


instance DIA_GESTATH_TEACHHUNTING(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 12;
	condition = dia_gestath_teachhunting_condition;
	information = dia_gestath_teachhunting_info;
	permanent = TRUE;
	description = "Teach me how to gut animals.";
};


func int dia_gestath_teachhunting_condition()
{
	if(GESTATH_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_gestath_teachhunting_onetime;

func void dia_gestath_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gestath_TEACHHUNTING_15_00");	//Teach me how to gut animals.
	if((PLAYER_TALENT_TAKEANIMALTROPHY[6] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[10] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[9] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[11] == FALSE) || ((GESTATH_DRAGONTROPHY == TRUE) && ((PLAYER_TALENT_TAKEANIMALTROPHY[12] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[13] == FALSE))))
	{
		if(DIA_GESTATH_TEACHHUNTING_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_01");	//Why not? I've got enough at the moment.
			DIA_GESTATH_TEACHHUNTING_ONETIME = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_02");	//What do you want to know?
		};
		Info_AddChoice(dia_gestath_teachhunting,DIALOG_BACK,dia_gestath_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[6] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Tongue of fire",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_FIRETONGUE)),dia_gestath_teachhunting_firetongue);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[10] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Remove crawler plates",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_CRAWLERPLATE)),dia_gestath_teachhunting_crawlerplate);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[9] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Remove mandibles",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_MANDIBLES)),dia_gestath_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[11] == FALSE)
		{
			Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Dragon snapper horn",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRGSNAPPERHORN)),dia_gestath_teachhunting_drgsnapperhorn);
		};
		if(GESTATH_DRAGONTROPHY == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[12] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Remove dragon scales",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONSCALE)),dia_gestath_teachhunting_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[13] == FALSE)
			{
				Info_AddChoice(dia_gestath_teachhunting,b_buildlearnstring("Collect dragon blood",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DRAGONBLOOD)),dia_gestath_teachhunting_dragonblood);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_09_03");	//At the moment, I don't know what I could still teach you.
	};
};

func void dia_gestath_teachhunting_back()
{
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_firetongue()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FIRETONGUE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_FireTongue_09_00");	//You cut a fire lizard's tongue out of its mouth with one stroke of the knife, while you hold it with your other hand.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_CrawlerPlate_09_00");	//You have to peel crawler plates off the beasts' backs with a sturdy knife.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_Mandibles_09_00");	//Mandibles are lodged rather deeply in the skull of a field raider or minecrawler. It takes some effort to pry them out.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DrgSnapperHorn_09_00");	//The best place to separate a dragon snapper's horn from the skull is at the top of its forehead. Use a sturdy knife.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonScale_09_00");	//Dragon scales are really stubborn, but just when you think you can't do it, the thing comes right off the dragon's back.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};

func void dia_gestath_teachhunting_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Gestath_TEACHHUNTING_DragonBlood_09_00");	//The best place to take blood is from its underside. Look for a soft spot and stab with a sharp knife.
	};
	Info_ClearChoices(dia_gestath_teachhunting);
};


instance DIA_GESTATH_PICKPOCKET(C_INFO)
{
	npc = vlk_4148_gestath;
	nr = 900;
	condition = dia_gestath_pickpocket_condition;
	information = dia_gestath_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_gestath_pickpocket_condition()
{
	return c_beklauen(81,350);
};

func void dia_gestath_pickpocket_info()
{
	Info_ClearChoices(dia_gestath_pickpocket);
	Info_AddChoice(dia_gestath_pickpocket,DIALOG_BACK,dia_gestath_pickpocket_back);
	Info_AddChoice(dia_gestath_pickpocket,DIALOG_PICKPOCKET,dia_gestath_pickpocket_doit);
};

func void dia_gestath_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gestath_pickpocket);
};

func void dia_gestath_pickpocket_back()
{
	Info_ClearChoices(dia_gestath_pickpocket);
};

