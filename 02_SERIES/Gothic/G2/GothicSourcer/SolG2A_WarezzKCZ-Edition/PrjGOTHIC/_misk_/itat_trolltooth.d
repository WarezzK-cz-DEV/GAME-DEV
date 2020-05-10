
const int VALUE_TROLLTOOTH = 300;

instance ITAT_TROLLTOOTH(C_ITEM)
{
	name = "Troll tusk";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_TROLLTOOTH;
	visual = "ItAt_TrollTooth.3DS";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

