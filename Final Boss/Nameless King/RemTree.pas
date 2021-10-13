UNIT RemTree;

INTERFACE

USES TreeSort, ReadWord;

VAR ConFile, TempFile: TEXT;
VAR Dostup, Count: INTEGER;
VAR Data: STRING;

PROCEDURE InitFile();
PROCEDURE SortFileTree(VAR Ptr: Tree);
PROCEDURE CopyFile();
PROCEDURE WrFile();
PROCEDURE AddFile();
PROCEDURE MergeTree(VAR Ptr: Tree);

IMPLEMENTATION

PROCEDURE InitFile();
BEGIN
  ASSIGN(ConFile, 'ConFile.txt');
  ASSIGN(TempFile, 'TempFile.txt');
  REWRITE(ConFile);
  PrintTree(Root, ConFile);
  RESET(ConFile);
  REWRITE(TempFile);
  
  //проверка содержимого файла
  {WRITELN('Работа с файлом закончена');
  RESET(ConFile);
  WHILE NOT EOF(ConFile)
  DO
    BEGIN
      READLN(ConFile, S);
      WRITELN(OUTPUT, S)
    END;
  WRITELN('Вывод файла закончен')}
           
END;

PROCEDURE SortFileTree(VAR Ptr: Tree);
BEGIN 
  IF Ptr <> NIL
  THEN
    BEGIN         
      SortFileTree(Ptr^.LLink);
      MergeTree(Ptr);
      SortFileTree(Ptr^.RLink)       
    END 
END;

PROCEDURE MergeTree(VAR Ptr: Tree);

BEGIN
  IF Dostup = 1
  THEN 
    BEGIN
      Data := ReadWordFunc(ConFile);
      READLN(ConFile, Count);
      Dostup := 0
    END;  
               
  IF Ptr^.Word < Data
  THEN
    BEGIN           
      WRITE(TempFile, Ptr^.Word, ' ');
      WRITELN(TempFile, Ptr^.Count)     
    END
  ELSE    
    WHILE (Ptr^.Word >= Data) AND (NOT EOF(ConFile))
    DO
      BEGIN
        Dostup := 2 ;
        WRITE(TempFile, Data, ' ');
        IF Ptr^.Word = Data
        THEN
          BEGIN
            Count := Count + Ptr^.Count;
            Dostup := 0       
          END;
        WRITELN(TempFile, Count);    
           
        Data := ReadWordFunc(ConFile); 
        READLN(ConFile, Count); 
        
        IF (EOF(ConFile)) AND (Ptr^.Word >= Data) 
        THEN
          BEGIN
            WRITE(TempFile, Data, ' ');
            IF Ptr^.Word = Data
            THEN
              BEGIN
                Count := Count + Ptr^.Count;
                Dostup := 0       
              END;
            Data := ' ';
            WRITELN(TempFile, Count);
          END
                            
      END; 
          
  IF (Dostup = 2) OR ((EOF(ConFile)) AND (Dostup = 2))
  THEN
    BEGIN
      WRITE(TempFile, Ptr^.Word, ' ');
      WRITELN(TempFile, Ptr^.Count); 
      Dostup := 0
    END;       
END;

PROCEDURE AddFile();
VAR
  Word: STRING;
  Counter: INTEGER;
BEGIN
  IF Data <> ' '
  THEN
    BEGIN
      WRITE(TempFile, Data, ' ');
      WRITELN(TempFile, Count); 
    END;
  WHILE NOT EOF(ConFile)
  DO
    BEGIN
      Word := ReadWordFunc(ConFile);
      READLN(ConFile, Counter);
      WRITE(TempFile, Word, ' '); 
      WRITELN(TempFile, Counter)
    END    
END;

PROCEDURE CopyFile();
VAR
  Word: STRING;
  Count: INTEGER;
BEGIN
  RESET(TempFile);
  REWRITE(ConFile);
  WHILE NOT EOF(TempFile)
  DO
    BEGIN
      Word := ReadWordFunc(TempFile);
      READLN(TempFile, Count);
      WRITE(ConFile, Word, ' ');
      WRITELN(ConFile, Count)  
    END
END;

PROCEDURE WrFile();
VAR
  Word: STRING;
  Count: INTEGER;
BEGIN
  RESET(ConFile);
  WHILE NOT EOF(ConFile)
  DO
    BEGIN
      Word := ReadWordFunc(ConFile);
      WRITE(OUTPUT, Word, ' ');
      READLN(ConFile, Count);
      WRITELN(OUTPUT, Count)
    END
END;



BEGIN
  Dostup := 1
END.
