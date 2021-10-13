PROGRAM SpaceFinder(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN 
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      
      IF State = 'S'
      THEN
        BEGIN
          IF Ch <> ' '
          THEN
            BEGIN
              WRITE(Ch);
              State := 'f'
            END
        END;
        
       IF State = 'f'
       THEN
         BEGIN       
    END;
  WRITELN('#')  
END.
