PROGRAM Reverse(INPUT, OUTPUT);
VAR
  F1: TEXT;  
PROCEDURE Reverse(VAR INPUT: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(INPUT)
  THEN
    BEGIN
      READ(INPUT, Ch);
      Reverse(INPUT);
      WRITE(OUTPUT, Ch)
    END  
END;

BEGIN
  REWRITE(F1);
  READLN(F1);
  RESET(F1);
  Reverse(F1)
END.  
