import $;
IMPORT STD;

Persons := $.File_Persons.File;

output(Persons,named('Person'));

// Define estrutura do transform
person_trans := RECORD
    UNSIGNED   recid;  
    UNSIGNED8  ID;
    STRING15   FirstName;
    STRING25   LastName;
    STRING15   MiddleName;
    STRING2    NameSuffix;
    STRING8    FileDate;
    UNSIGNED2  BureauCode;
    STRING1    MaritalStatus;
    STRING1    Gender;
    UNSIGNED1  DependentCount;
    STRING8    BirthDate;
    STRING42   StreetAddress;
    STRING20   City;
    STRING2    State;
    STRING5    ZipCode;    
END;

// define como a tranformacao ocorrera

person_trans MyTransf(Persons Le, UNSIGNED cnt) := TRANSFORM
    SELF.recid      := cnt;
	SELF.Firstname  := STD.Str.ToUpperCase(Le.Firstname);
	SELF.Lastname   := STD.Str.ToUpperCase(Le.LastName);
	SELF.MiddleName := STD.Str.ToUpperCase(Le.MiddleName);    
    SELF            := Le;
END;

// faz a transformação propriamente dita

EXPORT newds := PROJECT(Persons,MyTransf(LEFT,COUNTER)) : PERSIST ('~CLASS::Rik::PERSIST::UID_Persons');

output(newds, named ('Person_Transform'));
