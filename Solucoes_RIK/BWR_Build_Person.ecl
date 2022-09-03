IMPORT $;
IMPORT $.File_Persons_Reduz;

// Build do índice de Person
//
Build($.File_Persons_Reduz.IDX_LName_Fname, OVERWRITE);
OUTPUT($.File_Persons_Reduz.IDX_LName_Fname,named('IDX_LName_Fname'));