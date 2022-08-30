import $;
IMPORT STD;

Persons := $.File_Persons.File;

// Define estrutura do transform
person_trans := RECORD
    UNSIGNED   recid;  
    $.File_Persons.Layout;
END;

// define como a tranformacao ocorrera

person_trans PersonTransf($.File_Persons.Layout L1, UNSIGNED cnt) := TRANSFORM
    SELF.recid      := cnt;
	SELF.Firstname  := STD.Str.ToUpperCase(L1.Firstname);
	SELF.Lastname   := STD.Str.ToUpperCase(L1.LastName);
	SELF.MiddleName := STD.Str.ToUpperCase(L1.MiddleName);    
    SELF            := L1;
END;

// faz a transformação propriamente dita

export UID_Person := PROJECT($.File_Persons.File,PersonTransf(LEFT,COUNTER)) : PERSIST ('~CLASS::Rik::PERSIST::UID_Persons');