import $;

Persons := $.File_Persons.File;

output(count(Persons(State = 'FL')), named('Persons_FL_CNT'));
// output(Persons(State = 'FL', City = 'MIAMI'), named('Persons_Mi'));
output(count(Persons(State = 'FL', City = 'MIAMI')), named('Persons_Miami_CNT'));
output(count(Persons(State = 'FL', City = 'MIAMI', ZipCode = '33102')), named('Persons_ZipCode_CNT'));
output(count(Persons(FirstName >= 'B', FirstName < 'C')), named('Persons_Name_CNT'));
output(count(Persons(FileDate[1..4] > '2000')), named('Persons_Date_CNT'));