PROGRAM DeleteSpaces(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B'; //B - поиск первой буквы и удаление всех пробелов между S - пишет буквы P - при нахождении пробела смотрит, если следующий символ  - пробел, то удаляет все пробелы и ждет букву, если буква, то переходит в состояние S
  WHILE NOT EOF
  DO
    BEGIN
      READ(Ch);

      IF (State = 'B') AND (Ch <> ' ')
      THEN  
        State := 'S';

      IF State = 'S'
      THEN
        BEGIN
          IF Ch = ' '
          THEN
            BEGIN
              State := 'F'
            END
          ELSE
            BEGIN
              IF Ch IN ['.', ':', ';', ',']
              THEN
                State := 'P'
              ELSE
                WRITE(Ch) 
            END
        END;

      IF State = 'P'
      THEN
        BEGIN
          IF Ch IN ['.', ':', ';', ','] 
          THEN
            WRITE(Ch);
          IF (Ch <> ' ') AND NOT(Ch IN ['.', ':', ';', ','] )
          THEN
            BEGIN
              WRITE(' ');
              WRITE(Ch);
              State := 'S'
            END       
        END;
        
      IF State = 'F'
      THEN
        BEGIN
          IF (Ch <> ' ') AND (NOT EOLN) AND (NOT(Ch IN ['.', ':', ';', ','] ))
          THEN
            BEGIN
              WRITE(' ');
              WRITE(Ch);
              State := 'S'
            END;
          IF (NOT EOLN) AND (Ch IN ['.', ':', ';', ','] )
          THEN
            BEGIN
              WRITE(Ch);
              State := 'P'
            END
        END;        
      
      IF (EOLN) AND (NOT EOF)
      THEN
        BEGIN
          State := 'B';
          WRITELN(OUTPUT);
          READLN(INPUT)
        END
    END;
END.
