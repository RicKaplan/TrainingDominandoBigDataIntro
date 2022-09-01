EXPORT File_CSZ := MODULE
	EXPORT Layout := RECORD
			UNSIGNED CSZ_ID;
            $.UID_Person.city;
            $.UID_Person.state;
            $.UID_Person.ZipCode;
	END;
	SHARED Filename := '~class::rik::out::lookupcsz__p3304988207';
	EXPORT File := DATASET(Filename,Layout,FLAT);
//	EXPORT IDX_CSZ := INDEX(File,{CSZ_ID},{File},'~CLASS::HMW::KEY::Lookup_CSZ');
END;