PROGRAM Translation(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN

  IF NOT EOLN
  THEN
    READ(Ch);
    
  State := 'B';
  
  WHILE (State <> 'F') AND (NOT EOLN)
  DO
    BEGIN   
     
      {Iiene aoeau B}
      IF State = 'B'
      THEN
        BEGIN
          IF Ch = ' '
          THEN
            READ(Ch);
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
    
        {Iiene inoaaoeony aoea iia?aoi?a BEGIN e eo auaia}
        IF State = 'b'
        THEN
          BEGIN
            IF NOT EOLN
            THEN
              READ(Ch);
            IF (Ch = 'E') OR (Ch = 'G') OR (Ch = 'I')
            THEN
              WRITE(Ch);   
            IF Ch = 'N'
            THEN
              BEGIN
                WRITE(Ch);
                State := 'O'
              END;
            IF (Ch <> 'E') AND (Ch <> 'G') AND (Ch <> 'I') AND (Ch <> 'N')
            THEN
              State := 'F'         
          END;
        
        {Iiene ia?aie aoeau iia?aoi?ia}
        IF State = 'O'
        THEN
          BEGIN
            {READ(Ch);
            IF EOLN
            THEN
              State := 'F';
            IF (Ch = ' ') AND (NOT EOLN)
            THEN
              READ(Ch);}
            IF NOT EOLN
            THEN
              READ(Ch);  
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
              BEGIN
                WRITELN;
                WRITE('  ');
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
        
        {Auai? iia?aoi?a}
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
        
        {Auienuaaai ana neiaieu iia?aoi?a e neaao?uee ca iei ciae}  
        IF (State ='W') AND (NOT EOLN)        
        THEN
          BEGIN
            {READ(Ch);
            IF EOLN
            THEN
              State := 'F';}
            IF NOT EOLN 
            THEN
              READ(Ch);  
            IF (Ch = 'R') OR (Ch = 'I') OR (Ch = 'T') OR (Ch = 'E') OR (Ch = 'L') OR (Ch = 'N')
            THEN
              WRITE(Ch);
            IF (Ch <> 'R') AND (Ch <> 'I') AND (Ch <> 'T') AND (Ch <> 'E') AND (Ch <> 'L') AND (Ch <> 'N') 
            THEN
              State := 'F';

            IF Ch = 'E'
            THEN
              State := 'N'

          END;
          
          IF (State = 'N') AND (NOT EOLN)
          THEN
            BEGIN
              {READ(Ch);
              IF EOLN
              THEN
                State := 'F';}
                
              IF NOT EOLN
              THEN
                READ(Ch);
                  
              IF Ch = 'E'
              THEN
                BEGIN
                  WRITELN;
                  WRITE(Ch);
                  State := 'E'
                END;
                
              IF Ch = 'L'
              THEN
                WRITE(Ch);
               
              IF Ch = 'N'
              THEN
                BEGIN
                  WRITE(Ch);
                  State := 'A'
                END;  
                       
              IF (Ch = ' ')  
              THEN  
                BEGIN        
                  State := 'A'
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
            END;
         
         
          IF (State = 'A') AND (NOT EOLN)
          THEN
            BEGIN
                IF NOT EOLN
                THEN
                  READ(Ch);                
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
          
        {Auienuaaai ana neiaieu iia?aoi?a e neaao?uee ca iei ciae}  
        
        IF (State ='R') AND (NOT EOLN)        
        THEN
          BEGIN
            {READ(Ch);
            IF EOLN
            THEN
              State := 'F'; }
            IF NOT EOLN
            THEN
              READ(Ch);  
            IF (Ch = 'E') OR (Ch = 'A') OR (Ch = 'D') OR (Ch = 'L') OR (Ch = 'N')
            THEN
              WRITE(Ch);
            IF (Ch <> 'E') AND (Ch <> 'A') AND (Ch <> 'D') AND (Ch <> 'L') AND (Ch <> 'N')  
            THEN
              State := 'F';
              
            IF Ch = 'D'
            THEN
              State := 'Q' 
                              
            
          END;
         
        IF (State = 'Q') AND (NOT EOLN)
        THEN
          BEGIN
            {READ(Ch);
            IF EOLN
            THEN
              State := 'F';}
              
            IF NOT EOLN
            THEN
              READ(Ch);
                
            IF Ch = 'E'
            THEN
              BEGIN
                WRITELN;
                WRITE(Ch);
                State := 'E' 
              END;
              
            IF Ch = 'L'
            THEN
              WRITE(Ch); 
              
            IF Ch = 'N'
            THEN
              BEGIN
                WRITE(Ch);
                State := 'A'
              END;  
                   
               
              IF (Ch = ' ')  
              THEN  
                BEGIN        
                  State := 'A'
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
          END; 
         
          
        IF (State = '(') AND (NOT EOLN)
        THEN
          BEGIN
            {READ(Ch);
            IF EOLN
            THEN
              State := 'F';
            IF (Ch = ' ') AND (NOT EOLN)
            THEN
              READ(Ch);}
              
            IF NOT EOLN 
            THEN
              READ(Ch);  
              
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
            
            
            
        IF (State = ')') AND (NOT EOLN)
        THEN
          BEGIN 
             
            {READ(Ch);
            IF EOLN
            THEN
              State := 'F';
            IF (Ch = ' ') AND (NOT EOLN)
            THEN 
              READ(Ch);}
            
            IF NOT EOLN
            THEN
              READ(Ch);
                               
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
              
      IF (State = ';') AND (NOT EOLN)
      THEN  
        BEGIN
          {READ(Ch);
          IF EOLN
          THEN
            State := 'F';
          IF (Ch = ' ') AND (NOT EOLN)
          THEN
            READ(Ch);}
            
          IF NOT EOLN
          THEN
            READ(Ch); 
             
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
         
       IF (State = 'E') AND (NOT EOLN)
       THEN
         BEGIN 
           {READ(Ch);
           IF EOLN
           THEN
             State := 'F';}
           IF NOT EOLN
           THEN
             READ(Ch);  
           IF (Ch = 'N') OR (Ch = 'D')
           THEN
             WRITE(Ch);
           IF Ch = '.'
           THEN
             BEGIN
               WRITE(Ch);
               State := 'F'
             END;
           IF (Ch <> 'N') AND (Ch <> 'D') AND (Ch <> '.') AND (Ch <> ' ')
           THEN
             State := 'F'          
         END;
        
    END;
    WRITELN;
END.
 
 
 
