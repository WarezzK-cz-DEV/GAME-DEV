
var int b_ravensescapeintotempelavi_onetime;

func void b_ravensescapeintotempelavi()
{
	if(b_ravensescapeintotempelavi_onetime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RAVENISINTEMPEL = TRUE;
		Log_CreateTopic(TOPIC_ADDON_RAVENKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_ADDON_RAVENKDW,LOG_RUNNING);
		b_logentry(TOPIC_ADDON_RAVENKDW,"I entered Raven's rooms, only to see him disappear behind a large door. I could not follow him. I assume that the door must lead to the temple of Adanos. I need to report this to Saturas.");
		b_ravensescapeintotempelavi_onetime = TRUE;
	};
};

