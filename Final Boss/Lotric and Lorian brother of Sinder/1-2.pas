PROGRAM TreeSortMain(INPUT, OUTPUT);

       
USES TreeSort, ReadWord;
             
VAR
  Word: STRING;
  IsUnique: BOOLEAN;

BEGIN
  WHILE (NOT EOF(InputFile)) AND (UniqueWords < MaxUniqueWords) 
  DO
    BEGIN 
      IsUnique := TRUE;
      Word := ReadWordFunc(InputFile);
      Insert(Root, Word, IsUnique);
      IF IsUnique
      THEN
       UniqueWords := UniqueWords + 1 
    END; 
  PrintTree(Root);
  DeleteTree(Root);
  WRITELN('”никальных слов - ', UniqueWords) 
END.
