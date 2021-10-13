UNIT TreeSort;

INTERFACE


CONST
  MaxUniqueWords = 150;

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
  

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING; VAR IsUnique: BOOLEAN);
PROCEDURE PrintTree(VAR Ptr: Tree);
PROCEDURE DeleteTree(VAR Ptr: Tree);


IMPLEMENTATION

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING; VAR IsUnique: BOOLEAN);
BEGIN {Insert}
  IF Data <> ''
  THEN
    BEGIN 
    IF Ptr = NIL
    THEN
      BEGIN {Создаем лист со значением Data}
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

PROCEDURE PrintTree(VAR Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {Печатает поддерево слева, вершину, поддерево справа}
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ptr^.Word);
      WRITELN(': ', Ptr^.Count);
      PrintTree(Ptr^.RLink)
    END
END;  {PrintTree}

PROCEDURE DeleteTree(VAR Ptr: Tree);
BEGIN {DeleteTree}
  IF Ptr <> NIL
  THEN  
    BEGIN
      DISPOSE(Root)
    END
END;  {DeleteTree}


BEGIN
  UniqueWords := 0;
  Root := NIL;   
END.
