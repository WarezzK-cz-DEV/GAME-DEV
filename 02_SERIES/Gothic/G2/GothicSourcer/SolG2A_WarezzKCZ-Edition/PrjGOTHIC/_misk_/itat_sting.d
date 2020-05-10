
const int VALUE_STING = 25;

instance ITAT_STING(C_ITEM)
{
	name = "Stinger";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STING;
	scemename = "FOOD";
	on_state[0] = use_sting;
	visual = "ItAt_Sting.3DS";
	material = MAT_LEATHER;
	description = name;
	text[1] = "Contains a poisonous secretion.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_sting()
{
	if(KNOWS_BLOODFLY == TRUE)
	{
		if(BLOODFLY_BONUS <= 10)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,self.attribute[ATR_HITPOINTS_MAX]);
			Print(PRINT_FULLYHEALED);
			BLOODFLY_BONUS = BLOODFLY_BONUS + 1;
		}
		else
		{
			Print(PRINT_MANDIBLES);
		};
	}
	else
	{
		Print(PRINT_BLOODFLY);
		if(self.attribute[ATR_HITPOINTS] > 1)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 10;
		};
	};
};

