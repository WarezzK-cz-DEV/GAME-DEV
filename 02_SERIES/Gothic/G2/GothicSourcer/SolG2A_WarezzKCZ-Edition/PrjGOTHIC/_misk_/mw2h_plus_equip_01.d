
var int hero_itmw_2hfs;

func void mw2h_plus_equip_01()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 99) && (self.hitchance[NPC_TALENT_2H] > 0) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 1;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_01()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_02()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 99) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 1;
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 98) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 2;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_02()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_03()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 98) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 97) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 3;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_03()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_04()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 97) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 96) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 4;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_04()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_05()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 96) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 95) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 5;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_05()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_06()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 95) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 94) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 6;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_06()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_07()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 94) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 93) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 7;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_07()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_08()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 93) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 92) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 8;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_08()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_09()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 92) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 91) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 9;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_09()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_10()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 91) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 90) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 10;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_10()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_plus_equip_15()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_2H] >= 100) || (self.hitchance[NPC_TALENT_2H] <= 0))
		{
			HERO_ITMW_2HFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_2H] >= 86) && (self.hitchance[NPC_TALENT_2H] < 100))
		{
			HERO_ITMW_2HFS = 100 - self.hitchance[NPC_TALENT_2H];
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 85) && (self.hitchance[NPC_TALENT_2H] > 0))
		{
			HERO_ITMW_2HFS = 15;
		};
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_plus_unequip_15()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_minus_equip_05()
{
	if(Npc_IsPlayer(self))
	{
		if(self.hitchance[NPC_TALENT_2H] >= 20)
		{
			HERO_ITMW_2HFS = 5;
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 19) && (self.hitchance[NPC_TALENT_2H] > 15))
		{
			HERO_ITMW_2HFS = self.hitchance[NPC_TALENT_2H] - 15;
		}
		else if(self.hitchance[NPC_TALENT_2H] <= 15)
		{
			HERO_ITMW_2HFS = 0;
		};
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_minus_unequip_05()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_minus_equip_07()
{
	if(Npc_IsPlayer(self))
	{
		if(self.hitchance[NPC_TALENT_2H] >= 22)
		{
			HERO_ITMW_2HFS = 7;
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 21) && (self.hitchance[NPC_TALENT_2H] > 15))
		{
			HERO_ITMW_2HFS = self.hitchance[NPC_TALENT_2H] - 15;
		}
		else if(self.hitchance[NPC_TALENT_2H] <= 15)
		{
			HERO_ITMW_2HFS = 0;
		};
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_minus_unequip_07()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_minus_equip_09()
{
	if(Npc_IsPlayer(self))
	{
		if(self.hitchance[NPC_TALENT_2H] >= 24)
		{
			HERO_ITMW_2HFS = 9;
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 23) && (self.hitchance[NPC_TALENT_2H] > 15))
		{
			HERO_ITMW_2HFS = self.hitchance[NPC_TALENT_2H] - 15;
		}
		else if(self.hitchance[NPC_TALENT_2H] <= 15)
		{
			HERO_ITMW_2HFS = 0;
		};
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_minus_unequip_09()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

func void mw2h_minus_equip_10()
{
	if(Npc_IsPlayer(self))
	{
		if(self.hitchance[NPC_TALENT_2H] >= 25)
		{
			HERO_ITMW_2HFS = 10;
		}
		else if((self.hitchance[NPC_TALENT_2H] <= 24) && (self.hitchance[NPC_TALENT_2H] > 15))
		{
			HERO_ITMW_2HFS = self.hitchance[NPC_TALENT_2H] - 15;
		}
		else if(self.hitchance[NPC_TALENT_2H] <= 15)
		{
			HERO_ITMW_2HFS = 0;
		};
		b_addfightskill(self,NPC_TALENT_2H,-HERO_ITMW_2HFS);
		b_meleeweaponchange(0,HERO_ITMW_2HFS,0);
	};
};

func void mw2h_minus_unequip_10()
{
	if(Npc_IsPlayer(self) && (MELEEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_2H,HERO_ITMW_2HFS);
		b_meleeweaponundochange();
	};
};

