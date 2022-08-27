IMPORT $;
output($.File_Persons.File,named('File_Persons'));
output($.File_Accounts.File,named('File_Accounts'));
output(count($.File_Persons.File),named('Count_Persons'));
output(count($.File_Accounts.File),named('Count_Accounts'));
output($.File_Persons.File(city = 'LAVACA'), {id},named('Filtro_IDs_Persons'));
output($.File_Persons.File, {id, FirstName, LastName}, named('Campos_Persons'));
output($.File_Accounts.File, {ReportDate, HighCredit, Balance}, named('Campos_Accounts'));
output($.File_Persons.File, {ID, StreetAddress, City, State, ZipCode},  named('Campos2_Persons'));


