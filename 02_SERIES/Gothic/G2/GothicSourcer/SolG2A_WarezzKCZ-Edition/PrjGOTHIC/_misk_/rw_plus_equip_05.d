
var int hero_itrw_bfs;

func void rw_plus_equip_05()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_BOW] >= 100) || (self.hitchance[NPC_TALENT_BOW] <= 0))
		{
			HERO_ITRW_BFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_BOW] >= 96) && (self.hitchance[NPC_TALENT_BOW] < 100))
		{
			HERO_ITRW_BFS = 100 - self.hitchance[NPC_TALENT_BOW];
		}
		else if((self.hitchance[NPC_TALENT_BOW] <= 95) && (self.hitchance[NPC_TALENT_BOW] > 0))
		{
			HERO_ITRW_BFS = 5;
		};
		b_addfightskill(self,NPC_TALENT_BOW,HERO_ITRW_BFS);
		b_rangedweaponchange(HERO_ITRW_BFS,0);
	};
};

func void rw_plus_unequip_05()
{
	if(Npc_IsPlayer(self) && (RANGEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE_RANGED == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_BOW,-HERO_ITRW_BFS);
		b_rangedweaponundochange();
	};
};

func void rw_plus_equip_07()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_BOW] >= 100) || (self.hitchance[NPC_TALENT_BOW] <= 0))
		{
			HERO_ITRW_BFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_BOW] >= 94) && (self.hitchance[NPC_TALENT_BOW] < 100))
		{
			HERO_ITRW_BFS = 100 - self.hitchance[NPC_TALENT_BOW];
		}
		else if((self.hitchance[NPC_TALENT_BOW] <= 93) && (self.hitchance[NPC_TALENT_BOW] > 0))
		{
			HERO_ITRW_BFS = 7;
		};
		b_addfightskill(self,NPC_TALENT_BOW,HERO_ITRW_BFS);
		b_rangedweaponchange(HERO_ITRW_BFS,0);
	};
};

func void rw_plus_unequip_07()
{
	if(Npc_IsPlayer(self) && (RANGEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE_RANGED == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_BOW,-HERO_ITRW_BFS);
		b_rangedweaponundochange();
	};
};

func void rw_plus_equip_10()
{
	if(Npc_IsPlayer(self))
	{
		if((self.hitchance[NPC_TALENT_BOW] >= 100) || (self.hitchance[NPC_TALENT_BOW] <= 0))
		{
			HERO_ITRW_BFS = 0;
		}
		else if((self.hitchance[NPC_TALENT_BOW] >= 91) && (self.hitchance[NPC_TALENT_BOW] < 100))
		{
			HERO_ITRW_BFS = 100 - self.hitchance[NPC_TALENT_BOW];
		}
		else if((self.hitchance[NPC_TALENT_BOW] <= 90) && (self.hitchance[NPC_TALENT_BOW] > 0))
		{
			HERO_ITRW_BFS = 10;
		};
		b_addfightskill(self,NPC_TALENT_BOW,HERO_ITRW_BFS);
		b_rangedweaponchange(HERO_ITRW_BFS,0);
	};
};

func void rw_plus_unequip_10()
{
	if(Npc_IsPlayer(self) && (RANGEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE_RANGED == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_BOW,-HERO_ITRW_BFS);
		b_rangedweaponundochange();
	};
};

func void rw_minus_equip_05()
{
	if(Npc_IsPlayer(self))
	{
		if(self.hitchance[NPC_TALENT_BOW] >= 20)
		{
			HERO_ITRW_BFS = 5;
		}
		else if((self.hitchance[NPC_TALENT_BOW] <= 19) && (self.hitchance[NPC_TALENT_BOW] > 15))
		{
			HERO_ITRW_BFS = self.hitchance[NPC_TALENT_BOW] - 15;
		}
		else if(self.hitchance[NPC_TALENT_BOW] <= 15)
		{
			HERO_ITRW_BFS = 0;
		};
		b_addfightskill(self,NPC_TALENT_BOW,-HERO_ITRW_BFS);
		b_rangedweaponchange(-HERO_ITRW_BFS,0);
	};
};

func void rw_minus_unequip_05()
{
	if(Npc_IsPlayer(self) && (RANGEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE_RANGED == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_BOW,HERO_ITRW_BFS);
		b_rangedweaponundochange();
	};
};

func void rw_minus_equip_10()
{
	if(Npc_IsPlayer(self))
	{
		if(self.hitchance[NPC_TALENT_BOW] >= 25)
		{
			HERO_ITRW_BFS = 10;
		}
		else if((self.hitchance[NPC_TALENT_BOW] <= 24) && (self.hitchance[NPC_TALENT_BOW] > 15))
		{
			HERO_ITRW_BFS = self.hitchance[NPC_TALENT_BOW] - 15;
		}
		else if(self.hitchance[NPC_TALENT_BOW] <= 15)
		{
			HERO_ITRW_BFS = 0;
		};
		b_addfightskill(self,NPC_TALENT_BOW,-HERO_ITRW_BFS);
		b_rangedweaponchange(-HERO_ITRW_BFS,0);
	};
};

func void rw_minus_unequip_10()
{
	if(Npc_IsPlayer(self) && (RANGEWEAPONCHANGEDHERO || (SCRIPTPATCHWEAPONCHANGE_RANGED == FALSE)))
	{
		b_addfightskill(self,NPC_TALENT_BOW,HERO_ITRW_BFS);
		b_rangedweaponundochange();
	};
};

