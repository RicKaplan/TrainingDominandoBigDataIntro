IMPORT $, DataPatterns;

Crimes := $.File_Crimes_Chicago.File;
profileResults := DataPatterns.Profile(Crimes);

OUTPUT(profileResults,ALL,named('profileResults'));

