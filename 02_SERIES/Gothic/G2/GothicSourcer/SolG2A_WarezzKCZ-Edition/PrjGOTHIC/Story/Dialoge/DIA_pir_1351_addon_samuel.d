
instance DIA_ADDON_SAMUEL_EXIT(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 999;
	condition = dia_addon_samuel_exit_condition;
	information = dia_addon_samuel_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_samuel_exit_condition()
{
	return TRUE;
};

func void dia_addon_samuel_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SAMUEL_HELLO(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 1;
	condition = dia_addon_samuel_hello_condition;
	information = dia_addon_samuel_hello_info;
	important = TRUE;
};


func int dia_addon_samuel_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_hello_info()
{
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_00");	//Ah, a new face!
	AI_Output(self,other,"DIA_Addon_Samuel_Hello_14_01");	//What do you want - rum, or something stronger?
	Log_CreateTopic(TOPIC_ADDON_PIR_TRADER,LOG_NOTE);
	b_logentry(TOPIC_ADDON_PIR_TRADER,LOG_TEXT_ADDON_SAMUELTRADE);
};


instance DIA_ADDON_SAMUEL_FRANCIS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 2;
	condition = dia_addon_samuel_francis_condition;
	information = dia_addon_samuel_francis_info;
	description = "I want to talk to you about Francis.";
};


func int dia_addon_samuel_francis_condition()
{
	if(FRANCIS_AUSGESCHISSEN == FALSE)
	{
		if(Npc_KnowsInfo(other,dia_addon_skip_gregshut) || (francis.aivar[AIV_TALKEDTOPLAYER] == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_addon_samuel_francis_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_00");	//I want to talk to you about Francis.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_01");	//Just don't mention that wannabe Captain!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_02");	//He sits on his fat ass all day, acting important.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_03");	//We'd all like to know what the hell the Captain was thinking when he put HIM in command here!
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_04");	//What do you want from that prig?
};


instance DIA_ADDON_SAMUEL_VERSTECK(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 3;
	condition = dia_addon_samuel_versteck_condition;
	information = dia_addon_samuel_versteck_info;
	description = "I must get into Greg's hut.";
};


func int dia_addon_samuel_versteck_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_francis) && (FRANCIS_AUSGESCHISSEN == FALSE) && (GREGISBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_versteck_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_02");	//I must get into Greg's hut.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_05");	//(slyly) Really? To do what?
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_01");	//I need a bandit's armor.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_06");	//(laughs) Francis will NEVER agree to let you into the hut so you can nab a few of Greg's things.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_07");	//Unless...
	AI_Output(other,self,"DIA_Addon_Samuel_Francis_15_03");	//Yes?
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_08");	//... you've got something he really wants.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_09");	//I know that Francis has hidden something in an abandoned mine in the canyon.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_10");	//Once, when we were on guard duty together and he dozed off as always, he went on about it in his sleep.
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_11");	//I've no clue what he buried there, but maybe it's so important to him that he'll let you into the hut to get it back...
	AI_Output(self,other,"DIA_Addon_Samuel_Francis_14_12");	//(happily) When the Captain comes back and finds some of his things missing, he'll have Francis' hide for it.
	b_logentry(TOPIC_ADDON_BDTRUESTUNG,"Samuel the moonshiner mentioned a secret hiding place of Francis' in one of the mines in the canyon. Maybe I can find something there that will help me get into the hut.");
};


var int samuel_knows_loushammer;
var int samuel_knows_schlafhammer;

instance DIA_ADDON_SAMUEL_RECIPE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 4;
	condition = dia_addon_samuel_recipe_condition;
	information = dia_addon_samuel_recipe_info;
	permanent = TRUE;
	description = "I've got a recipe for you!";
};


