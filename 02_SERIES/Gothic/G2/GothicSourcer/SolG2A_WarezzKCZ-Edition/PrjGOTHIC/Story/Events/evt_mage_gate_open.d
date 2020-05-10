
var int mage_gate_onetime;

func void evt_mage_gate_open()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	if(MAGE_GATE_ONETIME == FALSE)
	{
		b_startotherroutine(milten,"GATEOPEN");
		MAGE_GATE_ONETIME = TRUE;
	};
};

