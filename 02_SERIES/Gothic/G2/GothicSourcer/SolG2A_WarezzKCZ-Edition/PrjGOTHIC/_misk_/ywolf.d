
instance YWOLF(MST_DEFAULT_WOLF)
{
	level = 5;
	name[0] = "Young Wolf";
	attribute[ATR_STRENGTH] = 25;
	attribute[ATR_DEXTERITY] = 30;
	attribute[ATR_HITPOINTS_MAX] = 90;
	attribute[ATR_HITPOINTS] = 90;
	protection[PROT_BLUNT] = 10;
	protection[PROT_EDGE] = 10;
	protection[PROT_POINT] = 0;
	protection[PROT_FIRE] = 10;
	protection[PROT_FLY] = 10;
	fight_tactic = FAI_WOLF_YOUNG;
	b_setvisuals_wolf();
	Npc_SetToFistMode(self);
};