func int dia_addon_samuel_recipe_condition()
{
	if(((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0)) || ((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0)))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_recipe_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_15_00");	//I've got a recipe for you!
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_14_01");	//Great, let me see. What kind of recipe?
	Info_ClearChoices(dia_addon_samuel_recipe);
	if((SAMUEL_KNOWS_LOUSHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Lou's Hammer",dia_addon_samuel_recipe_loushammer);
	};
	if((SAMUEL_KNOWS_SCHLAFHAMMER == FALSE) && (Npc_HasItems(other,itwr_addon_lou_rezept2) > 0))
	{
		Info_AddChoice(dia_addon_samuel_recipe,"Lou's Double Hammer",dia_addon_samuel_recipe_lousdoublehammer);
	};
};

func void dia_addon_samuel_recipe_back()
{
	Info_ClearChoices(dia_addon_samuel_recipe);
};

func void dia_addon_samuel_recipe_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousHammer_15_00");	//It's from Snaf.
	b_giveinvitems(other,self,itwr_addon_lou_rezept,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousHammer_14_04");	//But that sounds terrible - I must try it at once!
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_LOUSHAMMER = TRUE;
};

func void dia_addon_samuel_recipe_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_15_00");	//Be careful - that's absolutely deadly stuff!
	b_giveinvitems(other,self,itwr_addon_lou_rezept2,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Addon_Samuel_Recipe_LousDoubleHammer_14_04");	//You're scaring me. But I'll give it a try anyway.
	b_giveplayerxp(XP_AMBIENT);
	SAMUEL_KNOWS_SCHLAFHAMMER = TRUE;
};


var int samuel_grog_varianz;

instance DIA_ADDON_SAMUEL_GROG(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 5;
	condition = dia_addon_samuel_grog_condition;
	information = dia_addon_samuel_grog_info;
	permanent = TRUE;
	description = "I've come to get my ration of grog! (10 gold)";
};


func int dia_addon_samuel_grog_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_hello))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_grog_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Grog_15_00");	//I've come to get my ration of grog.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		if(SAMUEL_GROG_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_01");	//You guys don't do anything without your grog, huh? Right, here you go.
			SAMUEL_GROG_VARIANZ = 1;
		}
		else if(SAMUEL_GROG_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_02");	//I hope it's drinkable. I ran out of fresh water. But a little brackish water never killed anyone, right?
			SAMUEL_GROG_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_03");	//You can have as much grog as you like!
		};
		b_giveinvitems(self,other,itfo_addon_grog,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Grog_14_04");	//I sell it cheap, but I'm not giving it away! Get yourself some gold first, boy.
	};
};


var int samuel_rum_varianz;

instance DIA_ADDON_SAMUEL_RUM(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 6;
	condition = dia_addon_samuel_rum_condition;
	information = dia_addon_samuel_rum_info;
	permanent = TRUE;
	description = "Give me some rum (30 gold)";
};


func int dia_addon_samuel_rum_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_hello))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_rum_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Rum_15_00");	//Give me rum!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		if(SAMUEL_RUM_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_01");	//Ah! This is mother's milk to a sailor! Here!
			SAMUEL_RUM_VARIANZ = 1;
		}
		else if(SAMUEL_RUM_VARIANZ == 1)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_02");	//The rum might just taste a bit fishy. All we've got here is old herring barrels. But rum is rum. To your health!
			SAMUEL_RUM_VARIANZ = 2;
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_03");	//Here you are.
		};
		b_giveinvitems(self,other,itfo_addon_rum,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Rum_14_04");	//You haven't got enough gold, lad! What about some grog?
	};
};


var int samuel_stronger_varianz;
var int samuel_doppelhammer_varianz;

instance DIA_ADDON_SAMUEL_STRONGER(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 7;
	condition = dia_addon_samuel_stronger_condition;
	information = dia_addon_samuel_stronger_info;
	permanent = TRUE;
	description = "I want something stronger!";
};


func int dia_addon_samuel_stronger_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_hello))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_stronger_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_00");	//I want something stronger!
	if(SAMUEL_STRONGER_VARIANZ == 0)
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_01");	//Ah, a seeker! I'm always after new recipes myself.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_02");	//Decent booze should be clear and strong, and burn down your throat like liquid fire.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_03");	//You don't find that very often. But I'm talking too much. You want a drink!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_04");	//Here! My own recipe! How do you like it? I call it 'Hasty Herring'.
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
		b_useitem(other,itfo_addon_schnellerhering);
		AI_Output(other,self,"DIA_Addon_Samuel_Stronger_15_05");	//Impressive!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_06");	//(laughs) You can say that again!
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_07");	//You wouldn't happen to know a good recipe for booze yourself? If you do, you must tell me.
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_08");	//Want another?
		SAMUEL_STRONGER_VARIANZ = 1;
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_14_09");	//Name your poison.
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Double Hammer (60 gold)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Hammer (30 gold)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Hasty Herring (30 gold)",dia_addon_samuel_stronger_schnellerhering);
};

func void b_addon_samuel_nogold()
{
	AI_Output(self,other,"DIA_Addon_Samuel_NoGold_14_00");	//No gold, no drink!
};

func void dia_addon_samuel_stronger_back()
{
	Info_ClearChoices(dia_addon_samuel_stronger);
};

