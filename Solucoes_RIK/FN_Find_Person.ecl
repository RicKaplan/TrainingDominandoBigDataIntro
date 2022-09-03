EXPORT FN_Find_Person (STRING lname, STRING fname) := FUNCTION
	basekey1 := $.File_Persons_Reduz.IDX_lname_fname;
	basekey2 := $.File_CSZ.IDX_CSZ;
	
	FilteredKey := IF(fname='',
										basekey1(LastName=lname), 
										basekey1(LastName=lname AND FirstName=fname)
										);
	
	Outrec := RECORD
		RECORDOF(basekey1) AND NOT [csz_id];
		RECORDOF(basekey2) AND NOT [csz_id];
	END;
	
	Outrec MyJoin(FilteredKey Le, basekey2 Ri):= TRANSFORM
		SELF:=Le;
		SELF:=Ri;
	END;
	
	JoinRecs:= JOIN(FilteredKey, basekey2,
									LEFT.csz_id=RIGHT.csz_id, 
									MyJoin(LEFT, RIGHT),
									ALL);
	RETURN OUTPUT(JoinRecs);
END;