PROGRAM Translation(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
  F1: TEXT;
BEGIN
  {Запись строки в файл F1}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  
  RESET(F1);
  READ(F1,Ch);
    
  State := 'B';
  
  WHILE (State <> 'F') AND (NOT EOLN(F1))
  DO
    BEGIN   
     
      {Поиск буквы B}
      IF State = 'B'
      THEN
        BEGIN
          IF Ch = ' '
          THEN
            READ(F1,Ch);
          IF (Ch <> ' ') AND (Ch <> 'B')
          THEN
            State := 'F';
          IF Ch = 'B'
          THEN
            BEGIN
              WRITE(Ch);
              State := 'b'
            END;          
        END;
    
        {Поиск оставшихся букв оператора BEGIN и их вывод}
        IF State = 'b'
        THEN
          BEGIN
            READ(F1, Ch);
            IF (Ch = 'E') OR (Ch = 'G') OR (Ch = 'I')
            THEN
              WRITE(Ch);   
            IF Ch = 'N'
            THEN
              BEGIN
                WRITELN(Ch);
                WRITE('  ');
                State := 'O'
              END;
            IF (Ch <> 'E') AND (Ch <> 'G') AND (Ch <> 'I') AND (Ch <> 'N')
            THEN
              State := 'F'         
          END;
        
        {Поиск первой буквы операторов}
        IF State = 'O'
        THEN
          BEGIN
            READ(F1, Ch);
            IF Ch = ' '
            THEN
              READ(F1, Ch);
            IF (Ch = 'W') OR (Ch = 'R')
            THEN
              BEGIN
                WRITE(Ch);
                State := 'o'
              END;
            IF Ch = ';'
            THEN
              BEGIN
                WRITE(Ch);
                State := ';'
              END; 
            IF Ch = 'E'
            THEN
              BEGIN
                WRITELN;
                WRITE(Ch);
                State := 'E'
              END;     
            IF (Ch <> ' ') AND (Ch <> 'W') AND (Ch <> 'R') AND (Ch <> ';') AND (Ch <> 'E')
            THEN
              State := 'F'      
          END;
        
        {Выбор оператора}
        IF State = 'o'
        THEN
          BEGIN
            IF Ch = 'W'
            THEN
              State := 'W';
            IF Ch = 'R'
            THEN
              State := 'R'  
          END;
        
        {Выписываем все символы оператора и следующий за ним знак}  
        IF State ='W'        
        THEN
          BEGIN
            READ(F1, Ch);
            IF (Ch = 'R') OR (Ch = 'I') OR (Ch = 'T') OR (Ch = 'E') OR (Ch = 'L') OR (Ch = 'N') 
            THEN
              WRITE(Ch);
            IF (Ch <> 'R') AND (Ch <> 'I') AND (Ch <> 'T') AND (Ch <> 'E') AND (Ch <> 'L') AND (Ch <> 'N') 
            THEN
              State := 'F';

            IF Ch = 'E'
            THEN
              BEGIN
                READ(F1, Ch);
                IF Ch = 'E'
                THEN
                  BEGIN
                    WRITELN;
                    WRITE(Ch);
                    State := 'E' 
                  END;
                IF (Ch = ' ') OR (Ch = ';') OR (Ch = '(')
                THEN
                  State := 'A'
              END;
            
            IF Ch = 'L'
            THEN
              WRITE(Ch);
              
            IF Ch = 'N'
            THEN
              BEGIN
                State := 'A';
                READ(F1, Ch)
              END;                
          END;
          
          IF State = 'A'
          THEN
            BEGIN
                IF Ch = ' '
                THEN  
                  READ(F1, Ch);   
                IF Ch = 'E'
                THEN
                  BEGIN
                    WRITELN;
                    WRITE(Ch);
                    State := 'E' 
                  END;
                IF Ch = '('
                THEN
                  BEGIN      
                    WRITE(Ch);
                    State := '(' 
                  END;
                IF Ch = ';'
                THEN
                  BEGIN      
                    WRITE(Ch);
                    State := ';' 
                  END; 
                IF (Ch <> ' ') AND (Ch <> ';') AND (Ch <> '(') AND (Ch <> 'E')
                THEN
                  State := 'F'                 
            END;
          
        {Выписываем все символы оператора и следующий за ним знак}  
        IF State ='R'        
        THEN
          BEGIN
            READ(F1, Ch);
            IF (Ch = 'E') OR (Ch = 'A') OR (Ch = 'D') OR (Ch = 'L') OR (Ch = 'N')  
            THEN
              WRITE(Ch);
            IF (Ch <> 'E') AND (Ch <> 'A') AND (Ch <> 'D') AND (Ch <> 'L') AND (Ch <> 'N')  
            THEN
              State := 'F';
              
            IF Ch = 'D'
            THEN
              BEGIN
                READ(F1, Ch);
                IF Ch = 'E'
                THEN
                  BEGIN
                    WRITELN;
                    WRITE(Ch);
                    State := 'E' 
                  END;
                IF (Ch = ' ') OR (Ch = ';') OR (Ch = '(') 
                THEN
                  State := 'A'
              END;
              
            IF Ch = 'L'
            THEN
              WRITE(Ch);
                
            IF Ch = 'N'
            THEN
              BEGIN
                State := 'A';
                READ(F1, Ch)
              END;                    
          END;
          
        IF State = '('
        THEN
          BEGIN
            READ(F1, Ch);
            IF Ch = ' '
            THEN
              READ(F1, Ch);
            IF (Ch <> ',') AND (Ch <> ' ') AND (Ch <> ')')
            THEN
              WRITE(Ch); 
            IF Ch = ','
            THEN
              WRITE(Ch,' ');
            IF Ch = ')'
            THEN
              BEGIN
                WRITE(Ch);
                State := ')'
              END;     
          END;
            
            
            
        IF State = ')'
        THEN
          BEGIN    
            READ(F1, Ch);
            IF Ch = ' '
            THEN 
              READ(F1, Ch);                 
            IF Ch = ';'
            THEN
              BEGIN
                WRITE(Ch);
                State := ';' 
              END;                 
            IF Ch = 'E'
            THEN  
              BEGIN
                WRITELN;
                WRITE(Ch);
                State := 'E'
              END;    
            IF (Ch <> ' ') AND (Ch <> 'E') AND (Ch <> ';')
            THEN
              State := 'F'              
          END;
              
      IF State = ';'
      THEN  
        BEGIN
          READ(F1, Ch);
          IF Ch = ' '
          THEN
            READ(F1, Ch);
          IF (Ch = 'W') OR (Ch = 'R')
          THEN
            BEGIN
              WRITELN;
              WRITE('  ');
              WRITE(Ch);
              State := 'o'  
            END;
          IF Ch = ';'
          THEN 
            WRITE(Ch);
          IF Ch = 'E'
          THEN
            BEGIN
              WRITELN;
              WRITE(Ch);
              State := 'E'
            END;    
          IF (Ch <> ' ') AND (Ch <> 'W') AND (Ch <> 'R') AND (Ch <> 'E') AND (Ch <> ';')
          THEN
            State := 'F'                
        END;
         
       IF State = 'E'
       THEN
         BEGIN 
           READ(F1, Ch);
           IF (Ch = 'N') OR (Ch = 'D')
           THEN
             WRITE(Ch);
           IF Ch = '.'
           THEN
             BEGIN
               WRITE(Ch);
               State := 'F'
             END;
           IF (Ch <> 'N') AND (Ch <> 'D') AND (Ch <> '.')
           THEN
             State := 'F'          
         END;             
    END; 
END.
 
 
 
