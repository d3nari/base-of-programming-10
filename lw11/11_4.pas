PROGRAM Reverse(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch)
      WRITE(F1, Ch)
    END;
  
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(F1, Ch);
      IF EOLN
      THEN
        WRITE(F2, Ch) 
    END; 
    
     
END.
