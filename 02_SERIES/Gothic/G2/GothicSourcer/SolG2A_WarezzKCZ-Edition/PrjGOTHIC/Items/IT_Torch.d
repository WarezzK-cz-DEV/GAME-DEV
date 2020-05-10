
const int VALUE_FACKEL = 2;

instance ITLSTORCH(C_ITEM)
{
	name = "Torch";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_TORCH | ITEM_MULTI;
	value = VALUE_FACKEL;
	visual = "ItLs_Torch_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_KEY_STANDARD;
	inv_rotz = INVCAM_Z_KEY_STANDARD;
	inv_rotx = INVCAM_X_KEY_STANDARD;
};

instance ITLSTORCHBURNING(C_ITEM)
{
	name = "Burning Torch";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_TORCH;
	value = 0;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	description = name;
	text[3] = "Ordinary Torch.";
};

instance ITLSTORCHBURNED(C_ITEM)
{
	name = "Torch";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_TORCH | ITEM_MULTI;
	value = 0;
	visual = "ItLs_Torchburned_01.3ds";
	material = MAT_WOOD;
	description = name;
	text[3] = "Burned Torch.";
};

instance ITLSTORCHFIRESPIT(C_ITEM)
{
	name = "Torch";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_TORCH;
	value = 1;
	visual = "ITLSTORCHBURNING.ZEN";
	material = MAT_WOOD;
	scemename = "FIRESPIT";
	description = name;
	text[4] = NAME_VALUE;
	count[4] = value;
};

