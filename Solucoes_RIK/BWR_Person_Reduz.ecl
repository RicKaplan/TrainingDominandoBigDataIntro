IMPORT $;

// exibe files  para análise
SortedPerson := SORT($.UID_Person,recid); //sort por recid

output(SortedPerson, named ('Person_Por_RECID'));

SortedCity := SORT($.File_CSZ.File,CSZ_ID); //sort por csz_id

output(SortedCity, named ('City_Por_CSZ_ID'));

// define a estrutura do transform
File_Persons_Reduz := RECORD
	RECORDOF($.UID_Person) AND NOT [City,State,ZipCode];
	UNSIGNED4 CSZ_ID;
END;
//
File_Persons_Reduz MYREDUZ($.UID_Person Le, $.File_CSZ.Layout Ri) := TRANSFORM
  SELF.CSZ_ID := Ri.csz_id;
  SELF := Le;
END;
//
joinedrecs := JOIN($.UID_Person, $.File_CSZ.File, 
                   (LEFT.zipcode = RIGHT.zipcode AND LEFT.city = RIGHT.city AND LEFT.state = RIGHT.state), 
                   MYREDUZ(LEFT,RIGHT), LEFT OUTER);
//
SortedReduz := SORT(joinedrecs,recid, csz_id)  : PERSIST ('~CLASS::Rik::PERSIST::Person_Reduz'); //sort por rec_id, csz_id

OUTPUT(SortedReduz,,'~CLASS::Rik::OUT::Person_Reduz', OVERWRITE);

output(SortedReduz, named ('Person_Reduz'));