EXPORT File_Crimes_Chicago := MODULE
 EXPORT Layout := RECORD
    STRING ID;
    STRING CaseNumber;
    STRING Date;
    STRING Block;
    STRING IUCR;
    STRING PrimaryType;
    STRING Description;
    STRING LocationDescription;
    STRING Arrest;
    STRING Domestic;
    STRING Beat;
    STRING District;
    STRING Ward;
    STRING CommunityArea;
    STRING FBICode;
    STRING XCoordinate;
    STRING YCoordinate;
    STRING Year;
    STRING UpdatedOn;
    STRING Latitude;
    STRING Longitude;
    STRING Location;
 END;
 //YOUR initials between CLASS and Intro
 EXPORT File := DATASET('~class::rik::intro::rk_crimes::rk_crimes_-_2001_to_present.csv',Layout,CSV(heading(1)));
END;

