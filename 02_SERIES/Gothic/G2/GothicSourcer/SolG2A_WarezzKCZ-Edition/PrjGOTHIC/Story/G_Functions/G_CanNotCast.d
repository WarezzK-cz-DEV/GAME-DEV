
func void g_cannotcast(var int bisplayer,var int ncircleneeded,var int ncirclepossessed)
{
	var string strmessage;
	var int ndifference;
	var string strdifference;
	ndifference = ncircleneeded - ncirclepossessed;
	strdifference = IntToString(ndifference);
	strmessage = ConcatStrings(PRINT_MAGCIRCLES_MISSING," ");
	strmessage = ConcatStrings(strmessage,strdifference);
	if(bisplayer)
	{
		Print(strmessage);
	};
};

