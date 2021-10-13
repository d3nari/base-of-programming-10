PROGRAM DeleteSpaces(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B';
  WHILE NOT EOF
  DO
    BEGIN
      READ(Ch);
      
      IF (State = 'B') AND NOT(Ch IN ['', ',', '.', ':', ';'])
      THEN
        State := 'S';
      
      IF State = 'S'
      THEN
        IF NOT(Ch IN ['', ',', '.', ':', ';'])
        THEN
          WRITE(Ch)
        ELSE
          BEGIN
            State := 'B';
            WRITELN 
          END;      
         
   
    END;
END.

