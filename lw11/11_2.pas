PROGRAM ReadLast(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  {IF NOT EOLN
  THEN 
    BEGIN
      WHILE NOT EOLN
      DO
        READ(Ch);
      WRITE(Ch)
    END; 
  WRITELN()}
  
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF EOLN
      THEN
        WRITE(Ch) 
    END;
  WRITELN            
END.  

