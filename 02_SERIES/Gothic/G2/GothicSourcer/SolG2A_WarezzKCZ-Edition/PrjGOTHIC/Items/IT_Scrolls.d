
const string NAME_PALADINSCROLL = "Paladin scroll";

const int VALUE_SC_PALLIGHT = 50;
const int VALUE_SC_PALLIGHTHEAL = 100;
const int VALUE_SC_PALHOLYBOLT = 200;
const int VALUE_SC_PALMEDIUMHEAL = 400;
const int VALUE_SC_PALREPELEVIL = 600;
const int VALUE_SC_PALFULLHEAL = 800;
const int VALUE_SC_PALDESTROYEVIL = 1000;
const int VALUE_SC_LIGHT = 10;
const int VALUE_SC_FIREBOLT = 30;
const int VALUE_SC_CHARM = 100;
const int VALUE_SC_ICEBOLT = 50;
const int VALUE_SC_LIGHTHEAL = 25;
const int VALUE_SC_SUMGOBSKEL = 100;
const int VALUE_SC_INSTANTFIREBALL = 75;
const int VALUE_SC_ZAP = 60;
const int VALUE_SC_SUMWOLF = 110;
const int VALUE_SC_WINDFIST = 60;
const int VALUE_SC_SLEEP = 100;
const int VALUE_SC_MEDIUMHEAL = 60;
const int VALUE_SC_LIGHTNINGFLASH = 125;
const int VALUE_SC_CHARGEFIREBALL = 140;
const int VALUE_SC_SUMSKEL = 200;
const int VALUE_SC_FEAR = 100;
const int VALUE_SC_ICECUBE = 200;
const int VALUE_SC_THUNDERBALL = 75;
const int VALUE_SC_SUMGOL = 250;
const int VALUE_SC_HARMUNDEAD = 250;
const int VALUE_SC_PYROKINESIS = 150;
const int VALUE_SC_FIRESTORM = 100;
const int VALUE_SC_ICEWAVE = 300;
const int VALUE_SC_SUMDEMON = 350;
const int VALUE_SC_FULLHEAL = 200;
const int VALUE_SC_FIRERAIN = 500;
const int VALUE_SC_BREATHOFDEATH = 300;
const int VALUE_SC_MASSDEATH = 450;
const int VALUE_SC_ARMYOFDARKNESS = 350;
const int VALUE_SC_SHRINK = 250;
const int VALUE_SC_TRFSHEEP = 50;
const int VALUE_SC_TRFSCAVENGER = 85;
const int VALUE_SC_TRFGIANTRAT = 65;
const int VALUE_SC_TRFGIANTBUG = 100;
const int VALUE_SC_TRFWOLF = 95;
const int VALUE_SC_TRFWARAN = 110;
const int VALUE_SC_TRFSNAPPER = 130;
const int VALUE_SC_TRFWARG = 240;
const int VALUE_SC_TRFFIREWARAN = 220;
const int VALUE_SC_TRFLURKER = 140;
const int VALUE_SC_TRFSHADOWBEAST = 360;
const int VALUE_SC_TRFDRAGONSNAPPER = 290;

