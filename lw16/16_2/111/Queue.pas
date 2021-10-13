UNIT Queue;

INTERFACE

PROCEDURE EmptyQ;
PROCEDURE AddQ(VAR Elt: CHAR);
PROCEDURE DelQ;
PROCEDURE HeadQ(VAR Elt: CHAR);
PROCEDURE WriteQ;

IMPLEMENTATION

VAR
  Q, Temp: TEXT;

PROCEDURE CopyOpen(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END
END;

PROCEDURE EmptyQ;
BEGIN 
  REWRITE(Q);
  WRITELN(Q);
  RESET(Q)
END;

PROCEDURE AddQ(VAR Elt: CHAR);
VAR
  Temp: TEXT;
BEGIN 
  REWRITE(Temp);
  CopyOpen(Q, Temp);
  WRITELN(Temp, Elt);
  RESET(Temp);
  REWRITE(Q);
  CopyOpen(Temp, Q);
  WRITELN(Q);
  RESET(Q)
END;

PROCEDURE DelQ;
VAR
  Ch: CHAR;
BEGIN 
  READ(Q, Ch);
  IF NOT EOF(Q)
  THEN
    BEGIN
      REWRITE(Temp);
      CopyOpen(Q, Temp);
      WRITELN(Temp);
      RESET(Temp);
      REWRITE(Q);
      CopyOpen(Temp, Q);
      WRITELN(Q)
    END;
  RESET(Q)
END;

PROCEDURE HeadQ(VAR Elt: CHAR);
BEGIN
  IF NOT EOLN(Q)
  THEN
    READ(Q, Elt)
  ELSE
    Elt := '#';
  RESET(Q)
END;

PROCEDURE WriteQ;
BEGIN
  CopyOpen(Q, OUTPUT);
  WRITELN(OUTPUT, '.');
  RESET(Q)
END;

BEGIN
END.
