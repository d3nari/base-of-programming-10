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
      WRITELN('������� ����� ', Word);
      PrintTree(Root, OUTPUT);
      WRITELN;
      IF OverflowCheck(UniqueWords, IsUnique) 
      THEN
        BEGIN
          WRITELN('������������'); 
          InitFile();
          DeleteTree(Root);
          WRITELN('������ ������')
        END;         
    END;
   
  SortFileTree(Root);
  AddFile();
  CopyFile();
  WRITELN('������ ���� '); 
  WrFile();
            
  //PrintTree(Root, OUTPUT);
  DeleteTree(Root);
END.
