import $; /* importa estruturas previas */

Crimes := $.File_Crimes_Chicago.File; /* instancia Crimes */

// Define estrutura do transform para Crimes de Chicago
crimes_trans := RECORD
    UNSIGNED   rowid;  
    STRING8    day;
    STRING6    time;
    $.File_Crimes_Chicago.Layout;
END;

// define como a tranformacao ocorrera

crimes_trans CrimesTransf($.File_Crimes_Chicago.Layout L1, UNSIGNED cnt) := TRANSFORM

//Define condicoes logicas para tratamento da hora AM/PM
// Exemplo extraido do arquivo para analise do dado
//ID        CaseNumber Date                   Block
//10224738	HY411648	 09/05/2015 01:30:00 PM	043XX S WOOD ST
//
//   Posicoes da Data
//   09/05/2015 01:30:00 PM
//            1111111111222
//   1234567890123456789012

  BOOLEAN Eh_PM      := L1.Date[21..22] = 'PM';  //Boolean PM ligado
  BOOLEAN HR_Less_12 := L1.Date[12..13] < '12';  //Boolean menor que 12h

// transformacao propriamente dita
  SELF.rowid     := cnt;  /* adiciona o ID da linha */

// transforma a data de ocorrencia
  SELF.day       := L1.Date[7..10] /*ano*/ + L1.Date[4..5] /* mes */ + L1.Date[1..2] /* dia */; /* concatena invertendo */

// Transforma a hora da ocorrencia de AM/PM para 24h
  SELF.time      := IF(Eh_PM AND HR_Less_12,
              (string2)((unsigned2)(L1.Date[12..13]) + 12) /*hora + 12*/ + L1.Date[15..16] /* minuto */ + L1.Date[18..19] /* segundo */,                    
              L1.Date[12..13] /*hora*/ + L1.Date[15..16] /* minuto */ + L1.Date[18..19] /* segundo */);

// Propaga o restante do registro
  SELF           := L1;
END;

// faz a transformação propriamente dita, via Project, em arquivo de persistencia e exporta UID

export UID_Crimes_Chicago := PROJECT($.File_Crimes_Chicago.File,CrimesTransf(LEFT,COUNTER)) : PERSIST ('~CLASS::Rik::PERSIST::UID_Crimes_Chicago');