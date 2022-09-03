import $;

City_Record := RECORD
$.UID_Person.city;
$.UID_Person.state;
$.UID_Person.ZipCode;
END;

//output($.UID_Person, named ('Person_Transform'));

city_table := TABLE($.UID_Person,City_Record); //create dataset com dados da cidade

//output(city_table, named ('Table_City'));

SortedTable := SORT(city_table,zipcode, city, state); //sort por zipcode primeiramente

output(SortedTable, named ('SortedTable'));

DeDupCitys := DEDUP (SortedTable , zipcode , city, state); // compara apenas registros adjacentes

output(DeDupCitys, named ('DeDupCitys'));

// Define estrutura do transform para Tabela de Cidades
city_trans := RECORD
    UNSIGNED   csz_id;  
    City_Record;
END;
//
city_trans CityTransf(City_Record Le, UNSIGNED cnt) := TRANSFORM
SELF.csz_id := cnt;
SELF := Le;
END;

// faz a transformação propriamente dita, via Project, em arquivo de persistencia e exporta UID

UID_City := PROJECT(DeDupCitys,CityTransf(LEFT,COUNTER));

OUTPUT(UID_City,,'~CLASS::Rik::OUT::File_CSZ', OVERWRITE);

output(UID_City, named ('UID_City'));