instance ITSC_PALLIGHT(C_ITEM)
{
	name = NAME_SPL_PALLIGHT;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALLIGHT;
	visual = "ItSc_PalLight.3DS";
	material = MAT_LEATHER;
	spell = SPL_LIGHT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALLIGHT;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DURATION;
	count[2] = SPL_DURATION_PALLIGHT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PALLIGHTHEAL(C_ITEM)
{
	name = NAME_SPL_PALLIGHTHEAL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALLIGHTHEAL;
	visual = "ItSc_PalLightHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PALLIGHTHEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALLIGHTHEAL;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_PALLIGHTHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PALHOLYBOLT(C_ITEM)
{
	name = NAME_SPL_PALHOLYBOLT;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALHOLYBOLT;
	visual = "ItSc_PalHolyBolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_PALHOLYBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALHOLYBOLT;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_PALHOLYBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PALMEDIUMHEAL(C_ITEM)
{
	name = NAME_SPL_PALMEDIUMHEAL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALMEDIUMHEAL;
	visual = "ItSc_PalMediumHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PALMEDIUMHEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALMEDIUMHEAL;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_PALMEDIUMHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PALREPELEVIL(C_ITEM)
{
	name = NAME_SPL_PALREPELEVIL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALREPELEVIL;
	visual = "ItSc_PalRepelEvil.3DS";
	material = MAT_LEATHER;
	spell = SPL_PALREPELEVIL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALREPELEVIL;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_PALREPELEVIL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PALFULLHEAL(C_ITEM)
{
	name = NAME_SPL_PALFULLHEAL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALFULLHEAL;
	visual = "ItSc_PalFullHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_PALFULLHEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALFULLHEAL;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_PALFULLHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PALDESTROYEVIL(C_ITEM)
{
	name = NAME_SPL_PALDESTROYEVIL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PALDESTROYEVIL;
	visual = "ItSc_PalDestroyEvil.3DS";
	material = MAT_LEATHER;
	spell = SPL_PALDESTROYEVIL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_PALDESTROYEVIL;
	text[0] = NAME_PALADINSCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_PALDESTROYEVIL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_LIGHT(C_ITEM)
{
	name = NAME_SPL_LIGHT;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_LIGHT;
	visual = "ItSc_Light.3DS";
	material = MAT_LEATHER;
	spell = SPL_LIGHT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_LIGHT;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DURATION;
	count[2] = SPL_DURATION_LIGHT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_FIREBOLT(C_ITEM)
{
	name = NAME_SPL_FIREBOLT;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_FIREBOLT;
	visual = "ItSc_Firebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIREBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_FIREBOLT;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_FIREBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_ICEBOLT(C_ITEM)
{
	name = NAME_SPL_ICEBOLT;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_ICEBOLT;
	visual = "ItSc_Icebolt.3DS";
	material = MAT_LEATHER;
	spell = SPL_ICEBOLT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_ICEBOLT;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_ICEBOLT;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_LIGHTHEAL(C_ITEM)
{
	name = NAME_SPL_LIGHTHEAL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_LIGHTHEAL;
	visual = "ItSc_LightHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_LIGHTHEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_LIGHTHEAL;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_LIGHTHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SUMGOBSKEL(C_ITEM)
{
	name = NAME_SPL_SUMMONGOBLINSKELETON;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SUMGOBSKEL;
	visual = "ItSc_SumGobSkel.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONGOBLINSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SUMMONGOBLINSKELETON;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_INSTANTFIREBALL(C_ITEM)
{
	name = NAME_SPL_INSTANTFIREBALL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_INSTANTFIREBALL;
	visual = "ItSc_InstantFireball.3DS";
	material = MAT_LEATHER;
	spell = SPL_INSTANTFIREBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_INSTANTFIREBALL;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_INSTANTFIREBALL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_ZAP(C_ITEM)
{
	name = NAME_SPL_ZAP;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_ZAP;
	visual = "ItSc_Zap.3DS";
	material = MAT_LEATHER;
	spell = SPL_ZAP;
	description = NAME_SPL_ZAP;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_ZAP;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SUMWOLF(C_ITEM)
{
	name = NAME_SPL_SUMMONWOLF;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SUMWOLF;
	visual = "ItSc_SumWolf.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONWOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SUMMONWOLF;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_WINDFIST(C_ITEM)
{
	name = NAME_SPL_WINDFIST;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_WINDFIST;
	visual = "ItSc_Windfist.3DS";
	material = MAT_LEATHER;
	spell = SPL_WINDFIST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_WINDFIST;
	description = NAME_SPL_WINDFIST;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MINMANAKOSTEN;
	count[1] = STEP_WINDFIST;
	text[2] = NAME_MANAKOSTENMAX;
	count[2] = SPL_COST_WINDFIST;
	text[4] = NAME_DAM_MAGICWF;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SLEEP(C_ITEM)
{
	name = NAME_SPL_SLEEP;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SLEEP;
	visual = "ItSc_Sleep.3DS";
	material = MAT_LEATHER;
	spell = SPL_SLEEP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SLEEP;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_SEC_DURATION;
	count[2] = SPL_TIME_SLEEP;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_CHARM(C_ITEM)
{
	name = NAME_SPL_CHARM;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_SC_CHARM;
	visual = "ItSc_Sleep.3DS";
	material = MAT_LEATHER;
	spell = SPL_CHARM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_CHARM;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_MEDIUMHEAL(C_ITEM)
{
	name = NAME_SPL_MEDIUMHEAL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_MEDIUMHEAL;
	visual = "ItSc_MediumHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_MEDIUMHEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_MEDIUMHEAL;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_MEDIUMHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_LIGHTNINGFLASH(C_ITEM)
{
	name = NAME_SPL_LIGHTNINGFLASH;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_LIGHTNINGFLASH;
	visual = "ItSc_LightningFlash.3DS";
	material = MAT_LEATHER;
	spell = SPL_LIGHTNINGFLASH;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_LIGHTNINGFLASH;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_LIGHTNINGFLASH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_CHARGEFIREBALL(C_ITEM)
{
	name = NAME_SPL_CHARGEFIREBALL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_CHARGEFIREBALL;
	visual = "ItSc_ChargeFireball.3DS";
	material = MAT_LEATHER;
	spell = SPL_CHARGEFIREBALL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_CHARGEFIREBALL;
	description = NAME_SPL_CHARGEFIREBALL;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MINMANAKOSTEN;
	count[1] = STEP_CHARGEFIREBALL;
	text[2] = NAME_MANAKOSTENMAX;
	count[2] = SPL_COST_CHARGEFIREBALL;
	text[4] = NAME_DAM_MAGICFCB;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SUMSKEL(C_ITEM)
{
	name = NAME_SPL_SUMMONSKELETON;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SUMSKEL;
	visual = "ItSc_SumSkel.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONSKELETON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SUMMONSKELETON;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_FEAR(C_ITEM)
{
	name = NAME_SPL_FEAR;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_FEAR;
	visual = "ItSc_Fear.3DS";
	material = MAT_LEATHER;
	spell = SPL_FEAR;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_FEAR;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_SEC_DURATION;
	count[2] = SPL_TIME_FEAR;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_ICECUBE(C_ITEM)
{
	name = NAME_SPL_ICECUBE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_ICECUBE;
	visual = "ItSc_IceCube.3DS";
	material = MAT_LEATHER;
	spell = SPL_ICECUBE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_ICECUBE;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAMAGE;
	count[2] = 60;
	text[4] = NAME_DAM_MAGICIC;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_THUNDERBALL(C_ITEM)
{
	name = NAME_SPL_CHARGEZAP;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_THUNDERBALL;
	visual = "ItSc_ThunderBall.3DS";
	material = MAT_LEATHER;
	spell = SPL_CHARGEZAP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_CHARGEZAP;
	description = NAME_SPL_CHARGEZAP;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MINMANAKOSTEN;
	count[1] = STEP_CHARGEZAP;
	text[2] = NAME_MANAKOSTENMAX;
	count[2] = SPL_COST_CHARGEZAP;
	text[4] = NAME_DAM_MAGICCZ;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SUMGOL(C_ITEM)
{
	name = NAME_SPL_SUMMONGOLEM;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SUMGOL;
	visual = "ItSc_SumGol.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONGOLEM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SUMMONGOLEM;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_HARMUNDEAD(C_ITEM)
{
	name = NAME_SPL_DESTROYUNDEAD;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_HARMUNDEAD;
	visual = "ItSc_HarmUndead.3DS";
	material = MAT_LEATHER;
	spell = SPL_DESTROYUNDEAD;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_DESTROYUNDEAD;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_DESTROYUNDEAD;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_PYROKINESIS(C_ITEM)
{
	name = NAME_SPL_PYROKINESIS;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_PYROKINESIS;
	visual = "ItSc_Pyrokinesis.3DS";
	material = MAT_LEATHER;
	spell = SPL_PYROKINESIS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = STEP_FIRESTORM;
	description = NAME_SPL_PYROKINESIS;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MINMANAKOSTEN;
	count[1] = STEP_FIRESTORM;
	text[2] = NAME_MANAKOSTENMAX;
	count[2] = SPL_COST_FIRESTORM;
	text[4] = NAME_DAM_MAGICPYROS;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_FIRESTORM(C_ITEM)
{
	name = NAME_SPL_FIRESTORM;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_FIRESTORM;
	visual = "ItSc_Firestorm.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIRESTORM;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_FIRESTORM;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_INSTANTFIRESTORM;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_ICEWAVE(C_ITEM)
{
	name = NAME_SPL_ICEWAVE;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_ICEWAVE;
	visual = "ItSc_IceWave.3DS";
	material = MAT_LEATHER;
	spell = SPL_ICEWAVE;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_ICEWAVE;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAMAGE;
	count[2] = 60;
	text[4] = NAME_DAM_MAGICIC;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SUMDEMON(C_ITEM)
{
	name = NAME_SPL_SUMMONDEMON;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SUMDEMON;
	visual = "ItSc_SumDemon.3DS";
	material = MAT_LEATHER;
	spell = SPL_SUMMONDEMON;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SUMMONDEMON;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_FULLHEAL(C_ITEM)
{
	name = NAME_SPL_FULLHEAL;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_FULLHEAL;
	visual = "ItSc_FullHeal.3DS";
	material = MAT_LEATHER;
	spell = SPL_FULLHEAL;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_FULLHEAL;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_HEALINGPERCAST;
	count[2] = SPL_HEAL_FULLHEAL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_FIRERAIN(C_ITEM)
{
	name = NAME_SPL_FIRERAIN;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_FIRERAIN;
	visual = "ItSc_Firerain.3DS";
	material = MAT_LEATHER;
	spell = SPL_FIRERAIN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_FIRERAIN;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_FIRE;
	count[2] = SPL_DAMAGE_FIRERAIN;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_BREATHOFDEATH(C_ITEM)
{
	name = NAME_SPL_BREATHOFDEATH;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_BREATHOFDEATH;
	visual = "ItSc_BreathOfDeath.3ds";
	material = MAT_LEATHER;
	spell = SPL_BREATHOFDEATH;
	description = NAME_SPL_BREATHOFDEATH;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_BREATHOFDEATH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_MASSDEATH(C_ITEM)
{
	name = NAME_SPL_MASSDEATH;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_MASSDEATH;
	visual = "ItSc_MassDeath.3ds";
	material = MAT_LEATHER;
	spell = SPL_MASSDEATH;
	description = NAME_SPL_MASSDEATH;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[2] = NAME_DAM_MAGIC;
	count[2] = SPL_DAMAGE_MASSDEATH;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_ARMYOFDARKNESS(C_ITEM)
{
	name = NAME_SPL_ARMYOFDARKNESS;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_ARMYOFDARKNESS;
	visual = "ItSc_ArmyOfDarkness.3DS";
	material = MAT_LEATHER;
	spell = SPL_ARMYOFDARKNESS;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_ARMYOFDARKNESS;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_SHRINK(C_ITEM)
{
	name = NAME_SPL_SHRINK;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_SHRINK;
	visual = "ItSc_Shrink.3DS";
	material = MAT_LEATHER;
	spell = SPL_SHRINK;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_SHRINK;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFSHEEP(C_ITEM)
{
	name = NAME_SPL_TRFSHEEP;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFSHEEP;
	visual = "ItSc_TrfSheep.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFSHEEP;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFSHEEP;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFSCAVENGER(C_ITEM)
{
	name = NAME_SPL_TRFSCAVENGER;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFSCAVENGER;
	visual = "ItSc_TrfScavenger.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFSCAVENGER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFSCAVENGER;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFGIANTRAT(C_ITEM)
{
	name = NAME_SPL_TRFGIANTRAT;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFGIANTRAT;
	visual = "ItSc_TrfGiantRat.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFGIANTRAT;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFGIANTRAT;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFGIANTBUG(C_ITEM)
{
	name = NAME_SPL_TRFGIANTBUG;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFGIANTBUG;
	visual = "ItSc_TrfGiantBug.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFGIANTBUG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFGIANTBUG;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFWOLF(C_ITEM)
{
	name = NAME_SPL_TRFWOLF;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFWOLF;
	visual = "ItSc_TrfWolf.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFWOLF;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFWOLF;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFWARAN(C_ITEM)
{
	name = NAME_SPL_TRFWARAN;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFWARAN;
	visual = "ItSc_TrfWaran.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFWARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFWARAN;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFSNAPPER(C_ITEM)
{
	name = NAME_SPL_TRFSNAPPER;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFSNAPPER;
	visual = "ItSc_TrfSnapper.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFSNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFSNAPPER;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFWARG(C_ITEM)
{
	name = NAME_SPL_TRFWARG;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFWARG;
	visual = "ItSc_TrfWarg.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFWARG;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFWARG;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFFIREWARAN(C_ITEM)
{
	name = NAME_SPL_TRFFIREWARAN;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFFIREWARAN;
	visual = "ItSc_TrfFireWaran.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFFIREWARAN;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFFIREWARAN;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFLURKER(C_ITEM)
{
	name = NAME_SPL_TRFLURKER;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFLURKER;
	visual = "ItSc_TrfLurker.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFLURKER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFLURKER;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFSHADOWBEAST(C_ITEM)
{
	name = NAME_SPL_TRFSHADOWBEAST;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFSHADOWBEAST;
	visual = "ItSc_TrfShadowbeast.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFSHADOWBEAST;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFSHADOWBEAST;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSC_TRFDRAGONSNAPPER(C_ITEM)
{
	name = NAME_SPL_TRFDRAGONSNAPPER;
	mainflag = ITEM_KAT_RUNE;
	flags = ITEM_MULTI;
	value = VALUE_SC_TRFDRAGONSNAPPER;
	visual = "ItSc_TrfDragonSnapper.3DS";
	material = MAT_LEATHER;
	spell = SPL_TRFDRAGONSNAPPER;
	cond_atr[2] = ATR_MANA_MAX;
	cond_value[2] = SPL_COST_SCROLL;
	description = NAME_SPL_TRFDRAGONSNAPPER;
	text[0] = NAME_MAGESCROLL;
	text[1] = NAME_MANA_NEEDED;
	count[1] = SPL_COST_SCROLL;
	text[5] = NAME_VALUE;
	count[5] = value;
};

