IMPORT $;
EXPORT File_Persons_Reduz := MODULE
	EXPORT Layout := RECORD
			RECORDOF($.UID_Person) AND NOT [City,State,ZipCode];
			UNSIGNED4 CSZ_ID;
	END;
	EXPORT File := DATASET('~CLASS::Rik::OUT::Persons_Reduz',Layout,FLAT);
//	EXPORT IDX_LName_Fname := INDEX(File,{LastName,FirstName},{File},'~CLASS::hmw::KEY::Lname_Fname');
END;