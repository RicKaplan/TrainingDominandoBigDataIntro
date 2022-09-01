import $;

MyRec := RECORD
$.UID_Person.city;
$.UID_Person.state;
$.UID_Person.ZipCode;
END;

//output($.UID_Person, named ('Person_Transform'));

city_table := TABLE($.UID_Person,MyRec); //create dataset com dados da cidade

//output(city_table, named ('Table_City'));

SortedTable := SORT(city_table,city, state, zipcode); //sort it first

output(SortedTable, named ('SortedTable'));

// Define estrutura do transform para Crimes de Chicago
city_trans := RECORD
    UNSIGNED   csz_id;  
    MyRec;
END;
//
city_trans Mytransf(myrec Le, myrec Ri, UNSIGNED cnt) := TRANSFORM
SELF.csz_id := cnt;
SELF := Le;
END;
//
rolledrecs := ROLLUP (SortedTable,LEFT.MyRec = RIGHT.MyRec,Mytransf (LEFT,RIGHT,COUNTER));