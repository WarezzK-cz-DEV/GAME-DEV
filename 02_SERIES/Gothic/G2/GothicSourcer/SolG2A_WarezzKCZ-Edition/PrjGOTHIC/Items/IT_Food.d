
const int VALUE_APPLE = 8;
const int HP_APPLE = 5;
const int VALUE_CHEESE = 23;
const int HP_CHEESE = 10;
const int VALUE_BACON = 50;
const int HP_BACON = 20;
const int VALUE_BREAD = 20;
const int HP_BREAD = 15;
const int VALUE_FISH = 21;
const int HP_FISH = 15;
const int VALUE_RAWMEAT = 23;
const int HP_RAWMEAT = 10;
const int VALUE_MEAT = 30;
const int HP_MEAT = 30;
const int VALUE_STEW = 40;
const int HP_STEW = 60;
const int VALUE_FISHSOUP = 35;
const int HP_FISHSOUP = 50;
const int VALUE_SAUSAGE = 30;
const int HP_SAUSAGE = 20;
const int VALUE_HONEY = 50;
const int HP_HONEY = 30;
const int VALUE_WATER = 10;
const int HP_WATER = 5;
const int VALUE_BEER = 20;
const int HP_BEER = 2;
const int MANA_BEER = 1;
const int VALUE_BOOZE = 15;
const int HP_BOOZE = 5;
const int MANA_BOOZE = 2;
const int VALUE_WINE = 30;
const int HP_WINE = 3;
const int MANA_WINE = 3;
const int VALUE_MILK = 15;
const int HP_MILK = 5;
const int MANA_MILK = 1;

instance ITFO_APPLE(C_ITEM)
{
	name = "Apple";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_APPLE;
	visual = "ItFo_Apple.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_apple;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_APPLE;
	text[3] = "A fresh apple,";
	text[4] = "firm and juicy.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_APPLE;
};


func void use_apple()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_APPLE);
	if(Npc_IsPlayer(self))
	{
		APPLE_BONUS = APPLE_BONUS + 1;
		if(APPLE_BONUS == 7)
		{
			Print(PRINT_EAT1);
		};
		if(APPLE_BONUS == 15)
		{
			Print(PRINT_EAT2);
		};
		if(APPLE_BONUS == 25)
		{
			Print(PRINT_EAT3);
			b_raiseattribute(self,ATR_STRENGTH,1);
			Snd_Play("LevelUp");
			APPLE_BONUS = 0;
		};
	};
};


instance ITFO_CHEESE(C_ITEM)
{
	name = "Cheese";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_CHEESE;
	visual = "ItFo_Cheese.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_cheese;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_CHEESE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_CHEESE;
};


func void use_cheese()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_CHEESE);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_BACON(C_ITEM)
{
	name = "Ham";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BACON;
	visual = "ItFo_Bacon.3ds";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_bacon;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_BACON;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BACON;
};


func void use_bacon()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BACON);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_BREAD(C_ITEM)
{
	name = "Bread";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BREAD;
	visual = "ItFo_Bread.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_bread;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_BREAD;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BREAD;
};


func void use_bread()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BREAD);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_FISH(C_ITEM)
{
	name = "Fish";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FISH;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_fish;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_FISH;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISH;
};


func void use_fish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FISH);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFOMUTTONRAW(C_ITEM)
{
	name = "Raw meat";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_RAWMEAT;
	visual = "ItFoMuttonRaw.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	on_state[0] = use_rawmeat;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_RAWMEAT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_RAWMEAT;
};


func void use_rawmeat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_RAWMEAT);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFOMUTTON(C_ITEM)
{
	name = "Fried meat";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MEAT;
	visual = "ItFoMutton.3DS";
	material = MAT_LEATHER;
	scemename = "MEAT";
	on_state[0] = use_meat;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_MEAT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MEAT;
};


func void use_meat()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MEAT);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_STEW(C_ITEM)
{
	name = "Stew";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STEW;
	visual = "ItFo_Stew.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_stew;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_STEW;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEW;
};


