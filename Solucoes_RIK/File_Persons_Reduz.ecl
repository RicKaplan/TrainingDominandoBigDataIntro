IMPORT $;
EXPORT File_Persons_Reduz := MODULE
	EXPORT Layout := RECORD
			RECORDOF($.UID_Person) AND NOT [City,State,ZipCode];
			UNSIGNED4 CSZ_ID;
	END;
	EXPORT File := DATASET('~CLASS::Rik::OUT::Person_Reduz',Layout,FLAT);
	EXPORT IDX_LName_Fname := INDEX(File,{LastName,FirstName},{File},'~CLASS::Rik::KEY::Lname_Fname');
END;