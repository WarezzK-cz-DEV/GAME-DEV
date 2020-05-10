
instance ITSE_ERZFISCH(C_ITEM)
{
	name = "Ball-shaped fish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_erzfisch;
	description = name;
	text[2] = "Something is hidden inside this fish.";
};


func void use_erzfisch()
{
	b_playerfinditem(itmi_nugget,1);
};


instance ITSE_GOLDFISCH(C_ITEM)
{
	name = "Heavy fish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_goldfisch;
	description = name;
	text[2] = "Something is hidden inside this fish.";
};


func void use_goldfisch()
{
	b_playerfinditem(itmi_gold,50);
};


instance ITSE_RINGFISCH(C_ITEM)
{
	name = "Small fish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_ringfisch;
	description = name;
	text[2] = "Something is hidden inside this fish.";
};


func void use_ringfisch()
{
	b_playerfinditem(itri_prot_fire_01,1);
};


instance ITSE_LOCKPICKFISCH(C_ITEM)
{
	name = "Light fish";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_lockpickfisch;
	description = name;
	text[2] = "Something is hidden inside this fish.";
};


func void use_lockpickfisch()
{
	b_playerfinditem(itke_lockpick,3);
};


instance ITSE_GOLDPOCKET25(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket25;
	description = name;
	text[2] = "There are a few coins jingling inside.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket25()
{
	b_playerfinditem(itmi_gold,25);
	b_giveplayerxp(25);
};


instance ITSE_GOLDPOCKET50(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket50;
	description = name;
	text[2] = "The bag is full of coins.";
	count[5] = value;
};


func void goldpocket50()
{
	b_playerfinditem(itmi_gold,50);
	b_giveplayerxp(50);
};


instance ITSE_GOLDPOCKET100(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = goldpocket100;
	description = name;
	text[2] = "A heavy bag,";
	text[3] = "full of gold coins.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void goldpocket100()
{
	b_playerfinditem(itmi_gold,100);
	b_giveplayerxp(100);
};


instance ITSE_HANNASBEUTEL(C_ITEM)
{
	name = "Leather satchel";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 100;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = hannasbeutel;
	description = name;
	text[2] = "Hanna gave it to me.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void hannasbeutel()
{
	CreateInvItems(hero,itke_lockpick,10);
	CreateInvItems(hero,itke_thieftreasure,1);
	Print(print_hannasbeutel);
};


instance ITSE_MBOLTPOCKET25(C_ITEM)
{
	name = "Rotten bag";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 500;
	visual = "ItMi_BoltPocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = mboltpocket25;
	description = name;
	text[2] = "A few crossbow bolts inside.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 150;
	inv_rotz = 25;
	inv_rotx = 35;
};


func void mboltpocket25()
{
	b_playerfinditem(itrw_addon_magicbolt,25);
};