func void use_stew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_STEW);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_XPSTEW(C_ITEM)
{
	name = "Thekla's stew";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STEW;
	visual = "ItFo_Stew_V2.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_xpstew;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_STEW;
	text[2] = NAME_BONUS_STR;
	count[2] = 1;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STEW;
};


func void use_xpstew()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_STEW);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	Snd_Play("LevelUp");
	b_raiseattribute(self,ATR_STRENGTH,1);
};


instance ITFO_CORAGONSBEER(C_ITEM)
{
	name = "Special beer";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEER;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemename = "POTIONFAST";
	on_state[0] = use_coragonsbeerbeer;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BEER;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_BEER;
	text[4] = "Coragon's special beer.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_BEER;
};


func void use_coragonsbeerbeer()
{
	var string concattext;
	b_raiseattribute(self,ATR_MANA_MAX,MANA_BEER);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BEER);
	Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,HP_BEER);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BEER);
	concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(HP_BEER));
	PrintScreen(concattext,55,-1,FONT_SCREEN,2);
};


instance ITFO_FISHSOUP(C_ITEM)
{
	name = "Fish soup";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FISHSOUP;
	visual = "ItFo_FishSoup.3ds";
	material = MAT_WOOD;
	scemename = "RICE";
	on_state[0] = use_fishsoup;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_FISHSOUP;
	text[5] = NAME_VALUE;
	count[5] = VALUE_FISHSOUP;
};


func void use_fishsoup()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FISHSOUP);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_SAUSAGE(C_ITEM)
{
	name = "Sausage";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SAUSAGE;
	visual = "ItFo_Sausage.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_sausage;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_SAUSAGE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_SAUSAGE;
};


func void use_sausage()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SAUSAGE);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_HONEY(C_ITEM)
{
	name = "Honey";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HONEY;
	visual = "ItFo_Honey.3DS";
	material = MAT_STONE;
	scemename = "FOODHUGE";
	on_state[0] = use_honey;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_HONEY;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HONEY;
};


func void use_honey()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HONEY);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_WATER(C_ITEM)
{
	name = "Water";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WATER;
	visual = "ItFo_Water.3ds";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_water;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_WATER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WATER;
};


func void use_water()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WATER);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
};


instance ITFO_BEER(C_ITEM)
{
	name = "Beer";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEER;
	visual = "ItFo_Beer.3DS";
	material = MAT_GLAS;
	scemename = "POTIONFAST";
	on_state[0] = use_beer;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_BEER;
	text[2] = NAME_BONUS_MANANP;
	count[2] = MANA_BEER;
	text[4] = "Dark paladin.";
	text[5] = NAME_VALUE;
	count[5] = VALUE_BEER;
};


func void use_beer()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BEER);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BEER);
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITFO_BOOZE(C_ITEM)
{
	name = "Gin";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BOOZE;
	visual = "ItFo_Booze.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_booze;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_BOOZE;
	text[2] = NAME_BONUS_MANANP;
	count[2] = MANA_BOOZE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_BOOZE;
};


func void use_booze()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BOOZE);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BOOZE);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITFO_WINE(C_ITEM)
{
	name = "Wine";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WINE;
	visual = "ItFo_Wine.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_wine;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_WINE;
	text[2] = NAME_BONUS_MANANP;
	count[2] = MANA_WINE;
	text[5] = NAME_VALUE;
	count[5] = VALUE_WINE;
};


func void use_wine()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_WINE);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_WINE);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};


instance ITFO_MILK(C_ITEM)
{
	name = "Milk";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MILK;
	visual = "ItFo_Milk.3DS";
	material = MAT_GLAS;
	scemename = "POTION";
	on_state[0] = use_milk;
	description = name;
	text[1] = NAME_BONUS_HPNP;
	count[1] = HP_MILK;
	text[2] = NAME_BONUS_MANANP;
	count[2] = MANA_MILK;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MILK;
};


func void use_milk()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MILK);
	Npc_ChangeAttribute(self,ATR_MANA,MANA_MILK);
	if(self.attribute[ATR_HITPOINTS] > self.attribute[ATR_HITPOINTS_MAX])
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(self.attribute[ATR_MANA] > self.attribute[ATR_MANA_MAX])
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
	};
};

