import $;

Crimes := $.File_Crimes_Chicago.File;

// Define estrutura do transform
crimes_trans := RECORD
    UNSIGNED   rowid;  
    STRING8    day;
    STRING6    time;
    $.File_Crimes_Chicago.Layout;
END;



// define como a tranformacao ocorrera

crimes_trans CrimesTransf($.File_Crimes_Chicago.Layout L1, UNSIGNED cnt) := TRANSFORM
//Define condicoes logicas
  BOOLEAN HR12   := L1.Date[12..13] = '12';  //Boolean 12h
  BOOLEAN IsPM   := L1.Date[21..22] = 'PM'; //Boolean PM ligado

// transformacao propriamente dita
  SELF.rowid     := cnt;
  SELF.day       := L1.Date[7..10] /*ano*/ + L1.Date[4..5] /* mes */ + L1.Date[1..2] /* dia */;
  SELF.time      := IF(L1.Date[21..22] = 'PM' AND L1.Date[12..13] < '12',
                    (string2)((unsigned2)(L1.Date[12..13]) + 12) /*hora*/ + L1.Date[15..16] /* minuto */ + L1.Date[18..19] /* segundo */,
                    L1.Date[12..13] /*hora*/ + L1.Date[15..16] /* minuto */ + L1.Date[18..19] /* segundo */);
  SELF           := L1;
END;

// faz a transformação propriamente dita

export UID_Crimes_Chicago := PROJECT($.File_Crimes_Chicago.File,CrimesTransf(LEFT,COUNTER)) : PERSIST ('~CLASS::Rik::PERSIST::UID_Crimes_Chicago');