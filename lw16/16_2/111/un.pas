PROGRAM TestRemove(INPUT,OUTPUT);
USES Queue;
VAR
  Ch: CHAR;

PROCEDURE RemoveExtraBlanks;
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN 
  Blank := ' ';
  LineEnd := '$'; 
  AddQ(LineEnd); 
  HeadQ(Ch);
  WHILE Ch = Blank
  DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END;
  WHILE Ch <> LineEnd
  DO
    BEGIN
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
       DO
         BEGIN
           AddQ(Ch);
           DelQ;
           HeadQ(Ch)
         END;
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;
      IF Ch <> LineEnd
      THEN
        AddQ(Blank)
    END;
  DelQ
END; 

BEGIN
  EmptyQ;
  WRITE('Вход:');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQ(Ch)
    END;
  WRITELN; 
  RemoveExtraBlanks;
  WRITE('Выход:');
  HeadQ(Ch);
  WriteQ;
  WRITELN
END.
