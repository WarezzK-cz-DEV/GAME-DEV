
instance DIA_ADDON_BENCHPIRATE_EXIT(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 999;
	condition = dia_addon_benchpirate_exit_condition;
	information = dia_addon_benchpirate_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_addon_benchpirate_exit_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_BENCHPIRATE_HELLO(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 1;
	condition = dia_addon_benchpirate_hello_condition;
	information = dia_addon_benchpirate_hello_info;
	permanent = TRUE;
	description = "How are things?";
};


func int dia_addon_benchpirate_hello_condition()
{
	return TRUE;
};

func void dia_addon_benchpirate_hello_info()
{
	var int randy;
	AI_Output(other,self,"DIA_Addon_Pir_7_Hello_15_00");	//How are things?
	randy = Hlp_Random(3);
	if(GREGISBACK == TRUE)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_01");	//Greg's back at last. And none too soon.
		}
		else if(randy == 1)
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_02");	//Francis should get some wood for the palisade. Hope that's not too much for him.
		}
		else
		{
			AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_03");	//Bring on the bandits, then. With Greg by our side, we're not afraid of them.
		};
	}
	else if(randy == 0)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_04");	//Francis, the camp leader, is nothing but a clown. How can anyone take him seriously?
	}
	else if(randy == 1)
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_05");	//Greg trusts Francis because he's too dumb to cheat! But to make him our leader for that...
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Pir_7_Hello_07_06");	//If Greg doesn't come back soon and I don't get a deck under my feet before too long, I'll be getting landsick!
	};
};


instance DIA_ADDON_BENCHPIRATE_ANHEUERN(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 11;
	condition = dia_addon_benchpirate_anheuern_condition;
	information = dia_addon_benchpirate_anheuern_info;
	permanent = FALSE;
	description = "You're supposed to help me.";
};


func int dia_addon_benchpirate_anheuern_condition()
{
	if(MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_anheuern_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_00");	//You're supposed to help me.
	AI_Output(self,other,"DIA_Addon_BenchPirate_Anheuern_07_01");	//Orders from Greg?
	AI_Output(other,self,"DIA_Addon_BenchPirate_Anheuern_15_08");	//You've got it.
};


instance DIA_ADDON_BENCHPIRATE_COMEON(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 12;
	condition = dia_addon_benchpirate_comeon_condition;
	information = dia_addon_benchpirate_comeon_info;
	permanent = TRUE;
	description = "The canyon awaits.";
};


func int dia_addon_benchpirate_comeon_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (MIS_ADDON_GREG_CLEARCANYON == LOG_RUNNING) && Npc_KnowsInfo(other,dia_addon_benchpirate_anheuern))
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_comeon_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_ComeOn_15_01");	//The canyon awaits.
	if(c_gregspiratestoofar() == TRUE)
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_02");	//That's exactly where I'm headed back to...
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_BenchPirate_ComeOn_07_01");	//Aye aye, Cap'n!
		if(c_bodystatecontains(self,BS_SIT))
		{
			AI_Standup(self);
			b_turntonpc(self,other);
		};
		AI_StopProcessInfos(self);
		b_addon_piratesfollowagain();
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[AIV_PARTYMEMBER] = TRUE;
	};
};


instance DIA_ADDON_BENCHPIRATE_GOHOME(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 13;
	condition = dia_addon_benchpirate_gohome_condition;
	information = dia_addon_benchpirate_gohome_info;
	permanent = TRUE;
	description = "I no longer need you.";
};


func int dia_addon_benchpirate_gohome_condition()
{
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_gohome_info()
{
	AI_Output(other,self,"DIA_Addon_BenchPirate_GoHome_15_00");	//I no longer need you.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_01");	//I'm back in camp, Cap'n!
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_ADDON_BENCHPIRATE_TOOFAR(C_INFO)
{
	npc = pir_1363_addon_pirat;
	nr = 14;
	condition = dia_addon_benchpirate_toofar_condition;
	information = dia_addon_benchpirate_toofar_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_addon_benchpirate_toofar_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (c_gregspiratestoofar() == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_benchpirate_toofar_info()
{
	AI_Output(self,other,"DIA_Addon_BenchPirate_TooFar_07_01");	//We're too far away from the camp.
	AI_Output(self,other,"DIA_Addon_BenchPirate_GoHome_07_02");	//I don't like this at all.
	if(c_howmanypiratesinparty() >= 2)
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_02");	//I'm headed back to the camp!
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Matt_TooFar_07_03");	//The boys and I are headed back for camp!
	};
	b_addon_piratesgohome();
	AI_StopProcessInfos(self);
};

