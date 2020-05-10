
const int VALUE_UNDEADDRAGONSOULSTONE = 400;

instance ITAT_UNDEADDRAGONSOULSTONE(C_ITEM)
{
	name = "Undead dragon's soul stone";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_UNDEADDRAGONSOULSTONE;
	visual = "ItAt_UndeadDragonSoulStone.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

