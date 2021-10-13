PROGRAM TreeSortMain(INPUT, OUTPUT);

       
USES TreeSort, ReadWord, RemTree;
             
VAR
  Word: STRING;

BEGIN
  WHILE NOT EOF(InputFile) 
  DO
    BEGIN 
      Word := ReadWordFunc(InputFile);
      Insert(Root, Word, IsUnique);
      WRITELN('Текущая буква ', Word);
      PrintTree(Root, OUTPUT);
      WRITELN;
      IF OverflowCheck(UniqueWords, IsUnique) 
      THEN
        BEGIN
          WRITELN('Переполнение'); 
          InitFile();
          DeleteTree(Root);
          WRITELN('Удалил дерево')
        END;         
    END;
   
  SortFileTree(Root);
  AddFile();
  CopyFile();
  WRITELN('Вывожу файл '); 
  WrFile();
            
  //PrintTree(Root, OUTPUT);
  DeleteTree(Root);
END.
