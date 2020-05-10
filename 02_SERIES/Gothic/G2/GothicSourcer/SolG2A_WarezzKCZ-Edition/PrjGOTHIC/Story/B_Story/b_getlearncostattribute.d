
func int b_getlearncostattribute(var C_NPC oth,var int attribut,var int amount)
{
	var int kosten;
	kosten = 0;
	if(attribut == ATR_STRENGTH)
	{
		if(oth.aivar[REAL_STRENGTH] >= 120)
		{
			kosten = 5 * amount;
		}
		else if(oth.aivar[REAL_STRENGTH] >= 90)
		{
			kosten = actual_cost(oth.aivar[REAL_STRENGTH],120,amount,4);
		}
		else if(oth.aivar[REAL_STRENGTH] >= 60)
		{
			kosten = actual_cost(oth.aivar[REAL_STRENGTH],90,amount,3);
		}
		else if(oth.aivar[REAL_STRENGTH] >= 30)
		{
			kosten = actual_cost(oth.aivar[REAL_STRENGTH],60,amount,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_STRENGTH],30,amount,1);
		};
	};
	if(attribut == ATR_DEXTERITY)
	{
		if(oth.aivar[REAL_DEXTERITY] >= 120)
		{
			kosten = 5 * amount;
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 90)
		{
			kosten = actual_cost(oth.aivar[REAL_DEXTERITY],120,amount,4);
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 60)
		{
			kosten = actual_cost(oth.aivar[REAL_DEXTERITY],90,amount,3);
		}
		else if(oth.aivar[REAL_DEXTERITY] >= 30)
		{
			kosten = actual_cost(oth.aivar[REAL_DEXTERITY],60,amount,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_DEXTERITY],30,amount,1);
		};
	};
	if(attribut == ATR_MANA_MAX)
	{
		if(oth.aivar[REAL_MANA_MAX] >= 150)
		{
			kosten = 5 * amount;
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 100)
		{
			kosten = actual_cost(oth.aivar[REAL_MANA_MAX],150,amount,4);
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 75)
		{
			kosten = actual_cost(oth.aivar[REAL_MANA_MAX],100,amount,3);
		}
		else if(oth.aivar[REAL_MANA_MAX] >= 50)
		{
			kosten = actual_cost(oth.aivar[REAL_MANA_MAX],75,amount,2);
		}
		else
		{
			kosten = actual_cost(oth.aivar[REAL_MANA_MAX],50,amount,1);
		};
	};
	return kosten;
};

