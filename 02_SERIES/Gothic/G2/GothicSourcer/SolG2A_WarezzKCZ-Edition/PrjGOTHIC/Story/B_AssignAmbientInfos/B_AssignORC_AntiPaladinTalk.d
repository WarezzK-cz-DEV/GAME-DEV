
var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//KHROKGNAR! Master say you paladin now! Master right. Master always right.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//Us leaders of proud orc army now come ourselves for killing great paladin.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//Hagen and his men be wiped out. Even you no can help them.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Master say orc leaders, bring head of great paladin. You now die by my hand. KHROKGNAR!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//Us orc leaders now come ourselves to kill you, paladin.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//KHROKGNAR! Us kill you, paladin.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};

