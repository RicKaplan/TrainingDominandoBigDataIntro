EXPORT File_CSZ := MODULE
	EXPORT Layout := RECORD
			UNSIGNED CSZ_ID;
            $.UID_Person.city;
            $.UID_Person.state;
            $.UID_Person.ZipCode;
	END;
	SHARED Filename := '~class::rik::out::file_csz';
	EXPORT File := DATASET(Filename,Layout,FLAT);
	EXPORT IDX_CSZ := INDEX(File,{CSZ_ID},{File},'~CLASS::Rik::KEY::file_csz');
END;