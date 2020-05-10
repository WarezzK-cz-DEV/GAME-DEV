
const int SPL_COST_TRFSHEEP = 5;
const int SPL_COST_TRFSCAVENGER = 5;
const int SPL_COST_TRFGIANTRAT = 5;
const int SPL_COST_TRFGIANTBUG = 5;
const int SPL_COST_TRFWOLF = 5;
const int SPL_COST_TRFWARAN = 5;
const int SPL_COST_TRFSNAPPER = 5;
const int SPL_COST_TRFWARG = 5;
const int SPL_COST_TRFFIREWARAN = 5;
const int SPL_COST_TRFLURKER = 5;
const int SPL_COST_TRFSHADOWBEAST = 5;
const int SPL_COST_TRFDRAGONSNAPPER = 5;

instance SPELL_TRANSFORM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	canturnduringinvest = 0;
};


func int spell_logic_trfsheep(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSHEEP))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSHEEP;
		Npc_SetActiveSpellInfo(self,sheeptransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfscavenger(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSCAVENGER))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSCAVENGER;
		Npc_SetActiveSpellInfo(self,scavengertransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfgiantrat(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFGIANTRAT))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFGIANTRAT;
		Npc_SetActiveSpellInfo(self,giant_rattransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfgiantbug(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFGIANTBUG))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFGIANTBUG;
		Npc_SetActiveSpellInfo(self,giant_bugtransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfwolf(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFWOLF))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFWOLF;
		Npc_SetActiveSpellInfo(self,wolftransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfwaran(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFWARAN))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFWARAN;
		Npc_SetActiveSpellInfo(self,warantransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfsnapper(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSNAPPER))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSNAPPER;
		Npc_SetActiveSpellInfo(self,snappertransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfwarg(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFWARG))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFWARG;
		Npc_SetActiveSpellInfo(self,wargtransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trffirewaran(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFFIREWARAN))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFFIREWARAN;
		Npc_SetActiveSpellInfo(self,firewarantransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trflurker(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFLURKER))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFLURKER;
		Npc_SetActiveSpellInfo(self,lurkertransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfshadowbeast(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFSHADOWBEAST))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFSHADOWBEAST;
		Npc_SetActiveSpellInfo(self,shadowbeasttransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func int spell_logic_trfdragonsnapper(var int manainvested)
{
	if((Npc_GetActiveSpellIsScroll(self) && (self.attribute[ATR_MANA] >= SPL_COST_SCROLL)) || (self.attribute[ATR_MANA] >= SPL_COST_TRFDRAGONSNAPPER))
	{
		if(Npc_IsPlayer(self))
		{
			Wld_StopEffect("SLOW_MOTION");
		};
		b_startmagictransform();
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_TRFDRAGONSNAPPER;
		Npc_SetActiveSpellInfo(self,dragonsnappertransform);
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

