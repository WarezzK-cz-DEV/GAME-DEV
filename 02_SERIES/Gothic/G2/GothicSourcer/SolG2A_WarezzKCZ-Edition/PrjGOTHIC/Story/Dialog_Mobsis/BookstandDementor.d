
func void use_bookstanddementor_s1()
{
	var int ndocid;
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Dementor_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Dementor_R.tga",0);
		Doc_Show(ndocid);
		b_say(self,self,"$CANTREADTHIS");
	};
};

