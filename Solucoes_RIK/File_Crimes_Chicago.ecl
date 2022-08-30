EXPORT File_Crimes_Chicago := MODULE
 EXPORT Layout := RECORD
   //  STRING ID;
   //  STRING CaseNumber;
   //  STRING Date;
   //  STRING Block;
   //  STRING IUCR;
   //  STRING PrimaryType;
   //  STRING Description;
   //  STRING LocationDescription;
   //  STRING Arrest;
   //  STRING Domestic;
   //  STRING Beat;
   //  STRING District;
   //  STRING Ward;
   //  STRING CommunityArea;
   //  STRING FBICode;
   //  STRING XCoordinate;
   //  STRING YCoordinate;
   //  STRING Year;
   //  STRING UpdatedOn;
   //  STRING Latitude;
   //  STRING Longitude;
   //  STRING Location;
    string8 ID;
    string11 CaseNumber;
    string22 Date;
    string38 Block;
    string4 IUCR;
    string33 PrimaryType;
    string60 Description;
    string53 LocationDescription;
    string6 Arrest;
    string8 Domestic;
    string4 Beat;
    string8 District;
    string4 Ward;
    string14 CommunityArea;
    string8 FBICode;
    string12 XCoordinate;
    string12 YCoordinate;
    string4 Year;
    string22 UpdatedOn;
    string12 Latitude;
    string13 Longitude;
    string29 Location;
 END;
 //YOUR initials between CLASS and Intro
 EXPORT File := DATASET('~class::rik::intro::rk_crimes_-_2001_to_present.csv',Layout,CSV(heading(1)));
END;

