
const int VALUE_CRAWLERMANDIBLES = 15;

instance ITAT_CRAWLERMANDIBLES(C_ITEM)
{
	name = "Minecrawler mandibles";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_CRAWLERMANDIBLES;
	visual = "ItAt_CrawlerMandibles.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_mandibles;
	description = name;
	text[0] = "The mandibles can be opened";
	text[1] = "in order to drink the secretion inside them.";
	text[2] = "This regenerates magic power.";
	text[3] = "The effect fades in time.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mandibles()
{
	if(MANDIBLES_BONUS <= 9)
	{
		Npc_ChangeAttribute(self,ATR_MANA,self.attribute[ATR_MANA_MAX]);
		MANDIBLES_BONUS = MANDIBLES_BONUS + 1;
	}
	else
	{
		PrintScreen(PRINT_MANDIBLES,-1,YPOS_LEVELUP,FONT_SCREENSMALL,2);
	};
};