func void dia_addon_samuel_stronger_schnellerhering()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_SchnellerHering_15_00");	//Give me some of your Hasty Herring.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIa_Addon_Samuel_Stronger_SchnellerHering_14_01");	//Rather vile muck, but effective!
		b_giveinvitems(self,other,itfo_addon_schnellerhering,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Double Hammer (60 gold)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Hammer (30 gold)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Hasty Herring (30 gold)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_loushammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousHammer_15_00");	//I want Lou's Hammer!
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousHammer_14_01");	//Great stuff! Put it down the hatch!
		b_giveinvitems(self,other,itfo_addon_loushammer,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Double Hammer (60 gold)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Hammer (30 gold)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Hasty Herring (30 gold)",dia_addon_samuel_stronger_schnellerhering);
};

func void dia_addon_samuel_stronger_lousdoublehammer()
{
	AI_Output(other,self,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_15_00");	//(casually) Give me a double. A double Hammer.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_SCHLAFHAMMER))
	{
		if(SAMUEL_DOPPELHAMMER_VARIANZ == 0)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_Stronger_LousDoubleHammer_14_01");	//Don't do anything you might regret, kid. I hope you don't want this for yourself.
		}
		else
		{
			AI_Output(self,other,"DIa_Addon_Samuel_Stronger_LousDoubleHammer_14_02");	//(wildly) Yes! Nothing like it to restore your spirits!
		};
		b_giveinvitems(self,other,itfo_addon_schlafhammer,1);
	}
	else
	{
		b_addon_samuel_nogold();
	};
	Info_ClearChoices(dia_addon_samuel_stronger);
	Info_AddChoice(dia_addon_samuel_stronger,DIALOG_BACK,dia_addon_samuel_stronger_back);
	if(SAMUEL_KNOWS_SCHLAFHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Double Hammer (60 gold)",dia_addon_samuel_stronger_lousdoublehammer);
	};
	if(SAMUEL_KNOWS_LOUSHAMMER == TRUE)
	{
		Info_AddChoice(dia_addon_samuel_stronger,"Lou's Hammer (30 gold)",dia_addon_samuel_stronger_loushammer);
	};
	Info_AddChoice(dia_addon_samuel_stronger,"Hasty Herring (30 gold)",dia_addon_samuel_stronger_schnellerhering);
};


instance DIA_ADDON_SAMUEL_TRADE(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 8;
	condition = dia_addon_samuel_trade_condition;
	information = dia_addon_samuel_trade_info;
	permanent = TRUE;
	description = "What else have you got?";
	trade = TRUE;
};


func int dia_addon_samuel_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_samuel_hello))
	{
		return TRUE;
	};
};

func void dia_addon_samuel_trade_info()
{
	if(SAMUEL_FLAG == 1)
	{
		b_clearalchemyinv(self);
		if(SAMUEL_FLASKS > 0)
		{
			CreateInvItems(self,itmi_flask,SAMUEL_FLASKS);
		};
		SAMUEL_FLAG = 0;
	};
	AI_Output(other,self,"DIA_Addon_Samuel_Trade_15_00");	//What else have you got?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itfo_addon_grog,Npc_HasItems(self,itfo_addon_grog));
	CreateInvItems(self,itfo_addon_grog,15);
	AI_Output(self,other,"DIA_Addon_Samuel_Trade_14_01");	//I can get you anything a pirate needs in order to survive.
};


instance DIA_ADDON_SAMUEL_NEWS(C_INFO)
{
	npc = pir_1351_addon_samuel;
	nr = 99;
	condition = dia_addon_samuel_news_condition;
	information = dia_addon_samuel_news_info;
	permanent = TRUE;
	description = "What's new in the camp?";
};


func int dia_addon_samuel_news_condition()
{
	return TRUE;
};


var int news_francis_gotsome;

func void dia_addon_samuel_news_info()
{
	AI_Output(other,self,"DIA_Addon_Samuel_News_15_00");	//What's new in the camp?
	if(Npc_IsDead(francis) || (FRANCIS_AUSGESCHISSEN == TRUE))
	{
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_01");	//Francis got what was coming to him! I can't begin to tell you how that pleases me.
		if(NEWS_FRANCIS_GOTSOME == FALSE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_02");	//You're all right. Come on, let's have a drink - it's on me!
			b_giveinvitems(self,other,itfo_addon_rum,1);
			b_useitem(other,itfo_addon_rum);
			NEWS_FRANCIS_GOTSOME = TRUE;
		};
		if(GREGISBACK == TRUE)
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_03");	//And Greg is finally back. He lost the ship, but at least he'll restore order to the camp.
		};
	}
	else
	{
		if(!Npc_IsDead(morgan))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_04");	//Nothing much has been happening here since Greg left. Morgan and most of his boys are just hanging around and boozing all day.
		};
		if(!Npc_IsDead(henry))
		{
			AI_Output(self,other,"DIA_Addon_Samuel_News_14_05");	//The only one who does anything at all is Henry. He and his boys are building the palisade.
		};
		AI_Output(self,other,"DIA_Addon_Samuel_News_14_06");	//It's high time for Cap'n Greg to come back and give that Francis a good swift kick in the ass!
	};
};

