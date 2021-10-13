PROGRAM Split(INPUT,OUTPUT);
VAR
  Ch,Next: CHAR;
  Odds,Evens: TEXT;

PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN 
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(Ch)
    END;
END;

BEGIN
  ASSIGN(Odds,'Odds.dat');
  ASSIGN(Evens,'Evens.dat');
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF
  DO
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          READ(INPUT, Ch);
          IF Next = 'O'
          THEN
            BEGIN
              WRITE(Odds, Ch);
              Next := 'E'
            END
          ELSE
            BEGIN
              WRITE(Evens, Ch);
              Next := 'O'
            END;
        END;
      READLN
    END;
  WRITELN(Odds);
  WRITELN(Evens);
  RESET(Odds);
  CopyOut(Odds,Ch);
  RESET(Evens);
  CopyOut(Evens,Ch);
  WRITELN
END.


