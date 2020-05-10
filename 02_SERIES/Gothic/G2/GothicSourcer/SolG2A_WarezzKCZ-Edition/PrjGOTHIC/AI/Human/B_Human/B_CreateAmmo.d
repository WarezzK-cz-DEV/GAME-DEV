
var int randammo;

func void b_createammo(var C_NPC slf)
{
	var C_ITEM rangedweapon;
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		rangedweapon = Npc_GetReadiedWeapon(slf);
	}
	else if(Npc_HasEquippedRangedWeapon(slf))
	{
		rangedweapon = Npc_GetEquippedRangedWeapon(slf);
	}
	else
	{
		return;
	};
	if(rangedweapon.munition == itrw_arrow)
	{
		RANDAMMO = Hlp_Random(20);
		if(Npc_HasItems(slf,itrw_arrow) < 5)
		{
			CreateInvItems(slf,itrw_arrow,RANDAMMO);
		};
		if(Npc_HasItems(slf,itrw_arrow) > 20)
		{
			Npc_RemoveInvItems(slf,itrw_arrow,Npc_HasItems(slf,itrw_arrow));
		};
	}
	else if(rangedweapon.munition == itrw_bolt)
	{
		RANDAMMO = Hlp_Random(15);
		if(Npc_HasItems(slf,itrw_bolt) < 5)
		{
			CreateInvItems(slf,itrw_bolt,RANDAMMO);
		};
		if(Npc_HasItems(slf,itrw_bolt) > 20)
		{
			Npc_RemoveInvItems(slf,itrw_bolt,Npc_HasItems(slf,itrw_bolt));
		};
	};
};

