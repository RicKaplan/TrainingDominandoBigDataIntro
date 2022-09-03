IMPORT $;

// Build do índice de CSZ... este índice não havia sido criado e 
// a function de find person apresentava erro em tempo de execução
//
Build($.File_CSZ.IDX_CSZ,OVERWRITE);
OUTPUT($.File_CSZ.IDX_CSZ,named('IDX_CSZ'));