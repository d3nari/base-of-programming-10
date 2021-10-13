UNIT TreeSort;

INTERFACE


CONST
  MaxUniqueWords = 10;

TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Word: STRING;
               Count: INTEGER;
               LLink, RLink: Tree
             END;
             
VAR
  Root: Tree;
  Ch: CHAR;
  Word: STRING;
  UniqueWords: INTEGER;
  IsUnique: BOOLEAN;
  

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING; VAR IsUnique: BOOLEAN);
PROCEDURE PrintTree(VAR Ptr: Tree; VAR OutFile: TEXT);
PROCEDURE DeleteTree(VAR Ptr: Tree);
FUNCTION OverflowCheck(VAR UniqueWords: INTEGER; IsUnique: BOOLEAN): BOOLEAN;


IMPLEMENTATION         

FUNCTION OverflowCheck(VAR UniqueWords: INTEGER; IsUnique: BOOLEAN): BOOLEAN;
BEGIN
  IF IsUnique 
  THEN
    UniqueWords := UniqueWords + 1;

  IsUnique := FALSE;
      
  WRITELN('”никальных слов - ', UniqueWords);
  
  IF UniqueWords = MaxUniqueWords 
  THEN
    BEGIN
      OverflowCheck := TRUE;
      UniqueWords := 0;
    END  
  ELSE
    OverflowCheck := FALSE    
END;


PROCEDURE Insert(VAR Ptr: Tree; Data: STRING; VAR IsUnique: BOOLEAN);
BEGIN {Insert}
  IsUnique := TRUE;
  IF Data <> ''
  THEN
    BEGIN 
    IF Ptr = NIL
    THEN
      BEGIN 
        NEW(Ptr);
        Ptr^.Word := Data;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL;
        Ptr^.Count := 1
      END
    ELSE
      IF Ptr^.Word = Data
      THEN
        BEGIN
          Ptr^.Count := Ptr^.Count + 1;
          IsUnique := FALSE;
        END   
      ELSE   
        IF Ptr^.Word > Data
        THEN
          Insert(Ptr^.LLink, Data, IsUnique)
        ELSE
          Insert(Ptr^.RLink, Data, IsUnique)
    END
  ELSE
    IsUnique := FALSE;         
END;  {Insert}



PROCEDURE PrintTree(VAR Ptr: Tree; VAR OutFile: TEXT);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  
    BEGIN
      PrintTree(Ptr^.LLink, OutFile);
      WRITE(OutFile, Ptr^.Word);
      WRITELN(OutFile, ' ', Ptr^.Count);
      PrintTree(Ptr^.RLink, OutFile)
    END
END;  {PrintTree}

PROCEDURE DeleteTree(VAR Ptr: Tree);
BEGIN {DeleteTree}
  IF Ptr <> NIL
  THEN  
    BEGIN
      DeleteTree(Ptr^.RLink); 
      DeleteTree(Ptr^.LLink);
      DISPOSE(Root);
      Ptr := NIL;          
    END
END;  {DeleteTree}


BEGIN
  UniqueWords := 0;
  Root := NIL 
END.
