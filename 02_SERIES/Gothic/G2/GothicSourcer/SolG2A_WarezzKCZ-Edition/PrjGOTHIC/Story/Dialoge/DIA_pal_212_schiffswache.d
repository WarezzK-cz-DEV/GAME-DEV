
instance DIA_PAL_212_SCHIFFSWACHE_EXIT(C_INFO)
{
	npc = pal_212_schiffswache;
	nr = 999;
	condition = dia_pal_212_schiffswache_exit_condition;
	information = dia_pal_212_schiffswache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_212_schiffswache_exit_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_212_SCHIFFSWACHE_WERSEIDIHR(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_werseidihr_condition;
	information = dia_pal_212_schiffswache_werseidihr_info;
	description = "Who are you?";
};


func int dia_pal_212_schiffswache_werseidihr_condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pal_212_schiffswache_werseidihr_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Who are you?
	AI_Output(self,other,"DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01");	//We are the emissaries of King Rhobar, the servants of Innos, also called paladins in the common tongue.
};


instance DIA_PAL_212_SCHIFFSWACHE_WASMACHSTDU2(C_INFO)
{
	npc = pal_212_schiffswache;
	condition = dia_pal_212_schiffswache_wasmachstdu2_condition;
	information = dia_pal_212_schiffswache_wasmachstdu2_info;
	description = "What are you doing here?";
};


func int dia_pal_212_schiffswache_wasmachstdu2_condition()
{
	return TRUE;
};

func void dia_pal_212_schiffswache_wasmachstdu2_info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00");	//What are you doing here?
	if(MIS_SHIPISFREE == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01");	//You are not coming onto the ship. That is all you need to know.
		}
		else
		{
			AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02");	//We have been assigned here as guards. No trespasser may enter the ship. Not you either, sorry.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03");	//Frittering away my time. I would much rather be with our brothers in the Valley of Mines.
	};
	AI_StopProcessInfos(self);
};

